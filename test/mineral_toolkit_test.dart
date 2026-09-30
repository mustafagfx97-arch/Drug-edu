import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/supplements/minerals/data/mineral_toolkit_data.dart';
import 'package:drug_edu/features/supplements/minerals/domain/mineral_toolkit_models.dart';

void main() {
  test('iron salt conversions preserve NIH elemental fractions', () {
    final iron = mineralEntry(MineralId.iron);
    final sulfate =
        iron.presets.singleWhere((item) => item.id == 'ferrous-sulfate');
    final fumarate =
        iron.presets.singleWhere((item) => item.id == 'ferrous-fumarate');
    final gluconate =
        iron.presets.singleWhere((item) => item.id == 'ferrous-gluconate');

    expect(sulfate.elementalFraction, 0.20);
    expect(fumarate.elementalFraction, 0.33);
    expect(gluconate.elementalFraction, 0.12);

    final result = elementalFromSalt(
      saltAmountMg: 325,
      elementalFraction: sulfate.elementalFraction!,
    );
    expect(result.elementalAmountMg, 65);
  });

  test('calcium carbonate and citrate conversions are distinct', () {
    final calcium = mineralEntry(MineralId.calcium);
    final carbonate =
        calcium.presets.singleWhere((item) => item.id == 'carbonate');
    final citrate = calcium.presets.singleWhere((item) => item.id == 'citrate');

    expect(carbonate.elementalFraction, 0.40);
    expect(citrate.elementalFraction, 0.21);

    expect(
      elementalFromSalt(
        saltAmountMg: 1250,
        elementalFraction: carbonate.elementalFraction!,
      ).elementalAmountMg,
      500,
    );
  });

  test('reverse elemental calculator returns required salt mass', () {
    final result = saltFromElemental(
      elementalAmountMg: 500,
      elementalFraction: 0.40,
    );

    expect(result.saltAmountMg, 1250);
  });

  test('calcium split helper keeps doses near 500 mg or less', () {
    expect(calciumSplitDoseCount(0), 0);
    expect(calciumSplitDoseCount(500), 1);
    expect(calciumSplitDoseCount(501), 2);
    expect(calciumSplitDoseCount(1300), 3);
  });

  test('magnesium variable salts are label-controlled', () {
    final magnesium = mineralEntry(MineralId.magnesium);
    final citrate =
        magnesium.presets.singleWhere((item) => item.id == 'citrate-label');
    final glycinate =
        magnesium.presets.singleWhere((item) => item.id == 'glycinate-label');

    expect(citrate.elementalFraction, isNull);
    expect(glycinate.elementalFraction, isNull);
  });

  test('WHO pediatric diarrhea zinc course is locked to elemental zinc', () {
    final zinc = mineralEntry(MineralId.zinc);
    final protocol =
        zinc.protocols.singleWhere((item) => item.id == 'pediatric-diarrhea');

    expect(protocol.dose, contains('10 mg/day ELEMENTAL zinc'));
    expect(protocol.dose, contains('20 mg/day ELEMENTAL zinc'));
    expect(protocol.duration, '10–14 days.');
  });

  test('adult oral iron pathway prevents multiple daily dosing', () {
    final iron = mineralEntry(MineralId.iron);
    final protocol =
        iron.protocols.singleWhere((item) => item.id == 'adult-ida-oral');

    expect(protocol.frequency, contains('At most once daily'));
    expect(protocol.monitoring, contains('first 4 weeks'));
    expect(protocol.duration, contains('3 months'));
  });

  test('interaction separations are preserved', () {
    final calcium = mineralEntry(MineralId.calcium);
    final magnesium = mineralEntry(MineralId.magnesium);
    final zinc = mineralEntry(MineralId.zinc);

    expect(
      calcium.interactions
          .singleWhere((item) => item.withItem == 'Levothyroxine')
          .separation,
      contains('4 hours'),
    );
    expect(
      magnesium.interactions
          .singleWhere(
            (item) => item.withItem == 'Tetracycline / quinolone antibiotics',
          )
          .separation,
      contains('4–6 hours'),
    );
    expect(
      zinc.interactions
          .singleWhere((item) => item.withItem == 'Penicillamine')
          .separation,
      contains('1 hour'),
    );
  });

  test('negative salt amount is clamped rather than producing negative dose', () {
    final result = elementalFromSalt(
      saltAmountMg: -100,
      elementalFraction: 0.20,
    );

    expect(result.saltAmountMg, 0);
    expect(result.elementalAmountMg, 0);
  });
}
