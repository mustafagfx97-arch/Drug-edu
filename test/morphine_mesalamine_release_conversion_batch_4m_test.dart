import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/medication_patient_guidance_en.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/core/data/therapy_duration_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';

void main() {
  group('Morphine and mesalamine release conversion batch 4M', () {
    const ids = <String>[
      'morphine-sulfate-er-tablets',
      'mesalamine-lialda',
      'mesalamine-apriso',
      'mesalamine-pentasa',
    ];

    test('keeps IDs unique, adds one high-value record, and raises census to 410', () {
      final allIds = sampleMedications.map((m) => m.id).toList();
      expect(sampleMedications.length, 410);
      expect(allIds.toSet().length, 410);
      expect(
        allIds.where((id) => id == 'morphine-sulfate-er-tablets').length,
        1,
      );

      for (final id in ids) {
        expect(allIds, contains(id), reason: id);
        expect(medicationTimingRules[id], isNotNull, reason: 'timing $id');
        expect(medicationTimingRules[id]!.autoScheduleSafe, isFalse,
            reason: 'auto schedule $id');
        expect(therapyDurationFor(id), isNotNull, reason: 'duration $id');
        expect(englishPatientCounselingFor(id), isNotNull,
            reason: 'English counseling $id');

        final m = sampleMedications.firstWhere((m) => m.id == id);
        expect(m.useProfile.releaseConversion.trim(), isNotEmpty,
            reason: 'conversion $id');
        expect(
          m.useProfile.facts.any(
            (fact) =>
                fact.title == 'IR / XR-ER conversion' &&
                fact.value.trim().isNotEmpty,
          ),
          isTrue,
          reason: 'displayed conversion fact $id',
        );
      }
    });

    test('oral morphine to morphine ER uses same daily total redistributed q12h or q8h', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'morphine-sulfate-er-tablets');

      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('same total 24-hour oral morphine requirement'),
          contains('one-half every 12 hours'),
          contains('one-third every 8 hours'),
          contains('60 mg/day'),
          contains('30 mg every 12 hours'),
          contains('20 mg every 8 hours'),
        ),
      );
      expect(
        m.useProfile.formulationHandling.toLowerCase(),
        allOf(
          contains('do not cut'),
          contains('chew'),
          contains('crush'),
          contains('dissolve'),
          contains('fatal'),
        ),
      );
      expect(
        m.patient.missedDoseAr,
        contains('وقتها المعتاد'),
      );
    });

    test('cross-opioid conversion is not auto-calculated and high doses require tolerance', () {
      final m = sampleMedications
          .firstWhere((m) => m.id == 'morphine-sulfate-er-tablets');

      expect(
        m.useProfile.releaseConversion,
        allOf(
          contains('CROSS-OPIOID'),
          contains('no labeled clinical-trial conversion ratio'),
          contains('do not auto-convert'),
          contains('15 mg every 8 to 12 hours'),
        ),
      );
      expect(
        m.useProfile.specialPopulations,
        allOf(
          contains('100 mg and 200 mg'),
          contains('greater than 60 mg'),
          contains('greater than 120 mg/day'),
          contains('established tolerance'),
        ),
      );
      expect(
        m.useProfile.commonMistakes,
        contains('automatic cross-opioid conversion'),
      );
    });

    test('mesalamine oral products explicitly block direct mg-for-mg auto-conversion', () {
      for (final id in const [
        'mesalamine-lialda',
        'mesalamine-apriso',
        'mesalamine-pentasa',
      ]) {
        final m = sampleMedications.firstWhere((m) => m.id == id);
        expect(
          m.useProfile.releaseConversion,
          allOf(
            contains('No labeled direct conversion'),
            contains('do not auto-convert'),
          ),
          reason: id,
        );
      }

      final lialda =
          sampleMedications.firstWhere((m) => m.id == 'mesalamine-lialda');
      final apriso =
          sampleMedications.firstWhere((m) => m.id == 'mesalamine-apriso');
      final pentasa =
          sampleMedications.firstWhere((m) => m.id == 'mesalamine-pentasa');

      expect(lialda.useProfile.foodTiming, contains('with food'));
      expect(apriso.useProfile.foodTiming, contains('morning'));
      expect(apriso.useProfile.formulationHandling, contains('Do not cut'));
      expect(pentasa.useProfile.formulationHandling,
          allOf(contains('applesauce'), contains('yogurt'), contains('Do not crush')));
    });
  });
}
