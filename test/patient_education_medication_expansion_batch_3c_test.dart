import 'package:flutter_test/flutter_test.dart';

import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';

void main() {
  group('Patient education medication expansion batch 3C', () {
    const newIds = <String>[
      'alogliptin',
      'insulin-human-regular-humulin-r',
      'insulin-nph-humulin-n',
      'ramipril',
      'irbesartan',
      'atenolol',
      'clonidine-oral',
      'doxazosin',
      'hydrocortisone-adrenal-replacement',
      'fludrocortisone-adrenal-replacement',
      'estradiol-patch-twice-weekly',
      'estradiol-vagifem',
      'progesterone-endometrin',
      'drospirenone-pop-slynd',
      'xulane-contraceptive-patch',
      'annovera-vaginal-ring',
      'liothyronine-cytomel',
      'medroxyprogesterone-oral',
      'hydralazine-oral',
      'labetalol-oral',
    ];

    test('adds 20 complete distinct records', () {
      final ids = sampleMedications.map((m) => m.id).toList();
      expect(sampleMedications.length, 399);
      expect(ids.toSet().length, 399);

      for (final id in newIds) {
        expect(ids, contains(id), reason: id);
        expect(medicationTimingRules[id], isNotNull, reason: 'timing ' + id);
        expect(therapyDurationFor(id), isNotNull, reason: 'duration ' + id);
        expect(englishPatientCounselingFor(id), isNotNull, reason: 'english ' + id);
      }
    });

    test('diabetes timing and formulation traps stay product specific', () {
      final byId = {for (final m in sampleMedications) m.id: m};

      expect(
        medicationTimingRules['insulin-human-regular-humulin-r']!.instructionAr,
        contains('30 دقيقة'),
      );
      expect(
        byId['insulin-human-regular-humulin-r']!.patient.importantAr,
        allOf(contains('U-100'), contains('U-500')),
      );

      final nph = byId['insulin-nph-humulin-n']!;
      expect(nph.patient.howToUseAr, contains('10 مرات'));
      expect(nph.patient.importantAr, contains('أبيض'));
      expect(nph.patient.importantAr, contains('عكر'));

      expect(
        byId['alogliptin']!.patient.importantAr,
        contains('الكلى'),
      );
    });

    test('antihypertensive withdrawal and restart locks stay explicit', () {
      final byId = {for (final m in sampleMedications) m.id: m};

      expect(byId['clonidine-oral']!.patient.importantAr, contains('الإيقاف المفاجئ'));
      expect(byId['atenolol']!.patient.importantAr, contains('لا توقف'));
      expect(byId['doxazosin']!.patient.missedDoseAr, contains('عدة أيام'));
      expect(byId['ramipril']!.patient.seekHelpAr, contains('تورم'));
      expect(byId['hydralazine-oral']!.patient.importantAr, contains('lupus'));
      expect(byId['labetalol-oral']!.patient.importantAr, contains('لا توقف'));
    });

    test('adrenal replacement never degrades into generic steroid counseling', () {
      final byId = {for (final m in sampleMedications) m.id: m};
      final hydrocortisone = byId['hydrocortisone-adrenal-replacement']!;
      final fludrocortisone = byId['fludrocortisone-adrenal-replacement']!;

      expect(hydrocortisone.patient.importantAr, contains('stress dose'));
      expect(hydrocortisone.patient.seekHelpAr, contains('adrenal crisis'));
      expect(hydrocortisone.patient.storageAr, contains('steroid emergency'));
      expect(
        medicationTimingRules['hydrocortisone-adrenal-replacement']!.autoScheduleSafe,
        isFalse,
      );

      expect(fludrocortisone.patient.importantAr, contains('potassium'));
      expect(fludrocortisone.patient.importantAr, contains('hydrocortisone'));
    });

    test('hormone formulations preserve route and phase-specific schedules', () {
      final byId = {for (final m in sampleMedications) m.id: m};

      expect(
        byId['estradiol-patch-twice-weekly']!.patient.timingAr,
        allOf(contains('مرتين'), contains('3–4')),
      );
      expect(
        byId['estradiol-patch-twice-weekly']!.patient.howToUseAr,
        contains('وليس على الثدي'),
      );

      expect(
        byId['estradiol-vagifem']!.patient.timingAr,
        allOf(contains('أسبوعين'), contains('مرتين أسبوعيًا')),
      );
      expect(byId['progesterone-endometrin']!.patient.howToUseAr, contains('لا تبلعه'));
      expect(byId['liothyronine-cytomel']!.patient.importantAr, contains('إنقاص الوزن'));
      expect(
        byId['medroxyprogesterone-oral']!.patient.importantAr,
        allOf(contains('Depo-Provera'), contains('3–7 أيام')),
      );
    });

    test('contraceptive products keep exact schedules and emergency separation', () {
      final byId = {for (final m in sampleMedications) m.id: m};

      expect(
        byId['drospirenone-pop-slynd']!.patient.howToUseAr,
        allOf(contains('24'), contains('4')),
      );
      expect(
        byId['drospirenone-pop-slynd']!.patient.importantAr,
        contains('7 أيام'),
      );

      expect(
        byId['xulane-contraceptive-patch']!.patient.timingAr,
        allOf(contains('Week 1'), contains('Week 4')),
      );
      expect(
        byId['annovera-vaginal-ring']!.patient.timingAr,
        allOf(contains('21'), contains('7'), contains('13')),
      );


    });
  });
}