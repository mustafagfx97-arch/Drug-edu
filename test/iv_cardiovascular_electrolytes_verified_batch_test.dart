import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IvPreparationProfile iv(String name) =>
      findIvPreparationProfile(name, 'General')!;

  test('cardiovascular and electrolyte IV batch expands source-locked coverage', () {
    expect(ivPreparationProfiles.length, greaterThanOrEqualTo(50));

    for (final name in <String>[
      'Adenosine',
      'Dobutamine',
      'Nitroglycerin',
      'Esmolol',
      'Sodium bicarbonate 4.2%',
      'Hypertonic sodium chloride 3%',
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

  test('adenosine remains ready-to-use 3 mg per mL rapid-bolus product', () {
    final profile = iv('Adenosine');
    expect(profile.calculatorVariants.single.concentration, 3);
    expect(profile.reconstitution.toLowerCase(), contains('none'));
    expect(profile.administration, contains('1–2 seconds'));
    expect(profile.allowedDiluents.toLowerCase(), contains('saline flush'));
    expect(profile.stability.toLowerCase(), contains('do not refrigerate'));
  });

  test('dobutamine calculator exposes stock only and preserves mandatory dilution', () {
    final profile = iv('Dobutamine');
    expect(profile.calculatorVariants.single.concentration, 12.5);
    expect(profile.reconstitution, contains('MUST be diluted'));
    expect(profile.furtherDilution, contains('at least 50 mL'));
    expect(profile.stability, contains('24 hours'));
    expect(profile.incompatibilities, contains('5% Sodium Bicarbonate'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('stock'));
  });

  test('nitroglycerin 5 mg per mL concentrate cannot be given directly', () {
    final profile = iv('Nitroglycerin');
    expect(profile.calculatorVariants.single.concentration, 5);
    expect(profile.reconstitution, contains('NOT for direct IV injection'));
    expect(profile.allowedDiluents, contains('Dextrose 5%'));
    expect(profile.allowedDiluents, contains('Sodium Chloride 0.9%'));
    expect(profile.furtherDilution, contains('400 mcg/mL'));
    expect(profile.administration.toLowerCase(), contains('non-pvc'));
    expect(profile.incompatibilities.toLowerCase(), contains('glass'));
  });

  test('esmolol distinguishes 10 and 20 mg per mL ready-to-use presentations', () {
    final profile = iv('Esmolol');
    expect(profile.calculatorVariants.length, 3);
    expect(profile.calculatorVariants[0].concentration, 10);
    expect(profile.calculatorVariants[1].concentration, 10);
    expect(profile.calculatorVariants[2].concentration, 20);
    expect(profile.reconstitution.toLowerCase(), contains('ready to use'));
    expect(profile.incompatibilities, contains('Sodium Bicarbonate 5%'));
    expect(profile.incompatibilities.toLowerCase(), contains('furosemide'));
    expect(profile.stability, contains('24 hours'));
  });

  test('sodium bicarbonate 4.2 percent stays separate from 8.4 percent', () {
    final profile = iv('Sodium bicarbonate 4.2%');
    expect(profile.calculatorVariants.single.concentration, 0.5);
    expect(profile.formulation, contains('0.5 mEq/mL'));
    expect(profile.resultingConcentration, contains('0.5 mEq/mL'));
    expect(profile.criticalLocks.join(' '), contains('8.4%'));
    expect(profile.incompatibilities.toLowerCase(), contains('dobutamine'));
    expect(profile.incompatibilities.toLowerCase(), contains('calcium'));
  });

  test('3 percent saline remains ready-to-use and does not invent a treatment rate', () {
    final profile = iv('Hypertonic sodium chloride 3%');
    expect(profile.calculatorVariants.single.concentration, closeTo(0.513, 0.0001));
    expect(profile.reconstitution.toLowerCase(), contains('ready to use'));
    expect(profile.resultingConcentration, contains('513 mEq/L'));
    expect(profile.resultingConcentration, contains('0.513 mEq/mL'));
    expect(profile.administration.toLowerCase(), contains('indication-specific'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('must not select'));
    expect(profile.incompatibilities.toLowerCase(), contains('series connection'));
  });
}
