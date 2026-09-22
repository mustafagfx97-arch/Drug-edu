import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  dynamic medicine(String id) =>
      sampleMedications.firstWhere((item) => item.id == id);

  test('oral potassium and phosphate safety batch is fully integrated', () {
    expect(sampleMedications.length, greaterThanOrEqualTo(197));

    for (final id in <String>[
      'potassium-chloride-klor-con-m',
      'potassium-chloride-er-capsule-sprinkle',
      'potassium-chloride-oral-solution',
      'calcium-acetate-667mg-capsule',
      'lanthanum-carbonate-fosrenol-chewable',
    ]) {
      final item = medicine(id);
      expect(item.familyId, 'kidney-electrolytes', reason: id);
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
        reason: '$id requires product/regimen review',
      );
    }
  });

  test('KLOR-CON M locks meal use and exact water-dispersion method', () {
    final item = medicine('potassium-chloride-klor-con-m');
    final text = [
      item.useProfile.foodTiming,
      item.useProfile.formulationHandling,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text.toLowerCase(), contains('with meals'));
    expect(text.toLowerCase(), contains('do not crush'));
    expect(text.toLowerCase(), contains('4 fl oz'));
    expect(text.toLowerCase(), contains('2 minutes'));
    expect(text.toLowerCase(), contains('30 seconds'));
    expect(text.toLowerCase(), contains('1 fl oz'));
    expect(text.toLowerCase(), contains('water only'));
    expect(text.toLowerCase(), contains('discard'));
  });

  test('potassium ER capsule locks sprinkle without chewing or heat', () {
    final item = medicine('potassium-chloride-er-capsule-sprinkle');
    final text = [
      item.useProfile.foodTiming,
      item.useProfile.formulationHandling,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text.toLowerCase(), contains('with meals'));
    expect(text.toLowerCase(), contains('applesauce'));
    expect(text.toLowerCase(), contains('pudding'));
    expect(text.toLowerCase(), contains('without chewing'));
    expect(text.toLowerCase(), contains('do not add to hot food'));
    expect(text.toLowerCase(), contains('do not store'));
  });

  test('potassium oral solution locks dilution and concentration', () {
    final item = medicine('potassium-chloride-oral-solution');
    final text = [
      item.useProfile.route,
      item.useProfile.foodTiming,
      item.useProfile.formulationHandling,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text, contains('20 mEq/15 mL'));
    expect(text, contains('40 mEq/15 mL'));
    expect(text.toLowerCase(), contains('at least 4 ounces of cold water'));
    expect(text.toLowerCase(), contains('never give'));
    expect(text.toLowerCase(), contains('undiluted'));
    expect(text.toLowerCase(), contains('with meals or immediately after'));
  });

  test('calcium acetate remains meal-linked with calcium and spacing locks', () {
    final item = medicine('calcium-acetate-667mg-capsule');
    final text = [
      item.useProfile.foodTiming,
      item.useProfile.formulationHandling,
      item.useProfile.monitoring,
      item.useProfile.interactions,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text.toLowerCase(), contains('with each meal'));
    expect(text.toLowerCase(), contains('calcium supplements'));
    expect(text.toLowerCase(), contains('hypercalcemia'));
    expect(text.toLowerCase(), contains('tetracyclines'));
    expect(text.toLowerCase(), contains('fluoroquinolones'));
    expect(text.toLowerCase(), contains('1 hour before or 3 hours after'));
  });

  test('FOSRENOL chewable locks complete chewing and exact interactions', () {
    final item = medicine('lanthanum-carbonate-fosrenol-chewable');
    final text = [
      item.useProfile.foodTiming,
      item.useProfile.formulationHandling,
      item.useProfile.interactions,
      item.useProfile.specialPopulations,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text.toLowerCase(), contains('with or immediately after meals'));
    expect(text.toLowerCase(), contains('chew the tablet completely'));
    expect(text.toLowerCase(), contains('never swallow'));
    expect(text.toLowerCase(), contains('1 hour before or 4 hours after'));
    expect(text.toLowerCase(), contains('2 hours before or 2 hours after'));
    expect(text.toLowerCase(), contains('oral powder'));
    expect(text.toLowerCase(), contains('bowel obstruction'));
  });
}
