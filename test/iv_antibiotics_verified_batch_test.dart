import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IvPreparationProfile iv(String name) =>
      findIvPreparationProfile(name, 'General')!;

  test('antibiotic IV batch expands source-locked coverage', () {
    expect(ivPreparationProfiles.length, greaterThanOrEqualTo(38));

    for (final name in <String>[
      'Cefotaxime',
      'Ceftazidime',
      'Ertapenem',
      'Amikacin',
      'Levofloxacin',
      'Daptomycin',
    ]) {
      final profile = findIvPreparationProfile(name, 'General');
      expect(profile, isNotNull, reason: name);
      expect(profile!.sourceLabel.trim(), isNotEmpty, reason: name);
      expect(profile.calculatorVariants, isNotEmpty, reason: name);

      final catalog = ivMedicationCatalog.firstWhere(
        (entry) => entry.name == name && entry.population == 'General',
      );
      expect(catalog.structured, isTrue, reason: name);
    }
  });

  test('cefotaxime calculator keeps each IV vial concentration distinct', () {
    final profile = iv('Cefotaxime');
    expect(profile.calculatorVariants.length, 3);
    expect(profile.calculatorVariants[0].concentration, 50);
    expect(profile.calculatorVariants[1].concentration, 95);
    expect(profile.calculatorVariants[2].concentration, 180);
    expect(profile.administration, contains('3–5 minutes'));
    expect(profile.incompatibilities.toLowerCase(), contains('aminoglycoside'));
    expect(profile.incompatibilities, contains('Sodium Bicarbonate'));
  });

  test('ceftazidime locks 1 g and 2 g vial concentrations', () {
    final profile = iv('Ceftazidime');
    expect(profile.calculatorVariants.length, 2);
    expect(profile.calculatorVariants[0].concentration, 100);
    expect(profile.calculatorVariants[1].concentration, 170);
    expect(profile.furtherDilution, contains('1–40 mg/mL'));
    expect(profile.administration, contains('3–5 minutes'));
    expect(profile.incompatibilities.toLowerCase(), contains('aminoglycoside'));
  });

  test('ertapenem requires two-step IV preparation and forbids dextrose', () {
    final profile = iv('Ertapenem');
    expect(profile.calculatorVariants.single.concentration, 100);
    expect(profile.resultingConcentration, contains('20 mg/mL'));
    expect(profile.furtherDilution, contains('0.9% Sodium Chloride'));
    expect(profile.incompatibilities.toLowerCase(), contains('do not'));
    expect(profile.incompatibilities.toLowerCase(), contains('dextrose'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('im-only'));
  });

  test('amikacin uses 250 mg/mL stock with patient-specific infusion volume', () {
    final profile = iv('Amikacin');
    expect(profile.calculatorVariants.single.concentration, 250);
    expect(profile.furtherDilution, contains('500 mg'));
    expect(profile.furtherDilution, contains('100 or 200 mL'));
    expect(profile.administration, contains('30–60 minutes'));
    expect(profile.administration, contains('1–2 hour'));
    expect(profile.incompatibilities.toLowerCase(), contains('premix'));
  });

  test('levofloxacin premix stays ready-to-use with dose-specific infusion time',
      () {
    final profile = iv('Levofloxacin');
    expect(profile.calculatorVariants.single.concentration, 5);
    expect(profile.reconstitution.toLowerCase(), contains('premixed'));
    expect(profile.furtherDilution.toLowerCase(), contains('no further dilution'));
    expect(profile.administration, contains('250 mg'));
    expect(profile.administration, contains('500 mg'));
    expect(profile.administration, contains('60 minutes'));
    expect(profile.administration, contains('750 mg'));
    expect(profile.administration, contains('90 minutes'));
    expect(profile.incompatibilities.toLowerCase(), contains('do not add'));
  });

  test('daptomycin exact product uses NS-only 50 mg/mL reconstitution', () {
    final profile = iv('Daptomycin');
    expect(profile.calculatorVariants.single.concentration, 50);
    expect(profile.reconstitution, contains('10 mL 0.9% Sodium Chloride'));
    expect(profile.reconstitution, contains('10 minutes'));
    expect(profile.allowedDiluents, contains('0.9% Sodium Chloride'));
    expect(profile.incompatibilities.toLowerCase(), contains('dextrose'));
    expect(profile.administration, contains('2-minute'));
    expect(profile.administration, contains('30-minute'));
    expect(profile.administration, contains('60-minute'));
  });
}
