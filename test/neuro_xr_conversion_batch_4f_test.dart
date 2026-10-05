import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';

void main() {
  group('Neuro/Psych XR conversion batch 4F', () {
    const conversionIds = <String>[
      'quetiapine-xr',
      'oxcarbazepine-oxtellar-xr',
      'carbidopa-levodopa-rytary',
      'pramipexole-er',
      'memantine-xr',
      'ropinirole-er',
      'bupropion-xl',
      'venlafaxine-xr',
      'lamotrigine-xr',
      'divalproex-er',
    ];

    const newIds = <String>[
      'lamotrigine-xr',
      'divalproex-er',
    ];

    test('raises medication census to 402 without duplicate IDs', () {
      final ids = sampleMedications.map((m) => m.id).toList();
      expect(sampleMedications.length, 402);
      expect(ids.toSet().length, 402);

      for (final id in newIds) {
        expect(ids, contains(id), reason: id);
        expect(medicationTimingRules[id], isNotNull, reason: 'timing $id');
        expect(medicationTimingRules[id]!.autoScheduleSafe, isFalse,
            reason: 'auto schedule $id');
        expect(therapyDurationFor(id), isNotNull, reason: 'duration $id');
        expect(englishPatientCounselingFor(id), isNotNull,
            reason: 'English counseling $id');
      }
    });

    test('all ten selected XR records expose an explicit conversion rule', () {
      final byId = {for (final m in sampleMedications) m.id: m};

      for (final id in conversionIds) {
        final medicine = byId[id];
        expect(medicine, isNotNull, reason: id);
        expect(medicine!.useProfile.releaseConversion.trim(), isNotEmpty,
            reason: 'release conversion $id');
        expect(
          medicine.useProfile.facts.any(
            (fact) =>
                fact.title == 'IR / XR-ER conversion' &&
                fact.value.trim().isNotEmpty,
          ),
          isTrue,
          reason: 'displayed conversion fact $id',
        );
      }
    });

    test('quetiapine XR uses the same total daily IR dose once daily', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'quetiapine-xr');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('equivalent total daily dose'),
          contains('once daily'),
        ),
      );
    });

    test('OXTELLAR XR does not invent a fixed 1-to-1 conversion', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'oxcarbazepine-oxtellar-xr');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('higher OXTELLAR XR doses may be necessary'),
          contains('does not provide a universal fixed mg-for-mg'),
        ),
      );
    });

    test('RYTARY keeps the product-specific levodopa conversion table', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'carbidopa-levodopa-rytary');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('400–549'),
          contains('855 mg'),
          contains('950–1,249'),
          contains('1,755 mg'),
          contains('2,340 mg'),
          contains('2,205 mg'),
          contains('COMT inhibitor'),
        ),
      );
    });

    test('pramipexole ER permits overnight same-total-daily-dose switch', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'pramipexole-er');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('switched overnight'),
          contains('same total daily dose'),
        ),
      );
    });

    test('memantine XR locks normal and severe-renal conversion regimens', () {
      final m = sampleMedications.firstWhere((m) => m.id == 'memantine-xr');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('10 mg twice daily'),
          contains('28 mg once daily'),
          contains('5 mg twice daily'),
          contains('14 mg once daily'),
          contains('next day'),
        ),
      );
    });

    test('ropinirole ER keeps non-linear labeled conversion examples', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'ropinirole-er');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('0.75–2.25 mg → 2 mg'),
          contains('7.5–9 → 8 mg'),
          contains('15 → 16 mg'),
          contains('21 → 20 mg'),
        ),
      );
    });

    test('bupropion XL preserves same-total-dose switch and seizure lock', () {
      final m = sampleMedications.firstWhere((m) => m.id == 'bupropion-xl');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('same total daily'),
          contains('immediate-release'),
          contains('sustained-release'),
        ),
      );
      expect(m.patient.timingAr, contains('صباحًا'));
      expect(m.patient.missedDoseAr,
          allOf(contains('تجاوز الجرعة'), contains('التشنجات')));
    });

    test('venlafaxine XR locks nearest-equivalent dose food and capsule method',
        () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'venlafaxine-xr');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('nearest equivalent total mg/day'),
          contains('37.5 mg twice daily'),
          contains('75 mg once daily'),
        ),
      );
      expect(m.patient.timingAr, contains('مع الطعام'));
      expect(
        m.patient.howToUseAr,
        allOf(contains('applesauce'), contains('كل محتواها'), contains('دون مضغ')),
      );
    });

    test('lamotrigine XR locks same daily dose plus seizure monitoring', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'lamotrigine-xr');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('match the total daily IR'),
          contains('monitor seizure control'),
          contains('glucuronidation'),
        ),
      );
      expect(m.useProfile.route, allOf(contains('13'), contains('seizure')));
      expect(m.useProfile.commonMistakes,
          contains('bipolar disorder'));
    });

    test('divalproex ER locks 8-20 percent DR conversion and pregnancy warning',
        () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'divalproex-er');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('8–20% higher'),
          contains('500–625 mg/day → ER 750 mg/day'),
          contains('1,000–1,125 → 1,250'),
          contains('3,000–3,125 → 3,500'),
          contains('labeled epilepsy conversion'),
        ),
      );
      expect(
        m.patient.importantAr,
        allOf(contains('8–20%'), contains('لا تحسبها')),
      );
      expect(
        m.useProfile.specialPopulations,
        allOf(contains('pregnancy'), contains('effective contraception')),
      );
    });
  });
}
