import '../domain/iv_infusion_rate_engine.dart';

/// Adult norepinephrine presentations with verified, explicitly BASE-equivalent
/// concentration. A premix is never treated as a concentrate to be diluted.
class NorepinephrineReviewedPresentation {
  const NorepinephrineReviewedPresentation({
    required this.id,
    required this.name,
    required this.nominalFinalMcgPerMl,
    required this.stockWithdrawalMl,
    required this.preparation,
    required this.safety,
    required this.sourceUrl,
    required this.readyToUse,
  });

  final String id;
  final String name;
  /// The manufacturer-labeled infusion strength in norepinephrine BASE units.
  /// For the labeled 4 mg vial in a 1,000 mL bag this is nominal ~4 mcg/mL;
  /// adding 4 mL to a 1,000 mL bag technically creates ~1,004 mL.
  final double nominalFinalMcgPerMl;
  final double stockWithdrawalMl;
  final String preparation;
  final String safety;
  final String sourceUrl;
  final bool readyToUse;
}

const norepinephrineConcentrateLabel =
    'https://dailymed.nlm.nih.gov/dailymed/lookup.cfm?setid=c90d875c-8e6e-284e-e053-2a95a90a334f';
const norepinephrinePremixLabel =
    'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=6363e9b4-29df-4553-904d-a563e5adda6e';
const septicShock2026Guideline =
    'https://sccm.org/clinical-resources/guidelines/guidelines/surviving-sepsis-campaign-international-guidelines-for-management-of-sepsis-and-septic-shock-2026';

const reviewedAdultNorepinephrinePresentations =
    <NorepinephrineReviewedPresentation>[
  NorepinephrineReviewedPresentation(
    id: 'concentrate-base4mg-4ml-d5-1000',
    name: 'CONCENTRATE · 4 mg BASE / 4 mL (1 mg/mL)',
    nominalFinalMcgPerMl: 4,
    stockWithdrawalMl: 4,
    readyToUse: false,
    preparation: 'Withdraw the entire 4 mL = 4 mg norepinephrine BASE '
        'from the exact labeled vial. Add to a 1,000 mL bag of D5W, '
        'or a 5%-dextrose-containing sodium chloride solution, as specified '
        'in this concentrate label. Manufacturer calls this approximately '
        '4 mcg/mL (NOMINAL). Adding 4 mL to a full 1,000 mL bag creates '
        'approximately 1,004 mL; do not mistake this for an exactly '
        '1,000 mL final volume.',
    safety: 'MUST DILUTE before infusion. 0.9% saline ALONE is NOT '
        'recommended by this concentrate label. Do not extrapolate a '
        '4 mg/250 mL or 8 mg/250 mL concentrate recipe. The higher '
        'concentrations for fluid restriction require a separate '
        'verified hospital/product protocol.',
    sourceUrl: norepinephrineConcentrateLabel,
  ),
  NorepinephrineReviewedPresentation(
    id: 'baxter-premix-4mg-250ml',
    name: 'Baxter READY TO USE · 4 mg BASE / 250 mL',
    nominalFinalMcgPerMl: 16,
    stockWithdrawalMl: 0,
    readyToUse: true,
    preparation: 'Factory-prepared norepinephrine BASE-equivalent 4 mg '
        'in 250 mL, 16 mcg/mL. No vial withdrawal. NO FURTHER DILUTION. '
        'Confirm the original 250 mL container label before connecting pump.',
    safety: 'Baxter premix ONLY. Do not copy premix instructions '
        'to a concentrate ampoule or different manufacturer.',
    sourceUrl: norepinephrinePremixLabel,
  ),
  NorepinephrineReviewedPresentation(
    id: 'baxter-premix-8mg-250ml',
    name: 'Baxter READY TO USE · 8 mg BASE / 250 mL',
    nominalFinalMcgPerMl: 32,
    stockWithdrawalMl: 0,
    readyToUse: true,
    preparation: 'Factory-prepared norepinephrine BASE-equivalent 8 mg '
        'in 250 mL, 32 mcg/mL. No vial withdrawal. NO FURTHER DILUTION.',
    safety: 'Baxter premix ONLY. Do not infer this strength from the '
        'total milligrams of a concentrate vial.',
    sourceUrl: norepinephrinePremixLabel,
  ),
  NorepinephrineReviewedPresentation(
    id: 'baxter-premix-16mg-250ml',
    name: 'Baxter READY TO USE · 16 mg BASE / 250 mL',
    nominalFinalMcgPerMl: 64,
    stockWithdrawalMl: 0,
    readyToUse: true,
    preparation: 'Factory-prepared norepinephrine BASE-equivalent 16 mg '
        'in 250 mL, 64 mcg/mL. No vial withdrawal. NO FURTHER DILUTION.',
    safety: 'Baxter premix ONLY. High-concentration pump programming '
        'requires independent patient-specific verification.',
    sourceUrl: norepinephrinePremixLabel,
  ),
];

NorepinephrineReviewedPresentation? findReviewedNorepinephrinePresentation(
    String? id) {
  for (final p in reviewedAdultNorepinephrinePresentations) {
    if (p.id == id) return p;
  }
  return null;
}

/// This engine calculates only an independently ORDERED dose, using
/// exact manufacturer BASE-equivalent units and selected label concentration.
/// Neither indication nor weight suggests a dose automatically.
IvInfusionRateResult? orderedNorepinephrinePumpRate({
  required NorepinephrineReviewedPresentation? product,
  required double? prescribedRate,
  required IvOrderedRateUnit rateUnit,
  required double? weightKg,
  required bool productConfirmed,
  required bool orderConfirmed,
}) {
  if (!productConfirmed || !orderConfirmed ||
      product == null || prescribedRate == null) {
    return null;
  }
  if (rateUnit != IvOrderedRateUnit.mcgPerKgMin &&
      rateUnit != IvOrderedRateUnit.mcgPerMin) {
    return null;
  }
  return calculateOrderedIvInfusion(
    prescribedRate: prescribedRate,
    rateUnit: rateUnit,
    finalMicrogramsPerMilliliter: product.nominalFinalMcgPerMl,
    weightKg: weightKg,
  );
}
