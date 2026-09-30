import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/supplements/vitamins/data/vitamin_toolkit_data.dart';
import 'package:drug_edu/features/supplements/vitamins/domain/vitamin_toolkit_models.dart';

void main() {
  test('vitamin toolkit covers all core A B-complex C D E K categories', () {
    expect(vitaminToolkitEntries.length, 13);
    expect(vitaminToolkitEntries.map((e) => e.id).toSet().length, 13);
  });

  test('B12 malabsorption oral pathway preserves NICE 1 mg minimum', () {
    final b12 = vitaminEntry(VitaminId.vitaminB12);
    final pathway =
        b12.pathways.singleWhere((item) => item.id == 'malabsorption-oral');

    expect(pathway.dose, contains('At least 1 mg'));
    expect(pathway.monitoring, contains('3 months'));
    expect(pathway.caveat, contains('lifelong intramuscular'));
  });

  test('folic acid prevention stays 400 mcg and does not auto-dose high risk', () {
    final folate = vitaminEntry(VitaminId.folateB9);
    final pathway =
        folate.pathways.singleWhere((item) => item.id == 'ntd-prevention');

    expect(pathway.dose, contains('400 mcg folic acid'));
    expect(pathway.caveat, contains('high-risk'));
  });

  test('B6 pregnancy nausea pathway keeps dose and neuropathy lock', () {
    final b6 = vitaminEntry(VitaminId.vitaminB6);
    final pathway = b6.pathways.singleWhere((item) => item.id == 'nvp');

    expect(pathway.dose, contains('10–25 mg'));
    expect(pathway.dose, contains('three or four times'));
    expect(b6.safety.join(' '), contains('neuropathy'));
    expect(b6.safety.join(' '), contains('12 mg/day'));
  });

  test('biotin pathway preserves lab interference warning', () {
    final biotin = vitaminEntry(VitaminId.biotinB7);
    final pathway =
        biotin.pathways.singleWhere((item) => item.id == 'hair-nails');

    expect(pathway.caveat, contains('10 mg'));
    expect(pathway.caveat, contains('troponin'));
  });

  test('vitamin D older adult prevention avoids routine testing', () {
    final d = vitaminEntry(VitaminId.vitaminD);
    final pathway =
        d.pathways.singleWhere((item) => item.id == 'older-adults');

    expect(pathway.dose, contains('daily lower-dose'));
    expect(pathway.monitoring, contains('Routine 25-OH-D'));
  });

  test('mitochondrial cocktail is explicitly nonstandardized', () {
    expect(mitochondrialCocktailRule, contains('not one standardized formula'));
    expect(mitochondrialCocktailRule, contains('3–6 ingredients'));
    expect(mitochondrialCocktailRule, contains('not nonspecific fatigue'));
  });

  test('mitochondrial carnitine requires documented deficiency', () {
    final carnitine = mitochondrialSupportItems.singleWhere(
      (item) => item.ingredient == 'L-carnitine',
    );

    expect(carnitine.whenUsed, contains('documented carnitine deficiency'));
    expect(carnitine.dose, contains('20–100 mg/kg/day'));
    expect(carnitine.dose, contains('usual maximum 3 g/day'));
  });

  test('mitochondrial riboflavin range remains 50 to 400 mg daily', () {
    final riboflavin = mitochondrialSupportItems.singleWhere(
      (item) => item.ingredient == 'Riboflavin (B2)',
    );

    expect(riboflavin.dose, '50–400 mg/day.');
  });

  test('vitamin K pathway promotes consistency rather than avoidance', () {
    final k = vitaminEntry(VitaminId.vitaminK);
    final pathway = k.pathways.singleWhere((item) => item.id == 'warfarin');

    expect(pathway.dose, contains('Do not instruct the patient to eliminate'));
    expect(pathway.monitoring, contains('INR'));
  });
}
