import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IvPreparationProfile nicu(String name) =>
      findIvPreparationProfile(name, 'NICU')!;

  test('first NICU continuous infusion batch expands source-locked coverage', () {
    expect(ivPreparationProfiles.length, greaterThanOrEqualTo(93));

    for (final name in <String>[
      'Dopamine',
      'Dobutamine',
      'Norepinephrine',
      'Fentanyl',
      'Morphine',
      'Midazolam',
    ]) {
      final profile = findIvPreparationProfile(name, 'NICU');
      expect(profile, isNotNull, reason: name);
      expect(profile!.sourceLabel, contains('ASHP Standardize 4 Safety'));

      final catalog = ivMedicationCatalog.firstWhere(
        (entry) => entry.name == name && entry.population == 'NICU',
      );
      expect(catalog.structured, isTrue, reason: name);
    }
  });

  test('NICU dopamine separates 40 mg per mL stock from S4S final standards', () {
    final profile = nicu('Dopamine');
    expect(profile.calculatorVariants.single.concentration, 40);
    expect(profile.formulation, contains('40 mg/mL'));
    expect(profile.resultingConcentration, contains('800 mcg/mL'));
    expect(profile.resultingConcentration, contains('1600 mcg/mL'));
    expect(profile.resultingConcentration, contains('3200 mcg/mL'));
    expect(profile.reconstitution, contains('MUST be diluted'));
    expect(profile.stability, contains('24 hours'));
    expect(profile.criticalLocks.join(' '), contains('under 500 g'));
    expect(profile.incompatibilities.toLowerCase(), contains('sodium bicarbonate'));
  });

  test('NICU dobutamine keeps stock withdrawal separate from S4S options', () {
    final profile = nicu('Dobutamine');
    expect(profile.calculatorVariants.single.concentration, 12.5);
    expect(profile.reconstitution, contains('MUST be diluted'));
    expect(profile.resultingConcentration, contains('1000'));
    expect(profile.resultingConcentration, contains('2000'));
    expect(profile.resultingConcentration, contains('4000'));
    expect(profile.furtherDilution, contains('at least 50 mL'));
    expect(profile.stability, contains('24 hours'));
    expect(profile.incompatibilities, contains('5% Sodium Bicarbonate'));
  });

  test('NICU norepinephrine preserves manufacturer 4 mcg per mL versus S4S distinction', () {
    final profile = nicu('Norepinephrine');
    expect(profile.calculatorVariants.single.concentration, 1);
    expect(profile.resultingConcentration, contains('16'));
    expect(profile.resultingConcentration, contains('32'));
    expect(profile.resultingConcentration, contains('64'));
    expect(profile.furtherDilution, contains('4 mcg/mL'));
    expect(profile.furtherDilution, contains('16/32/64'));
    expect(profile.allowedDiluents.toLowerCase(), contains('d5w'));
    expect(profile.allowedDiluents.toLowerCase(), contains('saline alone'));
    expect(profile.stability, contains('Do NOT automatically apply'));
    expect(profile.criticalLocks.join(' '), contains('under 500 g'));
  });

  test('NICU fentanyl uses mcg stock and S4S 10 or 50 mcg per mL only', () {
    final profile = nicu('Fentanyl');
    expect(profile.calculatorVariants.single.concentration, 50);
    expect(profile.calculatorVariants.single.unit, 'mcg');
    expect(profile.resultingConcentration, contains('10 or 50 mcg/mL'));
    expect(profile.furtherDilution, contains('50 mcg/mL'));
    expect(profile.furtherDilution, contains('10 mcg/mL'));
    expect(profile.allowedDiluents.toLowerCase(), contains('validated'));
    expect(profile.stability.toLowerCase(), contains('preservative-free'));
  });

  test('NICU morphine S4S standards are 0.2 0.5 and 1 mg per mL', () {
    final profile = nicu('Morphine');
    expect(profile.calculatorVariants.single.concentration, 1);
    expect(profile.resultingConcentration, contains('0.2'));
    expect(profile.resultingConcentration, contains('0.5'));
    expect(profile.resultingConcentration, contains('1 mg/mL'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('preservative'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('iv only'));
  });

  test('NICU midazolam preserves PF 1 and 5 mg stocks plus S4S 0.3 mg standard', () {
    final profile = nicu('Midazolam');
    expect(profile.calculatorVariants.length, 2);
    expect(profile.calculatorVariants[0].concentration, 1);
    expect(profile.calculatorVariants[1].concentration, 5);
    expect(profile.resultingConcentration, contains('0.3'));
    expect(profile.resultingConcentration, contains('1'));
    expect(profile.resultingConcentration, contains('5 mg/mL'));
    expect(profile.allowedDiluents, contains('0.9% Sodium Chloride'));
    expect(profile.allowedDiluents, contains('D5W'));
    expect(profile.stability, contains('0.5 mg/mL'));
    expect(profile.stability, contains('0.3 mg/mL'));
  });
}
