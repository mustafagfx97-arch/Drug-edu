import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';

void main() {
  group('Psych neuro stimulant XR conversion batch 4J', () {
    const ids = <String>[
      'lithium-carbonate-er-450',
      'paroxetine-paxil-cr',
      'amantadine-gocovri',
      'amantadine-osmolex-er',
      'methylphenidate-concerta',
      'mixed-amphetamine-salts-adderall-xr',
    ];

    test('adds six unique formulation-specific records and raises census to 405', () {
      final allIds = sampleMedications.map((m) => m.id).toList();
      expect(sampleMedications.length, 405);
      expect(allIds.toSet().length, 405);

      for (final id in ids) {
        expect(allIds, contains(id), reason: id);
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

    test('lithium ER 450 uses same daily dose when possible and rounds down by strength',
        () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'lithium-carbonate-er-450');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('same total daily dose when possible'),
          contains('nearest 450-mg multiple below'),
          contains('1500 mg/day'),
          contains('1350 mg/day'),
          contains('1- to 2-week intervals'),
        ),
      );
      expect(m.useProfile.formulationHandling,
          allOf(contains('whole'), contains('Do not chew or crush')));
      expect(m.patient.importantAr,
          allOf(contains('1500 mg/day'), contains('1350 mg/day ER')));
    });

    test('PAXIL CR blocks invented fixed IR-to-CR conversion', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'paroxetine-paxil-cr');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('does not provide a direct immediate-release paroxetine → CR conversion table'),
          contains('Do not infer a universal 20 mg IR → 25 mg CR rule'),
        ),
      );
      expect(m.patient.timingAr, contains('صباحًا'));
      expect(m.patient.howToUseAr,
          allOf(contains('كاملة'), contains('دون سحق أو مضغ')));
    });

    test('GOCOVRI is bedtime and not substitutable with amantadine products', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'amantadine-gocovri');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('not substitutable'),
          contains('137 mg once nightly'),
          contains('274 mg once nightly'),
        ),
      );
      expect(m.patient.timingAr, contains('عند النوم'));
      expect(m.patient.howToUseAr,
          allOf(contains('فتحها'), contains('ملعقة صغيرة'), contains('دون مضغ')));
    });

    test('OSMOLEX ER is morning and has no equivalent when IR tolerance is <=100 mg',
        () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'amantadine-osmolex-er');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('not interchangeable'),
          contains('unable to tolerate more than 100 mg/day'),
          contains('no equivalent OSMOLEX ER dose'),
          contains('129 mg once each morning'),
        ),
      );
      expect(m.patient.timingAr,
          allOf(contains('صباحًا'), contains('48 أو 96 ساعة')));
    });

    test('CONCERTA preserves the exact product-specific IR conversion table', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'methylphenidate-concerta');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('5 mg BID or TID → CONCERTA 18 mg'),
          contains('10 mg BID or TID → 36 mg'),
          contains('15 mg BID or TID → 54 mg'),
          contains('20 mg BID or TID → 72 mg'),
          contains('specific to CONCERTA'),
        ),
      );
      expect(m.patient.howToUseAr,
          allOf(contains('الحبة كاملة'), contains('غلاف الحبة في البراز')));
    });

    test('ADDERALL IR divided doses convert to XR at same total daily dose', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'mixed-amphetamine-salts-adderall-xr');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('same total daily dose taken once daily'),
          contains('10 mg twice daily'),
          contains('20 mg/day'),
          contains('XR 20 mg once each morning'),
        ),
      );
      expect(m.patient.howToUseAr,
          allOf(contains('applesauce'), contains('دون مضغ'), contains('لا تقسّم')));
      expect(m.patient.timingAr, contains('صباحًا'));
    });
  });
}
