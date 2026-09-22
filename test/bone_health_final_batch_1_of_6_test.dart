import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';
import 'package:drug_edu/features/visual_guides/data/visual_guide_catalog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  dynamic medicine(String id) =>
      sampleMedications.firstWhere((item) => item.id == id);

  test('bone health final batch 1 of 6 is fully integrated', () {
    expect(sampleMedications.length, greaterThanOrEqualTo(201));

    for (final id in <String>[
      'teriparatide-forteo',
      'abaloparatide-tymlos',
      'romosozumab-evenity',
      'zoledronic-acid-osteoporosis',
    ]) {
      final item = medicine(id);
      expect(item.familyId, 'bone-health', reason: id);
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
        reason: '$id requires regimen/product review',
      );
    }
  });

  test('FORTEO locks exact device storage and administration', () {
    final item = medicine('teriparatide-forteo');
    final text = [
      item.useProfile.route,
      item.useProfile.duration,
      item.useProfile.formulationHandling,
      item.sections.map((s) => s.body).join(' '),
      item.patient.storageAr,
    ].join(' ');

    expect(text, contains('20 mcg'));
    expect(text.toLowerCase(), contains('counting to 5'));
    expect(text.toLowerCase(), contains('do not transfer'));
    expect(text, contains('2–8°C'));
    expect(text, contains('28'));
    expect(text.toLowerCase(), contains('2 years'));

    final guides = visualGuidesForMedication(item.id);
    expect(guides, hasLength(1));
    expect(guides.single.id, 'forteo-pen');
    expect(guides.single.patientSummaryAr, contains('5'));
  });

  test('TYMLOS locks Day-1 priming, 10-count and storage change', () {
    final item = medicine('abaloparatide-tymlos');
    final text = [
      item.useProfile.route,
      item.useProfile.duration,
      item.useProfile.formulationHandling,
      item.sections.map((s) => s.body).join(' '),
      item.patient.storageAr,
      item.patient.missedDoseAr,
    ].join(' ');

    expect(text, contains('80 mcg'));
    expect(text.toLowerCase(), contains('day 1 only'));
    expect(text.toLowerCase(), contains('counting to 10'));
    expect(text, contains('2–8°C'));
    expect(text, contains('20–25°C'));
    expect(text, contains('30'));
    expect(text.toLowerCase(), contains('2 years'));

    final guides = visualGuidesForMedication(item.id);
    expect(guides, hasLength(1));
    expect(guides.single.id, 'tymlos-pen');
    expect(guides.single.patientSummaryAr, contains('10'));
  });

  test('EVENITY locks two syringes, 12 doses and cardiovascular rule', () {
    final item = medicine('romosozumab-evenity');
    final text = [
      item.useProfile.route,
      item.useProfile.duration,
      item.useProfile.formulationHandling,
      item.useProfile.specialPopulations,
      item.sections.map((s) => s.body).join(' '),
      item.patient.missedDoseAr,
    ].join(' ');

    expect(text.toLowerCase(), contains('two'));
    expect(text, contains('210 mg'));
    expect(text, contains('12'));
    expect(text.toLowerCase(), contains('30 minutes'));
    expect(text.toLowerCase(), contains('do not shake'));
    expect(text.toLowerCase(), contains('myocardial infarction'));
    expect(text.toLowerCase(), contains('preceding year'));
    expect(text.toLowerCase(), contains('rescheduled'));
  });

  test('zoledronic acid osteoporosis locks renal function and infusion time', () {
    final item = medicine('zoledronic-acid-osteoporosis');
    final text = [
      item.useProfile.route,
      item.useProfile.duration,
      item.useProfile.formulationHandling,
      item.useProfile.specialPopulations,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text, contains('5 mg/100 mL'));
    expect(text.toLowerCase(), contains('no less than 15 minutes'));
    expect(text, contains('35 mL/min'));
    expect(text.toLowerCase(), contains('dehydration'));
    expect(text.toLowerCase(), contains('serum creatinine'));
    expect(text.toLowerCase(), contains('acetaminophen'));
    expect(text.toLowerCase(), contains('first 3 days'));
  });
}
