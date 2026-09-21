import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IvPreparationProfile nicu(String name) =>
      findIvPreparationProfile(name, 'NICU')!;

  test('second NICU batch expands source-locked coverage', () {
    expect(ivPreparationProfiles.length, greaterThanOrEqualTo(99));

    for (final name in <String>[
      'Insulin',
      'Heparin',
      'Ampicillin',
      'Gentamicin',
      'Amikacin',
      'Cefotaxime',
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

  test('NICU insulin separates U-100 stock from S4S 0.2 and 1 unit per mL', () {
    final profile = nicu('Insulin');
    expect(profile.calculatorVariants.single.concentration, 100);
    expect(profile.calculatorVariants.single.unit, 'units');
    expect(profile.formulation, contains('U-100'));
    expect(profile.resultingConcentration, contains('0.2 unit/mL'));
    expect(profile.resultingConcentration, contains('1 unit/mL'));
    expect(profile.allowedDiluents, contains('0.9% Sodium Chloride'));
    expect(profile.criticalLocks.join(' '), contains('U-500'));
    expect(profile.criticalLocks.join(' '), contains('U-10/U-50'));
  });

  test('NICU therapeutic heparin stays preservative free and distinct from line maintenance', () {
    final profile = nicu('Heparin');
    expect(profile.calculatorVariants.single.concentration, 1000);
    expect(profile.calculatorVariants.single.unit, 'units');
    expect(profile.formulation.toLowerCase(), contains('preservative-free'));
    expect(profile.resultingConcentration, contains('50 units/mL'));
    expect(profile.resultingConcentration, contains('100 units/mL'));
    expect(profile.furtherDilution, contains('0.5 units/mL'));
    expect(profile.furtherDilution.toLowerCase(), contains('different indication'));
    expect(profile.incompatibilities.toLowerCase(), contains('benzyl'));
  });

  test('NICU ampicillin remains manual and blocks bacteriostatic water in newborns', () {
    final profile = nicu('Ampicillin');
    expect(profile.calculatorVariants, isEmpty);
    expect(profile.formulation, contains('125 mg'));
    expect(profile.reconstitution, contains('5 mL'));
    expect(profile.reconstitution, contains('Sterile Water'));
    expect(profile.reconstitution, contains('MUST NOT'));
    expect(profile.resultingConcentration.toLowerCase(), contains('manual'));
    expect(profile.furtherDilution, contains('250 mg/mL'));
    expect(profile.administration, contains('3–5 minutes'));
  });

  test('NICU gentamicin uses pediatric preservative-free 10 mg per mL product', () {
    final profile = nicu('Gentamicin');
    expect(profile.calculatorVariants.single.concentration, 10);
    expect(profile.formulation, contains('PEDIATRIC'));
    expect(profile.formulation.toLowerCase(), contains('preservative-free'));
    expect(profile.reconstitution, contains('MUST be diluted'));
    expect(profile.allowedDiluents, contains('0.9% Sodium Chloride'));
    expect(profile.allowedDiluents, contains('D5W'));
    expect(profile.administration, contains('30 minutes to 2 hours'));
    expect(profile.criticalLocks.join(' '), contains('40 mg/mL'));
  });

  test('NICU amikacin keeps 250 mg per mL stock and infant 1 to 2 hour infusion', () {
    final profile = nicu('Amikacin');
    expect(profile.calculatorVariants.single.concentration, 250);
    expect(profile.resultingConcentration, contains('0.25–5 mg/mL'));
    expect(profile.administration, contains('1–2 hours'));
    expect(profile.stability, contains('24 hours'));
    expect(profile.furtherDilution.toLowerCase(), contains('do not copy'));
    expect(profile.incompatibilities.toLowerCase(), contains('do not physically premix'));
  });

  test('NICU cefotaxime preserves vial-specific concentrations and aminoglycoside lock', () {
    final profile = nicu('Cefotaxime');
    expect(profile.calculatorVariants.length, 3);
    expect(profile.calculatorVariants[0].concentration, 50);
    expect(profile.calculatorVariants[1].concentration, 95);
    expect(profile.calculatorVariants[2].concentration, 180);
    expect(profile.reconstitution, contains('10 mL'));
    expect(profile.administration, contains('3–5 minutes'));
    expect(profile.incompatibilities.toLowerCase(), contains('aminoglycoside'));
    expect(profile.incompatibilities.toLowerCase(), contains('sodium bicarbonate'));
  });
}
