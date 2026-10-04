import 'package:flutter_test/flutter_test.dart';

import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';

void main() {
  group('Patient education medication expansion batch 3A', () {
    const newIds = <String>[
      'glipizide-ir',
      'glipizide-er',
      'insulin-aspart-novolog',
      'isosorbide-mononitrate-er',
      'clonidine-transdermal',
      'esomeprazole-dr-capsule',
      'fosfomycin-tromethamine-sachet',
      'levofloxacin-oral',
      'topiramate-tablets',
      'aripiprazole-tablets',
      'olanzapine-tablets',
      'tranexamic-acid-hmb-650mg',
      'micronized-progesterone-oral',
    ];

    test('adds 13 distinct high-value medication records', () {
      final ids = sampleMedications.map((medicine) => medicine.id).toList();
      for (final id in newIds) {
        expect(ids, contains(id), reason: id);
      }
      expect(ids.toSet().length, ids.length);
      expect(sampleMedications.length, greaterThanOrEqualTo(226));
    });

    test('every new medication has timing, duration and English counseling', () {
      for (final id in newIds) {
        expect(medicationTimingRules[id], isNotNull, reason: 'timing: ' + id);
        expect(therapyDurationFor(id), isNotNull, reason: 'duration: ' + id);
        expect(
          englishPatientCounselingFor(id),
          isNotNull,
          reason: 'english: ' + id,
        );
      }
    });

    test('formulation traps remain separated', () {
      expect(
        medicationTimingRules['glipizide-ir']!.instructionAr,
        contains('30'),
      );
      expect(
        medicationTimingRules['glipizide-er']!.anchor,
        'breakfast',
      );
      expect(
        medicationTimingRules['insulin-aspart-novolog']!.autoScheduleSafe,
        isFalse,
      );
      expect(
        medicationTimingRules['esomeprazole-dr-capsule']!.autoScheduleSafe,
        isFalse,
      );
    });

    test('single-use and cycle-limited therapies are not auto-expanded', () {
      expect(
        therapyDurationFor('fosfomycin-tromethamine-sachet')!.kind,
        TherapyDurationKind.singleUse,
      );
      expect(
        medicationTimingRules['fosfomycin-tromethamine-sachet']!
            .autoScheduleSafe,
        isFalse,
      );
      expect(
        medicationTimingRules['tranexamic-acid-hmb-650mg']!.autoScheduleSafe,
        isFalse,
      );
      expect(
        medicationTimingRules['clonidine-transdermal']!.autoScheduleSafe,
        isFalse,
      );
    });

    test('critical counseling text is present for high-risk records', () {
      final byId = {
        for (final medicine in sampleMedications) medicine.id: medicine,
      };

      expect(
        byId['levofloxacin-oral']!.patient.importantAr,
        contains('وتر'),
      );
      expect(
        byId['clonidine-transdermal']!.patient.importantAr,
        contains('MRI'),
      );
      expect(
        byId['tranexamic-acid-hmb-650mg']!.patient.importantAr,
        contains('estrogen'),
      );
      expect(
        byId['micronized-progesterone-oral']!.patient.importantAr,
        contains('peanut'),
      );
      expect(
        byId['aripiprazole-tablets']!.patient.importantAr,
        contains('المقامرة'),
      );
    });
  });
}
