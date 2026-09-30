import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/supplements/probiotics/data/probiotic_atlas_data.dart';

void main() {
  test('LGG acute gastroenteritis keeps exact pediatric dose and duration', () {
    final lgg = probioticProfile('lgg');
    final use = lgg.uses.singleWhere((item) => item.id == 'age');

    expect(use.dose, contains('1 × 10^10 CFU/day'));
    expect(use.duration, '5–7 days');
  });

  test('LGG AAD prevention starts with antibiotic and keeps five-billion floor', () {
    final lgg = probioticProfile('lgg');
    final use = lgg.uses.singleWhere((item) => item.id == 'aad');

    expect(use.dose, contains('5 × 10^9 CFU/day'));
    expect(use.duration, contains('Start simultaneously'));
  });

  test('S boulardii gastroenteritis remains mg based without fake conversion', () {
    final sb = probioticProfile('s-boulardii');
    final use = sb.uses.singleWhere((item) => item.id == 'age');

    expect(use.dose, '250–750 mg/day');
    expect(use.duration, '5–7 days');
    expect(use.exactUse, contains('Do not convert mg to CFU'));
  });

  test('S boulardii safety preserves central-line and immunocompromise lock', () {
    final sb = probioticProfile('s-boulardii');
    final safety = sb.safety.join(' ');

    expect(safety, contains('central venous catheter'));
    expect(safety, contains('immunocompromised'));
    expect(safety, contains('fungemia'));
  });

  test('L reuteri DSM17938 colic pathway is breastfed infant specific', () {
    final reuteri = probioticProfile('reuteri-17938');
    final use = reuteri.uses.singleWhere((item) => item.id == 'colic');

    expect(use.dose, '1 × 10^8 CFU/day');
    expect(use.frequency, 'Once daily');
    expect(use.duration, 'At least 21 days');
    expect(use.population, contains('Breastfed'));
    expect(use.caveat, contains('formula-fed'));
  });

  test('BB12 colic discrepancy is shown rather than hidden', () {
    final bb12 = probioticProfile('bb12');
    final use = bb12.uses.singleWhere((item) => item.id == 'colic');

    expect(use.dose, contains('1 × 10^8 CFU/day'));
    expect(use.dose, contains('1 × 10^9 CFU/day'));
    expect(use.exactUse, contains('do not auto-convert'));
  });

  test('specific two-strain AGE combination requires per-strain dose', () {
    final combo = probioticProfile('19070-2-12246');
    final use = combo.uses.single;

    expect(use.dose, contains('2 × 10^10 CFU of EACH strain'));
    expect(use.duration, '5 days');
  });

  test('HN019 constipation is not preserved as routine positive recommendation', () {
    final hn019 = probioticProfile('hn019');
    final use = hn019.uses.single;

    expect(use.exactUse, contains('standard constipation management first'));
    expect(use.caveat, contains('did not show superiority'));
  });

  test('dose matcher locks pooled blend CFU', () {
    final result = matchProbioticCfu(
      targetCfuPerDay: 10000000000,
      cfuPerServingForExactStrain: 5000000000,
      perStrainCfuVerified: false,
    );

    expect(result.locked, isTrue);
    expect(result.message, contains('total blend CFU is not enough'));
  });

  test('dose matcher calculates exact-strain servings mathematically', () {
    final result = matchProbioticCfu(
      targetCfuPerDay: 10000000000,
      cfuPerServingForExactStrain: 5000000000,
      perStrainCfuVerified: true,
    );

    expect(result.locked, isFalse);
    expect(result.servingsPerDay, 2);
  });

  test('BioGaia example preserves five-drop technique and heat warning', () {
    final product = probioticProductExamples.firstWhere(
      (item) => item.name == 'BioGaia Protectis Baby Drops',
    );

    expect(product.amount, contains('5 drops'));
    expect(product.directions, contains('Shake well for 10 seconds'));
    expect(product.directions, contains('hot food'));
    expect(product.storage, contains('3 months after opening'));
  });

  test('pediatric constipation remains a guideline negative lock', () {
    expect(
      probioticGuidelineLocks.any(
        (item) => item.contains('Pediatric functional constipation'),
      ),
      isTrue,
    );
  });
}
