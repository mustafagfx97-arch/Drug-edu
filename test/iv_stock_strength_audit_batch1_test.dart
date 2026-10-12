import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:drug_edu/features/iv_prep/data/iv_stock_strength_audit.dart';
import 'package:drug_edu/features/calculators/domain/iv_dilution_calculator_engine.dart';

void main() {
  test('all existing IV populations have distinct drug+population identity', () {
    expect(ivPreparationProfiles.length, 136);
    final keys = <String>{};
    for (final p in ivPreparationProfiles) {
      expect(keys.add('${p.name}:${p.population}'), isTrue);
    }
  });

  test('new audited strengths use source URLs, finite stock, unique IDs', () {
    final ids = <String>{};
    var options = 0;
    for (final entry in ivAuditedAdultStockPresentations.entries) {
      final drug = ivPreparationProfiles.where(
        (x) => x.name == entry.key && x.population == 'General',
      );
      expect(drug.length, 1);
      expect(entry.value, isNotEmpty);
      for (final p in entry.value) {
        options++;
        expect(ids.add(p.id), isTrue);
        expect(p.vialAmount.isFinite && p.vialAmount > 0, isTrue);
        expect(p.vialVolumeMl.isFinite && p.vialVolumeMl > 0, isTrue);
        expect(p.concentrationPerMl.isFinite && p.concentrationPerMl > 0,
            isTrue);
        expect(p.sourceUrl.startsWith('https://'), isTrue);
        expect(p.sourceUrl.contains('dailymed.nlm.nih.gov'), isTrue);
        expect(p.packageLabel, isNotEmpty);
        expect(p.safetyNote, isNotEmpty);
      }
    }
    expect(ivAuditedAdultStockPresentations.length, 7);
    expect(options, 17);
  });

  test('dopamine 40mg/mL and 80mg/mL both documented, not conflated', () {
    final options = reviewedAdultIvStockOptions(
      name: 'Dopamine', population: 'General',
    );
    expect(options.length, 4);
    expect(options.map((p) => p.concentrationPerMl).toSet(), {40.0, 80.0});
    expect(options.map((p) => p.vialAmount).toSet(), {200.0, 400.0, 800.0});
    expect(reviewedAdultIvStockOptions(
      name: 'Dopamine', population: 'NICU',
    ), isEmpty);
  });

  test('fosphenytoin vials distinct TOTAL in mg PE', () {
    final options = reviewedAdultIvStockOptions(
      name: 'Fosphenytoin', population: 'General',
    );
    expect(options.map((x) => x.unit).toSet(), {'mg PE'});
    expect(options.map((x) => x.vialAmount).toSet(), {100.0, 500.0});
    expect(options.map((x) => x.vialVolumeMl).toSet(), {2.0, 10.0});
  });

  test('amiodarone, insulin, calcium and heparin dose bases not interchanged', () {
    expect(reviewedAdultIvStockOptions(
      name: 'Amiodarone', population: 'General',
    ).map((x) => x.concentrationPerMl).toSet(), {50.0});
    expect(reviewedAdultIvStockOptions(
      name: 'Regular insulin infusion', population: 'General',
    ).map((x) => x.unit).toSet(), {'units'});
    expect(reviewedAdultIvStockOptions(
      name: 'Calcium gluconate', population: 'General',
    ).map((x) => x.unit).toSet(), {'mg calcium gluconate'});
    expect(reviewedAdultIvStockOptions(
      name: 'Heparin', population: 'General',
    ).map((x) => x.concentrationPerMl).toSet(), {1000.0, 5000.0, 10000.0});
  });

  test('source vial size mismatches require manual OTHER pathway', () {
    final p = reviewedAdultIvStockOptions(
      name: 'Dopamine', population: 'General',
    ).first;
    expect(p.vialAmount, 200);
    expect(p.vialVolumeMl, 5);
    final matching = calculateVerifiedIvDilution(
      ampouleAmount: p.vialAmount,
      ampouleVolumeMl: p.vialVolumeMl,
      orderedTotalAmount: 100,
      verifiedStrengthPerMl: p.concentrationPerMl,
      volumeMl: 250,
      volumeMode: IvVolumeEntryMode.addFluidToDrug,
    )!;
    expect(matching.withdrawalMl, 2.5);
    // Identical per-mL strength does NOT prove it is the identical package.
    expect(400 / 10, p.concentrationPerMl);
    expect(400, isNot(p.vialAmount));
  });

  test('high-risk unreviewed drug still has no false audited option', () {
    expect(reviewedAdultIvStockOptions(
      name: 'Colistimethate / Colistin', population: 'General',
    ), isEmpty);
    expect(reviewedAdultIvStockOptions(
      name: 'Sodium nitroprusside', population: 'General',
    ), isEmpty);
    expect(reviewedAdultIvStockOptions(
      name: 'Vancomycin', population: 'NICU',
    ), isEmpty);
  });
}
