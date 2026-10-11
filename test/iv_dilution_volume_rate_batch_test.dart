import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/calculators/domain/iv_dilution_calculator_engine.dart';
import 'package:drug_edu/features/calculators/presentation/iv_dilution_calculator_screen.dart';
import 'package:drug_edu/features/iv_prep/data/iv_fluid_evidence.dart';

void main() {
  IvDilutionResult? dilution({
    double vialAmount = 25,
    double vialMl = 10,
    double ordered = 25,
    double stock = 2.5,
    double fluid = 240,
    IvVolumeEntryMode mode = IvVolumeEntryMode.addFluidToDrug,
  }) =>
      calculateVerifiedIvDilution(
        ampouleAmount: vialAmount,
        ampouleVolumeMl: vialMl,
        orderedTotalAmount: ordered,
        verifiedStrengthPerMl: stock,
        volumeMl: fluid,
        volumeMode: mode,
      );

  test('CARDENE vial 25 mg/10 mL + 240 mL yields 250 mL, 0.1 mg/mL', () {
    final result = dilution()!;
    expect(result.stockStrengthPerMl, 2.5);
    expect(result.withdrawalMl, 10);
    expect(result.addedFluidMl, 240);
    expect(result.finalVolumeMl, 250);
    expect(result.finalStrengthPerMl, 0.1);
    expect(result.minimumContainerCount, 1);
    expect(matchesCardeneIvLabelRecipe(
      ampouleAmountMg: 25, ampouleVolumeMl: 10,
      orderedAmountMg: 25,
      addedFluidMl: result.addedFluidMl,
      finalVolumeMl: result.finalVolumeMl,
    ), isTrue);
    expect(calculateOrderedDurationPumpRate(
      finalVolumeMl: 250, orderedDurationMinutes: 60,
    ), 250);
  });

  test('CARDENE total volume mode also yields exact 240 mL added', () {
    final result = dilution(
      fluid: 250, mode: IvVolumeEntryMode.finalVolumeTarget,
    )!;
    expect(result.withdrawalMl, 10);
    expect(result.addedFluidMl, 240);
    expect(result.finalVolumeMl, 250);
    expect(result.finalStrengthPerMl, 0.1);
  });

  test('added carrier differs from q.s. final volume', () {
    final added = dilution(
      vialAmount: 500, vialMl: 10, ordered: 500,
      stock: 50, fluid: 100,
    )!;
    final target = dilution(
      vialAmount: 500, vialMl: 10, ordered: 500,
      stock: 50, fluid: 100,
      mode: IvVolumeEntryMode.finalVolumeTarget,
    )!;
    expect(added.withdrawalMl, 10);
    expect(added.addedFluidMl, 100);
    expect(added.finalVolumeMl, 110);
    expect(added.finalStrengthPerMl, closeTo(500 / 110, 0.00000001));
    expect(target.addedFluidMl, 90);
    expect(target.finalVolumeMl, 100);
    expect(target.finalStrengthPerMl, 5);
  });

  test('partial or multiple vials calculate withdrawal and minimum count', () {
    expect(dilution(
      vialAmount: 25, vialMl: 10, ordered: 5, fluid: 100,
    )!.minimumContainerCount, 1);
    final multi = dilution(
      vialAmount: 25, vialMl: 10, ordered: 70, fluid: 200,
    )!;
    expect(multi.withdrawalMl, 28);
    expect(multi.minimumContainerCount, 3);
    expect(multi.finalVolumeMl, 228);
  });

  test('mismatched user vial strength refuses to generate any result', () {
    expect(dilution(vialAmount: 25, vialMl: 5), isNull);
    expect(dilution(vialAmount: 20), isNull);
    expect(dilution(stock: 20), isNull);
  });

  test('cannot prescribe a final volume smaller than withdrawal', () {
    expect(dilution(
      fluid: 9, mode: IvVolumeEntryMode.finalVolumeTarget,
    ), isNull);
    expect(dilution(
      fluid: 10, mode: IvVolumeEntryMode.finalVolumeTarget,
    )!.addedFluidMl, 0);
  });

  test('never returns invalid figures for zero, negatives, nonfinite', () {
    for (final invalid in [
      0.0, -1.0, double.nan, double.infinity,
    ]) {
      expect(dilution(vialAmount: invalid), isNull);
      expect(dilution(vialMl: invalid), isNull);
      expect(dilution(ordered: invalid), isNull);
      expect(dilution(stock: invalid), isNull);
      expect(dilution(fluid: invalid), isNull);
      expect(calculateOrderedDurationPumpRate(
        finalVolumeMl: invalid, orderedDurationMinutes: 60,
      ), isNull);
      expect(calculateOrderedDurationPumpRate(
        finalVolumeMl: 250, orderedDurationMinutes: invalid,
      ), isNull);
    }
    expect(dilution(
      vialAmount: 1, vialMl: 1,
      stock: 1, ordered: double.maxFinite,
      fluid: double.maxFinite,
    ), isNull);
  });

  test('rate math does not invent time and accepts only prescribed positive', () {
    expect(calculateOrderedDurationPumpRate(
      finalVolumeMl: 100, orderedDurationMinutes: 30,
    ), 200);
    expect(calculateOrderedDurationPumpRate(
      finalVolumeMl: 250, orderedDurationMinutes: 0,
    ), isNull);
    expect(matchesExactLabelledFinalStrength(
      calculatedPerMl: 100, expectedPerMl: 100,
    ), isTrue);
    expect(matchesExactLabelledFinalStrength(
      calculatedPerMl: 200, expectedPerMl: 100,
    ), isFalse);
    expect(matchesCardeneIvLabelRecipe(
      ampouleAmountMg: 25, ampouleVolumeMl: 10,
      orderedAmountMg: 20, addedFluidMl: 240, finalVolumeMl: 250,
    ), isFalse);
  });

  test('IV fluid evidence distinguishes official fluids from unknown fluids', () {
    for (final f in [
      IvFluid.normalSaline, IvFluid.halfNormalSaline,
      IvFluid.dextrose5, IvFluid.dextrose5NormalSaline,
      IvFluid.dextrose5HalfNormalSaline,
    ]) {
      expect(reviewedIvFluidEvidence(
        name: 'Nicardipine', population: 'General', fluid: f,
      ).status, IvFluidEvidenceStatus.verifiedDiluent);
    }
    for (final f in [IvFluid.dextrose10, IvFluid.sterileWaterForInjection]) {
      expect(reviewedIvFluidEvidence(
        name: 'Nicardipine', population: 'General', fluid: f,
      ).status, IvFluidEvidenceStatus.unknown);
    }
    expect(reviewedIvFluidEvidence(
      name: 'Nitroglycerin', population: 'General',
      fluid: IvFluid.normalSaline,
    ).status, IvFluidEvidenceStatus.verifiedDiluent);
    expect(reviewedIvFluidEvidence(
      name: 'Nitroglycerin', population: 'General',
      fluid: IvFluid.lactatedRingers,
    ).status, IvFluidEvidenceStatus.unknown);
    expect(reviewedIvFluidEvidence(
      name: 'Clevidipine', population: 'General',
      fluid: IvFluid.sterileWaterForInjection,
    ).status, IvFluidEvidenceStatus.coadministrationOnly);
  });

  test('nitroglycerin 50mg/10mL to 500mL final is 100 mcg/mL', () {
    final prep = dilution(
      vialAmount: 50, vialMl: 10, ordered: 50,
      stock: 5, fluid: 500,
      mode: IvVolumeEntryMode.finalVolumeTarget,
    )!;
    expect(prep.addedFluidMl, 490);
    expect(prep.withdrawalMl, 10);
    expect(prep.finalStrengthPerMl, 0.1);
    expect(matchesNitroglycerinLabelRecipe(
      ampouleAmountMg: 50,
      ampouleVolumeMl: 10,
      orderedAmountMg: 50,
      finalVolumeMl: prep.finalVolumeMl,
      addedFluidMl: prep.addedFluidMl,
    ), isTrue);
    expect(calculateOrderedMcgPerMinutePump(
      orderedMcgPerMin: 10,
      finalMgPerMl: prep.finalStrengthPerMl,
    ), closeTo(6, 0.00001));
  });

  test('nitroglycerin blocks nonlabelled 50mg final volume 250mL', () {
    expect(matchesNitroglycerinLabelRecipe(
      ampouleAmountMg: 50,
      ampouleVolumeMl: 10,
      orderedAmountMg: 50,
      finalVolumeMl: 250,
      addedFluidMl: 240,
    ), isFalse);
    for (final bad in [
      0.0, -1.0, double.nan, double.infinity,
    ]) {
      expect(calculateOrderedMcgPerMinutePump(
        orderedMcgPerMin: bad,
        finalMgPerMl: 0.1,
      ), isNull);
      expect(calculateOrderedMcgPerMinutePump(
        orderedMcgPerMin: 10,
        finalMgPerMl: bad,
      ), isNull);
    }
  });

  testWidgets('Drug IV dilution screen includes specific fluid-volume inputs', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: IvDilutionCalculatorScreen()),
    );
    await tester.pump();
    expect(find.text('IV dilution · حاسبة التخفيف'), findsOneWidget);
    for (final key in [
      'dilution-vial-quantity',
      'dilution-ordered-quantity',
      'dilution-fluid-quantity',
      'dilution-check-stock',
    ]) {
      await tester.scrollUntilVisible(
        find.byKey(ValueKey(key)),
        250,
        scrollable: find.byType(Scrollable).first,
      );
      expect(find.byKey(ValueKey(key)), findsOneWidget);
    }
  });
}
