import '../domain/specialty_toolkit_models.dart';

const specialtyIngredients = <SpecialtyIngredient>[
  SpecialtyIngredient(
    id: 'lactase',
    name: 'Lactase enzyme',
    category: 'GI enzyme',
    keyRule:
        'Use lactase for lactose-containing foods, not for generic bloating. Timing with the first bite/sip matters more than taking it far before the meal.',
    uses: [
      SpecialtyUse(
        id: 'lactose-intolerance',
        indication: 'Lactose intolerance symptom prevention',
        population: 'Adults and older children using an age-appropriate product',
        dose:
            'Product-specific enzyme units. Example: LACTAID Fast Act provides 9,000 FCC lactase units per caplet.',
        frequency:
            'Take the labeled serving with the FIRST bite or sip of dairy. If dairy intake continues beyond 30–45 minutes, repeat one labeled serving.',
        duration: 'Use with each lactose-containing eating episode as needed.',
        exactUse:
            'Take at the start of dairy exposure, not long before and not after symptoms have already developed. Match serving size to the exact product strength.',
        evidence: SpecialtyEvidence.establishedUse,
        caveat:
            'Lactase does not treat milk-protein allergy. Persistent symptoms despite appropriate lactase use should trigger reassessment of diagnosis and lactose load.',
        sourceLabel: 'NIDDK lactose intolerance + LACTAID official label',
      ),
    ],
    safety: [
      'Do not confuse lactose intolerance with cow-milk-protein allergy.',
      'Children, pregnancy and breastfeeding should follow product/clinician guidance rather than adult assumptions.',
      'Lactose-free dairy can be used instead of enzyme supplementation when preferred.',
    ],
  ),
  SpecialtyIngredient(
    id: 'alpha-galactosidase',
    name: 'Alpha-galactosidase',
    category: 'GI enzyme',
    keyRule:
        'Useful for gas from fermentable complex carbohydrates such as beans, grains and cruciferous vegetables; it is not a general IBS treatment.',
    uses: [
      SpecialtyUse(
        id: 'gas-food',
        indication: 'Meal-related gas/bloating from complex carbohydrates',
        population: 'Adults / product-labeled adolescents',
        dose:
            'Product example: beano tablets provide 800 GALU per 2 tablets. A controlled bean-meal study found benefit with 1,200 GalU.',
        frequency:
            'Take immediately before the first bite. The current beano label also allows use immediately after the meal, up to 30 minutes after the first bite.',
        duration: 'Use with relevant gas-producing meals as needed.',
        exactUse:
            'Swallow or chew the labeled dose at the meal. Do not cook the enzyme into food because heat can inactivate it.',
        evidence: SpecialtyEvidence.moderate,
        caveat:
            'Match the enzyme unit (GALU) and product serving; tablet counts differ across brands and strengths.',
        sourceLabel: 'Beano official label + randomized alpha-galactosidase trial',
      ),
    ],
    safety: [
      'Galactosemia requires clinician review before use.',
      'Product example is labeled for adults and children 12 years and older; younger children require pediatric advice.',
      'Store away from heat because enzyme activity can be lost.',
    ],
  ),
  SpecialtyIngredient(
    id: 'dao',
    name: 'Diamine oxidase (DAO)',
    category: 'Histamine / GI enzyme',
    keyRule:
        'DAO is an emerging, product-specific approach. Histamine intolerance is difficult to diagnose reliably, and low serum DAO is not sufficiently specific by itself.',
    uses: [
      SpecialtyUse(
        id: 'suspected-hit',
        indication: 'Suspected histamine intolerance — adjunctive trial',
        population:
            'Adults with a carefully evaluated food-related symptom pattern after other diagnoses are considered',
        dose:
            'NO universal dose encoded. Commercial products use different enzyme sources, activity units and formulations.',
        frequency:
            'The 2019 pilot study instructed participants to take DAO capsules BEFORE meals.',
        duration:
            'Pilot evidence used 4 weeks; a newer large randomized protocol is evaluating longer strategies.',
        exactUse:
            'If used, take only according to the exact product activity/label before histamine-containing meals and set a planned reassessment point.',
        evidence: SpecialtyEvidence.limited,
        caveat:
            'Do not diagnose histamine intolerance from symptoms or serum DAO alone. A 2023 placebo-controlled challenge excluded suspected HIT in most participants.',
        sourceLabel: 'PubMed DAO pilot 2019 + placebo-controlled HIT challenge 2023',
      ),
    ],
    safety: [
      'Do not substitute DAO for evaluation of urticaria, anaphylaxis, mast-cell disease, migraine, GI disease or food allergy.',
      'Porcine-derived DAO may matter for dietary/religious preferences; plant-derived products are not automatically clinically equivalent.',
      'Do not convert mg of enzyme material to “activity” without validated product data.',
    ],
  ),
  SpecialtyIngredient(
    id: 'peppermint',
    name: 'Enteric-coated peppermint oil',
    category: 'GI / IBS',
    keyRule:
        'Evidence is for enteric-coated peppermint oil in IBS, not peppermint tea or arbitrary essential-oil drops.',
    uses: [
      SpecialtyUse(
        id: 'ibs-adult',
        indication: 'Short-term IBS symptom relief',
        population: 'Adults with established IBS',
        dose:
            'A 2021 randomized trial used enteric-coated peppermint oil 180 mg three times daily.',
        frequency: 'Three times daily in that trial.',
        duration: '6 weeks in the 2021 trial; long-term efficacy is not established.',
        exactUse:
            'Swallow enteric-coated capsules whole. Older trials often administered 15–30 minutes before meals; follow the exact delayed-release product label.',
        evidence: SpecialtyEvidence.moderate,
        caveat:
            'Avoid or use caution with significant GERD/hiatal hernia because peppermint can worsen reflux. Do not chew enteric-coated capsules.',
        sourceLabel: 'NCCIH IBS + Am J Gastroenterol randomized trial 2021',
      ),
    ],
    safety: [
      'Common adverse effects include heartburn/reflux, belching, nausea and abdominal discomfort.',
      'Do not give concentrated peppermint oil directly to the face/nose of infants or young children.',
      'Evidence supports short-term use; do not promise durable disease modification.',
    ],
  ),
  SpecialtyIngredient(
    id: 'milk-thistle',
    name: 'Milk thistle / silymarin',
    category: 'Liver',
    keyRule:
        'Do not label silymarin as proven “liver detox.” High-quality evidence has not established benefit for hepatitis C, NASH/MASLD or other chronic liver diseases.',
    uses: [
      SpecialtyUse(
        id: 'liver-support',
        indication: 'Commercial “liver support” use',
        population: 'Adults considering silymarin for chronic liver disease',
        dose:
            'No evidence-based universal therapeutic dose should be auto-recommended for chronic liver disease.',
        frequency: 'Product-specific only if a clinician elects to try it.',
        duration: 'No validated routine duration.',
        exactUse:
            'If used despite limited evidence, verify standardized extract content and avoid replacing guideline-directed liver care.',
        evidence: SpecialtyEvidence.againstRoutineUse,
        caveat:
            'NCCIH reports conflicting/insufficient evidence; rigorous trials in hepatitis C and NASH did not show meaningful benefit.',
        sourceLabel: 'NCCIH Milk Thistle 2025',
      ),
    ],
    safety: [
      'GI effects include bloating, nausea and gas.',
      'Allergic reactions can occur in people sensitive to ragweed/daisy-family plants.',
      'Commercial product quality and stated silymarin content can vary substantially.',
    ],
  ),
  SpecialtyIngredient(
    id: 'berberine',
    name: 'Berberine',
    category: 'Metabolic',
    keyRule:
        'Berberine has preliminary metabolic evidence but is not a substitute for diabetes, lipid or weight-management therapy.',
    uses: [
      SpecialtyUse(
        id: 'metabolic-adjunct',
        indication: 'Metabolic / glucose-lipid adjunct',
        population: 'Adults after medication and pregnancy review',
        dose:
            'Clinical studies have used about 200–1,000 mg per dose, two to three times daily.',
        frequency: 'Two to three times daily in studied clinical settings.',
        duration:
            'Study durations vary. Weight effects in reviews were seen mainly with >1 g/day for >8 weeks, but evidence quality is limited.',
        exactUse:
            'Take only after reviewing diabetes medications, transplant drugs and GI tolerance. Set a measurable goal and stop if no benefit.',
        evidence: SpecialtyEvidence.limited,
        caveat:
            'Do not present berberine as “natural Ozempic.” Evidence is heterogeneous and many trials are small or high risk of bias.',
        sourceLabel: 'NCCIH Berberine 2026',
      ),
    ],
    safety: [
      'Common effects: nausea, abdominal pain, bloating, constipation or diarrhea.',
      'Avoid during pregnancy and breastfeeding and do not give to infants because of bilirubin/kernicterus risk.',
      'Can interact with medicines, including cyclosporine; medication review is mandatory.',
    ],
  ),
  SpecialtyIngredient(
    id: 'ala',
    name: 'Alpha-lipoic acid (ALA)',
    category: 'Neuropathy / metabolic',
    keyRule:
        'ALA is not a proven glucose-lowering supplement. Neuropathy evidence is mixed, although some reviews suggest pain benefit.',
    uses: [
      SpecialtyUse(
        id: 'diabetic-neuropathy',
        indication: 'Diabetic neuropathy symptom adjunct',
        population: 'Adults with diabetic peripheral neuropathy',
        dose:
            '600 mg/day oral has been used in major long-term studies and is a common evidence-linked dose.',
        frequency: 'Once daily in the referenced long-term study.',
        duration:
            'Evidence includes studies from weeks to years; reassess pain/function rather than continuing automatically.',
        exactUse:
            'Use only as an adjunct to diabetes and neuropathy care, with a predefined symptom goal.',
        evidence: SpecialtyEvidence.conflicting,
        caveat:
            'NCCIH notes inconsistent neuropathy findings and no demonstrated benefit for glucose, lipids or diabetic kidney disease.',
        sourceLabel: 'NCCIH Diabetes and Dietary Supplements',
      ),
    ],
    safety: [
      'Reported adverse effects include headache, heartburn, nausea and vomiting.',
      'Do not use ALA as a replacement for glycemic control or neuropathic-pain treatment.',
    ],
  ),
  SpecialtyIngredient(
    id: 'nac',
    name: 'N-acetylcysteine (NAC)',
    category: 'Liver / antioxidant',
    keyRule:
        'NAC is a medicine in acetaminophen toxicity and a supplement in other contexts; retail “liver detox” use is not equivalent to emergency medical treatment.',
    uses: [
      SpecialtyUse(
        id: 'masld-trial',
        indication: 'MASLD research use — not routine therapy',
        population: 'Adults with MASLD in research settings',
        dose:
            'A 2025 randomized trial used 600 mg three times daily (1,800 mg/day) for 8 weeks.',
        frequency: 'Three times daily in that trial.',
        duration: '8 weeks in the cited trial.',
        exactUse:
            'This trial dose is shown for evidence interpretation only, not as a routine liver prescription.',
        evidence: SpecialtyEvidence.againstRoutineUse,
        caveat:
            'The trial did NOT significantly improve steatosis grade, AST or ALT versus placebo. Do not market this as proven MASLD treatment.',
        sourceLabel: 'Randomized MASLD NAC trial 2025',
      ),
    ],
    safety: [
      'Acetaminophen overdose requires urgent medical NAC protocol; do not use retail supplement dosing.',
      'GI upset can occur. Medication/disease context should guide prolonged use.',
    ],
  ),
  SpecialtyIngredient(
    id: 'curcumin',
    name: 'Turmeric / curcumin',
    category: 'Herbal / metabolic / inflammatory',
    keyRule:
        'Curcumin is not automatically “liver protective.” Enhanced-bioavailability formulations have been linked to liver injury.',
    uses: [
      SpecialtyUse(
        id: 'general',
        indication: 'General supplement use',
        population: 'Adults considering turmeric/curcumin supplements',
        dose:
            'No single universal disease-treatment dose is supported across indications.',
        frequency: 'Product/indication specific.',
        duration:
            'Conventional formulations appear generally safe for about 2–3 months at recommended amounts; longer use requires stronger justification.',
        exactUse:
            'Review formulation carefully, especially piperine or other bioavailability enhancers, and stop promptly if liver-injury symptoms develop.',
        evidence: SpecialtyEvidence.insufficient,
        caveat:
            'Do not recommend specifically for “liver detox.” NCCIH notes liver injury reports with some highly bioavailable products.',
        sourceLabel: 'NCCIH Turmeric 2026',
      ),
    ],
    safety: [
      'Stop and seek assessment for dark urine, jaundice, marked fatigue, nausea or poor appetite suggestive of liver injury.',
      'Supplement-level use in pregnancy may be unsafe; food-level turmeric is a separate exposure.',
      'GI adverse effects include reflux, nausea, diarrhea or constipation.',
    ],
  ),
];

