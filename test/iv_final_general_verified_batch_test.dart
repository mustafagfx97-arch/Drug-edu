import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IvPreparationProfile iv(String name) =>
      findIvPreparationProfile(name, 'General')!;

  test('final general IV batch expands source-locked coverage', () {
    expect(ivPreparationProfiles.length, greaterThanOrEqualTo(86));

    for (final name in <String>[
      'Amoxicillin / Clavulanate IV',
      'Teicoplanin',
      'Sodium phosphate',
      'Metoclopramide',
      'Methylprednisolone',
      'Diazepam',
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

  test('co-amoxiclav exact 1000/200 mg product remains manual calculator', () {
    final profile = iv('Amoxicillin / Clavulanate IV');
    expect(profile.calculatorVariants, isEmpty);
    expect(profile.reconstitution, contains('20 mL'));
    expect(profile.reconstitution, contains('20.9 mL'));
    expect(profile.furtherDilution, contains('100 mL'));
    expect(profile.administration, contains('3–4 minutes'));
    expect(profile.administration, contains('30–40 minutes'));
    expect(profile.stability, contains('20 minutes'));
    expect(profile.incompatibilities.toLowerCase(), contains('aminoglycoside'));
  });

  test('Targocid 400 mg preserves 3.14 mL reconstitution and 3 mL nominal dose', () {
    final profile = iv('Teicoplanin');
    expect(profile.calculatorVariants.single.concentration, closeTo(133.333333, 0.0001));
    expect(profile.reconstitution, contains('3.14 mL'));
    expect(profile.resultingConcentration, contains('3.0 mL'));
    expect(profile.reconstitution.toLowerCase(), contains('15 minutes'));
    expect(profile.administration, contains('3–5 minutes'));
    expect(profile.administration, contains('30-minute infusion'));
    expect(profile.stability, contains('24 hours'));
    expect(profile.incompatibilities.toLowerCase(), contains('aminoglycoside'));
  });

  test('sodium phosphate locks phosphorus and sodium content and mandatory dilution', () {
    final profile = iv('Sodium phosphate');
    expect(profile.calculatorVariants.single.concentration, 3);
    expect(profile.calculatorVariants.single.unit, 'mmol phosphorus');
    expect(profile.formulation, contains('3 mmol/mL'));
    expect(profile.formulation, contains('4 mEq/mL'));
    expect(profile.reconstitution, contains('MUST be diluted'));
    expect(profile.administration.toLowerCase(), contains('only after dilution'));
    expect(profile.criticalLocks.join(' '), contains('4 mEq sodium/mL'));
  });

  test('metoclopramide separates undiluted 10 mg from larger-dose infusion', () {
    final profile = iv('Metoclopramide');
    expect(profile.calculatorVariants.single.concentration, 5);
    expect(profile.formulation, contains('10 mg/2 mL'));
    expect(profile.furtherDilution, contains('greater than 10 mg'));
    expect(profile.furtherDilution, contains('50 mL'));
    expect(profile.administration, contains('1–2 minutes'));
    expect(profile.administration, contains('15 minutes'));
    expect(profile.stability, contains('48 hours'));
    expect(profile.stability, contains('24 hours'));
  });

  test('SOLU-MEDROL preservative-free ACT-O-VIAL variants stay distinct', () {
    final profile = iv('Methylprednisolone');
    expect(profile.calculatorVariants.length, 2);
    expect(profile.calculatorVariants[0].concentration, 40);
    expect(profile.calculatorVariants[1].concentration, 62.5);
    expect(profile.reconstitution, contains('plastic activator'));
    expect(profile.resultingConcentration, contains('40 mg/mL'));
    expect(profile.resultingConcentration, contains('62.5 mg/mL'));
    expect(profile.stability, contains('48 hours'));
    expect(profile.stability, contains('4 hours'));
    expect(profile.stability, contains('24 hours'));
    expect(profile.incompatibilities.toLowerCase(), contains('cow'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('benzyl'));
  });

  test('diazepam prefilled syringe remains undiluted and slow IV', () {
    final profile = iv('Diazepam');
    expect(profile.calculatorVariants.single.concentration, 5);
    expect(profile.reconstitution.toLowerCase(), contains('ready to use'));
    expect(profile.furtherDilution, contains('Do NOT mix or dilute'));
    expect(profile.allowedDiluents, contains('None'));
    expect(profile.administration, contains('1 minute'));
    expect(profile.administration, contains('5 mg'));
    expect(profile.administration.toLowerCase(), contains('small veins'));
    expect(profile.stability.toLowerCase(), contains('protect from light'));
    expect(profile.incompatibilities.toLowerCase(), contains('benzyl alcohol'));
  });
}
