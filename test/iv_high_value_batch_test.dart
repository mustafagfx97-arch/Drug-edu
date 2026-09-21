import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IvPreparationProfile iv(String name) =>
      findIvPreparationProfile(name, 'General')!;

  test('high-value IV batch expands exact source-locked coverage', () {
    expect(ivPreparationProfiles.length, greaterThanOrEqualTo(32));

    for (final name in <String>[
      'Potassium chloride',
      'Magnesium sulfate',
      'Calcium gluconate',
      'Calcium chloride',
      'Sodium bicarbonate 8.4%',
      'Dopamine',
      'Epinephrine',
      'Labetalol',
    ]) {
      expect(findIvPreparationProfile(name, 'General'), isNotNull, reason: name);
      final catalog = ivMedicationCatalog.firstWhere(
        (entry) => entry.name == name && entry.population == 'General',
      );
      expect(catalog.structured, isTrue, reason: name);
    }
  });

  test('potassium chloride concentrate is calculation-safe but never direct IV', () {
    final profile = iv('Potassium chloride');
    expect(profile.withdrawalVariants.single.concentration, 2);
    expect(profile.withdrawalVariants.single.unit, 'mEq');
    expect(profile.reconstitution, contains('MUST be diluted'));
    expect(profile.furtherDilution, contains('40 mEq/L'));
    expect(profile.furtherDilution, contains('10 mEq/hour'));
    expect(
      profile.criticalLocks.join(' ').toLowerCase(),
      contains('never be directly injected'),
    );
  });

  test('magnesium sulfate locks stock grams and mandatory IV dilution', () {
    final profile = iv('Magnesium sulfate');
    expect(profile.withdrawalVariants.single.concentration, 0.5);
    expect(profile.withdrawalVariants.single.unit, 'g');
    expect(profile.resultingConcentration, contains('500 mg/mL'));
    expect(profile.resultingConcentration, contains('20%'));
    expect(profile.allowedDiluents, contains('5% Dextrose'));
    expect(profile.allowedDiluents, contains('0.9% Sodium Chloride'));
    expect(profile.administration, contains('150 mg/minute'));
  });

  test('calcium salts keep elemental content and administration distinct', () {
    final gluconate = iv('Calcium gluconate');
    expect(gluconate.withdrawalVariants.single.concentration, 100);
    expect(gluconate.formulation, contains('9.3 mg elemental calcium'));
    expect(gluconate.formulation, contains('0.465 mEq'));
    expect(gluconate.resultingConcentration, contains('10–50 mg/mL'));
    expect(gluconate.resultingConcentration, contains('5.8–10 mg/mL'));
    expect(gluconate.incompatibilities.toLowerCase(), contains('phosphate'));
    expect(gluconate.incompatibilities.toLowerCase(), contains('bicarbonate'));

    final chloride = iv('Calcium chloride');
    expect(chloride.withdrawalVariants.single.concentration, 100);
    expect(chloride.formulation, contains('27 mg elemental calcium'));
    expect(chloride.formulation, contains('1.4 mEq'));
    expect(chloride.administration, contains('1 mL/minute'));
    expect(chloride.administration, contains('central or deep vein'));
    expect(
      chloride.criticalLocks.join(' '),
      contains('NOT interchangeable'),
    );
  });

  test('bicarbonate 8.4 percent stays separate from pediatric 4.2 percent', () {
    final profile = iv('Sodium bicarbonate 8.4%');
    expect(profile.withdrawalVariants.single.concentration, 1);
    expect(profile.withdrawalVariants.single.unit, 'mEq');
    expect(profile.formulation, contains('84 mg/mL'));
    expect(profile.formulation, contains('1 mEq/mL'));
    expect(profile.administration, contains('4.2%'));
    expect(profile.incompatibilities.toLowerCase(), contains('norepinephrine'));
    expect(profile.incompatibilities.toLowerCase(), contains('calcium'));
  });

  test('dopamine manufacturer dilution recipes stay explicit', () {
    final profile = iv('Dopamine');
    expect(profile.withdrawalVariants.single.concentration, 40);
    expect(profile.resultingConcentration, contains('800 mcg/mL'));
    expect(profile.resultingConcentration, contains('1,600 mcg/mL'));
    expect(profile.allowedDiluents, contains('Lactated Ringers'));
    expect(profile.stability, contains('24 hours'));
    expect(profile.incompatibilities.toLowerCase(), contains('sodium bicarbonate'));
  });

  test('epinephrine septic shock profile cannot masquerade as anaphylaxis', () {
    final profile = iv('Epinephrine');
    expect(profile.withdrawalVariants.single.concentration, 1);
    expect(profile.resultingConcentration, contains('1 mcg/mL'));
    expect(profile.resultingConcentration, contains('1,000 mL'));
    expect(profile.allowedDiluents, contains('5% Dextrose'));
    expect(profile.allowedDiluents.toLowerCase(), contains('not recommend'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('anaphylaxis'));
  });

  test('labetalol separates stock IV injection from continuous infusion prep', () {
    final profile = iv('Labetalol');
    expect(profile.withdrawalVariants.single.concentration, 5);
    expect(profile.resultingConcentration, contains('1 mg/mL'));
    expect(profile.furtherDilution, contains('40 mL'));
    expect(profile.furtherDilution, contains('160 mL'));
    expect(profile.incompatibilities, contains('5% Sodium Bicarbonate'));
    expect(profile.stability, contains('24 hours'));
  });
}
