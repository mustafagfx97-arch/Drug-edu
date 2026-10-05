import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';

void main() {
  group('Epilepsy and diabetes XR conversion batch 4H', () {
    const newIds = <String>[
      'pregabalin-lyrica-cr',
      'gabapentin-gralise',
      'gabapentin-enacarbil-horizant',
      'lacosamide-motpoly-xr',
      'sitagliptin-metformin-janumet-xr',
      'linagliptin-metformin-jentadueto-xr',
      'saxagliptin-metformin-kombiglyze-xr',
    ];

    test('adds seven unique records and raises census to 402', () {
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

        final m = sampleMedications.firstWhere((m) => m.id == id);
        expect(m.useProfile.releaseConversion.trim(), isNotEmpty,
            reason: 'conversion $id');
      }
    });

    test('phenytoin extended capsules expose salt-form conversion warning', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'phenytoin-extended-capsules');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('sodium salt'),
          contains('free acid'),
          contains('8%'),
          contains('not a simple 1:1'),
          contains('serum-level monitoring'),
        ),
      );
      expect(m.patient.importantAr,
          allOf(contains('8%'), contains('لا تنقل نفس عدد الـmg')));
    });

    test('LYRICA CR keeps the full labeled conversion table and seizure limitation',
        () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'pregabalin-lyrica-cr');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('75 mg/day → CR 82.5 mg'),
          contains('150 → 165 mg'),
          contains('225 → 247.5 mg'),
          contains('300 → 330 mg'),
          contains('450 → 495 mg'),
          contains('600 → 660 mg'),
          allOf(contains('morning dose'), contains('evening meal')),
        ),
      );
      expect(m.useProfile.route,
          contains('Efficacy has not been established'));
      expect(m.patient.importantAr,
          allOf(contains('150 mg/day'), contains('165 mg CR')));
    });

    test('GRALISE is not substitutable and is not an epilepsy conversion', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'gabapentin-gralise');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('not substitutable'),
          contains('Do not create a milligram-for-milligram'),
          contains('1800 mg once daily'),
        ),
      );
      expect(m.useProfile.route,
          allOf(contains('postherpetic neuralgia'), contains('epilepsy')));
      expect(m.patient.importantAr,
          allOf(contains('ليس interchangeable'), contains('للصرع')));
    });

    test('HORIZANT blocks gabapentin mg-for-mg substitution', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'gabapentin-enacarbil-horizant');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('not substitutable'),
          contains('same milligram dose'),
          contains('different gabapentin plasma concentrations'),
          contains('prodrug'),
        ),
      );
      expect(m.patient.timingAr,
          allOf(contains('RLS'), contains('5 مساءً'), contains('PHN')));
    });

    test('MOTPOLY XR does not invent a direct IR conversion table', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'lacosamide-motpoly-xr');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('relative bioavailability'),
          contains('does not provide a labeled IR→XR conversion table'),
          contains('do not auto-convert'),
        ),
      );
      expect(m.patient.howToUseAr,
          allOf(contains('كاملة'), contains('لا تفتحها')));
    });

    test('JANUMET XR preserves both component total daily doses', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'sitagliptin-metformin-janumet-xr');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('same total daily dose of both sitagliptin and metformin'),
          contains('850 mg twice daily'),
          contains('1000 mg twice daily'),
          contains('two JANUMET XR 50 mg/1000 mg tablets'),
          contains('once daily'),
        ),
      );
      expect(m.patient.howToUseAr,
          allOf(contains('مرة يوميًا'), contains('حبتين'), contains('معًا')));
    });

    test('JENTADUETO XR preserves 5 mg linagliptin plus similar metformin total',
        () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'linagliptin-metformin-jentadueto-xr');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('linagliptin 5 mg total daily'),
          contains('similar total daily metformin dose'),
          contains('Maximum daily totals'),
          contains('metformin 2000 mg'),
        ),
      );
      expect(m.patient.importantAr,
          allOf(contains('5 mg linagliptin'), contains('metformin')));
    });

    test('KOMBIGLYZE XR conversion uses component dosing plus glucose monitoring',
        () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'saxagliptin-metformin-kombiglyze-xr');
      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('metformin dose already being taken'),
          contains('nearest therapeutically appropriate dose'),
          contains('closely monitor glycemic control'),
          contains('not a universal one-tablet-for-one-tablet'),
        ),
      );
      expect(m.patient.timingAr, contains('وجبة المساء'));
      expect(m.patient.importantAr,
          allOf(contains('لا ننقل عدد الحبوب فقط'), contains('نراقب السكر')));
    });
  });
}
