import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/supplements/data/supplement_profiles.dart';

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
}
