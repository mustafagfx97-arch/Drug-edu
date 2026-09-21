import 'medication_plan_models.dart';
import 'medication_timing_rules.dart';

class MedicationPlanEngine {
  const MedicationPlanEngine();

  GeneratedMedicationPlan generate({
    required List<MedicationPlanItem> items,
    required PatientRoutine routine,
  }) {
    final doses = <ScheduledDose>[];
    final alerts = <PlanAlert>[];

    final ids = items.map((item) => item.sourceId).toSet();

    for (final item in items) {
      final isCustom = item.sourceId.startsWith('custom-');
      final rule = medicationTimingRules[item.sourceId] ??
          const MedicationTimingRule(
            instructionAr:
                'اتبع توقيت الوصفة. الأوقات المعروضة هنا للتنظيم فقط إذا لم يحدد الطبيب وقتًا معينًا.',
          );

      if (isCustom) {
        alerts.add(
          PlanAlert(
            title: item.name + ' · Verify administration',
            message:
                'هذا الدواء غير موجود بعد في قاعدة القواعد الموثقة. الجدول ينظم التكرار فقط؛ راجع علاقته بالطعام والتداخلات قبل اعتماد البطاقة.',
            isCritical: true,
          ),
        );
      }

      if (item.frequency == RegimenFrequency.monthly ||
          item.frequency == RegimenFrequency.every13Weeks ||
          item.frequency == RegimenFrequency.every6Months) {
        final interval = switch (item.frequency) {
          RegimenFrequency.monthly => 'شهري',
          RegimenFrequency.every13Weeks => 'كل 13 أسبوعًا',
          RegimenFrequency.every6Months => 'كل 6 أشهر',
          _ => '',
        };
        alerts.add(
          PlanAlert(
            title: item.name + ' · Calendar regimen',
            message:
                'هذا العلاج ' + interval + ' وليس جرعة يومية. لا ينشئ التطبيق ساعة متكررة له؛ ثبّت تاريخ الجرعة/الزيارة حسب الوصفة. ' +
                rule.instructionAr,
            isCritical: true,
          ),
        );
        continue;
      }

      if (item.frequency == RegimenFrequency.asNeeded) {
        alerts.add(
          PlanAlert(
            title: item.name,
            message:
                'دواء عند الحاجة: لا يوضع له وقت ثابت. اتبع السبب والحد الأقصى المكتوب في الوصفة أو على المنتج.',
          ),
        );
        continue;
      }

      final mealChoiceProvided =
          item.preference == TimingPreference.breakfast ||
          item.preference == TimingPreference.lunch ||
          item.preference == TimingPreference.dinner;

      if (rule.requiresMealChoice &&
          item.preference == TimingPreference.auto) {
        alerts.add(
          PlanAlert(
            title: item.name + ' · Review required',
            message:
                'اختر الوجبة التي سيؤخذ بعدها الدواء باستمرار حتى يستطيع التطبيق وضع وقت صحيح بدل افتراض وجبة من نفسه.',
            isCritical: true,
          ),
        );
        continue;
      }

      if (!rule.autoScheduleSafe &&
          item.preference == TimingPreference.auto) {
        alerts.add(
          PlanAlert(
            title: item.name + ' · Timing required',
            message:
                'تعليمات هذا الدواء تختلف حسب القوة أو formulation/indication. اختر توقيت الوصفة يدويًا بدل Auto.',
            isCritical: true,
          ),
        );
        continue;
      }

      if (item.sourceId == 'metformin' &&
          item.frequency == RegimenFrequency.onceDaily &&
          item.preference == TimingPreference.auto) {
        alerts.add(
          const PlanAlert(
            title: 'Metformin · formulation required',
            message:
                'مرة يوميًا قد تكون تعليمات IR وER مختلفة. اختر الوجبة/التوقيت المكتوب في الوصفة قبل إنشاء الجدول.',
            isCritical: true,
          ),
        );
        continue;
      }

      if (rule.requiresMealChoice &&
          !mealChoiceProvided &&
          item.preference != TimingPreference.custom) {
        alerts.add(
          PlanAlert(
            title: item.name + ' · Meal required',
            message:
                'اختر Breakfast أو Lunch أو Dinner لأن الدواء مرتبط بوجبة ثابتة.',
            isCritical: true,
          ),
        );
        continue;
      }

      var times = _timesFor(item, routine, rule);

      if (item.sourceId == 'oral-iron-salts' &&
          ids.contains('levothyroxine')) {
        times = _replaceClosest(
          times,
          routine.lunchMinutes - 60,
          count: times.length,
        );
      }

      if ((item.sourceId == 'calcium-carbonate' ||
              item.sourceId == 'calcium-citrate') &&
          ids.contains('levothyroxine') &&
          times.isNotEmpty) {
        times = _replaceClosest(
          times,
          routine.dinnerMinutes,
          count: times.length,
        );
      }

      for (final minutes in times) {
        doses.add(
          ScheduledDose(
            itemId: item.id,
            medicationName: item.name,
            doseText: item.doseText,
            minutes: _normalize(minutes),
            instructionAr: rule.instructionAr,
            isSuggested:
                item.preference == TimingPreference.auto ||
                item.frequency == RegimenFrequency.every6Hours ||
                item.frequency == RegimenFrequency.every8Hours ||
                item.frequency == RegimenFrequency.every12Hours,
            dayLabel: item.frequency == RegimenFrequency.weekly
                ? _weekdayAr(item.weekday ?? DateTime.monday)
                : '',
          ),
        );
      }

      if (item.frequency == RegimenFrequency.weekly) {
        final day = item.weekday == null
            ? 'يوم ثابت من الأسبوع'
            : _weekdayAr(item.weekday!);
        alerts.add(
          PlanAlert(
            title: item.name + ' · Weekly',
            message: 'الجرعة أسبوعية: ' +
                day +
                '. ثبّت نفس اليوم حسب الوصفة.',
            isCritical: item.sourceId == 'methotrexate-rheumatology',
          ),
        );
      }
    }

    _addInteractionAlerts(items, alerts);

    doses.sort((a, b) => a.minutes.compareTo(b.minutes));

    return GeneratedMedicationPlan(doses: doses, alerts: alerts);
  }

