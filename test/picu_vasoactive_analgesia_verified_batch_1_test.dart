import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IvPreparationProfile picu(String name) =>
      findIvPreparationProfile(name, 'PICU')!;

  test('first PICU vasoactive and analgesia batch expands source-locked coverage', () {
    expect(ivPreparationProfiles.length, greaterThanOrEqualTo(128));

    for (final name in <String>[
      'Norepinephrine',
      'Epinephrine',
      'Dopamine',
      'Dobutamine',
      'Fentanyl',
      'Morphine',
    ]) {
      final profile = findIvPreparationProfile(name, 'PICU');
      expect(profile, isNotNull, reason: name);
      expect(profile!.sourceLabel, contains('ASHP Standardize 4 Safety'));

      final catalog = ivMedicationCatalog.firstWhere(
        (entry) => entry.name == name && entry.population == 'PICU',
      );
      expect(catalog.structured, isTrue, reason: name);
    }
  });

  test('PICU norepinephrine separates 1 mg per mL stock from S4S standards', () {
    final profile = picu('Norepinephrine');
    expect(profile.calculatorVariants.single.concentration, 1);
    expect(profile.formulation, contains('1 mg/mL'));
    expect(profile.resultingConcentration, contains('16'));
    expect(profile.resultingConcentration, contains('32'));
    expect(profile.resultingConcentration, contains('64 mcg/mL'));
    expect(profile.reconstitution, contains('MUST be diluted'));
    expect(profile.furtherDilution.toLowerCase(), contains('validated picu'));
    expect(profile.stability.toLowerCase(), contains('do not automatically transfer'));
  });

  test('PICU epinephrine distinguishes adult 1 mcg per mL label recipe from S4S standards', () {
    final profile = picu('Epinephrine');
    expect(profile.calculatorVariants.single.concentration, 1);
    expect(profile.formulation, contains('1 mg/mL'));
    expect(profile.resultingConcentration, contains('10'));
    expect(profile.resultingConcentration, contains('20'));
    expect(profile.resultingConcentration, contains('40 mcg/mL'));
    expect(profile.furtherDilution, contains('1 mcg/mL'));
    expect(profile.allowedDiluents, contains('D5W'));
    expect(profile.allowedDiluents, contains('D5/0.9% NaCl'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('adult-label'));
  });

  test('PICU dopamine keeps 40 mg per mL stock and S4S 800 1600 3200 standards', () {
    final profile = picu('Dopamine');
    expect(profile.calculatorVariants.single.concentration, 40);
    expect(profile.resultingConcentration, contains('800'));
    expect(profile.resultingConcentration, contains('1600'));
    expect(profile.resultingConcentration, contains('3200 mcg/mL'));
    expect(profile.reconstitution, contains('MUST be diluted'));
    expect(profile.stability, contains('24 hours'));
    expect(profile.incompatibilities.toLowerCase(), contains('sodium bicarbonate'));
  });

  test('PICU dobutamine keeps 12.5 mg per mL stock and minimum 50 mL final volume', () {
    final profile = picu('Dobutamine');
    expect(profile.calculatorVariants.single.concentration, 12.5);
    expect(profile.resultingConcentration, contains('1000'));
    expect(profile.resultingConcentration, contains('2000'));
    expect(profile.resultingConcentration, contains('4000 mcg/mL'));
    expect(profile.furtherDilution, contains('at least 50 mL'));
    expect(profile.stability, contains('24 hours'));
    expect(profile.incompatibilities, contains('5% Sodium Bicarbonate'));
  });

  test('PICU fentanyl uses mcg stock and validates 10 mcg per mL dilution separately', () {
    final profile = picu('Fentanyl');
    expect(profile.calculatorVariants.single.concentration, 50);
    expect(profile.calculatorVariants.single.unit, 'mcg');
    expect(profile.resultingConcentration, contains('10 or 50 mcg/mL'));
    expect(profile.furtherDilution, contains('50 mcg/mL'));
    expect(profile.furtherDilution, contains('10 mcg/mL'));
    expect(profile.furtherDilution.toLowerCase(), contains('validated picu'));
    expect(profile.stability.toLowerCase(), contains('single-dose'));
  });

  test('PICU morphine uses preservative-free 1 mg per mL stock and S4S standards', () {
    final profile = picu('Morphine');
    expect(profile.calculatorVariants.single.concentration, 1);
    expect(profile.formulation.toLowerCase(), contains('preservative-free'));
    expect(profile.resultingConcentration, contains('0.2'));
    expect(profile.resultingConcentration, contains('0.5'));
    expect(profile.resultingConcentration, contains('1 mg/mL'));
    expect(profile.furtherDilution.toLowerCase(), contains('validated picu'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('neuraxial'));
  });
}
