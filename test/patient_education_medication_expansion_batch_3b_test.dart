import 'package:flutter_test/flutter_test.dart';

import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';

void main() {
  group('Patient education medication expansion batch 3B', () {
    const newIds = <String>[
      'canagliflozin-invokana',
      'ertugliflozin-steglatro',
      'acarbose',
      'repaglinide',
      'nateglinide',
      'glyburide',
      'saxagliptin',
      'insulin-aspart-fiasp',
      'insulin-glulisine-apidra',
      'etonogestrel-implant-nexplanon',
      'levonorgestrel-ius-mirena',
      'copper-iud-paragard',
      'testosterone-gel-1-62',
      'desmopressin-nocdurna',
      'cabergoline-hyperprolactinemia',
      'enalapril',
      'telmisartan',
      'nebivolol',
      'candesartan',
    ];

    test('adds 19 distinct records and keeps full counseling coverage', () {
      final ids = sampleMedications.map((medicine) => medicine.id).toList();
      expect(sampleMedications.length, 265);
      expect(ids.toSet().length, 265);
      for (final id in newIds) {
        expect(ids, contains(id), reason: id);
        expect(medicationTimingRules[id], isNotNull, reason: 'timing: ' + id);
        expect(therapyDurationFor(id), isNotNull, reason: 'duration: ' + id);
        expect(englishPatientCounselingFor(id), isNotNull, reason: 'english: ' + id);
      }
    });

    test('meal-linked diabetes medicines never become generic clock doses', () {
      expect(medicationTimingRules['acarbose']!.autoScheduleSafe, isFalse);
      expect(medicationTimingRules['repaglinide']!.autoScheduleSafe, isFalse);
      expect(medicationTimingRules['nateglinide']!.autoScheduleSafe, isFalse);
      expect(medicationTimingRules['insulin-aspart-fiasp']!.autoScheduleSafe, isFalse);
      expect(medicationTimingRules['insulin-glulisine-apidra']!.autoScheduleSafe, isFalse);
      expect(medicationTimingRules['acarbose']!.instructionAr, contains('أول لقمة'));
      expect(medicationTimingRules['repaglinide']!.instructionAr, contains('تخط'));
    });

    test('SGLT2 product-specific surgery holds stay separate', () {
      expect(
        medicationTimingRules['canagliflozin-invokana']!.instructionAr,
        contains('3 أيام'),
      );
      expect(
        medicationTimingRules['ertugliflozin-steglatro']!.instructionAr,
        contains('4 أيام'),
      );
    });

    test('current contraceptive duration locks are preserved', () {
      final byId = {for (final medicine in sampleMedications) medicine.id: medicine};
      expect(
        byId['etonogestrel-implant-nexplanon']!.patient.timingAr,
        contains('5 سنوات'),
      );
      expect(
        byId['levonorgestrel-ius-mirena']!.patient.timingAr,
        allOf(contains('8 سنوات'), contains('5 سنوات')),
      );
      expect(
        byId['copper-iud-paragard']!.patient.timingAr,
        contains('10 سنوات'),
      );
    });

    test('hormone technique locks are explicit', () {
      final byId = {for (final medicine in sampleMedications) medicine.id: medicine};
      expect(
        byId['testosterone-gel-1-62']!.patient.howToUseAr,
        contains('الكتفين'),
      );
      expect(
        byId['desmopressin-nocdurna']!.patient.timingAr,
        allOf(contains('ساعة'), contains('8 ساعات')),
      );
      expect(
        byId['cabergoline-hyperprolactinemia']!.patient.howToUseAr,
        contains('يومين'),
      );
    });

    test('methotrexate weekly rule is explicitly non-oncology only', () {
      final methotrexate = sampleMedications.firstWhere(
        (item) => item.id == 'methotrexate-rheumatology',
      );
      final text = [
        methotrexate.name,
        methotrexate.subtitle,
        methotrexate.sections.map((item) => item.body).join(' '),
        methotrexate.patient.howToUseAr,
        methotrexate.patient.timingAr,
      ].join(' ').toLowerCase();

      expect(text, contains('non-oncology'));
      expect(text, contains('oncology'));
      expect(text, contains('once weekly'));
      expect(
        medicationTimingRules['methotrexate-rheumatology']!.instructionAr,
        contains('الأورام'),
      );

      final en = englishPatientCounseling['methotrexate-rheumatology']!;
      expect(en.important.toLowerCase(), contains('oncology'));
      expect(en.timing.toLowerCase(), contains('weekly'));
    });
  });
}