import '../domain/product_analyzer_models.dart';

const analyzerIngredientRules = <AnalyzerIngredientRule>[
  AnalyzerIngredientRule(
    id: 'magnesium',
    name: 'Magnesium (elemental, supplemental)',
    unit: AnalyzerUnit.mg,
    amountBasis:
        'Enter ELEMENTAL magnesium from supplements/medications. Food magnesium is excluded from this UL.',
    thresholds: [
      AnalyzerThreshold(
        value: 350,
        label: 'U.S. adult supplemental-magnesium UL',
        scope: 'Supplements/medications only; clinician-directed treatment can differ.',
      ),
    ],
    interactions: {
      PatientMedicationFlag.tetracyclineOrQuinolone:
          'Magnesium can chelate tetracycline/quinolone antibiotics. Use the antibiotic at least 2 hours before or 4–6 hours after magnesium.',
      PatientMedicationFlag.renalImpairment:
          'Impaired renal function increases the risk of magnesium accumulation and toxicity. Review kidney function, total magnesium exposure and the clinical indication before supplementing.',
    },
  ),
  AnalyzerIngredientRule(
    id: 'calcium',
    name: 'Calcium (elemental)',
    unit: AnalyzerUnit.mg,
    amountBasis:
        'Enter ELEMENTAL calcium, not calcium carbonate/citrate salt weight.',
    thresholds: [],
    interactions: {
      PatientMedicationFlag.levothyroxine:
          'Keep calcium carbonate at least 4 hours from levothyroxine.',
      PatientMedicationFlag.tetracyclineOrQuinolone:
          'Calcium can reduce quinolone absorption; the NIH ODS reference uses 2 hours before or 2 hours after calcium for quinolones.',
      PatientMedicationFlag.dolutegravir:
          'Take dolutegravir 2 hours before or 6 hours after calcium supplements unless an exact product/food instruction provides a different approved strategy.',
    },
  ),
  AnalyzerIngredientRule(
    id: 'iron',
    name: 'Iron (elemental)',
    unit: AnalyzerUnit.mg,
    amountBasis: 'Enter ELEMENTAL iron, not ferrous salt mass.',
    thresholds: [
      AnalyzerThreshold(
        value: 45,
        label: 'U.S. adult iron UL',
        scope:
            'General intake reference; therapeutic iron replacement can exceed it under clinician supervision.',
      ),
    ],
    interactions: {
      PatientMedicationFlag.levothyroxine:
          'Avoid levothyroxine within 4 hours of iron.',
      PatientMedicationFlag.levodopa:
          'Iron supplements can reduce levodopa absorption and clinical effect. Review the levodopa product instructions and avoid casual coadministration.',
    },
  ),
  AnalyzerIngredientRule(
    id: 'zinc',
    name: 'Zinc (elemental)',
    unit: AnalyzerUnit.mg,
    amountBasis: 'Enter ELEMENTAL zinc.',
    thresholds: [
      AnalyzerThreshold(
        value: 40,
        label: 'U.S. adult zinc UL',
        scope:
            'General long-term intake reference; short clinician-directed therapeutic courses can differ.',
      ),
    ],
    interactions: {
      PatientMedicationFlag.tetracyclineOrQuinolone:
          'Take tetracycline/quinolone antibiotics at least 2 hours before or 4–6 hours after zinc.',
      PatientMedicationFlag.penicillamine:
          'Separate zinc and penicillamine by at least 1 hour because zinc can reduce penicillamine absorption and action.',
    },
  ),
  AnalyzerIngredientRule(
    id: 'vitamin-d',
    name: 'Vitamin D',
    unit: AnalyzerUnit.iu,
    amountBasis: 'Enter total vitamin D from all supplements in IU/day.',
    thresholds: [
      AnalyzerThreshold(
        value: 4000,
        label: 'Adult vitamin D UL',
        scope:
            'Routine total intake reference. Documented deficiency treatment can temporarily differ with monitoring.',
      ),
    ],
    interactions: {},
  ),
  AnalyzerIngredientRule(
    id: 'vitamin-b6',
    name: 'Vitamin B6',
    unit: AnalyzerUnit.mg,
    amountBasis:
        'Add pyridoxine/P5P from every B-complex, nerve-support and combination product.',
    thresholds: [
      AnalyzerThreshold(
        value: 12,
        label: 'EFSA 2023 adult B6 UL',
        scope: 'Neuropathy-based European reference.',
      ),
      AnalyzerThreshold(
        value: 100,
        label: 'U.S. FNB adult B6 UL',
        scope:
            'Older U.S. reference; showing both prevents false certainty from a single threshold.',
      ),
    ],
    interactions: {},
  ),
  AnalyzerIngredientRule(
    id: 'niacin',
    name: 'Niacin (supplemental)',
    unit: AnalyzerUnit.mg,
    amountBasis:
        'Use supplemental/fortified nicotinic acid or nicotinamide amount. Pharmacologic niacin therapy is a separate pathway.',
    thresholds: [
      AnalyzerThreshold(
        value: 35,
        label: 'U.S. adult supplemental-niacin UL',
        scope: 'Primarily based on flushing risk; prescription-like doses need monitoring.',
      ),
    ],
    interactions: {},
  ),
  AnalyzerIngredientRule(
    id: 'folic-acid',
    name: 'Folic acid (synthetic)',
    unit: AnalyzerUnit.mcg,
    amountBasis:
        'Enter synthetic folic acid from supplements/fortified foods, not natural food folate.',
    thresholds: [
      AnalyzerThreshold(
        value: 1000,
        label: 'Adult synthetic-folic-acid UL',
        scope: 'Does not include naturally occurring food folate.',
      ),
    ],
    interactions: {},
  ),
  AnalyzerIngredientRule(
    id: 'vitamin-a-preformed',
    name: 'Vitamin A (preformed)',
    unit: AnalyzerUnit.mcg,
    amountBasis:
        'Enter preformed vitamin A as mcg RAE from retinol/retinyl esters. Do not add food beta-carotene into this UL.',
    thresholds: [
      AnalyzerThreshold(
        value: 3000,
        label: 'Adult preformed-vitamin-A UL',
        scope: 'Applies to preformed vitamin A, not ordinary food carotenoids.',
      ),
    ],
    interactions: {
      PatientMedicationFlag.pregnantOrCouldBecomePregnant:
          'Excess preformed vitamin A can cause birth defects. If pregnant or pregnancy is possible, review the PRE-formed retinol/retinyl-ester amount across prenatal and other products; beta-carotene is a different exposure.',
    },
  ),
  AnalyzerIngredientRule(
    id: 'selenium',
    name: 'Selenium',
    unit: AnalyzerUnit.mcg,
    amountBasis: 'Enter total supplemental selenium.',
    thresholds: [
      AnalyzerThreshold(
        value: 400,
        label: 'U.S. adult selenium UL',
        scope: 'General adult total-intake reference.',
      ),
    ],
    interactions: {},
  ),
  AnalyzerIngredientRule(
    id: 'iodine',
    name: 'Iodine',
    unit: AnalyzerUnit.mcg,
    amountBasis: 'Add iodine from multivitamins, kelp/seaweed and thyroid-support products.',
    thresholds: [
      AnalyzerThreshold(
        value: 1100,
        label: 'U.S. adult iodine UL',
        scope: 'Thyroid disease may require substantially more individualized review.',
      ),
    ],
    interactions: {},
  ),
  AnalyzerIngredientRule(
    id: 'copper',
    name: 'Copper',
    unit: AnalyzerUnit.mg,
    amountBasis: 'Enter total supplemental copper.',
    thresholds: [
      AnalyzerThreshold(
        value: 10,
        label: 'U.S. adult copper UL',
        scope: 'General total-intake reference.',
      ),
    ],
    interactions: {},
  ),
  AnalyzerIngredientRule(
    id: 'vitamin-c',
    name: 'Vitamin C',
    unit: AnalyzerUnit.mg,
    amountBasis: 'Enter total vitamin C from supplements.',
    thresholds: [
      AnalyzerThreshold(
        value: 2000,
        label: 'Adult vitamin C UL',
        scope: 'High doses commonly cause GI intolerance.',
      ),
    ],
    interactions: {},
  ),
  AnalyzerIngredientRule(
    id: 'vitamin-k',
    name: 'Vitamin K',
    unit: AnalyzerUnit.mcg,
    amountBasis:
        'Use K1/K2 label amount. No UL is established, but warfarin consistency is clinically important.',
    thresholds: [],
    interactions: {
      PatientMedicationFlag.warfarin:
          'Do not eliminate vitamin K. Keep intake reasonably consistent and coordinate meaningful supplement changes with INR management.',
    },
  ),
  AnalyzerIngredientRule(
    id: 'biotin',
    name: 'Biotin',
    unit: AnalyzerUnit.mcg,
    amountBasis:
        'Add biotin from hair/nail products, B-complex and multivitamins.',
    thresholds: [],
    interactions: {
      PatientMedicationFlag.upcomingBiotinSensitiveLabs:
          'Biotin can distort susceptible immunoassays, including thyroid and some troponin assays. Inform the laboratory/clinician and follow assay-specific hold instructions.',
    },
  ),
  AnalyzerIngredientRule(
    id: 'vitamin-b12',
    name: 'Vitamin B12',
    unit: AnalyzerUnit.mcg,
    amountBasis:
        'Add B12 across multivitamins, B-complex and specialty products. No established UL.',
    thresholds: [],
    interactions: {},
  ),
  AnalyzerIngredientRule(
    id: 'coq10',
    name: 'CoQ10 / ubiquinone / ubiquinol',
    unit: AnalyzerUnit.mg,
    amountBasis:
        'Keep ubiquinone and ubiquinol product identity visible; do not assume equal pharmacokinetics.',
    thresholds: [],
    interactions: {},
  ),
];

