import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IvPreparationProfile iv(String name) =>
      findIvPreparationProfile(name, 'General')!;

  test('antidote and antiviral IV batch expands source-locked coverage', () {
    expect(ivPreparationProfiles.length, greaterThanOrEqualTo(74));

    for (final name in <String>[
      'Atropine',
      'N-acetylcysteine IV',
      'Mannitol',
      'Ganciclovir',
      'Protamine',
      'Digoxin immune Fab',
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

  test('atropine keeps pediatric 0.05 and general 0.1 mg per mL syringes distinct', () {
    final profile = iv('Atropine');
    expect(profile.calculatorVariants.length, 2);
    expect(profile.calculatorVariants[0].concentration, 0.05);
    expect(profile.calculatorVariants[1].concentration, 0.1);
    expect(profile.reconstitution.toLowerCase(), contains('ready to use'));
    expect(profile.furtherDilution.toLowerCase(), contains('no routine dilution'));
    expect(profile.stability, contains('20–25°C'));
  });

  test('IV acetylcysteine remains 200 mg per mL stock with mandatory dilution', () {
    final profile = iv('N-acetylcysteine IV');
    expect(profile.calculatorVariants.single.concentration, 200);
    expect(profile.reconstitution, contains('MUST be further diluted'));
    expect(profile.allowedDiluents, contains('Sterile Water'));
    expect(profile.allowedDiluents, contains('0.45% Sodium Chloride'));
    expect(profile.allowedDiluents, contains('D5W'));
    expect(profile.furtherDilution, contains('three-bag'));
    expect(profile.furtherDilution, contains('two-bag'));
    expect(profile.furtherDilution, contains('200 mg/kg'));
    expect(profile.administration, contains('21-hour'));
    expect(profile.administration, contains('20-hour'));
    expect(profile.stability, contains('24 hours'));
  });

  test('mannitol 20 percent keeps filter and crystal handling locks', () {
    final profile = iv('Mannitol');
    expect(profile.calculatorVariants.single.concentration, closeTo(0.2, 0.0001));
    expect(profile.calculatorVariants.single.unit, 'g');
    expect(profile.resultingConcentration, contains('0.2 g/mL'));
    expect(profile.administration.toLowerCase(), contains('final in-line filter'));
    expect(profile.stability, contains('70°C'));
    expect(profile.stability.toLowerCase(), contains('dry-heat'));
    expect(profile.stability.toLowerCase(), contains('water bath'));
    expect(profile.incompatibilities.toLowerCase(), contains('blood products'));
    expect(profile.incompatibilities.toLowerCase(), contains('series'));
  });

  test('ganciclovir 500 mg vial yields 50 mg per mL then must be diluted', () {
    final profile = iv('Ganciclovir');
    expect(profile.calculatorVariants.single.concentration, 50);
    expect(profile.reconstitution, contains('10 mL'));
    expect(profile.reconstitution, contains('Sterile Water'));
    expect(profile.resultingConcentration, contains('50 mg/mL'));
    expect(profile.furtherDilution, contains('10 mg/mL'));
    expect(profile.allowedDiluents, contains('0.9% Sodium Chloride'));
    expect(profile.allowedDiluents, contains('D5W'));
    expect(profile.administration, contains('1 hour'));
    expect(profile.stability, contains('12 hours'));
    expect(profile.stability, contains('24 hours'));
    expect(profile.incompatibilities.toLowerCase(), contains('parabens'));
  });

  test('protamine stays 10 mg per mL with maximum 50 mg in 10 minutes', () {
    final profile = iv('Protamine');
    expect(profile.calculatorVariants.single.concentration, 10);
    expect(profile.resultingConcentration, contains('10 mg/mL'));
    expect(profile.furtherDilution.toLowerCase(), contains('no further dilution'));
    expect(profile.allowedDiluents, contains('D5W'));
    expect(profile.allowedDiluents, contains('0.9% Sodium Chloride'));
    expect(profile.administration, contains('10 minutes'));
    expect(profile.administration, contains('50 mg'));
    expect(profile.stability.toLowerCase(), contains('do not freeze'));
  });

  test('DIGIFAB uses 40 mg plus 4 mL SWFI and standard 30-minute infusion', () {
    final profile = iv('Digoxin immune Fab');
    expect(profile.calculatorVariants.single.concentration, 10);
    expect(profile.reconstitution, contains('40 mg'));
    expect(profile.reconstitution, contains('4 mL'));
    expect(profile.resultingConcentration, contains('10 mg/mL'));
    expect(profile.furtherDilution, contains('0.9% Sodium Chloride'));
    expect(profile.furtherDilution, contains('1 mg/mL'));
    expect(profile.administration, contains('30 minutes'));
    expect(profile.stability, contains('4 hours'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('number of vials'));
  });
}
