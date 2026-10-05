import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';

void main() {
  group('Antibiotic GI antiemetic batch 3G', () {
    const ids = <String>[
      'minocycline-capsules',
      'moxifloxacin-tablets',
      'fidaxomicin-tablets',
      'vancomycin-oral-capsules',
      'rabeprazole-dr-tablets',
      'scopolamine-transdermal',
      'granisetron-oral-tablets',
    ];

    test('adds seven complete records and raises census to 402', () {
      final allIds = sampleMedications.map((m) => m.id).toList();
      expect(sampleMedications.length, 402);
      expect(allIds.toSet().length, 402);
      for (final id in ids) {
        expect(allIds, contains(id));
        expect(medicationTimingRules[id], isNotNull);
        expect(therapyDurationFor(id), isNotNull);
        expect(englishPatientCounselingFor(id), isNotNull);
      }
    });

    test('moxifloxacin keeps its 4-before 8-after cation rule', () {
      final m = sampleMedications.firstWhere((m) => m.id == 'moxifloxacin-tablets');
      expect(m.patient.timingAr, allOf(contains('4 ساعات قبل'), contains('8 ساعات بعد')));
      expect(medicationTimingRules[m.id]!.autoScheduleSafe, isFalse);
    });

    test('oral vancomycin is locked to intestinal indications', () {
      final m = sampleMedications.firstWhere((m) => m.id == 'vancomycin-oral-capsules');
      expect(m.patient.importantAr, allOf(contains('oral vancomycin'), contains('IV vancomycin'), contains('الجهازية')));
      expect(m.patient.timingAr, contains('لا توجد قاعدة طعام'));
    });

    test('rabeprazole meal timing remains indication specific', () {
      final m = sampleMedications.firstWhere((m) => m.id == 'rabeprazole-dr-tablets');
      expect(m.patient.timingAr, allOf(contains('duodenal ulcer'), contains('H. pylori'), contains('مع الطعام أو بدونه')));
      expect(medicationTimingRules[m.id]!.autoScheduleSafe, isFalse);
    });

    test('scopolamine patch technique and lead time are preserved', () {
      final m = sampleMedications.firstWhere((m) => m.id == 'scopolamine-transdermal');
      expect(m.patient.timingAr, allOf(contains('4 ساعات'), contains('3 أيام')));
      expect(m.patient.importantAr, allOf(contains('لا تقص'), contains('أكثر من واحدة')));
    });

    test('fidaxomicin and granisetron indication schedules stay explicit', () {
      final f = sampleMedications.firstWhere((m) => m.id == 'fidaxomicin-tablets');
      expect(f.patient.timingAr, allOf(contains('مع الطعام أو بدونه'), contains('10 أيام')));
      final g = sampleMedications.firstWhere((m) => m.id == 'granisetron-oral-tablets');
      expect(g.patient.timingAr, allOf(contains('لا يرتبط بالطعام'), contains('ساعة قبل')));
    });
  });
}
