/// Label-locked adult Labetalol slow IV injection calculation.
/// This is arithmetic for an ALREADY ORDERED dose, not dose selection.
/// Initial: 20 mg over 2 minutes. Additional: 40 or 80 mg every
/// 10 minutes as ordered, to total 300 mg (source in regimen record).
enum LabetalolInjectionStage { initial, additional }

class LabetalolBolusResult {
  const LabetalolBolusResult({
    required this.withdrawalMl,
    required this.cumulativeMg,
  });
  final double withdrawalMl;
  final double cumulativeMg;
}

LabetalolBolusResult? calculateOrderedLabetalolInjection({
  required double vialAmountMg,
  required double vialVolumeMl,
  required double prescribedDoseMg,
  required double previousCumulativeMg,
  required LabetalolInjectionStage stage,
}) {
  final inputs = [
    vialAmountMg,
    vialVolumeMl,
    prescribedDoseMg,
    previousCumulativeMg,
  ];
  if (inputs.any((v) => !v.isFinite) ||
      vialAmountMg <= 0 ||
      vialVolumeMl <= 0 ||
      prescribedDoseMg <= 0 ||
      previousCumulativeMg < 0) {
    return null;
  }
  if ((vialAmountMg / vialVolumeMl - 5).abs() > 0.000001) {
    return null;
  }
  if (stage == LabetalolInjectionStage.initial) {
    if (prescribedDoseMg != 20 || previousCumulativeMg != 0) return null;
  } else {
    if ((prescribedDoseMg != 40 && prescribedDoseMg != 80) ||
        previousCumulativeMg < 20) {
      return null;
    }
  }
  if (prescribedDoseMg + previousCumulativeMg > 300) return null;
  final withdrawal = prescribedDoseMg / 5;
  if (!withdrawal.isFinite || withdrawal <= 0) return null;
  return LabetalolBolusResult(
    withdrawalMl: withdrawal,
    cumulativeMg: previousCumulativeMg + prescribedDoseMg,
  );
}

/// Exact 5 mg/mL labetalol vial preparation: 200 mg drawn as 40 mL,
/// plus 160 mL label-compatible IV fluid, to 200 mL FINAL = 1 mg/mL.
bool matchesLabetalolLabelInfusion({
  required double stockConcentrationMgPerMl,
  required double selectedAmountMg,
  required double withdrawnMl,
  required double addedDiluentMl,
  required double finalVolumeMl,
}) {
  bool close(double x, double y) => x.isFinite && (x - y).abs() < 0.000001;
  return close(stockConcentrationMgPerMl, 5) &&
      close(selectedAmountMg, 200) &&
      close(withdrawnMl, 40) &&
      close(addedDiluentMl, 160) &&
      close(finalVolumeMl, 200);
}

/// Keep labeled example and clinical evidence levels separate.
/// Both recipes use 200 mg from 40 mL stock at 5 mg/mL.
/// "Other" can still have mathematical output after independent local review,
/// but it must NOT inherit the label example's validation.
enum LabetalolInfusionRecipeStatus {
  labelFinal200Ml,
  labelAdded250Ml,
  localProtocolOnly,
}

LabetalolInfusionRecipeStatus classifyLabetalolInfusionRecipe({
  required double stockConcentrationMgPerMl,
  required double selectedAmountMg,
  required double withdrawnMl,
  required double addedDiluentMl,
  required double finalVolumeMl,
}) {
  bool same(double actual, double target) =>
      actual.isFinite && (actual - target).abs() < 0.000001;
  final stockMatches = same(stockConcentrationMgPerMl, 5) &&
      same(selectedAmountMg, 200) &&
      same(withdrawnMl, 40);
  if (stockMatches &&
      same(addedDiluentMl, 160) &&
      same(finalVolumeMl, 200)) {
    return LabetalolInfusionRecipeStatus.labelFinal200Ml;
  }
  if (stockMatches &&
      same(addedDiluentMl, 250) &&
      same(finalVolumeMl, 290)) {
    return LabetalolInfusionRecipeStatus.labelAdded250Ml;
  }
  return LabetalolInfusionRecipeStatus.localProtocolOnly;
}

/// Second formulation specifically listed in the manufacturer's label:
/// ADD 40 mL of 5 mg/mL labetalol to 250 mL IV fluid.
/// The FINAL solution is 290 mL (not 250 mL).
bool matchesLabetalolSecondLabelInfusion({
  required double stockConcentrationMgPerMl,
  required double selectedAmountMg,
  required double withdrawnMl,
  required double addedDiluentMl,
  required double finalVolumeMl,
}) =>
    classifyLabetalolInfusionRecipe(
      stockConcentrationMgPerMl: stockConcentrationMgPerMl,
      selectedAmountMg: selectedAmountMg,
      withdrawnMl: withdrawnMl,
      addedDiluentMl: addedDiluentMl,
      finalVolumeMl: finalVolumeMl,
    ) == LabetalolInfusionRecipeStatus.labelAdded250Ml;

/// Physician-ordered mg/min at the exact source-locked final mg/mL.
/// No auto-populated rate and no indication-independent preset.
double? labetalolOrderedInfusionMlPerHour({
  required double prescribedMgPerMinute,
  required double verifiedFinalMgPerMl,
}) {
  if (!prescribedMgPerMinute.isFinite ||
      !verifiedFinalMgPerMl.isFinite ||
      prescribedMgPerMinute <= 0 ||
      verifiedFinalMgPerMl <= 0) {
    return null;
  }
  final mlPerHour = prescribedMgPerMinute * 60 / verifiedFinalMgPerMl;
  return mlPerHour.isFinite && mlPerHour > 0 ? mlPerHour : null;
}

/// For a NON-LABEL STANDARD labetalol admixture, return ARITHMETIC only
/// AFTER the exact prepared final concentration and local protocol have
/// independently been confirmed. This function NEVER approves the mixture.
double? calculateLocallyVerifiedLabetalolRateMathOnly({
  required double prescribedMgPerMinute,
  required double calculatedFinalMgPerMl,
  required bool localPreparationVerified,
}) {
  if (!localPreparationVerified) {
    return null;
  }
  return labetalolOrderedInfusionMlPerHour(
    prescribedMgPerMinute: prescribedMgPerMinute,
    verifiedFinalMgPerMl: calculatedFinalMgPerMl,
  );
}
