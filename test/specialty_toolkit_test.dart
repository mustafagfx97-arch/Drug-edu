import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/supplements/specialty/data/specialty_toolkit_data.dart';

void main() {
  test('lactase pathway preserves first-bite timing and repeat window', () {
    final item = specialtyIngredient('lactase');
    final use = item.uses.single;

    expect(use.frequency, contains('FIRST bite or sip'));
    expect(use.frequency, contains('30–45 minutes'));
    expect(use.dose, contains('9,000 FCC'));
  });

  test('alpha galactosidase pathway uses GALU and prevents cooking', () {
    final item = specialtyIngredient('alpha-galactosidase');
    final use = item.uses.single;

    expect(use.dose, contains('800 GALU'));
    expect(use.dose, contains('1,200 GalU'));
    expect(use.exactUse, contains('Do not cook'));
  });

  test('DAO remains product specific and diagnosis locked', () {
    final item = specialtyIngredient('dao');
    final use = item.uses.single;

    expect(use.dose, contains('NO universal dose'));
    expect(use.frequency, contains('BEFORE meals'));
    expect(use.caveat, contains('serum DAO alone'));
  });

  test('peppermint IBS pathway preserves 180 mg three times daily trial', () {
    final item = specialtyIngredient('peppermint');
    final use = item.uses.single;

    expect(use.dose, contains('180 mg'));
    expect(use.frequency, contains('Three times daily'));
    expect(use.duration, contains('6 weeks'));
    expect(use.caveat, contains('GERD'));
  });

  test('milk thistle is not encoded as proven liver therapy', () {
    final item = specialtyIngredient('milk-thistle');
    final use = item.uses.single;

    expect(use.dose, contains('No evidence-based universal'));
    expect(use.caveat, contains('did not show meaningful benefit'));
  });

  test('berberine preserves clinical dose range and pregnancy lock', () {
    final item = specialtyIngredient('berberine');
    final use = item.uses.single;

    expect(use.dose, contains('200–1,000 mg'));
    expect(use.frequency, contains('two to three times daily'));
    expect(item.safety.join(' '), contains('pregnancy'));
    expect(item.safety.join(' '), contains('cyclosporine'));
  });

  test('ALA neuropathy pathway preserves 600 mg per day evidence dose', () {
    final item = specialtyIngredient('ala');
    final use = item.uses.single;

    expect(use.dose, contains('600 mg/day'));
    expect(use.caveat, contains('inconsistent'));
  });

  test('NAC MASLD trial is explicitly negative for liver endpoints', () {
    final item = specialtyIngredient('nac');
    final use = item.uses.single;

    expect(use.dose, contains('600 mg three times daily'));
    expect(use.duration, '8 weeks in the cited trial.');
    expect(use.caveat, contains('did NOT significantly improve'));
  });

  test('curcumin keeps enhanced-bioavailability liver injury lock', () {
    final item = specialtyIngredient('curcumin');

    expect(item.keyRule, contains('liver injury'));
    expect(item.safety.join(' '), contains('dark urine'));
  });

  test('product examples keep exact formulation counts separate', () {
    final lactaid = specialtyProductTechniques.singleWhere(
      (item) => item.name == 'LACTAID Fast Act Caplet',
    );
    final beano = specialtyProductTechniques.singleWhere(
      (item) => item.name == 'beano Tablets',
    );

    expect(lactaid.directions, contains('1–2 caplets'));
    expect(lactaid.amount, contains('9,000 FCC'));
    expect(beano.amount, contains('800 GALU'));
    expect(beano.storage, contains('25°C'));
  });
}