SpecialtyIngredient specialtyIngredient(String id) {
  return specialtyIngredients.singleWhere((item) => item.id == id);
}

const specialtyProductTechniques = <SpecialtyProductTechnique>[
  SpecialtyProductTechnique(
    name: 'LACTAID Fast Act Caplet',
    ingredient: 'Lactase enzyme',
    amount: '9,000 FCC lactase units per caplet',
    directions:
        'Take 1–2 caplets with the first bite or sip of dairy. If dairy consumption continues after 30–45 minutes, take another labeled serving.',
    storage: 'Follow current package storage instructions.',
    lock:
        'Do not copy this tablet count to another lactase brand/strength. LACTAID Original and other products use different serving sizes.',
    sourceLabel: 'LACTAID official current product/FAQ',
  ),
  SpecialtyProductTechnique(
    name: 'beano Tablets',
    ingredient: 'Alpha-galactosidase',
    amount: '2 tablets = 800 GALU',
    directions:
        'Swallow or chew 2 tablets right before the first bite of a meal containing gas-causing complex carbohydrates, or immediately after the meal up to 30 minutes after the first bite.',
    storage: 'Store below 25°C (77°F). Avoid heat. Do not cook with it.',
    lock:
        'This tablet count applies to the verified beano tablet formulation; Meltaways and To-Go products have different GALU per serving.',
    sourceLabel: 'beano official current label',
  ),
];

const specialtyGlobalLocks = <String>[
  'Digestive enzymes work only for the substrate they target: lactase → lactose; alpha-galactosidase → selected complex carbohydrates. “Digestive enzyme blend” is not a diagnosis.',
  'DAO should not be used to self-diagnose histamine intolerance. The diagnosis is uncertain in many patients and placebo responses are common.',
  '“Liver detox” is not a clinical indication. Persistent abnormal liver enzymes, jaundice, pruritus, ascites or unexplained fatigue need medical evaluation.',
  'Supplements marketed for liver health can themselves cause liver injury; formulation matters.',
  'Metabolic supplements should never replace evidence-based diabetes, lipid, obesity or blood-pressure treatment.',
];
