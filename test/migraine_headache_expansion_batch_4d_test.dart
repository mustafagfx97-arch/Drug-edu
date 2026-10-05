import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';
import 'package:drug_edu/features/visual_guides/data/visual_guide_catalog.dart';

void main() {
  group('Migraine and headache expansion batch 4D', () {
    const ids = <String>[
      'sumatriptan-nasal-spray',
      'sumatriptan-injection-autoinjector',
      'zolmitriptan-nasal-spray',
      'eletriptan-tablets',
      'lasmiditan-reyvow',
      'atogepant-qulipta',
      'erenumab-aimovig',
      'fremanezumab-ajovy',
      'galcanezumab-emgality',
      'dihydroergotamine-trudhesa',
    ];

    test('adds ten complete unique records and raises census to 389', () {
      final allIds = sampleMedications.map((m) => m.id).toList();
      expect(sampleMedications.length, 389);
      expect(allIds.toSet().length, 389);

      for (final id in ids) {
        expect(allIds, contains(id), reason: id);
        expect(medicationTimingRules[id], isNotNull, reason: 'timing $id');
        expect(
          medicationTimingRules[id]!.autoScheduleSafe,
          isFalse,
          reason: 'auto scheduling $id',
        );
        expect(therapyDurationFor(id), isNotNull, reason: 'duration $id');
        expect(
          englishPatientCounselingFor(id),
          isNotNull,
          reason: 'English counseling $id',
        );
      }
    });

    test('preserves existing migraine records instead of duplicating them', () {
      final ids = sampleMedications.map((m) => m.id).toSet();
      expect(ids, contains('sumatriptan-tablets'));
      expect(ids, contains('rizatriptan-odt'));
      expect(ids, contains('rimegepant-nurtec-odt'));
      expect(ids, contains('ubrogepant-ubrelvy'));
      expect(ids, contains('zavegepant-zavzpret-nasal'));
    });

    test('sumatriptan nasal keeps strength-specific technique and 2-hour lock',
        () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'sumatriptan-nasal-spray');

      expect(
        m.patient.howToUseAr,
        allOf(
          contains('5 أو 20 mg'),
          contains('10 mg'),
          contains('كل فتحة أنف'),
        ),
      );
      expect(
        m.patient.timingAr,
        allOf(contains('ساعتين'), contains('40 mg')),
      );
      expect(m.patient.importantAr, contains('24 ساعة'));
    });

    test('sumatriptan injection locks cluster indication and 1-hour repeat', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'sumatriptan-injection-autoinjector');

      expect(
        m.patient.purposeAr,
        allOf(contains('migraine'), contains('cluster headache')),
      );
      expect(m.patient.howToUseAr, contains('تحت الجلد فقط'));
      expect(
        m.patient.timingAr,
        allOf(contains('ساعة واحدة'), contains('12 mg')),
      );
    });

    test('zolmitriptan nasal and eletriptan keep their distinct dose locks', () {
      final zolmi = sampleMedications
          .firstWhere((m) => m.id == 'zolmitriptan-nasal-spray');
      final eletriptan =
          sampleMedications.firstWhere((m) => m.id == 'eletriptan-tablets');

      expect(
        zolmi.patient.timingAr,
        allOf(contains('ساعتين'), contains('10 mg')),
      );
      expect(
        zolmi.useProfile.specialPopulations,
        contains('cluster headache'),
      );

      expect(
        eletriptan.patient.timingAr,
        allOf(contains('ساعتين'), contains('80 mg')),
      );
      expect(
        eletriptan.patient.importantAr,
        allOf(contains('72 ساعة'), contains('clarithromycin')),
      );
    });

    test('REYVOW locks one dose and eight-hour driving restriction', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'lasmiditan-reyvow');

      expect(
        m.patient.howToUseAr,
        allOf(contains('جرعة واحدة'), contains('24 ساعة')),
      );
      expect(
        m.patient.timingAr,
        allOf(contains('8 ساعات'), contains('القيادة')),
      );
      expect(
        m.patient.howToUseAr,
        allOf(contains('لا تقسّمها'), contains('لا تسحقها')),
      );
    });

    test('QULIPTA remains daily prevention rather than attack rescue', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'atogepant-qulipta');

      expect(m.patient.purposeAr, contains('للوقاية'));
      expect(m.patient.howToUseAr, contains('مرة واحدة يوميًا'));
      expect(m.patient.timingAr, contains('مع الطعام أو بدونه'));
    });

    test('AIMOVIG locks monthly schedule warming and storage', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'erenumab-aimovig');

      expect(
        m.patient.howToUseAr,
        allOf(contains('30 دقيقة'), contains('لا ترجّه')),
      );
      expect(
        m.patient.storageAr,
        allOf(contains('2–8°C'), contains('7 أيام'), contains('لا تعدها')),
      );
      expect(m.patient.importantAr, contains('الإمساك'));
    });

    test('AJOVY locks monthly versus quarterly three-injection regimen', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'fremanezumab-ajovy');

      expect(
        m.patient.howToUseAr,
        allOf(
          contains('225 mg كل شهر'),
          contains('675 mg كل 3 أشهر'),
          contains('3 حقن'),
        ),
      );
      expect(m.patient.storageAr, contains('7 أيام'));
    });

    test('EMGALITY keeps migraine and episodic cluster regimens separate', () {
      final m =
          sampleMedications.firstWhere((m) => m.id == 'galcanezumab-emgality');

      expect(
        m.patient.howToUseAr,
        allOf(
          contains('240 mg'),
          contains('حقنتان 120 mg'),
          contains('300 mg'),
          contains('ثلاث حقن 100 mg'),
        ),
      );
      expect(
        m.patient.timingAr,
        contains('لا تبدل بين نظام migraine وcluster'),
      );
    });

    test('TRUDHESA locks exact priming device dose limits and 24-hour separation',
        () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'dihydroergotamine-trudhesa');

      expect(m.hasVisualGuide, isTrue);
      expect(visualGuidesForMedication(m.id), isNotEmpty);
      expect(
        visualGuidesForMedication(m.id).single.id,
        equals('trudhesa-nasal-device'),
      );
      expect(
        m.patient.howToUseAr,
        allOf(
          contains('4 مرات بالضبط'),
          contains('بخة واحدة في كل فتحة أنف'),
          contains('ارمِ الجهاز كاملًا'),
        ),
      );
      expect(
        m.patient.timingAr,
        allOf(contains('ساعة على الأقل'), contains('جهازًا جديدًا')),
      );
      expect(
        m.patient.importantAr,
        allOf(
          contains('جرعتان خلال 24 ساعة'),
          contains('3 جرعات خلال 7 أيام'),
          contains('triptan'),
        ),
      );
      expect(
        m.patient.storageAr,
        allOf(contains('20–25°C'), contains('8 ساعات')),
      );
    });
  });
}
