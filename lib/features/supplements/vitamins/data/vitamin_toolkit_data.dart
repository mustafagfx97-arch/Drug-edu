import '../domain/vitamin_toolkit_models.dart';

const vitaminToolkitEntries = <VitaminToolkitEntry>[
  VitaminToolkitEntry(
    id: VitaminId.vitaminA,
    name: 'Vitamin A',
    nameAr: 'فيتامين A',
    coreRule:
        'Separate preformed vitamin A (retinol/retinyl esters) from provitamin A carotenoids. The adult UL applies to preformed vitamin A, not beta-carotene from food.',
    forms: [
      VitaminForm(
        name: 'Retinol / retinyl esters',
        practicalDifference:
            'Preformed vitamin A; high chronic doses can cause toxicity and are especially important to review in pregnancy.',
      ),
      VitaminForm(
        name: 'Beta-carotene',
        practicalDifference:
            'Provitamin A carotenoid. Do not treat its milligram amount as directly interchangeable with retinol.',
      ),
    ],
    pathways: [
      VitaminPathway(
        id: 'nutrition-gap',
        title: 'Nutrition gap',
        population: 'Generally healthy people with inadequate vitamin A intake',
        dose:
            'Use the age/life-stage RDA/AI in Daily Needs. Do not automatically use a high-dose retinol supplement.',
        whenToUse:
            'When diet cannot reliably meet the target or a specific deficiency-risk state exists.',
        duration: 'Reassess diet and the underlying reason for low intake.',
        monitoring:
            'Routine serum vitamin A screening is not a wellness test; test when deficiency or malabsorption is clinically plausible.',
        caveat:
            'Pregnancy or possibility of pregnancy requires special caution with preformed vitamin A. Avoid self-directed high-dose retinol/retinyl ester products.',
        sourceLabel: 'NIH ODS Vitamin A and Carotenoids',
      ),
    ],
    safety: [
      'Adult preformed-vitamin-A UL: 3,000 mcg RAE/day from retinol/retinyl esters.',
      'Chronic excess can cause liver injury and other toxicity.',
      'High-dose beta-carotene supplements are not a routine substitute for food sources, especially in people who smoke or previously smoked.',
    ],
  ),
  VitaminToolkitEntry(
    id: VitaminId.thiaminB1,
    name: 'Thiamin (B1)',
    nameAr: 'ثيامين B1',
    coreRule:
        'Routine dietary thiamin and emergency treatment of suspected Wernicke encephalopathy are different clinical situations.',
    forms: [
      VitaminForm(
        name: 'Thiamine hydrochloride / mononitrate',
        practicalDifference:
            'Common oral supplement forms. Dose according to the indication and exact product.',
      ),
      VitaminForm(
        name: 'Benfotiamine',
        practicalDifference:
            'Lipid-soluble thiamine derivative used in some supplements; do not assume equivalence to standard thiamine for emergency deficiency treatment.',
      ),
    ],
    pathways: [
      VitaminPathway(
        id: 'wernicke-lock',
        title: 'Suspected Wernicke encephalopathy',
        population:
            'High-risk patients with compatible neurologic features, severe alcohol-use risk, prolonged vomiting, starvation or malnutrition',
        dose:
            'URGENT parenteral thiamine protocol — do not use a retail supplement dose as treatment.',
        whenToUse:
            'When Wernicke encephalopathy is suspected clinically. Treatment should not wait for a routine vitamin level.',
        duration: 'Hospital/clinician-directed protocol.',
        monitoring:
            'Neurologic response, magnesium and other nutritional/electrolyte issues as clinically indicated.',
        caveat:
            'This app intentionally does not auto-generate a parenteral Wernicke dose because institutional guidelines differ and this is emergency treatment.',
        sourceLabel: 'NIH ODS Thiamin + emergency deficiency principles',
      ),
      VitaminPathway(
        id: 'nutrition-gap',
        title: 'Nutrition gap',
        population: 'Generally healthy users with inadequate intake',
        dose: 'Use Daily Needs RDA/AI rather than pharmacologic B-complex doses.',
        whenToUse: 'Low intake or risk state without emergency deficiency.',
        duration: 'Until diet/risk factor is corrected.',
        monitoring: 'Routine thiamin testing is not needed for most healthy users.',
        caveat: 'Do not use high-dose B-complex as a generic energy booster.',
        sourceLabel: 'NIH ODS Thiamin',
      ),
    ],
    safety: [
      'No UL has been established for thiamin, but absence of a UL is not evidence that high-dose supplementation improves energy in nondeficient people.',
      'Severe deficiency is a medical problem, not a wellness-supplement indication.',
    ],
  ),
  VitaminToolkitEntry(
    id: VitaminId.riboflavinB2,
    name: 'Riboflavin (B2)',
    nameAr: 'ريبوفلافين B2',
    coreRule:
        'Riboflavin is a precursor of FAD/FMN and has a special role in mitochondrial medicine, but that does not make high-dose B2 a general energy supplement.',
    forms: [
      VitaminForm(
        name: 'Riboflavin',
        practicalDifference: 'Standard oral vitamin B2 form.',
      ),
      VitaminForm(
        name: 'Riboflavin-5-phosphate',
        practicalDifference:
            'Phosphorylated form used in some products; do not assume superior clinical outcomes without indication-specific evidence.',
      ),
    ],
    pathways: [
      VitaminPathway(
        id: 'pmd-specialist',
        title: 'Primary mitochondrial disorder — specialist use',
        population: 'Patients with diagnosed primary mitochondrial disorders',
        dose: '50–400 mg/day has been recommended by mitochondrial specialists.',
        whenToUse:
            'Specialist-directed mitochondrial therapy, particularly when a flavoprotein/complex I or II defect is relevant.',
        duration: 'Long-term only as part of a defined mitochondrial plan.',
        monitoring:
            'Clinical response and disease-specific metabolic/biochemical monitoring rather than a generic serum B2 target.',
        caveat:
            'Evidence is mainly case reports/small studies. Do not use this dose for nonspecific fatigue or “mitochondrial support” in healthy users.',
        sourceLabel: 'NIH ODS Primary Mitochondrial Disorders',
      ),
    ],
    safety: [
      'No UL has been established for riboflavin.',
      'Bright yellow urine is expected and harmless after many riboflavin supplements.',
    ],
  ),
  VitaminToolkitEntry(
    id: VitaminId.niacinB3,
    name: 'Niacin (B3)',
    nameAr: 'نياسين B3',
    coreRule:
        'Nicotinic acid and nicotinamide are both niacin forms, but high-dose nicotinic acid behaves like a drug and should not be treated as a routine vitamin supplement.',
    forms: [
      VitaminForm(
        name: 'Nicotinic acid',
        practicalDifference:
            'Can cause flushing and is used at pharmacologic doses in lipid therapy; requires clinician monitoring.',
      ),
      VitaminForm(
        name: 'Nicotinamide / niacinamide',
        practicalDifference:
            'Does not produce the same flushing profile and is not interchangeable with nicotinic acid for lipid effects.',
      ),
      VitaminForm(
        name: 'Nicotinamide riboside',
        practicalDifference:
            'NAD precursor marketed for cellular energy/aging; do not equate marketing claims with proven disease treatment.',
      ),
    ],
    pathways: [
      VitaminPathway(
        id: 'routine-nutrition',
        title: 'Routine nutritional use',
        population: 'People with inadequate niacin intake',
        dose: 'Use RDA/AI target rather than 500 mg+ “high potency” products.',
        whenToUse: 'Inadequate intake or deficiency-risk state.',
        duration: 'Until cause/intake is corrected.',
        monitoring: 'No routine niacin lab is required for healthy users.',
        caveat:
            'High-dose nicotinic acid for dyslipidemia is a medical-therapy pathway, not a wellness supplement.',
        sourceLabel: 'NIH ODS Niacin',
      ),
    ],
    safety: [
      'The U.S. adult UL for supplemental niacin is 35 mg/day, driven mainly by flushing risk.',
      'High-dose nicotinic acid can cause hepatotoxicity, hyperglycemia and other drug-like adverse effects.',
      'Do not substitute nicotinamide for nicotinic acid when a prescription-like lipid effect is intended.',
    ],
  ),
  VitaminToolkitEntry(
    id: VitaminId.pantothenicB5,
    name: 'Pantothenic acid (B5)',
    nameAr: 'بانتوثينيك أسيد B5',
    coreRule:
        'Deficiency is rare because pantothenic acid is widely distributed in foods. High-dose products usually have no routine clinical indication.',
    forms: [
      VitaminForm(
        name: 'Pantothenic acid / calcium pantothenate',
        practicalDifference: 'Common nutritional supplement forms.',
      ),
      VitaminForm(
        name: 'Pantethine',
        practicalDifference:
            'Related derivative used in some specialty products; do not treat it as dose-equivalent to pantothenic acid.',
      ),
    ],
    pathways: [
      VitaminPathway(
        id: 'routine',
        title: 'Routine nutritional use',
        population: 'Rare severe-malnutrition or inadequate-intake contexts',
        dose: 'Use the AI target; most mixed diets already provide adequate amounts.',
        whenToUse: 'Only when intake is genuinely inadequate or deficiency is plausible.',
        duration: 'Until nutritional status is corrected.',
        monitoring: 'No routine B5 screening for healthy users.',
        caveat: 'Do not use gram doses as a default “energy/metabolism” regimen.',
        sourceLabel: 'NIH ODS Pantothenic Acid, updated May 2026',
      ),
    ],
    safety: [
      'No UL has been established.',
      'Very high doses such as 10 g/day can cause diarrhea and GI distress.',
    ],
  ),
  VitaminToolkitEntry(
    id: VitaminId.vitaminB6,
    name: 'Vitamin B6',
    nameAr: 'فيتامين B6',
    coreRule:
        'B6 can be therapeutic in selected conditions, but chronic high intake can itself cause sensory neuropathy.',
    forms: [
      VitaminForm(
        name: 'Pyridoxine',
        practicalDifference: 'Most common supplement form.',
      ),
      VitaminForm(
        name: 'Pyridoxal-5-phosphate (PLP/P5P)',
        practicalDifference:
            'Active coenzyme form; do not assume it eliminates dose-related neuropathy risk.',
      ),
    ],
    pathways: [
      VitaminPathway(
        id: 'nvp',
        title: 'Nausea and vomiting of pregnancy',
        population: 'Pregnant patients with uncomplicated nausea/vomiting',
        dose: 'Pyridoxine 10–25 mg three or four times daily.',
        whenToUse:
            'A first-line pharmacologic option; if inadequate, doxylamine may be added according to obstetric guidance.',
        duration: 'Reassess symptoms and total daily B6 exposure.',
        monitoring: 'Clinical response and duplicate B6 from prenatal/B-complex products.',
        caveat:
            'Count all B6 sources. Repeated high total doses can approach or exceed safety limits.',
        sourceLabel: 'NIH ODS Vitamin B6 citing ACOG',
      ),
    ],
    safety: [
      'Chronic excessive pyridoxine can cause sensory neuropathy and ataxia.',
      'U.S. FNB adult UL: 100 mg/day, but EFSA set a much lower adult UL of 12 mg/day in 2023 because of neuropathy data.',
      'Do not combine multiple “nerve support” products without adding their total B6 dose.',
    ],
  ),
  VitaminToolkitEntry(
    id: VitaminId.biotinB7,
    name: 'Biotin (B7)',
    nameAr: 'بيوتين B7',
    coreRule:
        'Biotin deficiency is rare. Hair/skin/nail marketing is much stronger than the clinical evidence.',
    forms: [
      VitaminForm(
        name: 'Biotin',
        practicalDifference:
            'Common single-ingredient and hair/nail supplement form; many products contain thousands of micrograms.',
      ),
    ],
    pathways: [
      VitaminPathway(
        id: 'hair-nails',
        title: 'Hair / nail / skin products',
        population: 'People considering biotin for cosmetic reasons',
        dose:
            'Do not auto-recommend megadoses. Evidence for routine use in people without deficiency is limited.',
        whenToUse:
            'Consider true deficiency risk or a specific specialist-directed inherited metabolic indication rather than cosmetic marketing alone.',
        duration: 'Avoid indefinite high-dose self-treatment without a reason.',
        monitoring:
            'Ask about upcoming laboratory tests because biotin can distort immunoassay results.',
        caveat:
            'Even one 10 mg dose has interfered with thyroid tests within 24 hours in a study; some assays including troponin can be dangerously affected.',
        sourceLabel: 'NIH ODS Biotin + FDA biotin lab-interference warning',
      ),
    ],
    safety: [
      'No UL is established, but high doses can cause falsely high or falsely low laboratory results.',
      'Always document biotin before thyroid, cardiac troponin, vitamin D and other susceptible immunoassays.',
    ],
  ),
  VitaminToolkitEntry(
    id: VitaminId.folateB9,
    name: 'Folate / Folic acid (B9)',
    nameAr: 'فولات / فوليك أسيد B9',
    coreRule:
        'Food folate, folic acid and DFE are not interchangeable numbers. Folic acid is the form proven to prevent neural-tube defects.',
    forms: [
      VitaminForm(
        name: 'Food folate',
        practicalDifference: 'Naturally occurring folates in foods; intake is expressed using DFE.',
      ),
      VitaminForm(
        name: 'Folic acid',
        practicalDifference:
            'Stable synthetic form used in supplements/fortification and the form with established NTD-prevention evidence.',
      ),
      VitaminForm(
        name: '5-MTHF / methylfolate',
        practicalDifference:
            'Supplement form of folate, but do not substitute it for the evidence-based folic-acid NTD-prevention recommendation without a specific reason.',
      ),
    ],
    pathways: [
      VitaminPathway(
        id: 'ntd-prevention',
        title: 'Neural-tube-defect prevention',
        population: 'All women capable of becoming pregnant',
        dose: '400 mcg folic acid every day.',
        whenToUse:
            'Start before pregnancy is recognized and continue through the periconceptional period; pregnancy nutrition continues afterward.',
        duration: 'Daily while capable of pregnancy; individualized prenatal plan during pregnancy.',
        monitoring: 'No folate level is required simply to begin standard prevention.',
        caveat:
            'Patients with prior NTD-affected pregnancy or other high-risk conditions need a clinician-specific higher-dose plan rather than this standard dose.',
        sourceLabel: 'CDC Folic Acid 2026',
      ),
    ],
    safety: [
      'Adult UL: 1,000 mcg/day of synthetic folic acid from supplements/fortified foods; natural food folate is not included.',
      'In macrocytosis or neurologic symptoms, evaluate B12 when appropriate rather than reflexively treating folate alone.',
    ],
  ),
  VitaminToolkitEntry(
    id: VitaminId.vitaminB12,
    name: 'Vitamin B12',
    nameAr: 'فيتامين B12',
    coreRule:
        'The tiny RDA is not a replacement dose. Treat the cause: dietary insufficiency, medicine effect and irreversible malabsorption require different plans.',
    forms: [
      VitaminForm(
        name: 'Cyanocobalamin',
        practicalDifference:
            'Common oral supplement form and acceptable for replacement.',
      ),
      VitaminForm(
        name: 'Methylcobalamin',
        practicalDifference:
            'Active cobalamin form used in many supplements; accepted by NICE as an oral B12 form.',
      ),
      VitaminForm(
        name: 'Adenosylcobalamin',
        practicalDifference:
            'Another biologically active form accepted by NICE in oral supplements.',
      ),
      VitaminForm(
        name: 'Hydroxocobalamin',
        practicalDifference:
            'Common injectable medicine in some countries; exact injection schedule is product/guideline specific.',
      ),
    ],
    pathways: [
      VitaminPathway(
        id: 'malabsorption-oral',
        title: 'B12 deficiency with malabsorption — oral option',
        population:
            'Adults with B12 deficiency caused or suspected to be caused by malabsorption when oral therapy is selected',
        dose: 'At least 1 mg oral vitamin B12 daily.',
        whenToUse:
            'Selected nonirreversible malabsorption cases when oral replacement is appropriate.',
        duration: 'Depends on whether the cause persists.',
        monitoring:
            'NICE follow-up: generally 3 months after starting, or earlier by severity; 1 month in pregnancy/breastfeeding.',
        caveat:
            'Autoimmune gastritis, total gastrectomy or complete terminal ileal resection should receive lifelong intramuscular replacement under NICE guidance.',
        sourceLabel: 'NICE NG239 Vitamin B12 deficiency',
      ),
      VitaminPathway(
        id: 'dietary',
        title: 'Dietary B12 deficiency',
        population: 'Diet-related deficiency, including vegan diets without reliable B12 sources',
        dose:
            'Oral replacement is appropriate; choose a product containing cyanocobalamin, methylcobalamin or adenosylcobalamin. Exact dose depends on deficiency status and product.',
        whenToUse: 'Confirmed/suspected diet-related deficiency or reliable prevention in strict vegan diets.',
        duration: 'Continue while dietary risk persists; reassess if the cause is corrected.',
        monitoring: 'Symptoms and follow-up B12/MMA strategy according to the original diagnostic context.',
        caveat:
            'Do not rule out deficiency because anemia or macrocytosis is absent.',
        sourceLabel: 'NICE NG239 + NIH ODS Vitamin B12',
      ),
    ],
    safety: [
      'No UL has been established for vitamin B12.',
      'Metformin and gastric-acid suppression can contribute to low B12 status.',
      'Neurologic B12 deficiency can occur without macrocytosis.',
    ],
  ),
  VitaminToolkitEntry(
    id: VitaminId.vitaminC,
    name: 'Vitamin C',
    nameAr: 'فيتامين C',
    coreRule:
        'Vitamin C is easy to obtain from food for most people; high-dose “immune” supplementation is not automatically beneficial.',
    forms: [
      VitaminForm(
        name: 'Ascorbic acid',
        practicalDifference: 'Standard oral vitamin C form.',
      ),
      VitaminForm(
        name: 'Mineral ascorbates',
        practicalDifference:
            'Buffered salts such as sodium/calcium ascorbate; count the accompanying mineral when clinically relevant.',
      ),
    ],
    pathways: [
      VitaminPathway(
        id: 'nutrition-gap',
        title: 'Nutrition gap',
        population: 'People with low fruit/vegetable intake or increased requirement',
        dose: 'Use the RDA/AI and food-first gap rather than gram-dose products.',
        whenToUse: 'Inadequate intake or deficiency risk.',
        duration: 'Until intake/risk is corrected.',
        monitoring: 'Routine vitamin C blood testing is not needed for most healthy users.',
        caveat: 'Smokers require 35 mg/day above the standard adult RDA.',
        sourceLabel: 'NIH ODS Vitamin C',
      ),
    ],
    safety: [
      'Adult UL: 2,000 mg/day from food + supplements.',
      'High doses commonly cause diarrhea, nausea and abdominal cramps.',
      'Chronic high-dose vitamin C can worsen iron overload in hereditary hemochromatosis.',
    ],
  ),
  VitaminToolkitEntry(
    id: VitaminId.vitaminD,
    name: 'Vitamin D',
    nameAr: 'فيتامين D',
    coreRule:
        'Separate routine prevention from deficiency treatment. 25-OH-D testing is not a universal prerequisite for healthy people.',
    forms: [
      VitaminForm(
        name: 'Vitamin D3 (cholecalciferol)',
        practicalDifference:
            'Common supplement form; both D2 and D3 raise 25-OH-D, but D3 often raises it higher and for longer.',
      ),
      VitaminForm(
        name: 'Vitamin D2 (ergocalciferol)',
        practicalDifference:
            'Valid vitamin D form; exact treatment regimen depends on product and clinical indication.',
      ),
    ],
    pathways: [
      VitaminPathway(
        id: 'older-adults',
        title: 'Generally healthy adults age >75 years',
        population: 'Adults older than 75 years without another testing indication',
        dose:
            'Empiric daily lower-dose vitamin D is preferred over intermittent high doses; trials informing the guideline averaged about 900 IU/day.',
        whenToUse:
            'Prevention pathway in generally healthy adults >75 years.',
        duration: 'Ongoing while benefit/risk remains appropriate.',
        monitoring:
            'Routine 25-OH-D screening or follow-up testing is not recommended solely to guide this prevention pathway.',
        caveat:
            'This is not a vitamin-D-deficiency treatment protocol and should not override hypercalcemia/CKD or other disease-specific management.',
        sourceLabel: 'Endocrine Society Vitamin D Guideline 2024',
      ),
      VitaminPathway(
        id: 'pregnancy',
        title: 'Pregnancy — empiric supplementation',
        population: 'Pregnant patients',
        dose:
            'Use pregnancy-appropriate daily supplementation rather than intermittent megadoses; exact product dose should fit the prenatal plan and total intake.',
        whenToUse:
            'Endocrine Society 2024 suggests empiric supplementation during pregnancy.',
        duration: 'During pregnancy as part of the prenatal plan.',
        monitoring:
            'Routine 25-OH-D testing is not required solely to start the empiric prevention pathway in healthy pregnancy.',
        caveat: 'Documented deficiency or calcium disorders require separate treatment.',
        sourceLabel: 'Endocrine Society Vitamin D Guideline 2024',
      ),
    ],
    safety: [
      'Adult UL: 4,000 IU/day (100 mcg/day) for routine intake.',
      'Vitamin D toxicity causes hypercalcemia; review duplicate D3 in multivitamins and combination calcium products.',
      'Do not use a generic “50,000 IU weekly” algorithm without confirming indication, formulation and follow-up plan.',
    ],
  ),
  VitaminToolkitEntry(
    id: VitaminId.vitaminE,
    name: 'Vitamin E',
    nameAr: 'فيتامين E',
    coreRule:
        'Alpha-tocopherol is the form used to meet human vitamin E requirements. Deficiency is uncommon outside significant fat-malabsorption or rare disorders.',
    forms: [
      VitaminForm(
        name: 'Natural alpha-tocopherol (RRR / d-alpha)',
        practicalDifference:
            'Natural-source alpha-tocopherol has different activity per mg/IU than synthetic forms.',
      ),
      VitaminForm(
        name: 'Synthetic alpha-tocopherol (all-rac / dl-alpha)',
        practicalDifference:
            'Do not convert old IU labels to mg without knowing whether the form is natural or synthetic.',
      ),
      VitaminForm(
        name: 'Mixed tocopherols / tocotrienols',
        practicalDifference:
            'Do not assume they are equivalent to alpha-tocopherol for meeting the RDA.',
      ),
    ],
    pathways: [
      VitaminPathway(
        id: 'deficiency-risk',
        title: 'Deficiency-risk replacement',
        population: 'People with substantial fat malabsorption or a diagnosed deficiency disorder',
        dose: 'Clinician-directed; use the exact diagnosis and formulation.',
        whenToUse: 'Documented deficiency or high-risk malabsorption.',
        duration: 'Depends on persistence of the underlying disorder.',
        monitoring: 'Clinical status and vitamin E assessment when indicated.',
        caveat: 'Do not use high-dose vitamin E routinely for cardiovascular prevention.',
        sourceLabel: 'NIH ODS Vitamin E',
      ),
    ],
    safety: [
      'High-dose vitamin E supplements can increase bleeding risk, especially with anticoagulants/antiplatelets.',
      'Supplemental vitamin E UL applies to alpha-tocopherol from supplements/fortified foods, not ordinary food intake.',
    ],
  ),
  VitaminToolkitEntry(
    id: VitaminId.vitaminK,
    name: 'Vitamin K',
    nameAr: 'فيتامين K',
    coreRule:
        'K1 and K2 are not interchangeable marketing labels. The most important counseling issue is consistency with vitamin-K antagonists such as warfarin.',
    forms: [
      VitaminForm(
        name: 'Vitamin K1 (phylloquinone)',
        practicalDifference: 'Main dietary form and a medicinal vitamin K form.',
      ),
      VitaminForm(
        name: 'Vitamin K2 (menaquinones, e.g. MK-4/MK-7)',
        practicalDifference:
            'Different menaquinones have different pharmacokinetics; do not extrapolate one product’s evidence to all K2 products.',
      ),
    ],
    pathways: [
      VitaminPathway(
        id: 'warfarin',
        title: 'Patient taking warfarin',
        population: 'Patients using vitamin-K antagonists',
        dose:
            'Do not instruct the patient to eliminate vitamin K. Aim for a reasonably consistent intake and coordinate supplement changes with INR management.',
        whenToUse: 'Any time a vitamin K food/supplement change is being considered.',
        duration: 'For the duration of vitamin-K-antagonist therapy.',
        monitoring: 'INR after clinically meaningful intake/supplement changes.',
        caveat:
            'Starting or stopping MK-7/K1 supplements can alter anticoagulation. Product-specific review is required.',
        sourceLabel: 'NIH ODS Vitamin K',
      ),
    ],
    safety: [
      'No UL has been established for vitamin K1/K2 because toxicity data are insufficient to define one.',
      'Menadione (vitamin K3) is not an acceptable dietary supplement substitute and has hepatotoxicity concerns.',
    ],
  ),
];

