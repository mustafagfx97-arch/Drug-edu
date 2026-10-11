part of 'iv_preparation_profiles.dart';

// Exact manufacturer formulations; never transfer rules to a different premix.
const ivHypertensiveEmergencyProfiles = <IvPreparationProfile>[
  IvPreparationProfile(
    name: 'Nicardipine',
    population: 'General',
    formulation: 'CARDENE IV nicardipine hydrochloride 25 mg/10 mL (2.5 mg/mL) single-dose CONCENTRATE vial; not a ready-to-use bag.',
    reconstitution: 'None: liquid concentrate. The vial MUST be diluted before continuous infusion.',
    resultingConcentration: 'Stock: 2.5 mg/mL. FINAL labeled infusion: 25 mg in 250 mL total = 0.1 mg/mL = 100 mcg/mL.',
    furtherDilution: 'Add the complete 10 mL (25 mg) vial to 240 mL compatible IV fluid, giving 250 mL FINAL at 0.1 mg/mL. For a 250 mL bag, remove 10 mL first before adding the vial under local aseptic procedure; never assume adding to a full bag gives an exact 0.1 mg/mL.',
    allowedDiluents: 'Manufacturer-tested dilution fluids: D5W, D5W/0.45% NaCl, D5W/0.9% NaCl, D5W plus 40 mEq potassium, 0.45% NaCl, 0.9% NaCl. Diluent compatibility is NOT other-drug Y-site compatibility.',
    administration: 'Continuous IV pump infusion in large peripheral vein or central line. Continuous BP and HR monitoring; if peripheral change site every 12 hours. Prescriber controls titration; avoid excessive BP reduction.',
    stability: 'For this dilution: 24 hours at controlled room temperature in glass or PVC. Local aseptic compounding BUD may be shorter.',
    incompatibilities: 'NOT compatible as dilution fluid with Lactated Ringer’s or Sodium Bicarbonate 5%. Unknown other-drug Y-site combinations must be verified separately.',
    criticalLocks: [
      'CONCENTRATE 2.5 mg/mL is NOT pump strength; required final 0.1 mg/mL.',
      'Contraindicated in advanced aortic stenosis. Monitor heart failure and renal/hepatic impairment closely.',
      'Only use the infusion calculator with exact labeled FINAL 0.1 mg/mL preparation and ALREADY ordered mg/hour.',
    ],
    sourceLabel: 'DailyMed CARDENE IV 25 mg/10 mL · updated 12/2025 · https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=5749599d-ff2a-42e4-aa72-cd25013feee8',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'cardene-25mg-10ml-stock',
        label: '25 mg/10 mL concentrate STOCK only',
        unit: 'mg',
        concentration: 2.5,
        note: 'Stock withdrawal calculation only; dilution to FINAL 0.1 mg/mL is mandatory.',
      ),
    ],
  ),
  IvPreparationProfile(
    name: 'Clevidipine',
    population: 'General',
    formulation: 'Cleviprex clevidipine injectable lipid emulsion 0.5 mg/mL in 50 mL or 100 mL single-use vial, READY TO USE.',
    reconstitution: 'NONE. Gently invert vial several times before use; inspect emulsion and aseptic integrity.',
    resultingConcentration: '0.5 mg/mL = 500 mcg/mL AS SUPPLIED (final infusion strength).',
    furtherDilution: 'DO NOT DILUTE. Use a calibrated IV pump through peripheral or central vein. Do not add drugs to vial or line.',
    allowedDiluents: 'NO DILUENT needed or permitted. Label allows administration WITH 0.9% NaCl, D5W, D5W/0.9% NaCl, D5W/LR, LR, Water for Injection, 10% amino acid. Fluid co-administration does NOT authorize dilution or medication Y-site mixing.',
    administration: 'Continuous controlled IV infusion with BP and heart-rate monitoring; note additional lipid calories/concurrent lipid infusions. Clinical rate and titration require prescriber order.',
    stability: 'Store unopened refrigerated at 2–8°C; do not freeze. Protect in carton. May transfer in dated carton to controlled room temperature for up to 2 months; do not return to refrigeration. Discard 12 hours after stopper puncture.',
    incompatibilities: 'DO NOT infuse through the same line with ANY OTHER MEDICATION. Never infer medicine Y-site compatibility from the labeled fluids.',
    criticalLocks: [
      'READY TO USE: DO NOT DILUTE or put other medication in the same line.',
      'Contraindicated with soybean/egg allergy, defective lipid metabolism, or severe aortic stenosis.',
      'Use/discard limit is 12 hours from first puncture.',
    ],
    sourceLabel: 'DailyMed Cleviprex 0.5 mg/mL · updated 11/2025 · https://dailymed.nlm.nih.gov/dailymed/fda/fdaDrugXsl.cfm?setid=f9290625-b723-4eda-bab8-a97bef6041f6',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'cleviprex-0.5mg-ml',
        label: 'Ready-to-use emulsion · 0.5 mg/mL',
        unit: 'mg',
        concentration: 0.5,
        note: 'No dilution. This is NOT an instruction to compound an admixture.',
      ),
    ],
  ),
  IvPreparationProfile(
    name: 'Sodium nitroprusside',
    population: 'General',
    formulation: 'Sodium Nitroprusside Injection 50 mg/2 mL (25 mg/mL) single-dose CONCENTRATE. Other separately marketed ready-to-use saline products have different instructions.',
    reconstitution: 'None; liquid concentrate is NOT for direct IV injection.',
    resultingConcentration: 'Stock 25 mg/mL. Labeled 50 mg dilution uses 250 to 1000 mL sterile D5W; FINAL concentration must be verified before programming a pump.',
    furtherDilution: 'Dilute the full 50 mg/2 mL concentrate vial in 250 to 1000 mL sterile 5% dextrose injection following exact product/local final-volume method. Cover prepared infusion with opaque light-protection; label says drip chamber and tubing need not be covered.',
    allowedDiluents: 'ONLY sterile D5W for this CONCENTRATE label. Do not import saline compatibility from the separately labeled nitroprusside-in-saline READY-TO-USE product.',
    administration: 'Continuous IV pump infusion with continuous BP monitoring. Sudden hypotension, cyanide/thiocyanate toxicity and rapid titration make independent critical-care verification mandatory.',
    stability: 'Diluted solution stable for 24 hours when light protected. Discard bright blue, green, red, or particle-containing preparations. Discard unused single-dose vial remainder.',
    incompatibilities: 'Do not put other drugs in the same solution. Unknown other-drug Y-site compatibility is NOT assumed; verify a separate current reference.',
    criticalLocks: [
      'HIGH ALERT: 25 mg/mL concentrate must NOT be directly injected; D5W dilution and light protection required.',
      'Risk of cyanide toxicity with high exposure; continuous monitoring and protocol-based toxicity checks required.',
      'No preset pump strength: variable labeled dilution volumes require exact final concentration validation.',
    ],
    sourceLabel: 'DailyMed Sodium Nitroprusside 50 mg/2 mL concentrate · updated 04/2026 · https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=6fbfb86c-da8d-4741-b1e0-7000e2bbad5f',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'snp-concentrate-50mg-2ml',
        label: '50 mg/2 mL concentrate STOCK only',
        unit: 'mg',
        concentration: 25,
        note: 'Concentrate withdrawal ONLY; mandatory D5W dilution, not for direct IV injection.',
      ),
    ],
  ),
];