  List<int> _timesFor(
    MedicationPlanItem item,
    PatientRoutine routine,
    MedicationTimingRule rule,
  ) {
    if (item.preference == TimingPreference.custom &&
        item.customMinutes != null) {
      return _expandFromBase(item.frequency, item.customMinutes!);
    }

    if (item.frequency == RegimenFrequency.every6Hours ||
        item.frequency == RegimenFrequency.every8Hours ||
        item.frequency == RegimenFrequency.every12Hours) {
      final preferred = _preferredBase(item.preference, routine);
      final base = preferred ??
          switch (rule.anchor) {
            'before-breakfast' => routine.breakfastMinutes - 45,
            'before-meal' => routine.breakfastMinutes - 45,
            'breakfast' => routine.breakfastMinutes,
            'morning' => routine.wakeMinutes + 60,
            'bedtime' => routine.bedtimeMinutes,
            'with-meal' => routine.breakfastMinutes,
            'empty-stomach' => routine.breakfastMinutes - 60,
            _ => routine.wakeMinutes,
          };
      return _expandFromBase(item.frequency, base);
    }

    if (rule.anchor == 'after-selected-meal' &&
        item.preference != TimingPreference.custom) {
      return [_selectedMeal(item.preference, routine) + 30];
    }

    if (rule.anchor == 'before-breakfast') {
      return [routine.breakfastMinutes - 45];
    }

    if (rule.anchor == 'before-meal') {
      if (item.frequency == RegimenFrequency.onceDaily) {
        switch (item.preference) {
          case TimingPreference.breakfast:
          case TimingPreference.lunch:
          case TimingPreference.dinner:
            return [_selectedMeal(item.preference, routine) - 45];
          case TimingPreference.morning:
            return [routine.breakfastMinutes - 45];
          case TimingPreference.bedtime:
            return [routine.dinnerMinutes - 45];
          case TimingPreference.auto:
          case TimingPreference.custom:
            break;
        }
      }
      return _beforeMealTimes(item.frequency, routine);
    }

    if (rule.anchor == 'with-meal') {
      if (item.frequency == RegimenFrequency.onceDaily) {
        switch (item.preference) {
          case TimingPreference.breakfast:
          case TimingPreference.lunch:
          case TimingPreference.dinner:
            return [_selectedMeal(item.preference, routine)];
          case TimingPreference.morning:
            return [routine.breakfastMinutes];
          case TimingPreference.bedtime:
            return [routine.dinnerMinutes];
          case TimingPreference.auto:
          case TimingPreference.custom:
            break;
        }
      }
      return _mealTimes(item.frequency, routine);
    }

    if (rule.anchor == 'empty-stomach') {
      if (item.frequency == RegimenFrequency.onceDaily) {
        switch (item.preference) {
          case TimingPreference.breakfast:
          case TimingPreference.lunch:
          case TimingPreference.dinner:
            return [_selectedMeal(item.preference, routine) - 60];
          case TimingPreference.morning:
            return [routine.breakfastMinutes - 60];
          case TimingPreference.bedtime:
            return [routine.bedtimeMinutes];
          case TimingPreference.auto:
          case TimingPreference.custom:
            break;
        }
      }
      return _emptyStomachTimes(item.frequency, routine);
    }

    final preferred = _preferredBase(item.preference, routine);
    if (preferred != null) {
      return _expandFromBase(item.frequency, preferred);
    }

    switch (rule.anchor) {
      case 'breakfast':
        return [routine.breakfastMinutes];
      case 'morning':
        return _expandFromBase(
          item.frequency,
          routine.wakeMinutes + 60,
        );
      case 'bedtime':
        return [routine.bedtimeMinutes];
      case 'weekly':
        return [routine.breakfastMinutes + 60];
      default:
        return _defaultTimes(item.frequency, routine);
    }
  }

  List<int> _beforeMealTimes(
    RegimenFrequency frequency,
    PatientRoutine routine,
  ) {
    switch (frequency) {
      case RegimenFrequency.onceDaily:
        return [routine.breakfastMinutes - 45];
      case RegimenFrequency.twiceDaily:
        return [
          routine.breakfastMinutes - 45,
          routine.dinnerMinutes - 45,
        ];
      case RegimenFrequency.threeTimesDaily:
        return [
          routine.breakfastMinutes - 45,
          routine.lunchMinutes - 45,
          routine.dinnerMinutes - 45,
        ];
      case RegimenFrequency.fourTimesDaily:
        return [
          routine.breakfastMinutes - 45,
          routine.lunchMinutes - 45,
          routine.dinnerMinutes - 45,
          routine.bedtimeMinutes,
        ];
      case RegimenFrequency.every12Hours:
        return [
          routine.breakfastMinutes - 45,
          routine.breakfastMinutes - 45 + 720,
        ];
      case RegimenFrequency.every8Hours:
        return [
          routine.breakfastMinutes - 45,
          routine.breakfastMinutes - 45 + 480,
          routine.breakfastMinutes - 45 + 960,
        ];
      case RegimenFrequency.every6Hours:
        return [
          routine.breakfastMinutes - 45,
          routine.breakfastMinutes - 45 + 360,
          routine.breakfastMinutes - 45 + 720,
          routine.breakfastMinutes - 45 + 1080,
        ];
      case RegimenFrequency.morning:
        return [routine.breakfastMinutes - 45];
      case RegimenFrequency.bedtime:
        return [routine.bedtimeMinutes];
      case RegimenFrequency.weekly:
        return [routine.breakfastMinutes - 45];
      case RegimenFrequency.monthly:
      case RegimenFrequency.every13Weeks:
      case RegimenFrequency.every6Months:
      case RegimenFrequency.asNeeded:
        return const [];
    }
  }

  List<int> _mealTimes(RegimenFrequency frequency, PatientRoutine routine) {
    switch (frequency) {
      case RegimenFrequency.onceDaily:
        return [routine.dinnerMinutes];
      case RegimenFrequency.twiceDaily:
        return [routine.breakfastMinutes, routine.dinnerMinutes];
      case RegimenFrequency.threeTimesDaily:
        return [
          routine.breakfastMinutes,
          routine.lunchMinutes,
          routine.dinnerMinutes,
        ];
      case RegimenFrequency.fourTimesDaily:
        return [
          routine.breakfastMinutes,
          routine.lunchMinutes,
          routine.dinnerMinutes,
          routine.bedtimeMinutes,
        ];
      case RegimenFrequency.every12Hours:
        return [routine.breakfastMinutes, routine.breakfastMinutes + 720];
      case RegimenFrequency.every8Hours:
        return [
          routine.breakfastMinutes,
          routine.breakfastMinutes + 480,
          routine.breakfastMinutes + 960,
        ];
      case RegimenFrequency.every6Hours:
        return [
          routine.breakfastMinutes,
          routine.breakfastMinutes + 360,
          routine.breakfastMinutes + 720,
          routine.breakfastMinutes + 1080,
        ];
      case RegimenFrequency.morning:
        return [routine.breakfastMinutes];
      case RegimenFrequency.bedtime:
        return [routine.bedtimeMinutes];
      case RegimenFrequency.weekly:
        return [routine.breakfastMinutes];
      case RegimenFrequency.monthly:
      case RegimenFrequency.every13Weeks:
      case RegimenFrequency.every6Months:
      case RegimenFrequency.asNeeded:
        return const [];
    }
  }

