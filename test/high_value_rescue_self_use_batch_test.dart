import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  dynamic medicine(String id) =>
      sampleMedications.firstWhere((item) => item.id == id);

  test('high-value rescue and self-use batch is fully integrated', () {
    expect(sampleMedications.length, greaterThanOrEqualTo(157));

    for (final id in <String>[
      'semaglutide-oral-tablets',
      'epipen-auto-injector',
      'naloxone-narcan-nasal',
      'baqsimi-glucagon-nasal',
      'dulaglutide-trulicity',
    ]) {
      final item = medicine(id);
      expect(item.sourceLabel.trim(), isNotEmpty, reason: id);
      expect(item.patient.purposeAr.trim(), isNotEmpty, reason: id);
      expect(item.patient.howToUseAr.trim(), isNotEmpty, reason: id);
      expect(item.patient.missedDoseAr.trim(), isNotEmpty, reason: id);

      final english = englishPatientCounseling[id];
      expect(english, isNotNull, reason: '$id English counseling');
      final reviewed = english!;
      expect(reviewed.howToUse.trim(), isNotEmpty, reason: id);
      expect(reviewed.missedDose.trim(), isNotEmpty, reason: id);

      expect(therapyDurationFor(id), isNotNull, reason: '$id duration');
      expect(medicationTimingRules[id], isNotNull, reason: '$id timing');
    }
  });

  test('oral semaglutide locks formulation and morning administration', () {
    final item = medicine('semaglutide-oral-tablets');
    final facts = item.useProfile.facts.map((e) => e.value).join(' ');

    expect(facts, contains('3/7/14 mg'));
    expect(facts, contains('1.5/4/9 mg'));
    expect(facts.toLowerCase(), contains('not substitutable'));
    expect(facts, contains('4 oz'));
    expect(facts, contains('120 mL'));
    expect(facts, contains('30 minutes'));
    expect(facts.toLowerCase(), contains('do not split'));
    expect(item.patient.missedDoseAr, contains('اليوم التالي'));
    expect(
      medicationTimingRules['semaglutide-oral-tablets']!.autoScheduleSafe,
      isFalse,
    );
  });

  test('EpiPen keeps exact blue-orange-three-second emergency technique', () {
    final item = medicine('epipen-auto-injector');
    final text = [
      item.useProfile.formulationHandling,
      item.patient.howToUseAr,
      item.patient.importantAr,
      item.patient.storageAr,
    ].join(' ');

    expect(text.toLowerCase(), contains('blue'));
    expect(text.toLowerCase(), contains('orange'));
    expect(text, contains('3'));
    expect(item.useProfile.specialPopulations, contains('30 kg'));
    expect(item.useProfile.specialPopulations, contains('15–30 kg'));
    expect(item.patient.storageAr, contains('20–25°C'));
    expect(item.patient.storageAr, contains('الثلاجة'));
  });

  test('NARCAN remains one-device one-dose with 2 to 3 minute repeats', () {
    final item = medicine('naloxone-narcan-nasal');
    expect(item.useProfile.formulationHandling.toLowerCase(), contains('do not prime'));
    expect(item.useProfile.formulationHandling.toLowerCase(), contains('one dose'));
    expect(item.useProfile.monitoring, contains('2–3 minutes'));
    expect(item.patient.timingAr, contains('2–3'));
    expect(item.patient.storageAr, contains('2–25°C'));
    expect(item.patient.seekHelpAr, contains('الطوارئ'));
  });

  test('BAQSIMI locks sealed tube no-prime no-inhalation and 15-minute repeat', () {
    final item = medicine('baqsimi-glucagon-nasal');
    final handling = item.useProfile.formulationHandling.toLowerCase();

    expect(handling, contains('shrink-wrapped'));
    expect(handling, contains('do not test'));
    expect(item.sections.map((s) => s.body).join(' ').toLowerCase(),
        contains('does not need to inhale'));
    expect(item.useProfile.monitoring, contains('15 minutes'));
    expect(item.patient.storageAr, contains('30°C'));
    expect(item.patient.importantAr, contains('جهاز جديد'));
  });

  test('TRULICITY locks pen clicks, 72-hour rule and 14-day room temperature limit', () {
    final item = medicine('dulaglutide-trulicity');
    final handling = item.useProfile.formulationHandling;

    expect(handling, contains('green button'));
    expect(handling, contains('second loud click'));
    expect(handling, contains('5–10 seconds'));
    expect(handling, contains('gray plunger'));
    expect(item.patient.missedDoseAr, contains('72 ساعة'));
    expect(item.patient.storageAr, contains('14 يوم'));
    expect(item.patient.storageAr, contains('2–8°C'));
  });
}
