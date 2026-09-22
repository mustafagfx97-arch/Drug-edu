import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  dynamic medicine(String id) =>
      sampleMedications.firstWhere((item) => item.id == id);

  test('final clinical audit 5 of 6 keeps the 213-record baseline', () {
    expect(sampleMedications.length, 213);
    expect(
      sampleMedications.map((item) => item.id).toSet().length,
      sampleMedications.length,
    );
  });

  test('dapagliflozin locks 3-day perioperative hold and safe restart', () {
    final item = medicine('dapagliflozin');
    final text = [
      item.useProfile.specialPopulations,
      item.sections.map((s) => s.body).join(' '),
      item.patient.importantAr,
    ].join(' ');

    expect(text.toLowerCase(), contains('at least 3 days'));
    expect(text.toLowerCase(), contains('prolonged fasting'));
    expect(text.toLowerCase(), contains('clinically stable'));
    expect(text.toLowerCase(), contains('oral intake'));
    expect(
      medicationTimingRules['dapagliflozin']!.instructionAr,
      contains('3 أيام'),
    );

    final en = englishPatientCounseling['dapagliflozin']!;
    expect(en.important.toLowerCase(), contains('at least 3 days'));
    expect(en.important.toLowerCase(), contains('oral intake resumed'));
  });

  test('empagliflozin locks 3-day perioperative hold and missed dose', () {
    final item = medicine('empagliflozin');
    final text = [
      item.sections.map((s) => s.body).join(' '),
      item.patient.importantAr,
      item.patient.missedDoseAr ?? '',
    ].join(' ');

    expect(text.toLowerCase(), contains('at least 3 days'));
    expect(text.toLowerCase(), contains('prolonged fasting'));
    expect(text.toLowerCase(), contains('oral intake'));
    expect(text, contains('لا تضاعف'));
    expect(
      medicationTimingRules['empagliflozin']!.instructionAr,
      contains('3 أيام'),
    );

    final en = englishPatientCounseling['empagliflozin']!;
    expect(en.important.toLowerCase(), contains('at least 3 days'));
    expect(en.important.toLowerCase(), contains('oral intake resumed'));
  });

  test('insulin lispro locks exact HUMALOG and ADMELOG meal window', () {
    final item = medicine('insulin-lispro');
    final text = [
      item.useProfile.foodTiming,
      item.sections.map((s) => s.body).join(' '),
      item.patient.timingAr,
    ].join(' ');

    expect(text.toLowerCase(), contains('humalog'));
    expect(text.toLowerCase(), contains('admelog'));
    expect(text.toLowerCase(), contains('within 15 minutes before'));
    expect(text.toLowerCase(), contains('immediately after'));
    expect(text, contains('15 دقيقة'));

    final en = englishPatientCounseling['insulin-lispro']!;
    expect(en.timing.toLowerCase(), contains('within 15 minutes before'));
    expect(en.timing.toLowerCase(), contains('immediately after'));
    expect(
      medicationTimingRules['insulin-lispro']!.instructionAr,
      contains('15 دقيقة'),
    );
  });

  test('nitroglycerin sublingual locks potency-preserving storage', () {
    final item = medicine('nitroglycerin-sublingual');
    final text = [
      item.sourceLabel,
      item.patient.storageAr ?? '',
    ].join(' ');

    expect(text.toLowerCase(), contains('original'));
    expect(text.toLowerCase(), contains('glass'));
    expect(text.toLowerCase(), contains('20–25'));
    expect(text, contains('بإحكام'));

    final en = englishPatientCounseling['nitroglycerin-sublingual']!;
    expect(en.storage.toLowerCase(), contains('original glass container'));
    expect(en.storage.toLowerCase(), contains('20–25'));
  });

  test('latanoprost locks XALATAN storage, lens interval and missed dose', () {
    final item = medicine('latanoprost');
    final text = [
      item.sections.map((s) => s.body).join(' '),
      item.patient.timingAr,
      item.patient.missedDoseAr ?? '',
      item.patient.storageAr ?? '',
      item.patient.seekHelpAr ?? '',
    ].join(' ');

    expect(text, contains('2–8°C'));
    expect(text, contains('25°C'));
    expect(text.toLowerCase(), contains('6 weeks'));
    expect(text.toLowerCase(), contains('15 minutes'));
    expect(text, contains('15 دقيقة'));
    expect(text, contains('لا تضاعف'));

    final en = englishPatientCounseling['latanoprost']!;
    expect(en.storage.toLowerCase(), contains('2–8'));
    expect(en.storage.toLowerCase(), contains('6 weeks'));
    expect(en.missed.toLowerCase(), contains('next dose'));
  });
}
