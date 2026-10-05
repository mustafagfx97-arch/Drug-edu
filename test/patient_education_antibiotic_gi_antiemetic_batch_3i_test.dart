import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';

void main() {
  group('Antibiotic GI antiemetic batch 3I', () {
    const ids = <String>[
      'erythromycin-erytab-dr',
      'doxycycline-doryx-mpc',
      'tenapanor-ibsrela',
      'eluxadoline-viberzi',
      'netupitant-palonosetron-akynzeo-oral',
    ];

    test('adds five complete unique records and raises census to 404', () {
      final allIds = sampleMedications.map((m) => m.id).toList();
      expect(sampleMedications.length, 404);
      expect(allIds.toSet().length, 404);

      for (final id in ids) {
        expect(allIds, contains(id));
        expect(medicationTimingRules[id], isNotNull);
        expect(medicationTimingRules[id]!.autoScheduleSafe, isFalse);
        expect(therapyDurationFor(id), isNotNull);
        expect(englishPatientCounselingFor(id), isNotNull);
      }
    });

    test('ERY-TAB keeps food-flexible versus optimal-fasting nuance', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'erythromycin-erytab-dr');

      expect(
        m.patient.timingAr,
        allOf(
          contains('دون ارتباط صارم بالطعام'),
          contains('30 دقيقة'),
          contains('ساعتين'),
        ),
      );
      expect(
        medicationTimingRules[m.id]!.anchor,
        equals('prescription-specific'),
      );
    });

    test('DORYX MPC stays distinct from generic doxycycline', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'doxycycline-doryx-mpc');
      final generic =
          sampleMedications.firstWhere((m) => m.id == 'doxycycline');

      expect(m.id, isNot(equals(generic.id)));
      expect(
        m.patient.importantAr,
        allOf(contains('ليس mg-for-mg interchangeable'), contains('ماء')),
      );
      expect(
        m.patient.howToUseAr,
        allOf(contains('دون سحق أو مضغ'), contains('doxycycline عادية')),
      );
    });

    test('IBSRELA remains immediately before first meal and dinner', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'tenapanor-ibsrela');

      expect(
        m.patient.timingAr,
        allOf(
          contains('مباشرة قبل الفطور'),
          contains('مباشرة قبل العشاء'),
        ),
      );
      expect(
        m.patient.missedDoseAr,
        allOf(contains('تجاوزها'), contains('لا تأخذ جرعتين')),
      );
      expect(
        medicationTimingRules[m.id]!.requiresMealChoice,
        isTrue,
      );
    });

    test('VIBERZI keeps with-food and gallbladder safety locks', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'eluxadoline-viberzi');

      expect(m.patient.timingAr, contains('مع الطعام'));
      expect(
        m.patient.importantAr,
        allOf(
          contains('لم تكن لديك مرارة'),
          contains('pancreatitis'),
        ),
      );
      expect(m.patient.missedDoseAr, contains('لا تأخذ جرعتين'));
    });

    test('oral AKYNZEO is chemotherapy-linked, not general PRN', () {
      final m = sampleMedications.firstWhere(
        (m) => m.id == 'netupitant-palonosetron-akynzeo-oral',
      );

      expect(
        m.patient.timingAr,
        allOf(contains('قبل بدء chemotherapy'), contains('ساعة')),
      );
      expect(
        m.patient.importantAr,
        allOf(contains('ليس دواء PRN يوميًا'), contains('CYP3A4')),
      );
      expect(
        therapyDurationFor(m.id)!.kind,
        TherapyDurationKind.singleUse,
      );
    });
  });
}
