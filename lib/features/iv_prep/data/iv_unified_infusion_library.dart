import '../domain/iv_infusion_rate_engine.dart';
import 'iv_infusion_rate_profiles.dart';
import 'iv_norepinephrine_workflow.dart';
import 'iv_guided_preparation_options.dart';

/// Only continuous infusions with an explicitly reviewed final concentration.
/// A source-locked profile is not a patient-specific order or a generic
/// authorization to prepare the same amount in a different bag size.
class IvInfusionPreparation {
  const IvInfusionPreparation({
    required this.id,
    required this.drug,
    required this.label,
    required this.nominalMcgPerMl,
    required this.orderUnits,
    required this.instructions,
    required this.safety,
    required this.sourceUrl,
    this.isManufacturerNominal = false,
    this.readyToUse = false,
    this.stockLabel,
    this.stockWithdrawalMl,
  });

  final String id;
  final String drug;
  final String label;
  final double nominalMcgPerMl;
  final List<IvOrderedRateUnit> orderUnits;
  final String instructions;
  final String safety;
  final String sourceUrl;
  final bool isManufacturerNominal;
  final bool readyToUse;
  /// Actual vial/syringe concentration, never the pump strength.
  final String? stockLabel;
  /// Only where a labeled example uses a specific vial volume.
  final double? stockWithdrawalMl;
}

const _norepiUnits = [
  IvOrderedRateUnit.mcgPerKgMin,
  IvOrderedRateUnit.mcgPerMin,
];
const _mgHrUnits = [IvOrderedRateUnit.mgPerHour];
const _esmololUnits = [IvOrderedRateUnit.mcgPerKgMin];
const _nitroUnits = [IvOrderedRateUnit.mcgPerMin];
const _dobutamineUnits = [IvOrderedRateUnit.mcgPerKgMin];
const _dopamineUnits = [IvOrderedRateUnit.mcgPerKgMin];
const _epinephrineUnits = [IvOrderedRateUnit.mcgPerKgMin];
const _dexmedetomidineUnits = [IvOrderedRateUnit.mcgPerKgHour];
const _labetalolUnits = [
  IvOrderedRateUnit.mgPerMin,
  IvOrderedRateUnit.mgPerHour,
];

