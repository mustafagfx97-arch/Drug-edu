part of 'iv_preparation_profiles.dart';

/// High-value adult IV medicines absent from the initial catalog.
/// Each record is locked to a SPECIFIC manufacturer formulation/label.
/// Do not import these instructions into NICU/PICU or non-matching brands.
/// Sources checked 2026-11-11.
const ivMissingCriticalProfiles = <IvPreparationProfile>[
  IvPreparationProfile(
    name: 'Deferoxamine',
    population: 'General',
    formulation:
        'Deferoxamine mesylate lyophilized powder for injection, '
        '500 mg or 2 g single-dose vials. IV, IM and subcutaneous '
        'preparation instructions are DIFFERENT. '
        'This record describes the cited 500 mg/2 g product.',
    reconstitution:
        'For INTRAVENOUS preparation add 5 mL Sterile Water for Injection '
        'to each 500 mg vial; or 20 mL to the matching 2 g vial. '
        'Each produces approximately 95 mg/mL after displacement. '
        'DO NOT use the 2 mL (500 mg) or 8 mL (2 g) IM-only recipes.',
    resultingConcentration:
        'Approximately 95 mg/mL deferoxamine after the labeled IV '
        'reconstitution, NOT 100 mg/mL.',
    furtherDilution:
        'IV reconstituted solution MUST be further diluted. For the '
        '500 mg IV vial, the manufacturer specifies further dilution '
        'with 150 mL compatible infusion fluid; the described IV '
        'concentration is approximately 3–3.5 mg/mL. '
        'DO NOT assume 2 g in the same 150 mL is acceptable: use '
        'an exact, independently verified product/hospital infusion recipe.',
    allowedDiluents:
        'For the cited 500 mg IV preparation, 0.9% Sodium Chloride, '
        '0.45% Sodium Chloride, D5W, or Lactated Ringers '
        'are labeled further-dilution fluids. Sterile Water for '
        'Injection is used for powder reconstitution, not as an '
        'undiluted IV infusion vehicle.',
    administration:
        'Acute iron intoxication: manufacturer IV route is reserved '
        'for cardiovascular collapse; initial 1 g by SLOW IV '
        'infusion, not faster than 15 mg/kg/hour. Later 500 mg '
        'doses, if required, not faster than 125 mg/hour; '
        'maximum 6 g/24 hours. Chronic iron overload is a '
        'DIFFERENT protocol: adult IV 40–50 mg/kg/day over 8–12 '
        'hours under specialist direction. Never use the acute '
        'rate limits as a chronic-infusion dosing schedule.',
    stability:
        'If not used immediately, cited reconstituted product may '
        'be kept at room temperature for up to 24 hours; '
        'DO NOT refrigerate the reconstituted solution. '
        'Aseptically compounded infusion beyond-use time may be shorter; '
        'follow institutional sterile-compounding requirements.',
    incompatibilities:
        'Do not administer with a blood transfusion through the same '
        'infusion. Verify Y-site compatibility independently. '
        'Excessive infusion speed may cause hypotension or shock.',
    criticalLocks: [
      'ROUTE LOCK: 500 mg + 5 mL SWFI is IV; 500 mg + 2 mL is IM. '
          'The preparations are not interchangeable.',
      'VOLUME LOCK: 500 mg IV vial reconstitutes to ~95 mg/mL; '
          'do not calculate withdrawal using 500/5 = 100 mg/mL.',
      'IV DILUTION LOCK: 500 mg reconstituted IV product requires '
          'a further 150 mL labeled compatible diluent; never IV push stock.',
      'RATE LOCK: Acute iron intoxication IV route only in '
          'cardiovascular collapse; max initial 15 mg/kg/hour, '
          'later max 125 mg/hour. Chronic overload uses a distinct regimen.',
      '2 g VIAL LOCK: 20 mL reconstitution is labeled but a '
          '2 g/150 mL IV infusion recipe is NOT established here.',
    ],
    sourceLabel:
        'DailyMed · Deferoxamine Mesylate for Injection 500 mg/2 g; '
        '2026 label · https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=d91e16df-8daa-4cd2-86a2-273eaa2446e0',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'deferoxamine-500mg-iv-5ml',
        label: '500 mg IV vial + 5 mL SWFI · ~95 mg/mL',
        unit: 'mg',
        concentration: 95,
        note: 'IV reconstituted stock ONLY; requires further dilution '
            'with a labeled compatible infusion solution.',
      ),
      IvWithdrawalVariant(
        id: 'deferoxamine-2g-iv-20ml',
        label: '2 g IV vial + 20 mL SWFI · ~95 mg/mL',
        unit: 'mg',
        concentration: 95,
        note: 'IV reconstituted stock ONLY. The 500 mg + 150 mL final '
            'infusion example cannot be reused for the 2 g vial.',
      ),
    ],
  ),
  IvPreparationProfile(
    name: 'Fomepizole',
    population: 'General',
    formulation:
        'Fomepizole injection 1 g/mL (1.5 g in a 1.5 mL '
        'single-dose preservative-free vial), American Regent.',
    reconstitution:
        'None. Fomepizole is supplied as 1 g/mL solution. '
        'It may SOLIDIFY below 25°C: warm the closed vial '
        'in the hand or under warm water until liquefied. '
        'This reversible change does not reduce potency.',
    resultingConcentration: '1,000 mg/mL (1 g/mL) in the original vial.',
    furtherDilution:
        'Withdraw the clinician-ordered dose using a '
        'NON-POLYCARBONATE syringe and add it to AT LEAST 100 mL '
        '0.9% Sodium Chloride Injection or D5W. Mix well. '
        'Do not infer a fixed final concentration for every patient.',
    allowedDiluents: '0.9% Sodium Chloride Injection or D5W.',
    administration:
        'Infuse the entire prepared IV dose over 30 minutes. '
        'Treatment is indication- and dialysis-dependent for '
        'methanol/ethylene glycol toxicity; hemodialysis changes '
        'the dosing interval. Do not choose the dose automatically.',
    stability:
        'Labeled diluted solution in D5W or 0.9% NaCl remains '
        'stable for at least 24 hours refrigerated or at room '
        'temperature; preservative-free and must be prepared aseptically. '
        'Do not use beyond 24 hours after dilution.',
    incompatibilities:
        'Use a non-polycarbonate-containing syringe for withdrawal. '
        'Do not mix other drugs without confirmed Y-site compatibility.',
    criticalLocks: [
      'PRODUCT LOCK: 1 g/mL (1000 mg/mL) single-dose vial, '
          'not 1 mg/mL.',
      'DEVICE LOCK: Withdraw with NON-POLYCARBONATE syringe.',
      'DILUTION LOCK: At least 100 mL of D5W or 0.9% NaCl; '
          'never treat 1 g/mL stock as an infusion concentration.',
      'DIALYSIS LOCK: Methanol/ethylene glycol dosing and timing change '
          'during hemodialysis. A generic mg-to-mL tool is not a dosing protocol.',
    ],
    sourceLabel:
        'DailyMed · Fomepizole Injection American Regent '
        '1 g/mL, revised Nov 2020 · '
        'https://dailymed.nlm.nih.gov/dailymed/lookup.cfm?setid=82dc2920-af7f-4e43-9f6d-8877a71884cd',
    withdrawalUnit: 'mg',
    withdrawalConcentration: 1000,
  ),
  IvPreparationProfile(
    name: 'Hydroxocobalamin (Cyanokit)',
    population: 'General',
    formulation:
        'CYANOKIT 5 g lyophilized hydroxocobalamin in a 250 mL '
        'glass vial; kit includes transfer spike and infusion set. '
        'Diluent is NOT supplied.',
    reconstitution:
        'Using the supplied sterile transfer spike, add '
        '200 mL 0.9% Sodium Chloride Injection to the 5 g vial '
        '(vial mark denotes 200 mL). Gently invert/rock '
        'repeatedly for AT LEAST 60 seconds; DO NOT SHAKE. '
        'Inspect: solution should be dark red without particulates.',
    resultingConcentration:
        '5 g in a labeled reconstituted volume of 200 mL = '
        '25 mg/mL. Administer the reconstituted CYANOKIT via '
        'its supplied infusion set.',
    furtherDilution:
        'No separate infusion-bag dilution step for the cited kit: '
        'reconstitute its supplied 5 g powder vial with 200 mL '
        'compatible diluent. Do not transfer this to a '
        'different hydroxocobalamin formulation.',
    allowedDiluents:
        '0.9% Sodium Chloride Injection preferred; '
        'Lactated Ringers or D5W may be used ONLY when '
        '0.9% NaCl is not readily available, per CYANOKIT label.',
    administration:
        'Adult suspected cyanide poisoning: labeled initial 5 g '
        'IV over 15 minutes. A further 5 g may be ordered according '
        'to clinical response and infused over 15 minutes to 2 hours. '
        'This is an EMERGENCY INTERMITTENT INFUSION, '
        'not a titrated mcg/kg/min drip.',
    stability:
        'Once reconstituted, product is stable up to 6 hours '
        'at temperatures not exceeding 40°C. DO NOT FREEZE. '
        'Discard unused reconstituted solution after 6 hours.',
    incompatibilities:
        'CYANOKIT requires a SEPARATE IV line. '
        'Not compatible in the same line with sodium thiosulfate, '
        'sodium nitrite, or ascorbic acid; blood products should '
        'also be administered through a different line.',
    criticalLocks: [
      'KIT LOCK: use CYANOKIT 5 g/250 mL glass vial '
          'with 200 mL reconstitution, not another B12 formulation.',
      'PREPARATION LOCK: invert or rock at least 60 seconds; DO NOT SHAKE.',
      'LINE LOCK: use a separate IV line for CYANOKIT, '
          'not a shared line with thiosulfate, nitrite or blood.',
      'ROUTE LOCK: intermittent 5 g IV over 15 minutes is not a '
          'continuous titrated infusion. Do not add to Quick IV Drip.',
    ],
    sourceLabel:
        'DailyMed · CYANOKIT (hydroxocobalamin for injection) 5 g · '
        'https://dailymed.nlm.nih.gov/dailymed/fda/fdaDrugXsl.cfm?setid=d56fcc8d-bd64-46ab-b0c0-2124bd745a6b&type=display',
  ),
  IvPreparationProfile(
    name: 'Methylene blue (ProvayBlue)',
    population: 'General',
    formulation:
        'PROVAYBLUE methylene blue for injection 5 mg/mL '
        '(50 mg/10 mL or 10 mg/2 mL) single-dose vial/ampule. '
        'Do NOT assume other methylene-blue brands have identical strength.',
    reconstitution: 'None. This is a ready liquid at 5 mg/mL.',
    resultingConcentration: '5 mg/mL in the undiluted vial.',
    furtherDilution:
        'May be diluted in 50 mL D5W to reduce local pain, '
        'particularly in pediatric use; dilution is OPTIONAL '
        'for this exact product. Use diluted solution immediately. '
        'NEVER use sodium chloride as the diluent for this product.',
    allowedDiluents:
        'If dilution is needed, D5W only for this product. '
        'Avoid saline/chloride-containing diluents, which can reduce '
        'methylene blue solubility.',
    administration:
        'For acquired methemoglobinemia, clinician-ordered '
        '1 mg/kg IV over 5–30 minutes according to the label. '
        'Check response before any repeat dose. '
        'This is NOT a continuous vasopressor infusion.',
    stability:
        'For any D5W dilution, use immediately and discard '
        'unused product from the single-dose container.',
    incompatibilities:
        'Boxed warning: potentially fatal serotonin syndrome with '
        'serotonergic medications and opioids. G6PD deficiency '
        'is a contraindication due to hemolysis risk. '
        'Pulse oximetry readings may be unreliable.',
    criticalLocks: [
      'CONCENTRATION LOCK: PROVAYBLUE is 5 mg/mL, '
          'not other methylene blue formulations.',
      'FLUID LOCK: D5W ONLY when diluting; avoid NS/chloride.',
      'HIGH-RISK LOCK: review serotonergic drugs and opioids '
          'for potentially fatal serotonin syndrome.',
      'CONTRAINDICATION LOCK: G6PD deficiency.',
      'ROUTE LOCK: 5–30 minute intermittent administration; '
          'not an automatically titrated ICU drip.',
    ],
    sourceLabel:
        'DailyMed · PROVAYBLUE methylene blue injection 5 mg/mL · '
        'https://dailymed.nlm.nih.gov/dailymed/fda/fdaDrugXsl.cfm?setid=4f6848e5-35ed-4046-b13c-3032b5ba3232',
    withdrawalUnit: 'mg',
    withdrawalConcentration: 5,
  ),
  IvPreparationProfile(
    name: 'Leucovorin calcium',
    population: 'General',
    formulation:
        'Meitheal leucovorin calcium lyophilized powder '
        'for IV/IM injection in 50, 100, 200, 350 and 500 mg '
        'single-dose vials. Leucovorin is NOT levoleucovorin.',
    reconstitution:
        'For this exact Meitheal product: 50 mg + 5 mL, '
        '100 mg + 10 mL, 200 mg + 20 mL, '
        '350 mg + 17.5 mL, 500 mg + 50 mL '
        'Sterile Water for Injection (SWFI). '
        'Do not assume 350 mg/17.5 mL produces 10 mg/mL.',
    resultingConcentration:
        '50, 100, 200 and 500 mg product vials reconstitute '
        'to 10 mg/mL. The 350 mg/17.5 mL vial is 20 mg/mL.',
    furtherDilution:
        'These are labeled IV reconstitution strengths; '
        'an exact additional infusion bag/duration must be '
        'chosen from an indication-specific oncology/local protocol. '
        'Do not invent a generic bag volume from vial strength alone.',
    allowedDiluents:
        'Sterile Water for Injection is supported for reconstitution. '
        'The product also labels Bacteriostatic Water for Injection '
        '(benzyl alcohol), but with doses >10 mg/m² use SWFI '
        'and administer immediately. No universal infusion-fluid '
        'compatibility is declared here.',
    administration:
        'IV or IM according to the indication-specific order. '
        'Because of calcium content, do NOT exceed 160 mg '
        'of leucovorin per minute by IV administration. '
        'Dosing varies critically between methotrexate rescue, '
        'other folate-antagonist toxicity and 5-fluorouracil regimens. '
        'Never administer intrathecally.',
    stability:
        'Reconstituted with SWFI: use immediately, discard remainder. '
        'With benzyl-alcohol bacteriostatic water: cited label permits '
        'use within 7 days, but avoid for >10 mg/m². '
        'Sterile-compounding BUD and local handling policy may be stricter.',
    incompatibilities:
        'Do not mix leucovorin and 5-fluorouracil in the same '
        'IV infusion: precipitation can occur. Leucovorin '
        'can increase fluoropyrimidine toxicity.',
    criticalLocks: [
      'VIAL LOCK: 350 mg + 17.5 mL makes 20 mg/mL, '
          'whereas 50/100/200/500 mg preparations make 10 mg/mL.',
      'RATE LOCK: no more than 160 mg/min IV because of calcium content.',
      'DILUENT LOCK: SWFI is needed when dose >10 mg/m²; '
          'benzyl-alcohol BWFI is not interchangeable.',
      'INCOMPATIBILITY LOCK: do not admix with 5-fluorouracil.',
      'ROUTE LOCK: NEVER intrathecal. No automatic MTX rescue dose.',
    ],
    sourceLabel:
        'DailyMed · Meitheal Leucovorin Calcium for Injection, '
        'revised 2025 · https://www.dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=9df20901-6980-4d4e-89ec-40f3c1f91852',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'leucovorin-50-100-200-500-10mgml',
        label: '50/100/200/500 mg vial · labeled 10 mg/mL',
        unit: 'mg',
        concentration: 10,
        note: 'Select the exact 50, 100, 200 or 500 mg vial '
            'and corresponding reconstitution volume listed above.',
      ),
      IvWithdrawalVariant(
        id: 'leucovorin-350mg-20mgml',
        label: '350 mg + 17.5 mL SWFI · labeled 20 mg/mL',
        unit: 'mg',
        concentration: 20,
        note: 'EXCEPTION: the 350 mg vial has twice the concentration.',
      ),
    ],
  ),
  IvPreparationProfile(
    name: 'Vasopressin',
    population: 'General',
    formulation:
        'Vasopressin injection 20 UNITS/mL single-dose vial '
        '(or exact-product 200 units/10 mL multidose vial). '
        'Ready-to-use premixes are DIFFERENT products.',
    reconstitution:
        'None for 20 units/mL concentrate. '
        'IV administration requires FURTHER DILUTION; '
        'never interpret 20 units/mL as a pump-ready concentration.',
    resultingConcentration:
        'Stock = 20 UNITS/mL. Labeled infusion '
        'concentrations: 0.1 UNITS/mL or 1 UNIT/mL. '
        'These are not mg or mcg/mL.',
    furtherDilution:
        'For the cited concentrate label: add '
        '2.5 mL (50 units) to 500 mL compatible fluid '
        'for nominal 0.1 units/mL; or 5 mL (100 units) '
        'to 100 mL compatible fluid for nominal 1 unit/mL '
        '(fluid restriction). Check actual bag volume before '
        'claiming an exact final concentration.',
    allowedDiluents:
        '0.9% Sodium Chloride Injection or D5W for the '
        'cited vasopressin 20 units/mL concentrate.',
    administration:
        'Continuous IV infusion for adults with vasodilatory shock '
        'remaining hypotensive after fluids/catecholamines. '
        'Orders are in UNITS/MIN: labeled septic-shock '
        'start 0.01 units/min (range 0.01–0.07); '
        'post-cardiotomy start 0.03 units/min '
        '(range 0.03–0.1). Indication and monitoring govern '
        'titration. DO NOT calculate as mcg/kg/min.',
    stability:
        'Discard unused diluted solution after 18 hours at '
        'room temperature or 24 hours refrigerated '
        'according to the cited label. Local sterile BUD may be shorter.',
    incompatibilities:
        'Monitor for decreased cardiac output, arrhythmia, '
        'hyponatremia and cardiac/mesenteric/digital ischemia. '
        'Check exact product before using a premix.',
    criticalLocks: [
      'UNITS LOCK: all strength, dose and infusion '
          'calculations are in vasopressin UNITS, not mg or mcg.',
      'CONCENTRATE LOCK: 20 units/mL must be diluted '
          'to a source-verified infusion concentration.',
      'PREMIX LOCK: do not add fluid to a labeled ready-to-use '
          'vasopressin presentation.',
      'RATE LOCK: units/min, with shock-indication-specific '
          'initial and maximum dose recommendations.',
      'CALCULATOR LOCK: generic mg-based Quick IV Drip '
          'is not compatible with vasopressin; this record is '
          'preparation/administration reference until a dedicated '
          'units/min infusion calculator is verified.',
    ],
    sourceLabel:
        'DailyMed · Vasopressin Injection 20 units/mL '
        'single-/multidose vial, 2025 label · '
        'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=0ab267f4-9ec9-44fd-8521-f975074667d9',
    withdrawalUnit: 'units',
    withdrawalConcentration: 20,
  ),
];
