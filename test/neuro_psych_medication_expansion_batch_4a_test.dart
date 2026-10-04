import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';
import 'package:drug_edu/features/visual_guides/data/visual_guide_catalog.dart';

void main() {
  group('Neuro psych medication expansion batch 4A', () {
    const ids = <String>[
      'trazodone-ir-tablets',
      'lurasidone-tablets',
      'ziprasidone-capsules',
      'quetiapine-xr',
      'oxcarbazepine-oxtellar-xr',
      'carbidopa-levodopa-rytary',
      'rivastigmine-transdermal',
      'galantamine-er',
      'cladribine-mavenclad',
      'diroximel-fumarate-vumerity',
    ];

    test('adds ten complete unique records and raises census to 360', () {
      final allIds = sampleMedications.map((m) => m.id).toList();
      expect(sampleMedications.length, 360);
      expect(allIds.toSet().length, 360);

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

    test('psychiatric food rules remain distinct and formulation-specific', () {
      final byId = {for (final m in sampleMedications) m.id: m};

      expect(
        byId['trazodone-ir-tablets']!.patient.timingAr,
        allOf(contains('بعد الوجبة'), contains('snack خفيف')),
      );

      expect(
        byId['lurasidone-tablets']!.patient.timingAr,
        allOf(contains('350'), contains('على الأقل')),
      );
      expect(
        medicationTimingRules['lurasidone-tablets']!.requiresMealChoice,
        isTrue,
      );

      expect(
        byId['ziprasidone-capsules']!.patient.timingAr,
        contains('مع الطعام'),
      );
      expect(
        byId['ziprasidone-capsules']!.patient.howToUseAr,
        contains('لا تفتحها'),
      );

      final xr = byId['quetiapine-xr']!;
      final ir = byId['quetiapine']!;
      expect(xr.id, isNot(ir.id));
      expect(
        xr.patient.timingAr,
        allOf(
          contains('مساءً'),
          contains('بدون طعام'),
          contains('300'),
        ),
      );
      expect(
        xr.patient.howToUseAr,
        allOf(contains('XR كاملة'), contains('لا تكسرها')),
      );
    });

    test('OXTELLAR XR keeps exact empty-stomach and whole-tablet locks', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'oxcarbazepine-oxtellar-xr');

      expect(
        m.patient.timingAr,
        allOf(contains('قبل الطعام بساعة'), contains('بعده بساعتين')),
      );
      expect(
        m.patient.howToUseAr,
        allOf(contains('مرة يوميًا'), contains('لا تقطعها')),
      );
      expect(m.patient.importantAr, contains('لا توقف'));
    });

    test('RYTARY preserves food delay sprinkle and non-interchangeability', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'carbidopa-levodopa-rytary');

      expect(
        m.patient.timingAr,
        allOf(
          contains('مع الطعام أو بدونه'),
          contains('تؤخر'),
          contains('ساعتين'),
        ),
      );
      expect(
        m.patient.howToUseAr,
        allOf(
          contains('1–2 ملعقة'),
          contains('applesauce'),
          contains('فورًا'),
        ),
      );
      expect(
        m.patient.importantAr,
        contains('ليست مساوية mg-for-mg'),
      );
    });

    test('rivastigmine patch locks one-patch rotation and restart technique', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'rivastigmine-transdermal');

      expect(m.hasVisualGuide, isTrue);
      expect(visualGuidesForMedication(m.id), isNotEmpty);
      expect(
        visualGuidesForMedication(m.id).single.id,
        equals('rivastigmine-patch'),
      );
      expect(
        m.patient.importantAr,
        allOf(contains('14 يومًا'), contains('أكثر من 3 أيام')),
      );
      expect(
        m.patient.missedDoseAr,
        allOf(contains('فورًا'), contains('لا تضع اثنتين')),
      );
    });

    test('galantamine ER stays morning-with-food and restart-sensitive', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'galantamine-er');

      expect(
        m.patient.timingAr,
        allOf(contains('صباحًا'), contains('مع الطعام')),
      );
      expect(m.patient.importantAr, contains('أكثر من 3 أيام'));
    });

    test('MAVENCLAD preserves cycles cytotoxic handling and 3-hour separation',
        () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'cladribine-mavenclad');

      expect(
        m.patient.timingAr,
        allOf(contains('3 ساعات'), contains('دواء فموي')),
      );
      expect(
        m.patient.howToUseAr,
        allOf(
          contains('جافتين'),
          contains('blister'),
          contains('اغسل يديك'),
        ),
      );
      expect(
        m.patient.missedDoseAr,
        allOf(contains('اليوم التالي'), contains('مدد الدورة')),
      );
    });

    test('VUMERITY keeps delayed-release and meal-quality constraints', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'diroximel-fumarate-vumerity');

      expect(
        m.patient.timingAr,
        allOf(
          contains('700'),
          contains('30 g'),
          contains('الكحول'),
        ),
      );
      expect(
        m.patient.howToUseAr,
        allOf(contains('لا تفتحها'), contains('لا تسحقها')),
      );
    });
  });
}
