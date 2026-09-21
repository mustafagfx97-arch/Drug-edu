import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/medication_clinical_overlays.dart';
import 'package:drug_edu/core/data/medication_patient_guidance.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_families.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/core/models/medication.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/expanded_medications.dart';
import 'package:drug_edu/core/data/expanded_medications_2.dart';
import 'package:drug_edu/core/data/expanded_medications_3.dart';
import 'package:drug_edu/core/data/expanded_medications_4.dart';
import 'package:drug_edu/features/supplements/data/supplement_profiles.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';
import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:drug_edu/features/feeding_tubes/data/feeding_tube_records.dart';
import 'package:drug_edu/features/visual_guides/data/visual_guide_catalog.dart';

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


  test('reviewed English patient counseling is complete and source locked', () {
    expect(englishPatientCounseling.length, greaterThanOrEqualTo(32));

    for (final entry in englishPatientCounseling.entries) {
      expect(
        sampleMedications.any((medicine) => medicine.id == entry.key),
        isTrue,
        reason: 'English counseling references unknown medicine: ' + entry.key,
      );

      final patient = entry.value;
      expect(patient.purpose.trim(), isNotEmpty, reason: entry.key + ' purpose');
      expect(patient.howToUse.trim(), isNotEmpty, reason: entry.key + ' how');
      expect(patient.timing.trim(), isNotEmpty, reason: entry.key + ' timing');
      expect(patient.duration.trim(), isNotEmpty, reason: entry.key + ' duration');
      expect(patient.important.trim(), isNotEmpty, reason: entry.key + ' important');
      expect(patient.missedDose.trim(), isNotEmpty, reason: entry.key + ' missed');
      expect(patient.seekHelp.trim(), isNotEmpty, reason: entry.key + ' red flags');
      expect(patient.teachBack.trim(), isNotEmpty, reason: entry.key + ' teach-back');
    }

    final warfarin = englishPatientCounselingFor('warfarin')!;
    expect(warfarin.missedDose.toLowerCase(), contains('same day'));
    expect(warfarin.missedDose.toLowerCase(), contains('next day'));
    expect(warfarin.important, contains('INR'));

    final dabigatran = englishPatientCounselingFor('dabigatran')!;
    expect(dabigatran.missedDose, contains('6 hours'));
    expect(dabigatran.howToUse.toLowerCase(), contains('do not break'));

    final methotrexate =
        englishPatientCounselingFor('methotrexate-rheumatology')!;
    expect(methotrexate.howToUse, contains('ONCE A WEEK'));
    expect(methotrexate.important.toLowerCase(), contains('fatal'));

    final rivaroxaban = englishPatientCounselingFor('rivaroxaban')!;
    expect(rivaroxaban.timing, contains('15 mg'));
    expect(rivaroxaban.timing, contains('20 mg'));
    expect(rivaroxaban.missedDose.toLowerCase(), contains('regimen-specific'));

    final cefdinir =
        englishPatientCounselingFor('cefdinir-pediatric-suspension')!;
    expect(cefdinir.storage, contains('10 days'));
    expect(cefdinir.timing, contains('2 hours'));

    expect(
      englishPatientCounselingFor('cetirizine'),
      isNull,
      reason:
          'Medicines without a reviewed English record must not get an automatic translation fallback.',
    );
  });

  test('medicine encyclopedia has substantial practical coverage', () {
    expect(sampleMedications.length, greaterThanOrEqualTo(152));

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

  test('visual-guide medication links resolve to real guides', () {
    final guideIds = visualGuideCatalog.map((guide) => guide.id).toList();
    expect(
      guideIds.toSet().length,
      guideIds.length,
      reason: 'Visual guide IDs must be unique',
    );

    for (final entry in medicationVisualGuideIds.entries) {
      expect(
        sampleMedications.any((medicine) => medicine.id == entry.key),
        isTrue,
        reason: 'Visual guide map references unknown medicine: ' + entry.key,
      );
      expect(entry.value, isNotEmpty);
      for (final guideId in entry.value) {
        expect(
          visualGuideById(guideId),
          isNotNull,
          reason: entry.key + ' references missing visual guide ' + guideId,
        );
      }
    }

    for (final medicine in sampleMedications.where(
      (medicine) => medicine.hasVisualGuide,
    )) {
      expect(
        visualGuidesForMedication(medicine.id),
        isNotEmpty,
        reason: medicine.name + ' is flagged for a visual guide but has no link',
      );
    }
  });

  test('IV-preparation flag requires an exact verified source-locked profile', () {
    for (final medicine in sampleMedications.where(
      (medicine) => medicine.hasIvPreparation,
    )) {
      expect(
        ivPreparationProfiles.any(
          (profile) => profile.name == medicine.name,
        ),
        isTrue,
        reason:
            medicine.name + ' must not show IV preparation without a verified profile',
      );
    }
  });

  test('every medicine resolves to structured pharmacist-use essentials', () {
    expect(legacyMedicationClinicalOverlays.length, 62);

    for (final medicine in sampleMedications) {
      final profile = resolvedMedicationUseProfile(medicine);
      expect(
        profile.isEmpty,
        isFalse,
        reason: medicine.name + ' needs a structured use profile',
      );
      expect(profile.route.trim(), isNotEmpty, reason: medicine.name + ' route');
      expect(
        profile.foodTiming.trim(),
        isNotEmpty,
        reason: medicine.name + ' food/timing',
      );
      expect(
        profile.duration.trim(),
        isNotEmpty,
        reason: medicine.name + ' therapy duration',
      );
      expect(
        profile.formulationHandling.trim(),
        isNotEmpty,
        reason: medicine.name + ' formulation handling',
      );
      expect(
        profile.monitoring.trim(),
        isNotEmpty,
        reason: medicine.name + ' monitoring',
      );
      expect(
        profile.interactions.trim(),
        isNotEmpty,
        reason: medicine.name + ' interactions',
      );
      expect(
        profile.commonMistakes.trim(),
        isNotEmpty,
        reason: medicine.name + ' common mistakes',
      );
      expect(
        profile.specialPopulations.trim(),
        isNotEmpty,
        reason: medicine.name + ' patient-specific considerations',
      );
      expect(
        resolvedMedicationSourceLabel(medicine).trim(),
        isNotEmpty,
        reason: medicine.name + ' source label',
      );
    }
  });

  test('high-risk legacy counseling rules stay explicit', () {
    String facts(String id) {
      final medicine = sampleMedications.firstWhere((item) => item.id == id);
      return resolvedMedicationUseProfile(medicine)
          .facts
          .map((fact) => fact.value)
          .join(' ')
          .toLowerCase();
    }

    expect(facts('methotrexate-rheumatology'), contains('once weekly'));
    expect(facts('rivaroxaban'), contains('15 mg and 20 mg'));
    expect(facts('levothyroxine'), contains('4 hours'));
    expect(facts('tiotropium-capsule-inhalation'), contains('do not swallow'));
    expect(facts('nitroglycerin-sublingual'), contains('pde-5'));
    expect(facts('semaglutide-injection'), contains('ozempic'));
    expect(facts('metformin'), contains('extended-release'));
  });

  test('every medicine has explicit patient-facing therapy duration', () {
    final medicineIds = sampleMedications.map((medicine) => medicine.id).toSet();
    expect(medicationTherapyDurations.length, sampleMedications.length);
    expect(medicationTherapyDurations.keys.toSet(), medicineIds);

    for (final medicine in sampleMedications) {
      final guidance = therapyDurationFor(medicine.id);
      expect(guidance, isNotNull, reason: medicine.name + ' duration missing');
      expect(guidance!.patientAr.trim(), isNotEmpty);
    }

    expect(
      therapyDurationFor('prednisone')!.patientAr,
      contains('تقليل'),
    );
    expect(
      therapyDurationFor('levothyroxine')!.patientAr,
      contains('مدى الحياة'),
    );
    expect(
      therapyDurationFor('clopidogrel')!.patientAr,
      contains('دعامة'),
    );
    expect(
      therapyDurationFor('levonorgestrel-ec')!.kind,
      TherapyDurationKind.singleUse,
    );
  });

  test('resolved patient counseling fills the actionable safety gaps', () {
    for (final medicine in sampleMedications) {
      final patient = resolvedPatientCounseling(
        medicine,
        timingFallbackAr:
            medicationPatientTimingInstruction(medicine.id),
      );

      expect(patient.purposeAr.trim(), isNotEmpty);
      expect(patient.howToUseAr.trim(), isNotEmpty);
      expect(
        patient.timingAr.trim(),
        isNotEmpty,
        reason: medicine.name + ' patient timing missing',
      );
      expect(
        patient.importantAr.trim(),
        isNotEmpty,
        reason: medicine.name + ' important counseling missing',
      );
      expect(
        patient.seekHelpAr.trim(),
        isNotEmpty,
        reason: medicine.name + ' red-flag action missing',
      );
      expect(
        patient.missedDoseAr.trim(),
        isNotEmpty,
        reason: medicine.name + ' missed-dose guidance missing',
      );
      expect(
        patient.teachBackAr.trim(),
        isNotEmpty,
        reason: medicine.name + ' teach-back missing',
      );
      expect(
        patient.timingAr,
        isNot(contains('Auto')),
        reason: medicine.name + ' leaked engine wording to patient',
      );
      expect(
        patient.timingAr,
        isNot(contains('التطبيق')),
        reason: medicine.name + ' leaked app-engine wording to patient',
      );
    }

    PatientCounselingData patient(String id) {
      final medicine = sampleMedications.firstWhere((item) => item.id == id);
      return resolvedPatientCounseling(
        medicine,
        timingFallbackAr:
            medicationPatientTimingInstruction(medicine.id),
      );
    }

    expect(patient('warfarin').missedDoseAr, contains('نفس اليوم'));
    expect(patient('rivaroxaban').missedDoseAr, contains('15 mg'));
    expect(patient('dabigatran').missedDoseAr, contains('6 ساعات'));
    expect(patient('semaglutide-injection').missedDoseAr, contains('OZEMPIC'));
    expect(patient('semaglutide-injection').missedDoseAr, contains('WEGOVY'));
    expect(patient('latanoprost').missedDoseAr, contains('لا تستخدم جرعتين'));
    expect(patient('norethindrone-pop').missedDoseAr, contains('3 ساعات'));
    expect(patient('insulin-glargine').missedDoseAr, contains('لا تضاعف'));
    expect(
      patient('methotrexate-rheumatology').missedDoseAr,
      contains('الأسبوعية'),
    );
  });

  test('patient guidance patches do not duplicate medication IDs', () {
    final patchIds = medicationPatientGuidancePatches.keys.toList();
    expect(patchIds.toSet().length, patchIds.length);
  });

  test('second expansion adds complete high-priority medicine records', () {
    expect(expandedMedications2.length, 26);

    final ids = expandedMedications2.map((medicine) => medicine.id).toSet();
    expect(ids.length, expandedMedications2.length);
    expect(ids, contains('tirzepatide-mounjaro'));
    expect(ids, contains('denosumab-prolia'));
    expect(ids, contains('risedronate'));
    expect(ids, contains('lithium'));
    expect(ids, contains('amoxicillin-clavulanate'));

    for (final medicine in expandedMedications2) {
      expect(medicine.useProfile.isEmpty, isFalse,
          reason: medicine.name + ' structured profile');
      expect(medicine.sourceLabel.trim(), isNotEmpty,
          reason: medicine.name + ' source');
      expect(medicine.patient.purposeAr.trim(), isNotEmpty);
      expect(medicine.patient.howToUseAr.trim(), isNotEmpty);
      expect(medicine.patient.timingAr.trim(), isNotEmpty);
      expect(medicine.patient.importantAr.trim(), isNotEmpty);
      expect(medicine.patient.missedDoseAr.trim(), isNotEmpty);
      expect(medicine.patient.seekHelpAr.trim(), isNotEmpty);
      expect(medicine.patient.teachBackAr.trim(), isNotEmpty);
    }

    final mounjaro = expandedMedications2.firstWhere(
      (medicine) => medicine.id == 'tirzepatide-mounjaro',
    );
    expect(mounjaro.patient.missedDoseAr, contains('96 ساعة'));
    expect(mounjaro.patient.missedDoseAr, contains('72 ساعة'));

    final risedronate = expandedMedications2.firstWhere(
      (medicine) => medicine.id == 'risedronate',
    );
    expect(risedronate.patient.timingAr, contains('Atelvia'));
    expect(risedronate.patient.timingAr, contains('30 دقيقة'));

    final prolia = expandedMedications2.firstWhere(
      (medicine) => medicine.id == 'denosumab-prolia',
    );
    expect(prolia.patient.missedDoseAr, contains('كل 6 أشهر'));
  });

  test('respiratory and nasal formulation expansion stays complete', () {
    expect(expandedMedications3.length, 10);

    final ids = expandedMedications3.map((medicine) => medicine.id).toSet();
    expect(ids.length, expandedMedications3.length);
    expect(ids, contains('albuterol-nebulizer-0083'));
    expect(ids, contains('albuterol-nebulizer-concentrate-05'));
    expect(ids, contains('budesonide-nebulizer'));
    expect(ids, contains('tiotropium-respimat'));
    expect(ids, contains('oxymetazoline-nasal'));

    for (final medicine in expandedMedications3) {
      expect(medicine.useProfile.isEmpty, isFalse,
          reason: medicine.name + ' structured profile');
      expect(medicine.sourceLabel.trim(), isNotEmpty,
          reason: medicine.name + ' source');
      expect(medicine.patient.purposeAr.trim(), isNotEmpty);
      expect(medicine.patient.howToUseAr.trim(), isNotEmpty);
      expect(medicine.patient.timingAr.trim(), isNotEmpty);
      expect(medicine.patient.importantAr.trim(), isNotEmpty);
      expect(medicine.patient.missedDoseAr.trim(), isNotEmpty);
      expect(medicine.patient.seekHelpAr.trim(), isNotEmpty);
      expect(medicine.patient.teachBackAr.trim(), isNotEmpty);
      expect(visualGuidesForMedication(medicine.id), isNotEmpty);
    }

    final readyAlbuterol = expandedMedications3.firstWhere(
      (medicine) => medicine.id == 'albuterol-nebulizer-0083',
    );
    expect(readyAlbuterol.patient.importantAr, contains('لا يحتاج تخفيف'));

    final concentrateAlbuterol = expandedMedications3.firstWhere(
      (medicine) => medicine.id == 'albuterol-nebulizer-concentrate-05',
    );
    expect(concentrateAlbuterol.patient.importantAr, contains('لا تضع'));
    expect(
      concentrateAlbuterol.useProfile.formulationHandling,
      contains('total nebulizer volume of 3 mL'),
    );

    final pulmicort = expandedMedications3.firstWhere(
      (medicine) => medicine.id == 'budesonide-nebulizer',
    );
    expect(pulmicort.patient.importantAr, contains('ultrasonic'));

    final oxymetazoline = expandedMedications3.firstWhere(
      (medicine) => medicine.id == 'oxymetazoline-nasal',
    );
    expect(oxymetazoline.patient.timingAr, contains('3 أيام'));
  });

  test('fourth expansion adds complete weak-section coverage records', () {
    expect(expandedMedications4.length, 13);

    final ids = expandedMedications4.map((medicine) => medicine.id).toList();
    expect(ids.toSet().length, ids.length);

    for (final medicine in expandedMedications4) {
      expect(medicine.useProfile.isEmpty, isFalse,
          reason: medicine.name + ' structured profile');
      expect(medicine.sourceLabel.trim(), isNotEmpty,
          reason: medicine.name + ' source');
      expect(medicine.patient.purposeAr.trim(), isNotEmpty);
      expect(medicine.patient.howToUseAr.trim(), isNotEmpty);
      expect(medicine.patient.timingAr.trim(), isNotEmpty);
      expect(medicine.patient.importantAr.trim(), isNotEmpty);
      expect(medicine.patient.missedDoseAr.trim(), isNotEmpty);
      expect(medicine.patient.seekHelpAr.trim(), isNotEmpty);
      expect(medicine.patient.teachBackAr.trim(), isNotEmpty);
    }

    final amoxicillin = expandedMedications4.firstWhere(
      (medicine) => medicine.id == 'amoxicillin-pediatric-suspension',
    );
    expect(amoxicillin.patient.storageAr, contains('14'));

    final cefdinir = expandedMedications4.firstWhere(
      (medicine) => medicine.id == 'cefdinir-pediatric-suspension',
    );
    expect(cefdinir.patient.storageAr, contains('10'));
    expect(cefdinir.patient.timingAr, contains('ساعتين'));

    final ibandronate = expandedMedications4.firstWhere(
      (medicine) => medicine.id == 'ibandronate-monthly',
    );
    expect(ibandronate.patient.timingAr, contains('60'));
    expect(ibandronate.patient.missedDoseAr, contains('7 أيام'));

    final dmpa = expandedMedications4.firstWhere(
      (medicine) => medicine.id == 'medroxyprogesterone-im-contraception',
    );
    expect(dmpa.patient.timingAr, contains('13'));
    expect(dmpa.patient.timingAr, contains('15'));
    expect(dmpa.patient.importantAr, contains('7 أيام'));
    expect(dmpa.sourceLabel, contains('CDC'));

    final predEye = expandedMedications4.firstWhere(
      (medicine) => medicine.id == 'prednisolone-acetate-ophthalmic',
    );
    expect(predEye.patient.howToUseAr, contains('رج'));

    final bismuth = expandedMedications4.firstWhere(
      (medicine) => medicine.id == 'bismuth-subsalicylate',
    );
    expect(bismuth.patient.seekHelpAr, contains('يومين'));
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

  test('every medicine has an explicit medication-plan timing rule', () {
    for (final medicine in sampleMedications) {
      expect(
        medicationTimingRules,
        contains(medicine.id),
        reason: medicine.name + ' missing timing rule',
      );
      expect(
        medicationTimingRules[medicine.id]!.instructionAr.trim(),
        isNotEmpty,
        reason: medicine.name + ' missing Arabic timing instruction',
      );
      expect(
        medicationTimingRules[medicine.id]!.source.trim(),
        isNotEmpty,
        reason: medicine.name + ' timing rule needs source',
      );
    }

    expect(medicationTimingRules['montelukast']!.autoScheduleSafe, isFalse);
    expect(medicationTimingRules['insulin-glargine']!.autoScheduleSafe, isFalse);
    expect(medicationTimingRules['azithromycin']!.autoScheduleSafe, isFalse);
    expect(medicationTimingRules['quetiapine']!.autoScheduleSafe, isFalse);
    expect(medicationTimingRules['adalimumab']!.autoScheduleSafe, isFalse);
    expect(medicationTimingRules['losartan']!.autoScheduleSafe, isTrue);
    expect(medicationTimingRules['atorvastatin']!.autoScheduleSafe, isTrue);
  });

  test('every patient-plan supplement has an explicit timing rule', () {
    final plannerSupplements = supplementProfiles.where(
      (item) =>
          item.id != 'growth-amino-acid-blends' &&
          item.id != 'high-risk-weight-loss-supplements',
    );

    for (final supplement in plannerSupplements) {
      expect(
        medicationTimingRules,
        contains(supplement.id),
        reason: supplement.name + ' missing timing rule',
      );
      expect(
        medicationTimingRules[supplement.id]!.instructionAr.trim(),
        isNotEmpty,
        reason: supplement.name + ' missing timing instruction',
      );
    }

    expect(
      medicationTimingRules['pediatric-iron']!.autoScheduleSafe,
      isFalse,
    );
    expect(
      medicationTimingRules['multivitamin-mineral']!.autoScheduleSafe,
      isFalse,
    );
    expect(
      medicationTimingRules['prenatal-combination']!.autoScheduleSafe,
      isFalse,
    );
  });

  test('supplement encyclopedia contains all major groups', () {
    expect(supplementProfiles.length, greaterThanOrEqualTo(26));
    final groups = supplementProfiles.map((item) => item.group).toSet();

    expect(groups, contains('Vitamins'));
    expect(groups, contains('Minerals'));
    expect(groups, contains('Pediatric supplements'));
    expect(groups, contains('Combination products'));
    expect(groups, contains('Other supplements'));
    expect(groups, contains('Growth / amino-acid products'));
    expect(groups, contains('Safety review'));
  });

  test('feeding-tube library contains practical safety records', () {
    expect(tubeFeedInteractions.length, greaterThanOrEqualTo(5));
    expect(tubeSafetyRules.length, greaterThanOrEqualTo(6));
    expect(injectableEnteralSafetyRules.length, greaterThanOrEqualTo(3));
    expect(tubeMedicationRecords.length, greaterThanOrEqualTo(45));

    for (final record in tubeFeedInteractions) {
      expect(record.medicine.trim(), isNotEmpty);
      expect(record.feedInstruction.trim(), isNotEmpty);
      expect(record.source.trim(), isNotEmpty);
    }

    final medicationKeys = tubeMedicationRecords
        .map((record) => record.medicine + '|' + record.formulation)
        .toList();
    expect(medicationKeys.toSet().length, medicationKeys.length);

    for (final record in tubeMedicationRecords) {
      expect(record.medicine.trim(), isNotEmpty);
      expect(record.formulation.trim(), isNotEmpty);
      expect(record.status.trim(), isNotEmpty);
      expect(record.tubeRoute.trim(), isNotEmpty);
      expect(record.preparation.trim(), isNotEmpty);
      expect(record.feedPlan.trim(), isNotEmpty);
      expect(record.doNot.trim(), isNotEmpty);
      expect(record.pediatricNicu.trim(), isNotEmpty);
      expect(record.practicalAr.trim(), isNotEmpty);
      expect(record.source.trim(), isNotEmpty);
    }

    TubeMedicationRecord tubeDrug(String name) =>
        tubeMedicationRecords.firstWhere((record) => record.medicine == name);

    final lansoprazoleOdt =
        tubeDrug('Lansoprazole delayed-release ODT');
    expect(lansoprazoleOdt.tubeRoute, contains('8 French'));
    expect(lansoprazoleOdt.preparation, contains('4 mL'));
    expect(lansoprazoleOdt.preparation, contains('10 mL'));
    expect(lansoprazoleOdt.preparation, contains('15 minutes'));

    final lansoprazoleCapsule =
        tubeDrug('Lansoprazole delayed-release capsule');
    expect(lansoprazoleCapsule.tubeRoute, contains('16 French'));
    expect(lansoprazoleCapsule.preparation, contains('40 mL apple juice'));
    expect(lansoprazoleCapsule.doNot, contains('apple juice only'));

    final esomeprazole =
        tubeDrug('Esomeprazole delayed-release oral suspension');
    expect(esomeprazole.tubeRoute, contains('French size 6'));
    expect(esomeprazole.preparation, contains('5 mL'));
    expect(esomeprazole.preparation, contains('15 mL'));
    expect(esomeprazole.preparation, contains('30 minutes'));

    final prilosec =
        tubeDrug('Omeprazole delayed-release oral suspension (PRILOSEC-type)');
    expect(prilosec.tubeRoute, contains('6 French'));
    expect(prilosec.preparation, contains('2.5 mg'));
    expect(prilosec.preparation, contains('10 mg'));

    final omeprazoleBicarb =
        tubeDrug('Omeprazole / sodium bicarbonate oral suspension');
    expect(omeprazoleBicarb.preparation, contains('20 mL'));
    expect(omeprazoleBicarb.feedPlan, contains('3 hours'));
    expect(omeprazoleBicarb.feedPlan, contains('1 hour'));

    final pantoprazole =
        tubeDrug('Pantoprazole delayed-release oral suspension');
    expect(pantoprazole.tubeRoute, contains('16 French'));
    expect(pantoprazole.preparation, contains('10 mL apple juice'));
    expect(pantoprazole.doNot, contains('40 mg packet'));

    final rivaroxaban = tubeDrug('Rivaroxaban tablets');
    expect(rivaroxaban.preparation, contains('50 mL water'));
    expect(rivaroxaban.doNot, contains('distal to the stomach'));
    expect(rivaroxaban.feedPlan, contains('15 mg'));
    expect(rivaroxaban.feedPlan, contains('20 mg'));

    final apixaban = tubeDrug('Apixaban 2.5 mg / 5 mg tablets');
    expect(apixaban.tubeRoute, contains('12 French'));
    expect(apixaban.preparation, contains('60 mL'));
    expect(apixaban.preparation, contains('20 mL'));

    final dabigatran = tubeDrug('Dabigatran etexilate capsules');
    expect(dabigatran.status, contains('Do NOT'));
    expect(dabigatran.doNot, contains('open'));
    expect(dabigatran.doNot, contains('increases'));

    final tamsulosin = tubeDrug('Tamsulosin capsules');
    expect(tamsulosin.doNot, contains('open'));

    final nifedipine = tubeDrug('Nifedipine extended-release tablets');
    expect(nifedipine.doNot, contains('crush'));

    final venlafaxine = tubeDrug('Venlafaxine XR capsules');
    expect(venlafaxine.status, contains('tube-validated'));
    expect(venlafaxine.doNot, contains('place them in water'));

    final bupropion = tubeDrug('Bupropion XL tablets');
    expect(bupropion.doNot, contains('crush'));
    expect(bupropion.doNot, contains('seizure'));

    final dexlansoprazole =
        tubeDrug('Dexlansoprazole delayed-release capsule');
    expect(dexlansoprazole.tubeRoute, contains('16 French'));
    expect(dexlansoprazole.preparation, contains('20 mL'));
    expect(dexlansoprazole.preparation, contains('10 mL'));
    expect(dexlansoprazole.preparation, contains('repeat'));

    final drizalma = tubeDrug('Duloxetine DRIZALMA SPRINKLE');
    expect(drizalma.tubeRoute, contains('12 French'));
    expect(drizalma.preparation, contains('50 mL water'));
    expect(drizalma.preparation, contains('10 seconds'));
    expect(drizalma.preparation, contains('15 mL'));
    expect(drizalma.doNot, contains('product-specific'));

    final mycophenolate =
        tubeDrug('Mycophenolate mofetil oral suspension');
    expect(mycophenolate.tubeRoute, contains('8 French'));
    expect(mycophenolate.preparation, contains('94 mL'));
    expect(mycophenolate.preparation, contains('200 mg/mL'));
    expect(mycophenolate.doNot, contains('Do not mix'));
    expect(mycophenolate.doNot, contains('crush tablets'));

    final aspruzyo = tubeDrug('Ranolazine ASPRUZYO SPRINKLE');
    expect(aspruzyo.tubeRoute, contains('12 Fr'));
    expect(aspruzyo.preparation, contains('NG:'));
    expect(aspruzyo.preparation, contains('50 mL'));
    expect(aspruzyo.preparation, contains('G-tube:'));
    expect(aspruzyo.preparation, contains('30 mL'));
    expect(aspruzyo.preparation, contains('20 mL'));

    final metoprololEr =
        tubeDrug('Metoprolol succinate extended-release tablet');
    expect(metoprololEr.status, contains('Do NOT'));
    expect(metoprololEr.doNot, contains('whole or half'));
    expect(metoprololEr.practicalAr, contains('score'));

    final divalproex =
        tubeDrug('Divalproex delayed-release sprinkle capsule');
    expect(divalproex.status, contains('tube-validated'));
    expect(divalproex.preparation, contains('soft food'));
    expect(divalproex.doNot, contains('mixed with water'));

    final xareltoSuspension =
        tubeDrug('XARELTO rivaroxaban oral suspension');
    expect(xareltoSuspension.preparation, contains('150 mL'));
    expect(xareltoSuspension.preparation, contains('60 seconds'));
    expect(xareltoSuspension.preparation, contains('1 mg/mL'));
    expect(xareltoSuspension.preparation, contains('60 days'));
    expect(xareltoSuspension.feedPlan, contains('recurrent VTE'));
    expect(xareltoSuspension.feedPlan, contains('Fontan'));

    final eliquisPediatric =
        tubeDrug('ELIQUIS 0.5 mg tablets for oral suspension');
    expect(eliquisPediatric.tubeRoute, contains('5 Fr'));
    expect(eliquisPediatric.tubeRoute, contains('6.5 Fr'));
    expect(eliquisPediatric.tubeRoute, contains('12 Fr'));
    expect(eliquisPediatric.preparation, contains('10 mL'));
    expect(eliquisPediatric.preparation, contains('5 to 7 minutes'));
    expect(eliquisPediatric.preparation, contains('5 Fr = 10 mL'));
    expect(eliquisPediatric.preparation, contains('6.5 Fr = 15 mL'));
    expect(eliquisPediatric.preparation, contains('12 Fr = 25 mL'));
    expect(eliquisPediatric.pediatricNicu, contains('2.6 kg'));

    final edoxaban = tubeDrug('Edoxaban SAVAYSA tablets');
    expect(edoxaban.tubeRoute, contains('Gastric'));
    expect(edoxaban.preparation, contains('2 to 3 ounces'));
    expect(edoxaban.preparation, contains('immediately'));
    expect(edoxaban.doNot, contains('jejunal'));

    final ticagrelor = tubeDrug('Ticagrelor tablets');
    expect(ticagrelor.tubeRoute, contains('CH8'));
    expect(ticagrelor.preparation, contains('does not specify'));
    expect(ticagrelor.feedPlan, contains('without food'));

    final phenytoinSuspension =
        tubeDrug('Phenytoin oral suspension 125 mg/5 mL');
    expect(phenytoinSuspension.status, contains('Avoid tube'));
    expect(phenytoinSuspension.preparation, contains('Shake'));
    expect(phenytoinSuspension.feedPlan, contains('2 hours before'));
    expect(phenytoinSuspension.feedPlan, contains('2 hours after'));
    expect(phenytoinSuspension.monitoring, contains('serum phenytoin'));

    final levetiracetamTube =
        tubeDrug('Levetiracetam tablets for oral suspension');
    expect(levetiracetamTube.tubeRoute, contains('10 to 14'));
    expect(levetiracetamTube.preparation, contains('10 mL'));
    expect(levetiracetamTube.preparation, contains('flush the feeding tube twice'));
    expect(levetiracetamTube.doNot, contains('partial tablets'));

    final baclofenSuspension = tubeDrug('Baclofen oral suspension 5 mg/mL');
    expect(baclofenSuspension.tubeRoute, contains('8 French'));
    expect(baclofenSuspension.preparation, contains('15 to 30 mL'));
    expect(baclofenSuspension.preparation, contains('at least 25 mL'));
    expect(baclofenSuspension.preparation, contains('up to 4 hours'));

    final lyvispah = tubeDrug('LYVISPAH baclofen granules');
    expect(lyvispah.tubeRoute, contains('NG tube 8 Fr'));
    expect(lyvispah.tubeRoute, contains('G-tube 12 Fr'));
    expect(lyvispah.tubeRoute, contains('PEG 14 Fr'));
    expect(lyvispah.tubeRoute, contains('GJ tube 16 Fr'));
    expect(lyvispah.preparation, contains('15 mL liquid'));
    expect(lyvispah.preparation, contains('within 2 hours'));
    expect(lyvispah.preparation, contains('invert it three times'));

    final carglumic =
        tubeDrug('Carglumic acid tablets for oral suspension');
    expect(carglumic.preparation, contains('minimum of 2.5 mL'));
    expect(carglumic.preparation, contains('1 to 2 mL'));
    expect(carglumic.feedPlan, contains('immediately before meals or feedings'));
    expect(carglumic.doNot, contains('do not crush'));
    expect(carglumic.pediatricNicu, contains('from birth'));

    final tafinlar =
        tubeDrug('TAFINLAR dabrafenib tablets for oral suspension');
    expect(tafinlar.tubeRoute, contains('10 Fr'));
    expect(tafinlar.tubeRoute, contains('12 Fr'));
    expect(tafinlar.preparation, contains('1 to 4 tablets'));
    expect(tafinlar.preparation, contains('5 to 15 tablets'));
    expect(tafinlar.preparation, contains('at least 3 minutes'));
    expect(tafinlar.preparation, contains('30 minutes'));
    expect(tafinlar.feedPlan, contains('1 hour before'));
    expect(tafinlar.feedPlan, contains('2 hours after'));

    final linzess = tubeDrug('LINZESS linaclotide capsules');
    expect(linzess.preparation, contains('30 mL room-temperature bottled water'));
    expect(linzess.preparation, contains('at least 20 seconds'));
    expect(linzess.preparation, contains('10 mL per 10 seconds'));
    expect(linzess.preparation, contains('at least 10 mL water'));
    expect(linzess.feedPlan, contains('30 minutes before'));
    expect(linzess.pediatricNicu, contains('younger than 2 years'));

    final tagrisso = tubeDrug('TAGRISSO osimertinib tablets');
    expect(tagrisso.tubeRoute, contains('Nasogastric'));
    expect(tagrisso.preparation, contains('15 mL non-carbonated water'));
    expect(tagrisso.preparation, contains('additional 15 mL'));
    expect(tagrisso.preparation, contains('approximately 30 mL water'));
    expect(tagrisso.preparation, contains('within 30 minutes'));
    expect(tagrisso.doNot, contains('Do not crush'));

    final lenvima = tubeDrug('LENVIMA lenvatinib capsules');
    expect(lenvima.tubeRoute, contains('5 French'));
    expect(lenvima.tubeRoute, contains('6 French'));
    expect(lenvima.preparation, contains('20 mL syringe'));
    expect(lenvima.preparation, contains('3 mL water'));
    expect(lenvima.preparation, contains('Wait 10 minutes'));
    expect(lenvima.preparation, contains('3 minutes'));
    expect(lenvima.preparation, contains('another 2 mL water'));
    expect(lenvima.doNot, contains('silicone'));

    final mekinist = tubeDrug('MEKINIST trametinib oral solution');
    expect(mekinist.tubeRoute, contains('4 French'));
    expect(mekinist.preparation, contains('90 mL'));
    expect(mekinist.preparation, contains('0.05 mg/mL'));
    expect(mekinist.preparation, contains('35 days'));
    expect(mekinist.preparation, contains('20 mL oral syringe'));
    expect(mekinist.doNot, contains('manufacturer instructions'));
    expect(mekinist.feedPlan, contains('1 hour before'));
    expect(mekinist.feedPlan, contains('2 hours after'));

    final glycerolPhenylbutyrate =
        tubeDrug('Glycerol phenylbutyrate oral liquid 1.1 g/mL');
    expect(glycerolPhenylbutyrate.preparation, contains('new dry oral syringe'));
    expect(glycerolPhenylbutyrate.preparation, contains('10 mL water or formula'));
    expect(glycerolPhenylbutyrate.preparation, contains('28 days'));
    expect(glycerolPhenylbutyrate.doNot, contains('below 1 mL'));
    expect(glycerolPhenylbutyrate.monitoring, contains('ammonia'));
    expect(glycerolPhenylbutyrate.pediatricNicu, contains('younger than 2 months'));

    final epidiolex = tubeDrug('EPIDIOLEX cannabidiol oral solution');
    expect(epidiolex.tubeRoute, contains('Silicone'));
    expect(epidiolex.tubeRoute, contains('PVC'));
    expect(epidiolex.tubeRoute, contains('polyurethane'));
    expect(epidiolex.tubeRoute, contains('50 cm'));
    expect(epidiolex.tubeRoute, contains('5 Fr'));
    expect(epidiolex.preparation, contains('5 times the priming volume'));
    expect(epidiolex.feedPlan, contains('consistent'));

    final fintepla = tubeDrug('FINTEPLA fenfluramine oral solution');
    expect(fintepla.formulation, contains('2.2 mg/mL'));
    expect(fintepla.tubeRoute, contains('gastric'));
    expect(fintepla.tubeRoute, contains('nasogastric'));
    expect(fintepla.preparation, contains('3 mL or 6 mL'));
    expect(fintepla.doNot, contains('fixed flush volume'));
    expect(fintepla.pediatricNicu, contains('2 years'));

    final daybue = tubeDrug('DAYBUE trofinetide oral solution');
    expect(daybue.formulation, contains('200 mg/mL'));
    expect(daybue.tubeRoute, contains('Gastrostomy'));
    expect(daybue.tubeRoute, contains('G-port'));
    expect(daybue.doNot, contains('J-port'));
    expect(daybue.doNot, contains('NG tube'));
    expect(daybue.preparation, contains('14 days'));
    expect(daybue.pediatricNicu, contains('9 kg'));

    final evrysdiSolution =
        tubeDrug('EVRYSDI risdiplam oral solution 0.75 mg/mL');
    expect(evrysdiSolution.preparation, contains('79 mL'));
    expect(evrysdiSolution.preparation, contains('0.75 mg/mL'));
    expect(evrysdiSolution.preparation, contains('15 seconds'));
    expect(evrysdiSolution.preparation, contains('10 minutes'));
    expect(evrysdiSolution.preparation, contains('10 to 20 mL water'));
    expect(evrysdiSolution.preparation, contains('5 minutes'));
    expect(evrysdiSolution.preparation, contains('64 days'));
    expect(evrysdiSolution.pediatricNicu, contains('younger than 2 months'));

    final evrysdiTablet =
        tubeDrug('EVRYSDI risdiplam 5 mg tablet dispersion');
    expect(evrysdiTablet.tubeRoute, contains('8 French'));
    expect(evrysdiTablet.preparation, contains('5 mL'));
    expect(evrysdiTablet.preparation, contains('up to 3 minutes'));
    expect(evrysdiTablet.preparation, contains('within 10 minutes'));
    expect(evrysdiTablet.preparation, contains('at least 15 mL'));
    expect(evrysdiTablet.doNot, contains('Do not chew, cut or crush'));


    final brivaracetam =
        tubeDrug('Brivaracetam oral solution 10 mg/mL');
    expect(brivaracetam.tubeRoute, contains('Nasogastric'));
    expect(brivaracetam.tubeRoute, contains('gastrostomy'));
    expect(brivaracetam.preparation, contains('No dilution is necessary'));
    expect(brivaracetam.preparation, contains('5 months'));
    expect(brivaracetam.pediatricNicu, contains('1 month of age'));

    final lacosamide =
        tubeDrug('Lacosamide oral solution 10 mg/mL');
    expect(lacosamide.tubeRoute, contains('Nasogastric'));
    expect(lacosamide.tubeRoute, contains('gastrostomy'));
    expect(lacosamide.preparation, contains('6 months'));
    expect(lacosamide.monitoring, contains('at least 1 week'));
    expect(lacosamide.pediatricNicu, contains('1 month of age'));

    final sodiumPhenylbutyrate =
        tubeDrug('Sodium phenylbutyrate powder');
    expect(sodiumPhenylbutyrate.tubeRoute, contains('gastrostomy'));
    expect(sodiumPhenylbutyrate.tubeRoute, contains('nasogastric'));
    expect(sodiumPhenylbutyrate.preparation, contains('1 week'));
    expect(sodiumPhenylbutyrate.preparation, contains('5 g per 10 mL'));
    expect(sodiumPhenylbutyrate.feedPlan, contains('3 to 6 times'));
    expect(sodiumPhenylbutyrate.pediatricNicu, contains('first 28 days'));

    final morphineEr =
        tubeDrug('Morphine sulfate extended-release pellet capsules');
    expect(morphineEr.status, contains('Do NOT'));
    expect(morphineEr.tubeRoute, contains('No supported'));
    expect(morphineEr.doNot, contains('nasogastric'));
    expect(morphineEr.doNot, contains('gastric tube'));
    expect(morphineEr.doNot, contains('overdose or death'));

    final xtampza =
        tubeDrug('XTAMPZA ER oxycodone extended-release capsules');
    expect(xtampza.tubeRoute, contains('Nasogastric'));
    expect(xtampza.tubeRoute, contains('gastrostomy'));
    expect(xtampza.preparation, contains('15 mL'));
    expect(xtampza.preparation, contains('two more times'));
    expect(xtampza.preparation, contains('10 mL'));
    expect(xtampza.doNot, contains('Do not pre-mix'));
    expect(xtampza.feedPlan, contains('must be administered with food'));

    final rozlytrek =
        tubeDrug('ROZLYTREK entrectinib capsules prepared as suspension');
    expect(rozlytrek.tubeRoute, contains('8 French'));
    expect(rozlytrek.preparation, contains('15 minutes'));
    expect(rozlytrek.preparation, contains('2 aliquots'));
    expect(rozlytrek.preparation, contains('three 10 mL aliquots'));
    expect(rozlytrek.preparation, contains('equal in volume'));
    expect(rozlytrek.doNot, contains('oral pellets'));
    expect(rozlytrek.doNot, contains('clog'));
  });

  test('IV structured catalog is locked to verified preparation profiles', () {
    expect(ivPreparationProfiles.length, greaterThanOrEqualTo(24));

    for (final entry in ivMedicationCatalog.where((item) => item.structured)) {
      expect(
        findIvPreparationProfile(entry.name, entry.population),
        isNotNull,
        reason: 'Structured IV entry missing profile: ' +
            entry.name +
            ' · ' +
            entry.population,
      );
    }

    for (final profile in ivPreparationProfiles) {
      expect(profile.sourceLabel.trim(), isNotEmpty);
      expect(profile.formulation.trim(), isNotEmpty);
      expect(profile.reconstitution.trim(), isNotEmpty);
      expect(
        ivMedicationCatalog.any(
          (entry) =>
              entry.name == profile.name &&
              entry.population == profile.population &&
              entry.structured,
        ),
        isTrue,
        reason: 'IV profile not marked structured in catalog: ' + profile.name,
      );
      if (profile.withdrawalConcentration != null) {
        expect(profile.withdrawalConcentration!, greaterThan(0));
        expect(profile.withdrawalUnit.trim(), isNotEmpty);
      }
    }

    final vancomycin =
        findIvPreparationProfile('Vancomycin', 'General')!;
    final meropenem =
        findIvPreparationProfile('Meropenem', 'General')!;
    final piperacillinTazobactam =
        findIvPreparationProfile('Piperacillin / Tazobactam', 'General')!;
    final ceftriaxone =
        findIvPreparationProfile('Ceftriaxone', 'General')!;
    final levetiracetam =
        findIvPreparationProfile('Levetiracetam', 'General')!;
    final ampicillinSulbactam =
        findIvPreparationProfile('Ampicillin / Sulbactam', 'General')!;
    final cefazolin =
        findIvPreparationProfile('Cefazolin', 'General')!;
    final clindamycin =
        findIvPreparationProfile('Clindamycin', 'General')!;
    final pantoprazole =
        findIvPreparationProfile('Pantoprazole', 'General')!;
    final metronidazole =
        findIvPreparationProfile('Metronidazole', 'General')!;
    final linezolid =
        findIvPreparationProfile('Linezolid', 'General')!;

    expect(vancomycin.stability, contains('14 days'));
    expect(meropenem.stability, contains('3 hours'));
    expect(piperacillinTazobactam.resultingConcentration, contains('202.5'));
    expect(ceftriaxone.reconstitution, contains('9.6 mL'));

    expect(levetiracetam.withdrawalConcentration, 100);
    expect(levetiracetam.furtherDilution, contains('15 mg/mL'));
    expect(levetiracetam.administration, contains('15-minute'));

    expect(ampicillinSulbactam.reconstitution, contains('3.2 mL'));
    expect(ampicillinSulbactam.reconstitution, contains('6.4 mL'));
    expect(ampicillinSulbactam.resultingConcentration, contains('375 mg/mL'));
    expect(ampicillinSulbactam.incompatibilities, contains('Aminoglycosides'));

    expect(cefazolin.reconstitution, contains('2.5 mL'));
    expect(cefazolin.resultingConcentration, contains('330 mg/mL'));
    expect(cefazolin.stability, contains('10 days'));

    expect(clindamycin.withdrawalConcentration, 150);
    expect(clindamycin.furtherDilution, contains('18 mg/mL'));
    expect(clindamycin.administration, contains('30 mg/min'));

    expect(pantoprazole.reconstitution, contains('10 mL'));
    expect(pantoprazole.resultingConcentration, contains('4 mg/mL'));
    expect(pantoprazole.furtherDilution, contains('0.4 mg/mL'));

    expect(metronidazole.resultingConcentration, contains('5 mg/mL'));
    expect(metronidazole.furtherDilution, contains('None required'));
    expect(
      metronidazole.criticalLocks.join(' ').toLowerCase(),
      contains('ready-to-use'),
    );

    expect(linezolid.resultingConcentration, contains('2 mg/mL'));
    expect(linezolid.furtherDilution, contains('No routine further dilution'));
    expect(linezolid.administration, contains('30–120 minutes'));

    final acyclovir =
        findIvPreparationProfile('Acyclovir', 'General')!;
    final ivParacetamol =
        findIvPreparationProfile('IV Paracetamol', 'General')!;
    final gentamicin =
        findIvPreparationProfile('Gentamicin', 'General')!;
    final fluconazole =
        findIvPreparationProfile('Fluconazole', 'General')!;
    final ondansetron =
        findIvPreparationProfile('Ondansetron', 'General')!;

    expect(acyclovir.reconstitution, contains('500 mg'));
    expect(acyclovir.reconstitution, contains('10 mL'));
    expect(acyclovir.resultingConcentration, contains('50 mg/mL'));
    expect(acyclovir.furtherDilution, contains('7 mg/mL'));
    expect(acyclovir.administration.toLowerCase(), contains('1 hour'));
    expect(acyclovir.administration.toLowerCase(), contains('bolus'));

    expect(ivParacetamol.resultingConcentration, contains('10 mg/mL'));
    expect(ivParacetamol.administration, contains('15-minute'));
    expect(ivParacetamol.stability, contains('6 hours'));

    expect(gentamicin.withdrawalConcentration, 40);
    expect(gentamicin.furtherDilution, contains('50–200 mL'));
    expect(gentamicin.administration, contains('30 minutes to 2 hours'));
    expect(gentamicin.criticalLocks.join(' '), contains('10 mg/mL'));

    expect(fluconazole.resultingConcentration, contains('2 mg/mL'));
    expect(fluconazole.furtherDilution, contains('No routine further dilution'));
    expect(fluconazole.administration, contains('200 mg/hour'));

    expect(ondansetron.withdrawalConcentration, 2);
    expect(ondansetron.furtherDilution, contains('Chemotherapy'));
    expect(ondansetron.furtherDilution, contains('Postoperative'));
    expect(ondansetron.furtherDilution, contains('50 mL'));
    expect(ondansetron.administration, contains('15 minutes'));
    expect(ondansetron.administration, contains('30 seconds'));
    expect(ondansetron.stability, contains('24 hours'));

    final cefepime =
        findIvPreparationProfile('Cefepime', 'General')!;
    final ampicillin =
        findIvPreparationProfile('Ampicillin', 'General')!;
    final azithromycinIv =
        findIvPreparationProfile('Azithromycin', 'General')!;
    final micafungin =
        findIvPreparationProfile('Micafungin', 'General')!;
    final fosphenytoin =
        findIvPreparationProfile('Fosphenytoin', 'General')!;
    final amiodaroneIv =
        findIvPreparationProfile('Amiodarone', 'General')!;

    expect(cefepime.reconstitution, contains('1 g'));
    expect(cefepime.reconstitution, contains('2 g'));
    expect(cefepime.resultingConcentration, contains('100 mg/mL'));
    expect(cefepime.resultingConcentration, contains('160 mg/mL'));
    expect(cefepime.administration, contains('30 minutes'));

    expect(ampicillin.reconstitution, contains('7.4 mL'));
    expect(ampicillin.reconstitution, contains('14.8 mL'));
    expect(ampicillin.criticalLocks.join(' ').toLowerCase(), contains('newborn'));
    expect(ampicillin.administration, contains('10–15 minutes'));

    expect(azithromycinIv.withdrawalConcentration, 100);
    expect(azithromycinIv.reconstitution, contains('4.8 mL'));
    expect(azithromycinIv.furtherDilution, contains('1 mg/mL'));
    expect(azithromycinIv.furtherDilution, contains('2 mg/mL'));
    expect(azithromycinIv.administration, contains('3 hours'));
    expect(azithromycinIv.administration, contains('1 hour'));

    expect(micafungin.reconstitution, contains('5 mL'));
    expect(micafungin.resultingConcentration, contains('10 mg/mL'));
    expect(micafungin.resultingConcentration, contains('20 mg/mL'));
    expect(micafungin.administration, contains('1 hour'));
    expect(micafungin.criticalLocks.join(' '), contains('1.5 mg/mL'));

    expect(fosphenytoin.withdrawalConcentration, 50);
    expect(fosphenytoin.withdrawalUnit, contains('mg PE'));
    expect(fosphenytoin.furtherDilution, contains('1.5 to 25 mg PE/mL'));
    expect(fosphenytoin.criticalLocks.join(' '), contains('500 mg PE'));

    expect(amiodaroneIv.withdrawalConcentration, 50);
    expect(amiodaroneIv.resultingConcentration, contains('1.5 mg/mL'));
    expect(amiodaroneIv.resultingConcentration, contains('1.8 mg/mL'));
    expect(amiodaroneIv.allowedDiluents, contains('D5W'));
    expect(amiodaroneIv.administration, contains('150 mg over 10 minutes'));
    expect(amiodaroneIv.criticalLocks.join(' '), contains('central venous'));

    expect(
      findIvPreparationProfile('Sodium bicarbonate', 'NICU'),
      isNull,
      reason:
          'Unsourced legacy NICU sodium-bicarbonate recipe must remain locked.',
    );
  });

  test('IV catalog contains general NICU and PICU content', () {
    final populations = ivMedicationCatalog.map((item) => item.population).toSet();

    expect(populations, contains('General'));
    expect(populations, contains('NICU'));
    expect(populations, contains('PICU'));
    expect(ivMedicationCatalog.length, greaterThan(80));
  });
}
