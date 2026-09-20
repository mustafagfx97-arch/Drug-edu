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

    if (rule.anchor == 'after-selected-meal' &&
        item.preference != TimingPreference.custom) {
      return [_selectedMeal(item.preference, routine) + 30];
    }

    if (rule.anchor == 'before-breakfast' &&
        item.preference == TimingPreference.auto) {
      return [routine.breakfastMinutes - 45];
    }

    final preferred = _preferredBase(item.preference, routine);
    if (preferred != null) {
      return _expandFromBase(item.frequency, preferred);
    }

    switch (rule.anchor) {
      case 'before-breakfast':
        return [routine.breakfastMinutes - 45];
      case 'breakfast':
        return [routine.breakfastMinutes];
      case 'after-selected-meal':
        return [_selectedMeal(item.preference, routine) + 30];
      case 'morning':
        return _expandFromBase(
          item.frequency,
          routine.wakeMinutes + 60,
        );
      case 'bedtime':
        return [routine.bedtimeMinutes];
      case 'with-meal':
        return _mealTimes(item.frequency, routine);
      case 'empty-stomach':
        return _emptyStomachTimes(item.frequency, routine);
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
      case RegimenFrequency.every12Hours:
        return [routine.breakfastMinutes, routine.dinnerMinutes];
      case RegimenFrequency.threeTimesDaily:
      case RegimenFrequency.every8Hours:
        return [
          routine.breakfastMinutes,
          routine.lunchMinutes,
          routine.dinnerMinutes,
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
    switch (frequency) {
      case RegimenFrequency.onceDaily:
        return [routine.breakfastMinutes - 60];
      case RegimenFrequency.twiceDaily:
      case RegimenFrequency.every12Hours:
        return [routine.breakfastMinutes - 60, routine.dinnerMinutes - 120];
      case RegimenFrequency.threeTimesDaily:
      case RegimenFrequency.every8Hours:
        return [
          routine.breakfastMinutes - 60,
          routine.lunchMinutes - 60,
          routine.dinnerMinutes - 60,
        ];
      case RegimenFrequency.morning:
        return [routine.breakfastMinutes - 60];
      case RegimenFrequency.bedtime:
        return [routine.bedtimeMinutes];
      case RegimenFrequency.weekly:
        return [routine.breakfastMinutes - 60];
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
      case RegimenFrequency.every12Hours:
        return [routine.breakfastMinutes, routine.dinnerMinutes];
      case RegimenFrequency.threeTimesDaily:
        return [
          routine.breakfastMinutes,
          routine.lunchMinutes,
          routine.dinnerMinutes,
        ];
      case RegimenFrequency.every8Hours:
        return [
          routine.wakeMinutes,
          routine.wakeMinutes + 480,
          routine.wakeMinutes + 960,
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
        ids.contains('rivaroxaban');
    final hasNsaid = ids.contains('ibuprofen') || ids.contains('naproxen');
    if (hasAnticoagulant && hasNsaid) {
      alerts.add(
        const PlanAlert(
          title: 'Bleeding-risk combination',
          message:
              'وجود مميع دم مع NSAID مثل ibuprofen/naproxen قد يزيد النزف. لا يكفي فصل الوقت؛ راجع ملاءمة الجمع نفسه.',
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
