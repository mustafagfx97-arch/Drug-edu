import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';

void main() {
  group('Psychiatry and ADHD XR conversion batch 4J', () {
    const newIds = <String>[
      'amphetamine-mixed-salts-adderall-xr',
      'dexmethylphenidate-focalin-xr',
      'methylphenidate-concerta-er',
    ];

    test('adds three unique XR records and raises census to 406', () {
      final ids = sampleMedications.map((m) => m.id).toList();
      expect(sampleMedications.length, 406);
      expect(ids.toSet().length, 406);

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

    test('ADDERALL IR divided doses convert to same total daily XR dose', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'amphetamine-mixed-salts-adderall-xr');
      expect(m.useProfile.releaseConversion,
          contains('same total daily amphetamine-salt dose'));
      expect(m.useProfile.releaseConversion, contains('10 mg twice daily'));
      expect(m.useProfile.releaseConversion, contains('20 mg/day'));
      expect(m.useProfile.releaseConversion, contains('20 mg once each morning'));
      expect(m.patient.howToUseAr,
          allOf(contains('applesauce'), contains('دون مضغ')));
    });

    test('FOCALIN XR keeps two distinct conversion rules', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'dexmethylphenidate-focalin-xr');
      expect(m.useProfile.releaseConversion,
          contains('same total daily dexmethylphenidate dose'));
      expect(m.useProfile.releaseConversion,
          contains('one-half (1/2) of the current total daily methylphenidate dose'));
      expect(m.useProfile.releaseConversion, contains('5 mg twice daily'));
      expect(m.useProfile.releaseConversion, contains('Focalin XR 10 mg once daily'));
      expect(m.patient.importantAr,
          allOf(contains('قاعدتان مختلفتان'), contains('بنصف')));
    });

    test('CONCERTA locks the product-specific IR conversion table', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'methylphenidate-concerta-er');
      final conversion = m.useProfile.releaseConversion;
      expect(conversion, contains('IR 5 mg BID or TID → CONCERTA 18 mg'));
      expect(conversion, contains('IR 10 mg BID or TID → 36 mg'));
      expect(conversion, contains('IR 15 mg BID or TID → 54 mg'));
      expect(conversion, contains('IR 20 mg BID or TID → 72 mg'));
      expect(conversion, contains('13–65 years'));
      expect(m.patient.howToUseAr,
          allOf(contains('لا تسحقها'), contains('غلاف الحبة في البراز')));
    });

    test('lithium IR to ER uses same total daily dose when possible', () {
      final m = sampleMedications.firstWhere((m) => m.id == 'lithium');
      final conversion = m.useProfile.releaseConversion;
      expect(conversion, contains('same total daily lithium dose when possible'));
      expect(conversion, contains('1500 mg/day IR → 1350 mg/day ER'));
      expect(conversion, contains('larger dose in the evening'));
      expect(conversion, contains('1–2 week intervals'));
      expect(m.patient.importantAr,
          allOf(contains('مضاعفات 450 mg'), contains('فحص مستوى lithium')));
    });

    test('PAXIL CR blocks universal IR milligram matching', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'paroxetine-paxil-cr');
      final conversion = m.useProfile.releaseConversion;
      expect(conversion,
          contains('Do not encode a universal IR paroxetine → PAXIL CR'));
      expect(conversion, contains('MDD starts at 20 mg/day'));
      expect(conversion, contains('25 mg/day with CR'));
      expect(conversion, contains('10 mg/day IR'));
      expect(conversion, contains('12.5 mg/day CR'));
      expect(m.patient.importantAr,
          allOf(contains('لا تحول'), contains('لا يوجد جدول تحويل مباشر عام')));
    });
  });
}
