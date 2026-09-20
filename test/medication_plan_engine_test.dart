import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_plan_engine.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_plan_models.dart';

void main() {
  const engine = MedicationPlanEngine();
  const routine = PatientRoutine(
    wakeMinutes: 390,
    breakfastMinutes: 480,
    lunchMinutes: 780,
    dinnerMinutes: 1200,
    bedtimeMinutes: 1380,
  );

  MedicationPlanItem item(
    String id,
    String name, {
    RegimenFrequency frequency = RegimenFrequency.onceDaily,
    TimingPreference preference = TimingPreference.auto,
    PlanItemType type = PlanItemType.medicine,
  }) {
    return MedicationPlanItem(
      id: id + '-1',
      sourceId: id,
      type: type,
      name: name,
      doseText: '1 dose',
      frequency: frequency,
      preference: preference,
    );
  }

  test('levothyroxine is scheduled before breakfast', () {
    final plan = engine.generate(
      items: [item('levothyroxine', 'Levothyroxine')],
      routine: routine,
    );

    expect(plan.doses.length, 1);
    expect(plan.doses.first.minutes, lessThan(routine.breakfastMinutes));
    expect(plan.doses.first.instructionAr, contains('30–60'));
  });

  test('levothyroxine plus calcium creates separation alert', () {
    final plan = engine.generate(
      items: [
        item('levothyroxine', 'Levothyroxine'),
        item(
          'calcium-carbonate',
          'Calcium Carbonate',
          type: PlanItemType.supplement,
        ),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any((alert) => alert.title == 'Levothyroxine separation'),
      isTrue,
    );

    final thyroid = plan.doses.firstWhere(
      (dose) => dose.medicationName == 'Levothyroxine',
    );
    final calcium = plan.doses.firstWhere(
      (dose) => dose.medicationName == 'Calcium Carbonate',
    );

    final difference = (calcium.minutes - thyroid.minutes).abs();
    expect(difference, greaterThanOrEqualTo(240));
  });

  test('tamsulosin auto timing is blocked until meal is selected', () {
    final plan = engine.generate(
      items: [item('tamsulosin', 'Tamsulosin')],
      routine: routine,
    );

    expect(plan.doses, isEmpty);
    expect(plan.alerts.any((alert) => alert.isCritical), isTrue);
  });

  test('tamsulosin dinner preference schedules 30 minutes after dinner', () {
    final plan = engine.generate(
      items: [
        item(
          'tamsulosin',
          'Tamsulosin',
          preference: TimingPreference.dinner,
        ),
      ],
      routine: routine,
    );

    expect(plan.doses.single.minutes, routine.dinnerMinutes + 30);
  });

  test('glimepiride auto timing follows breakfast', () {
    final plan = engine.generate(
      items: [item('glimepiride', 'Glimepiride')],
      routine: routine,
    );

    expect(plan.doses.single.minutes, routine.breakfastMinutes);
  });

  test('metformin once daily auto is blocked for formulation ambiguity', () {
    final plan = engine.generate(
      items: [item('metformin', 'Metformin')],
      routine: routine,
    );

    expect(plan.doses, isEmpty);
    expect(
      plan.alerts.any((alert) => alert.title.contains('formulation')),
      isTrue,
    );
  });

  test('PRN medicine has no fixed dose time', () {
    final plan = engine.generate(
      items: [
        item(
          'salbutamol-mdi',
          'Salbutamol MDI',
          frequency: RegimenFrequency.asNeeded,
        ),
      ],
      routine: routine,
    );

    expect(plan.doses, isEmpty);
    expect(plan.alerts, isNotEmpty);
  });

  test('warfarin plus vitamin K creates critical review alert', () {
    final plan = engine.generate(
      items: [
        item('warfarin', 'Warfarin'),
        item(
          'vitamin-k',
          'Vitamin K',
          type: PlanItemType.supplement,
        ),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) =>
            alert.title == 'Warfarin + vitamin K' && alert.isCritical,
      ),
      isTrue,
    );
  });

  test('every 8 hours preserves an exact 8-hour interval', () {
    final plan = engine.generate(
      items: [
        item(
          'nitrofurantoin',
          'Nitrofurantoin',
          frequency: RegimenFrequency.every8Hours,
        ),
      ],
      routine: routine,
    );

    expect(plan.doses.length, 3);
    final times = plan.doses.map((dose) => dose.minutes).toList()..sort();
    expect(times, [0, 480, 960]);
  });

  test('every 6 hours creates four evenly spaced doses', () {
    final plan = engine.generate(
      items: [
        item(
          'amoxicillin',
          'Amoxicillin',
          frequency: RegimenFrequency.every6Hours,
          preference: TimingPreference.custom,
        ),
      ],
      routine: routine,
    );

    // No custom clock was supplied by the test helper, so Auto/default timing
    // is used; the important invariant is four doses separated by 6 hours.
    expect(plan.doses.length, 4);
    final times = plan.doses.map((dose) => dose.minutes).toList()..sort();
    final gaps = <int>[
      times[1] - times[0],
      times[2] - times[1],
      times[3] - times[2],
      (times[0] + 1440) - times[3],
    ];
    expect(gaps, everyElement(360));
  });

  test('sacubitril valsartan plus lisinopril is blocked for review', () {
    final plan = engine.generate(
      items: [
        item('sacubitril-valsartan', 'Sacubitril / Valsartan'),
        item('lisinopril', 'Lisinopril'),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) =>
            alert.title == 'Sacubitril/valsartan + ACE inhibitor' &&
            alert.isCritical,
      ),
      isTrue,
    );
  });

  test('sildenafil plus nitroglycerin creates critical nitrate alert', () {
    final plan = engine.generate(
      items: [
        item(
          'sildenafil-ed',
          'Sildenafil',
          frequency: RegimenFrequency.asNeeded,
        ),
        item(
          'nitroglycerin-sublingual',
          'Nitroglycerin',
          frequency: RegimenFrequency.asNeeded,
        ),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) => alert.title == 'Sildenafil + nitrate' && alert.isCritical,
      ),
      isTrue,
    );
  });

  test('dabigatran plus diclofenac creates bleeding-risk alert', () {
    final plan = engine.generate(
      items: [
        item('dabigatran', 'Dabigatran'),
        item('diclofenac-oral', 'Diclofenac'),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) => alert.title == 'Bleeding-risk combination' && alert.isCritical,
      ),
      isTrue,
    );
  });

  test('alendronate plus morning absorption medicine requires review', () {
    final plan = engine.generate(
      items: [
        item(
          'alendronate',
          'Alendronate',
          frequency: RegimenFrequency.weekly,
        ),
        item('levothyroxine', 'Levothyroxine'),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) =>
            alert.title == 'Alendronate morning schedule conflict' &&
            alert.isCritical,
      ),
      isTrue,
    );
  });

}
