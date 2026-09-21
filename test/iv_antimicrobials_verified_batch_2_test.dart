import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IvPreparationProfile iv(String name) =>
      findIvPreparationProfile(name, 'General')!;

  test('second antimicrobial IV batch expands source-locked coverage', () {
    expect(ivPreparationProfiles.length, greaterThanOrEqualTo(44));

    for (final name in <String>[
      'Imipenem / Cilastatin',
      'Aztreonam',
      'Ciprofloxacin',
      'Voriconazole',
      'Caspofungin',
      'Anidulafungin',
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

  test('imipenem cilastatin keeps mandatory transfer pathway manual', () {
    final profile = iv('Imipenem / Cilastatin');
    expect(profile.calculatorVariants, isEmpty);
    expect(profile.reconstitution, contains('approximately 10 mL'));
    expect(profile.reconstitution, contains('100 mL'));
    expect(profile.furtherDilution.toLowerCase(), contains('mandatory'));
    expect(profile.administration, contains('20–30 minutes'));
    expect(profile.administration, contains('40–60 minutes'));
    expect(profile.stability, contains('4 hours'));
    expect(profile.stability, contains('24 hours'));
  });

  test('aztreonam separates bolus and infusion constitution paths', () {
    final profile = iv('Aztreonam');
    expect(profile.calculatorVariants, isEmpty);
    expect(profile.reconstitution, contains('6–10 mL'));
    expect(profile.reconstitution, contains('at least 3 mL'));
    expect(profile.furtherDilution, contains('20 mg/mL'));
    expect(profile.administration, contains('3–5 minutes'));
    expect(profile.administration, contains('20–60 minutes'));
    expect(profile.incompatibilities.toLowerCase(), contains('metronidazole'));
  });

  test('ciprofloxacin premix remains ready to use at 2 mg per mL', () {
    final profile = iv('Ciprofloxacin');
    expect(profile.calculatorVariants.single.concentration, 2);
    expect(profile.reconstitution.toLowerCase(), contains('premixed'));
    expect(profile.furtherDilution.toLowerCase(), contains('no further dilution'));
    expect(profile.formulation, contains('200 mg/100 mL'));
    expect(profile.formulation, contains('400 mg/200 mL'));
    expect(profile.administration, contains('60 minutes'));
    expect(profile.incompatibilities.toLowerCase(), contains('do not add'));
  });

  test('voriconazole powder uses exact 19 mL WFI then mandatory dilution', () {
    final profile = iv('Voriconazole');
    expect(profile.calculatorVariants.single.concentration, 10);
    expect(profile.reconstitution, contains('exactly 19 mL'));
    expect(profile.resultingConcentration, contains('10 mg/mL'));
    expect(profile.furtherDilution, contains('0.5 and 5 mg/mL'));
    expect(profile.administration, contains('1–3 hours'));
    expect(profile.administration, contains('3 mg/kg/hour'));
    expect(profile.incompatibilities, contains('4.2% Sodium Bicarbonate'));
  });

  test('caspofungin preserves exact 50 and 70 mg vial concentrations', () {
    final profile = iv('Caspofungin');
    expect(profile.calculatorVariants.length, 2);
    expect(profile.calculatorVariants[0].concentration, 5);
    expect(profile.calculatorVariants[1].concentration, 7);
    expect(profile.reconstitution, contains('10.8 mL'));
    expect(profile.furtherDilution, contains('0.5 mg/mL'));
    expect(profile.administration, contains('approximately 1 hour'));
    expect(profile.incompatibilities.toLowerCase(), contains('dextrose'));
  });

  test('anidulafungin locks SWFI vial step and 0.77 mg per mL infusion', () {
    final profile = iv('Anidulafungin');
    expect(profile.calculatorVariants.length, 2);
    expect(profile.calculatorVariants[0].concentration, closeTo(3.33, 0.001));
    expect(profile.calculatorVariants[1].concentration, closeTo(3.33, 0.001));
    expect(profile.reconstitution, contains('50 mg vial with 15 mL'));
    expect(profile.reconstitution, contains('100 mg vial with 30 mL'));
    expect(profile.furtherDilution, contains('0.77 mg/mL'));
    expect(profile.allowedDiluents, contains('5% Dextrose'));
    expect(profile.allowedDiluents, contains('0.9% Sodium Chloride'));
    expect(profile.administration, contains('1.1 mg/min'));
    expect(profile.stability, contains('48 hours'));
  });
}
