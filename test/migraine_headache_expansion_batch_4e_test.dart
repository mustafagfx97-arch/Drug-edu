import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';
import 'package:drug_edu/features/visual_guides/data/visual_guide_catalog.dart';

void main() {
  group('Migraine and headache expansion batch 4E', () {
    const ids = <String>[
      'naratriptan-tablets',
      'frovatriptan-tablets',
      'almotriptan-tablets',
      'sumatriptan-naproxen-tablets',
      'dihydroergotamine-brekiya',
      'dihydroergotamine-nasal-legacy',
      'acetaminophen-otc-500mg',
      'ibuprofen-otc-200mg',
      'naproxen-sodium-otc-220mg',
      'acetaminophen-aspirin-caffeine-migraine',
    ];

    test('adds ten complete unique records and raises census to 409', () {
      final allIds = sampleMedications.map((m) => m.id).toList();
      expect(sampleMedications.length, 409);
      expect(allIds.toSet().length, 409);

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

    test('naratriptan keeps its distinct four-hour repeat and lower impairment max',
        () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'naratriptan-tablets');

      expect(
        m.patient.timingAr,
        allOf(contains('4 ساعات'), contains('5 mg')),
      );
      expect(
        m.useProfile.specialPopulations,
        allOf(contains('1 mg'), contains('2.5 mg/24 h')),
      );
    });

    test('frovatriptan redose is recurrence-after-relief and max three tablets',
        () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'frovatriptan-tablets');

      expect(
        m.patient.timingAr,
        allOf(contains('تحسنت'), contains('ساعتين'), contains('3 حبات')),
      );
      expect(
        m.patient.importantAr,
        contains('لم تستجب النوبة أصلًا'),
      );
    });

    test('almotriptan preserves age 12+ and hepatic renal lower limits', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'almotriptan-tablets');

      expect(m.patient.purposeAr, contains('12 سنة'));
      expect(
        m.patient.timingAr,
        allOf(contains('ساعتين'), contains('25 mg')),
      );
      expect(
        m.useProfile.specialPopulations,
        allOf(contains('6.25 mg'), contains('12.5 mg/24 h')),
      );
    });

    test('sumatriptan naproxen locks whole-tablet NSAID duplication and adult max',
        () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'sumatriptan-naproxen-tablets');

      expect(
        m.patient.howToUseAr,
        allOf(
          contains('لا تقسّمها'),
          contains('لا تسحقها'),
          contains('لا تمضغها'),
        ),
      );
      expect(
        m.patient.timingAr,
        allOf(
          contains('مع الطعام أو بدونه'),
          contains('ساعتين'),
          contains('حبتين'),
        ),
      );
      expect(
        m.patient.importantAr,
        allOf(contains('NSAID'), contains('ibuprofen')),
      );
    });

    test('BREKIYA locks thigh-only autoinjector endpoint and daily weekly limits',
        () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'dihydroergotamine-brekiya');

      expect(m.hasVisualGuide, isTrue);
      expect(visualGuidesForMedication(m.id), isNotEmpty);
      expect(
        visualGuidesForMedication(m.id).single.id,
        equals('brekiya-autoinjector'),
      );
      expect(
        m.patient.howToUseAr,
        allOf(
          contains('منتصف الفخذ فقط'),
          contains('2 inch'),
          contains('10 ثوانٍ'),
          contains('زرقاء بالكامل'),
        ),
      );
      expect(
        m.patient.timingAr,
        allOf(
          contains('3 جرعات خلال 24 ساعة'),
          contains('6 جرعات خلال 7 أيام'),
        ),
      );
    });

    test('legacy DHE nasal remains distinct from TRUDHESA', () {
      final legacy = sampleMedications
          .firstWhere((m) => m.id == 'dihydroergotamine-nasal-legacy');
      final trudhesa = sampleMedications
          .firstWhere((m) => m.id == 'dihydroergotamine-trudhesa');

      expect(legacy.id, isNot(trudhesa.id));
      expect(
        legacy.patient.howToUseAr,
        allOf(
          contains('priming'),
          contains('4 مرات'),
          contains('15 دقيقة'),
          contains('4 بخات'),
        ),
      );
      expect(
        legacy.patient.importantAr,
        contains('ليست تعليمات TRUDHESA'),
      );
      expect(legacy.patient.storageAr, contains('8 ساعات'));
    });

    test('acetaminophen 500 OTC locks product-specific 3000 mg max and duplication',
        () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'acetaminophen-otc-500mg');

      expect(
        m.patient.howToUseAr,
        allOf(
          contains('كل 6 ساعات'),
          contains('6 حبات'),
          contains('3000 mg'),
        ),
      );
      expect(
        m.patient.importantAr,
        allOf(contains('acetaminophen'), contains('4000 mg')),
      );
    });

    test('ibuprofen OTC locks q4-6h max 1200 and NSAID duplication', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'ibuprofen-otc-200mg');

      expect(
        m.patient.howToUseAr,
        allOf(
          contains('كل 4–6 ساعات'),
          contains('1200 mg'),
        ),
      );
      expect(
        m.patient.timingAr,
        allOf(contains('طعام'), contains('حليب')),
      );
      expect(m.patient.importantAr, contains('naproxen'));
    });

    test('naproxen OTC locks first-dose exception full-water and 660 mg max', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'naproxen-sodium-otc-220mg');

      expect(
        m.patient.howToUseAr,
        allOf(
          contains('كل 8–12 ساعة'),
          contains('للجرعة الأولى فقط'),
          contains('660 mg'),
        ),
      );
      expect(m.patient.timingAr, contains('كوب ماء كامل'));
      expect(m.patient.importantAr, contains('ibuprofen'));
    });

    test('OTC migraine triple combo locks one treatment and ingredient accounting',
        () {
      final m = sampleMedications.firstWhere(
        (m) => m.id == 'acetaminophen-aspirin-caffeine-migraine',
      );

      expect(
        m.patient.howToUseAr,
        allOf(
          contains('حبتين'),
          contains('24 ساعة'),
          contains('تحت 18 سنة'),
        ),
      );
      expect(
        m.patient.importantAr,
        allOf(
          contains('acetaminophen 250 mg'),
          contains('aspirin 250 mg'),
          contains('caffeine 65 mg'),
        ),
      );
    });
  });
}