/// These records deliberately exclude NICU/PICU, intermittent IV pushes,
/// unreviewed concentrate strengths and salt/base assumptions.
final ivUnifiedInfusionPreparations = <IvInfusionPreparation>[
  for (final old in ivInfusionRateProfiles)
    IvInfusionPreparation(
      id: old.id,
      drug: switch (old.id) {
        'cardene-iv-final-100mcg-ml' => 'Nicardipine',
        'cleviprex-rtu-500mcg-ml' => 'Clevidipine',
        'brevibloc-rtu-10mg-ml' => 'Esmolol',
        'norepinephrine-concentrate-final-4mcg-ml' => 'Norepinephrine',
        'nitroglycerin-final-100mcg-ml' => 'Nitroglycerin',
        _ => 'Unreviewed',
      },
      label: old.name,
      nominalMcgPerMl: old.finalMicrogramsPerMilliliter,
      orderUnits: switch (old.orderedUnit) {
        IvOrderedRateUnit.mcgPerKgMin =>
            old.id == 'brevibloc-rtu-10mg-ml' ? _esmololUnits : _norepiUnits,
        IvOrderedRateUnit.mgPerHour => _mgHrUnits,
        IvOrderedRateUnit.mcgPerMin => _nitroUnits,
        _ => [old.orderedUnit],
      },
      instructions: old.presentation,
      safety: old.preparationLock + ' ' + old.compatibilityLock,
      sourceUrl: old.sourceUrl,
      isManufacturerNominal:
          old.id == 'norepinephrine-concentrate-final-4mcg-ml',
      readyToUse: old.id == 'cleviprex-rtu-500mcg-ml' ||
          old.id == 'brevibloc-rtu-10mg-ml',
    ),
  for (final p in reviewedAdultNorepinephrinePresentations)
    if (p.readyToUse)
      IvInfusionPreparation(
        id: p.id,
        drug: 'Norepinephrine',
        label: p.name,
        nominalMcgPerMl: p.nominalFinalMcgPerMl,
        orderUnits: _norepiUnits,
        instructions: p.preparation,
        safety: p.safety,
        sourceUrl: p.sourceUrl,
        readyToUse: true,
      ),
  // Source-specific NEW adult infusions. Manufacturer "mg in a bag of
  // diluent" concentrations are NOMINAL; if the total final bag volume
  // is independently measured instead, use verified local calculation.
  IvInfusionPreparation(
    id: 'dobutamine-hospira-250mg-in-250ml-diluent',
    drug: 'Dobutamine',
    label: '250 mg/20 mL vial + 250 mL fluid · LABEL NOMINAL 1000 mcg/mL',
    nominalMcgPerMl: 1000,
    orderUnits: _dobutamineUnits,
    stockLabel: '12.5 mg/mL · 250 mg / 20 mL concentrate',
    stockWithdrawalMl: 20,
    instructions: 'Withdraw full 20 mL (= 250 mg) from the matching '
        '12.5 mg/mL vial. The manufacturer chart references '
        '250 mg in 250 mL of diluent as NOMINAL 1000 mcg/mL; '
        'added vial volume can alter the actual final concentration. '
        'If an exact final volume is needed, use a validated local '
        'final-volume recipe and verify the prepared container.',
    safety: 'MUST DILUTE; minimum final dilution volume 50 mL. '
        'D5W or 0.9% NaCl are label-listed compatible fluids. '
        'Never mix with sodium bicarbonate/strongly alkaline solutions. '
        'Continuous pump infusion with ECG, HR and BP monitoring.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=89becb0c-da60-4f43-0a98-29ff7a9eca58',
    isManufacturerNominal: true,
  ),
  IvInfusionPreparation(
    id: 'dobutamine-hospira-250mg-in-500ml-diluent',
    drug: 'Dobutamine',
    label: '250 mg/20 mL vial + 500 mL fluid · LABEL NOMINAL 500 mcg/mL',
    nominalMcgPerMl: 500,
    orderUnits: _dobutamineUnits,
    stockLabel: '12.5 mg/mL · 250 mg / 20 mL concentrate',
    stockWithdrawalMl: 20,
    instructions: 'Withdraw full 20 mL (= 250 mg) from matching '
        '12.5 mg/mL concentrate. Manufacturer chart: 250 mg in '
        '500 mL of diluent, labeled NOMINAL 500 mcg/mL. '
        'Extra vial volume changes the physical final volume.',
    safety: 'MUST DILUTE; D5W or 0.9% NaCl permitted by cited label. '
        'Do not mix with strongly alkaline solutions. '
        'Titrate only by ordered mcg/kg/min, with hemodynamic monitoring.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=89becb0c-da60-4f43-0a98-29ff7a9eca58',
    isManufacturerNominal: true,
  ),
  IvInfusionPreparation(
    id: 'dopamine-hospira-200mg-in-250ml',
    drug: 'Dopamine',
    label: '200 mg/5 mL + 250 mL fluid · LABEL NOMINAL 800 mcg/mL',
    nominalMcgPerMl: 800,
    orderUnits: _dopamineUnits,
    stockLabel: '40 mg/mL · 200 mg / 5 mL concentrate',
    stockWithdrawalMl: 5,
    instructions: 'Transfer 5 mL = 200 mg from exact 40 mg/mL '
        'concentrate to a 250 mL bottle of permitted fluid as '
        'specified in the manufacturer table (nominal 800 mcg/mL).',
    safety: 'Not an undiluted IV injection. D5W, 0.9% NaCl and other '
        'listed fluids permitted. Sodium bicarbonate, blood and iron '
        'salts must NOT share the infusion. Use pump in large vein; '
        'watch extravasation and BP/rhythm. Actual final volume differs.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=1f306ad2-3606-4525-5a8a-ce78f426c1a2',
    isManufacturerNominal: true,
  ),
  IvInfusionPreparation(
    id: 'dopamine-hospira-400mg-in-250ml',
    drug: 'Dopamine',
    label: '400 mg/10 mL + 250 mL fluid · LABEL NOMINAL 1600 mcg/mL',
    nominalMcgPerMl: 1600,
    orderUnits: _dopamineUnits,
    stockLabel: '40 mg/mL · 400 mg / 10 mL concentrate',
    stockWithdrawalMl: 10,
    instructions: 'Transfer 10 mL = 400 mg from exact 40 mg/mL '
        'concentrate to 250 mL permitted fluid. Manufacturer table '
        'quotes nominal 1600 mcg/mL, not independently checked exact final.',
    safety: 'Mandatory dilution. Do NOT use bicarbonate, blood or '
        'iron salts in the same line. Watch tissue extravasation. '
        'Actual final volume differs from 250 mL if vial is added.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=1f306ad2-3606-4525-5a8a-ce78f426c1a2',
    isManufacturerNominal: true,
  ),
  IvInfusionPreparation(
    id: 'dopamine-hospira-200mg-in-500ml',
    drug: 'Dopamine',
    label: '200 mg/5 mL + 500 mL fluid · LABEL NOMINAL 400 mcg/mL',
    nominalMcgPerMl: 400,
    orderUnits: _dopamineUnits,
    stockLabel: '40 mg/mL · 200 mg / 5 mL concentrate',
    stockWithdrawalMl: 5,
    instructions: 'Transfer 5 mL = 200 mg from exact 40 mg/mL '
        'concentrate to 500 mL compatible fluid (nominal 400 mcg/mL).',
    safety: 'Concentrate must be diluted. Do not mix with '
        'alkalinizing agents, blood or iron salts; monitor access.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=1f306ad2-3606-4525-5a8a-ce78f426c1a2',
    isManufacturerNominal: true,
  ),
  IvInfusionPreparation(
    id: 'epinephrine-1mg-1000ml-dextrose-septic',
    drug: 'Epinephrine',
    label: 'Septic shock · 1 mg/1 mL + 1000 mL D5W · LABEL 1 mcg/mL',
    nominalMcgPerMl: 1,
    orderUnits: _epinephrineUnits,
    stockLabel: '1 mg/mL · 1 mg / 1 mL vial',
    stockWithdrawalMl: 1,
    instructions: 'Adult SEPTIC SHOCK only: add 1 mL (1 mg) of '
        'the exact 1 mg/mL ampoule to 1000 mL 5% dextrose or '
        '5% dextrose with 0.9% NaCl per cited manufacturer label. '
        'Manufacturer calls this a 1 mcg/mL dilution (nominal).',
    safety: 'NOT IM anaphylaxis and NOT cardiac-arrest IV push. '
        'Plain 0.9% saline alone is NOT recommended by the cited label. '
        'Monitor arterial BP, perfusion and extravasation; titrate '
        'ONLY to a prescribed dose and target.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=1e8ebac1-5b32-47f9-a930-86a98a24dccc',
    isManufacturerNominal: true,
  ),
  IvInfusionPreparation(
    id: 'dexmedetomidine-200mcg-in-final-50ml',
    drug: 'Dexmedetomidine',
    label: '200 mcg / 2 mL + 48 mL NS · FINAL 50 mL (4 mcg/mL)',
    nominalMcgPerMl: 4,
    orderUnits: _dexmedetomidineUnits,
    stockLabel: '100 mcg/mL · 200 mcg / 2 mL concentrate',
    stockWithdrawalMl: 2,
    instructions: 'Withdraw 2 mL = 200 mcg from the exact '
        '100 mcg/mL concentrate and ADD 48 mL 0.9% NaCl '
        'to obtain exactly 50 mL FINAL at 4 mcg/mL. Mix gently.',
    safety: 'Concentrate MUST be diluted; ready 4 mcg/mL premixes '
        'are different stock products. Order units mcg/kg/HOUR, '
        'not mcg/kg/min. Continuous HR, BP and oxygen monitoring.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=ebdfe2e8-30ca-4f18-935a-41bcbbce4937',
  ),
  IvInfusionPreparation(
    id: 'nitroglycerin-50mg-250ml-final-200mcg',
    drug: 'Nitroglycerin',
    label: '50 mg/10 mL concentrate → FINAL 250 mL (200 mcg/mL)',
    nominalMcgPerMl: 200,
    orderUnits: _nitroUnits,
    stockLabel: '5 mg/mL · 50 mg / 10 mL concentrate',
    stockWithdrawalMl: 10,
    instructions: 'Withdraw 10 mL = 50 mg concentrate and DILUTE '
        'with D5W or 0.9% NaCl q.s. to exactly 250 mL FINAL '
        '(200 mcg/mL). If using a measured 250 mL bag remove '
        '10 mL BEFORE adding the vial.',
    safety: 'Never IV push concentrate. Use low-sorption '
        'non-PVC infusion set and labeled glass container when required. '
        'Do not mix with blood or other medicines. '
        'Delivery depends on tubing material.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=578d8159-5ec6-457f-b4a8-9add624d43a8',
  ),
  IvInfusionPreparation(
    id: 'nitroglycerin-50mg-125ml-final-400mcg',
    drug: 'Nitroglycerin',
    label: '50 mg/10 mL concentrate → FINAL 125 mL (400 mcg/mL)',
    nominalMcgPerMl: 400,
    orderUnits: _nitroUnits,
    stockLabel: '5 mg/mL · 50 mg / 10 mL concentrate',
    stockWithdrawalMl: 10,
    instructions: 'Withdraw 10 mL = 50 mg and DILUTE with '
        'D5W or 0.9% NaCl q.s. to exactly 125 mL FINAL '
        '(400 mcg/mL). This strength is NOT a standard 250 mL bag.',
    safety: 'Do not exceed labeled dilution-concentration maximum '
        'in this pathway. Use non-PVC/low-adsorption infusion set '
        'and verify the actual glass container/line.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=578d8159-5ec6-457f-b4a8-9add624d43a8',
  ),
  for (final recipe in dilutionRecipesFor('Labetalol', 'General'))
    IvInfusionPreparation(
      id: recipe.id,
      drug: 'Labetalol',
      label: recipe.label,
      nominalMcgPerMl: recipe.finalMgPerMl * 1000,
      orderUnits: _labetalolUnits,
      instructions: 'Stock: ${recipe.stockAmountMg} mg in '
          '${recipe.stockVolumeMl} mL. ADD '
          '${recipe.addedDiluentMl} mL compatible fluid. '
          'FINAL: ${recipe.finalVolumeMl} mL.',
      safety: recipe.safety + ' ' + recipe.diluent,
      sourceUrl: recipe.sourceUrl,
    ),
];

List<String> get ivUnifiedInfusionDrugNames {
  final names = ivUnifiedInfusionPreparations.map((p) => p.drug).toSet().toList()
    ..remove('Unreviewed')
    ..sort();
  return names;
}

List<IvInfusionPreparation> ivUnifiedPreparationsFor(String drug) =>
    ivUnifiedInfusionPreparations
        .where((p) => p.drug == drug).toList(growable: false);

List<IvOrderedRateUnit> ivApprovedOrderUnits(String drug) =>
    switch (drug) {
      'Norepinephrine' => _norepiUnits,
      'Nicardipine' || 'Clevidipine' => _mgHrUnits,
      'Esmolol' => _esmololUnits,
      'Nitroglycerin' => _nitroUnits,
      'Dobutamine' => _dobutamineUnits,
      'Dopamine' => _dopamineUnits,
      'Epinephrine' => _epinephrineUnits,
      'Dexmedetomidine' => _dexmedetomidineUnits,
      'Labetalol' => _labetalolUnits,
      _ => const [],
    };
