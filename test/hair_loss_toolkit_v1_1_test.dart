import 'package:drug_edu/features/supplements/hair_loss/data/hair_loss_data.dart';
import 'package:drug_edu/features/supplements/hair_loss/domain/hair_loss_models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('hair-loss toolkit covers major oral topical and shampoo brands', () {
    expect(hairLossProducts.length, greaterThanOrEqualTo(25));
    expect(
      hairLossProducts.map((item) => item.id).toSet().length,
      hairLossProducts.length,
    );

    expect(
      hairLossProducts.map((item) => item.id).toSet(),
      containsAll({
        'priorin-extra',
        'priorin-n',
        'cystiphane-fort',
        'cystiphane-anagen',
        'neofollics-tablets',
        'viviscal',
        'nutrafol-core',
        'pantogar-classic',
        'crescina-regrowth',
        'crescina-complete',
        'foltene-women',
        'foltene-men',
        'cystiphane-lotion',
        'neofollics-lotion',
        'vichy-regen',
        'ducray-creastim',
        'ducray-neoptide',
        'furterer-triphasic-serum',
        'nioxin-serum',
        'vichy-shampoo',
        'cystiphane-shampoo',
        'neofollics-shampoo',
        'ducray-anaphase',
        'alpecin-c1',
      }),
    );
  });

  test('Priorin N and Priorin Extra stay formulation and dose distinct', () {
    final extra = hairLossProduct('priorin-extra');
    final n = hairLossProduct('priorin-n');

    expect(extra.regimen, contains('2 capsules daily'));
    expect(extra.keyIngredients, contains('biotin 100 mcg'));
    expect(n.regimen, contains('2–3 capsules daily'));
    expect(n.keyIngredients, contains('wheat-germ oil'));
    expect(extra.productLock, contains('NOT the same formula'));
  });

  test('Cystiphane Fort reactive and Anagen chronic pathways stay distinct', () {
    final fort = hairLossProduct('cystiphane-fort');
    final anagen = hairLossProduct('cystiphane-anagen');

    expect(fort.regimen, contains('4 tablets/day'));
    expect(fort.keyIngredients, contains('L-cystine 2,000 mg'));
    expect(fort.bestFor, contains('Reactive'));
    expect(anagen.regimen, contains('3 tablets daily'));
    expect(anagen.keyIngredients, contains('L-cystine 1,200 mg'));
    expect(anagen.bestFor, contains('chronic'));
  });

  test('ampoule and lotion schedules preserve exact brand technique', () {
    final crescina = hairLossProduct('crescina-regrowth');
    expect(crescina.regimen, contains('5 consecutive days'));
    expect(crescina.regimen, contains('2 days off'));
    expect(crescina.regimen, contains('Do not rinse'));

    final foltene = hairLossProduct('foltene-women');
    expect(foltene.regimen, contains('every other day for 8 weeks'));
    expect(foltene.duration, contains('2 vials/week for 6 weeks'));

    final cystiphane = hairLossProduct('cystiphane-lotion');
    expect(cystiphane.regimen, contains('7 sprays once daily'));

    final vichy = hairLossProduct('vichy-regen');
    expect(vichy.duration, contains('5–7 applications/week for 12 weeks'));

    final creastim = hairLossProduct('ducray-creastim');
    expect(creastim.regimen, contains('3 times per week'));
    expect(creastim.duration, '2 months.');

    final neoptide = hairLossProduct('ducray-neoptide');
    expect(neoptide.regimen, contains('8 sprays'));
    expect(neoptide.regimen, contains('Once daily'));
  });

  test('shampoos remain supportive rather than stand-alone regrowth therapy', () {
    final shampoos = hairLossProducts
        .where((item) => item.type == HairLossProductType.shampoo)
        .toList();
    expect(shampoos.length, greaterThanOrEqualTo(7));
    expect(
      shampoos.every(
        (item) => item.evidence == HairLossEvidence.supportiveOnly ||
            item.evidence == HairLossEvidence.limited,
      ),
      isTrue,
    );
    expect(
      hairLossGlobalLocks.join(' '),
      contains('do not present shampoo alone as a proven regrowth treatment'),
    );
  });

  test('Pantogar has regulatory-status lock rather than being called a universal supplement', () {
    final item = hairLossProduct('pantogar-classic');
    expect(item.evidence, HairLossEvidence.regulatoryCaution);
    expect(item.productLock, contains('country pack'));
    expect(item.productLock, contains('medicine'));
  });

  test('ingredient guide locks high-dose biotin and shotgun nutrient use', () {
    final biotin =
        hairIngredientGuide.singleWhere((item) => item.name.startsWith('Biotin'));
    expect(biotin.safety, contains('troponin'));
    expect(biotin.safety, contains('no universal 24/48-hour stop rule'));

    final locks = hairLossGlobalLocks.join(' ');
    expect(locks, contains('Do not start biotin, iron, zinc'));
    expect(locks, contains('excessive intake'));
  });

  test('triage prevents selling cosmetics first for hair-loss red flags', () {
    final redFlags = hairLossTriageRules
        .singleWhere((item) => item.id == 'red-flags');
    expect(redFlags.pattern, contains('Smooth focal patches'));
    expect(redFlags.pattern, contains('scalp pain'));
    expect(redFlags.referWhen, contains('Prompt medical/dermatology review'));
  });
}
