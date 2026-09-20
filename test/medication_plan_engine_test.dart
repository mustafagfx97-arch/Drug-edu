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
}
