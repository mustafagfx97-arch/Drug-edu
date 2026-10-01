import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/supplements/nerve_hair/data/nerve_hair_data.dart';
import 'package:drug_edu/features/supplements/nerve_hair/domain/nerve_hair_models.dart';

void main() {
  test('nerve hair toolkit covers requested core dose contexts', () {
    expect(nerveHairProfiles.length, 7);
    expect(
      nerveHairProfiles.map((item) => item.id).toSet(),
      containsAll({
        'biotin',
        'thiamin-benfotiamine',
        'vitamin-b6',
        'vitamin-b12',
        'alpha-lipoic-acid',
        'acetyl-l-carnitine',
        'b-complex',
      }),
    );
  });

  test('biotin separates nutritional cosmetic and pharmacologic doses', () {
    final item = nerveHairProfile('biotin');
    expect(item.uses.length, 4);
    expect(item.uses[0].dose, contains('30 mcg/day'));
    expect(item.uses[1].dose, contains('2.5 mg/day'));
    expect(item.uses[2].dose, contains('5 mg'));
    expect(item.uses[3].dose, contains('300 mg/day'));
    expect(item.uses[3].evidence, NerveHairEvidence.againstRoutineUse);
    expect(item.uses[3].caveat, contains('cannot be recommended'));
  });

  test('biotin retains lab interference lock', () {
    final safety = nerveHairProfile('biotin').safety.join(' ');
    expect(safety, contains('troponin'));
    expect(safety, contains('10 mg'));
    expect(safety, contains('no UL'));
  });

  test('thiamin nutrition is separated from benfotiamine neuropathy dose', () {
    final item = nerveHairProfile('thiamin-benfotiamine');
    expect(item.uses[0].dose, contains('1.2 mg/day'));
    expect(item.uses[0].dose, contains('1.5 mg'));
    expect(item.uses[1].dose, contains('600 mg/day'));
    expect(item.uses[1].caveat, contains('no significant benefit'));
  });

  test('B6 routine nutrition avoids chronic B50 B100 dosing', () {
    final item = nerveHairProfile('vitamin-b6');
    expect(item.uses[0].dose, contains('1.3 mg/day'));
    expect(item.uses[1].dose, contains('50–100 mg/day'));
    expect(item.uses[1].caveat, contains('12 mg/day'));
    expect(item.safety.join(' '), contains('numbness'));
  });

  test('B12 exposes common supplement ranges without calling them requirements', () {
    final item = nerveHairProfile('vitamin-b12');
    expect(item.uses[0].dose, contains('2.4 mcg/day'));
    expect(item.uses[1].dose, contains('5–25 mcg'));
    expect(item.uses[1].dose, contains('500–1,000 mcg'));
    expect(item.uses[1].caveat, contains('not automatically more useful'));
  });

  test('ALA keeps 600 mg neuropathy adjunct dose and evidence boundary', () {
    final use = nerveHairProfile('alpha-lipoic-acid').uses.single;
    expect(use.dose, contains('600 mg/day'));
    expect(use.evidence, NerveHairEvidence.limited);
    expect(use.caveat, contains('nerve-conduction'));
  });

  test('ALC keeps trial range and low-certainty conflict', () {
    final use = nerveHairProfile('acetyl-l-carnitine').uses.single;
    expect(use.dose, contains('1,500–3,000 mg/day'));
    expect(use.duration, contains('24 weeks'));
    expect(use.evidence, NerveHairEvidence.conflicting);
    expect(use.caveat, contains('Cochrane'));
  });

  test('B complex profile identifies B6 and biotin as key traps', () {
    final item = nerveHairProfile('b-complex');
    expect(item.uses.single.dose, contains('50–100 mg'));
    expect(item.uses.single.caveat, contains('High-dose B6'));
    expect(item.safety.join(' '), contains('duplication'));
  });
}
