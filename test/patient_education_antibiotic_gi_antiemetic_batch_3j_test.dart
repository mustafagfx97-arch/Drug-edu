import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';

void main() {
  group('Antibiotic GI antiemetic batch 3J', () {
    const ids = <String>[
      'cefuroxime-axetil-suspension',
      'cefpodoxime-suspension',
      'clarithromycin-suspension',
      'budesonide-dr-capsules-crohns',
      'granisetron-sancuso-patch',
    ];

    test('adds five complete unique records and raises census to 380', () {
      final allIds = sampleMedications.map((m) => m.id).toList();
      expect(sampleMedications.length, 380);
      expect(allIds.toSet().length, 380);

      for (final id in ids) {
        expect(allIds, contains(id));
        expect(medicationTimingRules[id], isNotNull);
        expect(medicationTimingRules[id]!.autoScheduleSafe, isFalse);
        expect(therapyDurationFor(id), isNotNull);
        expect(englishPatientCounselingFor(id), isNotNull);
      }
    });

    test('cefuroxime suspension locks food storage and tablet non-equivalence', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'cefuroxime-axetil-suspension');

      expect(m.patient.timingAr, contains('مع الطعام'));
      expect(
        m.patient.importantAr,
        allOf(
          contains('ليس مكافئًا mg-for-mg'),
          contains('الثلاجة'),
          contains('10 أيام'),
        ),
      );
      expect(m.patient.howToUseAr, contains('رجّ المعلق'));
    });

    test('cefpodoxime suspension keeps food rule distinct from tablets', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'cefpodoxime-suspension');

      expect(
        m.patient.timingAr,
        allOf(
          contains('مع الطعام أو بدونه'),
          contains('حبوب cefpodoxime'),
        ),
      );
      expect(
        m.patient.storageAr,
        allOf(contains('الثلاجة'), contains('14 يومًا')),
      );
    });

    test('clarithromycin suspension stays room-temperature after mixing', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'clarithromycin-suspension');

      expect(
        m.patient.timingAr,
        allOf(contains('مع الطعام أو بدونه'), contains('الحليب')),
      );
      expect(
        m.patient.storageAr,
        allOf(contains('لا يُبرّد'), contains('14 يومًا')),
      );
    });

    test('Crohn budesonide keeps morning and exact applesauce handling', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'budesonide-dr-capsules-crohns');

      expect(m.patient.timingAr, contains('صباحًا'));
      expect(m.patient.timingAr, contains('لا يفرض قبل/مع/بعد الطعام'));
      expect(
        m.patient.howToUseAr,
        allOf(
          contains('applesauce'),
          contains('30 دقيقة'),
          contains('240 mL'),
        ),
      );
      expect(
        m.patient.importantAr,
        allOf(contains('لا تسحق'), contains('grapefruit juice')),
      );
    });

    test('SANCUSO locks device timing heat light and no-cut technique', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'granisetron-sancuso-patch');

      expect(
        m.patient.timingAr,
        allOf(
          contains('24–48 ساعة'),
          contains('24 ساعة على الأقل'),
          contains('7 أيام'),
        ),
      );
      expect(
        m.patient.howToUseAr,
        allOf(contains('أعلى الذراع'), contains('لا تقصها')),
      );
      expect(
        m.patient.importantAr,
        allOf(
          contains('heating pad'),
          contains('الشمس'),
          contains('10 أيام'),
        ),
      );
      expect(
        therapyDurationFor(m.id)!.kind,
        TherapyDurationKind.singleUse,
      );
    });
  });
}
