import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';

void main() {
  group('Cardiovascular and urology XR conversion batch 4I', () {
    const newIds = <String>[
      'metoprolol-succinate-er',
      'verapamil-er-tablets',
      'propranolol-er-capsules',
      'tolterodine-la',
    ];

    test('adds four unique records and raises census to 410', () {
      final ids = sampleMedications.map((m) => m.id).toList();
      expect(sampleMedications.length, 410);
      expect(ids.toSet().length, 410);

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

    test('metoprolol IR converts to succinate ER at same total daily dose', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'metoprolol-succinate-er');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('same total daily metoprolol dose'),
          contains('50 mg twice daily'),
          contains('100 mg/day'),
          contains('100 mg once daily'),
        ),
      );
      expect(m.patient.missedDoseAr,
          allOf(contains('الجرعة التالية'), contains('لا تضاعف')));
      expect(m.patient.howToUseAr,
          allOf(contains('مرة واحدة يوميًا'), contains('لا تسحق')));
    });

    test('diltiazem ER uses nearest equivalent total daily dose with brand lock',
        () {
      final m = sampleMedications.firstWhere((m) => m.id == 'diltiazem-er');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('nearest equivalent total daily diltiazem dose'),
          contains('higher ER dose'),
          contains('different release systems'),
        ),
      );
      expect(m.patient.importantAr,
          allOf(contains('أقرب مجموع جرعة يومية مكافئ'), contains('براندات ER')));
      expect(medicationTimingRules['diltiazem-er']!.autoScheduleSafe, isFalse);
    });

    test('verapamil IR may preserve total daily milligrams in reviewed ER tablets',
        () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'verapamil-er-tablets');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('total daily dose in milligrams may remain the same'),
          contains('IR verapamil totaling 240 mg/day'),
          contains('ER regimen totaling 240 mg/day'),
          contains('Do not generalize'),
        ),
      );
      expect(m.patient.timingAr,
          allOf(contains('مع الطعام'), contains('توقيت مختلف')));
    });

    test('propranolol ER explicitly blocks simple mg-for-mg substitution', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'propranolol-er-capsules');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('should NOT be considered a simple milligram-for-milligram substitute'),
          contains('lower blood levels'),
          contains('retitration upward'),
          contains('end of the 24-hour dosing interval'),
        ),
      );
      expect(m.patient.importantAr,
          allOf(contains('لا تحول'), contains('مستويات دم أقل')));
    });

    test('oxybutynin ER does not invent an IR-to-ER conversion table', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'oxybutynin-er');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('5 or 10 mg once daily'),
          contains('5-mg increments'),
          contains('30 mg/day'),
          contains('does not publish a direct immediate-release → ER conversion rule'),
        ),
      );
      expect(m.patient.importantAr,
          allOf(contains('لا تحول'), contains('جدول تحويل مباشر')));
      expect(medicationTimingRules['oxybutynin-er']!.autoScheduleSafe, isFalse);
    });

    test('tolterodine LA separates usual regimens from formal conversion', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'tolterodine-la');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('immediate-release 2 mg twice daily'),
          contains('LA 4 mg once daily'),
          contains('does not provide a direct IR→LA conversion instruction'),
          contains('2 mg once daily'),
          contains('CrCl 10–30'),
        ),
      );
      expect(m.patient.importantAr,
          allOf(contains('لا تعتبر ذلك تحويلًا تلقائيًا'), contains('2 mg فقط')));
    });
  });
}
