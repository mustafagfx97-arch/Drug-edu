class IvWithdrawalVariant {
  const IvWithdrawalVariant({
    required this.id,
    required this.label,
    required this.unit,
    required this.concentration,
    required this.note,
  });

  final String id;
  final String label;
  final String unit;
  final double concentration;
  final String note;
}

class IvPreparationProfile {
  const IvPreparationProfile({
    required this.name,
    required this.population,
    required this.formulation,
    required this.reconstitution,
    required this.resultingConcentration,
    required this.furtherDilution,
    required this.allowedDiluents,
    required this.administration,
    required this.stability,
    required this.incompatibilities,
    required this.criticalLocks,
    required this.sourceLabel,
    this.withdrawalUnit = '',
    this.withdrawalConcentration,
    this.withdrawalVariants = const [],
  });

  final String name;
  final String population;
  final String formulation;
  final String reconstitution;
  final String resultingConcentration;
  final String furtherDilution;
  final String allowedDiluents;
  final String administration;
  final String stability;
  final String incompatibilities;
  final List<String> criticalLocks;
  final String sourceLabel;

  /// Optional concentration used only to convert an already prescribed dose
  /// to a withdrawal volume. It never selects a dose or target concentration.
  final String withdrawalUnit;
  final double? withdrawalConcentration;
  final List<IvWithdrawalVariant> withdrawalVariants;

  List<IvWithdrawalVariant> get calculatorVariants {
    if (withdrawalVariants.isNotEmpty) return withdrawalVariants;
    final concentration = withdrawalConcentration;
    if (concentration == null || withdrawalUnit.trim().isEmpty) {
      return const [];
    }
    return [
      IvWithdrawalVariant(
        id: 'default',
        label: 'Verified product concentration',
        unit: withdrawalUnit,
        concentration: concentration,
        note: resultingConcentration,
      ),
    ];
  }
}

