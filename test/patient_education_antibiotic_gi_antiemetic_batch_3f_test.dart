import 'package:flutter_test/flutter_test.dart';

import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';

void main() {
  group('Patient education antibiotic/GI/antiemetic batch 3F', () {
    const newIds = <String>[
      'azithromycin-zmax',
      'penicillin-v',
      'dicloxacillin',
      'tetracycline-capsules',
      'fosfomycin-tromethamine',
      'rifampin',
      'lansoprazole-odt',
      'dexlansoprazole-dr',
      'cholestyramine',
      'plecanatide-trulance',
      'prucalopride-motegrity',
      'meclizine-motion-sickness',
      'prochlorperazine-severe-nausea',
    ];

    test('adds 13 distinct complete records', () {
      final ids = sampleMedications.map((m) => m.id).toList();

      expect(sampleMedications.length, 409);
      expect(ids.toSet().length, 409);

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

    test('antibiotic food and preparation rules stay exact', () {
      final byId = {for (final m in sampleMedications) m.id: m};

      expect(
        byId['azithromycin-zmax']!.patient.timingAr,
        allOf(contains('قبل الطعام بساعة'), contains('بعده بساعتين')),
      );
      expect(
        byId['azithromycin-zmax']!.patient.storageAr,
        allOf(contains('12 ساعة'), contains('لا تبردها')),
      );

      expect(
        byId['penicillin-v']!.patient.timingAr,
        allOf(contains('يمكن مع الطعام'), contains('معدة فارغة')),
      );

      expect(
        byId['dicloxacillin']!.patient.howToUseAr,
        allOf(contains('120 mL'), contains('قبل النوم')),
      );
      expect(
        byId['dicloxacillin']!.patient.timingAr,
        allOf(contains('قبل الطعام بساعة'), contains('بعده بساعتين')),
      );

      expect(
        byId['tetracycline-capsules']!.patient.howToUseAr,
        allOf(contains('الحليب'), contains('الحديد')),
      );

      expect(
        byId['fosfomycin-tromethamine']!.patient.howToUseAr,
        allOf(contains('3–4 أونصات'), contains('ماءً ساخنًا')),
      );

      expect(
        byId['rifampin']!.patient.importantAr,
        allOf(contains('hormonal contraception'), contains('البرتقالي')),
      );
    });

    test('GI products preserve formulation-specific administration', () {
      final byId = {for (final m in sampleMedications) m.id: m};

      final lansoprazole = byId['lansoprazole-odt']!;
      expect(lansoprazole.patient.timingAr, contains('قبل الوجبة'));
      expect(lansoprazole.patient.timingAr, contains('30 دقيقة'));
      expect(lansoprazole.patient.howToUseAr, contains('لا تمضغها'));

      final dex = byId['dexlansoprazole-dr']!;
      expect(dex.patient.timingAr, contains('مع الطعام أو بدونه'));
      expect(dex.patient.howToUseAr, contains('applesauce'));

      final cholestyramine = byId['cholestyramine']!;
      expect(
        cholestyramine.patient.howToUseAr,
        allOf(contains('2–6 أونصات'), contains('لا تبتلع المسحوق جافًا')),
      );
      expect(
        cholestyramine.patient.timingAr,
        allOf(contains('ساعة'), contains('4–6 ساعات')),
      );
    });

    test('constipation medicines keep their different food rules', () {
      final byId = {for (final m in sampleMedications) m.id: m};

      expect(
        byId['plecanatide-trulance']!.patient.timingAr,
        contains('مع الطعام أو بدونه'),
      );
      expect(
        byId['plecanatide-trulance']!.patient.importantAr,
        contains('لا يُستخدم للأطفال'),
      );

      expect(
        byId['prucalopride-motegrity']!.patient.timingAr,
        contains('مع الطعام أو بدونه'),
      );
      expect(
        byId['prucalopride-motegrity']!.patient.importantAr,
        contains('الكلى'),
      );
    });

    test('antiemetic use remains purpose-specific', () {
      final byId = {for (final m in sampleMedications) m.id: m};

      expect(
        byId['meclizine-motion-sickness']!.patient.timingAr,
        contains('قبل بدء السفر بساعة'),
      );
      expect(
        byId['meclizine-motion-sickness']!.patient.importantAr,
        contains('نعاس'),
      );

      expect(
        byId['prochlorperazine-severe-nausea']!.patient.importantAr,
        allOf(contains('الرقبة'), contains('الفك'), contains('حركات غير طبيعية')),
      );
      expect(
        medicationTimingRules['prochlorperazine-severe-nausea']!.autoScheduleSafe,
        isFalse,
      );
    });
  });
}