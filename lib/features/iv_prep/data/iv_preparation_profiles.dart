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
