import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';
import 'package:drug_edu/features/visual_guides/data/visual_guide_catalog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  dynamic medicine(String id) =>
      sampleMedications.firstWhere((item) => item.id == id);

  test('OTC self-care final batch 2 of 6 is fully integrated', () {
    expect(sampleMedications.length, greaterThanOrEqualTo(205));

    for (final id in <String>[
      'calcium-carbonate-antacid-500mg-chewable',
      'magnesium-hydroxide-milk-of-magnesia-2400mg30ml',
      'glycerin-adult-suppository-2g',
      'meclizine-25mg-motion-sickness-otc',
    ]) {
      final item = medicine(id);
      expect(item.familyId, 'otc', reason: id);
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
        reason: '$id requires self-care/product review',
      );
    }
  });

  test('calcium carbonate locks strength, chewing and OTC duration boundary', () {
    final item = medicine('calcium-carbonate-antacid-500mg-chewable');
    final text = [
      item.useProfile.route,
      item.useProfile.duration,
      item.useProfile.formulationHandling,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text, contains('500 mg'));
    expect(text, contains('200 mg elemental calcium'));
    expect(text.toLowerCase(), contains('chew'));
    expect(text, contains('2–4 tablets'));
    expect(text, contains('15 tablets'));
    expect(text.toLowerCase(), contains('2 weeks'));
  });

  test('Milk of Magnesia locks separate antacid and laxative directions', () {
    final item = medicine('magnesium-hydroxide-milk-of-magnesia-2400mg30ml');
    final text = [
      item.useProfile.route,
      item.useProfile.foodTiming,
      item.useProfile.duration,
      item.useProfile.formulationHandling,
      item.useProfile.specialPopulations,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text, contains('2400 mg per 30 mL'));
    expect(text.toLowerCase(), contains('shake well'));
    expect(text, contains('8 oz'));
    expect(text, contains('30–60 mL'));
    expect(text, contains('60 mL/24 hours'));
    expect(text, contains('1/2 to 6 hours'));
    expect(text.toLowerCase(), contains('kidney disease'));
    expect(text.toLowerCase(), contains('more than 1 week'));
  });

  test('adult glycerin suppository locks rectal technique and fast onset', () {
    final item = medicine('glycerin-adult-suppository-2g');
    final text = [
      item.useProfile.route,
      item.useProfile.duration,
      item.useProfile.formulationHandling,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text, contains('2 g'));
    expect(text.toLowerCase(), contains('rectal'));
    expect(text.toLowerCase(), contains('retain for 15 minutes'));
    expect(text.toLowerCase(), contains('does not need to melt'));
    expect(text.toLowerCase(), contains('one adult suppository daily'));
    expect(text.toLowerCase(), contains('1 week'));

    final guides = visualGuidesForMedication(item.id);
    expect(guides, hasLength(1));
    expect(guides.single.id, 'glycerin-adult-suppository');
    expect(guides.single.patientSummaryAr, contains('15 دقيقة'));
  });

  test('meclizine locks pre-travel timing and sedation counseling', () {
    final item = medicine('meclizine-25mg-motion-sickness-otc');
    final text = [
      item.useProfile.route,
      item.useProfile.foodTiming,
      item.useProfile.duration,
      item.useProfile.interactions,
      item.useProfile.specialPopulations,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text, contains('25 mg'));
    expect(text, contains('1/2 to 1 hour'));
    expect(text.toLowerCase(), contains('once daily'));
    expect(text.toLowerCase(), contains('drowsiness'));
    expect(text.toLowerCase(), contains('alcohol'));
    expect(text.toLowerCase(), contains('glaucoma'));
    expect(text.toLowerCase(), contains('under 12'));
  });
}
