import '../data/iv_quick_drip_profiles.dart';

/// Concentrate-only arithmetic. Selecting a reviewed vial proves its stock
/// strength, NOT that arbitrary mg/fluid combinations are safe to compound.
class IvQuickDripStockCalculation {
  const IvQuickDripStockCalculation({
    required this.stockMgPerMl,
    required this.withdrawalMl,
    required this.fluidAddedMl,
    required this.finalVolumeMl,
    required this.finalMcgPerMl,
    required this.amountDiffersFromReviewedExample,
    required this.needsMoreThanReviewedPresentation,
  });

  final double stockMgPerMl;
  final double withdrawalMl;
  final double fluidAddedMl;
  final double finalVolumeMl;
  final double finalMcgPerMl;
  final bool amountDiffersFromReviewedExample;
  final bool needsMoreThanReviewedPresentation;
}

/// Drug amount and stock strength use ACTIVE ingredient milligrams.
/// For norepinephrine the manufacturer strength is norepinephrine BASE
/// equivalent (1 mg BASE/mL), never bitartrate salt weight.
IvQuickDripStockCalculation? calculateIvQuickStock({
  required IvQuickDripProfile product,
  required double? drugAmountMg,
  required double? fluidAddedMl,
}) {
  if (product.premix ||
      drugAmountMg == null ||
      fluidAddedMl == null ||
      !drugAmountMg.isFinite ||
      !fluidAddedMl.isFinite ||
      drugAmountMg <= 0 ||
      fluidAddedMl <= 0 ||
      !product.stockMl.isFinite ||
      !product.totalDrugMg.isFinite ||
      product.stockMl <= 0 ||
      product.totalDrugMg <= 0) {
    return null;
  }
  final stock = product.totalDrugMg / product.stockMl;
  if (!stock.isFinite || stock <= 0) return null;
  final withdrawal = drugAmountMg / stock;
  final finalMl = withdrawal + fluidAddedMl;
  final finalMcgMl = drugAmountMg * 1000 / finalMl;
  if (!withdrawal.isFinite ||
      !finalMl.isFinite ||
      !finalMcgMl.isFinite ||
      withdrawal <= 0 ||
      finalMl <= withdrawal ||
      finalMcgMl <= 0) {
    return null;
  }
  return IvQuickDripStockCalculation(
    stockMgPerMl: stock,
    withdrawalMl: withdrawal,
    fluidAddedMl: fluidAddedMl,
    finalVolumeMl: finalMl,
    finalMcgPerMl: finalMcgMl,
    amountDiffersFromReviewedExample:
        (drugAmountMg - product.totalDrugMg).abs() > 1e-8,
    needsMoreThanReviewedPresentation: drugAmountMg > product.totalDrugMg,
  );
}
