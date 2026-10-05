import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';
import 'package:drug_edu/features/visual_guides/data/visual_guide_catalog.dart';

void main() {
  group('Neuro psych medication expansion batch 4C', () {
    const ids = <String>[
      'paroxetine-paxil-cr',
      'desvenlafaxine-er',
      'lumateperone-caplyta',
      'selegiline-zelapar-odt',
      'entacapone-tablets',
      'ropinirole-er',
      'amantadine-gocovri',
      'siponimod-mayzent',
      'ozanimod-zeposia',
      'ofatumumab-kesimpta',
    ];

    test('adds ten complete unique records and raises census to 402', () {
      final allIds = sampleMedications.map((m) => m.id).toList();
      expect(sampleMedications.length, 402);
      expect(allIds.toSet().length, 402);

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

    test('PAXIL CR stays morning controlled-release and PMDD-specific', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'paroxetine-paxil-cr');

      expect(
        m.patient.timingAr,
        allOf(contains('صباحًا'), contains('مع الطعام أو بدونه')),
      );
      expect(m.patient.howToUseAr, contains('لا تمضغها أو تسحقها'));
      expect(
        m.patient.importantAr,
        allOf(contains('PMDD'), contains('luteal phase')),
      );
    });

    test('desvenlafaxine ER locks whole-tablet and ghost-shell counseling', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'desvenlafaxine-er');

      expect(
        m.patient.howToUseAr,
        allOf(
          contains('لا تقسّمها'),
          contains('لا تسحقها'),
          contains('لا تذيبها'),
        ),
      );
      expect(m.patient.importantAr, contains('القشرة الفارغة'));
    });

    test('CAPLYTA remains food-flexible and no-titration', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'lumateperone-caplyta');

      expect(m.patient.timingAr, contains('مع الطعام أو بدونه'));
      expect(m.patient.howToUseAr, contains('لا تحتاج titration'));
      expect(
        m.patient.importantAr,
        allOf(contains('CYP3A4'), contains('clarithromycin')),
      );
    });

    test('ZELAPAR locks dry-hand blister and five-minute fasting window', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'selegiline-zelapar-odt');

      expect(
        m.patient.howToUseAr,
        allOf(
          contains('جافتين'),
          contains('foil'),
          contains('فوق اللسان'),
          contains('لا تأخذها مع ماء'),
        ),
      );
      expect(
        m.patient.timingAr,
        allOf(
          contains('قبل الفطور'),
          contains('5 دقائق قبل'),
          contains('5 دقائق بعدها'),
        ),
      );
    });

    test('entacapone remains linked to every levodopa carbidopa dose', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'entacapone-tablets');

      expect(
        m.patient.howToUseAr,
        allOf(
          contains('مع كل جرعة levodopa/carbidopa'),
          contains('8 مرات'),
        ),
      );
      expect(m.patient.timingAr, contains('مع الطعام أو بدونه'));
      expect(m.patient.importantAr, contains('لون البول'));
    });

    test('ropinirole ER locks whole-tablet and interruption retitration', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'ropinirole-er');

      expect(
        m.patient.howToUseAr,
        allOf(
          contains('مرة يوميًا'),
          contains('لا تمضغها'),
          contains('لا تسحقها'),
          contains('لا تقسّمها'),
        ),
      );
      expect(m.patient.importantAr, contains('لا ترجع لنفس الجرعة'));
    });

    test('GOCOVRI stays bedtime noninterchangeable and sprinkle-specific', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'amantadine-gocovri');

      expect(
        m.patient.timingAr,
        allOf(contains('عند النوم'), contains('تجنب الكحول')),
      );
      expect(
        m.patient.howToUseAr,
        allOf(
          contains('ملعقة شاي'),
          contains('applesauce'),
          contains('فورًا'),
        ),
      );
      expect(m.patient.importantAr, contains('ليست بديلًا mg-for-mg'));
    });

    test('MAYZENT locks genotype titration and four-dose restart rule', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'siponimod-mayzent');

      expect(m.patient.howToUseAr, contains('CYP2C9'));
      expect(
        m.patient.importantAr,
        allOf(
          contains('4 جرعات'),
          contains('restart'),
          contains('6 ساعات'),
        ),
      );
      expect(
        m.sections.any(
          (s) => s.body.contains('CYP2C9*3/*3') && s.body.contains('1 mg'),
        ),
        isTrue,
      );
    });

    test('ZEPOSIA locks seven-day starter and first-14-days restart', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'ozanimod-zeposia');

      expect(m.patient.howToUseAr, contains('7-day starter pack'));
      expect(
        m.patient.importantAr,
        allOf(
          contains('أول 14 يومًا'),
          contains('starter pack جديد'),
        ),
      );
      expect(m.patient.missedDoseAr, contains('لا تضاعف'));
    });

    test('KESIMPTA locks loading calendar, device technique and storage', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'ofatumumab-kesimpta');

      expect(m.hasVisualGuide, isTrue);
      expect(visualGuidesForMedication(m.id), isNotEmpty);
      expect(
        visualGuidesForMedication(m.id).single.id,
        equals('kesimpta-injection'),
      );
      expect(
        m.patient.timingAr,
        allOf(
          contains('Week 0'),
          contains('Week 1'),
          contains('Week 2'),
          contains('لا توجد جرعة في Week 3'),
          contains('Week 4'),
        ),
      );
      expect(
        m.patient.importantAr,
        allOf(
          contains('15–30 دقيقة'),
          contains('لا ترجّها'),
          contains('HBV'),
        ),
      );
      expect(
        m.patient.storageAr,
        allOf(contains('2–8°C'), contains('لا تجمد')),
      );
    });
  });
}
