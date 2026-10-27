import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/iv_prep/data/iv_quick_drip_profiles.dart';
import 'package:drug_edu/features/iv_prep/domain/iv_dilution_safety_engine.dart';
import 'package:drug_edu/features/iv_prep/domain/iv_infusion_rate_engine.dart';
import 'package:drug_edu/features/iv_prep/presentation/iv_quick_drip_screen.dart';

void main() {
  test('quick presets have adult-drip coverage and verified references', () {
    final names = ivQuickDripProfiles.map((x) => x.drug).toSet();
    expect(names, hasLength(12));
    expect(quickDripOptionsFor('Dobutamine'), hasLength(1));
    expect(quickDripOptionsFor('Norepinephrine'), hasLength(3));
    expect(quickDripOptionsFor('Dopamine'), hasLength(2));
    expect(ivQuickDripProfiles.map((p) => p.id).toSet().length,
        ivQuickDripProfiles.length);
    for (final p in ivQuickDripProfiles) {
      expect(p.sourceUrl.startsWith('https://'), isTrue, reason: p.id);
      expect(p.step, greaterThan(0), reason: p.id);
      if (p.premix) {
        expect(p.readyFinalMcgPerMl, greaterThan(0), reason: p.id);
        expect(p.stockMl, 0);
        expect(p.defaultAddedFluidMl, 0);
      } else {
        expect(p.stockMl, greaterThan(0), reason: p.id);
        expect(p.totalDrugMg, greaterThan(0), reason: p.id);
        expect(p.defaultAddedFluidMl, greaterThan(0), reason: p.id);
      }
    }
  });

  test('fluid added is NOT final volume for a 250 mg/20 mL dobutamine vial', () {
    final p = quickDripOptionsFor('Dobutamine').single;
    expect(p.stockMl, 20);
    expect(p.finalMl(480), 500);
    expect(p.finalMcgMl(480), 500);
    expect(p.finalMl(500), 520);
    expect(p.finalMcgMl(500), closeTo(250000 / 520, 1e-7));
    final green = assessAdultIvDilution(
      drug: p.drug, drugMg: p.totalDrugMg, actualFinalMl: p.finalMl(480),
      fluid: IvDiluent.normalSaline, line: IvLineType.peripheral,
      productAndProtocolVerified: true,
      lightProtectionVerified: false, lowSorptionSetVerified: false,
    );
    expect(green.light, IvDilutionLight.green);
    final result = calculateOrderedIvInfusion(
      prescribedRate: 5, rateUnit: p.doseUnit,
      finalMicrogramsPerMilliliter: p.finalMcgMl(480), weightKg: 75,
    );
    expect(result!.millilitersPerHour, 45);
  });

  test('reference starts are product-specific; labetalol not autoprescribed', () {
    expect(quickDripOptionsFor('Dobutamine').first.initialReference, 0.5);
    expect(quickDripOptionsFor('Dopamine').first.initialReference, 2);
    expect(quickDripOptionsFor('Nitroglycerin').first.initialReference, 5);
    expect(quickDripOptionsFor('Dexmedetomidine').first.initialReference, 0.2);
    expect(quickDripOptionsFor('Labetalol').first.initialReference, isNull);
    expect(quickDripOptionsFor('Norepinephrine').first.doseUnit,
        IvOrderedRateUnit.mcgPerMin);
  });

  testWidgets('simple UI: Dobutamine stock, dose plus, green, red and rate',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: IvQuickDripScreen(initialDrug: 'Dobutamine'),
    ));
    expect(find.byKey(const ValueKey('quick-drip-screen')), findsOneWidget);
    expect(find.text('250 mg / 20 mL (12.5 mg/mL)'), findsOneWidget);
    expect(find.byKey(const ValueKey('unified-protocol-reference')),
        findsNothing);
    expect(find.byKey(const ValueKey('unified-confirm-order')), findsNothing);
    final wt = find.byKey(const ValueKey('quick-drip-weight'));
    await tester.ensureVisible(wt);
    await tester.enterText(wt, '75');
    await tester.pump();
    expect(find.text('0.5'), findsWidgets);
    final plus = find.byKey(const ValueKey('quick-drip-plus'));
    await tester.ensureVisible(plus);
    await tester.tap(plus);
    await tester.pump();
    expect(find.text('1'), findsWidgets);
    final dose = find.byKey(const ValueKey('quick-drip-dose'));
    await tester.ensureVisible(dose);
    await tester.enterText(dose, '5');
    await tester.pumpAndSettle();
    final result = find.byKey(const ValueKey('quick-drip-rate'));
    await tester.ensureVisible(result);
    expect(find.text('45 mL/hr'), findsOneWidget);
    expect(find.textContaining('GREEN · Reviewed dilution'), findsOneWidget);
    final fluid = find.byKey(const ValueKey('quick-drip-fluid-ml'));
    await tester.ensureVisible(fluid);
    await tester.enterText(fluid, '20');
    await tester.pumpAndSettle();
    await tester.ensureVisible(result);
    expect(find.text('— mL/hr'), findsOneWidget);
    expect(find.textContaining('RED · Stop'), findsOneWidget);
  });

  testWidgets('added 500 mL fluid yields final 520 mL and caution not 500',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: IvQuickDripScreen(initialDrug: 'Dobutamine'),
    ));
    final fluid = find.byKey(const ValueKey('quick-drip-fluid-ml'));
    await tester.ensureVisible(fluid);
    await tester.enterText(fluid, '500');
    await tester.pumpAndSettle();
    expect(find.textContaining('FINAL 520 mL'), findsOneWidget);
    expect(find.textContaining('YELLOW · Check dilution'), findsOneWidget);
  });

  testWidgets('factory premix hides fluid entry and still calculates',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: IvQuickDripScreen(initialDrug: 'Clevidipine'),
    ));
    expect(find.byKey(const ValueKey('quick-drip-fluid-ml')), findsNothing);
    expect(find.byKey(const ValueKey('quick-drip-ready-no-diluent')),
        findsOneWidget);
    expect(find.text('1 mg / 2 mL'), findsNothing);
    expect(find.textContaining('GREEN · Reviewed dilution'), findsOneWidget);
  });

  testWidgets('reference detail remains behind Advanced action',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: IvQuickDripScreen(initialDrug: 'Dobutamine'),
    ));
    await tester.tap(find.byKey(const ValueKey('quick-drip-advanced')));
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('unified-infusion-screen')),
        findsOneWidget);
  });
}
