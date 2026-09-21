import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';
import 'package:drug_edu/features/visual_guides/data/visual_guide_catalog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  dynamic medicine(String id) =>
      sampleMedications.firstWhere((item) => item.id == id);

  test('insulin essentials batch is fully integrated', () {
    expect(sampleMedications.length, greaterThanOrEqualTo(167));

    for (final id in <String>[
      'insulin-degludec-tresiba',
      'humulin-n-nph',
      'humulin-r-u100',
      'humulin-70-30',
      'humulin-r-u500',
    ]) {
      final item = medicine(id);
      expect(item.sourceLabel.trim(), isNotEmpty, reason: id);
      expect(item.hasVisualGuide, isTrue, reason: '$id visual flag');
      expect(item.patient.howToUseAr.trim(), isNotEmpty, reason: id);

      final english = englishPatientCounseling[id];
      expect(english, isNotNull, reason: '$id English counseling');
      expect(english!.howToUse.trim(), isNotEmpty, reason: id);
      expect(english.missedDose.trim(), isNotEmpty, reason: id);

      expect(therapyDurationFor(id), isNotNull, reason: '$id duration');
      expect(medicationTimingRules[id], isNotNull, reason: '$id timing');
      expect(medicationTimingRules[id]!.autoScheduleSafe, isFalse, reason: id);
      expect(visualGuidesForMedication(id), hasLength(1), reason: id);
    }
  });

  test('TRESIBA keeps U-100 and U-200 dose windows conversion-free', () {
    final item = medicine('insulin-degludec-tresiba');
    final text = [
      item.useProfile.formulationHandling,
      item.useProfile.specialPopulations,
      item.sections.map((s) => s.body).join(' '),
      item.patient.storageAr,
    ].join(' ');

    expect(text, contains('U-100'));
    expect(text, contains('U-200'));
    expect(text, contains('80 units'));
    expect(text, contains('160 units'));
    expect(text.toLowerCase(), contains('do not perform dose conversion'));
    expect(text, contains('2 units'));
    expect(text, contains('counting to 6'));
    expect(text, contains('8 hours'));
    expect(item.patient.storageAr, contains('56 يوم'));
  });

  test('HUMULIN N locks 10-roll 10-invert cloudy suspension technique', () {
    final item = medicine('humulin-n-nph');
    final text = [
      item.useProfile.formulationHandling,
      item.sections.map((s) => s.body).join(' '),
      item.patient.storageAr,
    ].join(' ');

    expect(text, contains('roll'));
    expect(text, contains('10 times'));
    expect(text, contains('invert'));
    expect(text.toLowerCase(), contains('white and cloudy'));
    expect(text, contains('2 units'));
    expect(text, contains('counting to 5'));
    expect(item.patient.storageAr, contains('14 يوم'));
    expect(item.patient.storageAr, contains('31 يوم'));
  });

  test('HUMULIN R U-100 remains clear U-100 vial insulin linked to meals', () {
    final item = medicine('humulin-r-u100');
    final text = [
      item.useProfile.formulationHandling,
      item.useProfile.foodTiming,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text, contains('U-100'));
    expect(text.toLowerCase(), contains('clear and colorless'));
    expect(text, contains('U-100 insulin syringe'));
    expect(text, contains('30 minutes'));
    expect(text, contains('U-500'));
    expect(item.patient.storageAr, contains('31 يوم'));
  });

  test('HUMULIN 70/30 locks fixed ratio mixing meal timing and pen expiry', () {
    final item = medicine('humulin-70-30');
    final text = [
      item.useProfile.formulationHandling,
      item.useProfile.foodTiming,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text, contains('70%'));
    expect(text, contains('30%'));
    expect(text.toLowerCase(), contains('fixed'));
    expect(text, contains('roll 10 times'));
    expect(text, contains('invert 10 times'));
    expect(text, contains('30–45 minutes'));
    expect(text.toLowerCase(), contains('do not mix'));
    expect(item.patient.storageAr, contains('10 أيام'));
    expect(item.patient.storageAr, contains('31 يوم'));
  });

  test('HUMULIN R U-500 preserves five-times concentration and device locks', () {
    final item = medicine('humulin-r-u500');
    final text = [
      item.useProfile.route,
      item.useProfile.formulationHandling,
      item.sections.map((s) => s.body).join(' '),
      item.patient.storageAr,
    ].join(' ');

    expect(text, contains('500 units/mL'));
    expect(text.toLowerCase(), contains('five times'));
    expect(text, contains('more than 200 units'));
    expect(text, contains('5-unit increments'));
    expect(text, contains('300 units'));
    expect(text.toLowerCase(), contains('no conversion'));
    expect(text, contains('U-500 insulin syringe'));
    expect(text, contains('U-100'));
    expect(text, contains('prime with 5 units'));
    expect(item.patient.storageAr, contains('28 يوم'));
    expect(item.patient.storageAr, contains('40 يوم'));
  });

  test('insulin visual guides keep suspension and concentration rules separate', () {
    final tresiba =
        visualGuidesForMedication('insulin-degludec-tresiba').single;
    final nph = visualGuidesForMedication('humulin-n-nph').single;
    final regular = visualGuidesForMedication('humulin-r-u100').single;
    final premix = visualGuidesForMedication('humulin-70-30').single;
    final u500 = visualGuidesForMedication('humulin-r-u500').single;

    expect(tresiba.id, 'tresiba-flextouch');
    expect(tresiba.steps.join(' '), contains('slowly count to 6'));

    expect(nph.id, 'humulin-n-kwikpen');
    expect(nph.steps.join(' '), contains('roll'));
    expect(nph.steps.join(' '), contains('white and cloudy'));

    expect(regular.id, 'humulin-r-u100-vial');
    expect(regular.steps.join(' '), contains('U-100 insulin syringe'));
    expect(regular.steps.join(' '), contains('30 minutes'));

    expect(premix.id, 'humulin-70-30-kwikpen');
    expect(premix.steps.join(' '), contains('30–45 minutes'));

    expect(u500.id, 'humulin-r-u500-device');
    expect(u500.mistakes.join(' '), contains('U-100'));
    expect(u500.steps.join(' '), contains('U-500 insulin syringe'));
  });
}