AnalyzerIngredientRule analyzerRule(String id) {
  return analyzerIngredientRules.singleWhere((item) => item.id == id);
}

AnalyzerResult analyzeSupplementLines({
  required List<AnalyzerLine> lines,
  required Set<PatientMedicationFlag> medicationFlags,
}) {
  final byId = <String, List<AnalyzerLine>>{};
  for (final line in lines) {
    byId.putIfAbsent(line.ingredientId, () => <AnalyzerLine>[]).add(line);
  }

  final summaries = <AnalyzerIngredientSummary>[];
  final duplicates = <String>[];
  final thresholds = <String>[];
  final interactions = <String>[];
  final unknowns = <String>[];

  for (final entry in byId.entries) {
    final rule = analyzerRule(entry.key);
    var total = 0.0;
    var known = 0;
    var hidden = 0;
    final products = <String>{};

    for (final line in entry.value) {
      products.add(line.productName);
      if (line.amountKnown) {
        known += 1;
        final servings = line.servingsPerDay < 0 ? 0.0 : line.servingsPerDay;
        final amount = line.amountPerServing < 0 ? 0.0 : line.amountPerServing;
        total += amount * servings;
      } else {
        hidden += 1;
      }
    }

    summaries.add(
      AnalyzerIngredientSummary(
        ingredientId: entry.key,
        totalPerDay: total,
        knownLines: known,
        hiddenLines: hidden,
        productNames: products.toList()..sort(),
      ),
    );

    if (products.length > 1 || entry.value.length > 1) {
      duplicates.add(
        rule.name +
            ': appears in ' +
            entry.value.length.toString() +
            ' line(s) across ' +
            products.length.toString() +
            ' product(s). Known daily total = ' +
            _formatNumber(total) +
            ' ' +
            _unitLabel(rule.unit) +
            '.',
      );
    }

    if (hidden > 0) {
      unknowns.add(
        rule.name +
            ': ' +
            hidden.toString() +
            ' line(s) have hidden/pooled amounts, so the calculated daily total is incomplete.',
      );
    }

    for (final threshold in rule.thresholds) {
      if (total > threshold.value) {
        thresholds.add(
          rule.name +
              ': known total ' +
              _formatNumber(total) +
              ' ' +
              _unitLabel(rule.unit) +
              ' exceeds ' +
              threshold.label +
              ' (' +
              _formatNumber(threshold.value) +
              ' ' +
              _unitLabel(rule.unit) +
              '). ' +
              threshold.scope,
        );
      }
    }

    for (final flag in medicationFlags) {
      final message = rule.interactions[flag];
      if (message != null) {
        interactions.add(rule.name + ': ' + message);
      }
    }
  }

  summaries.sort(
    (a, b) => analyzerRule(a.ingredientId)
        .name
        .compareTo(analyzerRule(b.ingredientId).name),
  );

  return AnalyzerResult(
    summaries: summaries,
    duplicateMessages: duplicates,
    thresholdMessages: thresholds,
    interactionMessages: interactions,
    unknownAmountMessages: unknowns,
  );
}

