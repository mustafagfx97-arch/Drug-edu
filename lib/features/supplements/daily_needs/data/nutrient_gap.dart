import '../domain/daily_needs_models.dart';

NutrientGapResult calculateNutrientGap({
  required double target,
  required double foodIntake,
  required double existingSupplementIntake,
}) {
  final safeTarget = target < 0 ? 0.0 : target;
  final safeFood = foodIntake < 0 ? 0.0 : foodIntake;
  final safeSupplement =
      existingSupplementIntake < 0 ? 0.0 : existingSupplementIntake;
  final total = safeFood + safeSupplement;
  final gap = safeTarget > total ? safeTarget - total : 0.0;

  return NutrientGapResult(
    target: safeTarget,
    foodIntake: safeFood,
    existingSupplementIntake: safeSupplement,
    totalCurrentIntake: total,
    uncoveredGap: gap,
  );
}
