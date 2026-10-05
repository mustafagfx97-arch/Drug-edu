import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';

void main() {
  group('Respiratory and GI modified-release conversion batch 4L', () {
    const newIds = <String>[
      'theophylline-er-tablets',
      'mesalamine-dr-800mg',
    ];

    test('adds two unique records and raises census to 408', () {
      final ids = sampleMedications.map((m) => m.id).toList();
      expect(sampleMedications.length, 408);
      expect(ids.toSet().length, 408);

      for (final id in newIds) {
        expect(ids, contains(id), reason: id);
        expect(medicationTimingRules[id], isNotNull, reason: 'timing $id');
        expect(medicationTimingRules[id]!.autoScheduleSafe, isFalse,
            reason: 'auto schedule $id');
        expect(therapyDurationFor(id), isNotNull, reason: 'duration $id');
        expect(englishPatientCounselingFor(id), isNotNull,
            reason: 'English counseling $id');

        final m = sampleMedications.firstWhere((m) => m.id == id);
        expect(m.useProfile.releaseConversion.trim(), isNotEmpty,
            reason: 'conversion $id');
      }
    });

    test('theophylline once-daily conversion requires stable q12h levels', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'theophylline-er-tablets');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('therapeutic serum levels on a q12h ER regimen'),
          contains('twice the q12h dose'),
          contains('200 mg every 12 hours'),
          contains('400 mg once daily'),
          contains('before and after the switch'),
        ),
      );
      expect(m.patient.timingAr, contains('لا يُنصح بأخذ الجرعة اليومية ليلًا'));
      expect(m.patient.importantAr,
          allOf(contains('ضعف جرعة كل 12 ساعة'), contains('فحص مستوى')));
    });

    test('nifedipine IR to ER conversion is locked to controlled angina context',
        () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'nifedipine-er');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('angina patients'),
          contains('nearest equivalent total daily'),
          contains('30 mg three times daily'),
          contains('90 mg once daily'),
          contains('should not be generalized'),
        ),
      );
      expect(medicationTimingRules['nifedipine-er']!.autoScheduleSafe, isFalse);
      expect(m.patient.importantAr,
          allOf(contains('للذبحة'), contains('لا تعمم')));
    });

    test('LIALDA explicitly blocks milligram-matching substitution', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'mesalamine-lialda');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('Do not auto-convert LIALDA'),
          contains('release site'),
          contains('food instructions'),
          contains('mg-for-mg'),
        ),
      );
      expect(m.patient.importantAr,
          allOf(contains('لا تبدّل'), contains('مجموع الـmg')));
    });

    test('mesalamine 800 mg is not two 400 mg modified-release products', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'mesalamine-dr-800mg');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('Do not substitute one mesalamine delayed-release 800 mg tablet'),
          contains('two mesalamine delayed-release 400 mg'),
          contains('not clinically interchangeable'),
        ),
      );
      expect(
        m.patient.timingAr,
        allOf(contains('قبل الطعام بساعة'), contains('بعده بساعتين')),
      );
      expect(m.patient.importantAr,
          allOf(contains('800 mg'), contains('حبتين 400 mg')));
    });

    test('metronidazole ER blocks automatic IR schedule transfer', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'metronidazole-er');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('750 mg once daily for 7 days'),
          contains('fasting'),
          contains('does not provide a general immediate-release → ER conversion rule'),
          contains('Do not convert'),
        ),
      );
      expect(m.patient.importantAr,
          allOf(contains('مرة يوميًا لمدة 7 أيام'), contains('معدة فارغة')));
      expect(medicationTimingRules['metronidazole-er']!.autoScheduleSafe,
          isFalse);
    });
  });
}
