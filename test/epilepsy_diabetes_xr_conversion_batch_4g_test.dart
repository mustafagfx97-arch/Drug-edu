import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';

void main() {
  group('Epilepsy and diabetes XR conversion batch 4G', () {
    const ids = <String>[
      'carbamazepine-xr-tablets',
      'levetiracetam-xr',
      'topiramate-qudexy-xr',
      'topiramate-trokendi-xr',
      'metformin-er-tablets',
      'glipizide-er',
      'gliclazide-mr-30mg',
    ];

    test('covers seven XR/MR targets, adds six new records, and raises census to 403', () {
      final allIds = sampleMedications.map((m) => m.id).toList();
      expect(sampleMedications.length, 403);
      expect(allIds.toSet().length, 403);

      for (final id in ids) {
        expect(allIds, contains(id), reason: id);
        expect(medicationTimingRules[id], isNotNull, reason: 'timing $id');
        expect(medicationTimingRules[id]!.autoScheduleSafe, isFalse,
            reason: 'auto scheduling $id');
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

    test('carbamazepine conventional tablets convert by same total daily dose', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'carbamazepine-xr-tablets');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('same total daily milligram dose'),
          contains('twice daily'),
          contains('200 mg three times daily'),
          contains('600 mg/day'),
        ),
      );
      expect(
        m.patient.howToUseAr,
        allOf(contains('XR كاملة'), contains('متشققة')),
      );
      expect(
        m.patient.importantAr,
        allOf(contains('مجموع الـmg اليومي نفسه'), contains('المعلق')),
      );
    });

    test('levetiracetam XR explicitly blocks automatic 1-to-1 conversion', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'levetiracetam-xr');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('Do not encode a universal automatic IR → XR 1:1'),
          contains('XR 1000 mg once daily'),
          contains('IR 500 mg twice daily'),
          contains('effectiveness'),
          contains('not been studied and is unknown'),
        ),
      );
      expect(m.useProfile.specialPopulations,
          allOf(contains('creatinine clearance'), contains('dialysis')));
      expect(m.patient.importantAr,
          allOf(contains('لا تحول'), contains('الـlabel')));
    });

    test('QUDEXY and TROKENDI preserve different capsule handling', () {
      final qudexy = sampleMedications
          .firstWhere((m) => m.id == 'topiramate-qudexy-xr');
      final trokendi = sampleMedications
          .firstWhere((m) => m.id == 'topiramate-trokendi-xr');

      expect(
        qudexy.patient.howToUseAr,
        allOf(
          contains('فتحها'),
          contains('ملعقة صغيرة'),
          contains('طعام طري'),
          contains('دون مضغ'),
        ),
      );
      expect(
        trokendi.patient.howToUseAr,
        allOf(
          contains('كاملة'),
          contains('لا تفتحها'),
          contains('لا ترشها'),
        ),
      );
      expect(
        trokendi.patient.timingAr,
        allOf(contains('6 ساعات قبل'), contains('6 ساعات بعدها')),
      );
    });

    test('topiramate XR conversion evidence is product-specific', () {
      final qudexy = sampleMedications
          .firstWhere((m) => m.id == 'topiramate-qudexy-xr');
      final trokendi = sampleMedications
          .firstWhere((m) => m.id == 'topiramate-trokendi-xr');

      expect(
        qudexy.useProfile.releaseConversion,
        allOf(
          contains('same total daily dose'),
          contains('every 12 hours'),
          contains('once daily'),
          contains('bioequivalent'),
        ),
      );
      expect(
        trokendi.useProfile.releaseConversion,
        allOf(
          contains('equivalent total daily dose'),
          contains('10% decrease'),
          contains('first day'),
          contains('enzyme-inducing'),
          contains('10% lower Cmin'),
        ),
      );
    });

    test('metformin IR to ER preserves same total daily dose only through 2000 mg QD',
        () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'metformin-er-tablets');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('same total daily dose'),
          contains('up to 2000 mg once daily'),
          contains('1000 mg twice daily'),
          contains('2000 mg/day'),
          contains('above 2000 mg/day'),
        ),
      );
      expect(m.patient.timingAr, contains('وجبة المساء'));
      expect(
        m.patient.howToUseAr,
        allOf(contains('ER كاملة'), contains('لا تكسرها')),
      );
    });

    test('glipizide ER uses nearest equivalent daily dose and first main meal', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'glipizide-er');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('nearest equivalent total daily dose'),
          contains('20 mg once daily'),
          contains('5 mg twice daily'),
          contains('10 mg/day'),
        ),
      );
      expect(
        m.patient.timingAr,
        allOf(contains('الفطور'), contains('أول وجبة رئيسية')),
      );
      expect(
        m.patient.howToUseAr,
        allOf(contains('غلافًا'), contains('البراز')),
      );
    });

    test('gliclazide conversion locks 80 mg IR to 30 mg MR, not milligram matching',
        () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'gliclazide-mr-30mg');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('80 mg tablet'),
          contains('MR 30 mg tablet'),
          contains('IR 80 mg twice daily'),
          contains('MR 60 mg once daily'),
          contains('Do not treat 80 mg IR as 80 mg MR'),
        ),
      );
      expect(m.patient.timingAr, contains('الفطور'));
      expect(
        m.patient.importantAr,
        allOf(contains('80 mg'), contains('30 mg MR'), contains('لا تحوّل')),
      );
      expect(m.patient.missedDoseAr, contains('لا تزد جرعة اليوم التالي'));
    });
  });
}
