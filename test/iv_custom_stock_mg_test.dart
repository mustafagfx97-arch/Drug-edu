import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/iv_prep/data/iv_quick_drip_profiles.dart';
import 'package:drug_edu/features/iv_prep/domain/iv_quick_drip_stock_engine.dart';
import 'package:drug_edu/features/iv_prep/domain/iv_infusion_rate_engine.dart';
import 'package:drug_edu/features/iv_prep/presentation/iv_quick_drip_screen.dart';

void main() {
  test('Norepinephrine base 1mg/mL: operator chooses 8mg not hardcoded 4mg', () {
    final vial = quickDripOptionsFor('Norepinephrine').first;
    expect(vial.premix, isFalse);
    expect(vial.totalDrugMg, 4);
    expect(vial.stockMl, 4);

    final result = calculateIvQuickStock(
      product: vial, drugAmountMg: 8, fluidAddedMl: 242,
    )!;
    expect(result.stockMgPerMl, 1);
    expect(result.withdrawalMl, 8);
    expect(result.finalVolumeMl, 250);
    expect(result.finalMcgPerMl, 32);
    expect(result.amountDiffersFromReviewedExample, isTrue);
    expect(result.needsMoreThanReviewedPresentation, isTrue);

    final rate = calculateOrderedIvInfusion(
      prescribedRate: 8,
      rateUnit: IvOrderedRateUnit.mcgPerMin,
      finalMicrogramsPerMilliliter: result.finalMcgPerMl,
      weightKg: null,
    )!;
    expect(rate.millilitersPerHour, 15);
  });

  test('Dobutamine changes amount and vial withdrawal at fixed fluid amount', () {
    final vial = quickDripOptionsFor('Dobutamine').single;
    final standard = calculateIvQuickStock(
      product: vial, drugAmountMg: 250, fluidAddedMl: 480,
    )!;
    expect(standard.stockMgPerMl, 12.5);
    expect(standard.withdrawalMl, 20);
    expect(standard.finalVolumeMl, 500);
    expect(standard.finalMcgPerMl, 500);
    expect(standard.amountDiffersFromReviewedExample, isFalse);

    final custom = calculateIvQuickStock(
      product: vial, drugAmountMg: 125, fluidAddedMl: 480,
    )!;
    expect(custom.withdrawalMl, 10);
    expect(custom.finalVolumeMl, 490);
    expect(custom.finalMcgPerMl, closeTo(125000 / 490, 1e-8));
    expect(custom.amountDiffersFromReviewedExample, isTrue);
    expect(custom.needsMoreThanReviewedPresentation, isFalse);
  });

  test('input validation and premix cannot be treated as ampoule stock', () {
    final vial = quickDripOptionsFor('Norepinephrine').first;
    for (final invalid in [0.0, -1.0, double.nan, double.infinity]) {
      expect(calculateIvQuickStock(
        product: vial, drugAmountMg: invalid, fluidAddedMl: 100,
      ), isNull);
      expect(calculateIvQuickStock(
        product: vial, drugAmountMg: 4, fluidAddedMl: invalid,
      ), isNull);
    }
    expect(calculateIvQuickStock(
      product: vial, drugAmountMg: null, fluidAddedMl: 100,
    ), isNull);
    final ready = quickDripOptionsFor('Norepinephrine')
        .firstWhere((p) => p.premix);
    expect(calculateIvQuickStock(
      product: ready, drugAmountMg: 4, fluidAddedMl: 250,
    ), isNull);
  });

  testWidgets('Norepinephrine custom mg updates withdrawal, dilution and rate',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: IvQuickDripScreen(initialDrug: 'Norepinephrine'),
    ));
    expect(find.byKey(const ValueKey('quick-drip-stock-mg')),
        findsOneWidget);
    final amount = find.byKey(const ValueKey('quick-drip-stock-mg'));
    await tester.ensureVisible(amount);
    await tester.enterText(amount, '8');
    await tester.pump();
    expect(find.textContaining('withdraw 8 mL'), findsOneWidget);
    expect(find.byKey(const ValueKey('quick-drip-multiple-vials')),
        findsOneWidget);
    final fluid = find.byKey(const ValueKey('quick-drip-fluid-ml'));
    await tester.ensureVisible(fluid);
    await tester.enterText(fluid, '242');
    await tester.pumpAndSettle();
    expect(find.textContaining('FINAL 250 mL'), findsOneWidget);
    final rate = find.byKey(const ValueKey('quick-drip-rate'));
    await tester.ensureVisible(rate);
    expect(find.text('15 mL/hr'), findsOneWidget);
    expect(find.textContaining('YELLOW · Check dilution'), findsOneWidget);
  });

  testWidgets('invalid total mg hides pump result; changing mg recalculates',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: IvQuickDripScreen(initialDrug: 'Dobutamine'),
    ));
    final weight = find.byKey(const ValueKey('quick-drip-weight'));
    await tester.ensureVisible(weight);
    await tester.enterText(weight, '75');
    final dose = find.byKey(const ValueKey('quick-drip-dose'));
    await tester.ensureVisible(dose);
    await tester.enterText(dose, '5');
    final rate = find.byKey(const ValueKey('quick-drip-rate'));
    await tester.ensureVisible(rate);
    expect(find.text('45 mL/hr'), findsOneWidget);
    final mg = find.byKey(const ValueKey('quick-drip-stock-mg'));
    await tester.ensureVisible(mg);
    await tester.enterText(mg, '125');
    await tester.pumpAndSettle();
    await tester.ensureVisible(rate);
    expect(find.text('45 mL/hr'), findsNothing);
    expect(find.textContaining('YELLOW · Check dilution'), findsOneWidget);
    await tester.ensureVisible(mg);
    await tester.enterText(mg, '0');
    await tester.pumpAndSettle();
    await tester.ensureVisible(rate);
    expect(find.text('— mL/hr'), findsOneWidget);
  });

  testWidgets('ready-to-use premix keeps mg and fluid fields locked',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: IvQuickDripScreen(initialDrug: 'Clevidipine'),
    ));
    expect(find.byKey(const ValueKey('quick-drip-stock-mg')), findsNothing);
    expect(find.byKey(const ValueKey('quick-drip-fluid-ml')), findsNothing);
  });
}
