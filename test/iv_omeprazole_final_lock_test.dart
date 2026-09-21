import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('all General IV catalog entries are now source locked', () {
    final remaining = ivMedicationCatalog
        .where((entry) => entry.population == 'General' && !entry.structured)
        .toList();
    expect(remaining, isEmpty);
    expect(ivPreparationProfiles.length, greaterThanOrEqualTo(87));
  });

  test('omeprazole exact infusion product preserves preparation and stability locks', () {
    final profile = findIvPreparationProfile('Omeprazole', 'General')!;

    expect(profile.calculatorVariants, isEmpty);
    expect(profile.formulation, contains('Viatris'));
    expect(profile.formulation, contains('40 mg'));
    expect(profile.reconstitution, contains('5 mL'));
    expect(profile.reconstitution, contains('100 mL'));
    expect(profile.resultingConcentration, contains('0.4 mg/mL'));
    expect(profile.allowedDiluents, contains('0.9% Sodium Chloride'));
    expect(profile.allowedDiluents, contains('D5W'));
    expect(profile.administration, contains('20–30 minutes'));
    expect(profile.administration.toLowerCase(), contains('infusion only'));
    expect(profile.stability, contains('12 hours'));
    expect(profile.stability, contains('6 hours'));
    expect(profile.incompatibilities.toLowerCase(), contains('do not mix'));
    expect(profile.criticalLocks.join(' ').toLowerCase(), contains('calculator'));
  });
}
