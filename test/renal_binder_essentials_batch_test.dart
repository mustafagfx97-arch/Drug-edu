import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_families.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  dynamic medicine(String id) =>
      sampleMedications.firstWhere((item) => item.id == id);

  test('renal binder essentials are fully integrated', () {
    expect(sampleMedications.length, greaterThanOrEqualTo(187));
    expect(
      medicationFamilies.any((item) => item.id == 'kidney-electrolytes'),
      isTrue,
    );

    for (final id in <String>[
      'patiromer-veltassa',
      'sodium-zirconium-cyclosilicate-lokelma',
      'sevelamer-carbonate-renvela-tablet',
      'sevelamer-carbonate-renvela-powder',
      'sucroferric-oxyhydroxide-velphoro',
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
        reason: '$id must not be auto-scheduled without interaction review',
      );
    }
  });

  test('VELTASSA locks preparation, spacing and emergency limitation', () {
    final item = medicine('patiromer-veltassa');
    final text = [
      item.useProfile.formulationHandling,
      item.useProfile.interactions,
      item.useProfile.specialPopulations,
      item.sections.map((s) => s.body).join(' '),
      item.patient.storageAr,
    ].join(' ');

    expect(text, contains('1/3 cup'));
    expect(text.toLowerCase(), contains('does not dissolve'));
    expect(text.toLowerCase(), contains('do not take the powder dry'));
    expect(text.toLowerCase(), contains('do not heat'));
    expect(text, contains('3 hours'));
    expect(text.toLowerCase(), contains('not an emergency treatment'));
    expect(text, contains('3 أشهر'));
  });

  test('LOKELMA locks water mixing, 2-hour spacing and sodium risk', () {
    final item = medicine('sodium-zirconium-cyclosilicate-lokelma');
    final text = [
      item.useProfile.formulationHandling,
      item.useProfile.interactions,
      item.useProfile.monitoring,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text.toLowerCase(), contains('3 tablespoons'));
    expect(text.toLowerCase(), contains('drink immediately'));
    expect(text, contains('2 hours'));
    expect(text.toLowerCase(), contains('sodium'));
    expect(text.toLowerCase(), contains('edema'));
    expect(text.toLowerCase(), contains('not emergency'));
  });

  test('RENVELA tablet remains meal-linked with drug-specific spacing', () {
    final item = medicine('sevelamer-carbonate-renvela-tablet');
    final text = [
      item.useProfile.foodTiming,
      item.useProfile.formulationHandling,
      item.useProfile.interactions,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text.toLowerCase(), contains('with meals'));
    expect(text.toLowerCase(), contains('do not improvise crushing'));
    expect(text.toLowerCase(), contains('ciprofloxacin'));
    expect(text, contains('2 hours before or 6 hours after'));
    expect(text.toLowerCase(), contains('mycophenolate'));
  });

  test('RENVELA powder locks packet water volumes and 30-minute use', () {
    final item = medicine('sevelamer-carbonate-renvela-powder');
    final text = [
      item.useProfile.formulationHandling,
      item.sections.map((s) => s.body).join(' '),
      item.patient.howToUseAr,
    ].join(' ');

    expect(text, contains('0.8 g'));
    expect(text, contains('30 mL'));
    expect(text, contains('2.4 g'));
    expect(text, contains('60 mL'));
    expect(text.toLowerCase(), contains('does not dissolve'));
    expect(text, contains('30 minutes'));
    expect(text.toLowerCase(), contains('with meals'));
  });

  test('VELPHORO locks chew/crush, meal timing and levothyroxine spacing', () {
    final item = medicine('sucroferric-oxyhydroxide-velphoro');
    final text = [
      item.useProfile.foodTiming,
      item.useProfile.formulationHandling,
      item.useProfile.interactions,
      item.sections.map((s) => s.body).join(' '),
      item.patient.missedDoseAr,
    ].join(' ');

    expect(text.toLowerCase(), contains('chew or crush'));
    expect(text.toLowerCase(), contains('do not swallow'));
    expect(text.toLowerCase(), contains('with meals'));
    expect(text.toLowerCase(), contains('levothyroxine'));
    expect(text, contains('4 hours'));
    expect(text.toLowerCase(), contains('dark/black stool'));
    expect(text, contains('الوجبة التالية'));
  });
}
