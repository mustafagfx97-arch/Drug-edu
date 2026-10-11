import '../domain/iv_infusion_rate_engine.dart';

/// Preset uses ONLY the exact verified FINAL infusion concentration.
/// An undiluted concentrate may never appear here.
class IvInfusionRateProfile {
  const IvInfusionRateProfile({
    required this.id,
    required this.name,
    required this.population,
    required this.finalMicrogramsPerMilliliter,
    required this.orderedUnit,
    required this.presentation,
    required this.preparationLock,
    required this.compatibilityLock,
    required this.sourceUrl,
  });

  final String id;
  final String name;
  final String population;
  final double finalMicrogramsPerMilliliter;
  final IvOrderedRateUnit orderedUnit;
  final String presentation;
  final String preparationLock;
  final String compatibilityLock;
  final String sourceUrl;
}

const ivInfusionRateProfiles = <IvInfusionRateProfile>[
  IvInfusionRateProfile(
    id: 'cardene-iv-final-100mcg-ml',
    name: 'Nicardipine · CARDENE IV diluted vial',
    population: 'CCU / adult',
    finalMicrogramsPerMilliliter: 100,
    orderedUnit: IvOrderedRateUnit.mgPerHour,
    presentation: '25 mg/10 mL concentrate + 240 mL compatible fluid = 250 mL FINAL at 0.1 mg/mL.',
    preparationLock: 'Do NOT use 2.5 mg/mL concentrate in pump. Prescribed rate must be mg/hr.',
    compatibilityLock: 'D5W or label-listed saline/dextrose fluids. NOT Lactated Ringer’s or 5% sodium bicarbonate. Drug Y-site compatibility not implied.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=5749599d-ff2a-42e4-aa72-cd25013feee8',
  ),
  IvInfusionRateProfile(
    id: 'cleviprex-rtu-500mcg-ml',
    name: 'Clevidipine · Cleviprex ready to use',
    population: 'CCU / adult',
    finalMicrogramsPerMilliliter: 500,
    orderedUnit: IvOrderedRateUnit.mgPerHour,
    presentation: '0.5 mg/mL lipid emulsion READY TO USE. Do not dilute.',
    preparationLock: 'Check soy/egg allergy, lipid-metabolism disorder and aortic stenosis. Discard 12 hours after puncture.',
    compatibilityLock: 'Must NOT share a line with other medications. Co-administered fluids do not authorize mixing drugs.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/fda/fdaDrugXsl.cfm?setid=f9290625-b723-4eda-bab8-a97bef6041f6',
  ),
  IvInfusionRateProfile(
    id: 'brevibloc-rtu-10mg-ml',
    name: 'Esmolol · BREVIBLOC 10 mg/mL',
    population: 'CCU / adult',
    finalMicrogramsPerMilliliter: 10000,
    orderedUnit: IvOrderedRateUnit.mcgPerKgMin,
    presentation: 'Ready-to-use BREVIBLOC 100 mg/10 mL vial or 2500 mg/250 mL bag; NOT double-strength 20 mg/mL.',
    preparationLock: 'Different premix strengths exist. Only select this if FINAL strength is exactly 10 mg/mL.',
    compatibilityLock: 'Not compatible with 5% sodium bicarbonate or furosemide. Check other medicine Y-site compatibility separately.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=220a07b8-5c68-41a3-8705-fd91f14c50b4',
  ),
  IvInfusionRateProfile(
    id: 'norepinephrine-concentrate-final-4mcg-ml',
    name: 'Norepinephrine · labeled final 4 mcg/mL',
    population: 'CCU / adult',
    finalMicrogramsPerMilliliter: 4,
    orderedUnit: IvOrderedRateUnit.mcgPerKgMin,
    presentation: '4 mg/4 mL stock diluted as labeled in 1000 mL D5-containing fluid = labeled 4 mcg/mL.',
    preparationLock: 'NOT stock 1 mg/mL, a ready-made premix, or an institutionally prepared higher concentration.',
    compatibilityLock: 'Labeled concentrate fluid: D5W or dextrose-containing saline, NOT plain saline.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=4b054c27-ed64-40e2-8eba-b7f2ec780a82',
  ),
  IvInfusionRateProfile(
    id: 'nitroglycerin-final-100mcg-ml',
    name: 'Nitroglycerin · final 50 mg / 500 mL',
    population: 'CCU / adult',
    finalMicrogramsPerMilliliter: 100,
    orderedUnit: IvOrderedRateUnit.mcgPerMin,
    presentation: 'Diluted 50 mg q.s. to 500 mL FINAL = 100 mcg/mL.',
    preparationLock: 'Not for direct IV injection from stock 5 mg/mL. Use appropriate low-adsorption/non-PVC IV administration system.',
    compatibilityLock: 'Do not mix with other medicines or blood. PVC may adsorb drug; product-specific set matters.',
    sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=578d8159-5ec6-457f-b4a8-9add624d43a8',
  ),
];
