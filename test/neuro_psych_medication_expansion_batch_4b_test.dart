import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';

void main() {
  group('Neuro psych medication expansion batch 4B', () {
    const ids = <String>[
      'vilazodone-tablets',
      'asenapine-sublingual',
      'phenytoin-extended-capsules',
      'pramipexole-er',
      'opicapone-ongentys',
      'donepezil-odt',
      'memantine-xr',
      'dimethyl-fumarate-dr',
      'teriflunomide-tablets',
      'fingolimod-capsules',
    ];

    test('adds ten complete unique records and raises census to 399', () {
      final allIds = sampleMedications.map((m) => m.id).toList();
      expect(sampleMedications.length, 399);
      expect(allIds.toSet().length, 399);

      for (final id in ids) {
        expect(allIds, contains(id), reason: id);
        expect(medicationTimingRules[id], isNotNull, reason: 'timing $id');
        expect(
          medicationTimingRules[id]!.autoScheduleSafe,
          isFalse,
          reason: 'auto scheduling $id',
        );
        expect(therapyDurationFor(id), isNotNull, reason: 'duration $id');
        expect(
          englishPatientCounselingFor(id),
          isNotNull,
          reason: 'English counseling $id',
        );
      }
    });

    test('vilazodone remains a with-food antidepressant', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'vilazodone-tablets');

      expect(m.patient.timingAr, contains('مع الطعام'));
      expect(m.patient.howToUseAr, contains('الزيادة التدريجية'));
      expect(
        medicationTimingRules[m.id]!.anchor,
        equals('with-meal'),
      );
    });

    test('asenapine preserves exact sublingual and 10-minute technique', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'asenapine-sublingual');

      expect(
        m.patient.howToUseAr,
        allOf(
          contains('تحت اللسان'),
          contains('لا تقسّمها'),
          contains('لا تبتلعها'),
        ),
      );
      expect(
        m.patient.timingAr,
        allOf(contains('10 دقائق'), contains('لا تأكل'), contains('لا تشرب')),
      );
    });

    test('phenytoin extended capsules lock formulation conversion risk', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'phenytoin-extended-capsules');

      expect(
        m.patient.howToUseAr,
        allOf(contains('capsule'), contains('suspension'), contains('mg')),
      );
      expect(
        m.sections.any(
          (s) => s.body.contains('8%') && s.body.contains('free acid'),
        ),
        isTrue,
      );
      expect(m.patient.importantAr, contains('لا توقف'));
    });

    test('pramipexole ER stays once daily whole and food flexible', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'pramipexole-er');

      expect(m.patient.timingAr, contains('مع الطعام أو بدونه'));
      expect(
        m.patient.howToUseAr,
        allOf(contains('مرة يوميًا'), contains('لا تمضغها'), contains('لا تقسّمها')),
      );
      expect(m.patient.importantAr, contains('نومًا مفاجئًا'));
    });

    test('opicapone keeps bedtime one-hour fasting window and skip rule', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'opicapone-ongentys');

      expect(
        m.patient.timingAr,
        allOf(
          contains('عند النوم'),
          contains('ساعة قبل'),
          contains('ساعة على الأقل بعدها'),
        ),
      );
      expect(
        m.patient.missedDoseAr,
        allOf(contains('تجاوزها'), contains('اليوم التالي')),
      );
    });

    test('donepezil ODT and memantine XR preserve formulation handling', () {
      final donepezil =
          sampleMedications.firstWhere((m) => m.id == 'donepezil-odt');
      final memantine =
          sampleMedications.firstWhere((m) => m.id == 'memantine-xr');

      expect(
        donepezil.patient.howToUseAr,
        allOf(contains('على اللسان'), contains('تذوب'), contains('ماء')),
      );
      expect(donepezil.patient.timingAr, contains('مساءً'));

      expect(
        memantine.patient.howToUseAr,
        allOf(
          contains('applesauce'),
          contains('كل المحتوى'),
          contains('لا تقسّم'),
        ),
      );
      expect(memantine.patient.importantAr, contains('عدة أيام'));
    });

    test('dimethyl fumarate preserves food-optional flushing and DR locks', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'dimethyl-fumarate-dr');

      expect(
        m.patient.timingAr,
        allOf(
          contains('مع الطعام أو بدونه'),
          contains('flushing'),
        ),
      );
      expect(
        m.patient.howToUseAr,
        allOf(contains('لا تفتحها'), contains('لا تسحقها')),
      );
    });

    test('teriflunomide keeps food independence and long-elimination warning',
        () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'teriflunomide-tablets');

      expect(m.patient.timingAr, contains('مع الطعام أو بدونه'));
      expect(
        m.patient.importantAr,
        allOf(
          contains('يبقى في الجسم مدة طويلة'),
          contains('accelerated elimination'),
        ),
      );
    });

    test('fingolimod locks first-dose and restart cardiac monitoring', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'fingolimod-capsules');

      expect(m.patient.timingAr, contains('مع الطعام أو بدونه'));
      expect(
        m.patient.howToUseAr,
        allOf(contains('الجرعة الأولى'), contains('مراقبة قلبية')),
      );
      expect(
        m.sections.any(
          (s) => s.body.contains('6 hours') || s.body.contains('6 ساعات'),
        ),
        isTrue,
      );
      expect(
        m.sections.any(
          (s) =>
              s.body.contains('first 2 weeks') &&
              s.body.contains('>14 days'),
        ),
        isTrue,
      );
    });
  });
}
