import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';

void main() {
  group('Psychiatry pain XR conversion batch 4J', () {
    test('adds tramadol ER and raises unique census to 400', () {
      final ids = sampleMedications.map((m) => m.id).toList();
      expect(sampleMedications.length, 400);
      expect(ids.toSet().length, 400);

      const id = 'tramadol-er-tablets';
      expect(ids, contains(id));
      expect(medicationTimingRules[id], isNotNull);
      expect(medicationTimingRules[id]!.autoScheduleSafe, isFalse);
      expect(therapyDurationFor(id), isNotNull);
      expect(englishPatientCounselingFor(id), isNotNull);
      expect(
        sampleMedications.firstWhere((m) => m.id == id).useProfile.releaseConversion,
        isNotEmpty,
      );
    });

    test('lithium IR to ER uses same daily total when possible and rounds below by 450 mg', () {
      final m = sampleMedications.firstWhere((m) => m.id == 'lithium');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('same total daily lithium dose when possible'),
          contains('nearest 450-mg multiple below'),
          contains('IR 1500 mg/day → ER 1350 mg/day'),
          contains('1- to 2-week intervals'),
        ),
      );
      expect(
        m.patient.importantAr,
        allOf(contains('1500 mg/day'), contains('1350 mg/day ER'), contains('فحص مستوى lithium')),
      );
      expect(medicationTimingRules['lithium']!.autoScheduleSafe, isFalse);
    });

    test('PAXIL CR does not invent a fixed IR-to-CR conversion ratio', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'paroxetine-paxil-cr');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('does not publish a formal immediate-release paroxetine → CR conversion table'),
          contains('CR 25–62.5 mg/day'),
          contains('IR paroxetine 20–50 mg/day'),
          contains('not a label-endorsed milligram conversion rule'),
        ),
      );
      expect(m.patient.importantAr,
          allOf(contains('لا تحول'), contains('لا يضع جدول تحويل مباشر')));
      expect(
          medicationTimingRules['paroxetine-paxil-cr']!.autoScheduleSafe, isFalse);
    });

    test('nifedipine ER blocks IR milligram matching and locks ER strength nuance', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'nifedipine-er');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('does not provide a direct immediate-release capsule → ER conversion table'),
          contains('two 30-mg ER tablets'),
          contains('one 60-mg ER tablet'),
          contains('three 30-mg ER tablets'),
          contains('one 90-mg ER tablet'),
          contains('not considered interchangeable'),
        ),
      );
      expect(m.patient.importantAr,
          allOf(contains('لا تحول'), contains('ثلاث حبات 30 mg')));
      expect(medicationTimingRules['nifedipine-er']!.autoScheduleSafe, isFalse);
    });

    test('tramadol IR to ER rounds the 24-hour IR total down to lower 100 mg', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'tramadol-er-tablets');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('total tramadol dose taken over 24 hours'),
          contains('next lower 100-mg increment'),
          contains('IR 250 mg/day → ER 200 mg once daily'),
          contains('IR 300 mg/day → ER 300 mg once daily'),
          contains('Do not exceed 300 mg/day'),
        ),
      );
      expect(
        m.patient.importantAr,
        allOf(
          contains('250 mg/day'),
          contains('200 mg ER'),
          contains('300 mg/day'),
          contains('لا تجمع معه tramadol آخر'),
        ),
      );
      expect(
        m.patient.howToUseAr,
        allOf(contains('كاملة'), contains('لا تكسرها'), contains('لا تسحقها')),
      );
      expect(m.patient.timingAr, contains('وليس PRN'));
    });
  });
}
