import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IvPreparationProfile nicu(String name) =>
      findIvPreparationProfile(name, 'NICU')!;

  test('fifth NICU electrolyte batch reaches 116 source-locked profiles', () {
    expect(ivPreparationProfiles.length, 116);

    for (final name in <String>[
      'Dexamethasone',
      'Calcium gluconate',
      'Calcium chloride',
      'Magnesium sulfate',
      'Sodium bicarbonate',
    ]) {
      final profile = findIvPreparationProfile(name, 'NICU');
      expect(profile, isNotNull, reason: name);
      expect(profile!.sourceLabel.trim(), isNotEmpty, reason: name);

      final catalog = ivMedicationCatalog.firstWhere(
        (entry) => entry.name == name && entry.population == 'NICU',
      );
      expect(catalog.structured, isTrue, reason: name);
    }

    final remaining = ivMedicationCatalog
        .where((entry) => entry.population == 'NICU' && !entry.structured)
        .map((entry) => entry.name)
        .toList();

    expect(
      remaining,
      <String>[
        'Dextrose D10',
        'Dextrose D12.5',
        'Dextrose D20',
        'Dextrose D25',
        'Hypertonic sodium chloride',
        'Phosphate',
      ],
    );
  });

  test('NICU dexamethasone is preservative-free 10 mg per mL only', () {
    final profile = nicu('Dexamethasone');
    expect(profile.calculatorVariants.single.concentration, 10);
    expect(profile.formulation.toLowerCase(), contains('preservative-free'));
    expect(profile.formulation, contains('10 mg/mL'));
    expect(profile.formulation, contains('single-dose'));
    expect(profile.furtherDilution.toLowerCase(), contains('does not provide a neonatal dilution recipe'));
    expect(profile.allowedDiluents.toLowerCase(), contains('no universal neonatal diluent'));
    expect(profile.criticalLocks.join(' '), contains('not a 4 mg/mL'));
  });

  test('NICU calcium gluconate preserves elemental-unit and dilution locks', () {
    final profile = nicu('Calcium gluconate');
    expect(profile.calculatorVariants.single.concentration, 100);
    expect(profile.calculatorVariants.single.unit, 'mg calcium gluconate');
    expect(profile.formulation, contains('9.3 mg elemental calcium'));
    expect(profile.formulation, contains('0.465 mEq'));
    expect(profile.furtherDilution, contains('10–50 mg/mL'));
    expect(profile.furtherDilution, contains('5.8–10 mg/mL'));
    expect(profile.allowedDiluents, contains('5% Dextrose'));
    expect(profile.allowedDiluents, contains('0.9% Sodium Chloride'));
    expect(profile.administration, contains('100 mg/minute'));
    expect(profile.stability.toLowerCase(), contains('immediately'));
    expect(profile.incompatibilities.toLowerCase(), contains('phosphate'));
    expect(profile.incompatibilities.toLowerCase(), contains('bicarbonate'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('ceftriaxone'));
  });

  test('NICU calcium chloride remains manual with strict salt-unit locks', () {
    final profile = nicu('Calcium chloride');
    expect(profile.calculatorVariants, isEmpty);
    expect(profile.formulation, contains('100 mg/mL'));
    expect(profile.resultingConcentration, contains('27 mg/mL elemental calcium'));
    expect(profile.resultingConcentration, contains('1.4 mEq/mL'));
    expect(profile.furtherDilution.toLowerCase(), contains('manual'));
    expect(profile.administration.toLowerCase(), contains('central or deep vein'));
    expect(profile.administration, contains('1 mL/minute'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('not interchangeable'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('calculator lock'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('ceftriaxone'));
  });

  test('NICU magnesium sulfate is preservative-free 50 percent and must be diluted', () {
    final profile = nicu('Magnesium sulfate');
    expect(profile.calculatorVariants.single.concentration, 0.5);
    expect(profile.calculatorVariants.single.unit, 'g');
    expect(profile.formulation.toLowerCase(), contains('preservative-free'));
    expect(profile.formulation, contains('500 mg/mL'));
    expect(profile.resultingConcentration, contains('200 mg/mL'));
    expect(profile.furtherDilution.toLowerCase(), contains('mandatory'));
    expect(profile.furtherDilution, contains('20% or less'));
    expect(profile.allowedDiluents, contains('5% Dextrose'));
    expect(profile.allowedDiluents, contains('0.9% Sodium Chloride'));
    expect(profile.administration, contains('150 mg/minute'));
  });

  test('NICU sodium bicarbonate is exact 4.2 percent 0.5 mEq per mL product', () {
    final profile = nicu('Sodium bicarbonate');
    expect(profile.calculatorVariants.single.concentration, 0.5);
    expect(profile.calculatorVariants.single.unit, 'mEq');
    expect(profile.formulation, contains('4.2%'));
    expect(profile.formulation, contains('0.5 mEq/mL'));
    expect(profile.formulation.toLowerCase(), contains('no bacteriostat'));
    expect(profile.administration.toLowerCase(), contains('neonates'));
    expect(profile.administration.toLowerCase(), contains('intracranial hemorrhage'));
    expect(profile.criticalLocks.join(' '), contains('8.4% = 1 mEq/mL'));
    expect(profile.incompatibilities.toLowerCase(), contains('norepinephrine'));
    expect(profile.incompatibilities.toLowerCase(), contains('dobutamine'));
    expect(profile.incompatibilities.toLowerCase(), contains('calcium'));
  });
}
