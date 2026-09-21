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

  test('calcium salts remain separate profiles', () {
    final carbonate = supplementProfiles.firstWhere(
      (profile) => profile.id == 'calcium-carbonate',
    );
    final citrate = supplementProfiles.firstWhere(
      (profile) => profile.id == 'calcium-citrate',
    );

    expect(carbonate.howToTakeEn.toLowerCase(), contains('with food'));
    expect(citrate.howToTakeEn.toLowerCase(), contains('with or without food'));
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

    final magnesiumOxide = supplementProfiles.firstWhere(
      (profile) => profile.id == 'magnesium-oxide',
    );
    final magnesiumCitrate = supplementProfiles.firstWhere(
      (profile) => profile.id == 'magnesium-citrate',
    );
    expect(magnesiumOxide.formulationAlert, contains('less bioavailable'));
    expect(magnesiumCitrate.formulationAlert, contains('elemental magnesium'));

    final omega3 = supplementProfiles.firstWhere(
      (profile) => profile.id == 'omega-3',
    );
    expect(omega3.formulationAlert, contains('EPA+DHA'));
  });

}
