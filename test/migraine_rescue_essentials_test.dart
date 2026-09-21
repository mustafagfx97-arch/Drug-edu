import 'package:drug_edu/core/data/medication_indication_options.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';
import 'package:drug_edu/features/visual_guides/data/visual_guide_catalog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  dynamic medicine(String id) =>
      sampleMedications.firstWhere((item) => item.id == id);

  test('migraine rescue essentials batch is fully integrated', () {
    expect(sampleMedications.length, greaterThanOrEqualTo(172));

    for (final id in <String>[
      'sumatriptan-tablets',
      'rizatriptan-odt',
      'rimegepant-nurtec-odt',
      'ubrogepant-ubrelvy',
      'zavegepant-zavzpret-nasal',
    ]) {
      final item = medicine(id);
      expect(item.sourceLabel.trim(), isNotEmpty, reason: id);
      expect(item.patient.howToUseAr.trim(), isNotEmpty, reason: id);

      final english = englishPatientCounseling[id];
      expect(english, isNotNull, reason: '$id English counseling');
      expect(english!.howToUse.trim(), isNotEmpty, reason: id);

      expect(therapyDurationFor(id), isNotNull, reason: '$id duration');
      expect(medicationTimingRules[id], isNotNull, reason: '$id timing');
      expect(medicationTimingRules[id]!.autoScheduleSafe, isFalse, reason: id);
    }

    expect(visualGuidesForMedication('rizatriptan-odt'), hasLength(1));
    expect(visualGuidesForMedication('rimegepant-nurtec-odt'), hasLength(1));
    expect(visualGuidesForMedication('zavegepant-zavzpret-nasal'), hasLength(1));
  });

  test('sumatriptan keeps two-hour repeat, 200 mg daily ceiling and triptan lock', () {
    final item = medicine('sumatriptan-tablets');
    final text = [
      item.useProfile.formulationHandling,
      item.useProfile.interactions,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text, contains('2 hours'));
    expect(text, contains('200 mg'));
    expect(text, contains('24 hours'));
    expect(text.toLowerCase(), contains('another triptan'));
    expect(text.toLowerCase(), contains('ergot'));
    expect(text.toLowerCase(), contains('mao-a'));
  });

  test('rizatriptan ODT separates adult repeat from pediatric no-repeat evidence', () {
    final item = medicine('rizatriptan-odt');
    final text = [
      item.useProfile.formulationHandling,
      item.useProfile.interactions,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text, contains('2 hours'));
    expect(text, contains('30 mg'));
    expect(text, contains('6 to 17 years'));
    expect(text.toLowerCase(), contains('not established'));
    expect(text.toLowerCase(), contains('propranolol'));
    expect(item.patient.howToUseAr, contains('لا تحتاج ماء'));
  });

  test('NURTEC exposes acute versus preventive indication selection', () {
    final options = indicationOptionsFor('rimegepant-nurtec-odt');
    expect(options.map((o) => o.id).toSet(), {
      'acute-migraine',
      'episodic-migraine-prevention',
    });

    final acute = indicationOptionFor('rimegepant-nurtec-odt', 'acute-migraine')!;
    final prevention = indicationOptionFor(
      'rimegepant-nurtec-odt',
      'episodic-migraine-prevention',
    )!;

    expect(acute.timingEn, contains('75 mg'));
    expect(acute.timingEn, contains('24 hours'));
    expect(prevention.timingEn, contains('every other day'));

    final item = medicine('rimegepant-nurtec-odt');
    expect(item.useProfile.formulationHandling.toLowerCase(),
        contains('do not push the odt through the foil'));
    expect(item.useProfile.interactions, contains('48 hours'));
    expect(item.useProfile.specialPopulations, contains('18 doses'));
  });

  test('UBRELVY locks repeat interval, daily ceiling and interaction-dependent redose', () {
    final item = medicine('ubrogepant-ubrelvy');
    final text = [
      item.useProfile.formulationHandling,
      item.useProfile.interactions,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text, contains('2 hours'));
    expect(text, contains('200 mg'));
    expect(text.toLowerCase(), contains('strong cyp3a4 inhibitors'));
    expect(text.toLowerCase(), contains('second dose'));
    expect(item.useProfile.duration, contains('8 migraines'));
  });

  test('ZAVZPRET stays single-use one-nostril one-dose with decongestant spacing', () {
    final item = medicine('zavegepant-zavzpret-nasal');
    final text = [
      item.useProfile.formulationHandling,
      item.useProfile.interactions,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text.toLowerCase(), contains('do not test or prime'));
    expect(text, contains('one nostril'));
    expect(text, contains('10–20 seconds'));
    expect(text, contains('one dose in 24 hours'));
    expect(text, contains('1 hour after'));
    expect(item.patient.storageAr, contains('20–25°C'));
  });

  test('migraine visual guides preserve ODT and nasal product technique', () {
    final rizatriptan = visualGuidesForMedication('rizatriptan-odt').single;
    final nurtec = visualGuidesForMedication('rimegepant-nurtec-odt').single;
    final zavzpret =
        visualGuidesForMedication('zavegepant-zavzpret-nasal').single;

    expect(rizatriptan.id, 'rizatriptan-odt');
    expect(rizatriptan.steps.join(' ').toLowerCase(), contains('dry hands'));
    expect(rizatriptan.steps.join(' ').toLowerCase(), contains('no liquid'));

    expect(nurtec.id, 'nurtec-odt');
    expect(nurtec.steps.join(' ').toLowerCase(), contains('do not push'));
    expect(nurtec.steps.join(' ').toLowerCase(), contains('under the tongue'));

    expect(zavzpret.id, 'zavzpret-device');
    expect(zavzpret.steps.join(' ').toLowerCase(), contains('do not test'));
    expect(zavzpret.steps.join(' '), contains('10–20 seconds'));
  });
}