  List<int> _emptyStomachTimes(
    RegimenFrequency frequency,
    PatientRoutine routine,
  ) {
    final first = routine.breakfastMinutes - 60;
    switch (frequency) {
      case RegimenFrequency.onceDaily:
        return [first];
      case RegimenFrequency.twiceDaily:
        return [first, routine.dinnerMinutes - 120];
      case RegimenFrequency.threeTimesDaily:
        return [
          routine.breakfastMinutes - 60,
          routine.lunchMinutes - 60,
          routine.dinnerMinutes - 60,
        ];
      case RegimenFrequency.fourTimesDaily:
        return [
          routine.breakfastMinutes - 60,
          routine.lunchMinutes - 60,
          routine.dinnerMinutes - 60,
          routine.bedtimeMinutes,
        ];
      case RegimenFrequency.every12Hours:
        return [first, first + 720];
      case RegimenFrequency.every8Hours:
        return [first, first + 480, first + 960];
      case RegimenFrequency.every6Hours:
        return [first, first + 360, first + 720, first + 1080];
      case RegimenFrequency.morning:
        return [first];
      case RegimenFrequency.bedtime:
        return [routine.bedtimeMinutes];
      case RegimenFrequency.weekly:
        return [first];
      case RegimenFrequency.monthly:
      case RegimenFrequency.every13Weeks:
      case RegimenFrequency.every6Months:
      case RegimenFrequency.asNeeded:
        return const [];
    }
  }

  List<int> _defaultTimes(
    RegimenFrequency frequency,
    PatientRoutine routine,
  ) {
    switch (frequency) {
      case RegimenFrequency.onceDaily:
        return [routine.breakfastMinutes + 60];
      case RegimenFrequency.twiceDaily:
        return [routine.breakfastMinutes, routine.dinnerMinutes];
      case RegimenFrequency.threeTimesDaily:
        return [
          routine.breakfastMinutes,
          routine.lunchMinutes,
          routine.dinnerMinutes,
        ];
      case RegimenFrequency.fourTimesDaily:
        return [
          routine.breakfastMinutes,
          routine.lunchMinutes,
          routine.dinnerMinutes,
          routine.bedtimeMinutes,
        ];
      case RegimenFrequency.every12Hours:
        return [routine.wakeMinutes, routine.wakeMinutes + 720];
      case RegimenFrequency.every8Hours:
        return [
          routine.wakeMinutes,
          routine.wakeMinutes + 480,
          routine.wakeMinutes + 960,
        ];
      case RegimenFrequency.every6Hours:
        return [
          routine.wakeMinutes,
          routine.wakeMinutes + 360,
          routine.wakeMinutes + 720,
          routine.wakeMinutes + 1080,
        ];
      case RegimenFrequency.morning:
        return [routine.wakeMinutes + 60];
      case RegimenFrequency.bedtime:
        return [routine.bedtimeMinutes];
      case RegimenFrequency.weekly:
        return [routine.breakfastMinutes + 60];
      case RegimenFrequency.monthly:
      case RegimenFrequency.every13Weeks:
      case RegimenFrequency.every6Months:
      case RegimenFrequency.asNeeded:
        return const [];
    }
  }

  List<int> _expandFromBase(RegimenFrequency frequency, int base) {
    switch (frequency) {
      case RegimenFrequency.onceDaily:
      case RegimenFrequency.morning:
      case RegimenFrequency.bedtime:
      case RegimenFrequency.weekly:
        return [base];
      case RegimenFrequency.twiceDaily:
      case RegimenFrequency.every12Hours:
        return [base, base + 720];
      case RegimenFrequency.threeTimesDaily:
      case RegimenFrequency.every8Hours:
        return [base, base + 480, base + 960];
      case RegimenFrequency.fourTimesDaily:
      case RegimenFrequency.every6Hours:
        return [base, base + 360, base + 720, base + 1080];
      case RegimenFrequency.monthly:
      case RegimenFrequency.every13Weeks:
      case RegimenFrequency.every6Months:
      case RegimenFrequency.asNeeded:
        return const [];
    }
  }

  int? _preferredBase(TimingPreference preference, PatientRoutine routine) {
    switch (preference) {
      case TimingPreference.auto:
        return null;
      case TimingPreference.morning:
        return routine.wakeMinutes + 60;
      case TimingPreference.breakfast:
        return routine.breakfastMinutes;
      case TimingPreference.lunch:
        return routine.lunchMinutes;
      case TimingPreference.dinner:
        return routine.dinnerMinutes;
      case TimingPreference.bedtime:
        return routine.bedtimeMinutes;
      case TimingPreference.custom:
        return null;
    }
  }

  int _selectedMeal(TimingPreference preference, PatientRoutine routine) {
    switch (preference) {
      case TimingPreference.breakfast:
        return routine.breakfastMinutes;
      case TimingPreference.lunch:
        return routine.lunchMinutes;
      case TimingPreference.dinner:
        return routine.dinnerMinutes;
      default:
        return routine.dinnerMinutes;
    }
  }

  List<int> _replaceClosest(List<int> current, int first, {required int count}) {
    if (count <= 1) return [first];
    if (count == 2) return [first, first + 480];
    return [first, first + 300, first + 600];
  }

