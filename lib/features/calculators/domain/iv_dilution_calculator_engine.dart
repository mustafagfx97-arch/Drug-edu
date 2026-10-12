import 'dart:math' as math;

/// The value is either fluid ADDED to withdrawn stock or the requested FINAL
/// container volume (q.s.). The two pathways MUST NOT be interchanged.
enum IvVolumeEntryMode { addFluidToDrug, finalVolumeTarget }

class IvDilutionResult {
  const IvDilutionResult({
    required this.stockStrengthPerMl,
    required this.withdrawalMl,
    required this.addedFluidMl,
    required this.finalVolumeMl,
    required this.finalStrengthPerMl,
    required this.minimumContainerCount,
  });

  final double stockStrengthPerMl;
  final double withdrawalMl;
  final double addedFluidMl;
  final double finalVolumeMl;
  final double finalStrengthPerMl;
  final int minimumContainerCount;
}

/// Mathematically calculates a withdrawal/volume from a VERIFIED matching
/// product presentation. This does NOT verify diluent compatibility, BUD,
/// clinical dose, route or a permissible final concentration.
IvDilutionResult? calculateVerifiedIvDilution({
  required double ampouleAmount,
  required double ampouleVolumeMl,
  required double orderedTotalAmount,
  required double verifiedStrengthPerMl,
  required double volumeMl,
  required IvVolumeEntryMode volumeMode,
}) {
  final numbers = [
    ampouleAmount,
    ampouleVolumeMl,
    orderedTotalAmount,
    verifiedStrengthPerMl,
    volumeMl,
  ];
  if (numbers.any((n) => !n.isFinite || n <= 0)) return null;

  final enteredStrength = ampouleAmount / ampouleVolumeMl;
  if (!enteredStrength.isFinite ||
      (enteredStrength - verifiedStrengthPerMl).abs() /
              verifiedStrengthPerMl >
          0.0001) {
    // Typed vial amount and vial volume do not agree with the selected
    // source-locked vial / reconstituted product concentration.
    return null;
  }

  final withdrawal = orderedTotalAmount / verifiedStrengthPerMl;
  if (!withdrawal.isFinite || withdrawal <= 0) return null;

  final double finalMl;
  final double diluentMl;
  switch (volumeMode) {
    case IvVolumeEntryMode.addFluidToDrug:
      diluentMl = volumeMl;
      finalMl = volumeMl + withdrawal;
    case IvVolumeEntryMode.finalVolumeTarget:
      finalMl = volumeMl;
      diluentMl = volumeMl - withdrawal;
  }
  if (!finalMl.isFinite ||
      !diluentMl.isFinite ||
      finalMl <= 0 ||
      diluentMl < 0) {
    return null;
  }

  final finalStrength = orderedTotalAmount / finalMl;
  final containerCount = (withdrawal / ampouleVolumeMl).ceil();
  if (!finalStrength.isFinite ||
      finalStrength <= 0 ||
      containerCount <= 0 ||
      containerCount > 1000000) {
    return null;
  }
  return IvDilutionResult(
    stockStrengthPerMl: enteredStrength,
    withdrawalMl: withdrawal,
    addedFluidMl: diluentMl,
    finalVolumeMl: finalMl,
    finalStrengthPerMl: finalStrength,
    minimumContainerCount: math.max(1, containerCount),
  );
}

/// Mathematical pump rate for an *already ordered* intermittent infusion
/// duration. It is not a drug-specific validated infusion time.
double? calculateOrderedDurationPumpRate({
  required double finalVolumeMl,
  required double orderedDurationMinutes,
}) {
  if (!finalVolumeMl.isFinite ||
      finalVolumeMl <= 0 ||
      !orderedDurationMinutes.isFinite ||
      orderedDurationMinutes <= 0) {
    return null;
  }
  final mlPerHour = finalVolumeMl * 60 / orderedDurationMinutes;
  return mlPerHour.isFinite && mlPerHour > 0 ? mlPerHour : null;
}

bool matchesExactLabelledFinalStrength({
  required double calculatedPerMl,
  required double expectedPerMl,
}) =>
    calculatedPerMl.isFinite &&
    expectedPerMl.isFinite &&
    calculatedPerMl > 0 &&
    expectedPerMl > 0 &&
    (calculatedPerMl - expectedPerMl).abs() / expectedPerMl < 0.0001;

/// For the exact CARDENE IV concentrate 25 mg/10 mL and 240 mL supported
/// diluent, NOT for a premix and NOT for arbitrary alternate concentrations.
bool matchesCardeneIvLabelRecipe({
  required double ampouleAmountMg,
  required double ampouleVolumeMl,
  required double orderedAmountMg,
  required double addedFluidMl,
  required double finalVolumeMl,
}) {
  bool near(double actual, double expected) =>
      actual.isFinite && (actual - expected).abs() < 0.00001;
  return near(ampouleAmountMg, 25) &&
      near(ampouleVolumeMl, 10) &&
      near(orderedAmountMg, 25) &&
      near(addedFluidMl, 240) &&
      near(finalVolumeMl, 250);
}

 
/// Labeled nitroglycerin concentrate preparation: entire 50 mg/10 mL
/// vial q.s. to 500 mL FINAL with D5W or 0.9% saline = 100 mcg/mL.
/// Do not reuse for a premixed product or an alternate concentration.
bool matchesNitroglycerinLabelRecipe({
  required double ampouleAmountMg,
  required double ampouleVolumeMl,
  required double orderedAmountMg,
  required double finalVolumeMl,
  required double addedFluidMl,
}) {
  bool near(double actual, double expected) =>
      actual.isFinite && (actual - expected).abs() < 0.00001;
  return near(ampouleAmountMg, 50) &&
      near(ampouleVolumeMl, 10) &&
      near(orderedAmountMg, 50) &&
      near(finalVolumeMl, 500) &&
      near(addedFluidMl, 490);
}

/// An ordered micrograms/minute rate for an exact verified final strength
/// in mg/mL; avoids silently mixing mg and micrograms.
double? calculateOrderedMcgPerMinutePump({
  required double orderedMcgPerMin,
  required double finalMgPerMl,
}) {
  if (!orderedMcgPerMin.isFinite || orderedMcgPerMin <= 0 ||
      !finalMgPerMl.isFinite || finalMgPerMl <= 0) {
    return null;
  }
  final result = orderedMcgPerMin * 60 / (finalMgPerMl * 1000);
  return result.isFinite && result > 0 ? result : null;
}

 
/// An entered concentration never upgrades a product-specific safety lock.
/// This guards a reviewed IV insulin pathway against an unsafe U-500 switch;
/// unknown products elsewhere still require separate clinical verification.
bool customStockCompatibleWithVerifiedDoseBasis({
  required String drugName,
  required String population,
  required double concentrationPerMl,
}) {
  if (!concentrationPerMl.isFinite || concentrationPerMl <= 0) {
    return false;
  }
  if (drugName == 'Regular insulin infusion' &&
      population == 'General') {
    return (concentrationPerMl - 100).abs() <= 0.000001;
  }
  return true;
}
