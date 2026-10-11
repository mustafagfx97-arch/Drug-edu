/// Arithmetic-only. The clinical prescribed dose and dosing weight must
/// come from an independent authorized order; this does not choose either.
class IvWeightDoseResult {
  const IvWeightDoseResult({
    required this.orderedAmount,
    required this.withdrawalMilliliters,
  });

  final double orderedAmount;
  final double withdrawalMilliliters;
}

IvWeightDoseResult? calculateOrderedWeightBasedWithdrawal({
  required double prescribedAmountPerKg,
  required double dosingWeightKg,
  required double verifiedStockAmountPerMl,
}) {
  if (!prescribedAmountPerKg.isFinite ||
      !dosingWeightKg.isFinite ||
      !verifiedStockAmountPerMl.isFinite ||
      prescribedAmountPerKg <= 0 ||
      dosingWeightKg <= 0 ||
      verifiedStockAmountPerMl <= 0) {
    return null;
  }
  final ordered = prescribedAmountPerKg * dosingWeightKg;
  final volume = ordered / verifiedStockAmountPerMl;
  if (!ordered.isFinite ||
      !volume.isFinite ||
      ordered <= 0 ||
      volume <= 0) {
    return null;
  }
  return IvWeightDoseResult(
    orderedAmount: ordered,
    withdrawalMilliliters: volume,
  );
}
