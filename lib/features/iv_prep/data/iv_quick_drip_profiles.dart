import '../domain/iv_infusion_rate_engine.dart';
import 'iv_unified_infusion_library.dart';
import '../domain/iv_dilution_safety_engine.dart';

/// Adult-only, product-specific shortcuts for fast stock + pump arithmetic.
/// A reference low dose is NOT a patient prescription or an instruction to
/// start/increase a drip without an independent medical order.
class IvQuickDripProfile {
  const IvQuickDripProfile({
    required this.id,
    required this.drug,
    required this.stockLabel,
    required this.totalDrugMg,
    required this.stockMl,
    required this.defaultAddedFluidMl,
    required this.fluid,
    required this.doseUnit,
    required this.initialReference,
    required this.step,
    required this.note,
    required this.sourceUrl,
    this.maxReference,
    this.premix = false,
    this.readyFinalMcgPerMl,
  });

  final String id; // links to existing source-reviewed infusion record
  final String drug;
  final String stockLabel;
  final double totalDrugMg;
  final double stockMl;
  final double defaultAddedFluidMl;
  final IvDiluent fluid;
  final IvOrderedRateUnit doseUnit;
  final double? initialReference;
  final double step;
  final double? maxReference;
  final String note;
  final String sourceUrl;
  final bool premix;
  final double? readyFinalMcgPerMl;

  /// When fluid is physically ADDED to a full bag, drug stock adds volume.
  double finalMl(double fluidAddedMl) =>
      premix ? totalDrugMg * 1000 / readyFinalMcgPerMl! : stockMl + fluidAddedMl;

  double finalMcgMl(double fluidAddedMl) =>
      premix ? readyFinalMcgPerMl! : totalDrugMg * 1000 / finalMl(fluidAddedMl);
}

const _d = IvOrderedRateUnit.mcgPerKgMin;
const _mcgMin = IvOrderedRateUnit.mcgPerMin;
const _mgHr = IvOrderedRateUnit.mgPerHour;
const _mgMin = IvOrderedRateUnit.mgPerMin;
const _mcgKgHr = IvOrderedRateUnit.mcgPerKgHour;
const _ns = IvDiluent.normalSaline;
const _d5 = IvDiluent.d5w;

