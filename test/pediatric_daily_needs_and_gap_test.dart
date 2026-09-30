import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/supplements/daily_needs/data/nutrient_gap.dart';
import 'package:drug_edu/features/supplements/daily_needs/data/pediatric_daily_needs.dart';
import 'package:drug_edu/features/supplements/daily_needs/domain/daily_needs_models.dart';

void main() {
  DailyNeedItem need(List<DailyNeedItem> items, String id) {
    return items.singleWhere((item) => item.id == id);
  }

  PediatricDailyNeedInput input({
    PediatricAgeBand age = PediatricAgeBand.age1To3Years,
    PatientSex sex = PatientSex.female,
    PediatricLifeStage lifeStage = PediatricLifeStage.none,
    InfantFeedingMode feeding = InfantFeedingMode.breastMilk,
    FormulaDailyVolume formulaVolume =
        FormulaDailyVolume.lessThan32OzOrUnknown,
    bool preterm = false,
  }) {
    return PediatricDailyNeedInput(
      sex: sex,
      ageBand: age,
      lifeStage: lifeStage,
      feedingMode: feeding,
      formulaDailyVolume: formulaVolume,
      pretermOrLowBirthWeight: preterm,
    );
  }

  test('infant and child vitamin D targets remain age-locked', () {
    final infant = pediatricDailyNeeds(
      input(age: PediatricAgeBand.birthTo6Months),
    );
    final child = pediatricDailyNeeds(
      input(age: PediatricAgeBand.age1To3Years),
    );

    expect(need(infant, 'vitamin-d').amount, 400);
    expect(need(infant, 'vitamin-d').referenceType, 'AI');
    expect(need(child, 'vitamin-d').amount, 600);
    expect(need(child, 'vitamin-d').referenceType, 'RDA');
  });

  test('calcium rises to 1300 mg during later childhood and adolescence', () {
    final age9to13 = pediatricDailyNeeds(
      input(age: PediatricAgeBand.age9To13Years),
    );
    final teen = pediatricDailyNeeds(
      input(age: PediatricAgeBand.age14To18Years),
    );

    expect(need(age9to13, 'calcium').amount, 1300);
    expect(need(teen, 'calcium').amount, 1300);
  });

  test('teen iron and magnesium preserve sex differences', () {
    final male = pediatricDailyNeeds(
      input(
        age: PediatricAgeBand.age14To18Years,
        sex: PatientSex.male,
      ),
    );
    final female = pediatricDailyNeeds(
      input(
        age: PediatricAgeBand.age14To18Years,
        sex: PatientSex.female,
      ),
    );

    expect(need(male, 'iron').amount, 11);
    expect(need(female, 'iron').amount, 15);
    expect(need(male, 'magnesium').amount, 410);
    expect(need(female, 'magnesium').amount, 360);
  });

  test('pregnant teen values use adolescent pregnancy DRIs', () {
    final items = pediatricDailyNeeds(
      input(
        age: PediatricAgeBand.age14To18Years,
        sex: PatientSex.female,
        lifeStage: PediatricLifeStage.pregnant,
      ),
    );

    expect(need(items, 'iron').amount, 27);
    expect(need(items, 'calcium').amount, 1300);
    expect(need(items, 'magnesium').amount, 400);
    expect(need(items, 'zinc').amount, 12);
    expect(need(items, 'folate').amount, 600);
  });

  test('breastfed infant gets 400 IU vitamin D safety note', () {
    final notes = pediatricSafetyNotes(
      input(
        age: PediatricAgeBand.birthTo6Months,
        feeding: InfantFeedingMode.breastMilk,
      ),
    );

    final note = notes.singleWhere((item) => item.id == 'infant-vitamin-d');
    expect(note.bodyAr, contains('400 IU'));
  });

  test('formula volume at least 32 oz changes vitamin D note', () {
    final notes = pediatricSafetyNotes(
      input(
        age: PediatricAgeBand.age7To12Months,
        feeding: InfantFeedingMode.ironFortifiedFormula,
        formulaVolume: FormulaDailyVolume.atLeast32Oz,
      ),
    );

    final note = notes.singleWhere((item) => item.id == 'infant-vitamin-d');
    expect(note.bodyAr, contains('لا تُضف vitamin D تلقائيًا'));
  });

  test('preterm infant triggers clinician-directed lock', () {
    final notes = pediatricSafetyNotes(
      input(
        age: PediatricAgeBand.birthTo6Months,
        preterm: true,
      ),
    );

    expect(notes.any((item) => item.id == 'preterm-lbw-lock'), isTrue);
  });

  test('nutrition gap subtracts food and existing supplement intake', () {
    final result = calculateNutrientGap(
      target: 1000,
      foodIntake: 700,
      existingSupplementIntake: 100,
    );

    expect(result.totalCurrentIntake, 800);
    expect(result.uncoveredGap, 200);
    expect(result.targetMet, isFalse);
  });

  test('nutrition gap never becomes a negative supplement recommendation', () {
    final result = calculateNutrientGap(
      target: 600,
      foodIntake: 500,
      existingSupplementIntake: 200,
    );

    expect(result.totalCurrentIntake, 700);
    expect(result.uncoveredGap, 0);
    expect(result.targetMet, isTrue);
  });

  test('negative entered intake is clamped to zero', () {
    final result = calculateNutrientGap(
      target: 600,
      foodIntake: -50,
      existingSupplementIntake: -10,
    );

    expect(result.foodIntake, 0);
    expect(result.existingSupplementIntake, 0);
    expect(result.uncoveredGap, 600);
  });

  test('pediatric magnesium UL keeps supplemental-only scope', () {
    final items = pediatricDailyNeeds(
      input(age: PediatricAgeBand.age4To8Years),
    );

    expect(need(items, 'magnesium').upperLimit, '110 mg/day');
    expect(
      need(items, 'magnesium').upperLimitScope,
      contains('Supplement/medication'),
    );
  });
}
