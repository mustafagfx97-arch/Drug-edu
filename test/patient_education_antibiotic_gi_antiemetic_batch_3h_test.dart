import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';

void main() {
  group('Antibiotic GI antiemetic batch 3H', () {
    const ids = <String>[
      'amoxicillin-clavulanate-xr',
      'sulfasalazine-dr',
      'dicyclomine-oral',
      'hyoscyamine-sl',
      'promethazine-oral-tablets',
    ];

    test('adds five complete unique records and raises census to 410', () {
      final allIds = sampleMedications.map((m) => m.id).toList();
      expect(sampleMedications.length, 410);
      expect(allIds.toSet().length, 410);

      for (final id in ids) {
        expect(allIds, contains(id));
        expect(medicationTimingRules[id], isNotNull);
        expect(medicationTimingRules[id]!.autoScheduleSafe, isFalse);
        expect(therapyDurationFor(id), isNotNull);
        expect(englishPatientCounselingFor(id), isNotNull);
      }
    });

    test('AUGMENTIN XR remains distinct from regular amoxicillin clavulanate', () {
      final xr = sampleMedications
          .firstWhere((m) => m.id == 'amoxicillin-clavulanate-xr');
      final regular = sampleMedications
          .firstWhere((m) => m.id == 'amoxicillin-clavulanate');

      expect(regular.id, isNot(equals(xr.id)));
      expect(
        xr.patient.timingAr,
        allOf(contains('بداية الوجبة'), contains('عالية الدهون')),
      );
      expect(
        xr.patient.importantAr,
        allOf(contains('ليس مكافئًا'), contains('mg-for-mg')),
      );
      expect(
        xr.patient.howToUseAr,
        allOf(contains('النصفين'), contains('فورًا')),
      );
    });

    test('sulfasalazine DR preserves after-meal whole-tablet counseling', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'sulfasalazine-dr');

      expect(m.patient.timingAr, contains('بعد الوجبات'));
      expect(
        m.patient.importantAr,
        allOf(contains('لا تسحق'), contains('كاملة في البراز')),
      );
      expect(
        m.patient.seekHelpAr,
        allOf(contains('التهاب حلق'), contains('اصفرار')),
      );
    });

    test('dicyclomine does not invent a meal anchor and keeps antacid lock', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'dicyclomine-oral');

      expect(
        m.patient.timingAr,
        allOf(contains('لا يفرض'), contains('antacid'), contains('نفس الوقت')),
      );
      expect(
        medicationTimingRules[m.id]!.anchor,
        equals('prescription-specific'),
      );
      expect(m.patient.missedDoseAr, contains('الجدول الطبيعي'));
    });

    test('hyoscyamine SL keeps 30 to 60 minute premeal and formulation lock', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'hyoscyamine-sl');

      expect(
        m.patient.timingAr,
        allOf(contains('30–60'), contains('قبل الوجبة')),
      );
      expect(m.patient.howToUseAr, contains('ER'));
      expect(
        medicationTimingRules[m.id]!.instructionAr,
        allOf(contains('30–60'), contains('لا تعمم')),
      );
    });

    test('promethazine oral keeps travel lead time and sedation pediatric locks',
        () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'promethazine-oral-tablets');

      expect(
        m.patient.timingAr,
        allOf(contains('30–60'), contains('قبل السفر')),
      );
      expect(
        m.patient.importantAr,
        allOf(
          contains('القيادة'),
          contains('الكحول'),
          contains('أقل من سنتين'),
        ),
      );
      expect(
        medicationTimingRules[m.id]!.anchor,
        equals('prescription-specific'),
      );
    });
  });
}