final ivQuickDripProfiles = <IvQuickDripProfile>[
  IvQuickDripProfile(
    id: 'dobutamine-hospira-250mg-in-500ml-diluent',
    drug: 'Dobutamine', stockLabel: '250 mg / 20 mL (12.5 mg/mL)',
    totalDrugMg: 250, stockMl: 20, defaultAddedFluidMl: 480,
    fluid: _ns, doseUnit: _d, initialReference: 0.5, step: 0.5,
    maxReference: 40,
    note: 'Reference 0.5–1 mcg/kg/min low start. Titrate to an ORDER and '
        'hemodynamic response; usual effect at 2–20. Exact final volume is '
        '480 mL fluid + 20 mL stock = 500 mL.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=89becb0c-da60-4f43-0a98-29ff7a9eca58',
  ),
  IvQuickDripProfile(
    id: 'dopamine-hospira-200mg-in-250ml',
    drug: 'Dopamine', stockLabel: '200 mg / 5 mL (40 mg/mL)',
    totalDrugMg: 200, stockMl: 5, defaultAddedFluidMl: 245,
    fluid: _ns, doseUnit: _d, initialReference: 2, step: 5, maxReference: 50,
    note: 'Label initial 2–5 mcg/kg/min; further 5–10 mcg/kg/min '
        'increments by response. Use large vein and monitor BP/ECG.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=1f306ad2-3606-4525-5a8a-ce78f426c1a2',
  ),
  IvQuickDripProfile(
    id: 'dopamine-hospira-400mg-in-250ml',
    drug: 'Dopamine', stockLabel: '400 mg / 10 mL (40 mg/mL)',
    totalDrugMg: 400, stockMl: 10, defaultAddedFluidMl: 240,
    fluid: _ns, doseUnit: _d, initialReference: 2, step: 5, maxReference: 50,
    note: 'Label initial 2–5 mcg/kg/min; titrate only on clinician order.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=1f306ad2-3606-4525-5a8a-ce78f426c1a2',
  ),
  IvQuickDripProfile(
    id: 'epinephrine-1mg-1000ml-dextrose-septic',
    drug: 'Epinephrine', stockLabel: '1 mg / 1 mL (1 mg/mL)',
    totalDrugMg: 1, stockMl: 1, defaultAddedFluidMl: 999,
    fluid: _d5, doseUnit: _d, initialReference: 0.05, step: 0.05,
    maxReference: 2,
    note: 'Adult SEPTIC SHOCK infusion only, NOT arrest IV push or IM '
        'anaphylaxis. Start 0.05 mcg/kg/min label reference; use prescribed '
        'weight (some formulations specify IBW).',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=1e8ebac1-5b32-47f9-a930-86a98a24dccc',
  ),
  IvQuickDripProfile(
    id: 'norepinephrine-concentrate-final-4mcg-ml',
    drug: 'Norepinephrine', stockLabel: '4 mg / 4 mL (1 mg/mL BASE)',
    totalDrugMg: 4, stockMl: 4, defaultAddedFluidMl: 1000,
    fluid: _d5, doseUnit: _mcgMin, initialReference: 8, step: 2,
    note: 'Reference U.S. concentrate-label initial 8–12 mcg/min in adults; '
        'NOT a universal weight-based start. Product table 4 mcg/mL is '
        'NOMINAL: 1000 mL diluent + 4 mL stock = 1004 mL ACTUAL.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/lookup.cfm?setid=c90d875c-8e6e-284e-e053-2a95a90a334f',
  ),
  IvQuickDripProfile(
    id: 'baxter-premix-4mg-250ml',
    drug: 'Norepinephrine', stockLabel: 'READY 4 mg / 250 mL (16 mcg/mL)',
    totalDrugMg: 4, stockMl: 0, defaultAddedFluidMl: 0,
    fluid: _ns, doseUnit: _mcgMin, initialReference: 8, step: 2,
    premix: true, readyFinalMcgPerMl: 16,
    note: 'Factory premix: do NOT dilute. Confirm exact BASE-equivalent '
        'label. Adult label dose reference is NOT an automatic order.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=6363e9b4-29df-4553-904d-a563e5adda6e',
  ),
  IvQuickDripProfile(
    id: 'baxter-premix-8mg-250ml',
    drug: 'Norepinephrine', stockLabel: 'READY 8 mg / 250 mL (32 mcg/mL)',
    totalDrugMg: 8, stockMl: 0, defaultAddedFluidMl: 0,
    fluid: _ns, doseUnit: _mcgMin, initialReference: 8, step: 2,
    premix: true, readyFinalMcgPerMl: 32,
    note: 'Factory premix: no extra fluid. Confirm drug BASE equivalent.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=6363e9b4-29df-4553-904d-a563e5adda6e',
  ),
  IvQuickDripProfile(
    id: 'baxter-premix-16mg-250ml',
    drug: 'Norepinephrine', stockLabel: 'READY 16 mg / 250 mL (64 mcg/mL)',
    totalDrugMg: 16, stockMl: 0, defaultAddedFluidMl: 0,
    fluid: _ns, doseUnit: _mcgMin, initialReference: 8, step: 2,
    premix: true, readyFinalMcgPerMl: 64,
    note: 'Factory premix: do NOT dilute. Confirm the exact '
        'norepinephrine BASE-equivalent bag and pump library.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=6363e9b4-29df-4553-904d-a563e5adda6e',
  ),
  IvQuickDripProfile(
    id: 'nitroglycerin-final-100mcg-ml',
    drug: 'Nitroglycerin', stockLabel: '50 mg / 10 mL (5 mg/mL)',
    totalDrugMg: 50, stockMl: 10, defaultAddedFluidMl: 490,
    fluid: _d5, doseUnit: _mcgMin, initialReference: 5, step: 5,
    note: '5 mcg/min initial if NON-ADSORBING tubing. Titrate by 5 '
        'mcg/min initially (3–5 min); clinical response governs.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=578d8159-5ec6-457f-b4a8-9add624d43a8',
  ),
  IvQuickDripProfile(
    id: 'dexmedetomidine-200mcg-in-final-50ml',
    drug: 'Dexmedetomidine',
    stockLabel: '200 mcg / 2 mL (100 mcg/mL)',
    totalDrugMg: 0.2, stockMl: 2, defaultAddedFluidMl: 48,
    fluid: _ns, doseUnit: _mcgKgHr, initialReference: 0.2, step: 0.1,
    maxReference: 0.7,
    note: 'Adult ICU maintenance (not procedural sedation): '
        '0.2–0.7 mcg/kg/HOUR; age/liver considerations. No loading '
        'dose assumed. Confirm individual prescription.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=ebdfe2e8-30ca-4f18-935a-41bcbbce4937',
  ),
  IvQuickDripProfile(
    id: 'nicardipine-source', drug: 'Nicardipine',
    stockLabel: '25 mg / 10 mL (2.5 mg/mL)',
    totalDrugMg: 25, stockMl: 10, defaultAddedFluidMl: 240,
    fluid: _ns, doseUnit: _mgHr, initialReference: 5, step: 2.5,
    maxReference: 15,
    note: 'Adult IV hypertension, not oral-to-IV conversion: '
        '5 mg/hour initially; increase 2.5 mg/hour every 5–15 min '
        'to max 15 mg/hour as ordered.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/lookup.cfm?setid=b0e2bed3-f928-43ab-a05c-275bedc9856f&version=3',
  ),
  IvQuickDripProfile(
    id: 'nitroprusside-50mg-in-250ml-d5w',
    drug: 'Sodium nitroprusside',
    stockLabel: '50 mg / 2 mL (25 mg/mL)',
    totalDrugMg: 50, stockMl: 2, defaultAddedFluidMl: 248,
    fluid: _d5, doseUnit: _d, initialReference: 0.3, step: 0.1,
    maxReference: 10,
    note: 'Start low 0.3 mcg/kg/min reference. Protect from LIGHT, '
        'monitor BP continuously and evaluate toxicity risks.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=6fbfb86c-da8d-4741-b1e0-7000e2bbad5f',
  ),
  IvQuickDripProfile(
    id: 'amiodarone-vt-maintenance-900mg-in-500ml-d5w',
    drug: 'Amiodarone',
    stockLabel: '900 mg total / 18 mL (50 mg/mL)',
    totalDrugMg: 900, stockMl: 18, defaultAddedFluidMl: 482,
    fluid: _d5, doseUnit: _mgMin, initialReference: 1, step: 0.5,
    maxReference: 1,
    note: 'Adult life-threatening VT/VF: 1 mg/min first 6 hours, '
        'then 0.5 mg/min next 18 hours in the LABELED pathway. '
        'Not the initial 150 mg/10-min load or cardiac arrest bolus.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=0a28ae25-7cc4-4ac0-a2ba-7820fb93e25c',
  ),
  IvQuickDripProfile(
    id: 'cleviprex-rtu-500mcg-ml',
    drug: 'Clevidipine', stockLabel: 'READY 0.5 mg/mL (do not dilute)',
    totalDrugMg: 0, stockMl: 0, defaultAddedFluidMl: 0,
    fluid: _ns, doseUnit: _mgHr, initialReference: 1, step: 1,
    maxReference: 32,
    premix: true, readyFinalMcgPerMl: 500,
    note: 'Start 1–2 mg/hour per Cleviprex label. '
        'Dose doubling may be appropriate initially but NOT '
        'once approaching goal; monitor lipid load and BP.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=f9290625-b723-4eda-bab8-a97bef6041f6',
  ),
  IvQuickDripProfile(
    id: 'brevibloc-rtu-10mg-ml', drug: 'Esmolol',
    stockLabel: 'READY 10 mg/mL (do not dilute)',
    totalDrugMg: 0, stockMl: 0, defaultAddedFluidMl: 0,
    fluid: _ns, doseUnit: _d, initialReference: 50, step: 50,
    maxReference: 200,
    premix: true, readyFinalMcgPerMl: 10000,
    note: 'SVT pathway: infusion 50 mcg/kg/min; optional '
        '500 mcg/kg loading dose is NOT calculated here. '
        'Increase to 100/150/200 as prescribed.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=60b10020-f802-4fef-a487-0f11eca246c5',
  ),
  IvQuickDripProfile(
    id: 'labetalol-200-in-200', drug: 'Labetalol',
    stockLabel: '200 mg / 40 mL (5 mg/mL)',
    totalDrugMg: 200, stockMl: 40, defaultAddedFluidMl: 160,
    fluid: _ns, doseUnit: _mgMin, initialReference: null, step: 0.5,
    note: 'No universal infusion start across labeled/local '
        'hypertension pathways. Enter the clinician-ORDERED mg/min; '
        '+/− are arithmetic increments only, NOT dose advice.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=502bb655-9ad8-481b-9e26-1dec8adef471',
  ),
];

List<IvQuickDripProfile> quickDripOptionsFor(String drug) =>
    ivQuickDripProfiles.where((p) => p.drug == drug).toList(growable: false);

/// Reference record is for optional deeper pharmacy checks. Quick profiles
/// without exact linked records remain explicit (e.g. exact CARDENE vial).
IvInfusionPreparation? quickReviewedPreparation(String id) {
  for (final p in ivUnifiedInfusionPreparations) {
    if (p.id == id) return p;
  }
  return null;
}
