import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';
import 'package:drug_edu/features/visual_guides/data/visual_guide_catalog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  dynamic medicine(String id) =>
      sampleMedications.firstWhere((item) => item.id == id);

  test('second rescue-device batch is fully integrated', () {
    expect(sampleMedications.length, greaterThanOrEqualTo(162));

    for (final id in <String>[
      'nayzilam-midazolam-nasal',
      'valtoco-diazepam-nasal',
      'diastat-acudial-diazepam-rectal',
      'gvoke-hypopen-glucagon',
      'neffy-epinephrine-nasal',
    ]) {
      final item = medicine(id);
      expect(item.sourceLabel.trim(), isNotEmpty, reason: id);
      expect(item.hasVisualGuide, isTrue, reason: '$id visual flag');
      expect(item.patient.howToUseAr.trim(), isNotEmpty, reason: id);

      final english = englishPatientCounseling[id];
      expect(english, isNotNull, reason: '$id English counseling');
      expect(english!.howToUse.trim(), isNotEmpty, reason: id);

      expect(therapyDurationFor(id), isNotNull, reason: '$id duration');
      expect(medicationTimingRules[id], isNotNull, reason: '$id timing');
      expect(medicationTimingRules[id]!.autoScheduleSafe, isFalse, reason: id);

      final guides = visualGuidesForMedication(id);
      expect(guides, hasLength(1), reason: '$id product-specific guide');
    }
  });

  test('NAYZILAM and VALTOCO retain different repeat-dose rules', () {
    final nayzilam = medicine('nayzilam-midazolam-nasal');
    final valtoco = medicine('valtoco-diazepam-nasal');

    expect(nayzilam.useProfile.formulationHandling, contains('opposite nostril'));
    expect(nayzilam.useProfile.formulationHandling, contains('10 minutes'));
    expect(nayzilam.useProfile.monitoring.toLowerCase(), contains('do not give a second dose'));
    expect(nayzilam.useProfile.duration, contains('every 3 days'));

    expect(valtoco.useProfile.formulationHandling, contains('15 mg'));
    expect(valtoco.useProfile.formulationHandling, contains('20 mg'));
    expect(valtoco.useProfile.formulationHandling, contains('one spray in each nostril'));
    expect(valtoco.useProfile.monitoring, contains('at least 4 hours'));
    expect(valtoco.useProfile.duration, contains('every 5 days'));
  });

  test('VALTOCO device-count lock separates one-device and two-device doses', () {
    final item = medicine('valtoco-diazepam-nasal');
    final text = [
      item.useProfile.formulationHandling,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text, contains('5 mg'));
    expect(text, contains('10 mg'));
    expect(text, contains('15 mg'));
    expect(text, contains('20 mg'));
    expect(text.toLowerCase(), contains('two devices'));
    expect(text.toLowerCase(), contains('one spray in each nostril'));
  });

  test('DIASTAT AcuDial locks pharmacist-set dose and count-to-three technique', () {
    final item = medicine('diastat-acudial-diazepam-rectal');
    final text = [
      item.useProfile.formulationHandling,
      item.sections.map((s) => s.body).join(' '),
      item.patient.howToUseAr,
    ].join(' ');

    expect(text, contains('green READY'));
    expect(text.toLowerCase(), contains('pharmacist'));
    expect(text, contains('counting to 3'));
    expect(item.useProfile.monitoring, contains('4 hours'));
    expect(item.useProfile.monitoring, contains('4–12 hours'));
    expect(item.useProfile.specialPopulations.toLowerCase(), contains('must not set or calculate'));
  });

  test('GVOKE HypoPen locks bare skin click five-count and red window', () {
    final item = medicine('gvoke-hypopen-glucagon');
    final text = [
      item.useProfile.formulationHandling,
      item.sections.map((s) => s.body).join(' '),
      item.patient.howToUseAr,
    ].join(' ');

    expect(text.toLowerCase(), contains('bare skin'));
    expect(text.toLowerCase(), contains('click'));
    expect(text, contains('5'));
    expect(text.toLowerCase(), contains('red'));
    expect(item.useProfile.commonMistakes.toLowerCase(), contains('through clothing'));
    expect(item.useProfile.monitoring, contains('15 minutes'));
    expect(item.patient.storageAr, contains('20–25°C'));
  });

  test('neffy locks weight strengths, no sniffing and same-nostril repeat', () {
    final item = medicine('neffy-epinephrine-nasal');
    final text = [
      item.useProfile.formulationHandling,
      item.useProfile.monitoring,
      item.sections.map((s) => s.body).join(' '),
    ].join(' ');

    expect(text.toLowerCase(), contains('do not prime'));
    expect(text.toLowerCase(), contains('do not sniff'));
    expect(text, contains('SAME nostril'));
    expect(text, contains('5 minutes'));
    expect(text, contains('15 to <30 kg'));
    expect(text, contains('≥30 kg'));
  });

  test('product-specific visual guides do not collapse rescue sprays into generic nasal technique', () {
    final nayzilam = visualGuidesForMedication('nayzilam-midazolam-nasal').single;
    final valtoco = visualGuidesForMedication('valtoco-diazepam-nasal').single;
    final neffy = visualGuidesForMedication('neffy-epinephrine-nasal').single;

    expect(nayzilam.id, 'nayzilam-device');
    expect(nayzilam.steps.join(' '), contains('opposite nostril'));
    expect(nayzilam.steps.join(' '), contains('10 minutes'));

    expect(valtoco.id, 'valtoco-device');
    expect(valtoco.steps.join(' '), contains('4 hours'));
    expect(valtoco.steps.join(' '), contains('one spray in each nostril'));

    expect(neffy.id, 'neffy-device');
    expect(neffy.steps.join(' ').toLowerCase(), contains('do not sniff'));
    expect(neffy.steps.join(' '), contains('SAME nostril'));
    expect(neffy.steps.join(' '), contains('5 minutes'));
  });
}
