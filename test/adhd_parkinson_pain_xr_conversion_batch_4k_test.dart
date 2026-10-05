import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';

void main() {
  group('ADHD Parkinson and pain XR conversion batch 4K', () {
    const newIds = <String>[
      'guanfacine-intuniv-er',
      'clonidine-er-adhd',
      'amantadine-osmolex-er',
      'tramadol-er',
    ];

    test('adds four new records, strengthens GOCOVRI, and raises census to 409', () {
      final ids = sampleMedications.map((m) => m.id).toList();
      expect(sampleMedications.length, 409);
      expect(ids.toSet().length, 409);

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

    test('INTUNIV blocks guanfacine IR milligram substitution', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'guanfacine-intuniv-er');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('Do not substitute immediate-release guanfacine'),
          contains('milligram-per-milligram'),
          contains('discontinue the IR product'),
          contains('start 1 mg once daily'),
          contains('1 mg/week'),
        ),
      );
      expect(m.patient.importantAr,
          allOf(contains('لا تحول'), contains('mg-for-mg')));
    });

    test('clonidine ER uses its own ADHD titration rather than IR dose copy', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'clonidine-er-adhd');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('Do not substitute clonidine ER'),
          contains('milligram-per-milligram'),
          contains('start 0.1 mg at bedtime'),
          contains('0.1 mg/day at weekly intervals'),
          contains('0.4 mg/day'),
        ),
      );
      expect(m.patient.importantAr,
          allOf(contains('لا تحول'), contains('interchangeable mg-for-mg')));
    });

    test('GOCOVRI is a bedtime product and not substitutable with amantadine',
        () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'amantadine-gocovri');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('not substitutable'),
          contains('137 mg once daily at bedtime'),
          contains('274 mg once daily'),
        ),
      );
      expect(m.patient.timingAr, contains('عند النوم'));
      expect(m.patient.howToUseAr,
          allOf(contains('applesauce'), contains('دون مضغ')));
    });

    test('OSMOLEX ER blocks amantadine interchange and locks low IR tolerance',
        () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'amantadine-osmolex-er');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('not interchangeable'),
          contains('129 mg once daily in the morning'),
          contains('322 mg/day'),
          contains('unable to tolerate more than 100 mg/day'),
          contains('no equivalent OSMOLEX ER dose or regimen'),
        ),
      );
      expect(m.patient.howToUseAr,
          allOf(contains('صباحًا'), contains('لا تسحقها')));
      expect(m.useProfile.specialPopulations,
          allOf(contains('every-48-hour'), contains('every-96-hour')));
    });

    test('tramadol IR to ER rounds down to the next lower 100 mg', () {
      final m = sampleMedications.firstWhere((m) => m.id == 'tramadol-er');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('total 24-hour IR tramadol dose'),
          contains('next lower 100-mg increment'),
          contains('250 mg/day → ER 200 mg once daily'),
          contains('300 mg/day → ER 300 mg once daily'),
          contains('maximum is 300 mg/day'),
        ),
      );
      expect(m.patient.importantAr,
          allOf(contains('250 mg/day'), contains('200 mg ER')));
      expect(m.useProfile.commonMistakes,
          allOf(contains('Rounding'), contains('upward')));
    });
  });
}
