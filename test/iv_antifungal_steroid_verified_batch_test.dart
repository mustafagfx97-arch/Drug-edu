import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IvPreparationProfile iv(String name) =>
      findIvPreparationProfile(name, 'General')!;

  test('antifungal and steroid IV batch expands source-locked coverage', () {
    expect(ivPreparationProfiles.length, greaterThanOrEqualTo(80));

    for (final name in <String>[
      'Colistimethate / Colistin',
      'Tigecycline',
      'Amphotericin B liposomal',
      'Amphotericin B conventional',
      'Dexamethasone',
      'Hydrocortisone',
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

  test('colistimethate locks CBA units and 75 mg per mL reconstitution', () {
    final profile = iv('Colistimethate / Colistin');
    expect(profile.calculatorVariants.single.concentration, 75);
    expect(profile.calculatorVariants.single.unit, 'mg CBA');
    expect(profile.reconstitution, contains('2 mL'));
    expect(profile.resultingConcentration, contains('75 mg/mL'));
    expect(profile.reconstitution.toLowerCase(), contains('swirl gently'));
    expect(profile.administration, contains('3–5 minutes'));
    expect(profile.administration, contains('22–23 hours'));
    expect(profile.stability, contains('24 hours'));
  });

  test('tigecycline preserves 5.3 mL overage step and mandatory bag dilution', () {
    final profile = iv('Tigecycline');
    expect(profile.calculatorVariants.single.concentration, 10);
    expect(profile.reconstitution, contains('5.3 mL'));
    expect(profile.reconstitution, contains('5 mL'));
    expect(profile.resultingConcentration, contains('10 mg/mL'));
    expect(profile.furtherDilution, contains('100 mL'));
    expect(profile.furtherDilution, contains('1 mg/mL'));
    expect(profile.administration, contains('30–60 minutes'));
    expect(profile.stability, contains('24 hours'));
    expect(profile.stability, contains('48 hours'));
    expect(profile.incompatibilities, contains('amphotericin B'));
    expect(profile.incompatibilities, contains('omeprazole'));
  });

  test('liposomal amphotericin stays separate and uses 12 mL SWFI plus D5W', () {
    final profile = iv('Amphotericin B liposomal');
    expect(profile.calculatorVariants.single.concentration, 4);
    expect(profile.reconstitution, contains('12 mL'));
    expect(profile.reconstitution, contains('30 seconds'));
    expect(profile.allowedDiluents, contains('SWFI only'));
    expect(profile.allowedDiluents, contains('D5W only'));
    expect(profile.furtherDilution, contains('5-micron'));
    expect(profile.furtherDilution, contains('1–2 mg/mL'));
    expect(profile.administration, contains('120 minutes'));
    expect(profile.stability, contains('24 hours'));
    expect(profile.stability, contains('6 hours'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('not interchangeable'));
  });

  test('conventional amphotericin uses 10 mL SWFI and 0.1 mg per mL D5W infusion', () {
    final profile = iv('Amphotericin B conventional');
    expect(profile.calculatorVariants.single.concentration, 5);
    expect(profile.reconstitution, contains('10 mL'));
    expect(profile.resultingConcentration, contains('5 mg/mL'));
    expect(profile.furtherDilution, contains('1:50'));
    expect(profile.furtherDilution, contains('0.1 mg/mL'));
    expect(profile.allowedDiluents, contains('pH >4.2'));
    expect(profile.administration, contains('2–6 hours'));
    expect(profile.stability, contains('1 week'));
    expect(profile.incompatibilities.toLowerCase(), contains('saline'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('not interchangeable'));
  });

  test('dexamethasone keeps 4 and 10 mg per mL products distinct', () {
    final profile = iv('Dexamethasone');
    expect(profile.calculatorVariants.length, 2);
    expect(profile.calculatorVariants[0].concentration, 4);
    expect(profile.calculatorVariants[1].concentration, 10);
    expect(profile.reconstitution.toLowerCase(), contains('none'));
    expect(profile.furtherDilution.toLowerCase(), contains('not mandatory'));
    expect(profile.allowedDiluents, contains('Sodium Chloride'));
    expect(profile.allowedDiluents, contains('Dextrose'));
    expect(profile.stability, contains('24 hours'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('neonatal'));
  });

  test('SOLU-CORTEF ACT-O-VIAL variants remain exact and distinct', () {
    final profile = iv('Hydrocortisone');
    expect(profile.calculatorVariants.length, 2);
    expect(profile.calculatorVariants[0].concentration, 50);
    expect(profile.calculatorVariants[1].concentration, 125);
    expect(profile.reconstitution, contains('plastic activator'));
    expect(profile.reconstitution, contains('Water for Injection'));
    expect(profile.resultingConcentration, contains('100 mg/2 mL'));
    expect(profile.resultingConcentration, contains('1,000 mg/8 mL'));
    expect(profile.furtherDilution.toLowerCase(), contains('not necessary'));
    expect(profile.administration, contains('30 seconds'));
    expect(profile.administration, contains('10 minutes'));
    expect(profile.stability, contains('4 hours'));
    expect(profile.criticalLocks.join(' '), contains('plain 100 mg vial'));
  });
}
