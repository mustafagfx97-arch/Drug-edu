import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/supplements/decision/data/supplement_decision_pathways.dart';
import 'package:drug_edu/features/supplements/decision/domain/supplement_decision_models.dart';

void main() {
  test('healthy wellness pathway does not auto-order broad labs', () {
    final actions = evaluateSupplementDecision({
      SupplementDecisionFlag.healthyWellnessOnly,
    });

    expect(actions.any((item) => item.id == 'healthy-no-panel'), isTrue);
    expect(
      actions.any((item) => item.id == 'known-deficiency-treatment'),
      isFalse,
    );
  });

  test('preconception pathway adds folic acid prevention', () {
    final actions = evaluateSupplementDecision({
      SupplementDecisionFlag.planningOrCouldBecomePregnant,
    });

    final item = actions.singleWhere(
      (action) => action.id == 'folic-acid-preconception',
    );

    expect(item.patientActionAr, contains('400–800 mcg'));
  });

  test('breastfed infant pathway locks vitamin D to 400 IU', () {
    final actions = evaluateSupplementDecision({
      SupplementDecisionFlag.breastfedOrPartiallyBreastfedInfant,
    });

    final item = actions.singleWhere(
      (action) => action.id == 'infant-vitamin-d',
    );

    expect(item.patientActionAr, contains('400 IU'));
  });

  test('vegan pathway requires a reliable B12 source', () {
    final actions = evaluateSupplementDecision({
      SupplementDecisionFlag.strictVegan,
    });

    expect(actions.any((item) => item.id == 'vegan-b12'), isTrue);
  });

  test('kidney disease creates a mineral safety lock', () {
    final actions = evaluateSupplementDecision({
      SupplementDecisionFlag.kidneyDisease,
    });

    final item = actions.singleWhere(
      (action) => action.id == 'kidney-mineral-lock',
    );

    expect(item.patientActionAr, contains('potassium'));
    expect(item.patientActionAr, contains('magnesium'));
  });

  test('multiple supplements triggers duplicate-intake review', () {
    final actions = evaluateSupplementDecision({
      SupplementDecisionFlag.multipleSupplements,
    });

    expect(actions.any((item) => item.id == 'duplicate-intake-review'), isTrue);
  });
}
