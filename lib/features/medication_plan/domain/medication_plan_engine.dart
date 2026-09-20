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

    if ((ids.contains('carvedilol') && ids.contains('metoprolol')) ||
        (ids.contains('diltiazem-er') &&
            (ids.contains('metoprolol') || ids.contains('carvedilol')))) {
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