String _unitLabel(AnalyzerUnit unit) => switch (unit) {
      AnalyzerUnit.mg => 'mg',
      AnalyzerUnit.mcg => 'mcg',
      AnalyzerUnit.iu => 'IU',
      AnalyzerUnit.cfu => 'CFU',
    };

String _formatNumber(double value) {
  if (value == value.roundToDouble()) return value.toInt().toString();
  if (value.abs() < 10) return value.toStringAsFixed(2);
  return value.toStringAsFixed(1);
}

const realProductProfiles = <RealProductProfile>[
  RealProductProfile(
    id: 'now-mag-glycinate',
    brand: 'NOW',
    name: 'Magnesium Glycinate Tablets',
    servingSize: '2 tablets',
    suggestedUse: '2 tablets 1–2 times daily with food.',
    storage: 'Store in a cool, dry place after opening.',
    ingredients: [
      RealProductIngredient(
        name: 'Magnesium (elemental)',
        amount: '200 mg per 2 tablets',
        note: 'From magnesium bisglycinate (Albion).',
      ),
    ],
    transparencyFlags: [
      'Elemental magnesium is declared directly — do not recalculate from tablet salt mass.',
      'Source form (magnesium bisglycinate) is stated.',
    ],
    clinicalLocks: [
      'At the label maximum of 2 servings/day, known supplemental magnesium = 400 mg/day, above the U.S. 350 mg/day supplemental UL. This is a review flag, not proof of toxicity.',
    ],
    sourceLabel: 'NOW official product page — verified 2026-10-01',
    analyzerLines: [
      AnalyzerLine(
        productName: 'NOW Magnesium Glycinate',
        ingredientId: 'magnesium',
        amountPerServing: 200,
        servingsPerDay: 1,
        amountKnown: true,
      ),
    ],
  ),
  RealProductProfile(
    id: 'now-mag-500',
    brand: 'NOW',
    name: 'Magnesium 500 mg Veg Capsules',
    servingSize: '1 capsule',
    suggestedUse: '1 capsule daily with food.',
    storage: 'Store in a cool, dry place after opening.',
    ingredients: [
      RealProductIngredient(
        name: 'Magnesium (elemental)',
        amount: '500 mg per capsule',
        note:
            'From magnesium oxide + magnesium bisglycinate + magnesium citrate; individual contribution of each form is not stated.',
      ),
    ],
    transparencyFlags: [
      'Elemental total is explicit.',
      'The contribution of each magnesium form is pooled, so form-specific dose cannot be reconstructed.',
    ],
    clinicalLocks: [
      '500 mg/day exceeds the U.S. adult supplemental-magnesium UL of 350 mg/day; assess indication, GI tolerance and kidney function.',
    ],
    sourceLabel: 'NOW official product page — verified 2026-10-01',
    analyzerLines: [
      AnalyzerLine(
        productName: 'NOW Magnesium 500 mg',
        ingredientId: 'magnesium',
        amountPerServing: 500,
        servingsPerDay: 1,
        amountKnown: true,
      ),
    ],
  ),
  RealProductProfile(
    id: 'now-coq10-softgel',
    brand: 'NOW',
    name: 'CoQ10 100 mg Softgels',
    servingSize: '1 softgel',
    suggestedUse: '1 softgel 1–2 times daily with food.',
    storage: 'Store in a cool, dry place after opening.',
    ingredients: [
      RealProductIngredient(
        name: 'Coenzyme Q10',
        amount: '100 mg per softgel',
        note: 'Ubiquinone / all-trans CoQ10 produced by fermentation.',
      ),
    ],
    transparencyFlags: [
      'CoQ10 amount and serving size are explicit.',
      'The product states the CoQ10 form as ubiquinone.',
    ],
    clinicalLocks: [
      'A product dose is not automatically an indication-specific dose; use the disease pathway first.',
    ],
    sourceLabel: 'NOW official product page — verified 2026-10-01',
    analyzerLines: [
      AnalyzerLine(
        productName: 'NOW CoQ10 100 mg',
        ingredientId: 'coq10',
        amountPerServing: 100,
        servingsPerDay: 1,
        amountKnown: true,
      ),
    ],
  ),
  RealProductProfile(
    id: 'now-coq10-liquid',
    brand: 'NOW',
    name: 'CoQ10 Liquid',
    servingSize: '1 teaspoon (5 mL)',
    suggestedUse: 'Shake well. Take 5 mL daily with a meal.',
    storage: 'Refrigerate after opening.',
    ingredients: [
      RealProductIngredient(
        name: 'Vitamin B6',
        amount: '7 mg',
        note: 'From P-5-P monohydrate.',
      ),
      RealProductIngredient(
        name: 'Vitamin B12',
        amount: '100 mcg',
        note: 'As cyanocobalamin.',
      ),
      RealProductIngredient(
        name: 'CoQ10',
        amount: '100 mg',
        note: 'Ubiquinone.',
      ),
      RealProductIngredient(
        name: 'D-ribose',
        amount: '10 mg',
        note: 'Daily Value not established.',
      ),
      RealProductIngredient(
        name: 'Pantethine',
        amount: '5 mg',
        note: 'Daily Value not established.',
      ),
    ],
    transparencyFlags: [
      'Multi-ingredient product: hidden duplication can occur with B-complex or separate B6/B12 products.',
      'Liquid has a product-specific storage requirement: refrigerate after opening.',
    ],
    clinicalLocks: [
      'The 7 mg B6 from this product must be added to B-complex, multivitamin and nerve-support products before comparing with B6 safety references.',
    ],
    sourceLabel: 'NOW official product page — verified 2026-10-01',
    analyzerLines: [
      AnalyzerLine(
        productName: 'NOW CoQ10 Liquid',
        ingredientId: 'vitamin-b6',
        amountPerServing: 7,
        servingsPerDay: 1,
        amountKnown: true,
      ),
      AnalyzerLine(
        productName: 'NOW CoQ10 Liquid',
        ingredientId: 'vitamin-b12',
        amountPerServing: 100,
        servingsPerDay: 1,
        amountKnown: true,
      ),
      AnalyzerLine(
        productName: 'NOW CoQ10 Liquid',
        ingredientId: 'coq10',
        amountPerServing: 100,
        servingsPerDay: 1,
        amountKnown: true,
      ),
    ],
  ),
  RealProductProfile(
    id: 'now-black-cohosh',
    brand: 'NOW',
    name: 'Black Cohosh Root 80 mg Veg Capsules',
    servingSize: '1 capsule',
    suggestedUse: '1 capsule twice daily: morning and evening.',
    storage: 'Store in a cool, dry place after opening.',
    ingredients: [
      RealProductIngredient(
        name: 'Black cohosh extract',
        amount: '80 mg',
        note:
            'Root extract standardized to 2.5% triterpene glycosides, calculated as 27-deoxyactein (2 mg).',
      ),
      RealProductIngredient(
        name: 'Licorice root',
        amount: '125 mg',
        note: 'Glycyrrhiza glabra root.',
      ),
      RealProductIngredient(
        name: 'Dong quai',
        amount: '125 mg',
        note: 'Organic Angelica sinensis rhizome/root.',
      ),
    ],
    transparencyFlags: [
      'This is NOT a single-ingredient black-cohosh product.',
      'All three active ingredient amounts are explicit, and the black-cohosh extract standardization is stated.',
    ],
    clinicalLocks: [
      'Counsel on the whole combination, not black cohosh alone. Licorice and dong quai add their own contraindications/interactions.',
      'Official label: adults only; not for pregnant/nursing women.',
    ],
    sourceLabel: 'NOW official product page — verified 2026-10-01',
    analyzerLines: [],
  ),
  RealProductProfile(
    id: 'now-probiotic10-25',
    brand: 'NOW',
    name: 'Probiotic-10 25 Billion',
    servingSize: '1 capsule',
    suggestedUse: '1 capsule 1–2 times daily between meals or on an empty stomach.',
    storage: 'Store in a cool, dry place to maintain potency.',
    ingredients: [
      RealProductIngredient(
        name: '10-strain probiotic blend',
        amount: '25 billion CFU total',
        note:
            'Includes named strain IDs such as La-14, Bl-04, Lp-115, Lc-11, Lr-32, Lpc-37, Bb-18, St-21, Ls-33 and Bl-05.',
      ),
    ],
    transparencyFlags: [
      'Strain identities are stated.',
      'Potency is stated through the Best By date.',
      'Per-strain CFU is NOT stated; 25 billion is the pooled total for all 10 strains.',
    ],
    clinicalLocks: [
      'Cannot use this label to prove that any one strain reaches an indication-specific CFU target.',
      'Do not divide 25 billion by 10 and assume equal CFU per strain.',
    ],
    sourceLabel: 'NOW official product page — verified 2026-10-01',
    analyzerLines: [],
  ),
];

const fdaLabelRules = <String>[
  'Supplement Facts must list serving size and the amount per serving of dietary ingredients.',
  'For minerals such as calcium, the Supplement Facts amount is the nutrient amount (for example elemental calcium), not the full salt weight such as calcium carbonate.',
  'A proprietary blend may state only the TOTAL blend weight while listing ingredients in descending order by weight; hidden individual amounts cannot be reconstructed from the label.',
  '%DV is a labeling reference and is NOT the patient’s individualized RDA/AI, supplement gap or treatment dose.',
  'A company selling a dietary supplement is responsible for safety/label compliance; FDA does not pre-approve supplements for safety and effectiveness before marketing.',
];
