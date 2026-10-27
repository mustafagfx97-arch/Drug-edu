import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:drug_edu/features/iv_prep/data/iv_norepinephrine_workflow.dart';
import 'package:drug_edu/features/iv_prep/domain/iv_infusion_rate_engine.dart';
import 'package:drug_edu/features/iv_prep/presentation/iv_dose_time_quick_panel.dart';
import 'package:drug_edu/features/iv_prep/presentation/iv_norepinephrine_workflow_panel.dart';

void main() {
  NorepinephrineReviewedPresentation product(String id) =>
      reviewedAdultNorepinephrinePresentations
          .firstWhere((p) => p.id == id);

  test('manufacturer concentrate and premixes are different products', () {
    final concentrate = product('concentrate-base4mg-4ml-d5-1000');
    expect(concentrate.readyToUse, isFalse);
    expect(concentrate.stockWithdrawalMl, 4);
    expect(concentrate.nominalFinalMcgPerMl, 4);
    expect(concentrate.preparation, contains('1,004 mL'));
    expect(concentrate.safety, contains('saline ALONE'));
    for (final id in [
      'baxter-premix-4mg-250ml',
      'baxter-premix-8mg-250ml',
      'baxter-premix-16mg-250ml',
    ]) {
      expect(product(id).readyToUse, isTrue);
      expect(product(id).stockWithdrawalMl, 0);
    }
    expect(product('baxter-premix-4mg-250ml').nominalFinalMcgPerMl, 16);
    expect(product('baxter-premix-8mg-250ml').nominalFinalMcgPerMl, 32);
    expect(product('baxter-premix-16mg-250ml').nominalFinalMcgPerMl, 64);
    expect(findReviewedNorepinephrinePresentation('unknown'), isNull);
  });

  test('70kg 0.05mcg/kg/min: 16mcg/mL gives 13.125mL/hr', () {
    final result = orderedNorepinephrinePumpRate(
      product: product('baxter-premix-4mg-250ml'),
      prescribedRate: 0.05,
      rateUnit: IvOrderedRateUnit.mcgPerKgMin,
      weightKg: 70,
      productConfirmed: true,
      orderConfirmed: true,
    )!;
    expect(result.microgramsPerHour, closeTo(210, 1e-9));
    expect(result.millilitersPerHour, closeTo(13.125, 1e-9));
    final dilute = orderedNorepinephrinePumpRate(
      product: product('concentrate-base4mg-4ml-d5-1000'),
      prescribedRate: 0.05,
      rateUnit: IvOrderedRateUnit.mcgPerKgMin,
      weightKg: 70,
      productConfirmed: true,
      orderConfirmed: true,
    )!;
    expect(dilute.millilitersPerHour, 52.5);
  });

  test('fixed mcg/min does not require weight and keeps units', () {
    final result = orderedNorepinephrinePumpRate(
      product: product('baxter-premix-8mg-250ml'),
      prescribedRate: 10,
      rateUnit: IvOrderedRateUnit.mcgPerMin,
      weightKg: null,
      productConfirmed: true,
      orderConfirmed: true,
    )!;
    expect(result.microgramsPerHour, 600);
    expect(result.millilitersPerHour, 18.75);
  });

  test('wrong unit, unknown concentration, unconfirmed or invalid blocked', () {
    final p = product('baxter-premix-4mg-250ml');
    IvInfusionRateResult? pump({
      NorepinephrineReviewedPresentation? vial,
      double? rate = 0.05,
      double? kg = 70,
      IvOrderedRateUnit unit = IvOrderedRateUnit.mcgPerKgMin,
      bool productVerified = true,
      bool orderVerified = true,
    }) => orderedNorepinephrinePumpRate(
      product: vial ?? p,
      prescribedRate: rate,
      weightKg: kg,
      rateUnit: unit,
      productConfirmed: productVerified,
      orderConfirmed: orderVerified,
    );
    expect(pump(productVerified: false), isNull);
    expect(pump(orderVerified: false), isNull);
    expect(pump(rate: null), isNull);
    expect(pump(rate: -1), isNull);
    expect(pump(rate: double.nan), isNull);
    expect(pump(rate: double.infinity), isNull);
    expect(pump(kg: null), isNull);
    expect(pump(kg: 0), isNull);
    expect(pump(unit: IvOrderedRateUnit.mgPerKgHour), isNull);
    expect(orderedNorepinephrinePumpRate(
      product: null, prescribedRate: 0.05,
      rateUnit: IvOrderedRateUnit.mcgPerKgMin,
      weightKg: 70, productConfirmed: true, orderConfirmed: true,
    ), isNull);
  });

  testWidgets('General norepinephrine opens special path not generic math',
      (tester) async {
    final p = ivPreparationProfiles.firstWhere(
      (p) => p.name == 'Norepinephrine' && p.population == 'General',
    );
    await tester.pumpWidget(MaterialApp(home: Scaffold(
      body: SingleChildScrollView(
        child: IvDoseTimeQuickPanel(
          profile: p, onOpenFullCalculator: () {},
        ),
      ),
    )));
    expect(find.byType(IvNorepinephrineWorkflowPanel), findsOneWidget);
    expect(find.byKey(const ValueKey('norepi-pump-result')), findsNothing);
    expect(find.byKey(const ValueKey('iv-quick-ordered-dose')), findsNothing);
    await tester.ensureVisible(find.byKey(const ValueKey('norepi-prep-only-mode')));
    await tester.tap(find.byKey(const ValueKey('norepi-prep-only-mode')));
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('norepi-ordered-rate')), findsNothing);
    final picker = find.byKey(const ValueKey('norepi-product-choice'));
    await tester.ensureVisible(picker);
    await tester.tap(picker);
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('Baxter READY TO USE · 4 mg').last);
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('norepi-premix-no-dilution')),
        findsOneWidget);
    expect(find.byKey(const ValueKey('norepi-pump-result')), findsNothing);
  });

  testWidgets('norepinephrine pump result gated by two confirmations',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(
      body: SingleChildScrollView(
        child: IvNorepinephrineWorkflowPanel(onOpenFullCalculator: () {}),
      ),
    )));
    final picker = find.byKey(const ValueKey('norepi-product-choice'));
    await tester.ensureVisible(picker);
    await tester.tap(picker);
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('Baxter READY TO USE · 4 mg').last);
    await tester.pumpAndSettle();
    final wt = find.byKey(const ValueKey('norepi-weight-kg'));
    await tester.ensureVisible(wt);
    await tester.enterText(wt, '70');
    final rate = find.byKey(const ValueKey('norepi-ordered-rate'));
    await tester.ensureVisible(rate);
    await tester.enterText(rate, '0.05');
    await tester.pump();
    expect(find.byKey(const ValueKey('norepi-pump-result')), findsNothing);
    final confirmedProduct = find.byKey(const ValueKey('norepi-confirm-product'));
    await tester.ensureVisible(confirmedProduct);
    await tester.tap(confirmedProduct);
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('norepi-pump-result')), findsNothing);
    final confirmedOrder = find.byKey(const ValueKey('norepi-confirm-order'));
    await tester.ensureVisible(confirmedOrder);
    await tester.tap(confirmedOrder);
    await tester.pumpAndSettle();
    expect(find.text('13.125 mL/hr'), findsOneWidget);
    await tester.ensureVisible(rate);
    await tester.enterText(rate, '0.1');
    await tester.pump();
    expect(find.byKey(const ValueKey('norepi-pump-result')), findsNothing);
  });
}
