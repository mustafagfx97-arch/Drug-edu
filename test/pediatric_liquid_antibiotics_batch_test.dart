import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';
import 'package:drug_edu/features/visual_guides/data/visual_guide_catalog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  dynamic medicine(String id) =>
      sampleMedications.firstWhere((item) => item.id == id);

  test('pediatric liquid antibiotic batch is fully integrated', () {
    expect(sampleMedications.length, greaterThanOrEqualTo(192));

    for (final id in <String>[
      'amoxicillin-clavulanate-augmentin-es600-suspension',
      'azithromycin-suspension-200mg5ml',
      'cephalexin-suspension-250mg5ml',
      'trimethoprim-sulfamethoxazole-suspension-200-40mg5ml',
      'nitrofurantoin-suspension-25mg5ml',
    ]) {
      final item = medicine(id);
      expect(item.familyId, 'pediatrics', reason: id);
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
        reason: '$id should not be auto-scheduled without regimen review',
      );

      final guides = visualGuidesForMedication(id);
      expect(guides, hasLength(1), reason: '$id oral syringe guide');
      expect(guides.single.id, 'oral-syringe', reason: id);
    }
  });

  test('AUGMENTIN ES-600 stays meal-start and non-interchangeable', () {
    final item = medicine('amoxicillin-clavulanate-augmentin-es600-suspension');
    final text = [
      item.useProfile.foodTiming,
      item.useProfile.formulationHandling,
      item.useProfile.specialPopulations,
      item.sections.map((s) => s.body).join(' '),
      item.patient.storageAr,
    ].join(' ');

    expect(text.toLowerCase(), contains('start of a meal'));
    expect(text, contains('600/42.9'));
    expect(text, contains('200/28.5'));
    expect(text, contains('400/57'));
    expect(text.toLowerCase(), contains('not automatically interchangeable'));
    expect(text, contains('70 mL'));
    expect(text, contains('110 mL'));
    expect(text, contains('180 mL'));
    expect(text.toLowerCase(), contains('refriger'));
    expect(text, contains('10 أيام'));
  });

  test('azithromycin suspension locks strength, shaking and antacid rule', () {
    final item = medicine('azithromycin-suspension-200mg5ml');
    final text = [
      item.useProfile.route,
      item.useProfile.foodTiming,
      item.useProfile.formulationHandling,
      item.useProfile.specialPopulations,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text, contains('200 mg per 5 mL'));
    expect(text.toLowerCase(), contains('shake well'));
    expect(text.toLowerCase(), contains('with or without food'));
    expect(text.toLowerCase(), contains('aluminum'));
    expect(text.toLowerCase(), contains('magnesium'));
    expect(text.toLowerCase(), contains('room-temperature'));
    expect(text.toLowerCase(), contains('rather than requiring refrigeration'));
  });

  test('cephalexin suspension keeps manufacturer-specific reconstitution lock', () {
    final item = medicine('cephalexin-suspension-250mg5ml');
    final text = [
      item.useProfile.formulationHandling,
      item.useProfile.specialPopulations,
      item.sections.map((s) => s.body).join(' '),
      item.patient.storageAr,
    ].join(' ');

    expect(text, contains('250 mg/5 mL'));
    expect(text, contains('66'));
    expect(text, contains('67'));
    expect(text, contains('69'));
    expect(text.toLowerCase(), contains('manufacturer'));
    expect(text.toLowerCase(), contains('refriger'));
    expect(text, contains('14 يوم'));
  });

  test('TMP-SMX suspension locks hydration, potassium and light protection', () {
    final item =
        medicine('trimethoprim-sulfamethoxazole-suspension-200-40mg5ml');
    final text = [
      item.useProfile.route,
      item.useProfile.foodTiming,
      item.useProfile.formulationHandling,
      item.useProfile.interactions,
      item.useProfile.specialPopulations,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text, contains('200 mg'));
    expect(text, contains('40 mg'));
    expect(text.toLowerCase(), contains('adequate fluid'));
    expect(text.toLowerCase(), contains('protect from light'));
    expect(text.toLowerCase(), contains('spironolactone'));
    expect(text.toLowerCase(), contains('potassium'));
    expect(text.toLowerCase(), contains('younger than 2 months'));
  });

  test('nitrofurantoin suspension locks food, vigorous shaking and lower UTI use', () {
    final item = medicine('nitrofurantoin-suspension-25mg5ml');
    final text = [
      item.useProfile.route,
      item.useProfile.foodTiming,
      item.useProfile.formulationHandling,
      item.useProfile.commonMistakes,
      item.useProfile.specialPopulations,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text, contains('25 mg per 5 mL'));
    expect(text.toLowerCase(), contains('with food'));
    expect(text.toLowerCase(), contains('shake vigorously'));
    expect(text.toLowerCase(), contains('pyelonephritis'));
    expect(text.toLowerCase(), contains('protect from strong light'));
    expect(text.toLowerCase(), contains('freezing'));
    expect(text.toLowerCase(), contains('younger than 1 month'));
    expect(text.toLowerCase(), contains('manufacturers differ'));
  });
}
