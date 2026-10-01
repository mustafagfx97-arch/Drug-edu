import 'package:drug_edu/features/supplements/expanded_catalog/data/expanded_catalog_data.dart';
import 'package:drug_edu/features/supplements/expanded_catalog/domain/expanded_supplement_models.dart';
import 'package:drug_edu/features/supplements/library/data/supplement_library_catalog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('expanded weak encyclopedia sections are now deep catalogs', () {
    expect(
      expandedProfilesFor(ExpandedSupplementSection.general).length,
      greaterThanOrEqualTo(9),
    );
    expect(
      expandedProfilesFor(ExpandedSupplementSection.pediatric).length,
      greaterThanOrEqualTo(10),
    );
    expect(
      expandedProfilesFor(ExpandedSupplementSection.combinations).length,
      greaterThanOrEqualTo(10),
    );
    expect(
      expandedProfilesFor(ExpandedSupplementSection.sportsGrowth).length,
      greaterThanOrEqualTo(20),
    );
    expect(
      expandedProfilesFor(ExpandedSupplementSection.safety).length,
      greaterThanOrEqualTo(15),
    );

    expect(
      expandedSupplementProfiles.map((item) => item.id).toSet().length,
      expandedSupplementProfiles.length,
    );

    for (final profile in expandedSupplementProfiles) {
      expect(profile.sourceLabel.trim(), isNotEmpty, reason: profile.name);
      expect(profile.dosePathways, isNotEmpty, reason: profile.name);
      expect(profile.coreRule.trim(), isNotEmpty, reason: profile.name);
    }
  });

  test('unified encyclopedia uses expanded catalogs instead of shallow legacy groups', () {
    expect(
      supplementLibraryEntriesFor('general').length,
      greaterThanOrEqualTo(9),
    );
    expect(
      supplementLibraryEntriesFor('pediatric').length,
      greaterThanOrEqualTo(10),
    );
    expect(
      supplementLibraryEntriesFor('combinations').length,
      greaterThanOrEqualTo(10),
    );
    expect(
      supplementLibraryEntriesFor('sports-growth').length,
      greaterThanOrEqualTo(20),
    );
    expect(
      supplementLibraryEntriesFor('safety').length,
      greaterThanOrEqualTo(15),
    );

    for (final query in [
      'psyllium',
      'cranberry',
      'D-Mannose',
      'preterm iron',
      'acute diarrhea',
      'fluoride',
      'oral nutrition',
      'AREDS2',
      'bariatric',
      'beta-alanine',
      'beetroot',
      'sodium bicarbonate',
      'electrolyte',
      'BCAA',
      'HMB',
      'citrulline',
      'mass gainer',
      'SARMs',
      'DMAA',
      'DMHA',
      'yohimbe',
      'red yeast rice',
      'colloidal silver',
      'tianeptine',
      'phenibut',
    ]) {
      expect(
        searchSupplementLibrary(query),
        isNotEmpty,
        reason: query,
      );
    }
  });

  test('creatine evidence-based performance dose remains exact', () {
    final item = expandedSupplementProfile('sport-creatine');
    final text = item.dosePathways
        .map((dose) => [dose.title, dose.dose, dose.duration].join(' '))
        .join(' ');
    expect(text, contains('0.3 g/kg/day'));
    expect(text, contains('20 g/day'));
    expect(text, contains('3–5 g/day'));
    expect(item.coreRule, contains('monohydrate'));
    expect(item.evidence, ExpandedEvidence.strong);
  });

  test('beta alanine nitrate and bicarbonate protocols remain distinct', () {
    final beta = expandedSupplementProfile('sport-beta-alanine');
    expect(
      beta.dosePathways.map((item) => item.dose).join(' '),
      contains('3.2–6.4 g/day'),
    );
    expect(beta.coreRule, contains('over weeks'));

    final nitrate = expandedSupplementProfile('sport-nitrate');
    final nitrateDose = nitrate.dosePathways.single;
    expect(nitrateDose.dose, contains('350–500 mg'));
    expect(nitrateDose.timing, contains('2–3 hours'));
    expect(nitrate.administration.join(' '), contains('mouthwash'));

    final bicarbonate = expandedSupplementProfile('sport-bicarbonate');
    final bicarbonateDose = bicarbonate.dosePathways.single;
    expect(bicarbonateDose.dose, contains('200–300 mg/kg'));
    expect(bicarbonateDose.timing, contains('2–3 hours'));
    expect(bicarbonate.commonActionable.join(' '), contains('diarrhea'));
  });

  test('protein targets and BCAA evidence are not conflated', () {
    final protein = expandedSupplementProfile('sport-protein');
    final proteinDose =
        protein.dosePathways.map((item) => item.dose).join(' ');
    expect(proteinDose, contains('1.2–1.6 g/kg/day'));
    expect(proteinDose, contains('0.3 g/kg'));
    expect(proteinDose, contains('1.6–2.4 g/kg/day'));

    final bcaa = expandedSupplementProfile('sport-bcaa');
    expect(bcaa.evidence, ExpandedEvidence.limited);
    expect(bcaa.coreRule, contains('unnecessary'));
    expect(
      bcaa.dosePathways.first.dose,
      contains('No established routine BCAA dose'),
    );
  });

  test('pediatric prevention doses remain indication and age specific', () {
    final vitaminD = expandedSupplementProfile('peds-vitamin-d-infant');
    expect(vitaminD.dosePathways.first.dose, contains('400 IU'));

    final termIron = expandedSupplementProfile('peds-iron-breastfed');
    expect(termIron.dosePathways.single.dose, contains('1 mg/kg/day'));

    final pretermIron = expandedSupplementProfile('peds-iron-preterm');
    expect(pretermIron.dosePathways.single.dose, contains('2–3 mg/kg/day'));

    final zinc = expandedSupplementProfile('peds-zinc-diarrhea');
    final zincDoses = zinc.dosePathways.map((item) => item.dose).join(' ');
    expect(zincDoses, contains('10 mg'));
    expect(zincDoses, contains('20 mg'));
    expect(zinc.dosePathways.map((item) => item.duration).join(' '),
        contains('10–14 days'));
  });

  test('pediatric growth products cannot become height-booster prescriptions', () {
    final growth = expandedSupplementProfile('sport-growth-amino');
    final doseText =
        growth.dosePathways.map((item) => item.dose).join(' ');
    expect(doseText, contains('No established height-increasing supplemental dose'));
    expect(growth.evidence, ExpandedEvidence.notRecommended);
    expect(growth.monitoring.join(' '), contains('Height velocity'));

    final nutrition = expandedSupplementProfile('peds-oral-nutrition');
    expect(nutrition.coreRule, contains('not proven “height growth”'));
    expect(nutrition.dosePathways.single.dose, contains('25–50%'));
  });

  test('AREDS2 exact formula stays disease specific', () {
    final areds = expandedSupplementProfile('combo-areds2');
    final dose = areds.dosePathways.single.dose;
    expect(dose, contains('Vitamin C 500 mg'));
    expect(dose, contains('vitamin E 400 IU'));
    expect(dose, contains('zinc 80 mg'));
    expect(dose, contains('copper 2 mg'));
    expect(dose, contains('lutein 10 mg'));
    expect(dose, contains('zeaxanthin 2 mg'));
    expect(areds.labelChecks.join(' '), contains('NO beta-carotene'));
  });

  test('prenatal audit retains folic acid iron iodine and choline checks', () {
    final prenatal = expandedSupplementProfile('combo-prenatal');
    final doseText =
        prenatal.dosePathways.map((item) => item.dose).join(' ');
    expect(doseText, contains('400–800 mcg/day'));
    expect(doseText, contains('27 mg/day'));
    expect(doseText, contains('150 mcg iodine/day'));
    expect(prenatal.labelChecks.join(' '), contains('Choline'));
  });

  test('no-routine-dose language is explicit across uncertain contexts', () {
    final text = expandedSupplementProfiles
        .expand((item) => item.dosePathways)
        .map((item) => item.dose)
        .join(' ');
    expect(text, contains('No established routine supplemental dose'));
    expect(text, contains('No established routine performance dose'));
    expect(text, contains('No acceptable routine supplement dose'));
  });

  test('high-risk catalog never supplies an operational abuse dose', () {
    for (final id in [
      'safety-dmaa',
      'safety-dmha',
      'safety-dmba',
      'safety-ephedra',
      'safety-sarms',
      'safety-pure-caffeine',
      'safety-7oh',
      'safety-tianeptine',
      'safety-phenibut',
    ]) {
      final item = expandedSupplementProfile(id);
      expect(
        {ExpandedEvidence.avoid, ExpandedEvidence.regulatoryWarning}
            .contains(item.evidence),
        isTrue,
        reason: item.name,
      );
      expect(
        item.dosePathways
            .map((dose) => dose.dose.toLowerCase())
            .join(' '),
        anyOf(contains('no acceptable'), contains('do not use')),
        reason: item.name,
      );
    }
  });

  test('competitive-sport risk remains explicit for SARMs and DHEA', () {
    final sarms = expandedSupplementProfile('safety-sarms');
    expect(sarms.sourceLabel, contains('WADA 2026'));
    expect(sarms.dosePathways.single.note, contains('prohibited'));

    final dhea = expandedSupplementProfile('safety-dhea-sport');
    expect(dhea.sourceLabel, contains('WADA 2026'));
    expect(dhea.coreRule, contains('anti-doping'));
  });
}
