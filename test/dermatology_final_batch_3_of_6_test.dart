import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';
import 'package:drug_edu/features/visual_guides/data/visual_guide_catalog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  dynamic medicine(String id) =>
      sampleMedications.firstWhere((item) => item.id == id);

  test('dermatology final batch 3 of 6 is fully integrated', () {
    expect(sampleMedications.length, greaterThanOrEqualTo(209));

    for (final id in <String>[
      'permethrin-5-cream-scabies',
      'clotrimazole-1-cream-otc',
      'adapalene-0-1-gel-otc',
      'mupirocin-2-ointment-impetigo',
    ]) {
      final item = medicine(id);
      expect(item.familyId, 'allergy-dermatology', reason: id);
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
        reason: '$id requires site/formulation-specific review',
      );
    }
  });

  test('permethrin locks full-body coverage contact time and retreatment rule', () {
    final item = medicine('permethrin-5-cream-scabies');
    final text = [
      item.useProfile.route,
      item.useProfile.foodTiming,
      item.useProfile.duration,
      item.useProfile.formulationHandling,
      item.useProfile.specialPopulations,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text, contains('2 months'));
    expect(text.toLowerCase(), contains('head to the soles'));
    expect(text, contains('8–14'));
    expect(text, contains('30 g'));
    expect(text.toLowerCase(), contains('one complete application'));
    expect(text.toLowerCase(), contains('living mites after 14 days'));

    final guides = visualGuidesForMedication(item.id);
    expect(guides, hasLength(1));
    expect(guides.single.id, 'permethrin-scabies-full-body');
    expect(guides.single.patientSummaryAr, contains('8–14'));
  });

  test('clotrimazole locks site-specific duration and athlete foot hygiene', () {
    final item = medicine('clotrimazole-1-cream-otc');
    final text = [
      item.useProfile.route,
      item.useProfile.foodTiming,
      item.useProfile.duration,
      item.useProfile.formulationHandling,
      item.useProfile.specialPopulations,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text.toLowerCase(), contains('twice daily'));
    expect(text.toLowerCase(), contains('morning and night'));
    expect(text.toLowerCase(), contains('4 weeks'));
    expect(text.toLowerCase(), contains('2 weeks'));
    expect(text.toLowerCase(), contains('between the toes'));
    expect(text.toLowerCase(), contains('scalp or nails'));
    expect(text.toLowerCase(), contains('under 2 years'));
  });

  test('adapalene locks whole-area once-daily use and realistic response time', () {
    final item = medicine('adapalene-0-1-gel-otc');
    final text = [
      item.useProfile.route,
      item.useProfile.duration,
      item.useProfile.formulationHandling,
      item.useProfile.interactions,
      item.useProfile.specialPopulations,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text, contains('0.1%'));
    expect(text.toLowerCase(), contains('entire acne-affected area'));
    expect(text.toLowerCase(), contains('once daily'));
    expect(text.toLowerCase(), contains('3 months'));
    expect(text.toLowerCase(), contains('waxing'));
    expect(text.toLowerCase(), contains('sunscreen'));
    expect(text.toLowerCase(), contains('pregnant'));
    expect(text.toLowerCase(), contains('12 years'));
  });

  test('mupirocin locks three-times-daily course and skin-only formulation', () {
    final item = medicine('mupirocin-2-ointment-impetigo');
    final text = [
      item.useProfile.route,
      item.useProfile.duration,
      item.useProfile.formulationHandling,
      item.useProfile.interactions,
      item.useProfile.specialPopulations,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text.toLowerCase(), contains('three times daily'));
    expect(text.toLowerCase(), contains('up to 10 days'));
    expect(text, contains('3–5 days'));
    expect(text.toLowerCase(), contains('not the separate intranasal formulation'));
    expect(text.toLowerCase(), contains('other lotions, creams or ointments'));
    expect(text.toLowerCase(), contains('polyethylene-glycol'));
    expect(text.toLowerCase(), contains('renal impairment'));
    expect(text.toLowerCase(), contains('iv cannula'));
  });
}