  void _addInteractionAlerts(
    List<MedicationPlanItem> items,
    List<PlanAlert> alerts,
  ) {
    final ids = items.map((item) => item.sourceId).toSet();

    final counts = <String, int>{};
    for (final item in items) {
      counts[item.sourceId] = (counts[item.sourceId] ?? 0) + 1;
    }
    for (final entry in counts.entries) {
      if (entry.value > 1 && !entry.key.startsWith('custom-')) {
        final duplicateName =
            items.firstWhere((item) => item.sourceId == entry.key).name;
        alerts.add(
          PlanAlert(
            title: 'Possible duplicate: ' + duplicateName,
            message:
                'تمت إضافة نفس الدواء/المكمل أكثر من مرة. تأكد أن هذا مقصود وليس تكرارًا غير ضروري.',
            isCritical: true,
          ),
        );
      }
    }

    if (ids.contains('levothyroxine')) {
      final blockers = <String>[
        if (ids.contains('oral-iron-salts')) 'الحديد',
        if (ids.contains('calcium-carbonate')) 'Calcium Carbonate',
        if (ids.contains('calcium-citrate')) 'Calcium Citrate',
        if (ids.contains('magnesium-gluconate') ||
            ids.contains('magnesium-citrate') ||
            ids.contains('magnesium-oxide')) 'Magnesium',
        if (ids.contains('multivitamin-mineral')) 'Multivitamin/Mineral',
        if (ids.contains('prenatal-combination')) 'Prenatal vitamin',
      ];
      if (blockers.isNotEmpty) {
        alerts.add(
          PlanAlert(
            title: 'Levothyroxine separation',
            message:
                'افصل levothyroxine عن ' +
                blockers.join('، ') +
                ' أربع ساعات على الأقل. التطبيق يحاول ترتيب العناصر المعروفة تلقائيًا، لكن راجع أي multivitamin لمعرفة مكوناته.',
            isCritical: true,
          ),
        );
      }
    }

    if (ids.contains('oral-iron-salts') &&
        (ids.contains('calcium-carbonate') ||
            ids.contains('calcium-citrate'))) {
      alerts.add(
        const PlanAlert(
          title: 'Iron + calcium',
          message:
              'لا تأخذ الحديد والكالسيوم في نفس الوقت؛ اترك بينهما ساعتين على الأقل ما لم تكن تعليمات المنتج مختلفة.',
        ),
      );
    }

    if (ids.contains('zinc') && ids.contains('doxycycline')) {
      alerts.add(
        const PlanAlert(
          title: 'Doxycycline + zinc',
          message:
              'يحتاجان فصلًا زمنيًا. قاعدة الزنك العامة: المضاد قبل الزنك بساعتين على الأقل أو بعده بـ4–6 ساعات؛ راجع تعليمات منتج doxycycline أيضًا.',
          isCritical: true,
        ),
      );
    }

    if (ids.contains('warfarin') && ids.contains('vitamin-k')) {
      alerts.add(
        const PlanAlert(
          title: 'Warfarin + vitamin K',
          message:
              'هذه ليست مشكلة توقيت فقط. لا تبدأ/توقف vitamin K أو تغيّر الكمية بشكل كبير دون تنسيق مع متابعة INR.',
          isCritical: true,
        ),
      );
    }

    final hasAnticoagulant = ids.contains('warfarin') ||
        ids.contains('apixaban') ||
        ids.contains('rivaroxaban') ||
        ids.contains('dabigatran') ||
        ids.contains('enoxaparin');
    final hasNsaid = ids.contains('ibuprofen') ||
        ids.contains('naproxen') ||
        ids.contains('celecoxib') ||
        ids.contains('diclofenac-oral');
    if (hasAnticoagulant && hasNsaid) {
      alerts.add(
        const PlanAlert(
          title: 'Bleeding-risk combination',
          message:
              'وجود مميع دم مع NSAID قد يزيد خطر النزف. فصل الوقت لا يلغي التداخل؛ راجع ضرورة الجمع والبديل الأنسب.',
          isCritical: true,
        ),
      );
    }

    if (ids.contains('sacubitril-valsartan') && ids.contains('lisinopril')) {
      alerts.add(
        const PlanAlert(
          title: 'Sacubitril/valsartan + ACE inhibitor',
          message:
              'لا يُجمع sacubitril/valsartan مع ACE inhibitor مثل lisinopril. يلزم فاصل 36 ساعة عند التحويل بينهما؛ لا تحاول حل المشكلة بتغيير وقت الجرعات فقط.',
          isCritical: true,
        ),
      );
    }

    if (ids.contains('sildenafil-ed') &&
        ids.contains('nitroglycerin-sublingual')) {
      alerts.add(
        const PlanAlert(
          title: 'Sildenafil + nitrate',
          message:
              'الجمع مع nitroglycerin/nitrates ممنوع بسبب خطر هبوط ضغط شديد. إذا حدث ألم صدر بعد sildenafil يجب إبلاغ الطوارئ بوقت آخر جرعة، وليس أخذ nitroglycerin من النفس.',
          isCritical: true,
        ),
      );
    }

    if (ids.contains('amiodarone-oral') &&
        (ids.contains('warfarin') || ids.contains('digoxin'))) {
      alerts.add(
        const PlanAlert(
          title: 'Amiodarone interaction review',
          message:
              'amiodarone قد يرفع تأثير/تركيز warfarin أو digoxin. هذه ليست مشكلة توقيت فقط وتحتاج مراجعة الجرعات والمراقبة السريرية.',
          isCritical: true,
        ),
      );
    }

    if ((<String>{'carvedilol', 'metoprolol', 'bisoprolol'}
            .where(ids.contains)
            .length >
        1) ||
        (ids.contains('diltiazem-er') &&
            (ids.contains('metoprolol') ||
                ids.contains('carvedilol') ||
                ids.contains('bisoprolol')))) {
      alerts.add(
        const PlanAlert(
          title: 'Heart-rate lowering combination',
          message:
              'يوجد أكثر من دواء يخفض النبض/الضغط. قد يكون الجمع مقصودًا في حالات محددة لكنه يحتاج مراجعة للنبض والضغط والأعراض؛ لا تعتمد على فصل الوقت وحده.',
          isCritical: true,
        ),
      );
    }

    final ciproMinerals = ids.contains('oral-iron-salts') ||
        ids.contains('calcium-carbonate') ||
        ids.contains('calcium-citrate') ||
        ids.contains('magnesium-gluconate') ||
        ids.contains('magnesium-citrate') ||
        ids.contains('magnesium-oxide') ||
        ids.contains('zinc') ||
        ids.contains('multivitamin-mineral') ||
        ids.contains('prenatal-combination');
    if (ids.contains('ciprofloxacin-oral') && ciproMinerals) {
      alerts.add(
        const PlanAlert(
          title: 'Ciprofloxacin + minerals',
          message:
              'الحديد والكالسيوم والزنك ومضادات الحموضة/المنتجات المعدنية قد تقلل امتصاص ciprofloxacin. استخدم فاصل المنتج الموثق ولا تضعها في نفس وقت الجرعة.',
          isCritical: true,
        ),
      );
    }

    final alendronateMorningConflict = ids.contains('levothyroxine') ||
        ids.contains('oral-iron-salts') ||
        ids.contains('calcium-carbonate') ||
        ids.contains('calcium-citrate') ||
        ids.contains('magnesium-gluconate') ||
        ids.contains('magnesium-citrate') ||
        ids.contains('magnesium-oxide') ||
        ids.contains('multivitamin-mineral') ||
        ids.contains('prenatal-combination');
    if (ids.contains('alendronate') && alendronateMorningConflict) {
      alerts.add(
        const PlanAlert(
          title: 'Alendronate morning schedule conflict',
          message:
              'alendronate يجب أن يُؤخذ منفردًا عند الاستيقاظ مع ماء فقط ثم الانتظار قبل الطعام/الأدوية. وجود levothyroxine أو معادن صباحية يحتاج ترتيبًا يدويًا؛ لا تعتمد الجدولة التلقائية وحدها.',
          isCritical: true,
        ),
      );
    }

    if (ids.contains('sucralfate') && ids.length > 1) {
      alerts.add(
        const PlanAlert(
          title: 'Sucralfate separation review',
          message:
              'sucralfate قد يقلل امتصاص أدوية متعددة. الفاصل الزمني ليس رقمًا واحدًا لكل الأدوية؛ راجع كل دواء في القائمة قبل اعتماد الجدول النهائي.',
        ),
      );
    }

    final anticoagulants = <String>{
      'warfarin',
      'apixaban',
      'rivaroxaban',
      'dabigatran',
      'enoxaparin',
    }.where(ids.contains).toList();
    if (anticoagulants.length > 1) {
      alerts.add(
        const PlanAlert(
          title: 'More than one anticoagulant',
          message:
              'يوجد أكثر من مميع دم في القائمة. قد يكون الجمع مقصودًا لفترة انتقالية مثل bridging، لكنه يحتاج خطة واضحة؛ فصل الأوقات لا يقلل خطر النزف.',
          isCritical: true,
        ),
      );
    }

    final nsaids = <String>{
      'ibuprofen',
      'ibuprofen-pediatric-liquid',
      'naproxen',
      'celecoxib',
      'diclofenac-oral',
    }.where(ids.contains).toList();
    if (nsaids.length > 1) {
      alerts.add(
        const PlanAlert(
          title: 'NSAID duplication',
          message:
              'يوجد أكثر من NSAID. الجمع الروتيني بينها يزيد مخاطر المعدة والكلى والقلب ولا تصبح آمنة بمجرد فصل الجرعات.',
          isCritical: true,
        ),
      );
    }

    final hasAntiplatelet =
        ids.contains('clopidogrel') || ids.contains('aspirin');
    if (hasAntiplatelet &&
        (anticoagulants.isNotEmpty || nsaids.isNotEmpty)) {
      alerts.add(
        const PlanAlert(
          title: 'Antithrombotic / bleeding-risk stacking',
          message:
              'وجود clopidogrel/antiplatelet مع مميع دم أو NSAID يرفع خطر النزف. قد يكون الجمع مقصودًا في بعض حالات القلب، لكنه يحتاج مراجعة الخطة وليس تعديل الساعة فقط.',
          isCritical: true,
        ),
      );
    }

    if (ids.contains('clopidogrel') && ids.contains('omeprazole')) {
      alerts.add(
        const PlanAlert(
          title: 'Clopidogrel + omeprazole',
          message:
              'omeprazole قد يقلل تفعيل clopidogrel عبر CYP2C19. فصل الوقت لا يحل التداخل؛ راجع الحاجة والبديل المناسب مع الصيدلي/الطبيب.',
          isCritical: true,
        ),
      );
    }

    if (ids.contains('spironolactone') &&
        (ids.contains('lisinopril') ||
            ids.contains('losartan') ||
            ids.contains('valsartan') ||
            ids.contains('sacubitril-valsartan'))) {
      alerts.add(
        const PlanAlert(
          title: 'Potassium / renal monitoring',
          message:
              'spironolactone مع ACEI/ARB/ARNI قد يكون مقصودًا خصوصًا في فشل القلب، لكنه يزيد خطر ارتفاع البوتاسيوم وتدهور وظائف الكلى. راجع K⁺/renal monitoring ولا تضف بدائل ملح أو بوتاسيوم من نفسك.',
        ),
      );
    }

    final hasPotassiumRaisingMedicine =
        ids.contains('spironolactone') ||
        ids.contains('lisinopril') ||
        ids.contains('losartan') ||
        ids.contains('valsartan') ||
        ids.contains('sacubitril-valsartan');
    if (ids.contains('potassium-supplements') &&
        hasPotassiumRaisingMedicine) {
      alerts.add(
        const PlanAlert(
          title: 'Potassium supplement + potassium-raising therapy',
          message:
              'مكملات البوتاسيوم/بدائل الملح المحتوية على potassium مع ACEI/ARB/ARNI أو spironolactone قد ترفع K⁺ إلى مستوى خطير. فصل الوقت لا يحل التداخل؛ راجع serum K⁺ ووظائف الكلى والحاجة الفعلية للمكمل.',
          isCritical: true,
        ),
      );
    }

    final hasRasDrug = ids.contains('lisinopril') ||
        ids.contains('losartan') ||
        ids.contains('valsartan') ||
        ids.contains('sacubitril-valsartan');
    final hasDiuretic = ids.contains('furosemide') ||
        ids.contains('hydrochlorothiazide') ||
        ids.contains('spironolactone');
    if (nsaids.isNotEmpty && hasRasDrug && hasDiuretic) {
      alerts.add(
        const PlanAlert(
          title: 'AKI risk: NSAID + RAS blocker + diuretic',
          message:
              'هذه التوليفة قد تزيد خطر تدهور الكلى/الجفاف، خصوصًا أثناء المرض أو نقص السوائل. لا يكفي فصل الجرعات؛ راجع ضرورة NSAID وخطة وظائف الكلى والسوائل.',
          isCritical: true,
        ),
      );
    }

    final hasQtRiskPartner = ids.contains('azithromycin') ||
        ids.contains('clarithromycin-oral') ||
        ids.contains('ciprofloxacin-oral') ||
        ids.contains('fluconazole-oral') ||
        ids.contains('ondansetron-oral');
    if (ids.contains('amiodarone-oral') && hasQtRiskPartner) {
      alerts.add(
        const PlanAlert(
          title: 'QT / arrhythmia interaction review',
          message:
              'amiodarone مع دواء آخر قد يطيل QT يحتاج مراجعة ECG والإلكتروليتات والبدائل حسب الحالة. فصل وقت الجرعات لا يلغي الخطر.',
          isCritical: true,
        ),
      );
    }

    if (ids.contains('digoxin') &&
        (ids.contains('metoprolol') ||
            ids.contains('carvedilol') ||
            ids.contains('bisoprolol') ||
            ids.contains('diltiazem-er'))) {
      alerts.add(
        const PlanAlert(
          title: 'Digoxin + rate-slowing medicine',
          message:
              'الجمع قد يكون مقصودًا لكنه قد يزيد بطء النبض أو اضطراب التوصيل. راجع النبض، الأعراض وخطة المراقبة؛ فصل الجرعات لا يمنع التأثير المشترك.',
        ),
      );
    }

    if (ids.contains('valproic-acid') && ids.contains('lamotrigine')) {
      alerts.add(
        const PlanAlert(
          title: 'Valproate + lamotrigine',
          message:
              'valproate يرفع تعرض lamotrigine ويزيد خطر الطفح الخطير؛ جرعة وبداية/تصعيد lamotrigine يجب أن تتبع نظامًا خاصًا. لا تستخدم جدول جرعات عادي لهذه التوليفة.',
          isCritical: true,
        ),
      );
    }

    final hasDoac = ids.contains('apixaban') ||
        ids.contains('rivaroxaban') ||
        ids.contains('dabigatran');
    if (ids.contains('carbamazepine') && hasDoac) {
      alerts.add(
        const PlanAlert(
          title: 'Carbamazepine + DOAC',
          message:
              'carbamazepine محفز إنزيمي قوي وقد يقلل تعرض بعض مميعات DOAC ويضعف الحماية من الجلطات. التداخل لا يُحل بفصل الوقت ويحتاج مراجعة العلاج.',
          isCritical: true,
        ),
      );
    }

    if (ids.contains('carbamazepine') &&
        (ids.contains('combined-oral-contraceptive') ||
            ids.contains('norethindrone-pop'))) {
      alerts.add(
        const PlanAlert(
          title: 'Carbamazepine + hormonal contraception',
          message:
              'carbamazepine قد يقلل فعالية موانع الحمل الهرمونية. تغيير وقت الحبة لا يحل التداخل؛ راجع وسيلة مناسبة/إضافية حسب الإرشادات.',
          isCritical: true,
        ),
      );
    }

    if (ids.contains('warfarin') &&
        (ids.contains('metronidazole-oral') ||
            ids.contains('fluconazole-oral'))) {
      alerts.add(
        const PlanAlert(
          title: 'Warfarin interaction · INR review',
          message:
              'metronidazole أو fluconazole قد يرفع تأثير warfarin بشكل مهم. يحتاج INR وخطة جرعة/متابعة أقرب؛ فصل وقت الجرعات لا يمنع التداخل.',
          isCritical: true,
        ),
      );
    }

    if (ids.contains('glimepiride') &&
        (ids.contains('insulin-glargine') || ids.contains('insulin-lispro'))) {
      alerts.add(
        const PlanAlert(
          title: 'Hypoglycemia-risk combination',
          message:
              'glimepiride مع insulin قد يرفع خطر هبوط السكر. قد تكون التوليفة مقصودة لكن راجع جرعات السكر وخطة علاج الهبوط بدل الاعتماد على توقيت مختلف.',
        ),
      );
    }

    if ((ids.contains('empagliflozin') || ids.contains('dapagliflozin')) &&
        (ids.contains('furosemide') ||
            ids.contains('hydrochlorothiazide'))) {
      alerts.add(
        const PlanAlert(
          title: 'Volume-depletion review',
          message:
              'SGLT2 inhibitor مع مدر بول قد يزيد التبول والجفاف/هبوط الضغط عند بعض المرضى. راجع السوائل والضغط ووظائف الكلى وخطة أيام المرض.',
        ),
      );
    }

    if (ids.contains('gabapentin') && ids.contains('pregabalin')) {
      alerts.add(
        const PlanAlert(
          title: 'Gabapentinoid duplication review',
          message:
              'gabapentin وpregabalin من نفس الفئة الوظيفية وقد يزيد الجمع الدوخة والنعاس. تأكد أن الجمع/التحويل مقصود وله خطة واضحة.',
        ),
      );
    }

    final doxyMinerals = ids.contains('oral-iron-salts') ||
        ids.contains('calcium-carbonate') ||
        ids.contains('calcium-citrate') ||
        (ids.contains('magnesium-gluconate') ||
            ids.contains('magnesium-citrate') ||
            ids.contains('magnesium-oxide')) ||
        ids.contains('zinc') ||
        ids.contains('multivitamin-mineral') ||
        ids.contains('prenatal-combination');
    if (ids.contains('doxycycline') && doxyMinerals) {
      alerts.add(
        const PlanAlert(
          title: 'Doxycycline + minerals',
          message:
              'الحديد/الكالسيوم/المغنيسيوم/الزنك قد تقلل امتصاص doxycycline. ضع فاصلًا حسب ملصق المنتج والمعدن ولا تجمعها في نفس وقت الجرعة.',
          isCritical: true,
        ),
      );
    }

    if (ids.contains('levothyroxine') &&
        (ids.contains('magnesium-gluconate') ||
            ids.contains('magnesium-citrate') ||
            ids.contains('magnesium-oxide'))) {
      alerts.add(
        const PlanAlert(
          title: 'Levothyroxine + magnesium',
          message:
              'المغنيسيوم قد يقلل امتصاص levothyroxine؛ افصل الجرعات وفق تعليمات المنتج/خطة الصيدلي، وغالبًا يُستخدم فاصل عدة ساعات.',
        ),
      );
    }

    if (ids.contains('tirzepatide-mounjaro') &&
        (ids.contains('combined-oral-contraceptive') ||
            ids.contains('norethindrone-pop'))) {
      alerts.add(
        const PlanAlert(
          title: 'Tirzepatide + oral hormonal contraception',
          message:
              'Mounjaro قد يقلل فعالية موانع الحمل الفموية بعد بدء العلاج وبعد كل زيادة جرعة. النشرة الحالية توصي بوسيلة غير فموية أو حاجزية لمدة 4 أسابيع بعد البدء و4 أسابيع بعد كل تصعيد للجرعة.',
          isCritical: true,
        ),
      );
    }

    if (ids.contains('trimethoprim-sulfamethoxazole') &&
        ids.contains('warfarin')) {
      alerts.add(
        const PlanAlert(
          title: 'TMP-SMX + warfarin',
          message:
              'TMP-SMX قد يرفع تأثير warfarin بشكل مهم ويزيد خطر النزف. يحتاج INR وخطة متابعة/جرعة أقرب؛ فصل وقت الجرعات لا يحل التداخل.',
          isCritical: true,
        ),
      );
    }

    if (ids.contains('trimethoprim-sulfamethoxazole') &&
        (ids.contains('spironolactone') ||
            ids.contains('lisinopril') ||
            ids.contains('losartan') ||
            ids.contains('valsartan') ||
            ids.contains('sacubitril-valsartan'))) {
      alerts.add(
        const PlanAlert(
          title: 'TMP-SMX + potassium-raising therapy',
          message:
              'TMP-SMX مع spironolactone أو ACEI/ARB/ARNI قد يرفع خطر فرط البوتاسيوم. راجع K⁺ ووظائف الكلى والبدائل حسب الحالة.',
          isCritical: true,
        ),
      );
    }

    if (ids.contains('clarithromycin-oral') && ids.contains('colchicine')) {
      alerts.add(
        const PlanAlert(
          title: 'Clarithromycin + colchicine',
          message:
              'clarithromycin قد يرفع colchicine إلى مستويات سامة وخطيرة. التداخل لا يُحل بفصل الوقت ويحتاج تجنب/مراجعة علاجية عاجلة، خصوصًا مع قصور الكلى أو الكبد.',
          isCritical: true,
        ),
      );
    }

    if (ids.contains('lithium') && nsaids.isNotEmpty) {
      alerts.add(
        const PlanAlert(
          title: 'Lithium + NSAID',
          message:
              'NSAIDs مثل ibuprofen/naproxen قد ترفع تركيز lithium وتزيد خطر السمية. لا تبدأ NSAID أو تكرره دون خطة لمستوى lithium ووظائف الكلى.',
          isCritical: true,
        ),
      );
    }

    if (ids.contains('lithium') &&
        (hasRasDrug || hasDiuretic)) {
      alerts.add(
        const PlanAlert(
          title: 'Lithium concentration interaction',
          message:
              'ACEI/ARB/ARNI أو بعض المدرات قد ترفع تركيز lithium. هذه ليست مشكلة توقيت؛ تحتاج مراجعة مستوى lithium ووظائف الكلى وخطة المراقبة.',
          isCritical: true,
        ),
      );
    }

    if (ids.contains('tadalafil') && ids.contains('nitroglycerin-sublingual')) {
      alerts.add(
        const PlanAlert(
          title: 'Tadalafil + nitrate',
          message:
              'tadalafil مع nitroglycerin/nitrates ممنوع بسبب خطر هبوط ضغط شديد. أخبر الطوارئ بوقت آخر جرعة tadalafil إذا حدث ألم صدر.',
          isCritical: true,
        ),
      );
    }

    if (ids.contains('risedronate') &&
        (ids.contains('oral-iron-salts') ||
            ids.contains('calcium-carbonate') ||
            ids.contains('calcium-citrate') ||
            (ids.contains('magnesium-gluconate') ||
            ids.contains('magnesium-citrate') ||
            ids.contains('magnesium-oxide')) ||
            ids.contains('multivitamin-mineral') ||
            ids.contains('prenatal-combination'))) {
      alerts.add(
        const PlanAlert(
          title: 'Risedronate + minerals',
          message:
              'الكالسيوم/الحديد/المغنيسيوم قد يقللون امتصاص risedronate. إضافةً إلى ذلك، Actonel العادي وAtelvia لهما تعليمات طعام مختلفة؛ يجب ترتيب الجدول حسب المنتج المحدد.',
          isCritical: true,
        ),
      );
    }

    if (ids.contains('psyllium') && ids.length > 1) {
      alerts.add(
        const PlanAlert(
          title: 'Psyllium medication separation',
          message:
              'Psyllium قد يغيّر امتصاص بعض الأدوية الفموية، وكثير من المنتجات توصي بفصل الأدوية الموصوفة ساعتين على الأقل. راجع كل دواء قبل تثبيت الجدول.',
        ),
      );
    }

    if (ids.contains('pioglitazone') &&
        (ids.contains('insulin-glargine') || ids.contains('insulin-lispro'))) {
      alerts.add(
        const PlanAlert(
          title: 'Pioglitazone + insulin',
          message:
              'الجمع قد يزيد احتباس السوائل/الوذمة وخطر تدهور فشل القلب عند بعض المرضى. راقب الوزن السريع، الوذمة وضيق النفس ولا تعالجها بتغيير الوقت فقط.',
        ),
      );
    }

    if (ids.contains('valsartan') && ids.contains('sacubitril-valsartan')) {
      alerts.add(
        const PlanAlert(
          title: 'Duplicate valsartan exposure',
          message:
              'sacubitril/valsartan يحتوي valsartan أصلًا. إضافة valsartan منفصل غالبًا تعني تكرار ARB وتحتاج مراجعة الوصفة، وليس فصل الجرعات.',
          isCritical: true,
        ),
      );
    }

    final sabaProducts = <String>{
      'salbutamol-mdi',
      'albuterol-nebulizer-0083',
      'albuterol-nebulizer-concentrate-05',
      'ipratropium-albuterol-nebulizer',
    }.where(ids.contains).toList();
    if (sabaProducts.length > 1) {
      alerts.add(
        const PlanAlert(
          title: 'Duplicate albuterol/salbutamol routes',
          message:
              'يوجد أكثر من منتج يحتوي albuterol/salbutamol (بخاخ/نيبولايزر أو combination). قد تكون الخطة مقصودة للإسعاف، لكن يجب تحديد متى يُستخدم كل شكل وما الحد؛ لا تعتبرها أدوية مختلفة بسبب اختلاف الجهاز.',
          isCritical: true,
        ),
      );
    }

    if (ids.contains('tiotropium-capsule-inhalation') &&
        ids.contains('tiotropium-respimat')) {
      alerts.add(
        const PlanAlert(
          title: 'Duplicate tiotropium devices',
          message:
              'HandiHaler capsule وSPIRIVA RESPIMAT يحتويان tiotropium لكن بتقنيات/قوى مختلفة. وجودهما معًا يحتاج مراجعة لأنه قد يكون تكرارًا لنفس LAMA وليس علاجين مختلفين.',
          isCritical: true,
        ),
      );
    }

    final shortAnticholinergic = ids.contains('ipratropium-hfa') ||
        ids.contains('ipratropium-nebulizer') ||
        ids.contains('ipratropium-albuterol-nebulizer');
    final longAnticholinergic = ids.contains('tiotropium-capsule-inhalation') ||
        ids.contains('tiotropium-respimat');
    if (shortAnticholinergic && longAnticholinergic) {
      alerts.add(
        const PlanAlert(
          title: 'Inhaled anticholinergic overlap',
          message:
              'يوجد ipratropium قصير المفعول مع tiotropium طويل المفعول. قد يُستخدم ipratropium في خطة حادة محددة، لكن الاستخدام المتكرر مع LAMA يحتاج مراجعة بسبب زيادة التأثيرات المضادة للكولين.',
        ),
      );
    }

    final inhaledSteroids = <String>{
      'budesonide-nebulizer',
      'budesonide-formoterol',
      'fluticasone-hfa',
      'fluticasone-salmeterol-dpi',
    }.where(ids.contains).toList();
    if (inhaledSteroids.length > 1) {
      alerts.add(
        const PlanAlert(
          title: 'Inhaled corticosteroid duplication review',
          message:
              'يوجد أكثر من منتج يحتوي inhaled corticosteroid. قد تكون هناك خطة انتقالية مقصودة، لكن الاستخدام المتزامن قد يكرر الستيرويد؛ راجع المادة الفعالة والجرعة قبل اعتماد الجدول.',
        ),
      );
    }

    final cefdinirMinerals = ids.contains('oral-iron-salts') ||
        ids.contains('multivitamin-mineral') ||
        ids.contains('prenatal-combination');
    if (ids.contains('cefdinir-pediatric-suspension') && cefdinirMinerals) {
      alerts.add(
        const PlanAlert(
          title: 'Cefdinir + iron',
          message:
              'مكملات الحديد قد تقلل امتصاص cefdinir. افصل cefdinir ساعتين على الأقل قبل/بعد الحديد أو multivitamin/prenatal المحتوي على الحديد. Iron-fortified infant formula مستثنى في الملصق الحالي.',
          isCritical: true,
        ),
      );
    }

    if (ids.contains('ibandronate-monthly') &&
        (ids.contains('oral-iron-salts') ||
            ids.contains('calcium-carbonate') ||
            ids.contains('calcium-citrate') ||
            (ids.contains('magnesium-gluconate') ||
            ids.contains('magnesium-citrate') ||
            ids.contains('magnesium-oxide')) ||
            ids.contains('zinc') ||
            ids.contains('multivitamin-mineral') ||
            ids.contains('prenatal-combination'))) {
      alerts.add(
        const PlanAlert(
          title: 'Ibandronate + minerals',
          message:
              'ibandronate الشهري يجب أن يؤخذ وحده مع ماء عادي ثم الانتظار 60 دقيقة قبل أي calcium/iron/magnesium/zinc أو دواء فموي آخر. لا تستخدم قاعدة 30 دقيقة.',
          isCritical: true,
        ),
      );
    }

    final hasBleedingRiskMedicine = ids.contains('warfarin') ||
        ids.contains('apixaban') ||
        ids.contains('rivaroxaban') ||
        ids.contains('dabigatran') ||
        ids.contains('enoxaparin') ||
        ids.contains('clopidogrel');
    if (ids.contains('omega-3') && hasBleedingRiskMedicine) {
      alerts.add(
        const PlanAlert(
          title: 'Omega-3 + bleeding-risk therapy',
          message:
              'جرعات omega-3 العالية قد تضيف تأثيرًا مضادًا للصفيحات. مع anticoagulant/antiplatelet راجع جرعة EPA+DHA، سبب الاستخدام وعلامات النزف بدل افتراض أن fish oil لا يتداخل.',
        ),
      );
    }

    if (ids.contains('bismuth-subsalicylate') && hasBleedingRiskMedicine) {
      alerts.add(
        const PlanAlert(
          title: 'Bismuth subsalicylate + bleeding-risk therapy',
          message:
              'bismuth subsalicylate يحتوي salicylate. مع anticoagulant/antiplatelet ترتفع أهمية مراجعة النزف والبدائل؛ فصل وقت الجرعات لا يلغي التأثير.',
          isCritical: true,
        ),
      );
    }

    final hasJakInhibitor =
        ids.contains('upadacitinib') || ids.contains('tofacitinib');
    final hasBiologicDmard = ids.contains('etanercept') ||
        ids.contains('adalimumab') ||
        ids.contains('secukinumab');
    if (hasJakInhibitor && hasBiologicDmard) {
      alerts.add(
        const PlanAlert(
          title: 'JAK inhibitor + biologic immunomodulator',
          message:
              'الجمع بين JAK inhibitor مثل upadacitinib/tofacitinib وبين biologic DMARD مثل etanercept/adalimumab/secukinumab ليس ترتيبًا يحل بفصل الوقت ويحتاج مراجعة اختصاصية بسبب زيادة خطر العدوى/المناعة.',
          isCritical: true,
        ),
      );
    }

    if (ids.contains('fexofenadine')) {
      alerts.add(
        const PlanAlert(
          title: 'Fexofenadine',
          message:
              'خذ الجرعة مع الماء، وليس مع عصير التفاح أو البرتقال أو الجريب فروت.',
        ),
      );
    }
  }

  int _normalize(int value) {
    var minutes = value % 1440;
    if (minutes < 0) minutes += 1440;
    return minutes;
  }

  String _weekdayAr(int weekday) {
    const days = <int, String>{
      1: 'الاثنين',
      2: 'الثلاثاء',
      3: 'الأربعاء',
      4: 'الخميس',
      5: 'الجمعة',
      6: 'السبت',
      7: 'الأحد',
    };
    return days[weekday] ?? 'يوم ثابت من الأسبوع';
  }
}
