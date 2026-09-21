import 'package:drug_edu/features/supplements/data/supplement_profiles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('supplement encyclopedia consolidates mineral salts professionally', () {
    expect(supplementProfiles.length, greaterThanOrEqualTo(37));
    final ids = supplementProfiles.map((item) => item.id).toList();
    expect(ids.toSet().length, ids.length);

    expect(ids, contains('calcium'));
    expect(ids, contains('magnesium'));
    expect(ids, contains('zinc'));
    expect(ids, contains('oral-iron-salts'));
    expect(ids, contains('potassium-supplements'));

    expect(ids, isNot(contains('calcium-carbonate')));
    expect(ids, isNot(contains('calcium-citrate')));
    expect(ids, isNot(contains('magnesium-gluconate')));
    expect(ids, isNot(contains('magnesium-citrate')));
    expect(ids, isNot(contains('magnesium-oxide')));
  });

  test('calcium salt table locks elemental fractions and food differences', () {
    final calcium = supplementProfiles.firstWhere((item) => item.id == 'calcium');
    final carbonate =
        calcium.saltVariants.firstWhere((item) => item.id == 'carbonate');
    final citrate =
        calcium.saltVariants.firstWhere((item) => item.id == 'citrate');

    expect(carbonate.elementalPercent, contains('40%'));
    expect(carbonate.example, contains('1,250 mg'));
    expect(carbonate.example, contains('500 mg'));
    expect(carbonate.administration.toLowerCase(), contains('food'));

    expect(citrate.elementalPercent, contains('21%'));
    expect(citrate.administration.toLowerCase(), contains('with or without food'));
  });

  test('magnesium table distinguishes elemental amount and laxative products', () {
    final magnesium =
        supplementProfiles.firstWhere((item) => item.id == 'magnesium');
    final oxide = magnesium.saltVariants.firstWhere((item) => item.id == 'oxide');
    final citrate =
        magnesium.saltVariants.firstWhere((item) => item.id == 'citrate');
    final hydroxide =
        magnesium.saltVariants.firstWhere((item) => item.id == 'hydroxide');

    expect(oxide.elementalAmount, contains('241.3 mg'));
    expect(oxide.elementalPercent, contains('60%'));
    expect(citrate.practicalUse.toLowerCase(), contains('more soluble'));
    expect(hydroxide.practicalUse.toLowerCase(), contains('laxative'));
  });

  test('iron table counsels by elemental iron not salt weight', () {
    final iron =
        supplementProfiles.firstWhere((item) => item.id == 'oral-iron-salts');
    final sulfate =
        iron.saltVariants.firstWhere((item) => item.id == 'ferrous-sulfate');
    final fumarate =
        iron.saltVariants.firstWhere((item) => item.id == 'ferrous-fumarate');
    final gluconate =
        iron.saltVariants.firstWhere((item) => item.id == 'ferrous-gluconate');

    expect(sulfate.elementalPercent, contains('20%'));
    expect(sulfate.example, contains('65 mg'));
    expect(fumarate.elementalPercent, contains('33%'));
    expect(gluconate.elementalPercent, contains('12%'));
    expect(iron.formulationAlert.toLowerCase(), contains('elemental'));
  });

  test('zinc and potassium salt tables preserve safety distinctions', () {
    final zinc = supplementProfiles.firstWhere((item) => item.id == 'zinc');
    expect(
      zinc.saltVariants.map((item) => item.id),
      containsAll(<String>[
        'sulfate-heptahydrate',
        'sulfate-monohydrate',
        'gluconate',
        'acetate',
        'picolinate',
      ]),
    );
    expect(
      zinc.pharmacistSections.map((item) => item.body).join(' ').toLowerCase(),
      contains('copper'),
    );

    final potassium = supplementProfiles
        .firstWhere((item) => item.id == 'potassium-supplements');
    final kcl =
        potassium.saltVariants.firstWhere((item) => item.id == 'chloride');
    expect(kcl.elementalAmount, contains('39.1 mg'));
    expect(potassium.formulationAlert, contains('99 mg'));
  });

  test('previously missing essential and practical supplements are present', () {
    final ids = supplementProfiles.map((item) => item.id).toSet();
    expect(
      ids,
      containsAll(<String>[
        'copper',
        'chromium',
        'manganese',
        'molybdenum',
        'phosphorus',
        'vitamin-b1-thiamin',
        'vitamin-b2-riboflavin',
        'vitamin-b3-niacin',
        'vitamin-b5-pantothenic-acid',
        'choline',
        'creatine-monohydrate',
        'melatonin',
        'probiotics',
        'coenzyme-q10',
      ]),
    );
  });
}
