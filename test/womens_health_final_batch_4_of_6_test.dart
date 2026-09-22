import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_plan_engine.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_plan_models.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';
import 'package:drug_edu/features/visual_guides/data/visual_guide_catalog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  dynamic medicine(String id) =>
      sampleMedications.firstWhere((item) => item.id == id);

  const engine = MedicationPlanEngine();
  const routine = PatientRoutine(
    wakeMinutes: 390,
    breakfastMinutes: 480,
    lunchMinutes: 780,
    dinnerMinutes: 1200,
    bedtimeMinutes: 1380,
  );

  MedicationPlanItem planItem(
    String id,
    String name, {
    RegimenFrequency frequency = RegimenFrequency.onceDaily,
    TimingPreference preference = TimingPreference.auto,
  }) {
    return MedicationPlanItem(
      id: '$id-1',
      sourceId: id,
      type: PlanItemType.medicine,
      name: name,
      doseText: '1 dose',
      frequency: frequency,
      preference: preference,
    );
  }

  test('women health final batch 4 of 6 is fully integrated', () {
    expect(sampleMedications.length, greaterThanOrEqualTo(213));

    for (final id in <String>[
      'drospirenone-slynd-4mg',
      'medroxyprogesterone-depo-provera-ci-150mg-im',
      'etonogestrel-ethinyl-estradiol-vaginal-ring',
      'norelgestromin-ethinyl-estradiol-patch',
    ]) {
      final item = medicine(id);
      expect(item.familyId, 'womens-health', reason: id);
      expect(item.sourceLabel.trim(), isNotEmpty, reason: id);
      expect(item.patient.howToUseAr.trim(), isNotEmpty, reason: id);

      final english = englishPatientCounseling[id];
      expect(english, isNotNull, reason: '$id English counseling');
      expect(english!.howToUse.trim(), isNotEmpty, reason: id);

      expect(therapyDurationFor(id), isNotNull, reason: '$id duration');
      expect(medicationTimingRules[id], isNotNull, reason: '$id timing');
      expect(
        medicationTimingRules[id]!.autoScheduleSafe,
        isFalse,
        reason: '$id requires contraception-specific review',
      );
    }
  });

  test('SLYND locks 24 plus 4 pack, missed-dose backup and potassium monitoring', () {
    final item = medicine('drospirenone-slynd-4mg');
    final text = [
      item.useProfile.route,
      item.useProfile.formulationHandling,
      item.useProfile.monitoring,
      item.useProfile.interactions,
      item.useProfile.specialPopulations,
      item.sections.map((s) => s.body).join(' '),
      item.patient.missedDoseAr,
    ].join(' ');

    expect(text, contains('24 white active'));
    expect(text, contains('4 green inert'));
    expect(text.toLowerCase(), contains('two or more active tablets'));
    expect(text, contains('7 days'));
    expect(text.toLowerCase(), contains('potassium'));
    expect(text.toLowerCase(), contains('first treatment cycle'));
    expect(text.toLowerCase(), contains('renal impairment'));
    expect(text.toLowerCase(), contains('adrenal insufficiency'));
  });

  test('Depo-Provera locks 150 mg IM, 13 weeks, >2 years and meningioma', () {
    final item = medicine('medroxyprogesterone-depo-provera-ci-150mg-im');
    final text = [
      item.useProfile.route,
      item.useProfile.duration,
      item.useProfile.formulationHandling,
      item.useProfile.monitoring,
      item.useProfile.interactions,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text, contains('150 mg'));
    expect(text.toLowerCase(), contains('deep intramuscular'));
    expect(text, contains('13 weeks'));
    expect(text.toLowerCase(), contains('2 years'));
    expect(text.toLowerCase(), contains('pregnant'));
    expect(text.toLowerCase(), contains('meningioma'));
    expect(text.toLowerCase(), contains('carbamazepine'));
    expect(text.toLowerCase(), contains('subcutaneous'));
  });

  test('vaginal ring locks 3 weeks in, 1 week out and expelled-ring rules', () {
    final item = medicine('etonogestrel-ethinyl-estradiol-vaginal-ring');
    final text = [
      item.useProfile.route,
      item.useProfile.formulationHandling,
      item.useProfile.commonMistakes,
      item.sections.map((s) => s.body).join(' '),
      item.patient.storageAr,
    ].join(' ');

    expect(text.toLowerCase(), contains('3 weeks'));
    expect(text.toLowerCase(), contains('1-week'));
    expect(text.toLowerCase(), contains('less than 3 hours'));
    expect(text.toLowerCase(), contains('cool-to-lukewarm'));
    expect(text.toLowerCase(), contains('not hot'));
    expect(text.toLowerCase(), contains('more than 3'));
    expect(text, contains('7 days'));
    expect(text.toLowerCase(), contains('4 months'));
    expect(text, contains('30°C'));

    final guides = visualGuidesForMedication(item.id);
    expect(guides, hasLength(1));
    expect(guides.single.id, 'contraceptive-vaginal-ring');
  });

  test('contraceptive patch locks sites, 10-second press, detachment and BMI', () {
    final item = medicine('norelgestromin-ethinyl-estradiol-patch');
    final text = [
      item.useProfile.route,
      item.useProfile.foodTiming,
      item.useProfile.formulationHandling,
      item.useProfile.specialPopulations,
      item.sections.map((s) => s.body).join(' '),
      item.patient.missedDoseAr,
    ].join(' ');

    expect(text.toLowerCase(), contains('upper outer arm'));
    expect(text.toLowerCase(), contains('10 seconds'));
    expect(text.toLowerCase(), contains('less than 1 day'));
    expect(text.toLowerCase(), contains('more than 1 day'));
    expect(text, contains('7 days'));
    expect(text, contains('BMI ≥30'));
    expect(text, contains('198 lb'));
    expect(text, contains('90 kg'));
    expect(text.toLowerCase(), contains('more than 2 days'));

    final guides = visualGuidesForMedication(item.id);
    expect(guides, hasLength(1));
    expect(guides.single.id, 'contraceptive-patch');
  });

  test('SLYND plus spironolactone creates potassium monitoring alert', () {
    final plan = engine.generate(
      items: [
        planItem('drospirenone-slynd-4mg', 'SLYND'),
        planItem('spironolactone', 'Spironolactone'),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) =>
            alert.title == 'SLYND + potassium-raising therapy' &&
            alert.isCritical,
      ),
      isTrue,
    );
  });

  test('carbamazepine plus vaginal ring creates contraception interaction alert', () {
    final plan = engine.generate(
      items: [
        planItem('carbamazepine', 'Carbamazepine'),
        planItem(
          'etonogestrel-ethinyl-estradiol-vaginal-ring',
          'Vaginal ring',
        ),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) =>
            alert.title == 'Carbamazepine + hormonal contraception' &&
            alert.isCritical,
      ),
      isTrue,
    );
  });

  test('Mounjaro plus SLYND creates oral contraception interaction alert', () {
    final plan = engine.generate(
      items: [
        planItem(
          'tirzepatide-mounjaro',
          'Mounjaro',
          frequency: RegimenFrequency.weekly,
        ),
        planItem('drospirenone-slynd-4mg', 'SLYND'),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) =>
            alert.title == 'Tirzepatide + oral hormonal contraception' &&
            alert.isCritical,
      ),
      isTrue,
    );
  });
}
