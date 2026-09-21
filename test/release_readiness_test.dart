import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/feeding_tubes/data/feeding_tube_records.dart';
import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';
import 'package:drug_edu/features/supplements/data/supplement_profiles.dart';
import 'package:drug_edu/features/visual_guides/data/visual_guide_catalog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('release readiness clinical content is internally complete', () {
    expect(sampleMedications.length, 172);

    final medicationIds = sampleMedications.map((item) => item.id).toList();
    expect(medicationIds.toSet().length, medicationIds.length);

    expect(englishPatientCounseling.length, sampleMedications.length);
    expect(englishPatientCounseling.keys.toSet(), medicationIds.toSet());
    expect(medicationTherapyDurations.length, sampleMedications.length);
    expect(medicationTherapyDurations.keys.toSet(), medicationIds.toSet());

    for (final medicine in sampleMedications) {
      expect(medicine.sourceLabel.trim(), isNotEmpty,
          reason: medicine.name + ' missing source label');
      expect(medicationTimingRules.containsKey(medicine.id), isTrue,
          reason: medicine.name + ' missing planner timing rule');

      final english = englishPatientCounseling[medicine.id]!;
      expect(english.purpose.trim(), isNotEmpty);
      expect(english.howToUse.trim(), isNotEmpty);
      expect(english.timing.trim(), isNotEmpty);
      expect(english.duration.trim(), isNotEmpty);
      expect(english.important.trim(), isNotEmpty);
      expect(english.missedDose.trim(), isNotEmpty);
      expect(english.seekHelp.trim(), isNotEmpty);
      expect(english.teachBack.trim(), isNotEmpty);
    }

    expect(supplementProfiles.length, greaterThanOrEqualTo(26));
    final supplementIds = supplementProfiles.map((item) => item.id).toList();
    expect(supplementIds.toSet().length, supplementIds.length);

    expect(tubeMedicationRecords.length, greaterThanOrEqualTo(45));
    final tubeKeys = tubeMedicationRecords
        .map((item) => item.medicine + '|' + item.formulation)
        .toList();
    expect(tubeKeys.toSet().length, tubeKeys.length);
    for (final item in tubeMedicationRecords) {
      expect(item.source.trim(), isNotEmpty);
      expect(item.preparation.trim(), isNotEmpty);
      expect(item.doNot.trim(), isNotEmpty);
    }

    expect(ivPreparationProfiles.length, greaterThanOrEqualTo(24));
    final ivKeys = ivPreparationProfiles
        .map((item) => item.name + '|' + item.population)
        .toList();
    expect(ivKeys.toSet().length, ivKeys.length);
    for (final profile in ivPreparationProfiles) {
      expect(profile.sourceLabel.trim(), isNotEmpty);
      expect(
        ivMedicationCatalog.any(
          (entry) =>
              entry.name == profile.name &&
              entry.population == profile.population &&
              entry.structured,
        ),
        isTrue,
        reason: 'IV profile missing structured catalog link: ' +
            profile.name +
            ' · ' +
            profile.population,
      );
    }

    final guideIds = visualGuideCatalog.map((item) => item.id).toList();
    expect(guideIds.toSet().length, guideIds.length);
  });
}
