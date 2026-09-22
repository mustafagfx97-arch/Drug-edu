import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';
import 'package:drug_edu/features/visual_guides/data/visual_guide_catalog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  dynamic medicine(String id) =>
      sampleMedications.firstWhere((item) => item.id == id);

  test('mesalamine formulation batch is fully integrated', () {
    expect(sampleMedications.length, greaterThanOrEqualTo(182));

    for (final id in <String>[
      'mesalamine-lialda',
      'mesalamine-apriso',
      'mesalamine-pentasa',
      'mesalamine-canasa-suppository',
      'mesalamine-rowasa-enema',
    ]) {
      final item = medicine(id);
      expect(item.sourceLabel.trim(), isNotEmpty, reason: id);
      expect(item.patient.howToUseAr.trim(), isNotEmpty, reason: id);

      final english = englishPatientCounseling[id];
      expect(english, isNotNull, reason: '$id English counseling');
      expect(english!.howToUse.trim(), isNotEmpty, reason: id);

      expect(therapyDurationFor(id), isNotNull, reason: '$id duration');
      expect(medicationTimingRules[id], isNotNull, reason: '$id timing');
    }

    expect(
      visualGuidesForMedication('mesalamine-canasa-suppository'),
      hasLength(1),
    );
    expect(
      visualGuidesForMedication('mesalamine-rowasa-enema'),
      hasLength(1),
    );
  });

  test('LIALDA stays once daily with food and whole-tablet only', () {
    final item = medicine('mesalamine-lialda');
    final text = [
      item.useProfile.foodTiming,
      item.useProfile.formulationHandling,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text.toLowerCase(), contains('with food'));
    expect(text.toLowerCase(), contains('once daily'));
    expect(text.toLowerCase(), contains('do not split'));
    expect(text.toLowerCase(), contains('do not'));
    expect(text.toLowerCase(), contains('interchange'));
  });

  test('APRISO remains morning maintenance and antacid-avoidant', () {
    final item = medicine('mesalamine-apriso');
    final text = [
      item.useProfile.foodTiming,
      item.useProfile.duration,
      item.useProfile.formulationHandling,
      item.useProfile.interactions,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text.toLowerCase(), contains('morning'));
    expect(text.toLowerCase(), contains('maintenance'));
    expect(text.toLowerCase(), contains('antacid'));
    expect(text.toLowerCase(), contains('do not cut'));
    expect(text.toLowerCase(), contains('do not'));
  });

  test('PENTASA preserves sprinkle exception without crushing beads', () {
    final item = medicine('mesalamine-pentasa');
    final text = [
      item.useProfile.formulationHandling,
      item.sections.map((s) => s.body).join(' '),
      item.patient.howToUseAr,
    ].join(' ');

    expect(text.toLowerCase(), contains('applesauce'));
    expect(text.toLowerCase(), contains('yogurt'));
    expect(text.toLowerCase(), contains('immediately'));
    expect(text.toLowerCase(), contains('do not crush'));
    expect(text.toLowerCase(), contains('four times daily'));
  });

  test('CANASA locks bedtime pointed-end insertion and retention window', () {
    final item = medicine('mesalamine-canasa-suppository');
    final text = [
      item.useProfile.foodTiming,
      item.useProfile.duration,
      item.useProfile.formulationHandling,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text.toLowerCase(), contains('bedtime'));
    expect(text.toLowerCase(), contains('pointed end first'));
    expect(text, contains('1 to 3 hours'));
    expect(text, contains('3 to 6 weeks'));
    expect(text.toLowerCase(), contains('do not cut or break'));

    final guide =
        visualGuidesForMedication('mesalamine-canasa-suppository').single;
    expect(guide.id, 'canasa-suppository');
    expect(guide.steps.join(' ').toLowerCase(), contains('pointed end first'));
  });

  test('ROWASA locks shake-position-retain technique and sulfite distinction', () {
    final item = medicine('mesalamine-rowasa-enema');
    final text = [
      item.useProfile.formulationHandling,
      item.useProfile.specialPopulations,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text.toLowerCase(), contains('shake'));
    expect(text.toLowerCase(), contains('left side'));
    expect(text.toLowerCase(), contains('umbilicus'));
    expect(text, contains('30 minutes'));
    expect(text, contains('8 hours'));
    expect(text.toLowerCase(), contains('sulfite'));
    expect(text, contains('sfROWASA'));

    final guide = visualGuidesForMedication('mesalamine-rowasa-enema').single;
    expect(guide.id, 'rowasa-enema');
    expect(guide.steps.join(' ').toLowerCase(), contains('knee-chest'));
    expect(guide.steps.join(' '), contains('30 minutes'));
  });
}
