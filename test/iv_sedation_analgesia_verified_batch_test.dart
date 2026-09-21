import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IvPreparationProfile iv(String name) =>
      findIvPreparationProfile(name, 'General')!;

  test('sedation and analgesia IV batch expands source-locked coverage', () {
    expect(ivPreparationProfiles.length, greaterThanOrEqualTo(62));

    for (final name in <String>[
      'Lorazepam',
      'Ketamine',
      'Propofol',
      'Dexmedetomidine',
      'Fentanyl',
      'Morphine',
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

  test('lorazepam preserves equal-volume IV dilution and stock variants', () {
    final profile = iv('Lorazepam');
    expect(profile.calculatorVariants.length, 2);
    expect(profile.calculatorVariants[0].concentration, 2);
    expect(profile.calculatorVariants[1].concentration, 4);
    expect(profile.reconstitution, contains('MUST be diluted'));
    expect(profile.furtherDilution.toLowerCase(), contains('equal volume'));
    expect(profile.allowedDiluents, contains('Sterile Water'));
    expect(profile.allowedDiluents, contains('0.9% Sodium Chloride'));
    expect(profile.allowedDiluents, contains('5% Dextrose'));
    expect(profile.administration, contains('2 mg/min'));
  });

  test('ketamine 100 mg per mL cannot be used IV without dilution', () {
    final profile = iv('Ketamine');
    expect(profile.calculatorVariants.length, 3);
    expect(profile.calculatorVariants[0].concentration, 10);
    expect(profile.calculatorVariants[1].concentration, 50);
    expect(profile.calculatorVariants[2].concentration, 100);
    expect(profile.reconstitution, contains('100 mg/mL'));
    expect(profile.reconstitution, contains('MUST be diluted'));
    expect(profile.furtherDilution, contains('1 mg/mL'));
    expect(profile.furtherDilution, contains('2 mg/mL'));
    expect(profile.stability.toLowerCase(), contains('immediately'));
  });

  test('propofol remains 10 mg per mL ready to use with 12-hour asepsis lock', () {
    final profile = iv('Propofol');
    expect(profile.calculatorVariants.single.concentration, 10);
    expect(profile.reconstitution.toLowerCase(), contains('ready to use'));
    expect(profile.furtherDilution, contains('D5W'));
    expect(profile.furtherDilution, contains('2 mg/mL'));
    expect(profile.stability, contains('12 hours'));
    expect(profile.incompatibilities.toLowerCase(), contains('do not mix'));
  });

  test('dexmedetomidine separates 100 mcg per mL concentrate from 4 mcg per mL premix', () {
    final profile = iv('Dexmedetomidine');
    expect(profile.calculatorVariants.length, 2);
    expect(profile.calculatorVariants[0].concentration, 100);
    expect(profile.calculatorVariants[1].concentration, 4);
    expect(profile.reconstitution, contains('2 mL'));
    expect(profile.reconstitution, contains('48 mL'));
    expect(profile.resultingConcentration, contains('4 mcg/mL'));
    expect(profile.furtherDilution.toLowerCase(), contains('ready-to-use'));
    expect(profile.incompatibilities.toLowerCase(), contains('blood or plasma'));
  });

  test('fentanyl calculator is mcg-based stock withdrawal only', () {
    final profile = iv('Fentanyl');
    expect(profile.calculatorVariants.single.concentration, 50);
    expect(profile.calculatorVariants.single.unit, 'mcg');
    expect(profile.resultingConcentration, contains('50 mcg/mL'));
    expect(profile.furtherDilution.toLowerCase(), contains('does not establish one universal'));
    expect(profile.administration.toLowerCase(), contains('slow iv'));
    expect(profile.stability.toLowerCase(), contains('protect from light'));
  });

  test('morphine keeps 2 4 and 10 mg per mL presentations distinct', () {
    final profile = iv('Morphine');
    expect(profile.calculatorVariants.length, 3);
    expect(profile.calculatorVariants[0].concentration, 2);
    expect(profile.calculatorVariants[1].concentration, 4);
    expect(profile.calculatorVariants[2].concentration, 10);
    expect(profile.furtherDilution.toLowerCase(), contains('does not define one universal'));
    expect(profile.stability, contains('20–25°C'));
    expect(profile.stability.toLowerCase(), contains('protect from light'));
    expect(profile.stability.toLowerCase(), contains('freezing'));
  });
}