const ivPreparationProfiles = <IvPreparationProfile>[
  IvPreparationProfile(
    name: 'Caffeine citrate',
    population: 'NICU',
    formulation:
        'Caffeine citrate injection 60 mg/3 mL = 20 mg/mL caffeine citrate (equivalent to 10 mg/mL caffeine base); single-dose preservative-free vial.',
    reconstitution:
        'None. The labeled product is supplied as a ready solution at 20 mg/mL caffeine citrate.',
    resultingConcentration: '20 mg/mL caffeine citrate.',
    furtherDilution:
        'The FDA/DailyMed label provides dose volumes from the 20 mg/mL product and does not require routine dilution before syringe-pump administration.',
    allowedDiluents:
        'Do not invent a dilution recipe. Compatibility data in the label include D5W and selected admixtures, but use the exact local/product protocol if dilution is clinically required.',
    administration:
        'The label describes IV loading over 30 minutes and IV maintenance over 10 minutes using a syringe infusion pump. The prescribed dose remains a clinical order.',
    stability:
        'Single-dose, preservative-free vial; discard unused portion. Store the unopened product at controlled room temperature according to the label.',
    incompatibilities:
        'Inspect for particulate matter/discoloration. Compatibility beyond the exact label/local reference must be verified.',
    criticalLocks: [
      'Dose basis lock: caffeine citrate dose is twice the caffeine-base dose. Never interchange mg of citrate and mg of base.',
      'Do not use the previous app default of 8 mg/mL; the labeled product is 20 mg/mL caffeine citrate.',
    ],
    sourceLabel:
        'DailyMed · Caffeine Citrate Injection, USP 20 mg/mL · label includes neonatal administration table',
    withdrawalUnit: 'mg caffeine citrate',
    withdrawalConcentration: 20,
  ),
  IvPreparationProfile(
    name: 'Norepinephrine',
    population: 'General',
    formulation:
        'Norepinephrine bitartrate concentrate 4 mg/4 mL = 1 mg/mL (1000 mcg/mL), formulation requiring dilution.',
    reconstitution:
        'No powder reconstitution. For this exact concentrate label, add the entire 4 mg/4 mL vial to 1,000 mL of 5% Dextrose Injection or a sodium-chloride solution that contains 5% dextrose.',
    resultingConcentration:
        'The manufacturer label states the resulting dilution is 4 mcg/mL norepinephrine.',
    furtherDilution:
        'Use the labeled recipe for this product. Higher concentrations may be used in fluid restriction only under a validated institutional/product protocol; do not let the calculator invent one.',
    allowedDiluents:
        '5% Dextrose Injection, USP, or sodium-chloride solutions containing 5% dextrose for the concentrate label cited here. Saline alone is not recommended by this concentrate label.',
    administration:
        'Continuous IV infusion with hemodynamic monitoring. Dose/rate selection is outside this preparation profile.',
    stability:
        'The cited concentrate label permits the diluted solution for up to 24 hours at 20–25°C and instructs protection from light.',
    incompatibilities:
        'Avoid contact with iron salts, alkalis or oxidizing agents. Whole blood/plasma should be administered separately.',
    criticalLocks: [
      'Product lock: premixed norepinephrine bags are different products and require no further dilution.',
      'Do not reuse this concentrate recipe for a premix or a different manufacturer strength.',
    ],
    sourceLabel:
        'DailyMed · Norepinephrine Bitartrate Injection concentrate 4 mg/4 mL · labeled 4 mcg/mL dilution',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: '4mg-4ml-concentrate',
        label: '4 mg/4 mL concentrate · before required dilution',
        unit: 'mg',
        concentration: 1,
        note:
            'Use only to calculate volume drawn from the 1 mg/mL concentrate. The label then requires dilution; 4 mcg/mL is the labeled infusion concentration for the cited recipe.',
      ),
    ],
  ),
  IvPreparationProfile(
    name: 'Vancomycin',
    population: 'General',
    formulation:
        'Vancomycin hydrochloride powder for injection; single-dose vial strengths vary by product.',
    reconstitution:
        'For the cited conventional 500 mg and 1 g vial label: add 10 mL or 20 mL Sterile Water for Injection, respectively.',
    resultingConcentration:
        '50 mg/mL after reconstitution for 500 mg/10 mL or 1 g/20 mL.',
    furtherDilution:
        'Further dilution is required. The cited label uses at least 100 mL infusion solution for 500 mg and at least 200 mL for 1 g; proportional labeled examples are provided for other doses in current products.',
    allowedDiluents:
        '0.9% Sodium Chloride Injection or 5% Dextrose Injection are compatible in the cited label; other fluids are product-label specific.',
    administration:
        'Intermittent IV infusion over at least 60 minutes in the cited labeling. Infusion duration may need to be longer for larger doses/local policy.',
    stability:
        'For the cited conventional vancomycin product: reconstituted 50 mg/mL vials and solutions diluted in D5W or 0.9% NaCl are labeled stable refrigerated for 14 days. Local sterile-compounding BUD may be shorter and should govern practice.',
    incompatibilities:
        'Vancomycin solutions are acidic; physical incompatibility with beta-lactams is reported. Flush the line between incompatible agents.',
    criticalLocks: [
      'Further dilution is required after reconstitution.',
      'Do not apply pharmacy-bulk-package reconstitution volumes to single-dose vials.',
    ],
    sourceLabel:
        'DailyMed · Vancomycin Hydrochloride for Injection · current single-dose vial preparation labeling',
    withdrawalUnit: 'mg',
    withdrawalConcentration: 50,
  ),
  IvPreparationProfile(
    name: 'Meropenem',
    population: 'General',
    formulation: 'Meropenem powder for injection, 500 mg or 1 g vial.',
    reconstitution:
        'For IV bolus preparation: reconstitute 500 mg with 10 mL Sterile Water for Injection or 1 g with 20 mL Sterile Water for Injection; shake to dissolve and allow to stand until clear.',
    resultingConcentration:
        'Approximately 50 mg/mL after bolus reconstitution.',
    furtherDilution:
        'For infusion, the vial may be reconstituted directly with a compatible infusion fluid or reconstituted first and then further diluted. Follow the exact product stability/diluent section.',
    allowedDiluents:
        'Compatible infusion fluids are product-label specific; do not infer from another carbapenem.',
    administration:
        'Bolus versus infusion instructions differ. Use the route and infusion duration ordered and supported by the exact product/local protocol.',
    stability:
        'For the cited Sandoz label: bolus solution in Sterile Water (up to 50 mg/mL) is stable up to 3 hours at ≤25°C or 13 hours at ≤5°C. Infusion solutions 1–20 mg/mL in 0.9% NaCl are stable 1 hour at ≤25°C or 15 hours at ≤5°C; D5W infusion solutions should be used immediately. Do not freeze. Local sterile-compounding BUD may be shorter.',
    incompatibilities:
        'Compatibility with other drugs has not been established in the cited label; do not mix or physically add meropenem to solutions containing other drugs.',
    criticalLocks: [
      'Reconstitution shown here is specifically for 500 mg and 1 g injection vials.',
      'Do not automatically use bolus preparation instructions for an infusion bag.',
    ],
    sourceLabel:
        'DailyMed · Meropenem for Injection · current preparation table',
    withdrawalUnit: 'mg',
    withdrawalConcentration: 50,
  ),
  IvPreparationProfile(
    name: 'Piperacillin / Tazobactam',
    population: 'General',
    formulation:
        'Piperacillin/tazobactam powder for injection, single-dose vials 2.25 g, 3.375 g or 4.5 g.',
    reconstitution:
        'Reconstitute 2.25 g with 10 mL, 3.375 g with 15 mL, or 4.5 g with 20 mL of a compatible reconstitution diluent; swirl until dissolved.',
    resultingConcentration:
        '202.5 mg/mL total product after the cited reconstitution (180 mg/mL piperacillin + 22.5 mg/mL tazobactam).',
    furtherDilution:
        'After withdrawing the prescribed dose, the current cited label requires further dilution to a final piperacillin concentration of 20–80 mg/mL (tazobactam 2.5–10 mg/mL) in a compatible IV solution.',
    allowedDiluents:
        'Reconstitution options in the cited label include 0.9% sodium chloride, Sterile Water for Injection and D5W; additional bacteriostatic options have product-specific restrictions.',
    administration:
        'The cited conventional label administers the further-diluted dose by IV infusion over at least 30 minutes.',
    stability:
        'For the cited single-dose-vial label: use immediately when possible; discard unused reconstituted vial contents after 24 hours at 20–25°C or 48 hours at 2–8°C. Chemically stable diluted IV bags are labeled up to 24 hours at room temperature or one week refrigerated. Local sterile-compounding BUD may be shorter.',
    incompatibilities:
        'Piperacillin/tazobactam can inactivate aminoglycosides in vitro. Prepare and administer separately unless the exact Y-site drug, concentration and diluent combination is explicitly listed as compatible; the cited label states tobramycin is not compatible for simultaneous Y-site co-administration.',
    criticalLocks: [
      'Select the exact vial strength first; the three vial sizes use different reconstitution volumes.',
      'Premixed/ready-to-use presentations are not this profile.',
    ],
    sourceLabel:
        'DailyMed · Piperacillin and Tazobactam for Injection · reconstitution/dilution section',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'reconstituted-total-product',
        label: 'Reconstituted single-dose vial · total product',
        unit: 'mg total product',
        concentration: 202.5,
        note:
            'After the cited 2.25 g/10 mL, 3.375 g/15 mL or 4.5 g/20 mL reconstitution: 202.5 mg/mL total product = 180 mg/mL piperacillin + 22.5 mg/mL tazobactam. Further dilution is still required.',
      ),
    ],
  ),
  IvPreparationProfile(
    name: 'Ceftriaxone',
    population: 'General',
    formulation:
        'Ceftriaxone powder for injection; conventional vial and piggyback-bottle presentations have different labeled reconstitution volumes.',
    reconstitution:
        'For conventional vials in the cited label: 250 mg + 2.4 mL, 500 mg + 4.8 mL, 1 g + 9.6 mL, or 2 g + 19.2 mL appropriate IV diluent. For piggyback bottles: 1 g + 10 mL or 2 g + 20 mL.',
    resultingConcentration:
        'Approximately 100 mg/mL after the cited vial/piggyback reconstitution.',
    furtherDilution:
        'For standard vials, withdraw the dose and dilute to the desired IV concentration; the cited label recommends 10–40 mg/mL. Piggyback bottles are further diluted to 50 mL or 100 mL with an appropriate calcium-free IV diluent.',
    allowedDiluents:
        'Use calcium-free diluents supported by the exact label. Do not use calcium-containing diluents such as Ringer’s/Hartmann’s for reconstitution or further dilution.',
    administration:
        'The cited label administers IV ceftriaxone by infusion over 30 minutes; in neonates, 60 minutes is recommended to reduce bilirubin-encephalopathy risk.',
    stability:
        'For the cited product, IV solutions at 10–40 mg/mL in Sterile Water, 0.9% NaCl or D5W are labeled stable for 2 days at 25°C or 10 days at 4°C; other diluents have different limits. Local sterile-compounding BUD may be shorter.',
    incompatibilities:
        'Do not use calcium-containing diluents such as Ringer’s/Hartmann’s. The cited label also reports incompatibility in admixture with vancomycin, aminoglycosides and fluconazole; administer sequentially with thorough line flushing when concomitant therapy is required.',
    criticalLocks: [
      'Neonatal lock: ceftriaxone is contraindicated in premature neonates up to postmenstrual age 41 weeks and in hyperbilirubinemic neonates.',
      'Neonatal calcium lock: contraindicated in neonates ≤28 days who require or are expected to require calcium-containing IV solutions, including parenteral nutrition.',
    ],
    sourceLabel:
        'DailyMed · Ceftriaxone for Injection · IV preparation and neonatal contraindication labeling',
    withdrawalUnit: 'mg',
    withdrawalConcentration: 100,
  ),
  IvPreparationProfile(
    name: 'Levetiracetam',
    population: 'General',
    formulation:
        'Levetiracetam injection concentrate 500 mg/5 mL = 100 mg/mL in a single-dose vial.',
    reconstitution:
        'None. The vial is a 100 mg/mL solution concentrate. Withdraw the already prescribed dose from the exact 100 mg/mL vial.',
    resultingConcentration:
        '100 mg/mL before dilution.',
    furtherDilution:
        'The cited label dilutes the prescribed adult dose in 100 mL of a compatible diluent. If a smaller volume is required, such as in pediatric patients, calculate the diluent so the final levetiracetam concentration does not exceed 15 mg/mL.',
    allowedDiluents:
        '0.9% Sodium Chloride Injection, Lactated Ringer’s Injection, or 5% Dextrose Injection.',
    administration:
        'Administer the diluted dose as a 15-minute IV infusion.',
    stability:
        'The cited label states the diluted solution may be stored in PVC bags for no more than 24 hours at controlled room temperature. Discard unused vial contents.',
    incompatibilities:
        'Use only compatibility information supported by the exact label/local reference; do not add unverified medicines to the same bag.',
    criticalLocks: [
      'Concentration lock: the vial is 100 mg/mL; do not confuse this with a final infusion concentration.',
      'Small-volume lock: final diluted concentration must not exceed 15 mg/mL when using less than 100 mL.',
    ],
    sourceLabel:
        'DailyMed · Levetiracetam Injection 500 mg/5 mL · preparation and administration section',
    withdrawalUnit: 'mg',
    withdrawalConcentration: 100,
  ),
  IvPreparationProfile(
    name: 'Ampicillin / Sulbactam',
    population: 'General',
    formulation:
        'Ampicillin/sulbactam powder for injection in 1.5 g and 3 g standard single-dose vials.',
    reconstitution:
        'For the cited standard vials: add 3.2 mL Sterile Water for Injection to the 1.5 g vial or 6.4 mL to the 3 g vial.',
    resultingConcentration:
        '375 mg/mL total drug after reconstitution = 250 mg/mL ampicillin + 125 mg/mL sulbactam. Approximate post-reconstitution volumes are 4 mL for 1.5 g and 8 mL for 3 g.',
    furtherDilution:
        'For IV infusion, immediately further dilute with a suitable parenteral diluent to a total ampicillin/sulbactam concentration of 3–45 mg/mL. The dosage section also describes greater dilution in 50–100 mL for infusion.',
    allowedDiluents:
        'The cited table supports Sterile Water for Injection, 0.9% Sodium Chloride, D5W, Lactated Ringer’s, M/6 sodium lactate and selected dextrose/saline solutions, with different stability limits.',
    administration:
        'The cited label allows slow IV injection over at least 10–15 minutes or an IV infusion over 15–30 minutes after appropriate further dilution.',
    stability:
        'Stability is diluent/concentration specific. Examples from the cited label: in SWFI or 0.9% NaCl at 45 mg/mL total, 8 hours at about 25°C or 48 hours refrigerated; at 30 mg/mL in those diluents, up to 72 hours refrigerated. D5W limits are shorter. Local sterile-compounding BUD may be shorter.',
    incompatibilities:
        'Aminoglycosides should be reconstituted and administered separately because aminopenicillins can inactivate them in vitro.',
    criticalLocks: [
      'Dose-basis lock: concentrations and withdrawal calculations here use TOTAL ampicillin + sulbactam mg, not ampicillin alone.',
      'Product lock: 1.5 g/3 g standard vials are not the 15 g pharmacy bulk package.',
    ],
    sourceLabel:
        'DailyMed · Ampicillin and Sulbactam for Injection, USP · current standard-vial directions for use',
    withdrawalUnit: 'mg total ampicillin/sulbactam',
    withdrawalConcentration: 375,
  ),
  IvPreparationProfile(
    name: 'Cefazolin',
    population: 'General',
    formulation:
        'Cefazolin powder for injection in 1 g, 2 g or 3 g single-dose vials.',
    reconstitution:
        'For the cited vial product: add 2.5 mL Sterile Water for Injection to 1 g, 5 mL to 2 g, or 7.5 mL to 3 g; shake well.',
    resultingConcentration:
        'Approximately 330 mg/mL after reconstitution. Approximate available volumes are 3 mL, 6 mL and 9 mL for the 1 g, 2 g and 3 g vials, respectively.',
    furtherDilution:
        'For intermittent or continuous IV infusion, further dilute the reconstituted dose in 50–100 mL of a compatible solution. For labeled direct IV injection, the reconstituted vial is further diluted with approximately 5 mL Sterile Water for Injection.',
    allowedDiluents:
        'The cited vial label lists 0.9% Sodium Chloride, D5W or D10W, Lactated Ringer’s, several dextrose/saline combinations, Ringer’s and selected other solutions.',
    administration:
        'For direct IV injection in the cited label, inject slowly over 3–5 minutes. For infusion, use the prescribed/local infusion method after the labeled 50–100 mL further dilution.',
    stability:
        'The cited vial label states reconstituted/diluted solutions are stable for 24 hours at room temperature or 10 days refrigerated at about 5°C. Local sterile-compounding BUD may be shorter.',
    incompatibilities:
        'Verify Y-site/admixture compatibility separately; the profile does not imply that listed carrier fluids make other co-infused drugs compatible.',
    criticalLocks: [
      'Product lock: this profile is for 1 g/2 g/3 g single-dose vials, not SmartPak pharmacy bulk or premixed/dual-chamber products.',
      'Reconstituted concentration is about 330 mg/mL, not 100 mg/mL used by some pharmacy-bulk preparations.',
    ],
    sourceLabel:
        'DailyMed · Cefazolin for Injection, USP · current 1 g/2 g/3 g single-dose vial label',
    withdrawalUnit: 'mg',
    withdrawalConcentration: 330,
  ),
  IvPreparationProfile(
    name: 'Clindamycin',
    population: 'General',
    formulation:
        'Clindamycin phosphate injection solution equivalent to clindamycin 150 mg/mL in single-dose vials; IV use requires dilution.',
    reconstitution:
        'None. The vial is a 150 mg/mL solution. Withdraw the prescribed dose, then dilute for IV infusion.',
    resultingConcentration:
        '150 mg/mL in the vial before dilution.',
    furtherDilution:
        'Final clindamycin concentration for IV infusion should not exceed 18 mg/mL. Labeled examples: 300 mg in 50 mL, 600 mg in 50 mL, 900 mg in 50–100 mL, or 1,200 mg in 100 mL.',
    allowedDiluents:
        'Compatibility studies in the cited label support common IV solutions containing sodium chloride, glucose, calcium or potassium; use the exact local/product compatibility reference for a specific admixture.',
    administration:
        'Infusion rate should not exceed 30 mg/min. Labeled examples: 300 mg over 10 min, 600 mg over 20 min, 900 mg over 30 min, 1,200 mg over 40 min. More than 1,200 mg in a single 1-hour infusion is not recommended.',
    stability:
        'The cited label reports compatibility studies monitored for 24 hours at room temperature; admixture stability depends on concentration and conditions. Use the local sterile-compounding BUD when shorter.',
    incompatibilities:
        'The cited label lists physical incompatibility with ampicillin sodium, phenytoin sodium, barbiturates, aminophylline, calcium gluconate and magnesium sulfate.',
    criticalLocks: [
      'IV lock: the 150 mg/mL vial must be diluted before IV administration.',
      'Rate lock: do not exceed 30 mg/min or a final concentration of 18 mg/mL.',
    ],
    sourceLabel:
        'DailyMed · Clindamycin Injection, USP 150 mg/mL · dilution and IV infusion-rate table',
    withdrawalUnit: 'mg',
    withdrawalConcentration: 150,
  ),
  IvPreparationProfile(
    name: 'Pantoprazole',
    population: 'General',
    formulation:
        'Pantoprazole sodium for injection, 40 mg lyophilized single-dose vial.',
    reconstitution:
        'Reconstitute each 40 mg vial with 10 mL of 0.9% Sodium Chloride Injection to approximately 4 mg/mL.',
    resultingConcentration:
        'Approximately 4 mg/mL after vial reconstitution.',
    furtherDilution:
        'For the labeled 15-minute infusion pathway, further dilute with 100 mL of D5W, 0.9% Sodium Chloride, or Lactated Ringer’s to a final concentration of approximately 0.4 mg/mL. The label also contains a separate adult 2-minute IV pathway using the reconstituted 4 mg/mL solution.',
    allowedDiluents:
        '0.9% Sodium Chloride for vial reconstitution. For the 15-minute infusion: D5W, 0.9% Sodium Chloride, or Lactated Ringer’s. Use the same supported fluids for line flushing/Y-site carrier as specified by the exact label.',
    administration:
        'For the 15-minute pathway, infuse over approximately 15 minutes. A separate labeled adult pathway administers the reconstituted dose over at least 2 minutes; do not mix the two preparation pathways.',
    stability:
        'For the 15-minute pathway, the cited label permits the reconstituted solution up to 6 hours at room temperature before further dilution; the final admixed solution must be used within 24 hours from initial reconstitution. Do not freeze. The separate 2-minute pathway has its own 24-hour reconstituted-solution limit.',
    incompatibilities:
        'Flush the IV line before and after with a supported carrier. Midazolam is incompatible at the Y-site in the cited label; zinc-containing products may also be incompatible.',
    criticalLocks: [
      'Pathway lock: 15-minute infusion and adult ≥2-minute IV administration use different preparation steps.',
      'Reconstitute the vial with 0.9% Sodium Chloride; do not substitute an unverified vial diluent.',
    ],
    sourceLabel:
        'DailyMed · Pantoprazole Sodium for Injection 40 mg · preparation, stability and compatibility section',
    withdrawalUnit: 'mg',
    withdrawalConcentration: 4,
  ),
  IvPreparationProfile(
    name: 'Metronidazole',
    population: 'General',
    formulation:
        'Metronidazole Injection premixed isotonic solution, 500 mg in 100 mL = 5 mg/mL, single-dose bag.',
    reconstitution:
        'None. The cited product is ready to use.',
    resultingConcentration:
        '5 mg/mL (500 mg/100 mL).',
    furtherDilution:
        'None required. The current label explicitly states that no dilution or buffering is required and prohibits additives in the container.',
    allowedDiluents:
        'No routine diluent is needed for this premixed bag. If connected to a primary IV fluid system, discontinue the primary solution during metronidazole infusion as directed by the cited label.',
    administration:
        'Administer by slow IV drip infusion only. The cited adult anaerobic-infection table infuses maintenance doses over one hour; surgical prophylaxis uses 30–60 minute infusions. Follow the indication-specific order.',
    stability:
        'Store the premixed product at controlled room temperature, protect from freezing and protect from light until use. Single-dose container; discard unused portion. Do not refrigerate.',
    incompatibilities:
        'Avoid admixtures/additives with other drugs. Do not use equipment containing aluminum that would contact the solution.',
    criticalLocks: [
      'Ready-to-use lock: no dilution or buffering is required for the 500 mg/100 mL premixed bag.',
      'Container lock: do not introduce supplementary medications into the bag.',
    ],
    sourceLabel:
        'DailyMed · Metronidazole Injection USP 500 mg/100 mL premixed bag · current preparation instructions',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'premix-5mg-ml',
        label: 'Premixed 500 mg/100 mL bag',
        unit: 'mg',
        concentration: 5,
        note:
            'Ready-to-use 5 mg/mL solution. No routine dilution or buffering; do not add supplementary medication to the container.',
      ),
    ],
  ),
  IvPreparationProfile(
    name: 'Linezolid',
    population: 'General',
    formulation:
        'Linezolid injection ready-to-use single-dose infusion bag, commonly 600 mg/300 mL = 2 mg/mL.',
    reconstitution:
        'None. The cited 600 mg/300 mL bag is supplied ready to use.',
    resultingConcentration:
        '2 mg/mL.',
    furtherDilution:
        'No routine further dilution. Do not introduce additives into the ready-to-use bag.',
    allowedDiluents:
        'If the same line is used sequentially for other drugs, compatible flush solutions include 0.9% Sodium Chloride, D5W and Lactated Ringer’s.',
    administration:
        'Administer by IV infusion over 30–120 minutes. Do not use the infusion bag in series connections.',
    stability:
        'Keep the infusion bag in its overwrap until ready to use, store at controlled room temperature, protect from freezing and protect from light. A yellow color may intensify over time without loss of potency.',
    incompatibilities:
        'The cited label reports Y-site physical incompatibility with amphotericin B, chlorpromazine, diazepam, pentamidine, erythromycin lactobionate, phenytoin and trimethoprim/sulfamethoxazole; ceftriaxone is chemically incompatible.',
    criticalLocks: [
      'Ready-to-use lock: do not add supplementary medication or routinely dilute the 2 mg/mL bag.',
      'Line lock: if another drug uses the same line sequentially, flush before and after with a mutually compatible solution.',
    ],
    sourceLabel:
        'DailyMed · Linezolid Injection 600 mg/300 mL · current ready-to-use infusion-bag labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'premix-2mg-ml',
        label: 'Ready-to-use 600 mg/300 mL bag',
        unit: 'mg',
        concentration: 2,
        note:
            'Ready-to-use 2 mg/mL infusion bag. Do not add supplementary medication.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Acyclovir',
    population: 'General',
    formulation:
        'Acyclovir sodium lyophilized powder for IV infusion only; cited single-dose vials contain acyclovir equivalent to 500 mg or 1 g.',
    reconstitution:
        'Reconstitute the 500 mg vial with 10 mL Sterile Water for Injection or the 1 g vial with 20 mL Sterile Water for Injection. Shake well to dissolve. Do NOT use bacteriostatic water containing benzyl alcohol or parabens.',
    resultingConcentration:
        '50 mg/mL after reconstitution; the reconstituted solution has an alkaline pH of approximately 11.',
    furtherDilution:
        'Further dilution is required before infusion. Withdraw the prescribed dose and dilute in an appropriate IV solution so the infusion concentration is approximately 7 mg/mL or lower.',
    allowedDiluents:
        'The cited label states standard commercially available electrolyte and glucose IV solutions are suitable. Biologic or colloidal fluids such as blood products/protein solutions are not recommended.',
    administration:
        'IV infusion only over 1 hour. Rapid/bolus IV injection, IM injection and subcutaneous injection must be avoided. Adequate hydration is important during IV acyclovir therapy.',
    stability:
        'Use the reconstituted 50 mg/mL solution within 12 hours. Refrigeration may cause a precipitate that redissolves at room temperature. Once diluted for administration, use each dose within 24 hours. Store unopened vials at 15–25°C.',
    incompatibilities:
        'Do not use biologic/colloidal carrier fluids. Inspect for particulates/discoloration; verify specific Y-site compatibility separately.',
    criticalLocks: [
      'Reconstitution lock: 500 mg + 10 mL SWFI or 1 g + 20 mL SWFI = 50 mg/mL.',
      'Concentration lock: final infusion concentration approximately 7 mg/mL or lower; higher concentrations such as 10 mg/mL may increase phlebitis/extravasation injury risk.',
      'Administration lock: infusion over 1 hour only; never rapid IV bolus.',
    ],
    sourceLabel:
        'DailyMed · Acyclovir for Injection, USP 500 mg/1 g lyophilized powder · preparation/administration label updated April 2024',
    withdrawalUnit: 'mg',
    withdrawalConcentration: 50,
  ),
  IvPreparationProfile(
    name: 'IV Paracetamol',
    population: 'General',
    formulation:
        'Acetaminophen/paracetamol injection ready solution 1,000 mg/100 mL = 10 mg/mL in a single-dose container.',
    reconstitution:
        'None. The cited product is supplied as a ready 10 mg/mL solution for IV infusion.',
    resultingConcentration:
        '10 mg/mL.',
    furtherDilution:
        'For a full 1,000 mg dose in an eligible patient, the entire 100 mL container may be infused without further dilution. For doses below 1,000 mg, withdraw the prescribed volume from an intact container and transfer it to a separate empty sterile container or syringe before administration.',
    allowedDiluents:
        'No routine diluent is required for the ready 10 mg/mL product. Do not add other medications to the acetaminophen container or infusion device.',
    administration:
        'Administer only as a 15-minute IV infusion. Small pediatric volumes up to 60 mL may be placed in a syringe and administered over 15 minutes using a syringe pump according to the cited product instructions.',
    stability:
        'Single-dose container; discard unused portion. Once the seal is penetrated or solution is transferred to another container, administer the dose within 6 hours in the cited label.',
    incompatibilities:
        'Do not add other medications. Diazepam and chlorpromazine are physically incompatible with the cited acetaminophen injection.',
    criticalLocks: [
      'Total-acetaminophen lock: include acetaminophen/paracetamol from ALL routes/products when checking the prescribed daily limit.',
      'Container lock: the full 100 mL container is not intended for patients requiring less than 1,000 mg; transfer only the prescribed volume to a separate sterile container.',
      'Administration lock: 15-minute IV infusion only.',
    ],
    sourceLabel:
        'DailyMed · Acetaminophen Injection 1,000 mg/100 mL (10 mg/mL) · IV administration instructions',
    withdrawalUnit: 'mg',
    withdrawalConcentration: 10,
  ),
  IvPreparationProfile(
    name: 'Gentamicin',
    population: 'General',
    formulation:
        'Gentamicin sulfate injection product containing gentamicin 40 mg/mL; current U.S. presentations include 80 mg/2 mL and 800 mg/20 mL vials. Product must be diluted for IV use.',
    reconstitution:
        'None. This profile is for the 40 mg/mL solution. Withdraw the already prescribed gentamicin dose from the exact 40 mg/mL product.',
    resultingConcentration:
        '40 mg/mL in the vial before IV dilution.',
    furtherDilution:
        'For intermittent IV administration in adults, dilute the prescribed single dose in 50–200 mL of sterile isotonic saline or D5W. In infants and children, use a smaller diluent volume appropriate to fluid needs.',
    allowedDiluents:
        'Sterile isotonic saline solution or 5% Dextrose in Water for the intermittent IV method in the cited label.',
    administration:
        'Infuse the diluted intermittent dose over 30 minutes to 2 hours. Therapeutic-dose selection and renal adjustment are outside this preparation profile.',
    stability:
        'Store the vial at controlled room temperature according to the exact product label. The cited label does not provide a universal extended post-dilution BUD; use validated institutional sterile-compounding policy for the prepared infusion.',
    incompatibilities:
        'Gentamicin should not be physically premixed with other drugs; administer separately. Verify Y-site compatibility independently when sequential/shared-line administration is necessary.',
    criticalLocks: [
      'Product lock: this profile is for a 40 mg/mL gentamicin vial; pediatric 10 mg/mL products also exist and must not use this withdrawal concentration.',
      'Renal/TDM lock: dosing interval and dose require renal-function and serum-level assessment when clinically indicated; the calculator must never select the dose.',
      'IV lock: the 40 mg/mL vial must be diluted for IV use.',
    ],
    sourceLabel:
        'DailyMed · Gentamicin Injection, USP 40 mg/mL · current U.S. vial labeling / IV administration section',
    withdrawalUnit: 'mg',
    withdrawalConcentration: 40,
  ),
  IvPreparationProfile(
    name: 'Fluconazole',
    population: 'General',
    formulation:
        'Fluconazole injection ready-to-use iso-osmotic solution 2 mg/mL; current products include 200 mg/100 mL and 400 mg/200 mL containers in sodium chloride or dextrose diluent.',
    reconstitution:
        'None. The cited 2 mg/mL products are supplied as ready IV infusion solutions.',
    resultingConcentration:
        '2 mg/mL.',
    furtherDilution:
        'No routine further dilution is required. Do not add supplementary medication to the ready-to-use container.',
    allowedDiluents:
        'The commercial product is already formulated in sodium chloride or dextrose diluent, depending on the exact bag/container. Do not replace the labeled carrier by transferring rules from another presentation.',
    administration:
        'Administer by IV infusion at a maximum rate of approximately 200 mg/hour according to the cited label.',
    stability:
        'Store the exact ready-to-use container according to its label; current U.S. products are stored at controlled room temperature/range and protected from freezing. Single-dose container handling applies.',
    incompatibilities:
        'Do not add supplementary medication. Inspect the flexible container for leaks and solution integrity before use; verify shared-line compatibility independently.',
    criticalLocks: [
      'Ready-to-use lock: 2 mg/mL commercial infusion solution; do not invent a reconstitution step.',
      'Rate lock: maximum infusion rate approximately 200 mg/hour.',
      'Container lock: sodium-chloride and dextrose premixes both exist; identify the exact product.',
    ],
    sourceLabel:
        'DailyMed · Fluconazole Injection, USP 2 mg/mL ready-to-use infusion solution · current U.S. labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'premix-2mg-ml',
        label: 'Ready-to-use 2 mg/mL infusion solution',
        unit: 'mg',
        concentration: 2,
        note:
            'Commercial 200 mg/100 mL and 400 mg/200 mL presentations are both 2 mg/mL. Identify the exact carrier/container and do not add supplementary medication.',
      ),
    ],
  ),
  IvPreparationProfile(
    name: 'Ondansetron',
    population: 'General',
    formulation:
        'Ondansetron injection solution 2 mg/mL; cited current product is 4 mg/2 mL in a single-dose vial.',
    reconstitution:
        'None. The vial is a ready 2 mg/mL solution. Whether further dilution is required depends on the INDICATION.',
    resultingConcentration:
        '2 mg/mL in the vial before any indication-specific dilution.',
    furtherDilution:
        'Chemotherapy-induced nausea/vomiting pathway: dilution is required in 50 mL D5W or 0.9% NaCl for adults and pediatric patients; for pediatric patients 6–12 months and/or ≤10 kg, 10–50 mL may be used according to fluid needs. Postoperative nausea/vomiting pathway: dilution is not required.',
    allowedDiluents:
        'For the chemotherapy pathway, D5W or 0.9% Sodium Chloride are the primary labeled dilution fluids. The label also reports room-temperature compatibility after dilution with NS, D5W, D5NS, D5 half-normal saline and 3% NaCl, but do not infer an indication-specific recipe from compatibility alone.',
    administration:
        'Chemotherapy pathway: infuse the diluted dose over 15 minutes. Postoperative pathway: administer the undiluted IV dose over at least 30 seconds and preferably over 2–5 minutes. Follow the prescribed indication-specific dose.',
    stability:
        'After recommended dilution, do not use beyond 24 hours despite longer physical/chemical compatibility data. Store unopened 2 mg/mL vials at the labeled temperature range and protect from light.',
    incompatibilities:
        'Do not mix with solutions lacking established compatibility; alkaline solutions are specifically cautioned because precipitation may occur.',
    criticalLocks: [
      'Indication lock: chemotherapy preparation requires dilution; postoperative IV administration does not.',
      'Concentration lock: vial is 2 mg/mL; dilution volume is not a dose-selection rule.',
      'Severe-hepatic-impairment dosing limits are clinical-order issues and must not be selected by the preparation calculator.',
    ],
    sourceLabel:
        'DailyMed · Ondansetron Injection 2 mg/mL · current preparation, compatibility and postoperative administration labeling',
    withdrawalUnit: 'mg',
    withdrawalConcentration: 2,
  ),

  IvPreparationProfile(
    name: 'Cefepime',
    population: 'General',
    formulation:
        'Cefepime for injection single-dose vials. Current cited label: 1 g and 2 g vials for IV/IM use; preparation is route-specific.',
    reconstitution:
        'For IV use: add 10 mL diluent to the 1 g vial to give approximately 100 mg/mL; add 10 mL to the 2 g vial to give approximately 160 mg/mL. Compatible vial diluents in the cited label include Sterile Water for Injection, 0.9% Sodium Chloride Injection and 5% Dextrose Injection. Do not reuse the IM reconstitution volumes for IV preparation.',
    resultingConcentration:
        '1 g IV vial after 10 mL: approximately 100 mg/mL. 2 g IV vial after 10 mL: approximately 160 mg/mL.',
    furtherDilution:
        'Further dilute the reconstituted dose for IV infusion. The cited label supports final cefepime concentrations from 1 to 40 mg/mL.',
    allowedDiluents:
        '0.9% Sodium Chloride, 5% or 10% Dextrose, M/6 Sodium Lactate, D5/0.9% Sodium Chloride, Lactated Ringers with 5% Dextrose, and the exact Normosol solutions listed in the cited product label.',
    administration:
        'Administer the resulting IV infusion over approximately 30 minutes.',
    stability:
        'At supported final concentrations, cited label: up to 24 hours at 20–25°C or 7 days refrigerated at 2–8°C. Apply the exact product/container policy in local practice.',
    incompatibilities:
        'Do not extrapolate Y-site compatibility from diluent compatibility. During Y-site infusion the label advises discontinuing the other solution when feasible.',
    criticalLocks: [
      'Route lock: IV and IM reconstitution volumes differ.',
      'Do not use a generic 100 mg/mL assumption for the 2 g IV vial; cited 2 g + 10 mL is approximately 160 mg/mL.',
    ],
    sourceLabel:
        'DailyMed · Cefepime for Injection · updated 2026 · sections 2.4–2.6',
    withdrawalUnit: 'mg',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: '1g-vial-iv',
        label: '1 g IV vial + 10 mL diluent',
        unit: 'mg',
        concentration: 100,
        note:
            'Approximately 100 mg/mL after the cited IV reconstitution. Further dilute the withdrawn dose for IV infusion.',
      ),
      IvWithdrawalVariant(
        id: '2g-vial-iv',
        label: '2 g IV vial + 10 mL diluent',
        unit: 'mg',
        concentration: 160,
        note:
            'Approximately 160 mg/mL after the cited IV reconstitution. Do not apply a generic 100 mg/mL assumption to the 2 g vial.',
      ),
    ],
  ),
  IvPreparationProfile(
    name: 'Ampicillin',
    population: 'General',
    formulation:
        'Ampicillin sodium for injection powder. Product strengths include 125 mg, 250 mg, 500 mg, 1 g and 2 g; exact reconstitution depends on route and vial strength.',
    reconstitution:
        'For direct IV use in the cited label: add 5 mL Sterile Water for Injection to 125 mg, 250 mg or 500 mg vials; 1 g and 2 g vials may be dissolved in 7.4 mL and 14.8 mL respectively for slow direct IV administration. For the common 250 mg/mL withdrawal preparation used in the same product family, 1 g + 3.5 mL or 2 g + 6.8 mL gives a withdrawable concentration of about 250 mg/mL. Verify the exact product method before preparing.',
    resultingConcentration:
        'Product/route specific. A common cited vial table gives approximately 250 mg/mL after 1 g + 3.5 mL or 2 g + 6.8 mL; direct-IV preparation uses different added volumes.',
    furtherDilution:
        'For IV drip, first reconstitute using the product direct-IV method, then further dilute in a compatible infusion solution according to the exact concentration/stability table for the product.',
    allowedDiluents:
        'Sterile Water for Injection for direct IV reconstitution. Compatible infusion fluid and allowable concentration are product-specific; use the exact cited/local table.',
    administration:
        '250 mg/500 mg direct IV: slowly over 3–5 minutes. 1 g/2 g direct IV: at least 10–15 minutes in the cited label. Faster administration can provoke seizures.',
    stability:
        'Use freshly prepared solutions. The cited vial label states IM/direct-IV solutions should be administered within 1 hour after preparation; IV-drip stability depends on diluent and concentration.',
    incompatibilities:
        'Do not assume compatibility with aminoglycosides or other antibiotics in the same container/line without a current compatibility reference.',
    criticalLocks: [
      'Newborn lock: do not use bacteriostatic water containing benzyl alcohol as a diluent in newborns.',
      'Do not confuse the 250 mg/mL withdrawal table with the separate direct-IV reconstitution method.',
      'Administration rate is strength-dependent; 1 g/2 g direct IV is slower than 250/500 mg.',
    ],
    sourceLabel:
        'DailyMed · Ampicillin Sodium for Injection · updated Jul 2026 · Directions for Use',
    withdrawalUnit: 'mg',
  ),
  IvPreparationProfile(
    name: 'Azithromycin',
    population: 'General',
    formulation:
        'Azithromycin for injection 500 mg lyophilized single-dose vial for IV infusion.',
    reconstitution:
        'Add exactly 4.8 mL Sterile Water for Injection to the 500 mg vial and shake until dissolved. The reconstituted concentration is 100 mg/mL. A standard 5 mL non-automated syringe is recommended by the label because the vial is under vacuum.',
    resultingConcentration: '100 mg/mL after reconstitution.',
    furtherDilution:
        'Transfer 5 mL (500 mg) of the 100 mg/mL solution into a compatible infusion fluid to make either 1 mg/mL or 2 mg/mL final concentration.',
    allowedDiluents:
        'Current labeling includes 0.9% Sodium Chloride, 0.45% Sodium Chloride, D5W, Lactated Ringers, and specified dextrose/saline combinations.',
    administration:
        '1 mg/mL: infuse over 3 hours. 2 mg/mL: infuse over 1 hour. Do not give as IV bolus or IM injection.',
    stability:
        'Reconstituted 100 mg/mL vial solution: 24 hours below 30°C in the cited label. Final diluted stability remains product/diluent specific.',
    incompatibilities:
        'Do not add other IV substances to the azithromycin infusion or infuse simultaneously through the same line unless compatibility is established.',
    criticalLocks: [
      'Exact-water lock: 500 mg vial + 4.8 mL SWFI, not a rounded 5 mL recipe.',
      'Never IV bolus; final concentration determines minimum infusion time.',
    ],
    sourceLabel:
        'DailyMed · ZITHROMAX / azithromycin for injection · revised Jul 2026 · section 2.3',
    withdrawalUnit: 'mg',
    withdrawalConcentration: 100,
  ),
  IvPreparationProfile(
    name: 'Micafungin',
    population: 'General',
    formulation:
        'Micafungin for injection lyophilized powder, 50 mg and 100 mg single-dose vials.',
    reconstitution:
        'Aseptically add 5 mL of 0.9% Sodium Chloride Injection without bacteriostatic agent or 5% Dextrose Injection. Gently swirl; do not vigorously shake. 50 mg vial becomes 10 mg/mL; 100 mg vial becomes 20 mg/mL.',
    resultingConcentration:
        '50 mg vial: 10 mg/mL. 100 mg vial: 20 mg/mL.',
    furtherDilution:
        'Adult preparation: add the required reconstituted volume to 100 mL NS or D5W. Pediatric labeling supports a final concentration between 0.5 and 4 mg/mL; concentrations above 1.5 mg/mL should be administered through a central catheter to reduce infusion-reaction risk.',
    allowedDiluents:
        '0.9% Sodium Chloride Injection (without bacteriostatic agent) or 5% Dextrose Injection.',
    administration:
        'IV infusion only over 1 hour. Flush an existing IV line with 0.9% Sodium Chloride before infusion.',
    stability:
        'Protect reconstituted vial and diluted solution from light. Current labeling supports up to 24 hours at room temperature for the reconstituted vial and up to 24 hours for the diluted bag/syringe.',
    incompatibilities:
        'Do not mix or co-infuse with other medications; direct mixing can precipitate.',
    criticalLocks: [
      'Do not vigorously shake during reconstitution.',
      'Concentration >1.5 mg/mL: central catheter warning in pediatric labeling.',
      'Preservative-free product; discard partially used vials.',
    ],
    sourceLabel:
        'DailyMed · Micafungin for Injection · current 2025–2026 labeling · sections 2.4–2.5',
    withdrawalUnit: 'mg',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: '50mg-vial',
        label: '50 mg vial + 5 mL',
        unit: 'mg',
        concentration: 10,
        note:
            'Reconstituted concentration 10 mg/mL. Adult doses are then added to 100 mL NS or D5W; pediatric final-concentration rules remain profile-specific.',
      ),
      IvWithdrawalVariant(
        id: '100mg-vial',
        label: '100 mg vial + 5 mL',
        unit: 'mg',
        concentration: 20,
        note:
            'Reconstituted concentration 20 mg/mL. Select this only when the exact 100 mg vial is being used.',
      ),
    ],
  ),
  IvPreparationProfile(
    name: 'Fosphenytoin',
    population: 'General',
    formulation:
        'Fosphenytoin sodium injection 50 mg phenytoin sodium equivalents (PE) per mL; single-dose vials.',
    reconstitution:
        'No powder reconstitution. For IV infusion, withdraw the prescribed dose in mg PE from the 50 mg PE/mL solution, then dilute before infusion.',
    resultingConcentration: 'Stock concentration: 50 mg PE/mL.',
    furtherDilution:
        'Dilute in D5W or 0.9% Sodium Chloride to a final concentration from 1.5 to 25 mg PE/mL. Do not exceed 25 mg PE/mL.',
    allowedDiluents: '5% Dextrose Injection or 0.9% Sodium Chloride Injection.',
    administration:
        'Express dose and rate in mg PE. Adult IV rate must not exceed 150 mg PE/min; pediatric rate for status epilepticus must not exceed 2 mg PE/kg/min or 150 mg PE/min, whichever is slower. ECG, blood pressure and respiratory monitoring are required during high-rate loading.',
    stability:
        'Single-dose vial; discard unused product after opening. Prepared-infusion stability should follow the exact product/local sterile-compounding policy.',
    incompatibilities:
        'Do not extrapolate phenytoin sodium compatibility or concentration rules to fosphenytoin.',
    criticalLocks: [
      'PE lock: prescribe, prepare and display fosphenytoin in phenytoin sodium equivalents (mg PE), not mg of fosphenytoin compound.',
      '50 mg PE/mL is the concentration, not the total vial dose; 2 mL vial contains 100 mg PE and 10 mL vial contains 500 mg PE.',
      'Final IV concentration must be 1.5–25 mg PE/mL.',
    ],
    sourceLabel:
        'DailyMed · Fosphenytoin Sodium Injection · Preparation / dosing-error warnings',
    withdrawalUnit: 'mg PE',
    withdrawalConcentration: 50,
  ),
  IvPreparationProfile(
    name: 'Amiodarone',
    population: 'General',
    formulation:
        'Amiodarone hydrochloride injection 50 mg/mL for IV use; the preparation below is the adult life-threatening VT/VF label regimen, not a generic pediatric recipe.',
    reconstitution:
        'No vial reconstitution. Initial labeled load: withdraw 3 mL = 150 mg from the 50 mg/mL injection and add to 100 mL D5W.',
    resultingConcentration:
        'Initial 150 mg in 100 mL D5W = 1.5 mg/mL. Labeled slow-load bag: 18 mL = 900 mg added to 500 mL D5W = approximately 1.8 mg/mL.',
    furtherDilution:
        'After the first 24 hours, the label allows 1–6 mg/mL for maintenance; use a central venous catheter for concentrations above 2 mg/mL.',
    allowedDiluents:
        'D5W is the labeled diluent for the standard infusion regimen. Do not substitute normal saline without a product-specific compatibility reference.',
    administration:
        'Initial load: 150 mg over 10 minutes. Then 1 mg/min for 6 hours, followed by 0.5 mg/min. Breakthrough unstable VT/VF supplemental infusion: 150 mg in 100 mL D5W over 10 minutes per label.',
    stability:
        'For infusions longer than 2 hours, the label requires glass or polyolefin containers with D5W. Do not use evacuated glass containers.',
    incompatibilities:
        'Multiple Y-site incompatibilities exist. Amiodarone adsorbs to PVC and can leach DEHP; use product/local administration-set policy and a dedicated line when required.',
    criticalLocks: [
      'Adult VT/VF label regimen only; do not use this as a NICU/PICU dosing recipe.',
      'For infusions longer than 1 hour, do not exceed 2 mg/mL peripherally; concentrations above 2 mg/mL require central venous access.',
      'Initial load is 150 mg in 100 mL D5W over 10 minutes; not an IV push.',
    ],
    sourceLabel:
        'DailyMed · Amiodarone Hydrochloride Injection 50 mg/mL · adult VT/VF infusion regimen',
    withdrawalUnit: 'mg',
    withdrawalConcentration: 50,
  ),

  IvPreparationProfile(
    name: 'Potassium chloride',
    population: 'General',
    formulation:
        'Potassium Chloride for Injection Concentrate, USP, 2 mEq/mL. Current Hospira single-dose presentations: 10 mEq/5 mL, 20 mEq/10 mL, and 40 mEq/20 mL.',
    reconstitution:
        'None. This is a concentrated ready solution at 2 mEq/mL, but it MUST be diluted before intravenous administration.',
    resultingConcentration:
        'Stock concentration is 2 mEq/mL potassium. This stock concentration is NOT an infusion concentration.',
    furtherDilution:
        'Withdraw the already prescribed mEq from the 2 mEq/mL concentrate, add it to a suitable large-volume IV fluid, and mix completely. The cited label states that when serum potassium is above 2.5 mEq/L, concentrations up to 40 mEq/L and rates no faster than 10 mEq/hour may be used. Urgent severe hypokalemia is a separate monitored pathway and must not be selected by the calculator.',
    allowedDiluents:
        'Use a suitable large-volume parenteral according to the clinical order/local protocol. The current label specifically notes that in critical conditions saline may be preferred, unless contraindicated, because dextrose may lower serum potassium.',
    administration:
        'IV infusion ONLY after dilution. Never direct IV inject the concentrate. Dose, final concentration and rate depend on the patient; continuous cardiac monitoring is required for the label-described urgent high-rate pathway.',
    stability:
        'Single-dose concentrate. Use promptly after adding to the IV fluid and mix thoroughly; discard unused concentrate. Store unopened vials at 20–25°C.',
    incompatibilities:
        'Do not use the calculator to choose a final concentration or rate. Verify compatibility of the selected large-volume fluid and any co-infused medication.',
    criticalLocks: [
      'Fatal-error lock: 2 mEq/mL is a CONCENTRATE and must never be directly injected.',
      'Mixing lock: completely mix potassium in the large-volume container before starting the infusion.',
      'Rate lock: the calculator converts an already prescribed mEq to stock mL only; it never selects 10 or 40 mEq/hour pathways.',
    ],
    sourceLabel:
        'DailyMed · Hospira Potassium Chloride for Injection Concentrate 2 mEq/mL · current Jul 2026 label',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'kcl-2meq-ml',
        label: 'KCl concentrate · 2 mEq/mL',
        unit: 'mEq',
        concentration: 2,
        note:
            'Stock withdrawal only. Example: an ordered 10 mEq corresponds to 5 mL of concentrate; the withdrawn amount MUST then be diluted in a suitable IV fluid.',
      ),
    ],
  ),
  IvPreparationProfile(
    name: 'Magnesium sulfate',
    population: 'General',
    formulation:
        'Magnesium Sulfate Injection, USP 50% = 500 mg/mL = 0.5 g/mL (about 4.06 mEq magnesium/mL).',
    reconstitution:
        'None. The 50% solution is supplied as a concentrated injectable solution.',
    resultingConcentration:
        'Stock: 500 mg/mL (0.5 g/mL). For IV infusion, the current label requires dilution to 20% (200 mg/mL) or less.',
    furtherDilution:
        'For IV infusion, dilute the prescribed amount so the final magnesium sulfate concentration is 20% or less. The label gives an example for severe magnesium deficiency: 5 g added to 1 L of D5W or 0.9% NaCl for slow infusion over 3 hours; this example is indication-specific and is not a universal target recipe.',
    allowedDiluents:
        '5% Dextrose Injection or 0.9% Sodium Chloride Injection are the commonly used IV diluents in the cited label.',
    administration:
        'IV rate is indication-specific. The current label states IV injection should generally not exceed 150 mg/minute (or equivalent) except in severe eclampsia with seizures. Monitor clinical response and serum magnesium when treating deficiency.',
    stability:
        'Use the exact product/container policy and local sterile-compounding BUD after dilution. Inspect solution before administration.',
    incompatibilities:
        'Do not infer compatibility with other IV medicines from the fact that D5W/NS are permitted diluents; verify Y-site/admixture compatibility separately.',
    criticalLocks: [
      'IV dilution lock: 50% magnesium sulfate must be diluted to 20% or less for IV infusion.',
      'Unit lock: stock is 500 mg/mL = 0.5 g/mL; do not confuse grams, milligrams and mEq.',
      'Indication lock: eclampsia, deficiency and other uses do not share one universal dose/rate.',
    ],
    sourceLabel:
        'DailyMed · Magnesium Sulfate Injection 50% · updated Aug 2026 labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'mgso4-50percent-g',
        label: 'Magnesium sulfate 50% · 0.5 g/mL',
        unit: 'g',
        concentration: 0.5,
        note:
            'Stock withdrawal only. IV infusion requires further dilution to 20% or less; final concentration and rate remain indication/order specific.',
      ),
    ],
  ),
  IvPreparationProfile(
    name: 'Calcium gluconate',
    population: 'General',
    formulation:
        'Calcium Gluconate Injection 100 mg/mL; each mL contains 9.3 mg elemental calcium = 0.465 mEq elemental calcium.',
    reconstitution:
        'None. It is supplied as a 100 mg/mL solution. The current label requires dilution before IV administration.',
    resultingConcentration:
        'Stock: 100 mg/mL calcium gluconate. Labeled bolus-infusion final concentration: 10–50 mg/mL. Labeled continuous-infusion final concentration: 5.8–10 mg/mL.',
    furtherDilution:
        'For bolus IV administration, dilute the prescribed dose in D5W or normal saline to 10–50 mg/mL. For continuous IV infusion, dilute to 5.8–10 mg/mL. Use the diluted solution immediately after preparation.',
    allowedDiluents:
        '5% Dextrose Injection or normal saline (0.9% Sodium Chloride Injection).',
    administration:
        'Administer through a secure IV line. For bolus-infusion administration, the label says do not exceed 200 mg/minute in adults or 100 mg/minute in pediatric patients including neonates; monitor vitals and ECG.',
    stability:
        'Use the diluted solution immediately after preparation for the cited single-dose product.',
    incompatibilities:
        'Physically incompatible with phosphate- or bicarbonate-containing fluids because precipitation may occur. Ceftriaxone-calcium restrictions are especially important in neonates; follow the current product warning.',
    criticalLocks: [
      'Elemental lock: 100 mg calcium gluconate is not 100 mg elemental calcium; each mL contains 9.3 mg elemental Ca = 0.465 mEq.',
      'Dilution lock: current labeling requires dilution before IV use.',
      'Compatibility lock: do not mix with bicarbonate or phosphate solutions.',
    ],
    sourceLabel:
        'DailyMed · Calcium Gluconate Injection 100 mg/mL · revised Feb 2026/current 2026 labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'calcium-gluconate-100mg-ml',
        label: 'Calcium gluconate stock · 100 mg/mL',
        unit: 'mg calcium gluconate',
        concentration: 100,
        note:
            'Stock withdrawal only. Dilute to the labeled final concentration for the ordered bolus-infusion or continuous-infusion pathway.',
      ),
    ],
  ),
  IvPreparationProfile(
    name: 'Calcium chloride',
    population: 'General',
    formulation:
        '10% Calcium Chloride Injection, USP = 1,000 mg/10 mL = 100 mg/mL; each mL represents 27 mg elemental calcium = 1.4 mEq elemental calcium.',
    reconstitution:
        'None. The cited current single-dose vial is a ready 100 mg/mL solution for IV use.',
    resultingConcentration:
        '100 mg/mL calcium chloride (27 mg elemental calcium or 1.4 mEq elemental calcium per mL).',
    furtherDilution:
        'The current 2026 vial label does not require a routine dilution step for the acute symptomatic hypocalcemia use described; administer the exact prescribed volume by slow IV infusion through a central or deep vein.',
    allowedDiluents:
        'No routine diluent is required for the cited 10% vial method. Do not invent dilution or transfer a calcium-gluconate recipe to calcium chloride.',
    administration:
        'Slow IV infusion in a central or deep vein; do NOT administer as IV bolus. Maximum recommended rate is 1 mL/minute (100 mg/minute). Do not use IM or SC.',
    stability:
        'Single-dose vial; discard unused portion. Inspect for clarity and intact seal before use.',
    incompatibilities:
        'Do not mix or simultaneously administer with ceftriaxone because calcium-ceftriaxone precipitation can occur. Neonates up to 28 days requiring/expected to require IV ceftriaxone are specifically contraindicated in the current label.',
    criticalLocks: [
      'Salt lock: calcium chloride and calcium gluconate are NOT interchangeable mg-for-mg.',
      'Route lock: central/deep-vein slow IV infusion; no IM, SC or rapid bolus.',
      'Rate lock: do not exceed 1 mL/minute for the current 10% product.',
    ],
    sourceLabel:
        'DailyMed · PAI Pharma 10% Calcium Chloride Injection 1 g/10 mL · revised Apr 2026',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'calcium-chloride-100mg-ml',
        label: 'Calcium chloride 10% · 100 mg/mL',
        unit: 'mg calcium chloride',
        concentration: 100,
        note:
            'Current product method uses the 100 mg/mL solution by slow IV infusion; the calculator does not convert between calcium-chloride mg and elemental-calcium units.',
      ),
    ],
  ),
  IvPreparationProfile(
    name: 'Sodium bicarbonate 8.4%',
    population: 'General',
    formulation:
        'Sodium Bicarbonate Injection, USP 8.4% = 84 mg/mL = 1 mEq/mL sodium and 1 mEq/mL bicarbonate; current cited vial 50 mEq/50 mL.',
    reconstitution:
        'None. The cited 8.4% product is a ready hypertonic IV solution at 1 mEq/mL.',
    resultingConcentration:
        '1 mEq/mL bicarbonate (and 1 mEq/mL sodium). The solution is hypertonic.',
    furtherDilution:
        'Preparation depends on indication. The current label allows IV administration in cardiac-arrest emergencies and states that in less urgent metabolic acidosis sodium bicarbonate may be added to other IV fluids. The calculator must not select an indication-specific dose or dilution.',
    allowedDiluents:
        'For less urgent metabolic-acidosis infusions, use the exact ordered IV fluid/validated protocol. Do not add calcium-containing solutions unless compatibility has been established because precipitate/haze may form.',
    administration:
        'IV route only. Monitor acid-base status and electrolytes. In neonates and children under 2 years, rapid injection of hypertonic bicarbonate is hazardous; the label notes a 4.2% solution may be preferred for slow administration.',
    stability:
        'Single-dose vial; discard unused portion. When additives are introduced, use aseptic technique, mix thoroughly and do not store the admixture per the cited label.',
    incompatibilities:
        'Norepinephrine and dobutamine are incompatible with sodium bicarbonate. Avoid addition to calcium-containing parenteral solutions unless compatibility is established.',
    criticalLocks: [
      'Concentration lock: 8.4% = 1 mEq/mL; do not confuse with 4.2% formulations.',
      'Pediatric lock: neonatal/under-2 administration requires special caution; do not copy adult rapid-emergency administration.',
      'Compatibility lock: bicarbonate can precipitate with calcium and is incompatible with selected catecholamines.',
    ],
    sourceLabel:
        'DailyMed · Civica Sodium Bicarbonate Injection 8.4%, 50 mEq/50 mL · updated Jun 2026',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'bicarbonate-8-4-1meq-ml',
        label: 'Sodium bicarbonate 8.4% · 1 mEq/mL',
        unit: 'mEq',
        concentration: 1,
        note:
            'Converts an already ordered mEq to stock mL only. The clinical indication determines whether/how the dose is further diluted or infused.',
      ),
    ],
  ),
  IvPreparationProfile(
    name: 'Dopamine',
    population: 'General',
    formulation:
        'Dopamine Hydrochloride Injection concentrate 40 mg/mL; current Hospira vials contain 200 mg/5 mL or 400 mg/10 mL.',
    reconstitution:
        'None. This is a 40 mg/mL concentrate that MUST be diluted before IV infusion.',
    resultingConcentration:
        'Manufacturer table for 40 mg/mL product: 5 mL (200 mg) in 250 mL = 800 mcg/mL; in 500 mL = 400 mcg/mL. 10 mL (400 mg) in 250 mL = 1,600 mcg/mL; in 500 mL = 800 mcg/mL.',
    furtherDilution:
        'Transfer either 5 mL (200 mg) or 10 mL (400 mg) to 250 mL or 500 mL of an allowed IV solution. Select the exact manufacturer recipe/clinical concentration ordered; the calculator does not choose a hemodynamic target.',
    allowedDiluents:
        '0.9% Sodium Chloride, D5W, D5/0.9% NaCl, D5/0.45% NaCl, D5/Lactated Ringers, 1/6 M Sodium Lactate, or Lactated Ringers.',
    administration:
        'Continuous IV infusion only after dilution, preferably through a large vein with an infusion pump in an intensive-care setting. Inspect for discoloration before use.',
    stability:
        'The current label states the listed diluted solutions are stable for 24 hours.',
    incompatibilities:
        'Do not administer through the same infusion set with sodium bicarbonate/other alkalinizing substances, blood, or iron salts. Do not add additional medicines to the diluted dopamine infusion.',
    criticalLocks: [
      'Concentrate lock: 40 mg/mL must be diluted before IV administration.',
      'Alkaline lock: sodium bicarbonate inactivates dopamine.',
      'Extravasation lock: use a large vein and monitor the site because tissue necrosis can occur.',
    ],
    sourceLabel:
        'DailyMed · Hospira Dopamine Hydrochloride Injection 40 mg/mL · updated May 2026',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'dopamine-40mg-ml',
        label: 'Dopamine concentrate · 40 mg/mL',
        unit: 'mg',
        concentration: 40,
        note:
            'Stock withdrawal only. Choose one of the source-locked final dilution recipes in the preparation profile; do not infuse the concentrate directly.',
      ),
    ],
  ),
  IvPreparationProfile(
    name: 'Epinephrine',
    population: 'General',
    formulation:
        'Epinephrine Injection 1 mg/mL concentrate/vial; this profile is specifically for the labeled adult septic-shock IV infusion preparation, not IM anaphylaxis dosing.',
    reconstitution:
        'None. Stock is 1 mg/mL epinephrine.',
    resultingConcentration:
        'For septic-shock infusion: add 1 mL (1 mg) to 1,000 mL of a 5% dextrose-containing solution to produce 1 mcg/mL.',
    furtherDilution:
        'Use the exact 1 mg in 1,000 mL labeled recipe for this profile. Do not use the calculator to choose an infusion dose or convert this preparation into an anaphylaxis regimen.',
    allowedDiluents:
        '5% Dextrose Injection or 5% Dextrose with 0.9% Sodium Chloride. The current label does not recommend 0.9% sodium chloride alone for this septic-shock preparation.',
    administration:
        'Continuous IV infusion for hypotension associated with septic shock, preferably through a large vein. Clinical dose/rate titration is outside this preparation calculator.',
    stability:
        'For the cited current product, the diluted 1 mcg/mL solution is stable up to 6 hours at room temperature or 24 hours refrigerated.',
    incompatibilities:
        'Whole blood/plasma should be administered separately. Verify shared-line compatibility with other medicines.',
    criticalLocks: [
      'Indication lock: this IV dilution profile is septic-shock preparation; do not transfer it to IM anaphylaxis use.',
      'Dextrose lock: use D5W or D5/NS; saline alone is not recommended by the cited label for this preparation.',
      'Concentration lock: 1 mg/mL stock becomes 1 mcg/mL only after the labeled 1:1000 dilution step.',
    ],
    sourceLabel:
        'DailyMed · Epinephrine Injection 1 mg/mL · current 2026 septic-shock preparation labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'epinephrine-1mg-ml',
        label: 'Epinephrine stock · 1 mg/mL',
        unit: 'mg',
        concentration: 1,
        note:
            'For this profile, the label recipe uses 1 mL = 1 mg stock in 1,000 mL D5-containing fluid to make 1 mcg/mL.',
      ),
    ],
  ),
  IvPreparationProfile(
    name: 'Labetalol',
    population: 'General',
    formulation:
        'Labetalol Hydrochloride Injection 5 mg/mL; current cited product 100 mg/20 mL multidose vial.',
    reconstitution:
        'None. Stock concentration is 5 mg/mL.',
    resultingConcentration:
        'Repeated slow-IV injection uses the 5 mg/mL stock. For continuous infusion, a labeled example adds 40 mL = 200 mg to 160 mL compatible IV fluid, yielding 200 mL at 1 mg/mL.',
    furtherDilution:
        'Continuous-infusion example: 40 mL stock + 160 mL compatible fluid = 200 mL total at 1 mg/mL. An alternative label example adds 40 mL stock to 250 mL fluid and yields about 2 mg per 3 mL; keep the exact method visible rather than treating both as the same final concentration.',
    allowedDiluents:
        'Current label compatibility list includes Ringers, Lactated Ringers, D5/Ringers, D5/LR, D5W, 0.9% NaCl, and specified dextrose/saline combinations.',
    administration:
        'Repeated IV injection and continuous-infusion methods are distinct. The cited label gives an initial repeated-injection dose over 2 minutes and a continuous-infusion example at 1 mg/mL; clinical dose selection remains outside the preparation calculator.',
    stability:
        'The cited compatibility section reports diluted labetalol at tested final concentrations as stable for 24 hours refrigerated or at room temperature in listed compatible fluids.',
    incompatibilities:
        'Not compatible with 5% Sodium Bicarbonate Injection. Alkaline drugs including furosemide can precipitate with labetalol; verify compatibility before same-line use.',
    criticalLocks: [
      'Method lock: repeated IV injection and continuous infusion are separate pathways.',
      'Bicarbonate lock: not compatible with 5% sodium bicarbonate.',
      'Dose lock: the calculator only converts an already prescribed mg amount from the 5 mg/mL stock.',
    ],
    sourceLabel:
        'DailyMed · Labetalol Hydrochloride Injection 5 mg/mL · current Jul 2026 labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'labetalol-5mg-ml',
        label: 'Labetalol stock · 5 mg/mL',
        unit: 'mg',
        concentration: 5,
        note:
            'Stock withdrawal. If preparing continuous infusion, follow the exact source-locked dilution method shown in the profile.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Cefotaxime',
    population: 'General',
    formulation:
        'Cefotaxime for Injection, USP conventional vials: 500 mg, 1 g, or 2 g dry powder.',
    reconstitution:
        'For IV use, reconstitute conventional vials with at least 10 mL Sterile Water for Injection. Current label table: 500 mg + 10 mL → about 50 mg/mL; 1 g + 10 mL → about 95 mg/mL; 2 g + 10 mL → about 180 mg/mL.',
    resultingConcentration:
        'Approximate IV vial concentrations after 10 mL SWFI: 50 mg/mL (500 mg vial), 95 mg/mL (1 g vial), 180 mg/mL (2 g vial).',
    furtherDilution:
        'For intermittent direct IV, the label permits 1 g or 2 g in 10 mL SWFI over 3–5 minutes. For higher-dose continuous IV infusion, the reconstituted solution may be added to compatible IV fluids; there is no single universal final concentration to assume.',
    allowedDiluents:
        'Initial IV vial reconstitution: Sterile Water for Injection. For infusion bottles/further dilution, current label lists 0.9% Sodium Chloride, D5W and multiple other compatible solutions.',
    administration:
        'Intermittent IV: 1 g or 2 g in 10 mL SWFI over 3–5 minutes; do not administer over less than 3 minutes. Continuous infusion is a separate pathway.',
    stability:
        'Current label: reconstituted IV 500 mg and 1 g vials are chemically stable 24 h at ≤22°C and 7 days refrigerated in original containers; 2 g IV vial 12 h at ≤22°C and 7 days refrigerated. Further-diluted compatible solutions maintain satisfactory potency 24 h at ≤22°C and at least 5 days refrigerated.',
    incompatibilities:
        'Do not admix cefotaxime with aminoglycoside solutions. Avoid high-pH diluents such as Sodium Bicarbonate Injection (pH >7.5).',
    criticalLocks: [
      'Vial lock: 500 mg, 1 g and 2 g IV vials do NOT produce the same concentration after adding 10 mL.',
      'Aminoglycoside lock: administer separately; do not mix in the same solution.',
      'Rate lock: direct intermittent IV administration should not be faster than 3 minutes.',
    ],
    sourceLabel:
        'DailyMed · Cefotaxime for Injection, USP · preparation/compatibility labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'cefotaxime-500mg-vial',
        label: '500 mg IV vial + 10 mL SWFI',
        unit: 'mg',
        concentration: 50,
        note:
            'Approximate concentration 50 mg/mL; select only for the exact 500 mg vial.',
      ),
      IvWithdrawalVariant(
        id: 'cefotaxime-1g-vial',
        label: '1 g IV vial + 10 mL SWFI',
        unit: 'mg',
        concentration: 95,
        note:
            'Approximate concentration 95 mg/mL; do not round this to 100 mg/mL in the calculator.',
      ),
      IvWithdrawalVariant(
        id: 'cefotaxime-2g-vial',
        label: '2 g IV vial + 10 mL SWFI',
        unit: 'mg',
        concentration: 180,
        note:
            'Approximate concentration 180 mg/mL; exact 2 g vial presentation only.',
      ),
    ],
  ),
  IvPreparationProfile(
    name: 'Ceftazidime',
    population: 'General',
    formulation:
        'Ceftazidime for Injection, USP conventional single-dose vials: 1 g or 2 g.',
    reconstitution:
        'For IV use, current label table: add 10 mL Sterile Water for Injection to either vial. 1 g vial gives about 100 mg/mL; 2 g vial gives about 170 mg/mL after displacement.',
    resultingConcentration:
        'Approximate reconstituted IV concentrations: 100 mg/mL (1 g vial) and 170 mg/mL (2 g vial).',
    furtherDilution:
        'For direct intermittent IV, use the reconstituted solution over 3–5 minutes. For IV infusion, add an appropriate quantity of reconstituted drug to a compatible IV fluid. Current label documents compatibility/stability at final concentrations 1–40 mg/mL in listed fluids.',
    allowedDiluents:
        'Initial IV reconstitution: Sterile Water for Injection. Compatible infusion fluids include 0.9% Sodium Chloride, D5W, D5/0.45% NaCl, D5/0.9% NaCl, Lactated Ringer’s and other fluids listed in the exact label.',
    administration:
        'Direct intermittent IV: slowly inject over 3–5 minutes. IV infusion is a separate method using compatible infusion fluid.',
    stability:
        'Current label: reconstituted IV solution in SWFI maintains satisfactory potency 12 h at room temperature or 3 days refrigerated. Final concentrations 1–40 mg/mL in listed compatible IV fluids may be stored up to 12 h room temperature or 3 days refrigerated.',
    incompatibilities:
        'Do not add ceftazidime to aminoglycoside solutions because of potential interaction. If both are needed, administer separately.',
    criticalLocks: [
      'Vial lock: 1 g + 10 mL ≈100 mg/mL; 2 g + 10 mL ≈170 mg/mL.',
      'Pressure lock: reconstitution releases CO₂ and positive pressure develops; follow product constitution technique.',
      'Aminoglycoside lock: do not admix in the same solution.',
    ],
    sourceLabel:
        'DailyMed · Sagent Ceftazidime for Injection, USP · updated Aug 2026',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'ceftazidime-1g-vial',
        label: '1 g IV vial + 10 mL SWFI',
        unit: 'mg',
        concentration: 100,
        note:
            'Approximate 100 mg/mL. Current label says withdraw 10 mL to obtain a 1 g dose after reconstitution.',
      ),
      IvWithdrawalVariant(
        id: 'ceftazidime-2g-vial',
        label: '2 g IV vial + 10 mL SWFI',
        unit: 'mg',
        concentration: 170,
        note:
            'Approximate 170 mg/mL. Current label says withdraw 11.5 mL to obtain a 2 g dose after reconstitution.',
      ),
    ],
  ),
  IvPreparationProfile(
    name: 'Ertapenem',
    population: 'General',
    formulation:
        'Ertapenem for Injection 1 g single-dose vial.',
    reconstitution:
        'For IV use, reconstitute 1 g vial with 10 mL Water for Injection, 0.9% Sodium Chloride Injection, or Bacteriostatic Water for Injection. Resulting concentration is approximately 100 mg/mL.',
    resultingConcentration:
        'After 1 g + 10 mL: approximately 100 mg/mL. After immediately transferring the reconstituted adult vial contents to 50 mL 0.9% Sodium Chloride: approximately 20 mg/mL.',
    furtherDilution:
        'Adults and patients ≥13 years: immediately transfer the reconstituted vial contents to 50 mL 0.9% Sodium Chloride Injection. Pediatric patients 3 months–12 years: withdraw the ordered 15 mg/kg volume from the ~100 mg/mL vial and dilute in 0.9% Sodium Chloride to a final concentration ≤20 mg/mL.',
    allowedDiluents:
        'Vial reconstitution: Water for Injection, 0.9% Sodium Chloride Injection, or Bacteriostatic Water for Injection. Final IV dilution: 0.9% Sodium Chloride Injection only in the cited label method.',
    administration:
        'IV infusion after mandatory reconstitution and dilution. Complete the infusion within 6 hours of reconstitution for the cited vial method.',
    stability:
        'Use the prepared infusion within the label-defined time; current labeling directs completion of infusion within 6 hours of reconstitution.',
    incompatibilities:
        'Do NOT mix or co-infuse with other medications. Do NOT use dextrose-containing diluents.',
    criticalLocks: [
      'Two-step lock: the 1 g vial must be reconstituted AND then diluted before IV administration.',
      'Dextrose lock: dextrose-containing diluents are prohibited for this preparation.',
      'Route lock: the lidocaine reconstitution recipe is IM-only and must never be used for IV administration.',
    ],
    sourceLabel:
        'DailyMed · Ertapenem for Injection · current 2026 labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'ertapenem-1g-iv-vial',
        label: '1 g vial after 10 mL IV reconstitution',
        unit: 'mg',
        concentration: 100,
        note:
            'Approximately 100 mg/mL before mandatory further dilution in 0.9% Sodium Chloride.',
      ),
    ],
  ),
  IvPreparationProfile(
    name: 'Amikacin',
    population: 'General',
    formulation:
        'Amikacin Sulfate Injection, USP equivalent to amikacin 250 mg/mL; current presentations include 500 mg/2 mL and 1 g/4 mL.',
    reconstitution:
        'None. This is a ready solution at 250 mg/mL.',
    resultingConcentration:
        'Stock concentration 250 mg/mL. Current label documents diluted IV solution stability at 0.25–5 mg/mL in compatible fluids.',
    furtherDilution:
        'Adult label example: add the contents of a 500 mg vial (2 mL) to 100 or 200 mL sterile diluent such as 0.9% Sodium Chloride or D5W. Pediatric fluid volume is individualized to allow the ordered dose to infuse over the required time.',
    allowedDiluents:
        '0.9% Sodium Chloride Injection, D5W, and additional compatible fluids listed in the label including Lactated Ringer’s and selected balanced solutions.',
    administration:
        'Adults: IV infusion over 30–60 minutes. Infants: 1–2 hour infusion. Pediatric patients otherwise receive sufficient fluid to infuse over 30–60 minutes.',
    stability:
        'Current label: amikacin concentrations 0.25–5 mg/mL are stable for 24 h at room temperature in the listed compatible IV fluids.',
    incompatibilities:
        'Do not physically premix amikacin with other drugs; administer separately according to the recommended dose and route.',
    criticalLocks: [
      'Stock lock: 250 mg/mL is the vial concentration; it is not the routine infusion concentration.',
      'Pediatric lock: do not force the adult 100/200 mL dilution volume onto infants/children.',
      'Premix lock: do not physically mix with other medications.',
    ],
    sourceLabel:
        'DailyMed · Amikacin Sulfate Injection 250 mg/mL · updated Jul 2026',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'amikacin-250mg-ml',
        label: 'Amikacin stock · 250 mg/mL',
        unit: 'mg',
        concentration: 250,
        note:
            'Stock withdrawal only. Adult label example further dilutes 500 mg into 100 or 200 mL; pediatric fluid volume is individualized.',
      ),
    ],
  ),
  IvPreparationProfile(
    name: 'Levofloxacin',
    population: 'General',
    formulation:
        'Levofloxacin Injection premix in D5W, 5 mg/mL: 250 mg/50 mL, 500 mg/100 mL, or 750 mg/150 mL single-dose flexible container.',
    reconstitution:
        'None. Premixed ready-to-use solution at 5 mg/mL.',
    resultingConcentration:
        '5 mg/mL in 5% Dextrose for all cited premix bag sizes.',
    furtherDilution:
        'No further dilution is necessary for the cited premix flexible-container products.',
    allowedDiluents:
        'No added diluent for the cited premix product; it is already prepared in D5W.',
    administration:
        'Slow IV infusion only: 250 mg or 500 mg over 60 minutes; 750 mg over 90 minutes. Avoid rapid or bolus IV administration.',
    stability:
        'Use as the intact single-dose flexible container according to product storage conditions; discard unused portion.',
    incompatibilities:
        'Do not add medications/additives to the premix container or infuse other medications simultaneously through the same IV line. If a common line is used sequentially, flush before and after with a mutually compatible fluid.',
    criticalLocks: [
      'Premix lock: 5 mg/mL bags are ready to use; no routine dilution.',
      'Rate lock: 250/500 mg → at least 60 min; 750 mg → at least 90 min.',
      'Line lock: no simultaneous mixed-line infusion with other medications without compatibility evidence.',
    ],
    sourceLabel:
        'DailyMed · Levofloxacin Injection 5 mg/mL premix · current labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'levofloxacin-premix-5mg-ml',
        label: 'Premix flexible container · 5 mg/mL',
        unit: 'mg',
        concentration: 5,
        note:
            'Ready-to-use 5 mg/mL solution. The calculator reports the bag volume corresponding to an already prescribed mg dose; do not withdraw partial premix doses unless the clinical system/product policy specifically supports that workflow.',
      ),
    ],
  ),
  IvPreparationProfile(
    name: 'Daptomycin',
    population: 'General',
    formulation:
        'Daptomycin for Injection 500 mg single-dose lyophilized vial.',
    reconstitution:
        'For the cited current 500 mg product, reconstitute with 10 mL 0.9% Sodium Chloride Injection to 50 mg/mL. Slowly direct diluent toward the vial wall, gently rotate, let stand undisturbed 10 minutes, then gently rotate/swirl as needed. Avoid vigorous agitation or shaking.',
    resultingConcentration:
        '50 mg/mL after reconstituting 500 mg vial with 10 mL 0.9% Sodium Chloride Injection.',
    furtherDilution:
        'Adults: for 30-minute IV infusion, further dilute the appropriate volume into a 50 mL 0.9% Sodium Chloride infusion bag. Adult 2-minute IV injection is a separate label-permitted method using the 50 mg/mL reconstituted solution. Pediatric patients require age-specific infusion preparation; do not use the adult 2-minute injection method.',
    allowedDiluents:
        'Reconstitution and further dilution for this product: 0.9% Sodium Chloride Injection only.',
    administration:
        'Adults: either 2-minute IV injection or 30-minute IV infusion according to the ordered method. Pediatrics 1–6 years: 60-minute infusion in 25 mL NS; 7–17 years: 30-minute infusion in 50 mL NS. Do not use adult 2-minute injection in pediatric patients.',
    stability:
        'Current label: reconstituted vial stable 12 h room temperature or 48 h refrigerated; diluted infusion bag stable 12 h room temperature or 48 h refrigerated. Combined storage time must not exceed those limits.',
    incompatibilities:
        'Not compatible with dextrose-containing diluents. Do not add other medications to daptomycin vials/bags or co-infuse simultaneously through the same line without exact compatibility evidence.',
    criticalLocks: [
      'Formulation lock: daptomycin products can differ in reconstitution procedure; follow the exact product label.',
      'Diluent lock: cited product uses 0.9% Sodium Chloride only; no dextrose.',
      'Pediatric lock: do not use the adult 2-minute IV injection method in children.',
      'Handling lock: avoid vigorous shaking/foaming during reconstitution.',
    ],
    sourceLabel:
        'DailyMed · Daptomycin for Injection 500 mg · revised Jan 2026/current label',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'daptomycin-500mg-vial',
        label: '500 mg vial + 10 mL 0.9% NaCl',
        unit: 'mg',
        concentration: 50,
        note:
            'Reconstituted concentration 50 mg/mL. Adult infusion requires further dilution into 50 mL 0.9% NaCl; pediatric infusion volumes differ by age.',
      ),
    ],
  ),


  IvPreparationProfile(
    name: 'Imipenem / Cilastatin',
    population: 'General',
    formulation:
        'PRIMAXIN IV single-dose vial containing imipenem 500 mg plus cilastatin 500 mg.',
    reconstitution:
        'Add approximately 10 mL of an appropriate labeled diluent to the vial, shake well, and transfer the resulting suspension to 100 mL of an appropriate infusion solution. Repeat the transfer with an additional 10 mL of the infusion solution to ensure complete transfer, then agitate until clear.',
    resultingConcentration:
        'The cited PRIMAXIN pathway uses the entire 500 mg/500 mg vial transferred into a 100 mL infusion solution. The temporary vial suspension is not a direct-IV product and is not exposed as a calculator concentration.',
    furtherDilution:
        'Mandatory. The reconstituted vial suspension must be transferred into the 100 mL infusion solution before administration; do not administer the vial suspension directly.',
    allowedDiluents:
        '0.9% Sodium Chloride Injection; 5% Dextrose Injection; 5% Dextrose/0.9% Sodium Chloride; or 5% Dextrose with 0.225% or 0.45% saline, per the cited PRIMAXIN label.',
    administration:
        'Dose is expressed as the imipenem component. Doses up to and including 500 mg are infused over 20–30 minutes; doses greater than 500 mg are infused over 40–60 minutes. If nausea occurs, the infusion rate may be slowed.',
    stability:
        'Prepared PRIMAXIN infusion solution maintains satisfactory potency for 4 hours at room temperature or 24 hours refrigerated at 5°C. Do not freeze.',
    incompatibilities:
        'Do not mix PRIMAXIN with or physically add it to other antibacterial drugs. Concomitant administration through separate/managed delivery may be possible according to the label; do not infer admixture compatibility.',
    criticalLocks: [
      'Two-step lock: the approximately 10 mL vial step creates a suspension that must be transferred to the 100 mL infusion solution.',
      'Calculator lock: no vial-withdrawal concentration is exposed because the label uses the whole vial and mandatory transfer rather than partial dosing from the suspension.',
      'Neonate lock: do not use benzyl-alcohol-containing diluents for neonates; small pediatric patients may also be at risk.',
      'Interaction lock: carbapenems can markedly lower valproic acid/divalproex concentrations; this is a clinical interaction, not an admixture rule.',
    ],
    sourceLabel:
        'DailyMed · PRIMAXIN IV (imipenem/cilastatin) 500 mg/500 mg single-dose vial · current prescribing information',
  ),

  IvPreparationProfile(
    name: 'Aztreonam',
    population: 'General',
    formulation:
        'AZACTAM (aztreonam for injection) powder for IV/IM use; this profile locks the labeled IV bolus and infusion preparation pathways.',
    reconstitution:
        'IV bolus pathway: constitute the vial with 6–10 mL Sterile Water for Injection. IV infusion pathway: initially constitute each 1 g aztreonam with at least 3 mL Sterile Water for Injection before further dilution.',
    resultingConcentration:
        'No single vial concentration is safe to assume because the label permits a 6–10 mL bolus constitution range and uses at least 3 mL SWFI per gram for the infusion pathway.',
    furtherDilution:
        'For infusion, further dilute with a compatible IV solution. When using the label-described volume-control approach, the final aztreonam concentration should not exceed 2% w/v (20 mg/mL).',
    allowedDiluents:
        'Initial IV constitution: Sterile Water for Injection. Further infusion dilution includes 0.9% Sodium Chloride, Ringer’s, Lactated Ringer’s, D5W, D10W, selected dextrose/saline combinations, Normosol/Isolyte solutions and other fluids specifically listed in the AZACTAM label.',
    administration:
        'IV bolus: inject slowly over 3–5 minutes. IV infusion: complete over 20–60 minutes. Flush a shared delivery tube before and after aztreonam when the other drug is not pharmaceutically compatible.',
    stability:
        'IV infusion solutions at concentrations not exceeding 2% w/v should be used within 48 hours at controlled room temperature or 7 days refrigerated (2–8°C), per the cited AZACTAM label.',
    incompatibilities:
        'Aztreonam is incompatible with nafcillin sodium, cephradine and metronidazole. Other admixtures should not be assumed compatible when data are unavailable.',
    criticalLocks: [
      'Route lock: bolus constitution (6–10 mL SWFI) and infusion constitution (at least 3 mL SWFI per gram plus further dilution) are different pathways.',
      'Calculator lock: no single withdrawal concentration is exposed because the labeled constitution volume is not unique.',
      'Final concentration lock: infusion concentration should not exceed 2% w/v when using the cited volume-control method.',
    ],
    sourceLabel:
        'DailyMed · AZACTAM (aztreonam for injection, USP) · IV preparation, compatibility and stability labeling',
  ),

  IvPreparationProfile(
    name: 'Ciprofloxacin',
    population: 'General',
    formulation:
        'Ciprofloxacin Injection in 5% Dextrose, ready-to-use flexible container: 200 mg/100 mL or 400 mg/200 mL (2 mg/mL).',
    reconstitution:
        'None. The cited flexible-container product is a 0.2% premixed solution in D5W.',
    resultingConcentration:
        '2 mg/mL ciprofloxacin for both 200 mg/100 mL and 400 mg/200 mL premix bags.',
    furtherDilution:
        'No further dilution is required for the cited premix flexible containers.',
    allowedDiluents:
        'No added diluent for this exact product; it is supplied ready to use in 5% Dextrose Injection.',
    administration:
        'Administer by IV infusion over 60 minutes. Do not use as a rapid IV injection.',
    stability:
        'Store the cited premix between 5–25°C, protect from light, avoid excessive heat, protect from freezing, and discard unused portion.',
    incompatibilities:
        'Do not add drug additives to the premix bag. Do not use flexible containers in series connections. Do not infer Y-site or admixture compatibility from the premix label.',
    criticalLocks: [
      'Premix lock: 200 mg/100 mL and 400 mg/200 mL are both ready-to-use at 2 mg/mL.',
      'Rate lock: infuse over 60 minutes.',
      'Container lock: do not add medications to the premix bag and do not use in series connections.',
    ],
    sourceLabel:
        'DailyMed · Ciprofloxacin Injection in 5% Dextrose · 200 mg/100 mL and 400 mg/200 mL flexible containers',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'ciprofloxacin-premix-2mg-ml',
        label: 'Ciprofloxacin premix · 2 mg/mL',
        unit: 'mg',
        concentration: 2,
        note:
            'Ready-to-use premix concentration. Use the intact labeled bag when the ordered dose matches a marketed presentation; do not invent partial-bag workflows without local policy.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Voriconazole',
    population: 'General',
    formulation:
        'Voriconazole for Injection 200 mg lyophilized single-dose vial; this profile applies to the powder product requiring reconstitution, not ready-solution presentations.',
    reconstitution:
        'Reconstitute the 200 mg powder vial with exactly 19 mL Water for Injection to obtain an extractable 20 mL concentrate containing 10 mg/mL. Use a standard 20 mL non-automated syringe for the 19 mL diluent volume. Discard the vial if vacuum does not pull diluent into the vial; shake until dissolved.',
    resultingConcentration:
        '10 mg/mL voriconazole concentrate after reconstitution.',
    furtherDilution:
        'Mandatory. Withdraw the required volume from the 10 mg/mL concentrate and further dilute to a final concentration between 0.5 and 5 mg/mL before infusion.',
    allowedDiluents:
        'Compatible final diluents listed in the cited label include 0.9% Sodium Chloride, 0.45% Sodium Chloride, Lactated Ringer’s, D5W, D5/0.45% NaCl, D5/0.9% NaCl, D5/LR and D5W with 20 mEq KCl.',
    administration:
        'IV infusion only over 1–3 hours. Maximum infusion rate 3 mg/kg/hour. Do not administer as an IV bolus.',
    stability:
        'Single-dose unpreserved product. Use immediately when possible; if not used immediately, the cited label limits refrigerated in-use storage to no longer than 24 hours at 2–8°C. Discard unused solution.',
    incompatibilities:
        'Do not dilute with 4.2% Sodium Bicarbonate Infusion. Do not infuse concomitantly with blood products or short-term infusions of concentrated electrolytes. Compatibility with unlisted diluents is unknown.',
    criticalLocks: [
      'Formulation lock: this recipe is for the 200 mg lyophilized powder vial; ready-solution voriconazole products must not be reconstituted.',
      'Two-step lock: 19 mL WFI creates 10 mg/mL concentrate, which must then be diluted to 0.5–5 mg/mL.',
      'Rate lock: infusion only over 1–3 hours at no more than 3 mg/kg/hour; never IV bolus.',
      'Bicarbonate lock: do not use 4.2% sodium bicarbonate as diluent.',
    ],
    sourceLabel:
        'DailyMed · Voriconazole for Injection 200 mg lyophilized vial · current FDA-label instructions',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'voriconazole-200mg-lyophilized',
        label: '200 mg vial after 19 mL WFI · 10 mg/mL',
        unit: 'mg',
        concentration: 10,
        note:
            'Calculator converts ordered mg to mL of the reconstituted concentrate only. Mandatory final dilution to 0.5–5 mg/mL remains a separate step.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Caspofungin',
    population: 'General',
    formulation:
        'Caspofungin acetate for injection, exact cited Fresenius Kabi 50 mg and 70 mg single-dose lyophilized vials.',
    reconstitution:
        'Aseptically add 10.8 mL of 0.9% Sodium Chloride Injection, Sterile Water for Injection, or one of the bacteriostatic Water for Injection options specifically listed in the cited label. The 50 mg vial yields 5 mg/mL; the 70 mg vial yields 7 mg/mL. Mix gently until clear.',
    resultingConcentration:
        '50 mg vial + 10.8 mL diluent → 5 mg/mL. 70 mg vial + 10.8 mL diluent → 7 mg/mL.',
    furtherDilution:
        'Transfer the required reconstituted volume to an IV bag/bottle containing 250 mL of 0.9%, 0.45% or 0.225% Sodium Chloride Injection or Lactated Ringer’s. A reduced infusion volume may be used provided final concentration does not exceed 0.5 mg/mL.',
    allowedDiluents:
        'Vial reconstitution: exact label permits 0.9% Sodium Chloride, Sterile Water for Injection, or specified bacteriostatic WFI products. Final infusion: 0.9%, 0.45% or 0.225% Sodium Chloride Injection, or Lactated Ringer’s. Do not use dextrose-containing diluents.',
    administration:
        'Administer by slow IV infusion over approximately 1 hour. Do not administer as an IV bolus.',
    stability:
        'Reconstituted vial may be held for up to 1 hour at ≤25°C before infusion preparation. Final infusion may be stored up to 24 hours at ≤25°C or 48 hours refrigerated at 2–8°C.',
    incompatibilities:
        'Do not mix or co-infuse with other medications. Do not use dextrose-containing diluents because caspofungin is not stable in them.',
    criticalLocks: [
      'Product lock: this exact profile uses 10.8 mL reconstitution; caspofungin products can differ, so follow the exact vial label in hand.',
      'Vial lock: 50 mg vial = 5 mg/mL; 70 mg vial = 7 mg/mL.',
      'Dextrose lock: no dextrose-containing reconstitution or infusion diluent.',
      'Final concentration lock: reduced infusion volume must still keep the final concentration ≤0.5 mg/mL.',
    ],
    sourceLabel:
        'DailyMed · Fresenius Kabi Caspofungin Acetate for Injection 50 mg/70 mg · current preparation label',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'caspofungin-50mg-10_8ml',
        label: '50 mg vial + 10.8 mL · 5 mg/mL',
        unit: 'mg',
        concentration: 5,
        note:
            'Exact cited product concentration after reconstitution. Further dilution is mandatory before infusion.',
      ),
      IvWithdrawalVariant(
        id: 'caspofungin-70mg-10_8ml',
        label: '70 mg vial + 10.8 mL · 7 mg/mL',
        unit: 'mg',
        concentration: 7,
        note:
            'Exact cited product concentration after reconstitution. Further dilution is mandatory before infusion.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Anidulafungin',
    population: 'General',
    formulation:
        'ERAXIS (anidulafungin) for Injection single-dose lyophilized vials: 50 mg or 100 mg.',
    reconstitution:
        'Reconstitute the 50 mg vial with 15 mL Sterile Water for Injection or the 100 mg vial with 30 mL Sterile Water for Injection. Either pathway yields 3.33 mg/mL.',
    resultingConcentration:
        '3.33 mg/mL after reconstitution for both 50 mg and 100 mg ERAXIS vials.',
    furtherDilution:
        'Further dilute only with 5% Dextrose Injection or 0.9% Sodium Chloride. Adult label examples: 50 mg uses 15 mL concentrate + 50 mL diluent (65 mL total); 100 mg uses 30 mL + 100 mL (130 mL total); 200 mg uses 60 mL + 200 mL (260 mL total). Final concentration is approximately 0.77 mg/mL.',
    allowedDiluents:
        'Vial reconstitution: Sterile Water for Injection only. Final infusion: 5% Dextrose Injection or 0.9% Sodium Chloride Injection only.',
    administration:
        'Do not exceed 1.1 mg/min. With label-prepared adult infusions: 50 mg over about 45 minutes, 100 mg over about 90 minutes, and 200 mg over about 180 minutes. Pediatric infusion volume is weight-dependent and targets 0.77 mg/mL.',
    stability:
        'Reconstituted solution may be stored up to 24 hours at 25°C before dilution. Final infusion solution may be stored up to 48 hours at temperatures up to 25°C. Do not freeze.',
    incompatibilities:
        'Compatibility with IV substances other than D5W or 0.9% Sodium Chloride has not been established. Do not dilute with other solutions or co-infuse with other medications or electrolytes.',
    criticalLocks: [
      'Vial lock: 50 mg + 15 mL SWFI and 100 mg + 30 mL SWFI both yield 3.33 mg/mL.',
      'Diluent lock: SWFI for vial reconstitution; only D5W or 0.9% NaCl for final infusion.',
      'Rate lock: infusion rate must not exceed 1.1 mg/min.',
      'Pediatric lock: pediatric final volume is weight-dependent; do not copy adult 65/130/260 mL volumes automatically.',
    ],
    sourceLabel:
        'DailyMed · ERAXIS (anidulafungin) for Injection · 50 mg/100 mg preparation and administration labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'anidulafungin-50mg-vial',
        label: '50 mg vial + 15 mL SWFI · 3.33 mg/mL',
        unit: 'mg',
        concentration: 3.33,
        note:
            'Exact ERAXIS reconstituted concentration; mandatory final dilution with D5W or 0.9% NaCl.',
      ),
      IvWithdrawalVariant(
        id: 'anidulafungin-100mg-vial',
        label: '100 mg vial + 30 mL SWFI · 3.33 mg/mL',
        unit: 'mg',
        concentration: 3.33,
        note:
            'Exact ERAXIS reconstituted concentration; mandatory final dilution with D5W or 0.9% NaCl.',
      ),
    ],
  ),


  IvPreparationProfile(
    name: 'Adenosine',
    population: 'General',
    formulation:
        'Adenosine Injection, USP ready-to-use solution 3 mg/mL in normal saline; current labeled single-dose vials include 6 mg/2 mL and 12 mg/4 mL.',
    reconstitution:
        'None. The cited product is supplied ready to use at 3 mg/mL.',
    resultingConcentration:
        '3 mg/mL adenosine.',
    furtherDilution:
        'No routine dilution is used for the labeled PSVT rapid-bolus pathway.',
    allowedDiluents:
        'No added diluent for the dose itself. If administered through an IV line, the label directs a rapid saline flush immediately afterward.',
    administration:
        'For PSVT conversion, administer only as a rapid IV bolus. Adult initial labeled dose is 6 mg over 1–2 seconds; if needed, 12 mg may follow after 1–2 minutes and may be repeated once. Give directly into a vein or as close to the patient as possible in the IV line, followed immediately by a rapid saline flush.',
    stability:
        'Store at 20–25°C. Do NOT refrigerate because crystallization may occur. If crystals occur, warm to room temperature until dissolved and use only when the solution is clear. Single-dose, preservative-free; discard unused portion.',
    incompatibilities:
        'This profile is for the labeled rapid-bolus pathway and does not establish admixture or Y-site compatibility with other medications.',
    criticalLocks: [
      'Route lock: rapid IV bolus only for the cited PSVT pathway; do not convert this profile into a slow infusion recipe.',
      'Flush lock: when using an IV line, inject as close to the patient as possible and follow immediately with a rapid saline flush.',
      'Storage lock: do not refrigerate; crystallization can occur.',
    ],
    sourceLabel:
        'DailyMed · Adenosine Injection, USP 3 mg/mL · current label Sep 2026',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'adenosine-3mg-ml',
        label: 'Adenosine ready-to-use · 3 mg/mL',
        unit: 'mg',
        concentration: 3,
        note:
            'Ready-to-use labeled concentration. Calculator converts an already prescribed mg dose to mL only; it does not choose the dose.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Dobutamine',
    population: 'General',
    formulation:
        'Dobutamine Injection, USP 250 mg/20 mL = 12.5 mg/mL single-dose vial; exact cited Hikma product.',
    reconstitution:
        'None. This is a liquid concentrate at 12.5 mg/mL, but it MUST be diluted before IV administration.',
    resultingConcentration:
        'Stock vial concentration 12.5 mg/mL. The label provides infusion examples at 500, 1000 and 2000 mcg/mL and notes that concentrations up to 5000 mcg/mL (250 mg/50 mL) have been administered; final concentration must be selected according to the patient and prescribed infusion plan.',
    furtherDilution:
        'Mandatory. At administration, further dilute in an IV container to a total volume of at least 50 mL. Do not let the calculator invent a final infusion concentration.',
    allowedDiluents:
        'Current label lists compatible diluents including D5W, D5/0.45% NaCl, D5/0.9% NaCl, D10W, Lactated Ringer’s, D5/LR, 0.9% Sodium Chloride, Sodium Lactate, and selected balanced/osmotic solutions listed in the exact product label.',
    administration:
        'Continuous IV infusion with hemodynamic monitoring. Infusion rate is titrated to the prescribed mcg/kg/min target and patient response; this preparation profile does not select a therapeutic dose.',
    stability:
        'Diluted IV solutions should be used within 24 hours. Store unopened vials at 20–25°C. Single-dose vial; discard unused portion.',
    incompatibilities:
        'Do not add to 5% Sodium Bicarbonate Injection or other strongly alkaline solutions. Because of potential physical incompatibilities, do not mix dobutamine with other drugs in the same solution. Avoid agents/diluents containing both sodium bisulfite and ethanol.',
    criticalLocks: [
      'Dilution lock: 12.5 mg/mL is the stock concentration and must not be infused undiluted.',
      'Volume lock: final IV container volume must be at least 50 mL for the cited product.',
      'Bicarbonate lock: do not add to 5% sodium bicarbonate or other strongly alkaline solutions.',
      'Calculator lock: calculator reports stock withdrawal volume only; final infusion concentration remains a prescribed/institutional decision.',
    ],
    sourceLabel:
        'DailyMed · Hikma Dobutamine Injection USP 250 mg/20 mL (12.5 mg/mL) · current label',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'dobutamine-12_5mg-ml',
        label: 'Dobutamine stock vial · 12.5 mg/mL',
        unit: 'mg',
        concentration: 12.5,
        note:
            'Stock withdrawal only. Mandatory further dilution to at least 50 mL; do not interpret this as an infusion concentration.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Nitroglycerin',
    population: 'General',
    formulation:
        'Nitroglycerin Injection, USP concentrated solution 50 mg/10 mL = 5 mg/mL single-dose vial.',
    reconstitution:
        'None. The vial is a 5 mg/mL concentrate and is NOT for direct IV injection.',
    resultingConcentration:
        'Stock concentration 5 mg/mL. The current label provides final infusion concentrations such as 50, 100, 200 and 400 mcg/mL depending on the exact dilution pathway; the final concentration must match the ordered protocol.',
    furtherDilution:
        'Mandatory. Dilute only in D5W or 0.9% Sodium Chloride before infusion. Label examples: 5 mg diluted to 100 mL gives 50 mcg/mL; 25 mg q.s. to 500 mL gives 50 mcg/mL; 50 mg q.s. to 500 mL gives 100 mcg/mL. Label dilution tables also support 200 and 400 mcg/mL; do not exceed 400 mcg/mL in the cited pathway.',
    allowedDiluents:
        'Dextrose 5% Injection or Sodium Chloride 0.9% Injection only for the cited label pathway.',
    administration:
        'Continuous IV infusion using a pump that can maintain a constant rate. Use the least absorptive infusion tubing available (non-PVC preferred) because PVC can adsorb nitroglycerin. The exact container/set affects delivered dose; follow the cited product and institutional infusion-set standard.',
    stability:
        'Protect the unopened vial from light and retain in carton until use. Store at 20–25°C (excursions 15–30°C). Single-dose vial; discard unused portion. The cited label does not provide a universal compounded beyond-use time; use institutional sterile-compounding policy for prepared admixtures.',
    incompatibilities:
        'Do not mix the diluted nitroglycerin infusion with other medications. Do not run through the same set as blood. Some in-line filters adsorb nitroglycerin and should be avoided. The cited label uses glass IV bottles for preparation and cautions that tubing/container material affects delivered dose.',
    criticalLocks: [
      'Direct-IV lock: never give the 5 mg/mL concentrate by direct IV injection.',
      'Diluent lock: use D5W or 0.9% Sodium Chloride for the cited product.',
      'Concentration lock: final concentration is protocol-specific; do not let the calculator select 50/100/200/400 mcg/mL automatically.',
      'Tubing lock: use least-absorptive/non-PVC tubing because PVC adsorption can substantially reduce delivered drug.',
    ],
    sourceLabel:
        'DailyMed · Nitroglycerin Injection, USP 5 mg/mL · current label Sep 2025',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'nitroglycerin-5mg-ml-stock',
        label: 'Nitroglycerin concentrate · 5 mg/mL',
        unit: 'mg',
        concentration: 5,
        note:
            'Stock withdrawal only. Mandatory dilution in D5W or 0.9% NaCl before infusion; calculator does not choose final infusion concentration.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Esmolol',
    population: 'General',
    formulation:
        'BREVIBLOC (esmolol hydrochloride) ready-to-use presentations: 100 mg/10 mL vial (10 mg/mL), 2500 mg/250 mL premix bag (10 mg/mL), and 2000 mg/100 mL double-strength premix bag (20 mg/mL).',
    reconstitution:
        'None for the cited BREVIBLOC presentations. The vial and premix bags are ready to use.',
    resultingConcentration:
        '10 mg/mL for the 100 mg/10 mL vial and 2500 mg/250 mL bag; 20 mg/mL for the 2000 mg/100 mL double-strength bag.',
    furtherDilution:
        'No routine dilution is required for the cited ready-to-use vial or premix bags. If a local workflow prepares another concentration, use only an explicitly validated product/institutional method.',
    allowedDiluents:
        'No added diluent is required for the ready-to-use products. The label documents compatibility at 10 mg/mL with D5W, D5/LR, D5/Ringer’s, D5/0.45% NaCl, D5/0.9% NaCl, Lactated Ringer’s, 0.45% NaCl, 0.9% NaCl and selected listed fluids.',
    administration:
        'IV loading dose and continuous infusion are separate ordered actions. The ready-to-use vial may be used for a loading dose while the maintenance infusion is prepared. The premix bag medication port is only for withdrawing an initial bolus; do not add medications to the bag.',
    stability:
        'Store at 25°C with excursions to 15–30°C; protect from freezing and excessive heat. Once drug has been withdrawn from a premix bag, use the bag within 24 hours and discard unused portion.',
    incompatibilities:
        'Not compatible with Sodium Bicarbonate 5% solution (limited stability) or furosemide (precipitation). Do not add medications to the premix bag.',
    criticalLocks: [
      'Presentation lock: distinguish 10 mg/mL from 20 mg/mL before calculation.',
      'Premix lock: bags are ready to use; do not add medications to them.',
      'Bolus/infusion lock: loading dose and maintenance infusion are distinct ordered steps.',
      'Compatibility lock: avoid sodium bicarbonate 5% and furosemide in the same solution.',
    ],
    sourceLabel:
        'DailyMed · BREVIBLOC (esmolol hydrochloride) · current label Sep 2026',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'esmolol-vial-10mg-ml',
        label: 'Ready-to-use vial · 10 mg/mL',
        unit: 'mg',
        concentration: 10,
        note:
            '100 mg/10 mL ready-to-use vial.',
      ),
      IvWithdrawalVariant(
        id: 'esmolol-premix-10mg-ml',
        label: 'Premix bag · 10 mg/mL',
        unit: 'mg',
        concentration: 10,
        note:
            '2500 mg/250 mL premix bag; medication port is for withdrawing an initial bolus only.',
      ),
      IvWithdrawalVariant(
        id: 'esmolol-premix-20mg-ml',
        label: 'Double-strength premix · 20 mg/mL',
        unit: 'mg',
        concentration: 20,
        note:
            '2000 mg/100 mL double-strength premix bag.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Sodium bicarbonate 4.2%',
    population: 'General',
    formulation:
        'Fresenius Kabi Sodium Bicarbonate Injection, USP 4.2%: 42 mg/mL = 0.5 mEq/mL sodium and 0.5 mEq/mL bicarbonate; 2.5 mEq/5 mL single-dose vial.',
    reconstitution:
        'None. The cited 4.2% product is a ready solution at 0.5 mEq/mL.',
    resultingConcentration:
        '0.5 mEq/mL Na+ and 0.5 mEq/mL HCO3− (42 mg/mL sodium bicarbonate).',
    furtherDilution:
        'No universal further-dilution recipe is assumed. Use the exact indication/order and institutional protocol if admixture into another IV fluid is required.',
    allowedDiluents:
        'Do not infer a universal compatible diluent list from concentration alone. If added to another IV fluid, compatibility must be established for the exact solution and co-administered drugs.',
    administration:
        'IV use only. Dose and rate depend on indication, age, acid-base status and monitoring. This 4.2% profile is kept separate from 8.4%. In neonates and children under 2 years, the label warns against rapid hypertonic bicarbonate administration and notes that 4.2% may be preferred for slower administration.',
    stability:
        'Store at 20–25°C and do not freeze. Single-dose vial; discard unused portion.',
    incompatibilities:
        'Norepinephrine and dobutamine are incompatible with sodium bicarbonate solution. Avoid addition to calcium-containing parenteral solutions unless compatibility is established because precipitation or haze may occur.',
    criticalLocks: [
      'Concentration lock: 4.2% = 0.5 mEq/mL; do not substitute the 8.4% 1 mEq/mL concentration.',
      'Pediatric lock: hypertonic bicarbonate administration in neonates/children under 2 years requires special rate caution.',
      'Compatibility lock: do not admix with norepinephrine or dobutamine; avoid calcium-containing solutions unless compatibility is established.',
    ],
    sourceLabel:
        'DailyMed · Fresenius Kabi Sodium Bicarbonate Injection USP 4.2% · current label Oct 2025',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'sodium-bicarbonate-4_2-0_5meq-ml',
        label: 'Sodium bicarbonate 4.2% · 0.5 mEq/mL',
        unit: 'mEq',
        concentration: 0.5,
        note:
            'Calculator converts an already prescribed mEq dose to mL of the exact 4.2% product only.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Hypertonic sodium chloride 3%',
    population: 'General',
    formulation:
        'B. Braun 3% Sodium Chloride Injection, USP hypertonic solution in 500 mL EXCEL container; 30 g/L NaCl, sodium 513 mEq/L and chloride 513 mEq/L, calculated osmolarity about 1030 mOsm/L.',
    reconstitution:
        'None. The cited 3% sodium chloride product is supplied ready to use.',
    resultingConcentration:
        '3% w/v sodium chloride = 30 mg/mL NaCl; sodium 513 mEq/L = 0.513 mEq/mL and chloride 0.513 mEq/mL.',
    furtherDilution:
        'No routine dilution is required for the cited 3% product. Do not let the calculator create a different saline concentration.',
    allowedDiluents:
        'No diluent is required. Some additives may be incompatible; verify exact compatibility before adding any medication.',
    administration:
        'IV infusion only. The product label identifies it as concentrated/hypertonic and directs slow infusion with constant observation to avoid pulmonary edema. Therapeutic volume and rate must follow the indication-specific order/protocol; this preparation profile does not choose a hypertonic-saline treatment regimen.',
    stability:
        'Single-dose container. Store at room temperature around 25°C, avoid excessive heat, protect from freezing, and do not remove overwrap until ready for use. If additives are introduced, the cited label instructs not to store the admixture.',
    incompatibilities:
        'Some additives may be incompatible. Do not use the container in series connection. Use only if solution is clear and the container/seals are intact.',
    criticalLocks: [
      'Product lock: this is ready-to-use 3% saline, not a recipe for compounding 3% from other sodium chloride products.',
      'Concentration lock: sodium = 0.513 mEq/mL; do not confuse with 0.9% saline.',
      'Protocol lock: calculator must not select bolus volume or infusion rate; those are indication-specific clinical orders.',
      'Container lock: do not use in series connection.',
    ],
    sourceLabel:
        'DailyMed · B. Braun 3% Sodium Chloride Injection USP 500 mL EXCEL container · current label',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'hypertonic-saline-3percent-sodium',
        label: '3% Sodium Chloride · sodium 0.513 mEq/mL',
        unit: 'mEq sodium',
        concentration: 0.513,
        note:
            'Converts an already prescribed sodium mEq amount to mL of the exact 3% product only. Does not determine a therapeutic bolus or infusion rate.',
      ),
    ],
  ),


  IvPreparationProfile(
    name: 'Potassium phosphate',
    population: 'General',
    formulation:
        'Potassium Phosphates Injection, USP concentrated solution: phosphorus 45 mmol/15 mL (3 mmol/mL) and potassium 66 mEq/15 mL (4.4 mEq/mL), single-dose 15 mL vial.',
    reconstitution:
        'None. This is a concentrated liquid, but it MUST be diluted before IV administration.',
    resultingConcentration:
        'Stock: phosphorus 3 mmol/mL plus potassium 4.4 mEq/mL.',
    furtherDilution:
        'Mandatory. Withdraw the ordered amount and add to 0.9% Sodium Chloride Injection or D5W. For adults and pediatric patients ≥12 years, the label recommends a total volume of 100 or 250 mL. Maximum concentration for adults/≥12 years: peripheral phosphorus 6.8 mmol/100 mL (potassium 10 mEq/100 mL); central phosphorus 18 mmol/100 mL (potassium 26.4 mEq/100 mL).',
    allowedDiluents:
        '0.9% Sodium Chloride Injection or 5% Dextrose Injection for correction of hypophosphatemia in the cited label pathway.',
    administration:
        'IV infusion only after dilution. For adults and pediatric patients ≥12 years, maximum infusion rate is phosphorus 6.8 mmol/hour (potassium 10 mEq/hour) via peripheral catheter and phosphorus 15 mmol/hour (potassium 22 mEq/hour) via central catheter. Continuous ECG monitoring with central administration is recommended above potassium 10 mEq/hour.',
    stability:
        'After dilution, the cited product is stable for up to 4 hours at room temperature or 14 days refrigerated at 2–8°C. Single-dose vial: discard unused contents.',
    incompatibilities:
        'Do not infuse undiluted or as IV bolus. Because calcium-phosphate precipitation can occur, verify exact compatibility before combining with calcium-containing solutions or parenteral nutrition admixtures.',
    criticalLocks: [
      'Concentrate lock: 3 mmol phosphorus/mL also delivers 4.4 mEq potassium/mL; both must be counted.',
      'Dilution lock: MUST be diluted before IV administration.',
      'Route lock: peripheral and central maximum concentrations/rates are different.',
      'Calculator lock: calculator converts ordered phosphorus mmol to stock mL only; it must not choose the replacement dose or final infusion concentration.',
    ],
    sourceLabel:
        'DailyMed · Potassium Phosphates Injection, USP 3 mmol phosphorus/mL + 4.4 mEq potassium/mL · current 2026 labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'potassium-phosphate-3mmol-ml',
        label: 'Potassium phosphates concentrate · 3 mmol phosphorus/mL',
        unit: 'mmol phosphorus',
        concentration: 3,
        note:
            'Each 1 mL also contains 4.4 mEq potassium. Mandatory dilution; final concentration and rate depend on venous access and patient factors.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Phenytoin',
    population: 'General',
    formulation:
        'Phenytoin Sodium Injection, USP ready solution 50 mg/mL; current single-dose presentations include 100 mg/2 mL and 250 mg/5 mL.',
    reconstitution:
        'None. Supplied as a ready solution at 50 mg/mL.',
    resultingConcentration:
        '50 mg/mL phenytoin sodium.',
    furtherDilution:
        'For IV infusion, dilute only in 0.9% Sodium Chloride. Final phenytoin concentration must be at least 5 mg/mL. Start administration immediately after preparation and complete within 1–4 hours.',
    allowedDiluents:
        '0.9% Sodium Chloride Injection only for the cited infusion pathway. Avoid dextrose and dextrose-containing solutions because precipitation can occur.',
    administration:
        'Direct slow IV injection or NS infusion. Adult IV rate must not exceed 50 mg/min. Pediatric rate: 1–3 mg/kg/min or 50 mg/min, whichever is slower. Test IV patency with saline before administration and flush with saline afterward. Use an in-line 0.22–0.55 micron filter for infusion.',
    stability:
        'Prepared NS infusion must be used immediately and completed within 1–4 hours; do NOT refrigerate the infusion mixture. Single-dose vial: discard unused portion.',
    incompatibilities:
        'Avoid dextrose-containing solutions because of poor solubility and precipitation. Do not use solution if hazy or precipitated.',
    criticalLocks: [
      'Diluent lock: NS only for infusion; no D5W.',
      'Concentration lock: final infusion concentration must be ≥5 mg/mL.',
      'Rate lock: adults ≤50 mg/min; pediatric rate is slower of 1–3 mg/kg/min or 50 mg/min.',
      'Filter lock: use 0.22–0.55 micron in-line filter for infusion.',
    ],
    sourceLabel:
        'DailyMed · Phenytoin Sodium Injection, USP 50 mg/mL · current labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'phenytoin-50mg-ml',
        label: 'Phenytoin sodium · 50 mg/mL',
        unit: 'mg',
        concentration: 50,
        note:
            'Stock withdrawal only. If infused, dilute in NS to final concentration ≥5 mg/mL and use immediately.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Valproate',
    population: 'General',
    formulation:
        'Valproate Sodium Injection, USP preservative-free single-dose vial: 500 mg/5 mL = 100 mg/mL.',
    reconstitution:
        'None. Supplied as a ready solution at 100 mg/mL.',
    resultingConcentration:
        '100 mg/mL valproate sodium injection.',
    furtherDilution:
        'Mandatory for the cited IV infusion pathway. Dilute the ordered dose with at least 50 mL of a compatible diluent.',
    allowedDiluents:
        'D5W, 0.9% Sodium Chloride Injection, or Lactated Ringer’s Injection.',
    administration:
        'IV infusion over 60 minutes. Rapid infusion has been associated with more adverse reactions; experience is limited with infusion times <60 minutes or rates >20 mg/min in patients with epilepsy.',
    stability:
        'Physically compatible and chemically stable for at least 24 hours at controlled room temperature in D5W, NS or Lactated Ringer’s when stored in glass or PVC bags. Single-dose vial: discard unused portion.',
    incompatibilities:
        'Do not assume compatibility with solutions or medications outside the label-listed diluents without separate evidence.',
    criticalLocks: [
      'Infusion lock: for the cited pathway, dilute with at least 50 mL and infuse over 60 minutes.',
      'Rate lock: avoid automatically converting this to a rapid IV push pathway.',
      'Calculator lock: calculator reports stock withdrawal volume from 100 mg/mL only; it does not choose dose or final bag volume beyond the label minimum.',
    ],
    sourceLabel:
        'DailyMed · Valproate Sodium Injection, USP 500 mg/5 mL (100 mg/mL) · current labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'valproate-100mg-ml',
        label: 'Valproate sodium · 100 mg/mL',
        unit: 'mg',
        concentration: 100,
        note:
            'Stock withdrawal only; dilute with at least 50 mL D5W, NS or LR for the cited 60-minute infusion pathway.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Phenobarbital',
    population: 'General',
    formulation:
        'Phenobarbital Sodium Injection, USP single-dose 1 mL vials available as 65 mg/mL or 130 mg/mL; exact cited Nexus product.',
    reconstitution:
        'None. Both products are ready solutions for IM or slow IV use.',
    resultingConcentration:
        'Two distinct stock concentrations: 65 mg/mL and 130 mg/mL.',
    furtherDilution:
        'No routine dilution recipe is established by the cited product label for slow IV injection. Do not invent one.',
    allowedDiluents:
        'No routine IV diluent specified for direct slow IV use in the cited label. If dilution is required by local policy, verify exact compatibility separately.',
    administration:
        'Slow IV injection only when IV use is clinically required. Adult IV rate must not exceed 60 mg/min. Use a larger vein rather than small hand/wrist veins; monitor blood pressure, respiration and cardiac function, with resuscitation/ventilation capability available.',
    stability:
        'Store at 20–25°C. Do not use if discolored or if precipitate is present. Single-dose vial; discard unused portion.',
    incompatibilities:
        'Do not assume admixture compatibility. Avoid intra-arterial injection and extravasation; severe tissue injury can occur.',
    criticalLocks: [
      'Presentation lock: distinguish 65 mg/mL from 130 mg/mL before calculation.',
      'Rate lock: adult IV rate must not exceed 60 mg/min.',
      'Vein lock: avoid small peripheral veins such as dorsum of hand/wrist for IV administration.',
      'Calculator lock: calculator converts ordered mg to stock mL only; it does not define a dilution recipe.',
    ],
    sourceLabel:
        'DailyMed · Nexus Phenobarbital Sodium Injection, USP 65 mg/mL and 130 mg/mL · revised 2025/current label',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'phenobarbital-65mg-ml',
        label: 'Phenobarbital sodium · 65 mg/mL',
        unit: 'mg',
        concentration: 65,
        note:
            'Exact 65 mg/mL vial only.',
      ),
      IvWithdrawalVariant(
        id: 'phenobarbital-130mg-ml',
        label: 'Phenobarbital sodium · 130 mg/mL',
        unit: 'mg',
        concentration: 130,
        note:
            'Exact 130 mg/mL vial only.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Midazolam',
    population: 'General',
    formulation:
        'Preservative-free Midazolam Injection, USP single-dose vials available as 1 mg/mL and 5 mg/mL; this profile deliberately excludes benzyl-alcohol-containing multi-dose products.',
    reconstitution:
        'None. Ready solution at either 1 mg/mL or 5 mg/mL; verify the exact vial concentration before calculation.',
    resultingConcentration:
        'Stock concentration is product-specific: 1 mg/mL or 5 mg/mL.',
    furtherDilution:
        'For adult continuous infusion, the 5 mg/mL formulation is recommended diluted to 0.5 mg/mL with 0.9% Sodium Chloride or D5W. Both 1 mg/mL and 5 mg/mL formulations may be diluted with NS or D5W for other labeled workflows.',
    allowedDiluents:
        '0.9% Sodium Chloride Injection or D5W. At 0.5 mg/mL, label compatibility is documented for up to 24 hours in NS or D5W and up to 4 hours in Lactated Ringer’s.',
    administration:
        'IV administration requires slow, individualized titration with continuous respiratory and cardiac monitoring and immediate resuscitation capability. This profile does not select a sedation dose or infusion rate.',
    stability:
        'At 0.5 mg/mL, compatible for up to 24 hours in NS or D5W and up to 4 hours in Lactated Ringer’s. Store unopened preservative-free vials at controlled room temperature; discard unused single-dose vial contents.',
    incompatibilities:
        'Do not infer compatibility beyond the label-listed diluents/admixtures. Avoid intra-arterial injection and extravasation.',
    criticalLocks: [
      'Concentration lock: distinguish 1 mg/mL from 5 mg/mL before calculation.',
      'Formulation lock: this profile uses preservative-free single-dose products and does not apply benzyl-alcohol-containing multi-dose vial instructions.',
      'Infusion lock: 5 mg/mL formulation → 0.5 mg/mL for the cited adult continuous-infusion pathway.',
      'Monitoring lock: respiratory/cardiac monitoring and resuscitation capability are mandatory during IV sedation.',
    ],
    sourceLabel:
        'DailyMed · Preservative-free Midazolam Injection, USP 1 mg/mL and 5 mg/mL · current labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'midazolam-pf-1mg-ml',
        label: 'Preservative-free midazolam · 1 mg/mL',
        unit: 'mg',
        concentration: 1,
        note:
            'Exact preservative-free 1 mg/mL single-dose vial.',
      ),
      IvWithdrawalVariant(
        id: 'midazolam-pf-5mg-ml',
        label: 'Preservative-free midazolam · 5 mg/mL',
        unit: 'mg',
        concentration: 5,
        note:
            'Exact preservative-free 5 mg/mL single-dose vial; adult continuous infusion label pathway dilutes this to 0.5 mg/mL.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Furosemide',
    population: 'General',
    formulation:
        'Furosemide Injection, USP preservative-free single-dose vials at 10 mg/mL; current labeled presentations include 20 mg/2 mL, 40 mg/4 mL and 100 mg/10 mL.',
    reconstitution:
        'None. Ready solution at 10 mg/mL.',
    resultingConcentration:
        '10 mg/mL furosemide.',
    furtherDilution:
        'Routine small IV doses may be given slowly without dilution. For high-dose controlled IV infusion, the label permits addition to 0.9% Sodium Chloride, Lactated Ringer’s, or D5W after the solution pH has been adjusted to above 5.5.',
    allowedDiluents:
        'For high-dose controlled infusion: 0.9% Sodium Chloride Injection, Lactated Ringer’s Injection, or D5W, with pH adjusted to >5.5.',
    administration:
        'For usual adult edema dosing, give the IV dose slowly over 1–2 minutes. For high-dose controlled IV infusion, rate must not exceed 4 mg/min.',
    stability:
        'Store at 20–25°C and protect from light. Single-dose vial; discard unused portion.',
    incompatibilities:
        'Do not assume compatibility with acidic solutions or other medications; furosemide can precipitate when pH falls. For high-dose infusion, keep admixture pH above 5.5 as directed by the label.',
    criticalLocks: [
      'Stock lock: 10 mg/mL is the ready vial concentration.',
      'High-dose infusion lock: if diluted, use NS/LR/D5W with pH >5.5 and rate ≤4 mg/min.',
      'Light lock: protect vial from light.',
    ],
    sourceLabel:
        'DailyMed · Furosemide Injection, USP 10 mg/mL preservative-free single-dose vials · current 2025 labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'furosemide-10mg-ml',
        label: 'Furosemide · 10 mg/mL',
        unit: 'mg',
        concentration: 10,
        note:
            'Ready stock concentration. High-dose infusion requires separate label-defined dilution/pH handling.',
      ),
    ],
  ),


  IvPreparationProfile(
    name: 'Lorazepam',
    population: 'General',
    formulation:
        'Lorazepam Injection, USP for IV/IM use. Current labeled strengths include 2 mg/mL and 4 mg/mL; this profile applies only to products whose label requires dilution before IV administration.',
    reconstitution:
        'None. The supplied product is a ready solution, but immediately before IV use it MUST be diluted with an equal volume of compatible diluent.',
    resultingConcentration:
        'Stock is 2 mg/mL or 4 mg/mL. Equal-volume dilution produces 1 mg/mL from the 2 mg/mL product and 2 mg/mL from the 4 mg/mL product.',
    furtherDilution:
        'For IV use, mix the withdrawn lorazepam volume with an equal volume of compatible diluent immediately before administration. Mix gently by repeated inversion until homogeneous; do not shake vigorously.',
    allowedDiluents:
        'Sterile Water for Injection, 0.9% Sodium Chloride Injection, or 5% Dextrose Injection.',
    administration:
        'Slow IV administration only after equal-volume dilution. The labeled injection rate must not exceed 2 mg/min. Respiratory support and monitoring appropriate for IV benzodiazepine use must be available.',
    stability:
        'Protect from light and refrigerate according to the exact product label. Prepare the IV dilution immediately before use; discard unused single-dose product.',
    incompatibilities:
        'Do not add additional medication to a Carpuject syringe/cartridge. Do not use if discolored or if precipitate is present.',
    criticalLocks: [
      'IV dilution lock: equal-volume dilution is required immediately before IV administration for this cited product pathway.',
      'Concentration lock: distinguish 2 mg/mL from 4 mg/mL stock before withdrawal.',
      'Rate lock: IV injection must not exceed 2 mg/min.',
      'Mixing lock: gently invert; do not shake vigorously.',
    ],
    sourceLabel:
        'DailyMed · Lorazepam Injection, USP 2 mg/mL and 4 mg/mL · current 2026 IV dilution labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'lorazepam-2mg-ml',
        label: 'Lorazepam stock · 2 mg/mL',
        unit: 'mg',
        concentration: 2,
        note:
            'Withdraw from 2 mg/mL stock, then dilute with an equal volume immediately before IV use to yield 1 mg/mL.',
      ),
      IvWithdrawalVariant(
        id: 'lorazepam-4mg-ml',
        label: 'Lorazepam stock · 4 mg/mL',
        unit: 'mg',
        concentration: 4,
        note:
            'Withdraw from 4 mg/mL stock, then dilute with an equal volume immediately before IV use to yield 2 mg/mL.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Ketamine',
    population: 'General',
    formulation:
        'KETALAR/ketamine hydrochloride injection products are available as 10 mg/mL, 50 mg/mL and 100 mg/mL. Preparation differs by concentration.',
    reconstitution:
        'None. For IV induction, 10 mg/mL and 50 mg/mL may be administered without dilution in the cited KETALAR pathway. The 100 mg/mL concentration MUST be diluted before IV administration.',
    resultingConcentration:
        '10 mg/mL, 50 mg/mL or 100 mg/mL stock. For IV induction, equal-volume dilution of the 100 mg/mL product yields 50 mg/mL. For maintenance infusion, labeled preparations include 1 mg/mL and, when fluid restricted, 2 mg/mL.',
    furtherDilution:
        'For IV induction using 100 mg/mL: dilute with an equal volume of SWFI, 0.9% NaCl or D5W and use immediately. For maintenance: 10 mL of 50 mg/mL or 5 mL of 100 mg/mL into 500 mL D5W or NS yields 1 mg/mL; use a 250 mL final volume for 2 mg/mL when fluid restriction is required.',
    allowedDiluents:
        'SWFI, 0.9% Sodium Chloride or D5W for equal-volume dilution of 100 mg/mL. Maintenance infusion: D5W or 0.9% Sodium Chloride.',
    administration:
        'IV administration should be slow and under continuous respiratory and hemodynamic monitoring. For the cited induction pathway, the label describes administration over about 60 seconds; therapeutic dose selection remains outside this preparation profile.',
    stability:
        'Use diluted ketamine immediately after preparation. Store unopened product according to the exact manufacturer label.',
    incompatibilities:
        'Do not inject the 100 mg/mL concentration IV without proper dilution. Do not extrapolate a dilution rule from one concentration to another.',
    criticalLocks: [
      'Concentration lock: 10, 50 and 100 mg/mL are different preparation pathways.',
      '100 mg/mL IV lock: MUST be diluted 1:1 before IV induction.',
      'Maintenance lock: labeled maintenance concentrations are 1 mg/mL, or 2 mg/mL when fluid restricted.',
      'Immediate-use lock: use diluted solution immediately.',
    ],
    sourceLabel:
        'DailyMed · KETALAR / Ketamine Hydrochloride Injection 10, 50 and 100 mg/mL · current preparation labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'ketamine-10mg-ml',
        label: 'Ketamine · 10 mg/mL',
        unit: 'mg',
        concentration: 10,
        note:
            'Cited IV induction pathway may use this concentration without dilution.',
      ),
      IvWithdrawalVariant(
        id: 'ketamine-50mg-ml',
        label: 'Ketamine · 50 mg/mL',
        unit: 'mg',
        concentration: 50,
        note:
            'Cited IV induction pathway may use this concentration without dilution; maintenance infusion requires separate dilution.',
      ),
      IvWithdrawalVariant(
        id: 'ketamine-100mg-ml',
        label: 'Ketamine concentrate · 100 mg/mL',
        unit: 'mg',
        concentration: 100,
        note:
            'Stock withdrawal only. MUST be diluted before IV administration.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Propofol',
    population: 'General',
    formulation:
        'Propofol Injectable Emulsion, USP 10 mg/mL in single-patient-use vials; common vial sizes are 200 mg/20 mL, 500 mg/50 mL and 1000 mg/100 mL.',
    reconstitution:
        'None. Propofol injectable emulsion is supplied ready to use at 10 mg/mL. Shake well before use and maintain strict aseptic technique.',
    resultingConcentration:
        '10 mg/mL ready-to-use emulsion.',
    furtherDilution:
        'Routine dilution is not required. If dilution is clinically necessary, dilute only with D5W and never below 2 mg/mL.',
    allowedDiluents:
        'D5W only for direct dilution of the propofol emulsion. The label separately lists selected fluids compatible through a Y-type set; do not treat Y-site compatibility as permission to admix drugs into the vial.',
    administration:
        'IV administration only by clinicians trained in anesthesia/sedation with continuous monitoring and airway/resuscitation capability. Use a controlled infusion device when infusing.',
    stability:
        'Single-patient use. Start administration promptly after opening/spiking. Discard unused propofol, reservoirs and dedicated tubing at the end of the procedure or at 12 hours, whichever comes first; change administration lines at 12 hours. Do not freeze.',
    incompatibilities:
        'Do not mix propofol with other therapeutic agents before administration. Compatibility with coadministration of blood/serum/plasma is not established.',
    criticalLocks: [
      'Emulsion lock: ready-to-use concentration is 10 mg/mL.',
      'Dilution lock: if dilution is necessary, D5W only and final concentration must remain ≥2 mg/mL.',
      'Asepsis lock: strict aseptic technique and single-patient use are mandatory.',
      '12-hour lock: discard drug/tubing at procedure end or 12 hours, whichever occurs sooner.',
    ],
    sourceLabel:
        'DailyMed · Propofol Injectable Emulsion, USP 10 mg/mL single-patient-use vial · current 2025–2026 labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'propofol-10mg-ml',
        label: 'Propofol emulsion · 10 mg/mL',
        unit: 'mg',
        concentration: 10,
        note:
            'Ready-to-use emulsion. If dilution is needed, D5W only and final concentration must be at least 2 mg/mL.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Dexmedetomidine',
    population: 'General',
    formulation:
        'Dexmedetomidine is available both as 200 mcg/2 mL concentrate (100 mcg/mL) requiring dilution and as ready-to-use 4 mcg/mL premix presentations such as 200 mcg/50 mL and 400 mcg/100 mL.',
    reconstitution:
        'For the 100 mcg/mL concentrate: withdraw 2 mL and add to 48 mL of 0.9% Sodium Chloride to a total of 50 mL, then gently mix. Ready-to-use 4 mcg/mL premix containers require no dilution.',
    resultingConcentration:
        'Concentrate pathway: 200 mcg in 50 mL final volume = 4 mcg/mL. Premix presentations are already 4 mcg/mL.',
    furtherDilution:
        'Mandatory only for the 100 mcg/mL concentrate. Do not further dilute the cited ready-to-use 4 mcg/mL premix presentations unless the exact product label/local validated protocol explicitly requires it.',
    allowedDiluents:
        '0.9% Sodium Chloride for preparation of the 100 mcg/mL concentrate to 4 mcg/mL.',
    administration:
        'IV infusion using a controlled infusion device with continuous blood pressure, heart-rate and oxygen monitoring. Therapeutic loading/maintenance rate selection is outside this preparation profile.',
    stability:
        'Use prepared/premixed solution according to exact product labeling and institutional sterile-handling policy. Single-dose concentrate vial: discard unused portion.',
    incompatibilities:
        'Do not co-administer through the same IV catheter with blood or plasma because physical compatibility is not established. Dexmedetomidine has documented incompatibility with amphotericin B and diazepam in cited labeling.',
    criticalLocks: [
      'Presentation lock: 100 mcg/mL concentrate and 4 mcg/mL premix are not interchangeable preparation pathways.',
      'Concentrate lock: 2 mL concentrate + 48 mL NS = 50 mL at 4 mcg/mL.',
      'Premix lock: 200 mcg/50 mL and 400 mcg/100 mL are ready to use at 4 mcg/mL.',
      'Blood/plasma lock: do not co-administer through the same catheter.',
    ],
    sourceLabel:
        'DailyMed · Dexmedetomidine Injection 100 mcg/mL concentrate and 4 mcg/mL ready-to-use premix · current 2026 labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'dexmedetomidine-concentrate-100mcg-ml',
        label: 'Dexmedetomidine concentrate · 100 mcg/mL',
        unit: 'mcg',
        concentration: 100,
        note:
            'Stock withdrawal only. Mandatory dilution: 2 mL + 48 mL NS → 4 mcg/mL.',
      ),
      IvWithdrawalVariant(
        id: 'dexmedetomidine-premix-4mcg-ml',
        label: 'Dexmedetomidine premix · 4 mcg/mL',
        unit: 'mcg',
        concentration: 4,
        note:
            'Ready-to-use premix concentration; no further dilution required.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Fentanyl',
    population: 'General',
    formulation:
        'Fentanyl Citrate Injection, USP preservative-free solution containing fentanyl 50 mcg/mL for IV or IM use.',
    reconstitution:
        'None. Supplied as a ready solution at 50 mcg/mL.',
    resultingConcentration:
        '50 mcg/mL fentanyl.',
    furtherDilution:
        'The cited product label does not establish one universal IV dilution recipe for all indications. Do not invent a continuous-infusion concentration from the stock vial.',
    allowedDiluents:
        'No routine diluent is required for labeled slow IV use. If a continuous infusion or dilution is ordered, use an exact institutional/product-specific compatibility reference.',
    administration:
        'Slow IV use by personnel specifically trained in opioid administration, with respiratory monitoring and resuscitation capability immediately available.',
    stability:
        'Protect from light and store according to the exact product label. Preservative-free single-dose vial: discard unused contents.',
    incompatibilities:
        'Do not assume admixture or Y-site compatibility from the stock product label; verify any planned infusion mixture separately.',
    criticalLocks: [
      'Stock lock: fentanyl concentration is 50 mcg/mL.',
      'Unit lock: calculator uses mcg, not mg.',
      'Infusion lock: do not invent a universal continuous-infusion dilution recipe.',
      'Single-dose lock: discard unused preservative-free vial contents.',
    ],
    sourceLabel:
        'DailyMed · Fentanyl Citrate Injection, USP 50 mcg/mL preservative-free · current Aug 2026 labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'fentanyl-50mcg-ml',
        label: 'Fentanyl · 50 mcg/mL',
        unit: 'mcg',
        concentration: 50,
        note:
            'Ready stock concentration. Calculator converts an already prescribed mcg dose to mL only.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Morphine',
    population: 'General',
    formulation:
        'Morphine Sulfate Injection, USP preservative-free single-dose vials for IV/IM use; exact cited Hikma strengths are 2 mg/mL, 4 mg/mL and 10 mg/mL.',
    reconstitution:
        'None. Supplied as ready solutions at 2 mg/mL, 4 mg/mL or 10 mg/mL.',
    resultingConcentration:
        'Product-specific stock concentration: 2 mg/mL, 4 mg/mL or 10 mg/mL.',
    furtherDilution:
        'The cited direct-IV product label does not define one universal dilution recipe for all clinical uses. Do not let the calculator create a continuous-infusion concentration.',
    allowedDiluents:
        'No routine diluent is required for the labeled direct-IV pathway. Any continuous-infusion or special dilution should follow an exact institutional/product-specific compatibility protocol.',
    administration:
        'IV use requires close respiratory and hemodynamic monitoring. The exact IV dose and administration speed are indication- and patient-specific and are not selected by this preparation profile.',
    stability:
        'Store at 20–25°C, protect from light, keep from freezing, and discard unused portion of the preservative-free single-dose vial.',
    incompatibilities:
        'Do not infer admixture or Y-site compatibility from the stock product label. Verify any planned diluted infusion separately.',
    criticalLocks: [
      'Presentation lock: distinguish 2, 4 and 10 mg/mL before withdrawal.',
      'Opioid monitoring lock: respiratory monitoring and resuscitation capability are required.',
      'Infusion lock: calculator converts prescribed mg to stock mL only and does not create a universal infusion recipe.',
      'Single-dose lock: discard unused preservative-free vial contents.',
    ],
    sourceLabel:
        'DailyMed · Hikma Morphine Sulfate Injection, USP preservative-free 2, 4 and 10 mg/mL · current Jul 2026 labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'morphine-2mg-ml',
        label: 'Morphine sulfate · 2 mg/mL',
        unit: 'mg',
        concentration: 2,
        note:
            'Exact 2 mg/mL single-dose vial.',
      ),
      IvWithdrawalVariant(
        id: 'morphine-4mg-ml',
        label: 'Morphine sulfate · 4 mg/mL',
        unit: 'mg',
        concentration: 4,
        note:
            'Exact 4 mg/mL single-dose vial.',
      ),
      IvWithdrawalVariant(
        id: 'morphine-10mg-ml',
        label: 'Morphine sulfate · 10 mg/mL',
        unit: 'mg',
        concentration: 10,
        note:
            'Exact 10 mg/mL single-dose vial.',
      ),
    ],
  ),


  IvPreparationProfile(
    name: 'Regular insulin infusion',
    population: 'General',
    formulation:
        'HUMULIN R (insulin human) U-100 clear solution: 100 units/mL. This profile applies to the labeled intravenous use of HUMULIN R U-100, not concentrated U-500 insulin.',
    reconstitution:
        'None. HUMULIN R U-100 is supplied as a clear ready solution at 100 units/mL.',
    resultingConcentration:
        'Stock concentration 100 units/mL. For IV administration, the labeled final concentration range is 0.1 unit/mL to 1 unit/mL.',
    furtherDilution:
        'Mandatory for IV infusion. Prepare in an infusion system containing 0.9% Sodium Chloride Injection so that the final insulin concentration is between 0.1 and 1 unit/mL. The exact concentration within this range must follow the prescribed/institutional protocol.',
    allowedDiluents:
        '0.9% Sodium Chloride Injection for the cited IV HUMULIN R pathway.',
    administration:
        'IV infusion only under medical supervision with close blood-glucose and potassium monitoring. This preparation profile does not select the therapeutic infusion rate or titration algorithm.',
    stability:
        'Prepared IV infusion bags are stable refrigerated at 2–8°C for 48 hours, then may be used at room temperature for up to an additional 48 hours. Protect HUMULIN R from heat and light and do not freeze.',
    incompatibilities:
        'Do not substitute U-500 or another insulin formulation for this U-100 IV preparation. Do not use a non-NS IV diluent unless the exact insulin product label explicitly supports it.',
    criticalLocks: [
      'Product lock: HUMULIN R U-100 = 100 units/mL; do not confuse with U-500 insulin.',
      'IV concentration lock: final infusion concentration must remain within 0.1–1 unit/mL.',
      'Diluent lock: use 0.9% Sodium Chloride for the cited IV pathway.',
      'Monitoring lock: close glucose and potassium monitoring is required.',
      'Calculator lock: calculator converts prescribed units to stock mL only; it must not choose the infusion protocol.',
    ],
    sourceLabel:
        'DailyMed · HUMULIN R (insulin human) U-100 · current prescribing information',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'humulin-r-u100',
        label: 'HUMULIN R U-100 · 100 units/mL',
        unit: 'units',
        concentration: 100,
        note:
            'Stock withdrawal only. Mandatory IV dilution in 0.9% NaCl to a final 0.1–1 unit/mL concentration.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Heparin',
    population: 'General',
    formulation:
        'Heparin Sodium Injection, USP for IV/SC use. Current labeling includes 1,000, 5,000 and 10,000 USP units/mL vial concentrations; some presentations contain benzyl alcohol while others are preservative-free.',
    reconstitution:
        'None. Supplied as ready heparin solutions at product-specific concentrations.',
    resultingConcentration:
        'Common labeled stock concentrations: 1,000 units/mL, 5,000 units/mL and 10,000 units/mL. Verify the exact vial concentration and preservative status before withdrawal.',
    furtherDilution:
        'For continuous adult IV infusion, the cited label provides 20,000–40,000 units per 24 hours in 1,000 mL of 0.9% Sodium Chloride Injection (or another specifically compatible solution). Intermittent IV doses may be given undiluted or in 50–100 mL of 0.9% Sodium Chloride. Do not let the calculator select a therapeutic heparin regimen.',
    allowedDiluents:
        '0.9% Sodium Chloride Injection for the explicit labeled adult intermittent and continuous infusion examples. Other infusion solutions require confirmed compatibility.',
    administration:
        'IV bolus/intermittent injection or continuous infusion according to the prescribed anticoagulation protocol with laboratory-guided dose adjustment.',
    stability:
        'Use and storage depend on the exact manufacturer/presentation. Preserved and preservative-free heparin products are not interchangeable for all populations; follow the exact vial/syringe label.',
    incompatibilities:
        'Heparin treatment vials are NOT heparin lock-flush products. Do not use a treatment-strength vial as a catheter-lock product. Verify admixture/Y-site compatibility before coadministration.',
    criticalLocks: [
      'Concentration lock: 1,000, 5,000 and 10,000 units/mL are different stock products.',
      'Preservative lock: some vials contain benzyl alcohol; verify before use in neonates/infants.',
      'Lock-flush lock: treatment-strength heparin is not a heparin lock-flush product.',
      'Protocol lock: therapeutic dose and infusion rate require the ordered anticoagulation protocol and laboratory monitoring.',
    ],
    sourceLabel:
        'DailyMed · Heparin Sodium Injection, USP · current IV/SC prescribing information',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'heparin-1000units-ml',
        label: 'Heparin · 1,000 units/mL',
        unit: 'units',
        concentration: 1000,
        note:
            'Verify the exact vial and preservative status before use.',
      ),
      IvWithdrawalVariant(
        id: 'heparin-5000units-ml',
        label: 'Heparin · 5,000 units/mL',
        unit: 'units',
        concentration: 5000,
        note:
            'Verify the exact vial/syringe and preservative status before use.',
      ),
      IvWithdrawalVariant(
        id: 'heparin-10000units-ml',
        label: 'Heparin · 10,000 units/mL',
        unit: 'units',
        concentration: 10000,
        note:
            'Verify the exact vial and preservative status before use.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Alteplase',
    population: 'General',
    formulation:
        'ACTIVASE (alteplase) lyophilized powder in 50 mg and 100 mg single-dose vials supplied with preservative-free Sterile Water for Injection.',
    reconstitution:
        '50 mg vial: reconstitute with the accompanying 50 mL SWFI. 100 mg vial: reconstitute with the accompanying 100 mL SWFI using the supplied transfer device according to the product IFU. Both yield 1 mg/mL. Do not use Bacteriostatic Water for Injection. Avoid vigorous agitation; gently swirl/slowly invert.',
    resultingConcentration:
        '1 mg/mL alteplase after labeled reconstitution of either the 50 mg or 100 mg Activase vial.',
    furtherDilution:
        'May be administered at 1 mg/mL or further diluted immediately before administration with an equal volume of 0.9% Sodium Chloride or D5W to yield 0.5 mg/mL.',
    allowedDiluents:
        'Reconstitution: only the accompanying preservative-free SWFI. Optional further dilution: equal volume of 0.9% Sodium Chloride Injection or D5W.',
    administration:
        'IV administration regimen is indication-specific (for example acute ischemic stroke, myocardial infarction or pulmonary embolism). This preparation profile intentionally does not choose the bolus/infusion dose or schedule.',
    stability:
        'Use within 8 hours after reconstitution when stored at 2–30°C. Activase contains no antibacterial preservatives; discard unused solution after administration is complete.',
    incompatibilities:
        'Do not use bacteriostatic water for reconstitution. Do not add unverified medications to Activase solution; verify any planned coadministration separately.',
    criticalLocks: [
      'Product lock: ACTIVASE systemic alteplase is not the same workflow as Cathflo Activase catheter declotting.',
      'Reconstitution lock: 50 mg + 50 mL SWFI and 100 mg + 100 mL SWFI both yield 1 mg/mL.',
      'Optional dilution lock: only equal-volume NS or D5W to 0.5 mg/mL.',
      'Agitation lock: avoid vigorous agitation; gently swirl or slowly invert.',
      'Protocol lock: calculator must not choose an indication-specific thrombolytic dose.',
    ],
    sourceLabel:
        'DailyMed · ACTIVASE (alteplase) 50 mg and 100 mg systemic IV product · current prescribing information',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'activase-50mg-1mg-ml',
        label: 'ACTIVASE 50 mg after reconstitution · 1 mg/mL',
        unit: 'mg',
        concentration: 1,
        note:
            '50 mg vial + accompanying 50 mL SWFI. Do not confuse with Cathflo Activase.',
      ),
      IvWithdrawalVariant(
        id: 'activase-100mg-1mg-ml',
        label: 'ACTIVASE 100 mg after reconstitution · 1 mg/mL',
        unit: 'mg',
        concentration: 1,
        note:
            '100 mg vial + accompanying 100 mL SWFI using the product transfer device.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Tenecteplase',
    population: 'General',
    formulation:
        'TNKase (tenecteplase) lyophilized powder supplied as 25 mg or 50 mg single-dose vials with the corresponding Sterile Water for Injection diluent vial.',
    reconstitution:
        'Use only the supplied SWFI. Reconstitute the 25 mg vial with the supplied 5.2 mL SWFI or the 50 mg vial with the supplied 10 mL SWFI. Direct diluent toward the lyophilized powder, allow large bubbles to dissipate, and gently swirl until dissolved. DO NOT SHAKE.',
    resultingConcentration:
        '5 mg/mL tenecteplase after reconstitution of either the 25 mg or 50 mg vial.',
    furtherDilution:
        'No further dilution for the cited TNKase bolus pathway.',
    allowedDiluents:
        'Only the supplied Sterile Water for Injection for vial reconstitution.',
    administration:
        'Administer the reconstituted dose as a single IV bolus over 5 seconds. Dose is indication- and weight-specific; the preparation calculator does not select the dose.',
    stability:
        'TNKase contains no antibacterial preservatives. Reconstitute immediately before use. If not used immediately, refrigerate the reconstituted vial at 2–8°C and use within 8 hours. Discard unused solution.',
    incompatibilities:
        'Precipitation may occur in an IV line containing dextrose. Flush a dextrose-containing line with 0.9% Sodium Chloride before and after the TNKase bolus.',
    criticalLocks: [
      'Product lock: tenecteplase is not alteplase and must not inherit Activase preparation instructions.',
      'Vial lock: 25 mg + supplied 5.2 mL SWFI and 50 mg + supplied 10 mL SWFI both yield 5 mg/mL.',
      'Bolus lock: single IV bolus over 5 seconds; no infusion recipe.',
      'Dextrose-line lock: flush dextrose-containing lines with NS before and after TNKase.',
      'Protocol lock: AIS and STEMI use different weight-based dosing ceilings; calculator must not choose the indication or dose.',
    ],
    sourceLabel:
        'DailyMed · TNKase (tenecteplase) 25 mg and 50 mg · current Feb 2025 prescribing information',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'tnkase-25mg-5mg-ml',
        label: 'TNKase 25 mg after reconstitution · 5 mg/mL',
        unit: 'mg',
        concentration: 5,
        note:
            '25 mg vial + supplied 5.2 mL SWFI; use the required reconstituted volume for the prescribed dose.',
      ),
      IvWithdrawalVariant(
        id: 'tnkase-50mg-5mg-ml',
        label: 'TNKase 50 mg after reconstitution · 5 mg/mL',
        unit: 'mg',
        concentration: 5,
        note:
            '50 mg vial + supplied 10 mL SWFI; use the required reconstituted volume for the prescribed dose.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Naloxone',
    population: 'General',
    formulation:
        'Naloxone Hydrochloride Injection, USP preservative-free single-dose vial: 0.4 mg/mL for IV, IM or SC use.',
    reconstitution:
        'None. Supplied as a ready solution at 0.4 mg/mL.',
    resultingConcentration:
        '0.4 mg/mL naloxone hydrochloride stock.',
    furtherDilution:
        'For continuous IV infusion, the cited label permits 2 mg naloxone in 500 mL of 0.9% Sodium Chloride or D5W, yielding 0.004 mg/mL (4 mcg/mL).',
    allowedDiluents:
        '0.9% Sodium Chloride Injection or D5W for the cited continuous-infusion pathway.',
    administration:
        'IV provides the most rapid onset in emergencies. Infusion rate must be titrated to patient response; this preparation profile does not choose the reversal dose or titration rate.',
    stability:
        'Prepared infusion mixtures should be used within 24 hours; discard any remaining solution after 24 hours. Store the stock product at controlled room temperature and protect from light. Discard unused single-dose vial contents.',
    incompatibilities:
        'Do not mix with preparations containing bisulfite, metabisulfite, long-chain/high-molecular-weight anions, or alkaline solutions. Do not add other drugs unless compatibility has been established.',
    criticalLocks: [
      'Stock lock: exact cited vial concentration is 0.4 mg/mL.',
      'Infusion recipe lock: 2 mg in 500 mL NS or D5W = 0.004 mg/mL.',
      'Stability lock: discard infusion after 24 hours.',
      'Titration lock: calculator must not choose the clinical reversal dose or infusion rate.',
    ],
    sourceLabel:
        'DailyMed · Naloxone Hydrochloride Injection, USP 0.4 mg/mL preservative-free · current 2026 labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'naloxone-0_4mg-ml',
        label: 'Naloxone · 0.4 mg/mL',
        unit: 'mg',
        concentration: 0.4,
        note:
            'Ready stock concentration. Continuous infusion, when ordered, uses the separate labeled 0.004 mg/mL preparation.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Flumazenil',
    population: 'General',
    formulation:
        'Flumazenil Injection, USP ready solution for IV use only: 0.1 mg/mL.',
    reconstitution:
        'None. Supplied ready to use at 0.1 mg/mL.',
    resultingConcentration:
        '0.1 mg/mL flumazenil.',
    furtherDilution:
        'Routine dilution is not required. If drawn into a syringe or mixed with a compatible IV solution, discard after 24 hours.',
    allowedDiluents:
        'Compatible solutions listed in the label: D5W, Lactated Ringer’s and normal saline.',
    administration:
        'IV use only. For adult reversal of conscious sedation/general anesthesia, the label starts with 0.2 mg (2 mL) over 15 seconds and uses repeated small doses as needed rather than one large bolus. Clinical reversal dosing remains indication- and patient-specific.',
    stability:
        'For optimum sterility, keep in the vial until just before use. If drawn into a syringe or mixed with D5W, LR or NS, discard after 24 hours.',
    incompatibilities:
        'Administer through a freely running IV into a large vein when possible. Do not assume compatibility with solutions outside D5W, LR and NS.',
    criticalLocks: [
      'Route lock: IV use only.',
      'Concentration lock: 0.1 mg/mL = 0.2 mg in 2 mL.',
      'Administration lock: use a series of small IV doses rather than a single large bolus.',
      'Stability lock: discard drawn/mixed solution after 24 hours.',
    ],
    sourceLabel:
        'DailyMed · Flumazenil Injection, USP 0.1 mg/mL · current prescribing information',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'flumazenil-0_1mg-ml',
        label: 'Flumazenil · 0.1 mg/mL',
        unit: 'mg',
        concentration: 0.1,
        note:
            'Ready IV concentration. Adult labeled initial reversal dose is 0.2 mg = 2 mL over 15 seconds.',
      ),
    ],
  ),


  IvPreparationProfile(
    name: 'Atropine',
    population: 'General',
    formulation:
        'Hospira Atropine Sulfate Injection, USP ready-to-use single-dose IV syringes: pediatric 0.25 mg/5 mL (0.05 mg/mL) and adult/general 0.5 mg/5 mL or 1 mg/10 mL (0.1 mg/mL).',
    reconstitution:
        'None. These cited Hospira syringes are supplied ready to use for intravenous administration.',
    resultingConcentration:
        'Two source-locked concentrations: 0.05 mg/mL and 0.1 mg/mL.',
    furtherDilution:
        'No routine dilution is required for the cited prefilled syringe products. Do not invent a dilution solely from the prescribed atropine dose.',
    allowedDiluents:
        'No added diluent is required for the cited ready-to-use syringes.',
    administration:
        'Intravenous administration. Dose is indication-specific and should be titrated according to heart rate, PR interval, blood pressure and symptoms; this preparation profile does not select the clinical dose.',
    stability:
        'Store at 20–25°C with permitted excursions to 15–30°C. Single-dose syringe; discard unused portion.',
    incompatibilities:
        'Do not transfer product-specific instructions between 0.05 mg/mL pediatric and 0.1 mg/mL syringes without verifying the concentration in hand.',
    criticalLocks: [
      'Concentration lock: distinguish 0.05 mg/mL from 0.1 mg/mL before calculation.',
      'Ready-to-use lock: no routine reconstitution or dilution for the cited Hospira prefilled syringes.',
      'Protocol lock: calculator converts an already prescribed mg dose to mL only; it does not choose the atropine indication or dose.',
    ],
    sourceLabel:
        'DailyMed · Hospira Atropine Sulfate Injection, USP 0.05 mg/mL and 0.1 mg/mL single-dose syringes · updated May 2026',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'atropine-pediatric-0_05mg-ml',
        label: 'Atropine pediatric syringe · 0.05 mg/mL',
        unit: 'mg',
        concentration: 0.05,
        note:
            'Exact 0.25 mg/5 mL pediatric single-dose syringe.',
      ),
      IvWithdrawalVariant(
        id: 'atropine-0_1mg-ml',
        label: 'Atropine syringe · 0.1 mg/mL',
        unit: 'mg',
        concentration: 0.1,
        note:
            'Applies to cited 0.5 mg/5 mL and 1 mg/10 mL single-dose syringes.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'N-acetylcysteine IV',
    population: 'General',
    formulation:
        'Acetylcysteine Injection 20%: 6 g/30 mL = 200 mg/mL sterile single-dose vial for intravenous acetaminophen-overdose treatment.',
    reconstitution:
        'None. Stock is a 200 mg/mL solution, but it MUST be further diluted before intravenous administration.',
    resultingConcentration:
        'Stock concentration 200 mg/mL. Final treatment concentration varies by patient weight, regimen and diluent.',
    furtherDilution:
        'Mandatory. Dilute in Sterile Water for Injection, 0.45% Sodium Chloride Injection, or D5W. In the exact cited label, the three-bag regimen is 150 mg/kg over 1 hour, then 50 mg/kg over 4 hours, then 100 mg/kg over 16 hours; volume is weight-based. The alternative two-bag regimen is labeled for patients ≥41 kg: 200 mg/kg in 1,000 mL over 4 hours, then 100 mg/kg in 500 mL over 16 hours. For patients ≥100 kg, capped label doses apply. Do not let the calculator choose the regimen.',
    allowedDiluents:
        'Sterile Water for Injection, 0.45% Sodium Chloride Injection, or D5W. The cited current label generally prefers 0.45% Sodium Chloride because of its osmolarity/free-water profile, while allowing the other two when clinically appropriate.',
    administration:
        'IV infusion only. The full course is either the exact label-defined 21-hour three-bag regimen or 20-hour two-bag regimen when the patient meets label criteria. Monitor hepatic/renal function and electrolytes; regimen continuation beyond the standard course is clinical/poison-center guided.',
    stability:
        'Diluted solution may be stored for up to 24 hours at room temperature. Discard unused vial contents; do not use a previously opened vial for IV administration.',
    incompatibilities:
        'Because the 200 mg/mL stock is hyperosmolar, never administer it IV undiluted. Final volume and osmolarity require special care in small children and fluid-restricted patients.',
    criticalLocks: [
      'Concentrate lock: 200 mg/mL stock MUST be diluted before IV use.',
      'Diluent lock: SWFI, 0.45% NaCl or D5W only for the cited pathway.',
      'Regimen lock: three-bag and two-bag regimens are distinct and must not be mixed.',
      'Population lock: cited two-bag regimen applies to patients ≥41 kg.',
      'Calculator lock: calculator converts the ordered acetylcysteine mg to stock mL only; it does not select regimen, dose or bag volume.',
    ],
    sourceLabel:
        'DailyMed · Acetylcysteine Injection 6 g/30 mL (200 mg/mL), current version published Feb 2026',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'acetylcysteine-iv-200mg-ml',
        label: 'Acetylcysteine IV stock · 200 mg/mL',
        unit: 'mg',
        concentration: 200,
        note:
            'Stock withdrawal only. Mandatory further dilution using the exact weight/regimen-specific label table.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Mannitol',
    population: 'General',
    formulation:
        'ICU Medical Mannitol Injection, USP 20% ready-to-use flexible containers: 50 g/250 mL or 100 g/500 mL = 0.2 g/mL (200 mg/mL).',
    reconstitution:
        'None. Supplied as a ready 20% IV solution. Inspect for crystals before administration.',
    resultingConcentration:
        '20% mannitol = 0.2 g/mL = 200 mg/mL.',
    furtherDilution:
        'No routine dilution is required for the cited 20% flexible-container product. Admixing other medications is not recommended.',
    allowedDiluents:
        'No diluent is required for the ready-to-use 20% product.',
    administration:
        'IV infusion, preferably through a large central vein. Use an administration set with a final in-line filter because mannitol crystals can form. Dose/rate depend on indication and patient status and are not selected by this preparation profile.',
    stability:
        'Store at 20–25°C and protect from freezing. If crystals are visible, keep the overwrap intact and warm with agitation in a dry-heat cabinet up to 70°C; do not use a water bath. Cool to body temperature or less, reinspect, and discard if all crystals do not dissolve. Single-dose container; discard unused portion.',
    incompatibilities:
        'Admixing with other drugs is not recommended. Do not administer simultaneously with blood products through the same set. Do not connect flexible containers in series.',
    criticalLocks: [
      'Concentration lock: cited product is 20% = 0.2 g/mL.',
      'Filter lock: use a final in-line filter.',
      'Crystal lock: inspect before use; exact current label allows dry-heat warming up to 70°C with overwrap intact, then cooling/reinspection.',
      'Container lock: do not use in series connection.',
      'Calculator lock: calculator converts a prescribed gram dose to mL only; it does not choose the therapeutic dose or infusion rate.',
    ],
    sourceLabel:
        'DailyMed · ICU Medical Mannitol Injection, USP 20% in 250 mL/500 mL flexible containers · revised Oct 2025',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'mannitol-20percent-0_2g-ml',
        label: 'Mannitol 20% · 0.2 g/mL',
        unit: 'g',
        concentration: 0.2,
        note:
            'Ready-to-use 20% product. Inspect for crystals and use a final in-line filter.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Ganciclovir',
    population: 'General',
    formulation:
        'Ganciclovir for Injection 500 mg lyophilized single-dose vial for IV use.',
    reconstitution:
        'Inject 10 mL preservative-free Sterile Water for Injection into the 500 mg vial and gently swirl until clear. Do NOT use bacteriostatic water containing parabens because precipitation may occur.',
    resultingConcentration:
        '500 mg + 10 mL SWFI → 50 mg/mL ganciclovir concentrate.',
    furtherDilution:
        'Mandatory. Withdraw the calculated dose volume from the 50 mg/mL concentrate and add to a compatible infusion fluid, typically 100 mL. Final infusion concentrations >10 mg/mL are not recommended.',
    allowedDiluents:
        '0.9% Sodium Chloride, D5W, Ringer’s Injection, or Lactated Ringer’s Injection for the final infusion.',
    administration:
        'IV infusion only over 1 hour at a constant rate. Never give by rapid IV injection, IM or SC. Ensure adequate hydration and adjust dose for renal function according to the clinical order.',
    stability:
        'Reconstituted 50 mg/mL vial solution is stable for 12 hours at room temperature (25°C); do not refrigerate or freeze the reconstituted vial. After further dilution, use within 24 hours and refrigerate at 2–8°C; do not freeze.',
    incompatibilities:
        'Do not use bacteriostatic water containing parabens for reconstitution. Do not exceed 10 mg/mL in the final infusion. Handle with disposable gloves because ganciclovir solutions are alkaline and the drug has mutagenic/carcinogenic properties.',
    criticalLocks: [
      'Reconstitution lock: 500 mg + 10 mL preservative-free SWFI = 50 mg/mL.',
      'Bacteriostatic-water lock: no paraben-containing bacteriostatic water.',
      'Final concentration lock: >10 mg/mL is not recommended.',
      'Rate lock: infusion over 1 hour; no rapid IV bolus.',
      'Handling lock: use appropriate hazardous-drug handling precautions.',
    ],
    sourceLabel:
        'DailyMed · Ganciclovir for Injection 500 mg lyophilized vial · current prescribing information',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'ganciclovir-500mg-vial-50mg-ml',
        label: 'Ganciclovir 500 mg + 10 mL SWFI · 50 mg/mL',
        unit: 'mg',
        concentration: 50,
        note:
            'Reconstituted concentrate only. Mandatory further dilution to a final concentration ≤10 mg/mL for 1-hour infusion.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Protamine',
    population: 'General',
    formulation:
        'Protamine Sulfate Injection, USP 50 mg/5 mL = 10 mg/mL single-dose vial.',
    reconstitution:
        'None. Supplied ready for injection at 10 mg/mL.',
    resultingConcentration:
        '10 mg/mL protamine sulfate.',
    furtherDilution:
        'No further dilution is required. If dilution is desired, D5W or 0.9% Sodium Chloride may be used; diluted solution should not be stored because it contains no preservative.',
    allowedDiluents:
        'Optional dilution: D5W or 0.9% Sodium Chloride Injection.',
    administration:
        'Very slow IV injection over 10 minutes. Do not exceed 50 mg during a 10-minute period. Dose is based on the amount/timing of heparin exposure and coagulation assessment; this preparation profile does not calculate the reversal dose.',
    stability:
        'Store at 20–25°C and do not freeze. If diluted, do not store the diluted solution.',
    incompatibilities:
        'Do not mix with other drugs without confirmed compatibility. Protamine is incompatible with certain antibiotics including several cephalosporins and penicillins.',
    criticalLocks: [
      'Concentration lock: 10 mg/mL.',
      'Rate lock: very slow IV over 10 minutes; maximum 50 mg in 10 minutes.',
      'Dilution lock: dilution is optional, not mandatory; if diluted, use D5W or NS and do not store.',
      'Dose lock: calculator converts an already prescribed mg dose to mL only; it does not estimate heparin-neutralization dose.',
    ],
    sourceLabel:
        'DailyMed · Protamine Sulfate Injection, USP 50 mg/5 mL (10 mg/mL) · current label',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'protamine-10mg-ml',
        label: 'Protamine sulfate · 10 mg/mL',
        unit: 'mg',
        concentration: 10,
        note:
            'Ready stock concentration. Administer very slowly; do not exceed 50 mg in 10 minutes.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Digoxin immune Fab',
    population: 'General',
    formulation:
        'DIGIFAB digoxin immune Fab (ovine) lyophilized single-dose vial containing 40 mg Fab protein.',
    reconstitution:
        'Reconstitute each 40 mg vial with 4 mL Sterile Water for Injection and gently mix.',
    resultingConcentration:
        'Approximately 10 mg/mL digoxin immune Fab after reconstitution.',
    furtherDilution:
        'Add the reconstituted product to an appropriate volume of 0.9% Sodium Chloride for infusion. For infants/small children requiring very small doses, the label permits adding 36 mL isotonic saline to one reconstituted vial to obtain 1 mg/mL.',
    allowedDiluents:
        'Sterile Water for Injection for vial reconstitution; 0.9% Sodium Chloride for final infusion or the special 1 mg/mL small-dose dilution.',
    administration:
        'Administer slowly by IV infusion over at least 30 minutes. If cardiac arrest is imminent, bolus injection may be used, with a higher expected incidence of infusion-related reactions.',
    stability:
        'Use promptly after reconstitution. If not used immediately, refrigerate at 2–8°C for up to 4 hours. Do not freeze.',
    incompatibilities:
        'Do not use cloudy, turbid or particulate-containing reconstituted solution. Do not infer compatibility with diluents other than those specified by the DIGIFAB label.',
    criticalLocks: [
      'Reconstitution lock: 40 mg + 4 mL SWFI ≈ 10 mg/mL.',
      'Infusion lock: standard administration is at least 30 minutes.',
      'Small-dose lock: optional 1 mg/mL dilution is specifically for very small pediatric doses.',
      'Stability lock: refrigerated reconstituted product maximum 4 hours.',
      'Dose lock: calculator must not determine the number of vials required for digoxin toxicity.',
    ],
    sourceLabel:
        'DailyMed · DIGIFAB digoxin immune Fab (ovine) 40 mg vial · current prescribing information',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'digifab-40mg-vial-10mg-ml',
        label: 'DIGIFAB 40 mg + 4 mL SWFI · ~10 mg/mL',
        unit: 'mg',
        concentration: 10,
        note:
            'Reconstituted vial concentration. Further dilute in 0.9% NaCl for standard infusion.',
      ),
    ],
  ),


  IvPreparationProfile(
    name: 'Colistimethate / Colistin',
    population: 'General',
    formulation:
        'Colistimethate for Injection, USP vial containing colistimethate sodium equivalent to 150 mg colistin base activity (CBA).',
    reconstitution:
        'Reconstitute the 150 mg CBA vial with 2 mL Sterile Water for Injection. Swirl gently to avoid frothing.',
    resultingConcentration:
        '75 mg/mL colistin base activity after reconstitution.',
    furtherDilution:
        'For the cited continuous-infusion pathway, the remaining half of the ordered total daily dose may be added to a compatible infusion solution. Final volume is determined by fluid/electrolyte requirements; the label does not establish one universal final concentration.',
    allowedDiluents:
        '0.9% Sodium Chloride, D5/0.9% NaCl, D5W, D5/0.45% NaCl, D5/0.225% NaCl, Lactated Ringer’s, or 10% invert sugar solution for the cited continuous-infusion pathway.',
    administration:
        'The current label describes direct intermittent IV administration over 3–5 minutes every 12 hours, or a continuous-infusion pathway in which half the daily dose is given over 3–5 minutes and the remainder begins 1–2 hours later over the next 22–23 hours. Dose selection must remain protocol- and renal-function-specific.',
    stability:
        'Final IV infusion solution should be freshly prepared and used for no longer than 24 hours. Store unreconstituted product at 20–25°C. The label separately describes reconstituted IM solution stability up to 7 days; do not transfer that 7-day statement to a final IV infusion bag.',
    incompatibilities:
        'There are insufficient data to recommend use with other drugs or with infusion solutions outside the label-listed fluids.',
    criticalLocks: [
      'Unit lock: this exact U.S. label expresses strength in mg colistin base activity (CBA); do not silently convert from international-unit products.',
      'Reconstitution lock: 150 mg CBA + 2 mL SWFI = 75 mg/mL CBA.',
      'Frothing lock: swirl gently; do not shake vigorously.',
      'IV stability lock: final infusion solution maximum 24 hours.',
      'Calculator lock: calculator converts an already prescribed mg CBA dose to mL only; it does not choose a renal-adjusted regimen.',
    ],
    sourceLabel:
        'DailyMed · Colistimethate for Injection, USP 150 mg colistin base activity · current 2026 labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'colistimethate-150mg-cba-75mg-ml',
        label: 'Colistimethate · 75 mg/mL CBA after reconstitution',
        unit: 'mg CBA',
        concentration: 75,
        note:
            'Exact U.S.-label CBA units only. Verify unit conventions before using non-U.S. products.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Tigecycline',
    population: 'General',
    formulation:
        'Tigecycline for Injection 50 mg single-dose lyophilized vial for IV infusion.',
    reconstitution:
        'Reconstitute each 50 mg vial with 5.3 mL of 0.9% Sodium Chloride, D5W, or Lactated Ringer’s to achieve 10 mg/mL. Gently swirl until dissolved. Because the vial contains overage, 5 mL of reconstituted solution is equivalent to 50 mg.',
    resultingConcentration:
        '10 mg/mL in the reconstituted vial; 5 mL contains the labeled 50 mg dose.',
    furtherDilution:
        'Mandatory. Withdraw 5 mL from each reconstituted vial and add to a 100 mL IV bag. For 100 mg, use two vials. Maximum final concentration in the IV bag is 1 mg/mL.',
    allowedDiluents:
        '0.9% Sodium Chloride, D5W, or Lactated Ringer’s for reconstitution and compatible IV infusion use.',
    administration:
        'IV infusion over approximately 30–60 minutes. If a shared line is used sequentially, flush before and after tigecycline with NS, D5W or Lactated Ringer’s.',
    stability:
        'At room temperature ≤25°C, total storage after reconstitution is up to 24 hours, including no more than 6 hours in the vial and the remaining time in the IV bag. If immediately transferred to an NS or D5W bag, it may be refrigerated at 2–8°C for up to 48 hours.',
    incompatibilities:
        'Do not administer simultaneously through the same Y-site with amphotericin B, amphotericin B lipid complex, diazepam, esomeprazole or omeprazole.',
    criticalLocks: [
      'Overage lock: reconstitute with 5.3 mL, but 5 mL of the 10 mg/mL solution represents the labeled 50 mg dose.',
      'Mandatory dilution lock: reconstituted solution must be transferred to an IV bag.',
      'Final concentration lock: do not exceed 1 mg/mL in the IV bag.',
      'Color lock: reconstituted solution should be yellow to orange; discard abnormal green/black discoloration.',
    ],
    sourceLabel:
        'DailyMed · Tigecycline for Injection 50 mg vial · current 2025–2026 labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'tigecycline-50mg-vial-10mg-ml',
        label: 'Tigecycline after 5.3 mL diluent · 10 mg/mL',
        unit: 'mg',
        concentration: 10,
        note:
            'Use 5 mL for the labeled 50 mg vial dose; mandatory further dilution into IV bag, max 1 mg/mL.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Amphotericin B liposomal',
    population: 'General',
    formulation:
        'AmBisome / amphotericin B liposome for injection 50 mg single-dose vial. This liposomal product is NOT interchangeable mg-for-mg with conventional amphotericin B.',
    reconstitution:
        'Aseptically add 12 mL preservative-free Sterile Water for Injection to each 50 mg vial to obtain 4 mg/mL. Do NOT use saline. Immediately shake the vial vigorously for 30 seconds until completely dispersed.',
    resultingConcentration:
        '4 mg/mL amphotericin B liposome concentrate after reconstitution.',
    furtherDilution:
        'Mandatory. Withdraw the required reconstituted volume, attach the supplied 5-micron filter, and inject through the filter into D5W. Final concentration should be 1–2 mg/mL; 0.2–0.5 mg/mL may be appropriate for infants/small children.',
    allowedDiluents:
        'Reconstitution: preservative-free SWFI only. Final dilution: D5W only.',
    administration:
        'IV infusion with controlled infusion device over approximately 120 minutes. In well-tolerated patients the infusion may be reduced to about 60 minutes. Flush an existing line with D5W before infusion or use a separate line.',
    stability:
        'Reconstituted concentrate may be refrigerated at 2–8°C for up to 24 hours; do not freeze. After dilution in D5W, infusion should commence within 6 hours. Discard partially used vials.',
    incompatibilities:
        'Do not reconstitute with saline, add saline to the reconstituted concentrate, or mix with other drugs. An in-line membrane filter may be used for administration only if mean pore diameter is not less than 1.0 micron; the supplied 5-micron filter is specifically used during transfer into D5W.',
    criticalLocks: [
      'Formulation lock: liposomal amphotericin B is not interchangeable mg-for-mg with conventional amphotericin B.',
      'Reconstitution lock: 50 mg + 12 mL SWFI = 4 mg/mL; no saline.',
      'Mixing lock: shake vigorously for 30 seconds after adding SWFI.',
      'Filter lock: use the supplied 5-micron filter when transferring into D5W.',
      'Final concentration lock: usually 1–2 mg/mL; pediatric small-volume option 0.2–0.5 mg/mL.',
    ],
    sourceLabel:
        'DailyMed · AmBisome / Amphotericin B Liposome for Injection 50 mg · current 2025 labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'ambisome-50mg-4mg-ml',
        label: 'Liposomal amphotericin B · 4 mg/mL after reconstitution',
        unit: 'mg',
        concentration: 4,
        note:
            'Mandatory 5-micron-filter transfer into D5W; do not apply conventional amphotericin B instructions.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Amphotericin B conventional',
    population: 'General',
    formulation:
        'XGen Amphotericin B for Injection, USP 50 mg lyophilized vial (conventional amphotericin B deoxycholate). NOT interchangeable mg-for-mg with liposomal amphotericin B.',
    reconstitution:
        'Rapidly add 10 mL Sterile Water for Injection without bacteriostatic agent directly to the 50 mg vial using a sterile needle of at least 20 gauge. Shake immediately until the colloidal solution is clear.',
    resultingConcentration:
        '5 mg/mL conventional amphotericin B concentrate.',
    furtherDilution:
        'Mandatory. Further dilute the 5 mg/mL concentrate 1:50 with D5W of pH >4.2 to a recommended final infusion concentration of 0.1 mg/mL.',
    allowedDiluents:
        'Reconstitution: preservative-free SWFI only. Final infusion: D5W with verified pH >4.2.',
    administration:
        'Slow IV infusion over approximately 2–6 hours depending on dose. The product label recommends a final concentration of 0.1 mg/mL.',
    stability:
        'Unreconstituted vial: refrigerate 2–8°C and protect from light. Reconstituted 5 mg/mL concentrate may be stored in the dark for 24 hours at room temperature or 1 week refrigerated. Final infusion solution (0.1 mg/mL or less) should be used promptly and protected from light.',
    incompatibilities:
        'Do not reconstitute with saline or bacteriostatic diluent; these may precipitate the drug. If an in-line membrane filter is used during administration, mean pore diameter must not be less than 1.0 micron.',
    criticalLocks: [
      'Formulation lock: conventional amphotericin B is not interchangeable mg-for-mg with liposomal amphotericin B.',
      'Reconstitution lock: 50 mg + 10 mL preservative-free SWFI = 5 mg/mL.',
      'Dextrose lock: final infusion uses D5W with pH >4.2; no saline.',
      'Final concentration lock: recommended 0.1 mg/mL.',
      'Rate lock: infuse slowly over approximately 2–6 hours.',
    ],
    sourceLabel:
        'DailyMed · XGen Amphotericin B for Injection, USP 50 mg conventional product · active ANDA label',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'amphotericin-b-conventional-5mg-ml',
        label: 'Conventional amphotericin B · 5 mg/mL concentrate',
        unit: 'mg',
        concentration: 5,
        note:
            'Mandatory 1:50 dilution in D5W pH >4.2 to recommended 0.1 mg/mL final infusion.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Dexamethasone',
    population: 'General',
    formulation:
        'Dexamethasone Sodium Phosphate Injection, USP ready solutions: 4 mg/mL and 10 mg/mL. Product excipients/preservatives vary by manufacturer; this profile follows the cited 4 mg/mL and 10 mg/mL label.',
    reconstitution:
        'None. Supplied as ready solution at either 4 mg/mL or 10 mg/mL.',
    resultingConcentration:
        'Stock concentration is product-specific: 4 mg/mL or 10 mg/mL dexamethasone phosphate equivalent.',
    furtherDilution:
        'Not mandatory for IV injection. The cited label permits direct IV administration from the vial or addition to Sodium Chloride Injection or Dextrose Injection for IV drip.',
    allowedDiluents:
        'Sodium Chloride Injection or Dextrose Injection for IV drip. In neonates, especially premature infants, IV/further-dilution solutions should be preservative-free.',
    administration:
        'IV injection or IV drip according to the clinical order. This preparation profile does not select corticosteroid dose or disease-specific schedule.',
    stability:
        'When mixed with an infusion solution, use within 24 hours under sterile handling because infusion solutions generally lack preservatives.',
    incompatibilities:
        'Verify the exact manufacturer’s preservative/excipient content before neonatal use; some dexamethasone sodium phosphate products contain benzyl alcohol or other preservatives.',
    criticalLocks: [
      'Concentration lock: distinguish 4 mg/mL from 10 mg/mL before calculation.',
      'Dilution lock: direct IV or NS/dextrose drip are separate permitted pathways; dilution is not automatically required.',
      'Neonatal lock: preservative-free solutions are required for IV/further dilution in neonates, especially premature infants.',
      'Manufacturer lock: preservative composition varies across products.',
    ],
    sourceLabel:
        'DailyMed · Dexamethasone Sodium Phosphate Injection, USP 4 mg/mL and 10 mg/mL · current labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'dexamethasone-4mg-ml',
        label: 'Dexamethasone sodium phosphate · 4 mg/mL',
        unit: 'mg',
        concentration: 4,
        note:
            'Verify manufacturer/preservative status, especially for neonatal use.',
      ),
      IvWithdrawalVariant(
        id: 'dexamethasone-10mg-ml',
        label: 'Dexamethasone sodium phosphate · 10 mg/mL',
        unit: 'mg',
        concentration: 10,
        note:
            'IV/IM strength; verify manufacturer/preservative status.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Hydrocortisone',
    population: 'General',
    formulation:
        'SOLU-CORTEF hydrocortisone sodium succinate ACT-O-VIAL single-dose presentations: 100 mg/2 mL, 250 mg/2 mL, 500 mg/4 mL and 1,000 mg/8 mL after activation/reconstitution.',
    reconstitution:
        'ACT-O-VIAL: press the plastic activator to force the built-in Water for Injection into the lower compartment, gently agitate until dissolved, remove tab, disinfect stopper, then withdraw through the stopper. The built-in diluent is preservative-free Water for Injection.',
    resultingConcentration:
        '100 mg/2 mL = 50 mg/mL. 250 mg/2 mL, 500 mg/4 mL and 1,000 mg/8 mL each yield 125 mg/mL.',
    furtherDilution:
        'Further dilution is not necessary for IV or IM injection. For IV infusion, the reconstituted ACT-O-VIAL solution may be added to D5W; if the patient is not sodium-restricted, isotonic saline or D5W in isotonic saline may also be used. Label examples use 100–1,000 mL depending on vial strength, with 50 mL permitted when small fluid volume is desired.',
    allowedDiluents:
        'Built-in WFI for ACT-O-VIAL reconstitution. For final infusion: D5W, isotonic saline, or D5W in isotonic saline when sodium restriction is not present.',
    administration:
        'IV injection, IV infusion or IM injection. For emergency IV use, the label describes administration over about 30 seconds for 100 mg and up to about 10 minutes for 500 mg or more.',
    stability:
        'Resulting infusion solutions prepared as directed are stable for at least 4 hours. Use aseptic technique and use immediately when possible; exact in-use storage remains governed by sterile-compounding conditions.',
    incompatibilities:
        'Because physical incompatibilities are possible, do not mix with unlisted solutions or medications. Keep the ACT-O-VIAL pathway distinct from the separate plain 100 mg vial, which has different reconstitution instructions.',
    criticalLocks: [
      'Presentation lock: this calculator profile applies to SOLU-CORTEF ACT-O-VIAL presentations, not the plain 100 mg vial.',
      'Concentration lock: 100 mg ACT-O-VIAL = 50 mg/mL; 250/500/1000 mg ACT-O-VIAL presentations = 125 mg/mL.',
      'Activation lock: use the built-in WFI by pressing the ACT-O-VIAL activator, then gently agitate.',
      'Rate lock: label examples range from ~30 seconds for 100 mg to ~10 minutes for 500 mg or more.',
    ],
    sourceLabel:
        'DailyMed · SOLU-CORTEF hydrocortisone sodium succinate ACT-O-VIAL · current Pfizer labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'solu-cortef-actovial-100mg',
        label: 'SOLU-CORTEF ACT-O-VIAL 100 mg/2 mL · 50 mg/mL',
        unit: 'mg',
        concentration: 50,
        note:
            'Exact 100 mg ACT-O-VIAL after activation with its built-in WFI.',
      ),
      IvWithdrawalVariant(
        id: 'solu-cortef-actovial-250-1000mg',
        label: 'SOLU-CORTEF ACT-O-VIAL 250/500/1000 mg · 125 mg/mL',
        unit: 'mg',
        concentration: 125,
        note:
            '250 mg/2 mL, 500 mg/4 mL and 1,000 mg/8 mL ACT-O-VIAL presentations.',
      ),
    ],
  ),


  IvPreparationProfile(
    name: 'Amoxicillin / Clavulanate IV',
    population: 'General',
    formulation:
        'Esteve Co-amoxiclav 1000 mg/200 mg powder for solution for injection/infusion, single-dose vial.',
    reconstitution:
        'For IV injection, dissolve the 1000 mg/200 mg vial in 20 mL Water for Injection. The resulting volume is approximately 20.9 mL. A transient pink colour may occur; the normal reconstituted solution is colourless to yellow.',
    resultingConcentration:
        'Combination product: the vial contains 1000 mg amoxicillin + 200 mg clavulanic acid in approximately 20.9 mL after reconstitution. Because this is a fixed-ratio combination and the displacement volume matters, no single calculator concentration is exposed.',
    furtherDilution:
        'For IV infusion, reconstitute as above and without delay transfer the reconstituted solution into 100 mL of compatible infusion fluid. Use the diluted infusion immediately.',
    allowedDiluents:
        'Reconstitution: Water for Injection. Final infusion: Water for Injection, 0.9% Sodium Chloride, or Ringer’s Solution for this exact Esteve product.',
    administration:
        'Slow IV injection over 3–4 minutes, or IV infusion over 30–40 minutes. Not for IM use. Children under 3 months should receive the drug by infusion only.',
    stability:
        'Administer within 20 minutes of reconstitution. After final dilution for infusion, use immediately. Vial is single-dose; discard unused solution.',
    incompatibilities:
        'Do not mix with blood products, proteinaceous fluids/protein hydrolysates, or IV lipid emulsions. If an aminoglycoside is also prescribed, do not mix the two antibiotics in the same syringe, IV container, or giving set.',
    criticalLocks: [
      'Product lock: this profile applies to the exact Esteve 1000 mg/200 mg vial.',
      'Combination lock: calculator remains manual because the prescribed dose contains two components and the reconstituted volume is approximately 20.9 mL.',
      'Time lock: administer within 20 minutes after reconstitution; diluted infusion is for immediate use.',
      'Route lock: IV only; patients under 3 months use infusion rather than IV injection.',
    ],
    sourceLabel:
        'emc SmPC · Esteve Co-amoxiclav 1000 mg/200 mg powder for solution for injection/infusion · revised Jul 2026',
  ),

  IvPreparationProfile(
    name: 'Teicoplanin',
    population: 'General',
    formulation:
        'Targocid 400 mg teicoplanin powder for solution for injection/infusion; exact Sanofi UK SmPC.',
    reconstitution:
        'Slowly add 3.14 mL Water for Injection to the 400 mg vial and rotate until all powder is dissolved, avoiding foam. If foam develops, allow the vial to stand for about 15 minutes. Use only a clear yellowish-to-dark-yellow solution.',
    resultingConcentration:
        'The SmPC states that the nominal 400 mg dose is contained in 3.0 mL of the reconstituted solution, corresponding to approximately 133.3 mg/mL for calculator withdrawal.',
    furtherDilution:
        'The reconstituted solution may be injected directly or further diluted for infusion in a compatible solution.',
    allowedDiluents:
        'Compatible infusion solutions include 0.9% Sodium Chloride, Ringer, Ringer-lactate, D5W, D10W, 0.18% NaCl/4% glucose, 0.45% NaCl/5% glucose, and the specified glucose-containing peritoneal dialysis solutions.',
    administration:
        'IV injection may be given as a bolus over 3–5 minutes or as a 30-minute infusion. Neonates should receive teicoplanin by infusion only.',
    stability:
        'Chemical/physical in-use stability of both reconstituted and diluted solution is demonstrated for 24 hours at 2–8°C. From a microbiological standpoint, use immediately when possible.',
    incompatibilities:
        'Teicoplanin and aminoglycoside solutions are incompatible when mixed directly and must not be mixed before injection. Other unlisted medicines should be administered separately unless compatibility is established.',
    criticalLocks: [
      'Product lock: exact Targocid 400 mg vial only.',
      'Reconstitution lock: add 3.14 mL WFI; nominal 400 mg dose occupies 3.0 mL after reconstitution.',
      'Foam lock: rotate rather than shake; if foam forms, stand about 15 minutes.',
      'Neonate lock: IV infusion only in neonates.',
      'Aminoglycoside lock: do not directly mix teicoplanin and aminoglycoside solutions.',
    ],
    sourceLabel:
        'emc SmPC · Sanofi Targocid 400 mg powder for solution for injection/infusion · updated Jan 2026',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'targocid-400mg-reconstituted',
        label: 'Targocid 400 mg reconstituted · ~133.3 mg/mL',
        unit: 'mg',
        concentration: 133.333333,
        note:
            'SmPC nominal dose volume is 400 mg in 3.0 mL after adding 3.14 mL WFI.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Sodium phosphate',
    population: 'General',
    formulation:
        'Glenmark Sodium Phosphates Injection, USP concentrated solution: phosphorus 3 mmol/mL plus sodium 4 mEq/mL.',
    reconstitution:
        'None. This is a concentrated ready solution, but it MUST be diluted and thoroughly mixed in a larger volume of IV fluid before administration.',
    resultingConcentration:
        'Stock provides 3 mmol phosphorus/mL and 4 mEq sodium/mL.',
    furtherDilution:
        'Mandatory. Using aseptic technique, add the required amount to a larger-volume IV fluid and mix thoroughly. The current label does not specify one universal final concentration or infusion rate; both depend on the individual patient and clinical order.',
    allowedDiluents:
        'The current label describes addition to other intravenous fluids rather than one universal diluent recipe. Use an exact compatible IV fluid per institutional/pharmacy compatibility policy.',
    administration:
        'IV administration only after dilution. Dose and rate depend on the individual patient. Monitor serum sodium, phosphorus and calcium to guide therapy.',
    stability:
        'Single-dose partial-fill vial; discard any unused portion. Use the prepared admixture according to institutional sterile-compounding policy because this label does not define one universal admixture beyond-use time.',
    incompatibilities:
        'Do not administer undiluted. Phosphate can precipitate with calcium-containing solutions; verify exact compatibility before combining with calcium or parenteral nutrition components.',
    criticalLocks: [
      'Concentrate lock: 3 mmol phosphorus/mL also delivers 4 mEq sodium/mL.',
      'Dilution lock: MUST be diluted before IV administration.',
      'Calculator lock: calculator converts ordered phosphorus mmol to stock mL only; it does not choose final concentration, fluid, dose, or infusion rate.',
      'Compatibility lock: verify calcium/phosphate compatibility before compounding.',
    ],
    sourceLabel:
        'DailyMed · Glenmark Sodium Phosphates Injection, USP 3 mmol phosphorus/mL + 4 mEq sodium/mL · updated Mar 2026',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'sodium-phosphate-3mmol-ml',
        label: 'Sodium phosphate concentrate · 3 mmol phosphorus/mL',
        unit: 'mmol phosphorus',
        concentration: 3,
        note:
            'Each 1 mL also contains 4 mEq sodium. Mandatory dilution; calculator does not select final concentration or rate.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Metoclopramide',
    population: 'General',
    formulation:
        'Metoclopramide Injection, USP preservative-free single-dose vial: 10 mg/2 mL = 5 mg/mL.',
    reconstitution:
        'None. Supplied as a ready solution at 5 mg/mL.',
    resultingConcentration:
        '5 mg/mL metoclopramide.',
    furtherDilution:
        'A 10 mg dose may be administered undiluted slowly. For doses greater than 10 mg, dilute the dose in 50 mL of a parenteral solution. Normal saline is the preferred diluent for the cited label.',
    allowedDiluents:
        '0.9% Sodium Chloride, D5W, D5/0.45% NaCl, Ringer’s Injection, or Lactated Ringer’s Injection for diluted administration.',
    administration:
        'Undiluted 10 mg IV should be administered slowly over 1–2 minutes. Diluted IV administration should be given over not less than 15 minutes.',
    stability:
        'Dilutions in NS, D5W, D5/0.45% NaCl, Ringer’s or LR may be stored up to 48 hours if protected from light; under normal light, use within 24 hours. Single-dose vial: discard unused portion.',
    incompatibilities:
        'Do not give rapidly because rapid IV administration can cause intense anxiety/restlessness followed by drowsiness. For frozen storage, the label specifically supports NS; metoclopramide is degraded when admixed and frozen in D5W.',
    criticalLocks: [
      'Stock lock: 5 mg/mL.',
      'Direct-IV lock: 10 mg undiluted over 1–2 minutes.',
      'Large-dose lock: doses >10 mg should be diluted in 50 mL and infused over at least 15 minutes.',
      'Stability lock: protected-from-light dilutions up to 48 hours; normal-light exposure up to 24 hours.',
    ],
    sourceLabel:
        'DailyMed · Avet Metoclopramide Injection, USP 5 mg/mL · updated Apr 2026',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'metoclopramide-5mg-ml',
        label: 'Metoclopramide · 5 mg/mL',
        unit: 'mg',
        concentration: 5,
        note:
            '10 mg may be given undiluted slowly; doses >10 mg require the separate 50 mL dilution pathway.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Methylprednisolone',
    population: 'General',
    formulation:
        'Pfizer SOLU-MEDROL preservative-free ACT-O-VIAL single-dose presentations: 40 mg/1 mL and 125 mg/2 mL after activation.',
    reconstitution:
        'ACT-O-VIAL: press down on the plastic activator to force the built-in diluent into the lower compartment, gently agitate until dissolved, remove the plastic tab, disinfect the stopper, then withdraw the dose.',
    resultingConcentration:
        '40 mg ACT-O-VIAL → 40 mg/mL. 125 mg ACT-O-VIAL → 62.5 mg/mL.',
    furtherDilution:
        'For IV/IM injection, use the reconstituted ACT-O-VIAL solution. For IV infusion, first prepare the injection solution, then add the indicated dose to D5W, isotonic saline, or D5W in isotonic saline.',
    allowedDiluents:
        'Built-in ACT-O-VIAL diluent for reconstitution. For further IV infusion dilution: D5W, isotonic saline, or D5W in isotonic saline.',
    administration:
        'IV or IM. IV is preferred for initial emergency use. The desired dose may be administered IV over several minutes; indication-specific high-dose regimens are separate clinical protocols and are not selected by this preparation profile.',
    stability:
        'Reconstituted solution that is not further diluted may be stored at 20–25°C and used within 48 hours. Further diluted product has demonstrated chemical/physical stability for 4 hours below 25°C or 24 hours at 2–8°C.',
    incompatibilities:
        'The 40 mg SOLU-MEDROL presentation contains lactose monohydrate produced from cow’s milk and is contraindicated in patients with known or suspected hypersensitivity to cow’s milk or its components. Keep preservative-free ACT-O-VIAL instructions separate from benzyl-alcohol-containing multidose presentations.',
    criticalLocks: [
      'Presentation lock: this profile applies only to preservative-free 40 mg and 125 mg ACT-O-VIAL products.',
      'Concentration lock: 40 mg/1 mL = 40 mg/mL; 125 mg/2 mL = 62.5 mg/mL.',
      'Activation lock: press activator, then gently agitate; do not substitute plain-vial reconstitution instructions.',
      '40 mg allergy lock: the 40 mg presentation contains lactose sourced from cow’s milk.',
      'Neonate lock: benzyl-alcohol-containing SOLU-MEDROL formulations should not be used in neonates.',
    ],
    sourceLabel:
        'DailyMed/FDA label · Pfizer SOLU-MEDROL preservative-free 40 mg and 125 mg ACT-O-VIAL · revised Jun 2026',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'solu-medrol-40mg-actovial',
        label: 'SOLU-MEDROL ACT-O-VIAL 40 mg/1 mL · 40 mg/mL',
        unit: 'mg',
        concentration: 40,
        note:
            'Preservative-free 40 mg ACT-O-VIAL; contains lactose from cow’s milk.',
      ),
      IvWithdrawalVariant(
        id: 'solu-medrol-125mg-actovial',
        label: 'SOLU-MEDROL ACT-O-VIAL 125 mg/2 mL · 62.5 mg/mL',
        unit: 'mg',
        concentration: 62.5,
        note:
            'Preservative-free 125 mg ACT-O-VIAL after activation.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Diazepam',
    population: 'General',
    formulation:
        'Civica Diazepam Injection, USP CIV single-dose prefilled syringe: 10 mg/2 mL = 5 mg/mL for IV or IM use.',
    reconstitution:
        'None. The cited prefilled syringe is supplied ready to use at 5 mg/mL.',
    resultingConcentration:
        '5 mg/mL diazepam.',
    furtherDilution:
        'Do NOT mix or dilute diazepam injection with other solutions or drugs in a syringe or infusion container. If direct IV administration is not feasible, inject slowly through infusion tubing as close as possible to the vein insertion site.',
    allowedDiluents:
        'None for this exact product pathway; the current label specifically says not to mix or dilute.',
    administration:
        'For IV use, inject slowly, taking at least 1 minute for each 5 mg (1 mL) for most indications. Do not use small veins such as those on the dorsum of the hand or wrist, and avoid intra-arterial injection or extravasation. Respiratory support/resuscitation equipment should be immediately available.',
    stability:
        'Store at 20–25°C and protect from light. Do not use if darker than slightly yellow or if precipitate is present. Single-dose prefilled syringe; discard unused portion.',
    incompatibilities:
        'Do not mix or dilute with other solutions or drugs. The cited formulation contains propylene glycol, alcohol and benzyl alcohol; benzyl alcohol has been associated with fatal gasping syndrome in premature infants.',
    criticalLocks: [
      'Stock lock: 5 mg/mL ready-to-use prefilled syringe.',
      'No-dilution lock: do not mix or dilute in a syringe or infusion container.',
      'Rate lock: most IV indications require at least 1 minute per 5 mg (1 mL).',
      'Vein lock: avoid small hand/wrist veins and avoid intra-arterial injection/extravasation.',
      'Premature-infant lock: formulation contains benzyl alcohol.',
    ],
    sourceLabel:
        'DailyMed · Civica Diazepam Injection, USP 5 mg/mL prefilled syringe · effective Aug 2026',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'diazepam-prefilled-5mg-ml',
        label: 'Diazepam prefilled syringe · 5 mg/mL',
        unit: 'mg',
        concentration: 5,
        note:
            'Ready to use. Do not mix or dilute; administer slowly by the labeled IV pathway.',
      ),
    ],
  ),


  IvPreparationProfile(
    name: 'Omeprazole',
    population: 'General',
    formulation:
        'Viatris Omeprazole 40 mg powder for solution for infusion; each vial contains omeprazole sodium equivalent to 40 mg omeprazole.',
    reconstitution:
        'Use the same 100 mL infusion bottle/bag that will be used for the final infusion. Withdraw approximately 5 mL of 0.9% Sodium Chloride or D5W from the 100 mL container, add it to the 40 mg vial, and mix thoroughly until dissolved. Draw the solution back into the syringe, return it to the same infusion container, then repeat the transfer steps to ensure all omeprazole is transferred.',
    resultingConcentration:
        'One 40 mg vial prepared in a 100 mL infusion container gives a final concentration of approximately 0.4 mg/mL.',
    furtherDilution:
        'The entire vial must be dissolved and immediately diluted to 100 mL using only the exact permitted infusion fluid and quantity. Do not substitute another solvent or final volume because omeprazole stability is pH-dependent.',
    allowedDiluents:
        '0.9% Sodium Chloride solution for infusion or 5% glucose (D5W) solution for infusion only.',
    administration:
        'IV infusion only for this exact product, administered over 20–30 minutes. The profile does not convert this infusion product into a direct-IV injection pathway.',
    stability:
        'Chemical and physical in-use stability is demonstrated for 12 hours at 25°C when prepared in 0.9% Sodium Chloride and for 6 hours at 25°C when prepared in 5% glucose. From a microbiological standpoint, use immediately after preparation when possible. Store unopened vials below 25°C and protect from light.',
    incompatibilities:
        'In the absence of compatibility studies, do not mix with other medicinal products. Use only 0.9% Sodium Chloride or 5% glucose and the specified preparation volumes.',
    criticalLocks: [
      'Product lock: this profile applies to the Viatris 40 mg infusion-only vial.',
      'Volume lock: dissolve the full vial using approximately 5 mL taken from the same 100 mL infusion container, then return all solution to that container.',
      'Diluent lock: only 0.9% Sodium Chloride or D5W; no other solvent or quantity.',
      'Route lock: infusion over 20–30 minutes; do not reinterpret as an IV-push product.',
      'Stability lock: 12 hours in NS versus 6 hours in D5W at 25°C.',
      'Calculator lock: profile remains manual because arbitrary dose-to-volume conversion could create a non-label bag preparation for doses above or below the exact 40 mg vial pathway.',
    ],
    sourceLabel:
        'emc SmPC · Viatris Omeprazole 40 mg powder for solution for infusion · current product page, last updated Jul 2024',
  ),


  IvPreparationProfile(
    name: 'Dopamine',
    population: 'NICU',
    formulation:
        'Hospira Dopamine Hydrochloride Injection concentrate 40 mg/mL (200 mg/5 mL or 400 mg/10 mL). ASHP Standardize 4 Safety pediatric continuous-infusion standards list 800, 1600 and 3200 mcg/mL.',
    reconstitution:
        'None. The stock is a 40 mg/mL (40,000 mcg/mL) concentrate and MUST be diluted before IV infusion.',
    resultingConcentration:
        'Stock 40 mg/mL. ASHP S4S pediatric standard final concentrations: 800 mcg/mL, 1600 mcg/mL, or 3200 mcg/mL.',
    furtherDilution:
        'Select the final concentration only from the NICU drug library/protocol. The current Hospira label explicitly supports 800 and 1600 mcg/mL preparation examples and permits higher concentrations such as 3200 mcg/mL for fluid restriction. Do not let the calculator select the final concentration or bag volume.',
    allowedDiluents:
        'Current Hospira label supports 0.9% Sodium Chloride, D5W, D5/0.9% NaCl, D5/0.45% NaCl, D5/Lactated Ringer’s, Sodium Lactate 1/6 molar, or Lactated Ringer’s.',
    administration:
        'Continuous IV infusion with an infusion pump, preferably through a large vein, with close hemodynamic and infusion-site monitoring. Dose and rate remain NICU clinical orders.',
    stability:
        'The current Hospira label states the listed diluted solutions are stable for 24 hours. Local sterile-compounding BUD may be shorter and should govern practice.',
    incompatibilities:
        'Do not administer through the same infusion set with sodium bicarbonate/other alkalinizing substances, blood, or iron salts. Do not add other medications to the dopamine infusion bag.',
    criticalLocks: [
      'Concentrate lock: 40 mg/mL stock MUST be diluted.',
      'Standard-concentration lock: ASHP S4S pediatric options are 800, 1600 and 3200 mcg/mL.',
      'Tiny-infant lock: ASHP notes some babies under 500 g may require a lower concentration; use the NICU drug library rather than forcing a standard.',
      'Calculator lock: calculator converts an already prescribed dopamine amount to stock mL only; it never chooses the final concentration or rate.',
    ],
    sourceLabel:
        'DailyMed · Hospira Dopamine Hydrochloride Injection 40 mg/mL · updated May 2026; ASHP Standardize 4 Safety Pediatric Continuous Infusion Standards · Sep 2025',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'nicu-dopamine-40mg-ml',
        label: 'Dopamine concentrate · 40 mg/mL',
        unit: 'mg',
        concentration: 40,
        note:
            'Stock withdrawal only. Final NICU concentration must be selected from the validated drug library; ASHP S4S standards are 800/1600/3200 mcg/mL.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Dobutamine',
    population: 'NICU',
    formulation:
        'Hikma Dobutamine Injection 250 mg/20 mL = 12.5 mg/mL single-dose vial. ASHP S4S pediatric continuous-infusion standards list 1000, 2000 and 4000 mcg/mL.',
    reconstitution:
        'None. The 12.5 mg/mL stock is a liquid concentrate and MUST be diluted before IV infusion.',
    resultingConcentration:
        'Stock 12.5 mg/mL = 12,500 mcg/mL. ASHP S4S pediatric standard final concentrations: 1000, 2000 or 4000 mcg/mL.',
    furtherDilution:
        'The current label requires dilution to a total volume of at least 50 mL. Choose the S4S final concentration only when it matches the NICU drug library and patient fluid plan. The manufacturer label describes 500, 1000 and 2000 mcg/mL tables and reports use up to 5000 mcg/mL; ASHP standardization narrows pediatric options to 1000/2000/4000 mcg/mL.',
    allowedDiluents:
        'The current label supports multiple fluids including D5W, D5/0.45% NaCl, D5/0.9% NaCl, D10W, Lactated Ringer’s, D5/LR, 0.9% Sodium Chloride and Sodium Lactate; use the exact NICU-approved diluent.',
    administration:
        'Continuous IV infusion with pump and hemodynamic monitoring. Dose/rate selection and titration remain NICU clinical decisions.',
    stability:
        'The current Hikma label states diluted IV solutions should be used within 24 hours.',
    incompatibilities:
        'Do not add to 5% Sodium Bicarbonate or other strongly alkaline solutions. Do not mix with other drugs in the same solution without established compatibility.',
    criticalLocks: [
      'Concentrate lock: 12.5 mg/mL stock MUST be diluted.',
      'Minimum-volume lock: current label requires a total diluted volume of at least 50 mL.',
      'Standard-concentration lock: ASHP S4S pediatric options are 1000, 2000 and 4000 mcg/mL.',
      'Calculator lock: calculator reports stock withdrawal only; it does not choose concentration, fluid volume or rate.',
    ],
    sourceLabel:
        'DailyMed · Hikma Dobutamine Injection 12.5 mg/mL · current active label; ASHP Standardize 4 Safety Pediatric Continuous Infusion Standards · Sep 2025',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'nicu-dobutamine-12_5mg-ml',
        label: 'Dobutamine stock · 12.5 mg/mL',
        unit: 'mg',
        concentration: 12.5,
        note:
            'Stock withdrawal only. Final NICU concentration is protocol-selected; ASHP S4S standards are 1000/2000/4000 mcg/mL.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Norepinephrine',
    population: 'NICU',
    formulation:
        'Norepinephrine Bitartrate Injection concentrate 4 mg/4 mL = 1 mg/mL. ASHP S4S pediatric continuous-infusion standards list 16, 32 and 64 mcg/mL.',
    reconstitution:
        'None. The stock is 1 mg/mL (1000 mcg/mL) and MUST be diluted before IV infusion.',
    resultingConcentration:
        'Stock 1000 mcg/mL. ASHP S4S pediatric standard final concentrations: 16, 32 or 64 mcg/mL.',
    furtherDilution:
        'Important label-vs-standard distinction: the conventional concentrate label prepares 4 mcg/mL, while ASHP S4S pediatric standards are 16/32/64 mcg/mL. Use an S4S concentration only through a validated NICU compounding/drug-library protocol; do not reuse the manufacturer’s 4 mcg/mL rate table or stability assumptions for the higher concentration.',
    allowedDiluents:
        'The cited concentrate label uses D5W or a sodium-chloride solution containing 5% dextrose and does not recommend saline alone. Any different NICU diluent must have its own validated compatibility/stability support.',
    administration:
        'Continuous IV infusion with pump, preferably through a large vein, with blood-pressure, rhythm and infusion-site monitoring. Clinical dose/rate selection is outside this preparation profile.',
    stability:
        'The manufacturer’s labeled 4 mcg/mL dilution may be stored up to 24 hours at room temperature protected from light. Do NOT automatically apply that 24-hour BUD to S4S 16/32/64 mcg/mL preparations; use the validated local compounding BUD.',
    incompatibilities:
        'Avoid iron salts, alkalis and oxidizing agents. Whole blood or plasma should be administered separately.',
    criticalLocks: [
      'Concentrate lock: 1 mg/mL stock MUST be diluted.',
      'Label-vs-S4S lock: manufacturer standard recipe is 4 mcg/mL, whereas ASHP pediatric standards are 16/32/64 mcg/mL.',
      'Tiny-infant lock: ASHP notes babies under 500 g may require a lower concentration.',
      'BUD lock: do not transfer the label’s 24-hour stability to higher S4S concentrations without validated data.',
    ],
    sourceLabel:
        'DailyMed · Norepinephrine Bitartrate Injection 1 mg/mL concentrate · current 2026 product labeling; ASHP Standardize 4 Safety Pediatric Continuous Infusion Standards · Sep 2025',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'nicu-norepinephrine-1mg-ml',
        label: 'Norepinephrine concentrate · 1 mg/mL',
        unit: 'mg',
        concentration: 1,
        note:
            'Stock withdrawal only. NICU final concentration requires a validated S4S/local protocol.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Fentanyl',
    population: 'NICU',
    formulation:
        'Hospira preservative-free Fentanyl Citrate Injection containing fentanyl 50 mcg/mL. ASHP S4S pediatric continuous-infusion standards list 10 and 50 mcg/mL.',
    reconstitution:
        'None. The exact single-dose product is ready at 50 mcg/mL.',
    resultingConcentration:
        'Stock 50 mcg/mL. ASHP S4S pediatric standard final concentrations: 10 or 50 mcg/mL.',
    furtherDilution:
        'The 50 mcg/mL S4S concentration can use the exact preservative-free stock undiluted. Preparing 10 mcg/mL requires a validated NICU sterile-compounding recipe and compatible diluent; the manufacturer stock label does not provide one universal continuous-infusion dilution recipe.',
    allowedDiluents:
        'No diluent is needed for the 50 mcg/mL standard. For 10 mcg/mL, use only the institution’s validated compatibility/stability recipe; do not guess a diluent from the stock label.',
    administration:
        'Continuous IV infusion through a controlled pump with continuous respiratory/cardiorespiratory monitoring and opioid reversal/resuscitation capability available. Dose and rate remain NICU orders.',
    stability:
        'The stock product is single-dose and preservative-free; discard unused vial/ampule contents and protect from light. Compounded 10 mcg/mL BUD must come from the validated local preparation reference.',
    incompatibilities:
        'Do not infer Y-site or admixture compatibility from the stock label; verify the exact NICU concentration and co-infused drug.',
    criticalLocks: [
      'Unit lock: fentanyl is handled in mcg, not mg.',
      'Standard-concentration lock: ASHP S4S pediatric options are 10 and 50 mcg/mL.',
      'Tiny-infant lock: ASHP notes some babies under 500 g may require a lower concentration.',
      'Dilution lock: 10 mcg/mL requires a validated compounding recipe; do not invent one from the 50 mcg/mL stock.',
    ],
    sourceLabel:
        'DailyMed · Hospira Fentanyl Citrate Injection 50 mcg/mL preservative-free · updated Aug 2026; ASHP Standardize 4 Safety Pediatric Continuous Infusion Standards · Sep 2025',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'nicu-fentanyl-50mcg-ml',
        label: 'Fentanyl preservative-free · 50 mcg/mL',
        unit: 'mcg',
        concentration: 50,
        note:
            'Exact stock concentration. 50 mcg/mL is also an ASHP pediatric standard; 10 mcg/mL requires validated NICU dilution.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Morphine',
    population: 'NICU',
    formulation:
        'Preservative-free morphine sulfate IV stock. Current U.S. single-dose products include 1 mg/mL and higher-strength vials; ASHP S4S pediatric continuous-infusion standards are 0.2, 0.5 and 1 mg/mL. This NICU profile calculator is locked to a 1 mg/mL preservative-free IV presentation.',
    reconstitution:
        'None for the cited 1 mg/mL preservative-free IV presentation.',
    resultingConcentration:
        'Stock 1 mg/mL. ASHP S4S pediatric standard final concentrations: 0.2, 0.5 or 1 mg/mL.',
    furtherDilution:
        'The 1 mg/mL standard may be used from an exact preservative-free 1 mg/mL IV product when locally approved. Preparing 0.2 or 0.5 mg/mL requires a validated NICU compounding recipe; final volume is not selected by this calculator.',
    allowedDiluents:
        'For diluted 0.2 or 0.5 mg/mL preparations, use the exact institution-approved compatibility/stability recipe. Do not infer a NICU diluent or BUD from neuraxial labeling.',
    administration:
        'Continuous IV infusion with controlled pump and close respiratory/hemodynamic monitoring. Dose/rate and weaning plan remain clinical orders.',
    stability:
        'Use the exact product storage for unopened stock; compounded 0.2/0.5 mg/mL preparations require the local validated BUD. Preservative-free single-dose containers are not multi-dose stock.',
    incompatibilities:
        'Do not infer admixture/Y-site compatibility; verify the exact final concentration and co-infused medication.',
    criticalLocks: [
      'Preservative lock: use preservative-free product for this neonatal continuous-infusion pathway.',
      'Standard-concentration lock: ASHP S4S pediatric options are 0.2, 0.5 and 1 mg/mL.',
      'Route lock: this profile is IV only; do not transfer neuraxial instructions into NICU infusion preparation.',
      'Calculator lock: calculator uses the exact 1 mg/mL stock only and does not choose the final concentration or rate.',
    ],
    sourceLabel:
        'DailyMed · preservative-free morphine sulfate 1 mg/mL IV presentation (current label); ASHP Standardize 4 Safety Pediatric Continuous Infusion Standards · Sep 2025',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'nicu-morphine-pf-1mg-ml',
        label: 'Preservative-free morphine · 1 mg/mL',
        unit: 'mg',
        concentration: 1,
        note:
            'Exact stock concentration used by this NICU profile. ASHP final standards: 0.2/0.5/1 mg/mL.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Midazolam',
    population: 'NICU',
    formulation:
        'Preservative-free Midazolam Injection single-dose vials at 1 mg/mL and 5 mg/mL. ASHP S4S pediatric continuous-infusion standards list 0.3, 1 and 5 mg/mL.',
    reconstitution:
        'None. Verify the exact preservative-free stock vial: 1 mg/mL or 5 mg/mL.',
    resultingConcentration:
        'Stock 1 or 5 mg/mL. ASHP S4S pediatric standard final concentrations: 0.3, 1 or 5 mg/mL.',
    furtherDilution:
        'The 1 and 5 mg/mL S4S standards can correspond to exact preservative-free stock strengths. The 0.3 mg/mL standard requires dilution. The current product label permits dilution of 1 or 5 mg/mL stock with 0.9% Sodium Chloride or D5W, but use the NICU’s validated recipe/BUD for the 0.3 mg/mL preparation.',
    allowedDiluents:
        '0.9% Sodium Chloride or D5W are supported by the current preservative-free midazolam label for dilution.',
    administration:
        'Continuous IV infusion via controlled pump with continuous respiratory and cardiac monitoring and immediate resuscitation capability. Dose/rate is individualized and not selected by this profile.',
    stability:
        'The current label documents 0.5 mg/mL compatibility for up to 24 hours in NS or D5W and 4 hours in Lactated Ringer’s; do NOT automatically transfer those BUDs to the S4S 0.3 mg/mL preparation. Use a validated local BUD.',
    incompatibilities:
        'Avoid intra-arterial administration and extravasation. Do not infer compatibility beyond the exact final concentration/diluent/co-infused medication.',
    criticalLocks: [
      'Preservative lock: this NICU profile uses preservative-free single-dose midazolam products.',
      'Concentration lock: distinguish 1 mg/mL from 5 mg/mL stock.',
      'Standard-concentration lock: ASHP S4S pediatric options are 0.3, 1 and 5 mg/mL.',
      'BUD lock: label stability at 0.5 mg/mL is not automatically the BUD for a 0.3 mg/mL NICU compound.',
    ],
    sourceLabel:
        'DailyMed · preservative-free Midazolam Injection 1 mg/mL and 5 mg/mL · revised Jun 2026; ASHP Standardize 4 Safety Pediatric Continuous Infusion Standards · Sep 2025',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'nicu-midazolam-pf-1mg-ml',
        label: 'Preservative-free midazolam · 1 mg/mL',
        unit: 'mg',
        concentration: 1,
        note:
            'Exact 1 mg/mL stock; also an ASHP pediatric standard concentration.',
      ),
      IvWithdrawalVariant(
        id: 'nicu-midazolam-pf-5mg-ml',
        label: 'Preservative-free midazolam · 5 mg/mL',
        unit: 'mg',
        concentration: 5,
        note:
            'Exact 5 mg/mL stock; also an ASHP pediatric standard concentration.',
      ),
    ],
  ),


  IvPreparationProfile(
    name: 'Insulin',
    population: 'NICU',
    formulation:
        'HUMULIN R regular insulin U-100 = 100 units/mL. ASHP Standardize 4 Safety pediatric continuous-infusion standards list 0.2 unit/mL and 1 unit/mL.',
    reconstitution:
        'None. HUMULIN R U-100 is supplied as a clear solution at 100 units/mL. For IV use it MUST be diluted in an infusion system containing 0.9% Sodium Chloride.',
    resultingConcentration:
        'Stock 100 units/mL. FDA labeling permits IV concentrations from 0.1–1 unit/mL; ASHP S4S pediatric standards are 0.2 unit/mL and 1 unit/mL.',
    furtherDilution:
        'Choose 0.2 or 1 unit/mL only when it matches the NICU drug library/protocol. Do not use the subcutaneous U-10/U-50 dilution instructions for IV infusion. The calculator converts ordered units to U-100 stock volume only.',
    allowedDiluents:
        '0.9% Sodium Chloride Injection for the labeled IV HUMULIN R pathway.',
    administration:
        'Continuous IV infusion under medical supervision with close blood-glucose and potassium monitoring. Dose, titration and target glucose remain NICU clinical orders.',
    stability:
        'The manufacturer label states IV infusion bags are stable refrigerated at 2–8°C for 48 hours and then may be used at room temperature for up to an additional 48 hours. Local sterile-compounding BUD may be shorter and should govern practice.',
    incompatibilities:
        'Do not substitute U-500 insulin or another insulin formulation for this U-100 IV pathway. Do not use a non-NS IV diluent unless supported by an exact product/local validation.',
    criticalLocks: [
      'Product lock: HUMULIN R U-100 = 100 units/mL; never confuse with U-500.',
      'IV standard lock: ASHP S4S pediatric standards are 0.2 and 1 unit/mL.',
      'Route lock: subcutaneous U-10/U-50 dilution instructions are NOT the IV preparation method.',
      'Monitoring lock: close glucose and potassium monitoring is mandatory.',
      'Calculator lock: calculator reports U-100 stock withdrawal only; it does not choose final concentration, dose or rate.',
    ],
    sourceLabel:
        'DailyMed · HUMULIN R U-100 IV labeling; ASHP Standardize 4 Safety Pediatric Continuous Infusion Standards · Sep 2025',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'nicu-humulin-r-u100',
        label: 'HUMULIN R U-100 · 100 units/mL',
        unit: 'units',
        concentration: 100,
        note:
            'Stock withdrawal only. Final NICU concentration should match the validated 0.2 or 1 unit/mL S4S/local standard.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Heparin',
    population: 'NICU',
    formulation:
        'Preservative-free Heparin Sodium Injection, USP 1,000 units/mL single-dose vial. ASHP S4S pediatric anticoagulation standards are 50 and 100 units/mL.',
    reconstitution:
        'None. Use a preservative-free neonatal/infant product. This exact stock pathway uses 1,000 units/mL preservative-free single-dose heparin.',
    resultingConcentration:
        'Stock 1,000 units/mL. ASHP S4S pediatric continuous anticoagulation concentrations: 50 units/mL or 100 units/mL.',
    furtherDilution:
        'Prepare the final 50 or 100 units/mL infusion only through the validated NICU anticoagulation compounding/drug-library protocol. The ASHP arterial-line maintenance standards (0.5 units/mL neonatal and 2 units/mL) are a DIFFERENT indication and are intentionally excluded from this therapeutic anticoagulation profile.',
    allowedDiluents:
        'Use the institution’s validated compatible infusion fluid for the selected therapeutic heparin standard. Do not infer an arterial-line flush recipe from this anticoagulation profile.',
    administration:
        'Continuous IV anticoagulation infusion with pump and protocol-directed laboratory monitoring. The heparin label notes infants may require higher weight-based maintenance rates than older children; this profile does not select dose or target.',
    stability:
        'Use exact product storage for stock and the validated sterile-compounding BUD for the 50/100 units/mL NICU infusion.',
    incompatibilities:
        'Do not use benzyl-alcohol-preserved heparin in neonates or infants. Treatment-strength heparin is not a catheter lock-flush product.',
    criticalLocks: [
      'Preservative lock: neonates and infants require preservative-free heparin.',
      'Stock lock: this calculator pathway uses preservative-free 1,000 units/mL stock.',
      'Therapy standard lock: 50 and 100 units/mL are ASHP pediatric anticoagulation standards.',
      'Indication lock: 0.5 units/mL neonatal arterial-line maintenance is a separate pathway and must not be confused with anticoagulation therapy.',
      'Calculator lock: calculator reports stock withdrawal only; anticoagulation dose/rate remains protocol-directed.',
    ],
    sourceLabel:
        'DailyMed · preservative-free Heparin Sodium Injection 1,000 units/mL / pediatric labeling; ASHP Standardize 4 Safety Pediatric Continuous Infusion Standards · Sep 2025',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'nicu-heparin-pf-1000units-ml',
        label: 'Preservative-free heparin · 1,000 units/mL',
        unit: 'units',
        concentration: 1000,
        note:
            'Neonatal/infant stock withdrawal only. Therapeutic S4S final concentrations are 50 or 100 units/mL.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Ampicillin',
    population: 'NICU',
    formulation:
        'Ampicillin for Injection, USP powder; exact cited product includes a 125 mg vial intended primarily for pediatric use.',
    reconstitution:
        'For direct IV use of the 125 mg pediatric vial, add 5 mL Sterile Water for Injection. The product label also permits bacteriostatic water generally, but bacteriostatic water MUST NOT be used when the product will be used in newborns.',
    resultingConcentration:
        'Manual exact-product profile. The direct-IV label specifies added volume but does not provide a calculator-safe post-displacement concentration for fractional neonatal withdrawal.',
    furtherDilution:
        'For IV drip, first reconstitute using the product direct-IV method, then further dilute using the exact product concentration/stability table and local NICU fluid plan. Do not repurpose the separate 250 mg/mL IM/withdrawal table as a neonatal direct-IV concentration.',
    allowedDiluents:
        'Direct-IV neonatal reconstitution: Sterile Water for Injection. Final IV-drip fluid must follow the exact product/local compatibility table.',
    administration:
        'The cited label administers 125 mg, 250 mg and 500 mg direct-IV preparations slowly over 3–5 minutes. Dose, interval and final drip volume remain neonatal clinical orders.',
    stability:
        'The cited label states IM/direct-IV solutions should be administered within 1 hour after preparation; IV-drip stability depends on diluent and concentration.',
    incompatibilities:
        'Do not physically mix ampicillin with aminoglycosides in the same syringe/bag without exact compatibility support. Use separate administration when required by compatibility guidance.',
    criticalLocks: [
      'Newborn diluent lock: no bacteriostatic water for newborns.',
      'Manual calculator lock: do not invent a post-displacement concentration for the 125 mg + 5 mL direct-IV pathway.',
      '250 mg/mL lock: do not transfer the separate concentrated vial table into neonatal direct-IV preparation.',
      'Rate lock: cited 125/250/500 mg direct-IV pathway is 3–5 minutes.',
    ],
    sourceLabel:
        'DailyMed · Ampicillin for Injection, USP pediatric 125 mg vial / direct-IV instructions · current label',
  ),

  IvPreparationProfile(
    name: 'Gentamicin',
    population: 'NICU',
    formulation:
        'Eugia Gentamicin Injection, USP (PEDIATRIC), preservative-free single-dose vial 20 mg/2 mL = 10 mg/mL.',
    reconstitution:
        'None. The pediatric single-dose vial is a ready 10 mg/mL solution, but it MUST be diluted for intravenous use.',
    resultingConcentration:
        'Stock concentration 10 mg/mL preservative-free gentamicin.',
    furtherDilution:
        'Dilute the prescribed dose in 0.9% Sodium Chloride or D5W. The label states infants and children should use a smaller diluent volume than adult 50–200 mL examples; select the final volume according to NICU fluid needs rather than forcing an adult volume.',
    allowedDiluents:
        '0.9% Sodium Chloride Injection or D5W for intermittent IV administration.',
    administration:
        'Intermittent IV infusion over 30 minutes to 2 hours. Dose/interval require neonatal age, renal function and therapeutic-drug-monitoring considerations and are not selected by this profile.',
    stability:
        'Store the unopened pediatric single-dose vial at 20–25°C and discard unused portion. Use the validated local sterile-compounding BUD for the diluted infusion.',
    incompatibilities:
        'Do not physically premix gentamicin with other drugs; administer separately. Verify shared-line/Y-site compatibility independently.',
    criticalLocks: [
      'Pediatric product lock: use the preservative-free 10 mg/mL pediatric single-dose vial, not a preserved 40 mg/mL adult/multidose vial.',
      'IV dilution lock: the 10 mg/mL pediatric vial MUST be diluted for IV use.',
      'Fluid lock: infant/neonatal diluent volume is individualized; do not copy adult 50–200 mL volumes.',
      'TDM lock: calculator never selects neonatal dose or interval.',
    ],
    sourceLabel:
        'DailyMed · Eugia Gentamicin Injection, USP (PEDIATRIC) preservative-free 10 mg/mL · current Jan 2026 label',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'nicu-gentamicin-pediatric-10mg-ml',
        label: 'Gentamicin pediatric preservative-free · 10 mg/mL',
        unit: 'mg',
        concentration: 10,
        note:
            'Stock withdrawal only. Mandatory further dilution for IV infusion; final volume is NICU-specific.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Amikacin',
    population: 'NICU',
    formulation:
        'Amikacin Sulfate Injection, USP solution equivalent to amikacin 250 mg/mL; current presentations include 500 mg/2 mL and 1 g/4 mL.',
    reconstitution:
        'None. Supplied as a ready stock solution at 250 mg/mL.',
    resultingConcentration:
        'Stock 250 mg/mL. Current labeling documents IV solution stability at final concentrations of 0.25–5 mg/mL in listed compatible fluids.',
    furtherDilution:
        'Pediatric fluid volume is individualized. Do NOT copy the adult 500 mg in 100/200 mL example into NICU practice. Use a sufficient validated volume to deliver the ordered neonatal dose over the required infusion time.',
    allowedDiluents:
        'Current label supports 0.9% Sodium Chloride, D5W, Lactated Ringer’s and additional listed balanced solutions.',
    administration:
        'Infants should receive the IV infusion over 1–2 hours. Dose/interval and serum-level monitoring remain NICU clinical decisions.',
    stability:
        'The current label states amikacin concentrations 0.25–5 mg/mL are stable for 24 hours at room temperature in the listed compatible IV fluids.',
    incompatibilities:
        'Do not physically premix amikacin with other drugs; administer separately.',
    criticalLocks: [
      'Stock lock: 250 mg/mL is the vial concentration, not the final neonatal infusion concentration.',
      'Infant time lock: infuse over 1–2 hours.',
      'Fluid lock: pediatric/neonatal volume is individualized; never copy adult 100/200 mL examples automatically.',
      'TDM lock: calculator does not select neonatal dose, interval or serum-level target.',
    ],
    sourceLabel:
        'DailyMed · Amikacin Sulfate Injection 250 mg/mL · updated Jul 2026 / infant IV administration section',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'nicu-amikacin-250mg-ml',
        label: 'Amikacin stock · 250 mg/mL',
        unit: 'mg',
        concentration: 250,
        note:
            'Stock withdrawal only. Infant infusion is 1–2 hours; final volume is individualized.',
      ),
    ],
  ),

  IvPreparationProfile(
    name: 'Cefotaxime',
    population: 'NICU',
    formulation:
        'Cefotaxime for Injection, USP conventional IV vials: 500 mg, 1 g or 2 g dry powder.',
    reconstitution:
        'For IV use, add at least 10 mL Sterile Water for Injection. Label table: 500 mg + 10 mL → about 50 mg/mL; 1 g + 10 mL → about 95 mg/mL; 2 g + 10 mL → about 180 mg/mL.',
    resultingConcentration:
        'Approximate post-reconstitution concentrations: 50 mg/mL (500 mg vial), 95 mg/mL (1 g vial), or 180 mg/mL (2 g vial).',
    furtherDilution:
        'For intermittent direct IV, the label supports 1 g or 2 g in 10 mL SWFI over 3–5 minutes. For NICU small doses, use the exact selected vial concentration and local validated volume/administration pathway; do not assume a universal final infusion concentration.',
    allowedDiluents:
        'Initial vial reconstitution: Sterile Water for Injection. Further infusion dilution may use label-supported fluids such as 0.9% Sodium Chloride or D5W when clinically required.',
    administration:
        'Direct intermittent IV administration should be over 3–5 minutes and never under 3 minutes. A longer infusion is a separate validated pathway.',
    stability:
        'Current label: IV 500 mg and 1 g vial solutions are chemically stable 24 hours at ≤22°C and 7 days refrigerated; the 2 g IV vial is 12 hours at ≤22°C and 7 days refrigerated. Local sterile-compounding BUD may be shorter.',
    incompatibilities:
        'Do not admix cefotaxime with aminoglycoside solutions. Avoid high-pH diluents such as sodium bicarbonate.',
    criticalLocks: [
      'Vial lock: 500 mg, 1 g and 2 g vials produce different post-reconstitution concentrations.',
      'Aminoglycoside lock: cefotaxime and gentamicin/amikacin must not be physically mixed in the same solution.',
      'Rate lock: direct IV administration must not be faster than 3 minutes.',
      'Calculator lock: use only the concentration corresponding to the exact vial selected.',
    ],
    sourceLabel:
        'DailyMed · Cefotaxime for Injection, USP · current conventional-vial preparation and compatibility labeling',
    withdrawalVariants: [
      IvWithdrawalVariant(
        id: 'nicu-cefotaxime-500mg-vial',
        label: 'Cefotaxime 500 mg IV vial + 10 mL SWFI',
        unit: 'mg',
        concentration: 50,
        note:
            'Approximate concentration 50 mg/mL; exact 500 mg vial pathway.',
      ),
      IvWithdrawalVariant(
        id: 'nicu-cefotaxime-1g-vial',
        label: 'Cefotaxime 1 g IV vial + 10 mL SWFI',
        unit: 'mg',
        concentration: 95,
        note:
            'Approximate concentration 95 mg/mL; exact 1 g vial pathway.',
      ),
      IvWithdrawalVariant(
        id: 'nicu-cefotaxime-2g-vial',
        label: 'Cefotaxime 2 g IV vial + 10 mL SWFI',
        unit: 'mg',
        concentration: 180,
        note:
            'Approximate concentration 180 mg/mL; exact 2 g vial pathway.',
      ),
    ],
  ),

];

IvPreparationProfile? findIvPreparationProfile(
  String name,
  String population,
) {
  for (final profile in ivPreparationProfiles) {
    if (profile.name == name && profile.population == population) {
      return profile;
    }
  }
  return null;
}
