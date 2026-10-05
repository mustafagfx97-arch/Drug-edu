import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';

void main() {
  group('Pain respiratory GI release conversion batch 4L', () {
    const ids = <String>[
      'tapentadol-er',
      'theophylline-er-once-daily',
      'mesalamine-dr-800mg',
    ];

    test('adds three unique formulation-specific records and raises census to 409', () {
      final allIds = sampleMedications.map((m) => m.id).toList();
      expect(sampleMedications.length, 409);
      expect(allIds.toSet().length, 409);

      for (final id in ids) {
        expect(allIds, contains(id), reason: id);
        expect(medicationTimingRules[id], isNotNull, reason: 'timing $id');
        expect(medicationTimingRules[id]!.autoScheduleSafe, isFalse,
            reason: 'auto schedule $id');
        expect(therapyDurationFor(id), isNotNull, reason: 'duration $id');
        expect(englishPatientCounselingFor(id), isNotNull,
            reason: 'English counseling $id');

        final m = sampleMedications.firstWhere((m) => m.id == id);
        expect(m.useProfile.releaseConversion.trim(), isNotEmpty,
            reason: 'conversion $id');
        expect(
          m.useProfile.facts.any(
            (fact) =>
                fact.title == 'IR / XR-ER conversion' &&
                fact.value.trim().isNotEmpty,
          ),
          isTrue,
          reason: 'displayed conversion fact $id',
        );
      }
    });

    test('tapentadol IR converts by same total daily dose split every 12 hours', () {
      final m = sampleMedications.firstWhere((m) => m.id == 'tapentadol-er');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('equivalent total daily tapentadol dose'),
          contains('two equal ER doses'),
          contains('50 mg four times daily'),
          contains('200 mg/day'),
          contains('100 mg twice daily'),
        ),
      );
      expect(
        m.patient.importantAr,
        allOf(contains('200 mg/day'), contains('100 mg ER مرتين يوميًا')),
      );
      expect(
        m.useProfile.commonMistakes,
        contains('different opioid'),
      );
    });

    test('theophylline transfer is mg-for-mg only for stabilized age 12 plus',
        () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'theophylline-er-once-daily');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('Stabilized patients age 12 years or older'),
          contains('milligram-for-milligram'),
          contains('400 or 600 mg'),
          contains('peak and trough'),
          contains('serum theophylline monitoring'),
        ),
      );
      expect(
        m.patient.timingAr,
        allOf(contains('صباحًا أو مساءً'), contains('مع الطعام'), contains('بدون طعام')),
      );
      expect(
        m.patient.importantAr,
        allOf(contains('12 سنة'), contains('مستوى الدواء في الدم')),
      );
    });

    test('mesalamine 800 mg delayed release blocks tablet arithmetic substitution',
        () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'mesalamine-dr-800mg');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('Do not substitute one mesalamine delayed-release 800 mg tablet'),
          contains('two 400 mg'),
          contains('release characteristics'),
          contains('site of drug delivery'),
        ),
      );
      expect(
        m.patient.timingAr,
        allOf(contains('قبل الطعام بساعة'), contains('بعده بساعتين')),
      );
      expect(
        m.patient.importantAr,
        allOf(contains('800 mg'), contains('400 mg'), contains('نظام الإطلاق')),
      );
    });
  });
}
