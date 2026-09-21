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
