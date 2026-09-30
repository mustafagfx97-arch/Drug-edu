import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/supplements/daily_needs/data/adult_daily_needs.dart';
import 'package:drug_edu/features/supplements/daily_needs/domain/daily_needs_models.dart';

void main() {
  DailyNeedItem need(
    List<DailyNeedItem> items,
    String id,
  ) {
    return items.singleWhere((item) => item.id == id);
  }

  test('adult male daily targets preserve core RDA values', () {
    final items = adultDailyNeeds(
      const AdultDailyNeedInput(
        sex: PatientSex.male,
        ageBand: AdultAgeBand.age19to30,
        lifeStage: AdultLifeStage.none,
        smoker: false,
      ),
    );

    expect(need(items, 'iron').amount, 8);
    expect(need(items, 'magnesium').amount, 400);
    expect(need(items, 'vitamin-d').amount, 600);
    expect(need(items, 'zinc').amount, 11);
    expect(need(items, 'vitamin-k').amount, 120);
  });

  test('adult female daily targets preserve sex-specific iron and magnesium', () {
    final items = adultDailyNeeds(
      const AdultDailyNeedInput(
        sex: PatientSex.female,
        ageBand: AdultAgeBand.age19to30,
        lifeStage: AdultLifeStage.none,
        smoker: false,
      ),
    );

    expect(need(items, 'iron').amount, 18);
    expect(need(items, 'magnesium').amount, 310);
    expect(need(items, 'zinc').amount, 8);
    expect(need(items, 'vitamin-k').amount, 90);
  });

  test('pregnancy pathway changes iron folate iodine and magnesium', () {
    final items = adultDailyNeeds(
      const AdultDailyNeedInput(
        sex: PatientSex.female,
        ageBand: AdultAgeBand.age31to50,
        lifeStage: AdultLifeStage.pregnant,
        smoker: false,
      ),
    );

    expect(need(items, 'iron').amount, 27);
    expect(need(items, 'folate').amount, 600);
    expect(need(items, 'iodine').amount, 220);
    expect(need(items, 'magnesium').amount, 360);
    expect(need(items, 'vitamin-b12').amount, 2.6);
  });

  test('lactation pathway changes B12 iodine and selenium', () {
    final items = adultDailyNeeds(
      const AdultDailyNeedInput(
        sex: PatientSex.female,
        ageBand: AdultAgeBand.age19to30,
        lifeStage: AdultLifeStage.lactating,
        smoker: false,
      ),
    );

    expect(need(items, 'vitamin-b12').amount, 2.8);
    expect(need(items, 'iodine').amount, 290);
    expect(need(items, 'selenium').amount, 70);
  });

  test('older female gets higher calcium vitamin D and lower iron target', () {
    final items = adultDailyNeeds(
      const AdultDailyNeedInput(
        sex: PatientSex.female,
        ageBand: AdultAgeBand.age71plus,
        lifeStage: AdultLifeStage.none,
        smoker: false,
      ),
    );

    expect(need(items, 'calcium').amount, 1200);
    expect(need(items, 'vitamin-d').amount, 800);
    expect(need(items, 'iron').amount, 8);
  });

  test('smoking adds 35 mg daily vitamin C to the base RDA', () {
    final nonsmoker = adultDailyNeeds(
      const AdultDailyNeedInput(
        sex: PatientSex.male,
        ageBand: AdultAgeBand.age31to50,
        lifeStage: AdultLifeStage.none,
        smoker: false,
      ),
    );
    final smoker = adultDailyNeeds(
      const AdultDailyNeedInput(
        sex: PatientSex.male,
        ageBand: AdultAgeBand.age31to50,
        lifeStage: AdultLifeStage.none,
        smoker: true,
      ),
    );

    expect(
      need(smoker, 'vitamin-c').amount - need(nonsmoker, 'vitamin-c').amount,
      35,
    );
  });

  test('magnesium UL explicitly excludes food magnesium', () {
    final items = adultDailyNeeds(
      const AdultDailyNeedInput(
        sex: PatientSex.female,
        ageBand: AdultAgeBand.age31to50,
        lifeStage: AdultLifeStage.none,
        smoker: false,
      ),
    );

    expect(need(items, 'magnesium').upperLimit, '350 mg/day');
    expect(
      need(items, 'magnesium').upperLimitScope,
      contains('Supplemental magnesium only'),
    );
  });

  test('lab navigator keeps non-routine testing locks', () {
    final vitaminD =
        labNavigatorItems.singleWhere((item) => item.id == 'vitamin-d');
    final calcium =
        labNavigatorItems.singleWhere((item) => item.id == 'calcium');
    final iodine =
        labNavigatorItems.singleWhere((item) => item.id == 'iodine');

    expect(vitaminD.whenToTestAr, contains('لا تفحص كل شخص سليم'));
    expect(calcium.whenToTestAr, contains('لا تطلب serum calcium'));
    expect(iodine.whatToOrderAr, contains('Spot urinary iodine'));
  });
}
