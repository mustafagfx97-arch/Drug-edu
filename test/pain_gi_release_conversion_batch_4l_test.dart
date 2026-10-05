import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';

void main() {
  group('Pain and GI release conversion batch 4L', () {
    const ids = <String>[
      'tapentadol-nucynta-er',
      'morphine-sulfate-er-tablets',
      'mesalamine-delayed-release-800mg',
    ];

    test('adds three unique release-conversion records and raises census to 409', () {
      final allIds = sampleMedications.map((m) => m.id).toList();
      expect(sampleMedications.length, 409);
      expect(allIds.toSet().length, 409);
      for (final id in ids) {
        expect(allIds, contains(id));
        expect(medicationTimingRules[id], isNotNull);
        expect(medicationTimingRules[id]!.autoScheduleSafe, isFalse);
        expect(therapyDurationFor(id), isNotNull);
        expect(englishPatientCounselingFor(id), isNotNull);
        expect(
          sampleMedications.firstWhere((m) => m.id == id).useProfile.releaseConversion,
          isNotEmpty,
        );
      }
    });

    test('tapentadol IR total daily dose is split into two equal ER doses', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'tapentadol-nucynta-er');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('equivalent total daily tapentadol IR dose'),
          contains('two equal ER doses'),
          contains('50 mg four times daily'),
          contains('200 mg/day'),
          contains('100 mg every 12 hours'),
          contains('no established clinical-trial conversion ratio'),
        ),
      );
      expect(m.patient.importantAr,
          allOf(contains('200 mg/day'), contains('100 mg ER كل 12 ساعة')));
    });

    test('oral morphine to ER uses half q12h or one-third q8h', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'morphine-sulfate-er-tablets');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('one-half'),
          contains('every 12 hours'),
          contains('one-third'),
          contains('every 8 hours'),
          contains('60 mg/day'),
          contains('30 mg q12h'),
          contains('20 mg q8h'),
          contains('no clinical-trial conversion ratio'),
        ),
      );
      expect(m.patient.howToUseAr,
          allOf(contains('لا تسحقها'), contains('overdose قاتل')));
    });

    test('mesalamine products are locked against milligram substitution', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'mesalamine-delayed-release-800mg');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('must not be auto-converted'),
          contains('do not substitute one 800-mg'),
          contains('two 400-mg'),
          contains('no universal IR/DR/ER mg-for-mg conversion'),
        ),
      );
      expect(m.patient.howToUseAr,
          allOf(contains('قبل الطعام بساعة'), contains('بعده بساعتين')));
      expect(m.patient.importantAr,
          allOf(contains('800 mg'), contains('400 mg')));
    });
  });
}
