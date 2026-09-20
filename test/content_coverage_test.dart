import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/medication_clinical_overlays.dart';
import 'package:drug_edu/core/data/medication_patient_guidance.dart';
import 'package:drug_edu/core/data/sample_families.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/core/models/medication.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/expanded_medications.dart';
import 'package:drug_edu/core/data/expanded_medications_2.dart';
import 'package:drug_edu/core/data/expanded_medications_3.dart';
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


  test('medicine encyclopedia has substantial practical coverage', () {
    expect(sampleMedications.length, greaterThanOrEqualTo(139));

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
    final groups = supplementProfiles.map((item) => item.group).toSet();

    expect(groups, contains('Vitamins'));
    expect(groups, contains('Minerals'));
    expect(groups, contains('Pediatric supplements'));
    expect(groups, contains('Combination products'));
    expect(groups, contains('Growth / amino-acid products'));
    expect(groups, contains('Safety review'));
  });

  test('feeding-tube library contains practical safety records', () {
    expect(tubeFeedInteractions.length, greaterThanOrEqualTo(5));
    expect(tubeSafetyRules.length, greaterThanOrEqualTo(6));
    expect(injectableEnteralSafetyRules.length, greaterThanOrEqualTo(3));

    for (final record in tubeFeedInteractions) {
      expect(record.medicine.trim(), isNotEmpty);
      expect(record.feedInstruction.trim(), isNotEmpty);
      expect(record.source.trim(), isNotEmpty);
    }
  });

  test('IV structured catalog is locked to verified preparation profiles', () {
    expect(ivPreparationProfiles.length, greaterThanOrEqualTo(6));

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

    expect(vancomycin.stability, contains('14 days'));
    expect(meropenem.stability, contains('3 hours'));
    expect(piperacillinTazobactam.resultingConcentration, contains('202.5'));
    expect(ceftriaxone.reconstitution, contains('9.6 mL'));

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
