import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/supplements/needs_matrix/data/need_matrix_data.dart';
import 'package:drug_edu/features/supplements/needs_matrix/domain/need_matrix_models.dart';

void main() {
  test('need matrix covers healthy prevention medication disease and deficiency paths', () {
    expect(needPathways.length, 16);
    expect(
      needPathways.map((item) => item.id).toSet(),
      containsAll({
        'healthy-balanced-adult',
        'restricted-low-intake',
        'pregnancy-capable',
        'pregnancy-prenatal',
        'lactation-maternal',
        'breastfed-infant-vitd',
        'strict-vegan-b12',
        'age50plus-b12',
        'age75plus-vitd',
        'metformin-b12',
        'longterm-ppi',
        'bariatric-malabsorption',
        'confirmed-iron-deficiency',
        'confirmed-b12-deficiency',
        'low-calcium-bone-risk',
        'ckd-mineral-safety',
      }),
    );
  });

  test('healthy adult has zero default supplement when food meets need', () {
    final item = needPathway('healthy-balanced-adult');
    expect(item.tier, NeedActionTier.foodFirst);
    expect(item.supplementPlan, contains('Default supplement dose = 0'));
    expect(item.dailyTarget, contains('max(target'));
    expect(item.labPlan, contains('No generic vitamin panel'));
  });

  test('healthy rules separate total intake from pill dose', () {
    final vitaminD =
        healthySupplementRules.singleWhere((item) => item.nutrient == 'Vitamin D');
    expect(vitaminD.dailyNeed, contains('600 IU/day'));
    expect(vitaminD.dailyNeed, contains('800 IU/day'));
    expect(vitaminD.defaultSupplementDose, contains('no automatic dose above the DRI'));

    final calcium =
        healthySupplementRules.singleWhere((item) => item.nutrient == 'Calcium');
    expect(calcium.defaultSupplementDose, contains('uncovered dietary gap'));
  });

  test('usual dose reference preserves ordinary doses despite no proven need', () {
    expect(usualSupplementDoseRules.length, 15);

    final iron =
        usualSupplementDoseRules.singleWhere((item) => item.name == 'Iron');
    expect(iron.usualIfTakingAnyway, contains('18 mg/day'));
    expect(iron.highDoseBoundary, contains('65 mg'));

    final b12 =
        usualSupplementDoseRules.singleWhere((item) => item.name == 'Vitamin B12');
    expect(b12.usualIfTakingAnyway, contains('5–25 mcg'));
    expect(b12.usualIfTakingAnyway, contains('500–1,000 mcg'));

    final biotin =
        usualSupplementDoseRules.singleWhere((item) => item.name == 'Biotin');
    expect(biotin.normalNeed, contains('30 mcg/day'));
    expect(biotin.usualIfTakingAnyway, contains('2.5 mg/day'));
    expect(biotin.highDoseBoundary, contains('300 mg/day'));

    final b6 =
        usualSupplementDoseRules.singleWhere((item) => item.name == 'Vitamin B6');
    expect(b6.usualIfTakingAnyway, contains('1.7–2 mg/day'));
    expect(b6.highDoseBoundary, contains('12 mg/day'));
  });

  test('preconception folic acid remains 400 mcg preventive exception', () {
    final item = needPathway('pregnancy-capable');
    expect(item.tier, NeedActionTier.preventive);
    expect(item.supplementPlan, contains('400 mcg folic acid daily'));
    expect(item.labPlan, contains('No folate blood test is required'));
  });

  test('pregnancy pathway preserves iron iodine folate and vitamin D targets', () {
    final item = needPathway('pregnancy-prenatal');
    expect(item.dailyTarget, contains('iron 27 mg/day'));
    expect(item.dailyTarget, contains('iodine 220 mcg/day'));
    expect(item.dailyTarget, contains('folate 600 mcg DFE/day'));
    expect(item.dailyTarget, contains('vitamin D 600 IU/day'));
    expect(item.dailyTarget, contains('150 mcg/day iodine'));
  });

  test('breastfed infant vitamin D stays 400 IU with concentration lock', () {
    final item = needPathway('breastfed-infant-vitd');
    expect(item.supplementPlan, contains('400 IU once daily'));
    expect(item.reviewStopRule, contains('number of drops'));
  });

  test('vegan B12 uses reliable source without inventing universal megadose', () {
    final item = needPathway('strict-vegan-b12');
    expect(item.dailyTarget, contains('Adult RDA is 2.4 mcg/day'));
    expect(item.supplementPlan, contains('No universal megadose'));
    expect(item.duration, contains('as long as the strict vegan diet continues'));
  });

  test('age 75 vitamin D does not require routine screening', () {
    final item = needPathway('age75plus-vitd');
    expect(item.dailyTarget, contains('800 IU/day'));
    expect(item.labPlan, contains('Routine 25-OH vitamin D testing is NOT required'));
  });

  test('metformin pathway tests B12 instead of automatic prescribing', () {
    final item = needPathway('metformin-b12');
    expect(item.tier, NeedActionTier.testFirst);
    expect(item.coreDecision, contains('PERIODIC ASSESSMENT'));
    expect(item.labPlan, contains('ADA 2026'));
    expect(item.labPlan, contains('>5 years'));
  });

  test('long term PPI pathway keeps magnesium monitoring logic', () {
    final item = needPathway('longterm-ppi');
    expect(item.tier, NeedActionTier.testFirst);
    expect(item.labPlan, contains('serum magnesium'));
    expect(item.supplementPlan, contains('Do not pre-emptively add'));
  });

  test('bariatric pathway refuses one generic dose', () {
    final item = needPathway('bariatric-malabsorption');
    expect(item.tier, NeedActionTier.protocol);
    expect(item.supplementPlan, contains('Do NOT apply one generic'));
    expect(item.duration, contains('lifelong'));
  });

  test('confirmed deficiencies are treatment not wellness doses', () {
    final iron = needPathway('confirmed-iron-deficiency');
    expect(iron.tier, NeedActionTier.treatment);
    expect(iron.dailyTarget, contains('RDA is NOT the treatment dose'));

    final b12 = needPathway('confirmed-b12-deficiency');
    expect(b12.tier, NeedActionTier.treatment);
    expect(b12.dailyTarget, contains('NOT a deficiency-treatment dose'));
  });

  test('CKD blocks casual mineral supplementation', () {
    final item = needPathway('ckd-mineral-safety');
    expect(item.tier, NeedActionTier.avoidSelfSupplement);
    expect(item.coreDecision, contains('Do not self-prescribe potassium, magnesium'));
  });

  test('healthy lab matrix rejects broad routine micronutrient testing', () {
    expect(healthyLabRules.length, 7);
    expect(healthyLabRules.first.routineHealthyUse, 'NO.');
    final vitaminD =
        healthyLabRules.singleWhere((item) => item.test == '25-OH vitamin D');
    expect(vitaminD.routineHealthyUse, contains('NO routine screening'));

    final calcium =
        healthyLabRules.singleWhere((item) => item.test == 'Serum calcium');
    expect(calcium.routineHealthyUse, contains('NO for checking dietary calcium adequacy'));
  });

  test('global rule locks requirement vs supplement vs treatment vs DV', () {
    expect(
      needMatrixGlobalRules.first,
      'Daily requirement ≠ supplement dose ≠ deficiency-treatment dose ≠ %DV.',
    );
  });
}
