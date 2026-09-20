import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/sample_families.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/medication_clinical_details.dart';
import 'package:drug_edu/features/supplements/data/supplement_profiles.dart';
import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';
import 'package:drug_edu/features/feeding_tubes/data/feeding_tube_profiles.dart';

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

  test('every medicine has core patient counseling and source metadata', () {
    for (final medicine in sampleMedications) {
      expect(
        medicine.patient.purposeAr.trim(),
        isNotEmpty,
        reason: 'Missing patient purpose: ' + medicine.name,
      );
      expect(
        medicine.patient.howToUseAr.trim(),
        isNotEmpty,
        reason: 'Missing patient administration: ' + medicine.name,
      );
      expect(
        medicine.sourceLabel.trim(),
        isNotEmpty,
        reason: 'Missing source label: ' + medicine.name,
      );
    }
  });

  test('every medicine has expanded pharmacist detail and duration', () {
    for (final medicine in sampleMedications) {
      final detail = medicationClinicalDetails[medicine.id];
      expect(
        detail,
        isNotNull,
        reason: 'Missing expanded pharmacist detail: ' + medicine.name,
      );
      expect(
        detail!.therapyDuration.trim(),
        isNotEmpty,
        reason: 'Missing therapy duration: ' + medicine.name,
      );
      expect(
        detail.source.trim(),
        isNotEmpty,
        reason: 'Missing expanded reference source: ' + medicine.name,
      );
    }
  });

  test('recovered medicine library stays broad', () {
    expect(
      sampleMedications.length,
      greaterThanOrEqualTo(157),
      reason: 'Medicine recovery unexpectedly lost records.',
    );
    expect(
      medicationClinicalDetails.length,
      greaterThanOrEqualTo(sampleMedications.length),
    );
  });

  test('supplement encyclopedia contains all major groups and depth', () {
    final groups = supplementProfiles.map((item) => item.group).toSet();

    expect(groups, contains('Vitamins'));
    expect(groups, contains('Minerals'));
    expect(groups, contains('Pediatric supplements'));
    expect(groups, contains('Other supplements'));
    expect(groups, contains('Combination products'));
    expect(groups, contains('Growth / amino-acid products'));
    expect(groups, contains('Safety review'));
    expect(supplementProfiles.length, greaterThanOrEqualTo(30));

    for (final profile in supplementProfiles) {
      expect(profile.howToTakeEn.trim(), isNotEmpty);
      expect(profile.sourceLabel.trim(), isNotEmpty);
      expect(profile.patient.howToUseAr.trim(), isNotEmpty);
    }
  });

  test('feeding tube library keeps verified formulation-specific profiles', () {
    expect(feedingTubeProfiles.length, greaterThanOrEqualTo(7));
    for (final profile in feedingTubeProfiles) {
      expect(profile.formulation.trim(), isNotEmpty);
      expect(profile.preparation.trim(), isNotEmpty);
      expect(profile.safety.trim(), isNotEmpty);
      expect(profile.source.trim(), isNotEmpty);
    }
  });

  test('IV catalog contains general NICU and PICU content', () {
    final populations = ivMedicationCatalog.map((item) => item.population).toSet();

    expect(populations, contains('General'));
    expect(populations, contains('NICU'));
    expect(populations, contains('PICU'));
    expect(ivMedicationCatalog.length, greaterThanOrEqualTo(130));
  });
}
