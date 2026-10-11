import 'package:flutter_test/flutter_test.dart';

import 'package:drug_edu/main_iv.dart';
import 'package:drug_edu/features/iv_prep/data/iv_fluid_evidence.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:drug_edu/features/calculators/domain/iv_weight_based_dose_engine.dart';

void main() {
  test('IV-only PWA catalog reuses the verified source-locked IV data', () {
    expect(ivPreparationProfiles, hasLength(136));
    final keys = ivPreparationProfiles
        .map((p) => '${p.name}|${p.population}')
        .toList();
    expect(keys.toSet(), hasLength(keys.length));
  });

  test('fluid quick check is conservative for unrelated or neonatal records', () {
    for (final fluid in IvFluid.values) {
      final unknown = reviewedIvFluidEvidence(
        name: 'Vancomycin',
        population: 'General',
        fluid: fluid,
      );
      expect(unknown.status, IvFluidEvidenceStatus.unknown);
      expect(unknown.mayBeUsedAsDiluent, isFalse);
      expect(
        reviewedIvFluidEvidence(
          name: 'Nicardipine',
          population: 'NICU',
          fluid: fluid,
        ).status,
        IvFluidEvidenceStatus.unknown,
      );
    }
  });

  test('CARDENE vial: NaCl and D5W yes, LR and bicarbonate no', () {
    for (final fluid in [IvFluid.normalSaline, IvFluid.dextrose5]) {
      final evidence = reviewedIvFluidEvidence(
        name: 'Nicardipine', population: 'General', fluid: fluid,
      );
      expect(evidence.status, IvFluidEvidenceStatus.verifiedDiluent);
      expect(evidence.mayBeUsedAsDiluent, isTrue);
    }
    for (final fluid in [
      IvFluid.lactatedRingers,
      IvFluid.sodiumBicarbonate5,
    ]) {
      expect(
        reviewedIvFluidEvidence(
          name: 'Nicardipine', population: 'General', fluid: fluid,
        ).status,
        IvFluidEvidenceStatus.incompatibleDiluent,
      );
    }
  });

  test('Cleviprex fluid co-administration must never imply dilution', () {
    for (final fluid in [
      IvFluid.normalSaline, IvFluid.dextrose5, IvFluid.lactatedRingers,
    ]) {
      final evidence = reviewedIvFluidEvidence(
        name: 'Clevidipine', population: 'General', fluid: fluid,
      );
      expect(evidence.status, IvFluidEvidenceStatus.coadministrationOnly);
      expect(evidence.mayBeUsedAsDiluent, isFalse);
    }
    expect(
      reviewedIvFluidEvidence(
        name: 'Clevidipine',
        population: 'General',
        fluid: IvFluid.sodiumBicarbonate5,
      ).status,
      IvFluidEvidenceStatus.unknown,
    );
  });

  test('Nitroprusside concentrate requires D5W; saline is NOT assumed safe', () {
    expect(
      reviewedIvFluidEvidence(
        name: 'Sodium nitroprusside', population: 'General',
        fluid: IvFluid.dextrose5,
      ).status,
      IvFluidEvidenceStatus.verifiedDiluent,
    );
    expect(
      reviewedIvFluidEvidence(
        name: 'Sodium nitroprusside', population: 'General',
        fluid: IvFluid.normalSaline,
      ).status,
      IvFluidEvidenceStatus.unknown,
    );
  });

  test('Y-site never auto-certifies compatibility', () {
    expect(
      reviewIvYsite(
        firstDrug: 'Vancomycin', secondDrug: 'Meropenem',
        firstPopulation: 'General', secondPopulation: 'General',
      ),
      IvYsiteStatus.unverified,
    );
    expect(
      reviewIvYsite(
        firstDrug: 'Clevidipine', secondDrug: 'Norepinephrine',
        firstPopulation: 'General', secondPopulation: 'General',
      ),
      IvYsiteStatus.prohibitedByLabel,
    );
  });

  test('prescribed mg/kg x weight / verified concentration = volume', () {
    final result = calculateOrderedWeightBasedWithdrawal(
      prescribedAmountPerKg: 2,
      dosingWeightKg: 70,
      verifiedStockAmountPerMl: 50,
    )!;
    expect(result.orderedAmount, 140);
    expect(result.withdrawalMilliliters, 2.8);
  });

  test('weight-based calculation blocks missing/nonfinite/zero/negative', () {
    for (final bad in [
      0.0, -1.0, double.nan, double.infinity,
    ]) {
      expect(calculateOrderedWeightBasedWithdrawal(
        prescribedAmountPerKg: bad,
        dosingWeightKg: 50,
        verifiedStockAmountPerMl: 10,
      ), isNull);
      expect(calculateOrderedWeightBasedWithdrawal(
        prescribedAmountPerKg: 1,
        dosingWeightKg: bad,
        verifiedStockAmountPerMl: 10,
      ), isNull);
      expect(calculateOrderedWeightBasedWithdrawal(
        prescribedAmountPerKg: 1,
        dosingWeightKg: 50,
        verifiedStockAmountPerMl: bad,
      ), isNull);
    }
  });

  testWidgets('web entrypoint exposes IV-only navigation', (tester) async {
    await tester.pumpWidget(const DrugIvApp());
    await tester.pump();
    expect(find.text('IV drugs'), findsOneWidget);
    expect(find.text('Fluids'), findsOneWidget);
    expect(find.text('Dose'), findsOneWidget);
    expect(find.text('Infusion'), findsOneWidget);
    expect(find.text('Encyclopedia'), findsNothing);
    expect(find.text('Supplements'), findsNothing);
    expect(find.textContaining('136 product/population-specific profiles'), findsWidgets);
  });
}
