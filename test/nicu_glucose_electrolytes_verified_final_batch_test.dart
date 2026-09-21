import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IvPreparationProfile nicu(String name) =>
      findIvPreparationProfile(name, 'NICU')!;

  test('final NICU glucose and electrolyte batch source-locks all remaining entries', () {
    expect(ivPreparationProfiles.length, 122);

    for (final name in <String>[
      'Dextrose D10',
      'Dextrose D12.5',
      'Dextrose D20',
      'Dextrose D25',
      'Hypertonic sodium chloride',
      'Phosphate',
    ]) {
      final profile = findIvPreparationProfile(name, 'NICU');
      expect(profile, isNotNull, reason: name);
      expect(profile!.sourceLabel.trim(), isNotEmpty, reason: name);

      final catalog = ivMedicationCatalog.firstWhere(
        (entry) => entry.name == name && entry.population == 'NICU',
      );
      expect(catalog.structured, isTrue, reason: name);
    }

    expect(
      ivMedicationCatalog
          .where((entry) => entry.population == 'NICU' && !entry.structured),
      isEmpty,
    );
  });

  test('NICU D10 is exact ready 10 percent product and does not select GIR', () {
    final profile = nicu('Dextrose D10');
    expect(profile.calculatorVariants.single.concentration, 0.1);
    expect(profile.calculatorVariants.single.unit, 'g dextrose');
    expect(profile.formulation, contains('Baxter'));
    expect(profile.formulation, contains('100 mg/mL'));
    expect(profile.reconstitution.toLowerCase(), contains('ready'));
    expect(profile.administration.toLowerCase(), contains('infusion rate'));
    expect(profile.criticalLocks.join(' '), contains('GIR'));
  });

  test('NICU D12.5 remains manual pharmacy compounding with no generic recipe', () {
    final profile = nicu('Dextrose D12.5');
    expect(profile.calculatorVariants, isEmpty);
    expect(profile.resultingConcentration, contains('125 mg/mL'));
    expect(profile.formulation, contains('70% Dextrose Injection Pharmacy Bulk Package'));
    expect(profile.furtherDilution.toLowerCase(), contains('manual compounding only'));
    expect(profile.furtherDilution.toLowerCase(), contains('does not provide a universal'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('not for direct infusion'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('calculator lock'));
  });

  test('NICU D20 remains manual pharmacy compounding and source bulk is not direct infusion', () {
    final profile = nicu('Dextrose D20');
    expect(profile.calculatorVariants, isEmpty);
    expect(profile.resultingConcentration, contains('200 mg/mL'));
    expect(profile.formulation, contains('70% Dextrose Injection Pharmacy Bulk Package'));
    expect(profile.furtherDilution.toLowerCase(), contains('manual compounding only'));
    expect(profile.administration.toLowerCase(), contains('hypertonic'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('not for direct infusion'));
  });

  test('NICU D25 uses current pediatric single-dose syringe with central slow IV lock', () {
    final profile = nicu('Dextrose D25');
    expect(profile.calculatorVariants.single.concentration, 0.25);
    expect(profile.calculatorVariants.single.unit, 'g dextrose');
    expect(profile.formulation, contains('Hospira'));
    expect(profile.formulation, contains('250 mg/mL'));
    expect(profile.formulation.toLowerCase(), contains('birth'));
    expect(profile.administration.toLowerCase(), contains('central vein'));
    expect(profile.administration.toLowerCase(), contains('slow'));
    expect(profile.administration.toLowerCase(), contains('low-birth-weight'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('no im or sc'));
  });

  test('NICU hypertonic sodium chloride is ready 3 percent and does not choose correction rate', () {
    final profile = nicu('Hypertonic sodium chloride');
    expect(profile.calculatorVariants.single.concentration, 0.513);
    expect(profile.calculatorVariants.single.unit, 'mEq sodium');
    expect(profile.formulation, contains('3% Sodium Chloride'));
    expect(profile.resultingConcentration, contains('0.513 mEq/mL'));
    expect(profile.resultingConcentration, contains('1030 mOsm/L'));
    expect(profile.furtherDilution.toLowerCase(), contains('no routine dilution'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('never chooses the correction regimen'));
  });

  test('NICU phosphate forces explicit sodium versus potassium salt selection', () {
    final profile = nicu('Phosphate');
    expect(profile.calculatorVariants, hasLength(2));

    final sodium = profile.calculatorVariants
        .firstWhere((variant) => variant.id.contains('sodium'));
    final potassium = profile.calculatorVariants
        .firstWhere((variant) => variant.id.contains('potassium'));

    expect(sodium.concentration, 3);
    expect(sodium.note, contains('4 mEq sodium'));
    expect(potassium.concentration, 3);
    expect(potassium.note, contains('4.4 mEq potassium'));
    expect(profile.furtherDilution.toLowerCase(), contains('mandatory'));
    expect(profile.incompatibilities.toLowerCase(), contains('calcium-phosphate'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('salt-selection lock'));
  });
}
