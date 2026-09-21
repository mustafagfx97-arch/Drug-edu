import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IvPreparationProfile nicu(String name) =>
      findIvPreparationProfile(name, 'NICU')!;

  test('fourth NICU cardiac and neuro batch expands source-locked coverage', () {
    expect(ivPreparationProfiles.length, greaterThanOrEqualTo(111));

    for (final name in <String>[
      'Digoxin',
      'Adenosine',
      'Sildenafil IV',
      'Hydrocortisone',
      'Phenobarbital',
      'Levetiracetam',
    ]) {
      final profile = findIvPreparationProfile(name, 'NICU');
      expect(profile, isNotNull, reason: name);
      expect(profile!.sourceLabel.trim(), isNotEmpty, reason: name);

      final catalog = ivMedicationCatalog.firstWhere(
        (entry) => entry.name == name && entry.population == 'NICU',
      );
      expect(catalog.structured, isTrue, reason: name);
    }
  });

  test('NICU digoxin uses pediatric 100 mcg per mL product', () {
    final profile = nicu('Digoxin');
    expect(profile.calculatorVariants.single.concentration, 100);
    expect(profile.calculatorVariants.single.unit, 'mcg');
    expect(profile.formulation, contains('Injection Pediatric'));
    expect(profile.formulation, contains('100 mcg/mL'));
    expect(profile.furtherDilution, contains('4-fold'));
    expect(profile.administration, contains('5 minutes'));
    expect(profile.criticalLocks.join(' '), contains('250 mcg/mL'));
  });

  test('NICU adenosine remains ready-to-use rapid bolus with saline flush', () {
    final profile = nicu('Adenosine');
    expect(profile.calculatorVariants.single.concentration, 3);
    expect(profile.reconstitution.toLowerCase(), contains('ready to use'));
    expect(profile.furtherDilution.toLowerCase(), contains('no routine dilution'));
    expect(profile.administration, contains('0.05–0.1 mg/kg'));
    expect(profile.administration, contains('0.3 mg/kg'));
    expect(profile.allowedDiluents.toLowerCase(), contains('saline'));
    expect(profile.stability.toLowerCase(), contains('do not refrigerate'));
  });

  test('NICU sildenafil is exact ready-to-use Revatio 0.8 mg per mL with age lock', () {
    final profile = nicu('Sildenafil IV');
    expect(profile.calculatorVariants.single.concentration, 0.8);
    expect(profile.formulation, contains('REVATIO'));
    expect(profile.formulation, contains('10 mg/12.5 mL'));
    expect(profile.reconstitution.toLowerCase(), contains('ready to use'));
    expect(profile.furtherDilution.toLowerCase(), contains('no routine dilution'));
    expect(profile.administration.toLowerCase(), contains('1 year'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('neonatal'));
  });

  test('NICU hydrocortisone uses preservative-free 100 mg plain vial and SWFI', () {
    final profile = nicu('Hydrocortisone');
    expect(profile.calculatorVariants.single.concentration, 50);
    expect(profile.formulation.toLowerCase(), contains('preservative-free'));
    expect(profile.reconstitution, contains('2 mL'));
    expect(profile.reconstitution, contains('Sterile Water'));
    expect(profile.resultingConcentration, contains('50 mg/mL'));
    expect(profile.incompatibilities.toLowerCase(), contains('bacteriostatic'));
    expect(profile.stability, contains('4 hours'));
    expect(profile.stability, contains('12 hours'));
    expect(profile.stability, contains('24 hours'));
  });

  test('NICU phenobarbital uses FDA-approved SEZABY neonatal formulation', () {
    final profile = nicu('Phenobarbital');
    expect(profile.calculatorVariants.single.concentration, 10);
    expect(profile.formulation, contains('SEZABY'));
    expect(profile.formulation.toLowerCase(), contains('neonatal seizures'));
    expect(profile.reconstitution, contains('10 mL'));
    expect(profile.allowedDiluents, contains('0.9% Sodium Chloride'));
    expect(profile.resultingConcentration, contains('10 mg/mL'));
    expect(profile.administration, contains('15 minutes'));
    expect(profile.stability, contains('8 hours'));
    expect(profile.stability, contains('24 hours'));
    expect(profile.incompatibilities.toLowerCase(), contains('no benzyl alcohol'));
  });

  test('NICU levetiracetam preserves max 15 mg per mL and current 4 hour stability', () {
    final profile = nicu('Levetiracetam');
    expect(profile.calculatorVariants.single.concentration, 100);
    expect(profile.resultingConcentration, contains('100 mg/mL'));
    expect(profile.furtherDilution, contains('15 mg/mL'));
    expect(profile.allowedDiluents, contains('0.9% Sodium Chloride'));
    expect(profile.allowedDiluents, contains('Lactated Ringer'));
    expect(profile.allowedDiluents, contains('D5W'));
    expect(profile.administration, contains('15-minute'));
    expect(profile.administration, contains('1 month'));
    expect(profile.stability, contains('4 hours'));
  });
}
