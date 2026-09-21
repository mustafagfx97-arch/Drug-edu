import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IvPreparationProfile iv(String name) =>
      findIvPreparationProfile(name, 'General')!;

  test('critical care and antidote IV batch expands source-locked coverage', () {
    expect(ivPreparationProfiles.length, greaterThanOrEqualTo(68));

    for (final name in <String>[
      'Regular insulin infusion',
      'Heparin',
      'Alteplase',
      'Tenecteplase',
      'Naloxone',
      'Flumazenil',
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

  test('regular insulin IV remains U-100 stock with NS-only labeled concentration range', () {
    final profile = iv('Regular insulin infusion');
    expect(profile.calculatorVariants.single.concentration, 100);
    expect(profile.calculatorVariants.single.unit, 'units');
    expect(profile.formulation, contains('U-100'));
    expect(profile.resultingConcentration, contains('0.1 unit/mL'));
    expect(profile.resultingConcentration, contains('1 unit/mL'));
    expect(profile.allowedDiluents, contains('0.9% Sodium Chloride'));
    expect(profile.stability, contains('48 hours'));
    expect(profile.criticalLocks.join(' '), contains('U-500'));
  });

  test('heparin keeps 1000 5000 and 10000 unit per mL products distinct', () {
    final profile = iv('Heparin');
    expect(profile.calculatorVariants.length, 3);
    expect(profile.calculatorVariants[0].concentration, 1000);
    expect(profile.calculatorVariants[1].concentration, 5000);
    expect(profile.calculatorVariants[2].concentration, 10000);
    expect(profile.furtherDilution, contains('20,000–40,000 units'));
    expect(profile.furtherDilution, contains('1,000 mL'));
    expect(profile.incompatibilities.toLowerCase(), contains('lock-flush'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('benzyl alcohol'));
  });

  test('Activase systemic product is kept separate from Cathflo', () {
    final profile = iv('Alteplase');
    expect(profile.calculatorVariants.length, 2);
    expect(profile.calculatorVariants[0].concentration, 1);
    expect(profile.calculatorVariants[1].concentration, 1);
    expect(profile.reconstitution, contains('50 mg vial'));
    expect(profile.reconstitution, contains('100 mg vial'));
    expect(profile.resultingConcentration, contains('1 mg/mL'));
    expect(profile.furtherDilution, contains('0.5 mg/mL'));
    expect(profile.stability, contains('8 hours'));
    expect(profile.criticalLocks.join(' '), contains('Cathflo'));
  });

  test('TNKase uses supplied SWFI and single 5-second IV bolus', () {
    final profile = iv('Tenecteplase');
    expect(profile.calculatorVariants.length, 2);
    expect(profile.calculatorVariants[0].concentration, 5);
    expect(profile.calculatorVariants[1].concentration, 5);
    expect(profile.reconstitution, contains('5.2 mL'));
    expect(profile.reconstitution, contains('10 mL'));
    expect(profile.reconstitution, contains('DO NOT SHAKE'));
    expect(profile.administration, contains('5 seconds'));
    expect(profile.incompatibilities.toLowerCase(), contains('dextrose'));
    expect(profile.incompatibilities, contains('0.9% Sodium Chloride'));
    expect(profile.stability, contains('8 hours'));
  });

  test('naloxone preserves 0.4 mg per mL stock and 4 mcg per mL infusion recipe', () {
    final profile = iv('Naloxone');
    expect(profile.calculatorVariants.single.concentration, 0.4);
    expect(profile.formulation, contains('0.4 mg/mL'));
    expect(profile.furtherDilution, contains('2 mg'));
    expect(profile.furtherDilution, contains('500 mL'));
    expect(profile.furtherDilution, contains('0.004 mg/mL'));
    expect(profile.allowedDiluents, contains('0.9% Sodium Chloride'));
    expect(profile.allowedDiluents, contains('D5W'));
    expect(profile.stability, contains('24 hours'));
    expect(profile.incompatibilities.toLowerCase(), contains('bisulfite'));
  });

  test('flumazenil remains 0.1 mg per mL IV-only with small-dose administration', () {
    final profile = iv('Flumazenil');
    expect(profile.calculatorVariants.single.concentration, 0.1);
    expect(profile.formulation, contains('0.1 mg/mL'));
    expect(profile.allowedDiluents, contains('D5W'));
    expect(profile.allowedDiluents, contains('Lactated Ringer'));
    expect(profile.administration, contains('0.2 mg'));
    expect(profile.administration, contains('15 seconds'));
    expect(profile.stability, contains('24 hours'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('iv use only'));
  });
}
