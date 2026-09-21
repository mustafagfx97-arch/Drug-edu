import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IvPreparationProfile iv(String name) =>
      findIvPreparationProfile(name, 'General')!;

  test('neuro and electrolyte IV batch expands source-locked coverage', () {
    expect(ivPreparationProfiles.length, greaterThanOrEqualTo(56));

    for (final name in <String>[
      'Potassium phosphate',
      'Phenytoin',
      'Valproate',
      'Phenobarbital',
      'Midazolam',
      'Furosemide',
    ]) {
      final profile = findIvPreparationProfile(name, 'General');
      expect(profile, isNotNull, reason: name);
      expect(profile!.sourceLabel.trim(), isNotEmpty, reason: name);

      final catalog = ivMedicationCatalog.firstWhere(
        (entry) => entry.name == name && entry.population == 'General',
      );
      expect(catalog.structured, isTrue, reason: name);
    }
  });

  test('potassium phosphate counts both phosphorus and potassium and requires dilution', () {
    final profile = iv('Potassium phosphate');
    expect(profile.calculatorVariants.single.concentration, 3);
    expect(profile.formulation, contains('3 mmol/mL'));
    expect(profile.formulation, contains('4.4 mEq/mL'));
    expect(profile.reconstitution, contains('MUST be diluted'));
    expect(profile.furtherDilution, contains('6.8 mmol/100 mL'));
    expect(profile.furtherDilution, contains('18 mmol/100 mL'));
    expect(profile.administration, contains('6.8 mmol/hour'));
    expect(profile.administration, contains('15 mmol/hour'));
  });

  test('phenytoin infusion is NS-only with minimum final concentration and filter', () {
    final profile = iv('Phenytoin');
    expect(profile.calculatorVariants.single.concentration, 50);
    expect(profile.allowedDiluents, contains('0.9% Sodium Chloride'));
    expect(profile.allowedDiluents.toLowerCase(), contains('avoid dextrose'));
    expect(profile.furtherDilution, contains('at least 5 mg/mL'));
    expect(profile.administration, contains('50 mg/min'));
    expect(profile.administration, contains('0.22–0.55 micron'));
    expect(profile.stability, contains('1–4 hours'));
    expect(profile.stability.toLowerCase(), contains('do not refrigerate'));
  });

  test('valproate stock is 100 mg per mL with at least 50 mL dilution', () {
    final profile = iv('Valproate');
    expect(profile.calculatorVariants.single.concentration, 100);
    expect(profile.formulation, contains('500 mg/5 mL'));
    expect(profile.furtherDilution, contains('at least 50 mL'));
    expect(profile.allowedDiluents, contains('D5W'));
    expect(profile.allowedDiluents, contains('0.9% Sodium Chloride'));
    expect(profile.allowedDiluents, contains('Lactated Ringer'));
    expect(profile.administration, contains('60 minutes'));
    expect(profile.stability, contains('24 hours'));
  });

  test('phenobarbital keeps 65 and 130 mg per mL vials distinct', () {
    final profile = iv('Phenobarbital');
    expect(profile.calculatorVariants.length, 2);
    expect(profile.calculatorVariants[0].concentration, 65);
    expect(profile.calculatorVariants[1].concentration, 130);
    expect(profile.administration, contains('60 mg/min'));
    expect(profile.administration.toLowerCase(), contains('larger vein'));
    expect(profile.furtherDilution.toLowerCase(), contains('no routine dilution'));
  });

  test('midazolam preserves 1 and 5 mg per mL and locks infusion dilution', () {
    final profile = iv('Midazolam');
    expect(profile.calculatorVariants.length, 2);
    expect(profile.calculatorVariants[0].concentration, 1);
    expect(profile.calculatorVariants[1].concentration, 5);
    expect(profile.formulation.toLowerCase(), contains('preservative-free'));
    expect(profile.furtherDilution, contains('0.5 mg/mL'));
    expect(profile.allowedDiluents, contains('0.9% Sodium Chloride'));
    expect(profile.allowedDiluents, contains('D5W'));
    expect(profile.stability, contains('24 hours'));
    expect(profile.stability, contains('4 hours'));
  });

  test('furosemide remains 10 mg per mL and high-dose infusion has pH and rate locks', () {
    final profile = iv('Furosemide');
    expect(profile.calculatorVariants.single.concentration, 10);
    expect(profile.formulation, contains('10 mg/mL'));
    expect(profile.administration, contains('1–2 minutes'));
    expect(profile.administration, contains('4 mg/min'));
    expect(profile.furtherDilution, contains('pH'));
    expect(profile.furtherDilution, contains('above 5.5'));
    expect(profile.stability.toLowerCase(), contains('protect from light'));
  });
}
