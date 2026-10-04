import 'package:flutter_test/flutter_test.dart';

import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';

void main() {
  group('Patient education medication expansion batch 3D', () {
    const newIds = <String>[
      'insulin-lispro-humalog',
      'insulin-lispro-lyumjev',
      'insulin-glargine-toujeo',
      'insulin-glargine-basaglar',
      'semaglutide-rybelsus',
      'semaglutide-ozempic',
      'exenatide-byetta',
      'exenatide-bydureon-bcise',
      'verelan-pm',
      'eplerenone',
      'amiloride',
      'methyldopa',
      'bromocriptine-hyperprolactinemia',
      'levothyroxine-tirosint-sol',
      'depo-provera-ci',
      'nuvaring',
    ];

    test('adds 16 distinct records with complete support coverage', () {
      final ids = sampleMedications.map((m) => m.id).toList();

      expect(sampleMedications.length, 350);
      expect(ids.toSet().length, 350);

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

    test('rapid-insulin meal windows remain product specific', () {
      final byId = {for (final m in sampleMedications) m.id: m};

      expect(
        byId['insulin-lispro-humalog']!.patient.timingAr,
        allOf(contains('15 دقيقة'), contains('مباشرة بعد')),
      );
      expect(
        byId['insulin-lispro-lyumjev']!.patient.timingAr,
        allOf(contains('بدء الوجبة'), contains('20 دقيقة')),
      );
      expect(
        medicationTimingRules['insulin-lispro-humalog']!.autoScheduleSafe,
        isFalse,
      );
      expect(
        medicationTimingRules['insulin-lispro-lyumjev']!.autoScheduleSafe,
        isFalse,
      );
    });

    test('concentrated and basal insulin locks are explicit', () {
      final byId = {for (final m in sampleMedications) m.id: m};

      expect(
        byId['insulin-glargine-toujeo']!.patient.importantAr,
        allOf(contains('conversion'), contains('syringe')),
      );
      expect(
        byId['insulin-glargine-basaglar']!.patient.storageAr,
        contains('28 يومًا'),
      );
      expect(
        byId['insulin-glargine-basaglar']!.patient.timingAr,
        contains('نفس الوقت'),
      );
    });

    test('GLP-1 administration and missed-dose rules stay formulation specific', () {
      final byId = {for (final m in sampleMedications) m.id: m};

      final rybelsus = byId['semaglutide-rybelsus']!;
      expect(
        rybelsus.patient.howToUseAr,
        allOf(contains('4 أونصات'), contains('معدة فارغة')),
      );
      expect(rybelsus.patient.timingAr, contains('30 دقيقة'));
      expect(rybelsus.patient.importantAr, allOf(contains('R1'), contains('R2')));

      final ozempic = byId['semaglutide-ozempic']!;
      expect(ozempic.patient.missedDoseAr, contains('5 أيام'));
      expect(ozempic.patient.timingAr, contains('48 ساعة'));

      final byetta = byId['exenatide-byetta']!;
      expect(byetta.patient.timingAr, allOf(contains('60 دقيقة'), contains('قبل')));
      expect(byetta.patient.missedDoseAr, contains('لا تأخذها بعد الوجبة'));

      final bydureon = byId['exenatide-bydureon-bcise']!;
      expect(bydureon.patient.howToUseAr, contains('15 ثانية'));
      expect(bydureon.patient.missedDoseAr, contains('3 أيام'));
    });

    test('cardiovascular special-use counseling is preserved', () {
      final byId = {for (final m in sampleMedications) m.id: m};

      expect(byId['verelan-pm']!.patient.timingAr, contains('النوم'));
      expect(byId['verelan-pm']!.patient.importantAr, contains('لا تسحق'));
      expect(byId['eplerenone']!.patient.importantAr, contains('potassium'));
      expect(byId['amiloride']!.patient.howToUseAr, contains('مع الطعام'));
      expect(byId['amiloride']!.patient.importantAr, contains('potassium'));
      expect(
        byId['methyldopa']!.patient.importantAr,
        allOf(contains('نعاس'), contains('اصفرار')),
      );
    });

    test('endocrine product-specific rules remain exact', () {
      final byId = {for (final m in sampleMedications) m.id: m};

      final bromocriptine = byId['bromocriptine-hyperprolactinemia']!;
      expect(bromocriptine.patient.howToUseAr, contains('مع الطعام'));
      expect(bromocriptine.patient.importantAr, contains('صمامات القلب'));

      final tirosint = byId['levothyroxine-tirosint-sol']!;
      expect(tirosint.patient.timingAr, contains('15 دقيقة'));
      expect(tirosint.patient.importantAr, contains('أربع ساعات'));
      expect(tirosint.patient.howToUseAr, contains('الماء فقط'));
    });

    test('contraceptive injection and ring schedules are locked', () {
      final byId = {for (final m in sampleMedications) m.id: m};

      final depo = byId['depo-provera-ci']!;
      expect(depo.patient.timingAr, contains('13 أسبوعًا'));
      expect(depo.patient.importantAr, contains('سنتين'));

      final ring = byId['nuvaring']!;
      expect(
        ring.patient.timingAr,
        allOf(contains('3 أسابيع'), contains('أسبوع واحد')),
      );
      expect(ring.patient.importantAr, contains('3 ساعات'));
      expect(
        medicationTimingRules['nuvaring']!.autoScheduleSafe,
        isFalse,
      );
    });
  });
}