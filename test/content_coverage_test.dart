import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/sample_families.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/expanded_medications.dart';
import 'package:drug_edu/features/supplements/data/supplement_profiles.dart';
import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';

void main() {
  test('every medicine family has at least one medicine', () {
    for (final family in medicationFamilies) {
      expect(
        sampleMedications.any((medicine) => medicine.familyId == family.id),
        isTrue,
        reason: 'No medicine in family: ' + family.name,
      );
    }
  });

  test('every medicine has core patient counseling', () {
    for (final medicine in sampleMedications) {
      expect(medicine.patient.purposeAr.trim(), isNotEmpty);
      expect(medicine.patient.howToUseAr.trim(), isNotEmpty);
    }
  });


  test('medicine encyclopedia has substantial practical coverage', () {
    expect(sampleMedications.length, greaterThanOrEqualTo(100));

    final ids = sampleMedications.map((medicine) => medicine.id).toList();
    expect(ids.toSet().length, ids.length, reason: 'Medication IDs must be unique');

    final familyIds = medicationFamilies.map((family) => family.id).toSet();
    for (final medicine in sampleMedications) {
      expect(
        familyIds,
        contains(medicine.familyId),
        reason: 'Unknown family for ' + medicine.name,
      );
    }
  });

  test('expanded medicines carry structured pharmacist and source content', () {
    expect(expandedMedications.length, greaterThanOrEqualTo(40));

    for (final medicine in expandedMedications) {
      expect(medicine.sourceLabel.trim(), isNotEmpty,
          reason: medicine.name + ' needs a source label');
      expect(medicine.useProfile.isEmpty, isFalse,
          reason: medicine.name + ' needs structured medication-use facts');
      expect(medicine.patient.purposeAr.trim(), isNotEmpty);
      expect(medicine.patient.howToUseAr.trim(), isNotEmpty);
    }
  });

  test('supplement encyclopedia contains all major groups', () {
    final groups = supplementProfiles.map((item) => item.group).toSet();

    expect(groups, contains('Vitamins'));
    expect(groups, contains('Minerals'));
    expect(groups, contains('Pediatric supplements'));
    expect(groups, contains('Combination products'));
    expect(groups, contains('Growth / amino-acid products'));
    expect(groups, contains('Safety review'));
  });

  test('IV catalog contains general NICU and PICU content', () {
    final populations = ivMedicationCatalog.map((item) => item.population).toSet();

    expect(populations, contains('General'));
    expect(populations, contains('NICU'));
    expect(populations, contains('PICU'));
    expect(ivMedicationCatalog.length, greaterThan(80));
  });
}
