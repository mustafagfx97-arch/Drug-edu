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


  test('latanoprost auto timing follows evening bedtime anchor', () {
    final plan = engine.generate(
      items: [item('latanoprost', 'Latanoprost Eye Drops')],
      routine: routine,
    );

    expect(plan.doses.single.minutes, routine.bedtimeMinutes);
  });

  test('indication-dependent montelukast blocks automatic timing', () {
    final plan = engine.generate(
      items: [item('montelukast', 'Montelukast')],
      routine: routine,
    );

    expect(plan.doses, isEmpty);
    expect(
      plan.alerts.any(
        (alert) =>
            alert.title.contains('Timing required') && alert.isCritical,
      ),
      isTrue,
    );
  });

  test('simple once-daily atorvastatin can be organized automatically', () {
    final plan = engine.generate(
      items: [item('atorvastatin', 'Atorvastatin')],
      routine: routine,
    );

    expect(plan.doses.length, 1);
    expect(plan.doses.single.instructionAr, contains('مرة يوميًا'));
  });

  test('formulation-dependent azithromycin blocks Auto', () {
    final plan = engine.generate(
      items: [item('azithromycin', 'Azithromycin')],
      routine: routine,
    );

    expect(plan.doses, isEmpty);
    expect(plan.alerts.any((alert) => alert.isCritical), isTrue);
  });


  test('clopidogrel plus omeprazole creates interaction review alert', () {
    final plan = engine.generate(
      items: [
        item('clopidogrel', 'Clopidogrel'),
        item(
          'omeprazole',
          'Omeprazole',
          preference: TimingPreference.breakfast,
        ),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) =>
            alert.title == 'Clopidogrel + omeprazole' && alert.isCritical,
      ),
      isTrue,
    );
  });

  test('valproate plus lamotrigine creates high-risk titration alert', () {
    final plan = engine.generate(
      items: [
        item('valproic-acid', 'Valproate'),
        item('lamotrigine', 'Lamotrigine'),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) => alert.title == 'Valproate + lamotrigine' && alert.isCritical,
      ),
      isTrue,
    );
  });

  test('carbamazepine plus DOAC creates efficacy interaction alert', () {
    final plan = engine.generate(
      items: [
        item('carbamazepine', 'Carbamazepine'),
        item(
          'rivaroxaban',
          'Rivaroxaban',
          preference: TimingPreference.dinner,
        ),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) => alert.title == 'Carbamazepine + DOAC' && alert.isCritical,
      ),
      isTrue,
    );
  });

  test('two NSAIDs create duplicate-class alert', () {
    final plan = engine.generate(
      items: [
        item('ibuprofen', 'Ibuprofen'),
        item('naproxen', 'Naproxen'),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) => alert.title == 'NSAID duplication' && alert.isCritical,
      ),
      isTrue,
    );
  });

  test('NSAID plus RAS blocker plus diuretic creates AKI alert', () {
    final plan = engine.generate(
      items: [
        item('ibuprofen', 'Ibuprofen'),
        item('lisinopril', 'Lisinopril'),
        item('furosemide', 'Furosemide'),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) =>
            alert.title == 'AKI risk: NSAID + RAS blocker + diuretic' &&
            alert.isCritical,
      ),
      isTrue,
    );
  });

  test('warfarin plus fluconazole creates INR review alert', () {
    final plan = engine.generate(
      items: [
        item('warfarin', 'Warfarin'),
        item('fluconazole-oral', 'Fluconazole'),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) =>
            alert.title == 'Warfarin interaction · INR review' &&
            alert.isCritical,
      ),
      isTrue,
    );
  });


  test('omeprazole twice daily preserves both pre-meal doses', () {
    final plan = engine.generate(
      items: [
        item(
          'omeprazole',
          'Omeprazole',
          frequency: RegimenFrequency.twiceDaily,
          preference: TimingPreference.breakfast,
        ),
      ],
      routine: routine,
    );

    expect(plan.doses.length, 2);
    final times = plan.doses.map((dose) => dose.minutes).toList()..sort();
    expect(
      times,
      [routine.breakfastMinutes - 45, routine.dinnerMinutes - 45],
    );
  });


  test('Mounjaro plus oral contraceptive creates contraception alert', () {
    final plan = engine.generate(
      items: [
        item(
          'tirzepatide-mounjaro',
          'Mounjaro',
          frequency: RegimenFrequency.weekly,
        ),
        item('combined-oral-contraceptive', 'Combined oral contraceptive'),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) =>
            alert.title == 'Tirzepatide + oral hormonal contraception' &&
            alert.isCritical,
      ),
      isTrue,
    );
  });

  test('TMP-SMX plus warfarin creates critical interaction alert', () {
    final plan = engine.generate(
      items: [
        item('trimethoprim-sulfamethoxazole', 'TMP-SMX'),
        item('warfarin', 'Warfarin'),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) => alert.title == 'TMP-SMX + warfarin' && alert.isCritical,
      ),
      isTrue,
    );
  });

  test('clarithromycin plus colchicine creates critical toxicity alert', () {
    final plan = engine.generate(
      items: [
        item(
          'clarithromycin-oral',
          'Clarithromycin',
          preference: TimingPreference.breakfast,
        ),
        item(
          'colchicine',
          'Colchicine',
          preference: TimingPreference.breakfast,
        ),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) =>
            alert.title == 'Clarithromycin + colchicine' && alert.isCritical,
      ),
      isTrue,
    );
  });

  test('lithium plus NSAID creates critical lithium toxicity alert', () {
    final plan = engine.generate(
      items: [
        item(
          'lithium',
          'Lithium',
          preference: TimingPreference.breakfast,
        ),
        item('ibuprofen', 'Ibuprofen'),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) => alert.title == 'Lithium + NSAID' && alert.isCritical,
      ),
      isTrue,
    );
  });

  test('tadalafil plus nitroglycerin creates critical nitrate alert', () {
    final plan = engine.generate(
      items: [
        item(
          'tadalafil',
          'Tadalafil',
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
        (alert) => alert.title == 'Tadalafil + nitrate' && alert.isCritical,
      ),
      isTrue,
    );
  });

  test('risedronate plus calcium requires product-specific review', () {
    final plan = engine.generate(
      items: [
        item(
          'risedronate',
          'Risedronate',
          frequency: RegimenFrequency.weekly,
          preference: TimingPreference.breakfast,
        ),
        item(
          'calcium-carbonate',
          'Calcium Carbonate',
          type: PlanItemType.supplement,
        ),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) => alert.title == 'Risedronate + minerals' && alert.isCritical,
      ),
      isTrue,
    );
  });

  test('valsartan plus sacubitril valsartan flags duplicate ARB exposure', () {
    final plan = engine.generate(
      items: [
        item('valsartan', 'Valsartan'),
        item('sacubitril-valsartan', 'Sacubitril / Valsartan'),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) =>
            alert.title == 'Duplicate valsartan exposure' && alert.isCritical,
      ),
      isTrue,
    );
  });


  test('multiple albuterol routes create duplicate bronchodilator alert', () {
    final plan = engine.generate(
      items: [
        item('salbutamol-mdi', 'Salbutamol MDI'),
        item(
          'albuterol-nebulizer-0083',
          'Albuterol Nebulizer',
          frequency: RegimenFrequency.asNeeded,
        ),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) =>
            alert.title == 'Duplicate albuterol/salbutamol routes' &&
            alert.isCritical,
      ),
      isTrue,
    );
  });

  test('HandiHaler plus Respimat flags duplicate tiotropium', () {
    final plan = engine.generate(
      items: [
        item('tiotropium-capsule-inhalation', 'Tiotropium HandiHaler'),
        item('tiotropium-respimat', 'Tiotropium Respimat'),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) =>
            alert.title == 'Duplicate tiotropium devices' &&
            alert.isCritical,
      ),
      isTrue,
    );
  });

  test('multiple inhaled corticosteroid products prompt duplication review', () {
    final plan = engine.generate(
      items: [
        item('budesonide-nebulizer', 'Budesonide Nebulizer'),
        item('fluticasone-hfa', 'Fluticasone HFA'),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) =>
            alert.title == 'Inhaled corticosteroid duplication review',
      ),
      isTrue,
    );
  });

  test('ipratropium plus tiotropium prompts anticholinergic overlap review', () {
    final plan = engine.generate(
      items: [
        item('ipratropium-nebulizer', 'Ipratropium Nebulizer'),
        item('tiotropium-respimat', 'Tiotropium Respimat'),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) => alert.title == 'Inhaled anticholinergic overlap',
      ),
      isTrue,
    );
  });


  test('cefdinir plus oral iron creates separation alert', () {
    final plan = engine.generate(
      items: [
        item('cefdinir-pediatric-suspension', 'Cefdinir Suspension'),
        item(
          'oral-iron-salts',
          'Iron',
          type: PlanItemType.supplement,
        ),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) => alert.title == 'Cefdinir + iron' && alert.isCritical,
      ),
      isTrue,
    );
  });

  test('ibandronate plus calcium requires 60-minute mineral separation', () {
    final plan = engine.generate(
      items: [
        item(
          'ibandronate-monthly',
          'Ibandronate',
          frequency: RegimenFrequency.monthly,
          preference: TimingPreference.breakfast,
        ),
        item(
          'calcium-carbonate',
          'Calcium Carbonate',
          type: PlanItemType.supplement,
        ),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) => alert.title == 'Ibandronate + minerals' && alert.isCritical,
      ),
      isTrue,
    );
  });

  test('bismuth subsalicylate plus anticoagulant creates bleeding review', () {
    final plan = engine.generate(
      items: [
        item(
          'bismuth-subsalicylate',
          'Bismuth Subsalicylate',
          frequency: RegimenFrequency.asNeeded,
        ),
        item('apixaban', 'Apixaban'),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) =>
            alert.title == 'Bismuth subsalicylate + bleeding-risk therapy' &&
            alert.isCritical,
      ),
      isTrue,
    );
  });

  test('JAK inhibitor plus biologic DMARD creates critical review', () {
    final plan = engine.generate(
      items: [
        item('upadacitinib', 'Upadacitinib'),
        item(
          'etanercept',
          'Etanercept',
          preference: TimingPreference.breakfast,
        ),
      ],
      routine: routine,
    );

    expect(
      plan.alerts.any(
        (alert) =>
            alert.title == 'JAK inhibitor + biologic immunomodulator' &&
            alert.isCritical,
      ),
      isTrue,
    );
  });

}
