import 'package:drug_edu/core/data/medication_indication_options.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  dynamic medicine(String id) =>
      sampleMedications.firstWhere((item) => item.id == id);

  test('antiplatelet essentials batch is fully integrated', () {
    expect(sampleMedications.length, greaterThanOrEqualTo(177));

    for (final id in <String>[
      'aspirin-81-antiplatelet-dr',
      'ticagrelor-brilinta',
      'prasugrel',
      'aspirin-er-dipyridamole',
      'cilostazol',
    ]) {
      final item = medicine(id);
      expect(item.sourceLabel.trim(), isNotEmpty, reason: id);
      expect(item.patient.howToUseAr.trim(), isNotEmpty, reason: id);

      final english = englishPatientCounseling[id];
      expect(english, isNotNull, reason: '$id English counseling');
      expect(english!.howToUse.trim(), isNotEmpty, reason: id);
      expect(english.missedDose.trim(), isNotEmpty, reason: id);

      expect(therapyDurationFor(id), isNotNull, reason: '$id duration');
      expect(medicationTimingRules[id], isNotNull, reason: '$id timing');
    }
  });

  test('aspirin 81 mg entry remains clinician-directed and delayed-release specific', () {
    final item = medicine('aspirin-81-antiplatelet-dr');
    final text = [
      item.useProfile.duration,
      item.useProfile.formulationHandling,
      item.useProfile.commonMistakes,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text.toLowerCase(), contains('do not self-start'));
    expect(text.toLowerCase(), contains('delayed-release'));
    expect(text.toLowerCase(), contains('immediate'));
    expect(text.toLowerCase(), contains('bleeding'));
    expect(item.patient.importantAr, contains('لا تبدأ'));
  });

  test('ticagrelor keeps indication selector, aspirin ceiling and missed-dose lock', () {
    final options = indicationOptionsFor('ticagrelor-brilinta');
    expect(options.map((o) => o.id).toSet(), {
      'acs-or-history-mi',
      'cad-no-prior-mi-stroke',
      'acute-ischemic-stroke-tia',
    });

    final acs = indicationOptionFor(
      'ticagrelor-brilinta',
      'acs-or-history-mi',
    )!;
    final cad = indicationOptionFor(
      'ticagrelor-brilinta',
      'cad-no-prior-mi-stroke',
    )!;
    final stroke = indicationOptionFor(
      'ticagrelor-brilinta',
      'acute-ischemic-stroke-tia',
    )!;

    expect(acs.timingEn, contains('90 mg twice daily'));
    expect(acs.timingEn, contains('60 mg twice daily'));
    expect(cad.timingEn, contains('60 mg twice daily'));
    expect(stroke.timingEn, contains('90 mg twice daily'));
    expect(stroke.timingEn, contains('30 days'));

    final item = medicine('ticagrelor-brilinta');
    final text = [
      item.useProfile.formulationHandling,
      item.sections.map((s) => s.body).join(' '),
      item.patient.missedDoseAr,
    ].join(' ');

    expect(text, contains('75–100 mg'));
    expect(text, contains('5 days'));
    expect(text.toLowerCase(), contains('crushed'));
    expect(text.toLowerCase(), contains('nasogastric'));
    expect(item.patient.missedDoseAr, contains('تجاوزها'));
  });

  test('prasugrel locks prior TIA/stroke, age and surgery warnings', () {
    final item = medicine('prasugrel');
    final text = [
      item.useProfile.specialPopulations,
      item.sections.map((s) => s.body).join(' '),
      item.patient.importantAr,
    ].join(' ');

    expect(text, contains('TIA'));
    expect(text.toLowerCase(), contains('stroke'));
    expect(text, contains('75'));
    expect(text, contains('60 kg'));
    expect(text, contains('7 days'));
    expect(item.useProfile.formulationHandling.toLowerCase(),
        contains('do not split'));
  });

  test('aspirin ER dipyridamole preserves fixed combination technique', () {
    final item = medicine('aspirin-er-dipyridamole');
    final text = [
      item.useProfile.route,
      item.useProfile.foodTiming,
      item.useProfile.formulationHandling,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text, contains('25 mg'));
    expect(text, contains('200 mg'));
    expect(text.toLowerCase(), contains('twice daily'));
    expect(text.toLowerCase(), contains('swallow'));
    expect(text.toLowerCase(), contains('do not crush'));
    expect(text.toLowerCase(), contains('not interchangeable'));
    expect(item.patient.missedDoseAr, contains('لا تأخذ جرعتين'));
    expect(item.patient.storageAr, contains('15–30°C'));
  });

  test('cilostazol locks heart failure, food interval and three-month reassessment', () {
    final item = medicine('cilostazol');
    final text = [
      item.useProfile.foodTiming,
      item.useProfile.duration,
      item.useProfile.specialPopulations,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text.toLowerCase(), contains('heart failure'));
    expect(text, contains('30 minutes'));
    expect(text, contains('2 hours'));
    expect(text, contains('2–4 weeks'));
    expect(text, contains('12 weeks'));
    expect(text, contains('3 months'));
    expect(item.patient.importantAr, contains('heart failure'));
  });
}
