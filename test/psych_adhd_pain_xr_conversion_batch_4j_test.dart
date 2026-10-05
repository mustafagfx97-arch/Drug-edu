import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';

void main() {
  group('Psych ADHD and pain XR conversion batch 4J', () {
    const newIds = <String>[
      'guanfacine-er-adhd',
      'clonidine-er-adhd',
      'methylphenidate-ritalin-la',
      'amphetamine-adderall-xr',
      'tramadol-er-tablets',
    ];

    test('adds five unique records and raises census to 404', () {
      final ids = sampleMedications.map((m) => m.id).toList();
      expect(sampleMedications.length, 404);
      expect(ids.toSet().length, 404);

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

    test('lithium ER keeps same total when possible and rounds down to 450-mg grid',
        () {
      final m = sampleMedications.firstWhere((m) => m.id == 'lithium');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('same total daily lithium dose when possible'),
          contains('nearest lower 450-mg multiple'),
          contains('1500 mg/day → ER 1350 mg/day'),
          contains('1–2 weeks'),
        ),
      );
      expect(
        m.patient.importantAr,
        allOf(contains('1500 mg/day'), contains('1350 mg/day ER')),
      );
      expect(medicationTimingRules['lithium']!.autoScheduleSafe, isFalse);
    });

    test('guanfacine ER is re-titrated rather than converted mg-for-mg', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'guanfacine-er-adhd');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('Do not substitute immediate-release guanfacine'),
          contains('1 mg once daily'),
          contains('1 mg/week'),
          contains('lower Cmax and bioavailability'),
        ),
      );
      expect(
        m.patient.howToUseAr,
        allOf(contains('ER كاملة'), contains('عالية الدهون')),
      );
    });

    test('clonidine ER uses its own ADHD titration and bedtime-heavy split', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'clonidine-er-adhd');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('not substitute'),
          contains('0.1 mg at bedtime'),
          contains('0.1 mg/day at weekly intervals'),
          contains('bedtime dose equal to or larger'),
          contains('0.4 mg/day'),
        ),
      );
      expect(
        m.patient.importantAr,
        allOf(contains('لا تحول'), contains('لا توقفه فجأة')),
      );
    });

    test('Ritalin LA preserves exact Ritalin BID conversion table', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'methylphenidate-ritalin-la');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('5 mg BID → Ritalin LA 10 mg QAM'),
          contains('10 mg BID → 20 mg QAM'),
          contains('15 mg BID → 30 mg QAM'),
          contains('20 mg BID → 40 mg QAM'),
          contains('30 mg BID → 60 mg QAM'),
          contains('do not substitute other methylphenidate products'),
        ),
      );
      expect(
        m.patient.howToUseAr,
        allOf(contains('applesauce'), contains('دون مضغ'), contains('لا تخزن')),
      );
    });

    test('ADDERALL IR divided doses convert to XR at same total daily dose', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'amphetamine-adderall-xr');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('same total daily dose'),
          contains('IR 10 mg twice daily'),
          contains('XR 20 mg once daily'),
          contains('should not be generalized'),
        ),
      );
      expect(m.patient.timingAr, contains('صباحًا'));
    });

    test('tramadol IR converts by rounding DOWN to the lower 100-mg ER increment',
        () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'tramadol-er-tablets');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('next LOWER 100-mg increment'),
          contains('250 mg/day → ER 200 mg once daily'),
          contains('300 mg/day → ER 300 mg once daily'),
          contains('Maximum labeled ER dose is 300 mg/day'),
          contains('Do not use other tramadol products concurrently'),
        ),
      );
      expect(
        m.patient.importantAr,
        allOf(contains('250 mg/day'), contains('200 mg ER'), contains('300 mg/day')),
      );
      expect(
        m.patient.howToUseAr,
        allOf(contains('ER كاملة'), contains('لا تقسّمها'), contains('لا تسحقها')),
      );
    });
  });
}
