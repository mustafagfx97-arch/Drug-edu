import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IvPreparationProfile picu(String name) =>
      findIvPreparationProfile(name, 'PICU')!;

  test('second PICU batch completes representative source-locked coverage', () {
    expect(ivPreparationProfiles.length, greaterThanOrEqualTo(133));

    for (final name in <String>[
      'Midazolam',
      'Dexmedetomidine',
      'Ketamine',
      'Regular insulin infusion',
      'Heparin',
    ]) {
      final profile = findIvPreparationProfile(name, 'PICU');
      expect(profile, isNotNull, reason: name);
      expect(profile!.sourceLabel, contains('ASHP Standardize 4 Safety'));

      final catalog = ivMedicationCatalog.firstWhere(
        (entry) => entry.name == name && entry.population == 'PICU',
      );
      expect(catalog.structured, isTrue, reason: name);
    }

    final remaining = ivMedicationCatalog
        .where((entry) => entry.population == 'PICU' && !entry.structured)
        .toList();
    expect(remaining, isEmpty);
  });

  test('PICU midazolam locks preservative-free stock and three S4S standards', () {
    final profile = picu('Midazolam');
    expect(profile.formulation.toLowerCase(), contains('preservative-free'));
    expect(profile.resultingConcentration, contains('0.3'));
    expect(profile.resultingConcentration, contains('1'));
    expect(profile.resultingConcentration, contains('5 mg/mL'));
    expect(
      profile.calculatorVariants.map((variant) => variant.concentration).toSet(),
      <double>{1, 5},
    );
    expect(profile.allowedDiluents, contains('0.9% Sodium Chloride'));
    expect(profile.allowedDiluents, contains('5% Dextrose'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('benzyl-alcohol'));
  });

  test('PICU dexmedetomidine enforces labeled 100 to 4 mcg per mL dilution', () {
    final profile = picu('Dexmedetomidine');
    expect(profile.calculatorVariants.single.concentration, 100);
    expect(profile.calculatorVariants.single.unit, 'mcg');
    expect(profile.reconstitution, contains('2 mL'));
    expect(profile.reconstitution, contains('48 mL'));
    expect(profile.resultingConcentration, contains('4 mcg/mL'));
    expect(profile.furtherDilution, contains('Mandatory'));
    expect(profile.allowedDiluents, contains('0.9% Sodium Chloride'));
    expect(profile.incompatibilities, contains('amphotericin B'));
    expect(profile.incompatibilities, contains('diazepam'));
  });

  test('PICU ketamine separates stock strengths from 2 and 10 mg per mL standards', () {
    final profile = picu('Ketamine');
    expect(profile.resultingConcentration, contains('2 or 10 mg/mL'));
    expect(
      profile.calculatorVariants.map((variant) => variant.concentration).toSet(),
      <double>{10, 50, 100},
    );
    expect(profile.furtherDilution, contains('250 mL'));
    expect(profile.allowedDiluents, contains('5% Dextrose'));
    expect(profile.allowedDiluents, contains('0.9% Sodium Chloride'));
    expect(profile.criticalLocks.join(' '), contains('100 mg/mL MUST be diluted'));
    expect(profile.stability.toLowerCase(), contains('immediate use'));
  });

  test('PICU regular insulin locks U-100 stock and S4S 0.2 and 1 unit per mL', () {
    final profile = picu('Regular insulin infusion');
    expect(profile.calculatorVariants.single.concentration, 100);
    expect(profile.calculatorVariants.single.unit, 'units');
    expect(profile.formulation, contains('HUMULIN R U-100'));
    expect(profile.resultingConcentration, contains('0.2'));
    expect(profile.resultingConcentration, contains('1 unit/mL'));
    expect(profile.allowedDiluents, contains('0.9% Sodium Chloride'));
    expect(profile.stability, contains('48 hours'));
    expect(profile.criticalLocks.join(' '), contains('U-500'));
  });

  test('PICU heparin uses ready-to-use 50 and 100 unit per mL premixes', () {
    final profile = picu('Heparin');
    expect(profile.formulation, contains('0.45% Sodium Chloride'));
    expect(profile.resultingConcentration, contains('50 units/mL'));
    expect(profile.resultingConcentration, contains('100 units/mL'));
    expect(
      profile.calculatorVariants.map((variant) => variant.concentration).toSet(),
      <double>{50, 100},
    );
    expect(profile.reconstitution, contains('ready-to-use'));
    expect(profile.furtherDilution, contains('None'));
    expect(profile.allowedDiluents, contains('Do not make additives'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('catheter-lock'));
  });
}
