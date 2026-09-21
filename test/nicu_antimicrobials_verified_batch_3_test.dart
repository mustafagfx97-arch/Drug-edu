import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IvPreparationProfile nicu(String name) =>
      findIvPreparationProfile(name, 'NICU')!;

  test('third NICU antimicrobial batch expands source-locked coverage', () {
    expect(ivPreparationProfiles.length, greaterThanOrEqualTo(105));

    for (final name in <String>[
      'Benzylpenicillin',
      'Ceftazidime',
      'Cefepime',
      'Meropenem',
      'Vancomycin intermittent',
      'Piperacillin / Tazobactam',
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

  test('NICU benzylpenicillin remains manual because label permits reconstitution range', () {
    final profile = nicu('Benzylpenicillin');
    expect(profile.calculatorVariants, isEmpty);
    expect(profile.formulation, contains('600 mg'));
    expect(profile.reconstitution, contains('4–10 mL'));
    expect(profile.reconstitution, contains('at least 10 mL'));
    expect(profile.resultingConcentration.toLowerCase(), contains('no single'));
    expect(profile.allowedDiluents, contains('Water for Injection'));
    expect(profile.allowedDiluents, contains('0.9% Sodium Chloride'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('manual calculator'));
  });

  test('NICU ceftazidime preserves 1 g and 2 g vial concentrations', () {
    final profile = nicu('Ceftazidime');
    expect(profile.calculatorVariants.length, 2);
    expect(profile.calculatorVariants[0].concentration, 100);
    expect(profile.calculatorVariants[1].concentration, 170);
    expect(profile.reconstitution, contains('10 mL'));
    expect(profile.administration, contains('3–5 minutes'));
    expect(profile.incompatibilities.toLowerCase(), contains('aminoglycoside'));
  });

  test('NICU cefepime keeps vial-specific stocks and final infusion range', () {
    final profile = nicu('Cefepime');
    expect(profile.calculatorVariants.length, 2);
    expect(profile.calculatorVariants[0].concentration, 100);
    expect(profile.calculatorVariants[1].concentration, 160);
    expect(profile.furtherDilution, contains('1–40 mg/mL'));
    expect(profile.administration, contains('30 minutes'));
    expect(profile.stability, contains('24 hours'));
    expect(profile.stability, contains('7 days'));
    expect(profile.incompatibilities.toLowerCase(), contains('vancomycin'));
  });

  test('NICU meropenem keeps 50 mg per mL vial concentration and diluent-specific stability', () {
    final profile = nicu('Meropenem');
    expect(profile.calculatorVariants.length, 2);
    expect(profile.calculatorVariants[0].concentration, 50);
    expect(profile.calculatorVariants[1].concentration, 50);
    expect(profile.reconstitution, contains('500 mg'));
    expect(profile.reconstitution, contains('1 g'));
    expect(profile.furtherDilution, contains('1–20 mg/mL'));
    expect(profile.administration, contains('15–30 minutes'));
    expect(profile.stability, contains('3 hours'));
    expect(profile.stability, contains('13 hours'));
    expect(profile.stability, contains('use immediately'));
  });

  test('NICU vancomycin requires further dilution and at least 60 minute infusion', () {
    final profile = nicu('Vancomycin intermittent');
    expect(profile.calculatorVariants.single.concentration, 50);
    expect(profile.reconstitution, contains('500 mg'));
    expect(profile.reconstitution, contains('1 g'));
    expect(profile.furtherDilution, contains('5 mg/mL'));
    expect(profile.furtherDilution, contains('10 mg/mL'));
    expect(profile.administration, contains('60 minutes'));
    expect(profile.incompatibilities.toLowerCase(), contains('beta-lactam'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('tdm'));
  });

  test('NICU piperacillin tazobactam locks component concentrations and stays manual', () {
    final profile = nicu('Piperacillin / Tazobactam');
    expect(profile.calculatorVariants, isEmpty);
    expect(profile.reconstitution, contains('2.25 g'));
    expect(profile.reconstitution, contains('3.375 g'));
    expect(profile.reconstitution, contains('4.5 g'));
    expect(profile.resultingConcentration, contains('202.5 mg/mL'));
    expect(profile.resultingConcentration, contains('180 mg/mL piperacillin'));
    expect(profile.resultingConcentration, contains('22.5 mg/mL tazobactam'));
    expect(profile.furtherDilution, contains('20–80 mg/mL'));
    expect(profile.administration, contains('30 minutes'));
    expect(profile.administration, contains('2 months'));
    expect(profile.incompatibilities.toLowerCase(), contains('lactated ringer'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('manual calculator'));
  });
}