VitaminToolkitEntry vitaminEntry(VitaminId id) {
  return vitaminToolkitEntries.singleWhere((entry) => entry.id == id);
}

const mitochondrialSupportItems = <MitochondrialSupportItem>[
  MitochondrialSupportItem(
    ingredient: 'Coenzyme Q10 / ubiquinol',
    whenUsed:
        'Specialist-directed therapy in diagnosed primary mitochondrial disorders; MMS recommends offering CoQ10 to most PMD patients despite sparse efficacy evidence.',
    dose:
        'Ubiquinol 2–8 mg/kg/day in 2 doses with meals; alternative ubiquinone dosing has also been used under specialist care.',
    evidence:
        'Case reports/small trials show biochemical signals but limited proof of meaningful clinical outcomes.',
    safetyLock:
        'Not a generic treatment for unexplained fatigue. Use the exact PMD diagnosis, formulation, adherence and monitoring plan.',
    sourceLabel: 'NIH ODS Primary Mitochondrial Disorders',
  ),
  MitochondrialSupportItem(
    ingredient: 'Riboflavin (B2)',
    whenUsed:
        'Specialist-directed PMD therapy, especially when complex I/II or flavoprotein biology is relevant.',
    dose: '50–400 mg/day.',
    evidence:
        'Mostly case reports, including responses in some complex I/II defects; stronger genotype-specific evidence can override generic cocktail logic.',
    safetyLock:
        'Do not extrapolate this dose to healthy users seeking “energy.”',
    sourceLabel: 'NIH ODS Primary Mitochondrial Disorders',
  ),
  MitochondrialSupportItem(
    ingredient: 'L-carnitine',
    whenUsed:
        'MMS recommends carnitine only when a PMD patient has documented carnitine deficiency, with blood-level monitoring.',
    dose:
        'Children: 20–100 mg/kg/day divided 2–3 doses. Adults: 330–990 mg/dose 2–3 times/day; usual maximum 3 g/day.',
    evidence:
        'Limited small studies; some exercise outcomes improved, but evidence is not broad enough for routine use in every PMD.',
    safetyLock:
        'Do not include carnitine automatically in every “mitochondrial cocktail.”',
    sourceLabel: 'NIH ODS Primary Mitochondrial Disorders',
  ),
  MitochondrialSupportItem(
    ingredient: 'Alpha-lipoic acid',
    whenUsed:
        'Sometimes included as an antioxidant/cofactor in specialist PMD regimens.',
    dose:
        'No universal PMD dose should be auto-generated from current evidence.',
    evidence:
        'Evidence as monotherapy is extremely limited; combination studies are small.',
    safetyLock:
        'Keep as specialist-directed/limited-evidence rather than a standard cocktail component.',
    sourceLabel: 'NIH ODS Primary Mitochondrial Disorders',
  ),
  MitochondrialSupportItem(
    ingredient: 'Creatine',
    whenUsed:
        'Sometimes used as an alternative energy-buffer component in PMD combination regimens.',
    dose:
        'No universal PMD dose should be auto-generated from the limited combination evidence.',
    evidence:
        'A small combination trial with CoQ10 + ALA improved some biochemical markers but not muscle strength.',
    safetyLock:
        'Not evidence that creatine treats every mitochondrial disorder.',
    sourceLabel: 'NIH ODS Primary Mitochondrial Disorders',
  ),
];

const mitochondrialCocktailRule =
    'A “mitochondrial cocktail” is not one standardized formula. Published regimens commonly combine 3–6 ingredients, but composition and doses vary substantially. Use only for diagnosed/specialist-managed primary mitochondrial disease, not nonspecific fatigue or wellness.';
