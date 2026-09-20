enum PlanItemType { medicine, supplement }

enum RegimenFrequency {
  onceDaily,
  twiceDaily,
  threeTimesDaily,
  fourTimesDaily,
  every12Hours,
  every8Hours,
  every6Hours,
  morning,
  bedtime,
  weekly,
  asNeeded,
}

enum TimingPreference {
  auto,
  morning,
  breakfast,
  lunch,
  dinner,
  bedtime,
  custom,
}

class PatientRoutine {
  const PatientRoutine({
    this.wakeMinutes = 390,
    this.breakfastMinutes = 480,
    this.lunchMinutes = 780,
    this.dinnerMinutes = 1200,
    this.bedtimeMinutes = 1380,
  });

  final int wakeMinutes;
  final int breakfastMinutes;
  final int lunchMinutes;
  final int dinnerMinutes;
  final int bedtimeMinutes;
}

class MedicationPlanItem {
  const MedicationPlanItem({
    required this.id,
    required this.sourceId,
    required this.type,
    required this.name,
    required this.doseText,
    required this.frequency,
    this.preference = TimingPreference.auto,
    this.customMinutes,
    this.weekday,
  });

  final String id;
  final String sourceId;
  final PlanItemType type;
  final String name;
  final String doseText;
  final RegimenFrequency frequency;
  final TimingPreference preference;
  final int? customMinutes;
  final int? weekday;
}

class ScheduledDose {
  const ScheduledDose({
    required this.itemId,
    required this.medicationName,
    required this.doseText,
    required this.minutes,
    required this.instructionAr,
    this.isSuggested = true,
    this.dayLabel = '',
  });

  final String itemId;
  final String medicationName;
  final String doseText;
  final int minutes;
  final String instructionAr;
  final bool isSuggested;
  final String dayLabel;
}

class PlanAlert {
  const PlanAlert({
    required this.title,
    required this.message,
    this.isCritical = false,
  });

  final String title;
  final String message;
  final bool isCritical;
}

class GeneratedMedicationPlan {
  const GeneratedMedicationPlan({
    required this.doses,
    required this.alerts,
  });

  final List<ScheduledDose> doses;
  final List<PlanAlert> alerts;
}
