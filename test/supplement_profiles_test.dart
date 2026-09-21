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

  test('expanded supplement library keeps salt and safety distinctions', () {
    expect(supplementProfiles.length, greaterThanOrEqualTo(29));

    final ids = supplementProfiles.map((profile) => profile.id).toList();
    expect(ids.toSet().length, ids.length);

    final magnesiumOxide =
        supplementProfiles.firstWhere((p) => p.id == 'magnesium-oxide');
    final magnesiumCitrate =
        supplementProfiles.firstWhere((p) => p.id == 'magnesium-citrate');
    expect(magnesiumOxide.formulationAlert.toLowerCase(), contains('less bioavailable'));
    expect(magnesiumCitrate.formulationAlert.toLowerCase(), contains('more bioavailable'));
    expect(magnesiumCitrate.formulationAlert.toLowerCase(), contains('laxative'));

    final d2 = supplementProfiles.firstWhere((p) => p.id == 'vitamin-d2');
    expect(d2.formulationAlert, contains('D3'));
    expect(d2.patient.timingAr, contains('أسبوعية'));

    final biotin = supplementProfiles.firstWhere((p) => p.id == 'biotin');
    expect(biotin.patient.importantAr, contains('تحاليل'));
    expect(
      biotin.pharmacistSections.any(
        (section) => section.body.toLowerCase().contains('troponin'),
      ),
      isTrue,
    );

    final b6 = supplementProfiles.firstWhere((p) => p.id == 'vitamin-b6');
    expect(b6.patient.commonActionableAr, contains('تنميل'));

    final potassium =
        supplementProfiles.firstWhere((p) => p.id == 'potassium-supplement');
    expect(potassium.patient.importantAr, contains('salt substitute'));
    expect(potassium.monitoringEn.toLowerCase(), contains('renal'));

    final omega3 =
        supplementProfiles.firstWhere((p) => p.id == 'omega-3-epa-dha');
    expect(omega3.patient.howToUseAr, contains('EPA + DHA'));
    expect(omega3.monitoringEn.toLowerCase(), contains('warfarin'));

    final creatine =
        supplementProfiles.firstWhere((p) => p.id == 'creatine-monohydrate');
    expect(creatine.howToTakeEn, contains('3–5 g'));
    expect(creatine.patient.commonActionableAr, contains('1–2 kg'));
  });

}
