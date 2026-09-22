import 'dart:io';

import 'package:drug_edu/core/data/medication_patient_guidance.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_families.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/feeding_tubes/data/feeding_tube_records.dart';
import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_plan_engine.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_plan_models.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';
import 'package:drug_edu/features/nebulizers/data/nebulizer_preparation_profiles.dart';
import 'package:drug_edu/features/supplements/data/supplement_profiles.dart';
import 'package:drug_edu/features/visual_guides/data/visual_guide_catalog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('v1.0 medication census and counseling coverage are frozen', () {
    expect(sampleMedications.length, 213);

    final medicationIds = sampleMedications.map((item) => item.id).toList();
    expect(medicationIds.toSet().length, 213,
        reason: 'Medication IDs must remain unique');

    final familyIds = medicationFamilies.map((item) => item.id).toSet();
    var arabicCoverage = 0;

    for (final medicine in sampleMedications) {
      expect(familyIds, contains(medicine.familyId),
          reason: 'Unknown family for ${medicine.id}');

      final timing = medicationTimingRules[medicine.id];
      expect(timing, isNotNull,
          reason: '${medicine.id} missing medication-plan timing');
      expect(timing!.instructionAr.trim(), isNotEmpty,
          reason: '${medicine.id} missing timing instruction');
      expect(timing.source.trim(), isNotEmpty,
          reason: '${medicine.id} missing timing source');

      final patient = resolvedPatientCounseling(
        medicine,
        timingFallbackAr: timing.instructionAr,
      );
      final requiredArabic = <String>[
        patient.purposeAr,
        patient.howToUseAr,
        patient.timingAr,
        patient.missedDoseAr,
        patient.seekHelpAr,
        patient.teachBackAr,
      ];
      if (requiredArabic.every((value) => value.trim().isNotEmpty)) {
        arabicCoverage++;
      }
    }

    expect(arabicCoverage, 213,
        reason:
            'Every medication must resolve to practical Arabic counseling');

    expect(englishPatientCounseling.length, 213);
    expect(englishPatientCounseling.keys.toSet(), medicationIds.toSet());
    for (final entry in englishPatientCounseling.entries) {
      final patient = entry.value;
      expect(patient.purpose.trim(), isNotEmpty, reason: entry.key);
      expect(patient.howToUse.trim(), isNotEmpty, reason: entry.key);
      expect(patient.timing.trim(), isNotEmpty, reason: entry.key);
      expect(patient.duration.trim(), isNotEmpty, reason: entry.key);
      expect(patient.important.trim(), isNotEmpty, reason: entry.key);
      expect(patient.missedDose.trim(), isNotEmpty, reason: entry.key);
      expect(patient.seekHelp.trim(), isNotEmpty, reason: entry.key);
      expect(patient.teachBack.trim(), isNotEmpty, reason: entry.key);
    }

    expect(medicationTherapyDurations.length, 213);
    expect(medicationTherapyDurations.keys.toSet(), medicationIds.toSet());
  });

  test('v1.0 visual-guide links are unique and fully resolvable', () {
    final medicationIds = sampleMedications.map((item) => item.id).toSet();
    final guideIds = visualGuideCatalog.map((item) => item.id).toList();

    expect(guideIds.toSet().length, guideIds.length,
        reason: 'Visual Guide IDs must be unique');

    for (final entry in medicationVisualGuideIds.entries) {
      expect(medicationIds, contains(entry.key),
          reason: 'Visual Guide map references unknown medication');
      expect(entry.value, isNotEmpty, reason: entry.key);
      expect(entry.value.toSet().length, entry.value.length,
          reason: '${entry.key} has duplicate Visual Guide mappings');
      for (final guideId in entry.value) {
        expect(visualGuideById(guideId), isNotNull,
            reason: '${entry.key} references missing guide $guideId');
      }
    }

    for (final medicine
        in sampleMedications.where((item) => item.hasVisualGuide)) {
      expect(visualGuidesForMedication(medicine.id), isNotEmpty,
          reason: '${medicine.id} is flagged for a guide but has no mapping');
    }
  });

  test('v1.0 tube, supplement and nebulizer catalogs are frozen and unique', () {
    expect(tubeMedicationRecords.length, 45);
    final tubeKeys = tubeMedicationRecords
        .map((item) => '${item.medicine}|${item.formulation}')
        .toList();
    expect(tubeKeys.toSet().length, 45,
        reason: 'Feeding Tube composite IDs must be unique');
    for (final item in tubeMedicationRecords) {
      expect(item.source.trim(), isNotEmpty);
      expect(item.preparation.trim(), isNotEmpty);
      expect(item.doNot.trim(), isNotEmpty);
    }

    expect(supplementProfiles.length, 37);
    final supplementIds = supplementProfiles.map((item) => item.id).toList();
    expect(supplementIds.toSet().length, 37,
        reason: 'Supplement IDs must be unique');
    for (final item in supplementProfiles) {
      expect(item.sourceLabel.trim(), isNotEmpty, reason: item.id);
    }

    expect(nebulizerPreparationProfiles.length, 19);
    final nebulizerIds =
        nebulizerPreparationProfiles.map((item) => item.id).toList();
    expect(nebulizerIds.toSet().length, 19,
        reason: 'Nebulizer profile IDs must be unique');
    for (final item in nebulizerPreparationProfiles) {
      expect(item.source.trim(), isNotEmpty, reason: item.id);
      expect(item.preparation, isNotEmpty, reason: item.id);
      expect(item.doNot, isNotEmpty, reason: item.id);
    }
  });

  test('v1.0 IV preparation catalog and profiles match exactly', () {
    expect(ivMedicationCatalog.length, 133);
    expect(ivPreparationProfiles.length, 133);

    final catalogKeys = ivMedicationCatalog
        .map((item) => '${item.name}|${item.population}')
        .toList();
    final profileKeys = ivPreparationProfiles
        .map((item) => '${item.name}|${item.population}')
        .toList();

    expect(catalogKeys.toSet().length, 133,
        reason: 'IV catalog keys must be unique');
    expect(profileKeys.toSet().length, 133,
        reason: 'IV profile keys must be unique');
    expect(catalogKeys.toSet(), profileKeys.toSet(),
        reason: 'Every IV catalog entry must have exactly one profile');

    for (final item in ivMedicationCatalog) {
      expect(item.structured, isTrue,
          reason: '${item.name}|${item.population} is not source locked');
    }
    for (final profile in ivPreparationProfiles) {
      expect(profile.sourceLabel.trim(), isNotEmpty,
          reason: '${profile.name}|${profile.population}');
    }
  });

  test('unsafe auto-scheduling remains blocked for high-risk regimens', () {
    const ids = <String>{
      'rivaroxaban',
      'insulin-lispro',
      'nitroglycerin-sublingual',
      'ibandronate-monthly',
      'teriparatide-forteo',
      'romosozumab-evenity',
      'potassium-chloride-klor-con-m',
      'potassium-chloride-er-capsule-sprinkle',
      'potassium-chloride-oral-solution',
      'drospirenone-slynd-4mg',
      'medroxyprogesterone-depo-provera-ci-150mg-im',
      'etonogestrel-ethinyl-estradiol-vaginal-ring',
      'norelgestromin-ethinyl-estradiol-patch',
    };

    const engine = MedicationPlanEngine();
    const routine = PatientRoutine();

    for (final id in ids) {
      final medicine = sampleMedications.firstWhere((item) => item.id == id);
      final rule = medicationTimingRules[id];
      expect(rule, isNotNull, reason: id);
      expect(rule!.autoScheduleSafe, isFalse, reason: id);

      final plan = engine.generate(
        items: [
          MedicationPlanItem(
            id: 'freeze-$id',
            sourceId: id,
            type: PlanItemType.medicine,
            name: medicine.name,
            doseText: 'prescribed dose',
            frequency: RegimenFrequency.onceDaily,
          ),
        ],
        routine: routine,
      );
      expect(plan.doses, isEmpty,
          reason: '$id must not receive an automatic clock time');
      expect(plan.alerts.any((alert) => alert.isCritical), isTrue,
          reason: '$id must require explicit timing review');
    }
  });

  test('representative storage, crushing and missed-dose locks stay explicit',
      () {
    final nitro = englishPatientCounseling['nitroglycerin-sublingual']!;
    expect(nitro.storage.toLowerCase(), contains('original glass container'));

    final latanoprost = englishPatientCounseling['latanoprost']!;
    expect(latanoprost.storage.toLowerCase(), contains('2–8'));
    expect(latanoprost.storage.toLowerCase(), contains('6 weeks'));

    final dabigatran = englishPatientCounseling['dabigatran']!;
    expect(dabigatran.howToUse.toLowerCase(), contains('do not break'));
    expect(dabigatran.missedDose, contains('6 hours'));

    final warfarin = englishPatientCounseling['warfarin']!;
    expect(warfarin.missedDose.toLowerCase(), contains('same day'));
    expect(warfarin.missedDose.toLowerCase(), contains('next day'));

    final methotrexate =
        englishPatientCounseling['methotrexate-rheumatology']!;
    expect(methotrexate.howToUse, contains('ONCE A WEEK'));

    final klorCon = sampleMedications.firstWhere(
      (item) => item.id == 'potassium-chloride-klor-con-m',
    );
    expect(klorCon.useProfile.formulationHandling.toLowerCase(),
        contains('do not crush'));
  });

  test('runtime clinical content contains no release-blocking placeholders', () {
    final files = <File>[
      File('README.md'),
      ...Directory('lib')
          .listSync(recursive: true)
          .whereType<File>()
          .where((file) => file.path.endsWith('.dart')),
    ];

    final forbidden = <RegExp>[
      RegExp(r'\bTODO\b', caseSensitive: false),
      RegExp(r'\bFIXME\b', caseSensitive: false),
      RegExp(r'\bTBD\b', caseSensitive: false),
      RegExp(r'locked until', caseSensitive: false),
      RegExp(r'exact product data are verified', caseSensitive: false),
      RegExp(r'unverified placeholder', caseSensitive: false),
    ];

    for (final file in files) {
      final text = file.readAsStringSync();
      for (final pattern in forbidden) {
        expect(pattern.hasMatch(text), isFalse,
            reason: '${file.path} contains forbidden placeholder $pattern');
      }
    }
  });
}
