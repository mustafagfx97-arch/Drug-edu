import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/supplements/data/supplement_profiles.dart';
import 'package:drug_edu/features/supplements/data/supplement_decision_guidance.dart';

void main() {
  test('vitamin D3 includes practical food administration guidance', () {
    final d3 = supplementProfiles.firstWhere(
      (profile) => profile.id == 'vitamin-d3',
    );

    expect(d3.howToTakeEn.toLowerCase(), contains('meal'));
    expect(d3.howToTakeEn.toLowerCase(), contains('fat'));
    expect(d3.patient.howToUseAr, contains('وجبة'));
  });

  test('calcium salts are consolidated inside one elemental-calcium profile', () {
    final calcium = supplementProfiles.firstWhere(
      (profile) => profile.id == 'calcium',
    );
    final carbonate =
        calcium.saltVariants.firstWhere((item) => item.id == 'carbonate');
    final citrate =
        calcium.saltVariants.firstWhere((item) => item.id == 'citrate');

    expect(carbonate.administration.toLowerCase(), contains('with food'));
    expect(
      citrate.administration.toLowerCase(),
      contains('with or without food'),
    );
  });
  test('supplement expansion stays complete and source locked', () {
    expect(supplementProfiles.length, greaterThanOrEqualTo(26));

    final ids = supplementProfiles.map((profile) => profile.id).toList();
    expect(ids.toSet().length, ids.length);

    for (final profile in supplementProfiles) {
      expect(profile.sourceLabel.trim(), isNotEmpty, reason: profile.name);
      expect(profile.howToTakeEn.trim(), isNotEmpty, reason: profile.name);
      expect(profile.patient.howToUseAr.trim(), isNotEmpty, reason: profile.name);
      expect(
        supplementDecisionFor(profile.id),
        isNotNull,
        reason: profile.name + ' missing decision guidance',
      );
    }

    final potassium = supplementProfiles.firstWhere(
      (profile) => profile.id == 'potassium-supplements',
    );
    expect(potassium.monitoringEn, contains('Serum potassium'));
    expect(potassium.patient.importantAr, contains('spironolactone'));

    final biotin = supplementProfiles.firstWhere(
      (profile) => profile.id == 'biotin',
    );
    expect(biotin.sourceLabel, contains('FDA'));
    expect(biotin.patient.importantAr, contains('نتائج خاطئة'));
    expect(
      supplementDecisionFor('biotin')!.safetyLock,
      contains('universal'),
    );

    final b6 = supplementProfiles.firstWhere(
      (profile) => profile.id == 'vitamin-b6',
    );
    expect(b6.patient.importantAr, contains('أعصاب'));
    expect(supplementDecisionFor('vitamin-b6')!.safetyLock, contains('100 mg'));

    final magnesium = supplementProfiles.firstWhere(
      (profile) => profile.id == 'magnesium',
    );
    final magnesiumOxide =
        magnesium.saltVariants.firstWhere((item) => item.id == 'oxide');
    final magnesiumCitrate =
        magnesium.saltVariants.firstWhere((item) => item.id == 'citrate');
    expect(
      magnesiumOxide.practicalUse.toLowerCase(),
      contains('less bioavailable'),
    );
    expect(
      magnesiumCitrate.elementalAmount.toLowerCase(),
      contains('elemental magnesium'),
    );

    final omega3 = supplementProfiles.firstWhere(
      (profile) => profile.id == 'omega-3',
    );
    expect(omega3.formulationAlert, contains('EPA+DHA'));
  });

}
