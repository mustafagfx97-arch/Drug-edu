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
        'Stability depends on the exact manufacturer/product and diluent. Use the BUD from the dispensed product label/local sterile-compounding policy, not a generic app default.',
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
        'Meropenem stability is concentration-, diluent- and temperature-sensitive. Use the exact current product label/local sterile-preparation BUD.',
    incompatibilities:
        'Do not mix with other drugs unless compatibility is established.',
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
        'Use the product vial strength and full reconstituted contents; do not calculate component concentration from the combo name alone.',
    furtherDilution:
        'The cited label recommends further dilution of the reconstituted dose in 50–150 mL of a compatible IV solution.',
    allowedDiluents:
        'Reconstitution options in the cited label include 0.9% sodium chloride, Sterile Water for Injection and D5W; additional bacteriostatic options have product-specific restrictions.',
    administration:
        'The cited conventional label administers the further-diluted dose by IV infusion over at least 30 minutes.',
    stability:
        'Use current manufacturer and institutional sterile-compounding BUD; do not transfer stability between premix and powder products.',
    incompatibilities:
        'Compatibility with aminoglycosides and other solutions is product/concentration specific; do not mix in the same container without validated compatibility.',
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
        'Ceftriaxone powder for injection; this profile summarizes a conventional IV vial/piggyback label.',
    reconstitution:
        'For the cited 1 g and 2 g IV piggyback-bottle preparation, add 10 mL or 20 mL compatible diluent, respectively.',
    resultingConcentration:
        'Approximately 100 mg/mL after the cited reconstitution.',
    furtherDilution:
        'The cited label then further dilutes to a 50 mL or 100 mL IV volume with an appropriate calcium-free IV diluent.',
    allowedDiluents:
        'Use calcium-free diluents supported by the exact label. Do not use calcium-containing diluents such as Ringer’s/Hartmann’s for reconstitution or further dilution.',
    administration:
        'Use the infusion method/duration from the exact product and patient protocol.',
    stability:
        'Use the exact product label and local BUD; do not transfer stability across manufacturers or diluents.',
    incompatibilities:
        'Calcium-containing IV solutions can precipitate with ceftriaxone.',
    criticalLocks: [
      'Neonatal lock: ceftriaxone is contraindicated in premature neonates up to postmenstrual age 41 weeks and in hyperbilirubinemic neonates.',
      'Neonatal calcium lock: contraindicated in neonates ≤28 days who require or are expected to require calcium-containing IV solutions, including parenteral nutrition.',
    ],
    sourceLabel:
        'DailyMed · Ceftriaxone for Injection · IV preparation and neonatal contraindication labeling',
    withdrawalUnit: 'mg',
    withdrawalConcentration: 100,
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
