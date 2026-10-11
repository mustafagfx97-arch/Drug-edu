/// Norepinephrine product strengths may display the free base (active drug)
/// OR the mass of a tartrate/bitartrate SALT. Those are NOT interchangeable.
/// All dose mathematics in this module use norepinephrine BASE equivalents.
enum NorepinephrineStockMode {
  reviewedOneMgBasePerMl,
  otherProduct,
}

enum NorepinephrinePrintedMassBasis {
  norepinephrineBase,
  norepinephrineSalt,
}

class NorepinephrineBaseStock {
  const NorepinephrineBaseStock({
    required this.baseAmountMgPerVial,
    required this.baseConcentrationMgPerMl,
    required this.vialVolumeMl,
    required this.requiresIndependentManufacturerVerification,
  });

  final double baseAmountMgPerVial;
  final double baseConcentrationMgPerMl;
  final double vialVolumeMl;
  final bool requiresIndependentManufacturerVerification;
}

/// Never extrapolate a 2:1 or 4:1 salt/base conversion from the name.
/// For a non-reviewed product, the clinician must check BOTH the package
/// and the explicit base-equivalent amount printed in product documents.
/// An independent confirmation gates arithmetic; it does not certify that
/// any proposed diluent, final concentration or infusion is clinically valid.
NorepinephrineBaseStock? resolveNorepinephrineBaseStock({
  required NorepinephrineStockMode mode,
  required NorepinephrinePrintedMassBasis printedBasis,
  required double printedVialMg,
  required double vialMl,
  double? statedBaseEquivalentMg,
  required bool productLabelVerified,
}) {
  if (!printedVialMg.isFinite || !vialMl.isFinite ||
      printedVialMg <= 0 || vialMl <= 0) {
    return null;
  }
  if (mode == NorepinephrineStockMode.reviewedOneMgBasePerMl) {
    if (printedBasis != NorepinephrinePrintedMassBasis.norepinephrineBase ||
        (printedVialMg - 4).abs() > 0.000001 ||
        (vialMl - 4).abs() > 0.000001) {
      return null;
    }
    return const NorepinephrineBaseStock(
      baseAmountMgPerVial: 4,
      baseConcentrationMgPerMl: 1,
      vialVolumeMl: 4,
      requiresIndependentManufacturerVerification: false,
    );
  }
  if (!productLabelVerified) return null;

  final double baseMg;
  if (printedBasis == NorepinephrinePrintedMassBasis.norepinephrineBase) {
    baseMg = printedVialMg;
  } else {
    // Salt mass does not determine base equivalence without the exact label.
    if (statedBaseEquivalentMg == null ||
        !statedBaseEquivalentMg.isFinite ||
        statedBaseEquivalentMg <= 0 ||
        statedBaseEquivalentMg >= printedVialMg) {
      return null;
    }
    baseMg = statedBaseEquivalentMg;
  }
  final concentration = baseMg / vialMl;
  if (!concentration.isFinite || concentration <= 0) return null;
  return NorepinephrineBaseStock(
    baseAmountMgPerVial: baseMg,
    baseConcentrationMgPerMl: concentration,
    vialVolumeMl: vialMl,
    requiresIndependentManufacturerVerification: true,
  );
}
