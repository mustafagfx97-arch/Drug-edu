import 'package:flutter_test/flutter_test.dart';

import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';

void main() {
  group('Patient education antibiotic/GI/antiemetic batch 3E', () {
    const newIds = <String>[
      'clarithromycin-er',
      'cefuroxime-axetil-tablets',
      'cefpodoxime-tablets',
      'cefdinir-capsules',
      'levofloxacin-oral-solution',
      'linezolid-oral',
      'metronidazole-er',
      'rifaximin-xifaxan',
      'pantoprazole-dr-granules',
      'budesonide-uceris',
      'linaclotide-linzess',
      'lubiprostone',
      'doxylamine-pyridoxine-dr',
      'aprepitant',
    ];

    test('adds 14 distinct records with full timing/duration/English coverage', () {
      final ids = sampleMedications.map((m) => m.id).toList();

      expect(sampleMedications.length, 407);
      expect(ids.toSet().length, 407);

      for (final id in newIds) {
        expect(ids, contains(id), reason: id);
        expect(medicationTimingRules[id], isNotNull, reason: 'timing ' + id);
        expect(therapyDurationFor(id), isNotNull, reason: 'duration ' + id);
        expect(
          englishPatientCounselingFor(id),
          isNotNull,
          reason: 'english ' + id,
        );
      }
    });

    test('antibiotic food rules remain formulation specific', () {
      final byId = {for (final m in sampleMedications) m.id: m};

      expect(
        byId['clarithromycin-er']!.patient.timingAr,
        contains('مع الطعام'),
      );
      expect(
        byId['cefuroxime-axetil-tablets']!.patient.timingAr,
        contains('بعد الطعام'),
      );
      expect(
        byId['cefpodoxime-tablets']!.patient.timingAr,
        contains('مع الطعام'),
      );
      expect(
        byId['levofloxacin-oral-solution']!.patient.timingAr,
        allOf(contains('قبل الطعام بساعة'), contains('بعده بساعتين')),
      );
      expect(
        byId['metronidazole-er']!.patient.timingAr,
        allOf(contains('قبل الطعام بساعة'), contains('بعده بساعتين')),
      );

      expect(
        medicationTimingRules['clarithromycin-er']!.autoScheduleSafe,
        isFalse,
      );
      expect(
        medicationTimingRules['levofloxacin-oral-solution']!.autoScheduleSafe,
        isFalse,
      );
    });

    test('mineral and administration separation counseling is preserved', () {
      final byId = {for (final m in sampleMedications) m.id: m};

      expect(
        byId['cefdinir-capsules']!.patient.timingAr,
        allOf(contains('ساعتين'), contains('الحديد')),
      );
      expect(
        medicationTimingRules['ciprofloxacin-oral']!.instructionAr,
        allOf(contains('ساعتين قبل'), contains('6 ساعات بعد')),
      );
      expect(
        medicationTimingRules['clindamycin-oral']!.instructionAr,
        allOf(contains('200–250'), contains('30 دقيقة')),
      );
      expect(
        medicationTimingRules['nitrofurantoin']!.instructionAr,
        contains('مع الطعام'),
      );
    });

    test('GI formulation-specific timing is locked', () {
      final byId = {for (final m in sampleMedications) m.id: m};

      final panto = byId['pantoprazole-dr-granules']!;
      expect(panto.patient.timingAr, contains('30 دقيقة'));
      expect(
        panto.patient.howToUseAr,
        allOf(contains('applesauce'), contains('apple juice')),
      );

      expect(
        byId['budesonide-uceris']!.patient.timingAr,
        allOf(contains('صباحًا'), contains('8 أسابيع')),
      );
      expect(
        byId['linaclotide-linzess']!.patient.timingAr,
        allOf(contains('معدة فارغة'), contains('30 دقيقة')),
      );
      expect(
        byId['lubiprostone']!.patient.timingAr,
        contains('مع الطعام'),
      );

      expect(
        medicationTimingRules['pantoprazole']!.instructionAr,
        allOf(contains('tablets'), contains('granules')),
      );
    });

    test('rifaximin indication controls duration rather than food', () {
      final rifaximin = sampleMedications.firstWhere(
        (m) => m.id == 'rifaximin-xifaxan',
      );

      expect(rifaximin.patient.timingAr, contains('مع الطعام أو بدونه'));
      expect(
        rifaximin.patient.importantAr,
        allOf(contains('دم'), contains('حرارة')),
      );
      expect(
        therapyDurationFor('rifaximin-xifaxan')!.patientAr,
        allOf(contains('3 أيام'), contains('14 يومًا'), contains('مزمنًا')),
      );
    });

    test('antiemetic technique and regimen locks remain explicit', () {
      final byId = {for (final m in sampleMedications) m.id: m};

      final pregnancyNausea = byId['doxylamine-pyridoxine-dr']!;
      expect(
        pregnancyNausea.patient.timingAr,
        allOf(contains('مجدول'), contains('bedtime')),
      );
      expect(
        pregnancyNausea.patient.howToUseAr,
        contains('معدة فارغة'),
      );

      final aprepitant = byId['aprepitant']!;
      expect(aprepitant.patient.timingAr, contains('مع الطعام أو بدونه'));
      expect(aprepitant.patient.importantAr, contains('28 يومًا'));
      expect(aprepitant.patient.importantAr, contains('backup'));

      expect(
        medicationTimingRules['ondansetron-oral']!.instructionAr,
        allOf(contains('ODT'), contains('peel back foil')),
      );
    });
  });
}