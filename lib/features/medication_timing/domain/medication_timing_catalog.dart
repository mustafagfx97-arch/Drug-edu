import '../../medication_plan/domain/medication_timing_rules.dart';

enum FoodTimingCategory {
  beforeFoodOrEmptyStomach,
  withOrAfterFood,
  noMealAnchor,
  prescriptionSpecific,
  unverified,
}

enum DayTimingCategory {
  morning,
  eveningBedtime,
  flexible,
  regimenSpecific,
  unverified,
}

class MedicationTimingProfile {
  const MedicationTimingProfile({
    required this.medicationId,
    required this.foodCategory,
    required this.dayCategory,
    required this.instructionAr,
    required this.source,
    required this.requiresPrescriptionReview,
    required this.hasVerifiedRule,
  });

  final String medicationId;
  final FoodTimingCategory foodCategory;
  final DayTimingCategory dayCategory;
  final String instructionAr;
  final String source;
  final bool requiresPrescriptionReview;
  final bool hasVerifiedRule;
}

MedicationTimingProfile medicationTimingProfileFor(String medicationId) {
  final rule = medicationTimingRules[medicationId];

  if (rule == null) {
    return MedicationTimingProfile(
      medicationId: medicationId,
      foodCategory: FoodTimingCategory.unverified,
      dayCategory: DayTimingCategory.unverified,
      instructionAr:
          'لم تُثبت قاعدة توقيت مستقلة لهذا السجل بعد. راجع صفحة الدواء والمصدر الدوائي قبل اعتماد تعليمات التوقيت للمريض.',
      source: '',
      requiresPrescriptionReview: true,
      hasVerifiedRule: false,
    );
  }

  return MedicationTimingProfile(
    medicationId: medicationId,
    foodCategory: _foodCategory(rule),
    dayCategory: _dayCategory(rule),
    instructionAr: rule.instructionAr,
    source: rule.source,
    requiresPrescriptionReview:
        !rule.autoScheduleSafe || rule.requiresMealChoice,
    hasVerifiedRule: true,
  );
}

FoodTimingCategory _foodCategory(MedicationTimingRule rule) {
  if (!rule.autoScheduleSafe) {
    return FoodTimingCategory.prescriptionSpecific;
  }

  switch (rule.anchor) {
    case 'before-breakfast':
    case 'before-meal':
    case 'empty-stomach':
      return FoodTimingCategory.beforeFoodOrEmptyStomach;
    case 'breakfast':
    case 'with-meal':
    case 'after-selected-meal':
      return FoodTimingCategory.withOrAfterFood;
    case 'any':
    case 'morning':
    case 'bedtime':
    case 'weekly':
      return FoodTimingCategory.noMealAnchor;
    default:
      return FoodTimingCategory.prescriptionSpecific;
  }
}

DayTimingCategory _dayCategory(MedicationTimingRule rule) {
  if (!rule.autoScheduleSafe) {
    return DayTimingCategory.regimenSpecific;
  }

  switch (rule.anchor) {
    case 'before-breakfast':
    case 'breakfast':
    case 'morning':
      return DayTimingCategory.morning;
    case 'bedtime':
      return DayTimingCategory.eveningBedtime;
    case 'any':
      return DayTimingCategory.flexible;
    case 'before-meal':
    case 'with-meal':
    case 'after-selected-meal':
    case 'empty-stomach':
    case 'weekly':
      return DayTimingCategory.regimenSpecific;
    default:
      return DayTimingCategory.regimenSpecific;
  }
}
