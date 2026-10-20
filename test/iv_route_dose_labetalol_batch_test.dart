import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/calculators/domain/iv_labetalol_route_engine.dart';
import 'package:drug_edu/features/iv_prep/data/iv_adult_dose_regimens.dart';
import 'package:drug_edu/features/iv_prep/data/iv_fluid_evidence.dart';
import 'package:drug_edu/features/calculators/presentation/iv_dilution_calculator_screen.dart';

void main() {
  test('Labetalol label distinguishes initial, repeat and infusion', () {
    final r = reviewedAdultIvDoseRegimens(
      name: 'Labetalol', population: 'General',
    );
    expect(r, hasLength(3));
    expect(r[0].method, IvAdministrationMethod.slowInjection);
    expect(r[0].doseDirections, contains('20 mg'));
    expect(r[0].doseDirections, contains('2 minutes'));
    expect(r[1].method, IvAdministrationMethod.slowInjection);
    expect(r[1].doseDirections, contains('40 mg OR 80 mg'));
    expect(r[1].doseDirections, contains('300 mg'));
    expect(r[2].method, IvAdministrationMethod.continuousInfusion);
    expect(r[2].doseDirections, contains('2 mg/min'));
    expect(r[2].sourceUrl, contains('dailymed.nlm.nih.gov'));
    expect(r[0].safety, contains('asthma'));
  });

  test('No pediatric / unreviewed regimen is silently generated', () {
    for (final name in ['Labetalol', 'Nicardipine', 'Esmolol']) {
      expect(reviewedAdultIvDoseRegimens(
        name: name, population: 'NICU',
      ), isEmpty);
      expect(reviewedAdultIvDoseRegimens(
        name: name, population: 'PICU',
      ), isEmpty);
    }
    expect(reviewedAdultIvDoseRegimens(
      name: 'Vancomycin', population: 'General',
    ), isEmpty);
  });

  test('Adult route-specific sources exist only for verified set', () {
    for (final name in [
      'Labetalol', 'Nicardipine', 'Clevidipine',
      'Esmolol', 'Nitroglycerin',
    ]) {
      final r = reviewedAdultIvDoseRegimens(
        name: name, population: 'General',
      );
      expect(r, isNotEmpty);
      for (final item in r) {
        expect(item.doseDirections, isNotEmpty);
        expect(item.monitoring, isNotEmpty);
        expect(item.safety, isNotEmpty);
        expect(item.sourceUrl, contains('dailymed.nlm.nih.gov'));
      }
    }
    expect(reviewedAdultIvDoseRegimens(
      name: 'Nicardipine', population: 'General',
    ).any((e) => e.method == IvAdministrationMethod.slowInjection), isFalse);
    expect(reviewedAdultIvDoseRegimens(
      name: 'Clevidipine', population: 'General',
    ).any((e) => e.method == IvAdministrationMethod.slowInjection), isFalse);
    expect(reviewedAdultIvDoseRegimens(
      name: 'Nitroglycerin', population: 'General',
    ).any((e) => e.method == IvAdministrationMethod.slowInjection), isFalse);
  });

  test('Initial slow IV injection: 20 mg at 5 mg/mL = 4 mL', () {
    final result = calculateOrderedLabetalolInjection(
      vialAmountMg: 100, vialVolumeMl: 20,
      prescribedDoseMg: 20, previousCumulativeMg: 0,
      stage: LabetalolInjectionStage.initial,
    )!;
    expect(result.withdrawalMl, 4);
    expect(result.cumulativeMg, 20);
  });

  test('Subsequent slow IV injection 40 or 80 mg; 300 mg cumulative', () {
    final result = calculateOrderedLabetalolInjection(
      vialAmountMg: 100, vialVolumeMl: 20,
      prescribedDoseMg: 80, previousCumulativeMg: 180,
      stage: LabetalolInjectionStage.additional,
    )!;
    expect(result.withdrawalMl, 16);
    expect(result.cumulativeMg, 260);
    expect(calculateOrderedLabetalolInjection(
      vialAmountMg: 100, vialVolumeMl: 20,
      prescribedDoseMg: 80, previousCumulativeMg: 240,
      stage: LabetalolInjectionStage.additional,
    ), isNull);
    expect(calculateOrderedLabetalolInjection(
      vialAmountMg: 100, vialVolumeMl: 20,
      prescribedDoseMg: 40, previousCumulativeMg: 20,
      stage: LabetalolInjectionStage.additional,
    )!.withdrawalMl, 8);
  });

  test('Bolus route rejects invalid stage, wrong vial, wrong or excessive dose', () {
    for (final bad in [0.0, -1.0, double.nan, double.infinity]) {
      expect(calculateOrderedLabetalolInjection(
        vialAmountMg: 100, vialVolumeMl: 20,
        prescribedDoseMg: bad, previousCumulativeMg: 0,
        stage: LabetalolInjectionStage.initial,
      ), isNull);
    }
    for (final bad in [-1.0, double.nan, double.infinity]) {
      expect(calculateOrderedLabetalolInjection(
        vialAmountMg: 100, vialVolumeMl: 20,
        prescribedDoseMg: 20, previousCumulativeMg: bad,
        stage: LabetalolInjectionStage.initial,
      ), isNull);
    }
    expect(calculateOrderedLabetalolInjection(
      vialAmountMg: 100, vialVolumeMl: 10,
      prescribedDoseMg: 20, previousCumulativeMg: 0,
      stage: LabetalolInjectionStage.initial,
    ), isNull);
    expect(calculateOrderedLabetalolInjection(
      vialAmountMg: 100, vialVolumeMl: 20,
      prescribedDoseMg: 80, previousCumulativeMg: 0,
      stage: LabetalolInjectionStage.initial,
    ), isNull);
    expect(calculateOrderedLabetalolInjection(
      vialAmountMg: 100, vialVolumeMl: 20,
      prescribedDoseMg: 20, previousCumulativeMg: 20,
      stage: LabetalolInjectionStage.additional,
    ), isNull);
  });

  test('Labetalol infusion matches exactly 200mg + 160mL = 200mL', () {
    expect(matchesLabetalolLabelInfusion(
      stockConcentrationMgPerMl: 5,
      selectedAmountMg: 200,
      withdrawnMl: 40,
      addedDiluentMl: 160,
      finalVolumeMl: 200,
    ), isTrue);
    expect(matchesLabetalolLabelInfusion(
      stockConcentrationMgPerMl: 5,
      selectedAmountMg: 200,
      withdrawnMl: 40,
      addedDiluentMl: 250,
      finalVolumeMl: 290,
    ), isFalse);
    expect(labetalolOrderedInfusionMlPerHour(
      prescribedMgPerMinute: 2,
      verifiedFinalMgPerMl: 1,
    ), 120);
    for (final invalid in [0.0, -1.0, double.nan, double.infinity]) {
      expect(labetalolOrderedInfusionMlPerHour(
        prescribedMgPerMinute: invalid,
        verifiedFinalMgPerMl: 1,
      ), isNull);
    }
  });

  test('second labetalol label example: 40 mL stock + 250 mL IV fluid', () {
    final second = classifyLabetalolInfusionRecipe(
      stockConcentrationMgPerMl: 5,
      selectedAmountMg: 200,
      withdrawnMl: 40,
      addedDiluentMl: 250,
      finalVolumeMl: 290,
    );
    expect(second, LabetalolInfusionRecipeStatus.labelAdded250Ml);
    expect(matchesLabetalolSecondLabelInfusion(
      stockConcentrationMgPerMl: 5,
      selectedAmountMg: 200,
      withdrawnMl: 40,
      addedDiluentMl: 250,
      finalVolumeMl: 290,
    ), isTrue);
    expect(200 / 290, closeTo(0.6896551724, 0.0000001));
    final orderedRate = labetalolOrderedInfusionMlPerHour(
      prescribedMgPerMinute: 2,
      verifiedFinalMgPerMl: 200 / 290,
    );
    expect(orderedRate, closeTo(174, 0.000001));
    // Label's illustrative 3mL/min = 180mL/hr would actually deliver
    // ~2.069 mg/min at exact 200mg/290mL; it is rounded in the label.
    expect((180 / 60) * (200 / 290), closeTo(2.0689655, 0.000001));
  });

  test('label examples require exact vial and added vs final volume', () {
    expect(classifyLabetalolInfusionRecipe(
      stockConcentrationMgPerMl: 5,
      selectedAmountMg: 200,
      withdrawnMl: 40,
      addedDiluentMl: 160,
      finalVolumeMl: 200,
    ), LabetalolInfusionRecipeStatus.labelFinal200Ml);
    // 250 mL here means ADDED fluid, not FINAL volume.
    expect(classifyLabetalolInfusionRecipe(
      stockConcentrationMgPerMl: 5,
      selectedAmountMg: 200,
      withdrawnMl: 40,
      addedDiluentMl: 210,
      finalVolumeMl: 250,
    ), LabetalolInfusionRecipeStatus.localProtocolOnly);
    expect(classifyLabetalolInfusionRecipe(
      stockConcentrationMgPerMl: 5,
      selectedAmountMg: 100,
      withdrawnMl: 20,
      addedDiluentMl: 100,
      finalVolumeMl: 120,
    ), LabetalolInfusionRecipeStatus.localProtocolOnly);
    for (final wrongStrength in [0.0, -5.0, double.nan, double.infinity]) {
      expect(classifyLabetalolInfusionRecipe(
        stockConcentrationMgPerMl: wrongStrength,
        selectedAmountMg: 200,
        withdrawnMl: 40,
        addedDiluentMl: 250,
        finalVolumeMl: 290,
      ), LabetalolInfusionRecipeStatus.localProtocolOnly);
    }
  });

  test('Nonstandard concentration: rate math requires local verification', () {
    // Screenshot scenario: 100 mg at 5 mg/mL + 100 mL NS = 120 mL final.
    // Actual concentration 5/6 mg/mL, different from labelled 1 mg/mL.
    const actualConcentration = 100 / 120;
    expect(calculateLocallyVerifiedLabetalolRateMathOnly(
      prescribedMgPerMinute: 2,
      calculatedFinalMgPerMl: actualConcentration,
      localPreparationVerified: false,
    ), isNull);
    expect(calculateLocallyVerifiedLabetalolRateMathOnly(
      prescribedMgPerMinute: 2,
      calculatedFinalMgPerMl: actualConcentration,
      localPreparationVerified: true,
    ), closeTo(144, 0.000001));
    // The mathematical conversion does not itself certify this formulation.
    expect(matchesLabetalolLabelInfusion(
      stockConcentrationMgPerMl: 5,
      selectedAmountMg: 100,
      withdrawnMl: 20,
      addedDiluentMl: 100,
      finalVolumeMl: 120,
    ), isFalse);
    for (final bad in [0.0, -1.0, double.infinity, double.nan]) {
      expect(calculateLocallyVerifiedLabetalolRateMathOnly(
        prescribedMgPerMinute: bad,
        calculatedFinalMgPerMl: actualConcentration,
        localPreparationVerified: true,
      ), isNull);
      expect(calculateLocallyVerifiedLabetalolRateMathOnly(
        prescribedMgPerMinute: 2,
        calculatedFinalMgPerMl: bad,
        localPreparationVerified: true,
      ), isNull);
    }
  });

  test('Labetalol fluid: NS/D5 supported, bicarbonate incompatible', () {
    for (final fluid in [IvFluid.normalSaline, IvFluid.dextrose5]) {
      expect(reviewedIvFluidEvidence(
        name: 'Labetalol', population: 'General', fluid: fluid,
      ).status, IvFluidEvidenceStatus.verifiedDiluent);
    }
    expect(reviewedIvFluidEvidence(
      name: 'Labetalol', population: 'General',
      fluid: IvFluid.sodiumBicarbonate5,
    ).status, IvFluidEvidenceStatus.incompatibleDiluent);
  });

  testWidgets('Labetalol calculator shows adult method chooser', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: IvDilutionCalculatorScreen(),
    ));
    await tester.pump();
    expect(find.text('IV Dilution Calculator'), findsOneWidget);
    expect(find.byType(DropdownButtonFormField<int>), findsWidgets);
  });
}
