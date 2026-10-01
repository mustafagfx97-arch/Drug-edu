import '../domain/hair_loss_models.dart';

const hairLossGlobalLocks = <String>[
  'Hair loss is a diagnosis problem before it is a product-selection problem. Sudden diffuse shedding, chronic patterned thinning, alopecia areata, traction, scarring alopecia, scalp disease and medication-related loss do not share one treatment.',
  'A cosmetic shampoo can improve scalp condition, breakage, fibre strength or the appearance of density, but do not present shampoo alone as a proven regrowth treatment for androgenetic alopecia.',
  'Do not start biotin, iron, zinc, selenium, vitamin A, vitamin E or vitamin D just because hair is shedding. Correct a documented or clinically plausible deficiency; excessive intake of some nutrients can worsen hair loss.',
  'Commercial nutraceutical evidence is formulation-specific. Do not transfer a positive trial from Viviscal, Nutrafol, Priorin or another tested formula to a different product with vaguely similar ingredients.',
  'Topical ampoules, lotions and serums below are dermocosmetic adjuncts unless local labeling says otherwise. They do not replace diagnosis or evidence-based treatment when progressive patterned alopecia, alopecia areata or scarring disease is present.',
  'Pregnancy, breastfeeding, age under 18, endocrine disease, anticoagulation, significant liver/kidney disease, cancer treatment and polypharmacy require product-specific review before multi-ingredient supplements are recommended.',
];

const hairLossTriageRules = <HairLossTriageRule>[
  HairLossTriageRule(
    id: 'reactive-diffuse',
    title: 'Sudden diffuse shedding / reactive loss',
    pattern:
        'Diffuse shedding that appears over weeks to months, often about 2–3 months after fever, infection, childbirth, surgery, severe stress, rapid weight loss, restrictive dieting or a medication change.',
    whatItUsuallyMeans:
        'Telogen effluvium is common. The scalp should usually look healthy. Once the trigger is removed, many cases recover over months without a hair-growth product.',
    nonDrugRole:
        'Nutrition correction is useful when an actual deficit or inadequate intake exists. A commercial hair nutraceutical or leave-in cosmetic can be offered only as an adjunct with realistic expectations, not as the main treatment of an uninvestigated cause.',
    labPlan:
        'Do not order a universal hair panel. CBC/ferritin/iron studies are high-value when menstrual blood loss, low iron intake, fatigue, pallor or diffuse shedding raises concern. TSH is targeted when thyroid symptoms/history are present. Vitamin B12, folate, zinc and vitamin D are considered according to diet, malabsorption, risk factors, persistent/recurrent shedding or clinical suspicion rather than tested automatically in everyone.',
    referWhen:
        'Refer when shedding is severe, persists beyond the expected recovery period, the diagnosis is uncertain, the scalp is inflamed, or there are systemic symptoms.',
    sourceLabel:
        'AAD Hair Loss guidance + Cleveland Clinic Telogen Effluvium + 2024/2026 telogen-effluvium laboratory literature',
  ),
  HairLossTriageRule(
    id: 'chronic-pattern',
    title: 'Chronic progressive / patterned thinning',
    pattern:
        'Gradual widening of the part, reduced ponytail volume, vertex/crown thinning or recession over >6 months, often with family history.',
    whatItUsuallyMeans:
        'Androgenetic/pattern hair loss should be considered. Follicle miniaturization is progressive; delay in diagnosis can reduce the chance of preserving density.',
    nonDrugRole:
        'Supplements and dermocosmetic serums may be adjuncts when the patient wants them, but do not present them as equivalent to established medical options. Choose products with defined formulations and measurable 3–6 month goals.',
    labPlan:
        'Laboratory tests are driven by history and examination. Check for iron, thyroid, nutritional or hormonal contributors when clinically indicated; normal nutrient levels are not a reason to add high-dose supplements.',
    referWhen:
        'Dermatology assessment is appropriate for progressive patterned loss, especially when rapid, early-onset, associated with menstrual/hyperandrogen symptoms, or not responding as expected.',
    sourceLabel:
        'AAD Female Pattern Hair Loss + AAD supplement guidance',
  ),
  HairLossTriageRule(
    id: 'postpartum',
    title: 'Postpartum shedding',
    pattern:
        'Diffuse shedding usually begins a few months after delivery and is often a temporary telogen shift.',
    whatItUsuallyMeans:
        'Most postpartum telogen effluvium improves as the hair cycle normalizes. Nutritional status, blood loss, thyroid symptoms and feeding status matter more than choosing a cosmetic brand.',
    nonDrugRole:
        'Continue an appropriate postpartum diet/prenatal-type nutrient plan when indicated. Avoid automatically adding multi-botanical hair supplements while breastfeeding; use only products whose exact label and ingredients have been reviewed.',
    labPlan:
        'Consider CBC/ferritin and thyroid testing when history or symptoms suggest postpartum anemia or thyroid disease. Other tests are targeted to risk factors.',
    referWhen:
        'Refer for focal loss, scarring/inflammation, persistent severe shedding, systemic illness, or failure to recover as expected.',
    sourceLabel:
        'Cleveland Clinic Telogen Effluvium + AAD hair-loss guidance',
  ),
  HairLossTriageRule(
    id: 'red-flags',
    title: 'Red flags — do not sell a hair product first',
    pattern:
        'Smooth focal patches, broken hairs with scale, scalp pain/burning, marked erythema, pustules, shiny/scarred areas, eyebrow/eyelash loss, rapid severe loss, or associated autoimmune/systemic symptoms.',
    whatItUsuallyMeans:
        'Alopecia areata, fungal disease, inflammatory/scarring alopecia, traction or another specific disorder may be present.',
    nonDrugRole:
        'Cosmetic supplements, ampoules and shampoos should not delay diagnosis. Supportive gentle hair care may continue while the cause is assessed.',
    labPlan:
        'Testing is diagnosis-specific after history, scalp examination/trichoscopy and sometimes biopsy rather than a generic supplement panel.',
    referWhen:
        'Prompt medical/dermatology review.',
    sourceLabel: 'AAD Hair Loss diagnosis/treatment guidance',
  ),
];

const hairIngredientGuide = <HairIngredientGuide>[
  HairIngredientGuide(
    name: 'Biotin (B7)',
    whereSeen: 'Priorin Extra, Viviscal, Cystiphane Anagen, many hair gummies and B-complex products.',
    whenUseful:
        'Biotin deficiency is rare; supplementation is most defensible when deficiency/risk is present or when it is simply part of a studied commercial formula.',
    whatNotToPromise:
        'Do not sell high-dose biotin as a proven treatment for ordinary androgenetic alopecia or unexplained shedding.',
    safety:
        'High doses can interfere with susceptible immunoassays including some troponin and thyroid/hormone assays. Record the exact dose/product and follow assay/laboratory instructions; there is no universal 24/48-hour stop rule.',
    sourceLabel: 'NIH ODS Biotin + FDA/ADLM laboratory-interference guidance',
  ),
  HairIngredientGuide(
    name: 'Iron',
    whereSeen: 'Viviscal and some hair multinutrient formulas.',
    whenUseful:
        'Treat iron deficiency or clinically meaningful low iron status according to the patient context; heavy menstrual loss and restrictive diets are common clues.',
    whatNotToPromise:
        'Do not add iron to a replete patient simply because hair is shedding.',
    safety:
        'Constipation, nausea, overdose toxicity and major spacing interactions matter. Count iron from prenatal/multivitamin products before adding another source.',
    sourceLabel: 'AAD Hair Loss guidance + NIH ODS Iron',
  ),
  HairIngredientGuide(
    name: 'Zinc',
    whereSeen: 'Cystiphane, Viviscal, Neofollics, Nutrafol and many hair multivitamins.',
    whenUseful:
        'Useful when deficiency or inadequate intake is present; zinc also appears in several studied commercial formulas.',
    whatNotToPromise:
        'A normal zinc level/intake is not an indication for indefinite high-dose zinc.',
    safety:
        'Chronic excess can cause copper deficiency and neurologic/hematologic problems. Add total daily zinc across products.',
    sourceLabel: 'AAD Hair Loss guidance + NIH ODS Zinc',
  ),
  HairIngredientGuide(
    name: 'Vitamin D',
    whereSeen: 'Some multi-ingredient hair nutraceuticals; often added separately by patients.',
    whenUseful:
        'Correct deficiency according to standard vitamin-D guidance when present. Observational TE literature shows associations, but no universal hair-loss treatment dose is established.',
    whatNotToPromise:
        'Do not convert a low or borderline level into an arbitrary megadose hair regimen.',
    safety:
        'Count all vitamin D sources and avoid chronic high-dose self-treatment without a clear indication.',
    sourceLabel: 'NIH ODS Vitamin D + 2026 TE micronutrient meta-analysis',
  ),
  HairIngredientGuide(
    name: 'L-cystine / cysteine + sulfur amino acids',
    whereSeen: 'Priorin, Cystiphane, Pantogar, Ducray Anacaps and several European hair formulas.',
    whenUseful:
        'They are keratin building blocks and have product-specific trial data in several combination formulas; use them as part of the tested formula rather than extrapolating a universal stand-alone dose.',
    whatNotToPromise:
        'Do not claim that more cystine automatically reverses genetic or autoimmune alopecia.',
    safety:
        'Usually well tolerated in supplements, but the complete formula and total vitamin/mineral exposure determine safety.',
    sourceLabel: 'Priorin 2026 study + Cystiphane clinical study/product labeling',
  ),
  HairIngredientGuide(
    name: 'Selenium / vitamin A / vitamin E',
    whereSeen: 'Some multinutrient hair products and general multivitamins.',
    whenUseful:
        'Only when nutritional need is present or as part of a properly dosed tested formula.',
    whatNotToPromise:
        'More is not better for hair.',
    safety:
        'Excess selenium, vitamin A and vitamin E has been associated with adverse effects; excess selenium and vitamin A can themselves contribute to hair loss.',
    sourceLabel: 'AAD supplement safety guidance + NIH ODS fact sheets',
  ),
  HairIngredientGuide(
    name: 'Saw palmetto / beta-sitosterol / botanical antiandrogen blends',
    whereSeen: 'Neofollics and some Nutrafol/hair-loss nutraceuticals.',
    whenUseful:
        'Some trials and reviews suggest possible adjunctive benefit in patterned hair loss, but evidence is formulation-specific and weaker than established therapies.',
    whatNotToPromise:
        'Do not describe botanical DHT claims as equivalent to finasteride or as a guaranteed antiandrogen treatment.',
    safety:
        'Review pregnancy potential, hormone-sensitive conditions, bleeding risk and interacting medicines. Multi-botanical labels can change.',
    sourceLabel: 'JAMA Dermatology nutraceutical systematic review + current product labels',
  ),
  HairIngredientGuide(
    name: 'Marine collagen / AminoMar-type complexes',
    whereSeen: 'Viviscal and some marine-derived hair nutraceuticals.',
    whenUseful:
        'Viviscal has product-specific clinical evidence for selected adults with thinning hair.',
    whatNotToPromise:
        'Do not generalize Viviscal trial results to every collagen powder.',
    safety:
        'Check fish/shellfish/marine-source allergy and dietary preference; formulations can also contain iron and zinc.',
    sourceLabel: 'Viviscal current label + JAMA Dermatology nutraceutical review',
  ),
  HairIngredientGuide(
    name: 'Caffeine (topical)',
    whereSeen: 'Alpecin, Neofollics, Nioxin and several shampoos/serums.',
    whenUseful:
        'A reasonable cosmetic adjunct for thinning hair when the patient wants a non-drug topical option.',
    whatNotToPromise:
        'Clinical trials are generally small and heterogeneous; shampoo contact time does not make caffeine equivalent to established regrowth therapy.',
    safety:
        'Topical irritation can occur. Follow the product contact time; longer exposure is not automatically better.',
    sourceLabel: '2025 systematic review of topical caffeine preparations',
  ),
  HairIngredientGuide(
    name: 'Aminexil / diaminopyrimidine oxide',
    whereSeen: 'Vichy Dercos Energising products and Aminexil leave-in serums.',
    whenUseful:
        'Product-specific dermocosmetic adjunct for thinning/weakening hair.',
    whatNotToPromise:
        'Do not describe rinse-off shampoo or cosmetic serum as a guaranteed treatment of androgenetic alopecia.',
    safety:
        'Alcohol/fragrance-containing leave-on products can irritate a sensitive scalp. Follow the exact product schedule.',
    sourceLabel: 'Vichy Dercos official current product labeling',
  ),
  HairIngredientGuide(
    name: 'Piroctone olamine',
    whereSeen: 'Neofollics shampoo/lotion and some scalp-care formulas.',
    whenUseful:
        'Primarily useful for scalp/microbiome and dandruff-related support; a healthier scalp can improve comfort and adherence to a hair routine.',
    whatNotToPromise:
        'Do not present it as a stand-alone regrowth treatment.',
    safety: 'Avoid eye contact; stop if significant irritation develops.',
    sourceLabel: 'Current manufacturer product labels',
  ),
];

const hairLossProducts = <HairLossProduct>[
  HairLossProduct(
    id: 'priorin-extra',
    brand: 'Priorin / Bayer',
    name: 'Priorin Extra',
    type: HairLossProductType.oralSupplement,
    bestFor:
        'Adults with mild diffuse, non-illness-related thinning who want a time-limited nutraceutical trial after obvious medical/nutritional causes are considered.',
    keyIngredients:
        'Current Bayer-linked formula: millet extract 210 mg, L-cystine 3 mg, pantothenic acid (B5) about 14–15 mg and biotin 100 mcg per capsule.',
    regimen:
        '2 capsules daily. Official regional instructions allow 1 in the morning + 1 in the evening or both together; take with water after food.',
    duration:
        'Use consistently for about 12 weeks before judging; many regional labels recommend a 3–6 month course.',
    evidence: HairLossEvidence.limited,
    evidenceNote:
        'A 2026 open-label multicentre study in 112 healthy subjects with light diffuse hair loss used 2 capsules/day for 12 weeks and found improvements in hair-density/shedding measures. It was not a large independent placebo-controlled trial, so keep claims modest.',
    safety: [
      'Contains biotin: laboratory-interference counseling still applies.',
      'Formula/excipients vary by country; check wheat/soy/gelatin and local label.',
      'Pregnancy/breastfeeding: follow the exact market label and clinician advice.',
    ],
    productLock:
        'Priorin Extra is NOT the same formula as Priorin N. Do not copy the N dose or ingredients to Extra.',
    sourceLabel:
        'Bayer Priorin Extra current regional labeling + Proksch et al. J Cosmet Dermatol 2026',
  ),
  HairLossProduct(
    id: 'priorin-n',
    brand: 'Priorin / Bayer',
    name: 'Priorin N Capsules',
    type: HairLossProductType.oralSupplement,
    bestFor:
        'Nutritional support for thinning/weak hair in markets where Priorin N is sold; best used after clarifying whether loss is reactive or patterned.',
    keyIngredients:
        'Golden millet extract, wheat-germ oil, L-cystine and calcium pantothenate (vitamin B5).',
    regimen:
        '2–3 capsules daily after meals with a glass of water according to the current regional product page.',
    duration:
        '3–6 months is the manufacturer-recommended course because visible hair-cycle change is slow.',
    evidence: HairLossEvidence.productSpecific,
    evidenceNote:
        'Product-specific clinical data exist, but evidence should not be generalized to other millet/cystine supplements.',
    safety: [
      'Contains wheat-germ oil and may contain soy/gelatin depending on market formulation.',
      'Review pregnancy/breastfeeding and pediatric labeling locally.',
    ],
    productLock:
        'Priorin N and Priorin Extra differ in formulation and labeled dosing. Verify the exact box.',
    sourceLabel: 'Bayer/Priorin N official regional product page 2026',
  ),
  HairLossProduct(
    id: 'cystiphane-fort',
    brand: 'Cystiphane / Laboratoires Bailleul',
    name: 'Cystiphane Fort',
    type: HairLossProductType.oralSupplement,
    bestFor:
        'Reactive/situational hair weakness or shedding associated with stress, dieting or seasonal change when a supplement trial is reasonable.',
    keyIngredients:
        'Per 4 tablets: L-cystine 2,000 mg, zinc 15 mg, vitamin B6 2 mg and L-arginine 6 mg.',
    regimen:
        '4 tablets/day in 1 or 2 doses during meals.',
    duration: 'Renewable 3-month course.',
    evidence: HairLossEvidence.limited,
    evidenceNote:
        'A small 2023 study in telogen effluvium used 4 tablets/day for 3 months and reported improvement; the cohort was small, so use as an adjunct rather than proof of universal efficacy.',
    safety: [
      'Adds 15 mg/day zinc: count zinc from multivitamins and other hair products.',
      'Contains vitamin B6; duplication matters if the patient also uses a high-potency B-complex.',
      'Trace allergens may vary by market.',
    ],
    productLock:
        'Cystiphane Fort is the reactive-situation formula. Do not confuse it with Cystiphane Anagen for chronic situations.',
    sourceLabel:
        'Laboratoires Bailleul current Cystiphane Fort label + PubMed 37278502',
  ),
  HairLossProduct(
    id: 'cystiphane-anagen',
    brand: 'Cystiphane / Laboratoires Bailleul',
    name: 'Cystiphane Anagen',
    type: HairLossProductType.oralSupplement,
    bestFor:
        'Brand-positioned for chronic/progressive situations related to age or heredity as an adjunct, not a replacement for diagnosis of androgenetic alopecia.',
    keyIngredients:
        'Per 3 tablets: L-cystine 1,200 mg, rocket extract 100 mg, milk thistle 80 mg, zinc 10 mg, vitamin B6 2 mg, biotin 50 mcg and selenium 55 mcg.',
    regimen: '3 tablets daily with meals.',
    duration: '3-month renewable course.',
    evidence: HairLossEvidence.productSpecific,
    evidenceNote:
        'Evidence is product/ingredient specific and does not make it equivalent to established medical therapy for patterned hair loss.',
    safety: [
      'Count zinc, selenium, B6 and biotin from all other supplements.',
      'Biotin laboratory-interference counseling applies.',
    ],
    productLock:
        'Use the Anagen formula for the exact product context only; Bailleul separately positions Fort for reactive hair loss.',
    sourceLabel: 'Laboratoires Bailleul current Cystiphane Anagen label',
  ),
  HairLossProduct(
    id: 'neofollics-tablets',
    brand: 'Neofollics',
    name: 'Hair Growth Supporting Tablets',
    type: HairLossProductType.oralSupplement,
    bestFor:
        'Adults who specifically want a multi-ingredient nutraceutical for thinning hair and accept limited product-specific evidence.',
    keyIngredients:
        'Includes beta-sitosterol/plant sterols, green tea extract (caffeine), saw palmetto, soy isoflavones, red clover, taurine, carnitine, L-cysteine, zinc, B vitamins, biotin, folic acid and selenium.',
    regimen:
        '1–3 tablets/day with water during or after meals; spread additional tablets across meals. Manufacturer recommends 3/day for the full routine.',
    duration:
        'Use consistently for at least 3 months before judging. Manufacturer describes longer use/maintenance, but continued need should be reassessed rather than automatic.',
    evidence: HairLossEvidence.productSpecific,
    evidenceNote:
        'Several ingredients have biologic plausibility or limited hair data, but the exact commercial combination does not have the same evidence depth as established therapies.',
    safety: [
      'Contains caffeine and soy-derived ingredients.',
      'Plant sterols: manufacturer states it is not intended for people who do not need to control cholesterol; patients on cholesterol-lowering medicines should use under medical supervision.',
      'Manufacturer does not recommend during pregnancy/breastfeeding.',
      'Do not stack with another high-zinc/selenium/biotin hair formula without calculating totals.',
    ],
    productLock:
        'Do not market the phrase “DHT inhibitor” as proof of clinical equivalence to prescription antiandrogens.',
    sourceLabel: 'Neofollics official Hair Growth Supporting Tablets page 2026',
  ),
  HairLossProduct(
    id: 'viviscal',
    brand: 'Viviscal',
    name: 'Hair Growth Supplement',
    type: HairLossProductType.oralSupplement,
    bestFor:
        'Adults with thinning/fine hair who want a commercial nutraceutical with published product-specific trial evidence.',
    keyIngredients:
        'Current U.S. label includes AminoMar marine complex, vitamin C, niacin, biotin, calcium, iron, zinc, horsetail and millet extract.',
    regimen: '2 tablets daily with food and water.',
    duration: 'At least 3–6 months before judging response.',
    evidence: HairLossEvidence.moderate,
    evidenceNote:
        'Viviscal is among commercial nutraceuticals with supportive trial data in systematic reviews, but benefit is formulation-specific and not guaranteed.',
    safety: [
      'Contains marine-derived ingredients; check fish/shellfish allergy and dietary preference.',
      'Contains iron and zinc: duplication and iron appropriateness matter.',
      'Do not add another iron-containing hair supplement casually.',
    ],
    productLock:
        'Viviscal evidence does not validate generic collagen or every marine-complex supplement.',
    sourceLabel:
        'Viviscal official current label 2026 + JAMA Dermatology nutraceutical systematic review',
  ),
  HairLossProduct(
    id: 'nutrafol-core',
    brand: 'Nutrafol',
    name: 'Hair Growth Nutraceutical — core formulas',
    type: HairLossProductType.oralSupplement,
    bestFor:
        'Adults with self-perceived thinning who want a multi-botanical nutraceutical and can take a high pill-burden regimen.',
    keyIngredients:
        'Life-stage formulas differ. The brand uses a proprietary Synergen Complex plus vitamins/minerals and standardized botanical ingredients; exact Women, Women’s Balance, Men, Men 50+ and Postpartum labels are not interchangeable.',
    regimen:
        'Core Hair Growth Nutraceuticals: 4 capsules once daily with a meal; a meal containing some fat is preferred for fat-soluble ingredients.',
    duration: 'Clinical-program expectations are generally 3–6 months.',
    evidence: HairLossEvidence.moderate,
    evidenceNote:
        'Randomized product-specific trials and systematic reviews report potential benefit in selected adults. Evidence is tied to the exact Nutrafol formula studied.',
    safety: [
      'High ingredient complexity means interaction and duplication review is essential.',
      'Life-stage formulas differ; do not substitute Women, Balance, Men or Postpartum automatically.',
      'Review pregnancy/breastfeeding, thyroid/iodine issues, anticoagulation and other medicines against the exact label.',
    ],
    productLock:
        'Do not combine Nutrafol with another “hair multivitamin” without checking duplicate micronutrients/botanicals.',
    sourceLabel:
        'Nutrafol official 2026 labeling + published product-specific RCTs/systematic reviews',
  ),
  HairLossProduct(
    id: 'anacaps-reactiv',
    brand: 'Ducray',
    name: 'ANACAPS REACTIV',
    type: HairLossProductType.oralSupplement,
    bestFor:
        'Reactive/occasional hair loss under about 6 months, such as stress, fatigue, seasonal change or postpartum contexts after patient-specific review.',
    keyIngredients:
        'Sulfur amino acids plus vitamins/minerals; current brand materials highlight iron and vitamins B8/biotin, B6 and B3.',
    regimen: '1 capsule once daily, preferably with food/water.',
    duration: '3-month course is the usual brand pathway.',
    evidence: HairLossEvidence.productSpecific,
    evidenceNote:
        'Useful as a structured nutraceutical adjunct in the brand’s reactive-loss routine; not a replacement for identifying the trigger.',
    safety: [
      'Check the exact current pack for iron and other micronutrient amounts.',
      'Pregnancy/breastfeeding instructions vary by product and market; verify the specific label.',
    ],
    productLock:
        'REACTIV is for reactional/occasional loss. Do not substitute EXPERT without considering the loss pattern.',
    sourceLabel: 'Ducray official ANACAPS REACTIV hair-loss routine 2026',
  ),
  HairLossProduct(
    id: 'anacaps-expert',
    brand: 'Ducray',
    name: 'ANACAPS EXPERT',
    type: HairLossProductType.oralSupplement,
    bestFor:
        'Chronic/progressive hair loss as a nutritional adjunct while the underlying diagnosis is addressed.',
    keyIngredients:
        'Plant-based actives, sulfur amino acids, minerals and vitamins; current formula highlights biotin/B8, B6 and iron.',
    regimen: '1 capsule each morning with a large glass of water and food.',
    duration: '3 months recommended.',
    evidence: HairLossEvidence.productSpecific,
    evidenceNote:
        'Brand-positioned for chronic hair loss. Treat as adjunctive nutrition, not as primary therapy for androgenetic alopecia.',
    safety: [
      'Not recommended by the current label in pregnancy/breastfeeding.',
      'Current label cautions people on antidiabetic medication and disorders causing abnormal iron accumulation.',
    ],
    productLock:
        'From age 15 on the current label; verify local pack because composition and age labeling can change.',
    sourceLabel: 'Ducray official ANACAPS EXPERT page 2026',
  ),
  HairLossProduct(
    id: 'triphasic-caps',
    brand: 'René Furterer',
    name: 'Triphasic Caps',
    type: HairLossProductType.oralSupplement,
    bestFor:
        'Reactive or progressive loss-of-density routines when the patient wants a simple once-daily nutraceutical adjunct.',
    keyIngredients:
        'Current formulas include cystine, biotin, zinc and other nutrients; anti-density-loss versions also use plant ingredients such as saw-palmetto/Florida palm oil and horsetail.',
    regimen: '1 capsule daily with a glass of water.',
    duration: '90-day / 3-month course.',
    evidence: HairLossEvidence.productSpecific,
    evidenceNote:
        'Brand-specific nutraceutical support; the evidence does not make it equivalent to pharmacologic treatment of pattern hair loss.',
    safety: [
      'Exact Triphasic Caps formulas differ by market/version; inspect the current box.',
      'Review pregnancy/breastfeeding and botanical interactions.',
    ],
    productLock:
        'Do not confuse “Lengths/Active Grow” supplements with anti-hair-loss/density formulas.',
    sourceLabel: 'René Furterer official Triphasic Caps 2026',
  ),
  HairLossProduct(
    id: 'pantogar-classic',
    brand: 'Pantogar / Merz',
    name: 'Pantogar Classic Capsules',
    type: HairLossProductType.oralSupplement,
    bestFor:
        'Diffuse hair loss/structural hair damage only after confirming local regulatory status and indication.',
    keyIngredients:
        'Classic capsule: thiamine/B1 60 mg, calcium pantothenate/B5 60 mg, medicinal yeast 100 mg, L-cystine 20 mg, keratin 20 mg and PABA 20 mg.',
    regimen:
        'Adults: 1 capsule three times daily with liquid, swallowed whole, generally with/main meals.',
    duration: '3–6 months; reassess rather than continuing indefinitely.',
    evidence: HairLossEvidence.regulatoryCaution,
    evidenceNote:
        'Clinical data exist for diffuse hair loss, but Pantogar Classic is marketed as a medicinal product in some countries and as a different nutritional/vegan product in others.',
    safety: [
      'Regulatory status, composition, indications and pediatric/pregnancy labeling vary by country.',
      'Do not place classic Pantogar automatically in the “non-drug supplement” bucket.',
    ],
    productLock:
        'Verify the exact country pack and whether it is Pantogar classic medicine or Pantogar vegan nutritional product before counseling.',
    sourceLabel: 'Merz/Pantogar official 2024–2026 labeling',
  ),
  HairLossProduct(
    id: 'crescina-regrowth',
    brand: 'Crescina / Labo Suisse',
    name: 'Crescina Transdermic HFSC Re-Growth Vials',
    type: HairLossProductType.topicalAmpouleLotionSerum,
    bestFor:
        'Cosmetic adjunct for non-pathologic physiological thinning when follicles are still active; not for scarring alopecia or completely atrophied follicles.',
    keyIngredients:
        'Re-Growth complex (cysteine, lysine, glycoprotein), HFSC/Stem-Engine complex, methionine, glycine, copper tripeptide-1 and penetration enhancers.',
    regimen:
        'Apply 1 full 3.5 mL vial to a clean, dry, healthy scalp, line by line, concentrating on thinning areas; massage gently. Use 5 consecutive days then take 2 days off. Do not rinse.',
    duration:
        'Minimum 2 months; manufacturer commonly recommends up to 4 months and repeat cycles with breaks when needed.',
    evidence: HairLossEvidence.productSpecific,
    evidenceNote:
        'Manufacturer reports phototrichogram/consumer studies. Treat these as product-specific dermocosmetic data, not equivalent to independently replicated alopecia therapy.',
    safety: [
      'External use only — do not inject or swallow.',
      'Avoid eyes/mucous membranes and do not apply to injured/inflamed scalp.',
      'Use the supplied vial breaker/applicator carefully.',
    ],
    productLock:
        'Crescina strengths 200/500/1300 are marketing-stage variants; do not invent dose escalation beyond the exact pack instructions.',
    sourceLabel: 'Labo Suisse/Crescina official HFSC instructions 2026',
  ),
  HairLossProduct(
    id: 'crescina-complete',
    brand: 'Crescina / Labo Suisse',
    name: 'Crescina HFSC Complete Treatment',
    type: HairLossProductType.topicalAmpouleLotionSerum,
    bestFor:
        'Patients specifically choosing the Crescina dermocosmetic program for physiological thinning.',
    keyIngredients:
        'Alternates amber Re-Growth HFSC vials with clear Anti-Hair-Loss vials; the two formulations contain different amino-acid/peptide complexes.',
    regimen:
        'Use 1 vial/day, alternating the two vial types for the first 5 days of each week, then take 2 days off. Apply to clean dry scalp and do not rinse.',
    duration: 'At least 2 months; one 10+10-vial box covers about 1 month.',
    evidence: HairLossEvidence.productSpecific,
    evidenceNote:
        'Product-program evidence is manufacturer-driven and should be framed as cosmetic support.',
    safety: [
      'External use only; avoid eyes/mucosa and damaged scalp.',
    ],
    productLock:
        'Do not use both vial types on the same day unless the exact pack explicitly instructs it; the Complete Treatment alternates them.',
    sourceLabel: 'Labo Suisse/Crescina Complete Treatment official instructions',
  ),
  HairLossProduct(
    id: 'foltene-women',
    brand: 'Foltène Pharma',
    name: 'Hair & Scalp Treatment — Women',
    type: HairLossProductType.topicalAmpouleLotionSerum,
    bestFor:
        'Cosmetic support at the first signs of weakening/thinning in women.',
    keyIngredients:
        'Tricalgoxyl® brown-algae polysaccharides, DN-Age™ Cassia alata extract, a biomineral algae complex and Capillia Longa PPF™.',
    regimen:
        'Attack phase: 1 vial every other day for 8 weeks. Massage over the scalp until dispersed; leave on and do not rinse.',
    duration:
        'After attack phase: maintenance 2 vials/week for 6 weeks. Brand suggests repeating at least twice yearly.',
    evidence: HairLossEvidence.productSpecific,
    evidenceNote:
        'Foltène lists multiple cosmetic/clinical studies, but many are company-linked and not equivalent to large independent alopecia trials.',
    safety: [
      'Use on intact scalp; avoid broken/irritated skin.',
      'Let dry before styling products.',
    ],
    productLock:
        'Women and men formulas use different proprietary complexes. Match the exact pack.',
    sourceLabel: 'Foltène Pharma official Women 12-vial label + FAQ',
  ),
  HairLossProduct(
    id: 'foltene-men',
    brand: 'Foltène Pharma',
    name: 'Hair & Scalp Treatment — Men',
    type: HairLossProductType.topicalAmpouleLotionSerum,
    bestFor:
        'Cosmetic support at the first signs of weakening/thinning in men.',
    keyIngredients:
        'Tricosaccaride®, DN-Age™, amino-acid/vitamin nourishing complex and Capillia Longa PPF™.',
    regimen:
        'Attack phase: 1 vial every other day for 8 weeks. Massage over scalp until dispersed; leave on and do not rinse.',
    duration:
        'Maintenance: 2 vials/week for 6 weeks; manufacturer suggests repeat courses as needed.',
    evidence: HairLossEvidence.productSpecific,
    evidenceNote:
        'Product-specific cosmetic evidence; should not delay diagnosis of male pattern hair loss.',
    safety: [
      'Use only on intact scalp and keep out of eyes.',
    ],
    productLock:
        'Do not imply that Tricosaccaride is an alternative equivalent to minoxidil/finasteride.',
    sourceLabel: 'Foltène Pharma official Men 12-vial label + FAQ',
  ),
  HairLossProduct(
    id: 'cystiphane-lotion',
    brand: 'Cystiphane / Laboratoires Bailleul',
    name: 'Cystiphane+ Anti Hair Loss Lotion',
    type: HairLossProductType.topicalAmpouleLotionSerum,
    bestFor:
        'Temporary or chronic hair loss in adults as a leave-in dermocosmetic adjunct.',
    keyIngredients:
        'Acetyl cysteine, arginine, Vitis vinifera vine extract/viniferin, piroctone olamine and a minimalist alcohol-based vehicle.',
    regimen:
        'Apply 7 sprays once daily over the whole scalp and massage. Leave on; no rinsing.',
    duration:
        'Brand phototrichogram data are reported at 90 days; use a defined ~3-month trial before reassessing.',
    evidence: HairLossEvidence.productSpecific,
    evidenceNote:
        'The manufacturer reports a 20-subject phototrichogram study. Useful as product-specific evidence, but the study size is small.',
    safety: [
      'Avoid eyes; alcohol-containing lotion may irritate sensitive scalp.',
    ],
    productLock:
        'Older regional instructions may show different spray counts/attack-maintenance schedules. Follow the exact current local pump bottle, not an old leaflet.',
    sourceLabel: 'Laboratoires Bailleul official Cystiphane+ lotion 2026',
  ),
  HairLossProduct(
    id: 'neofollics-lotion',
    brand: 'Neofollics',
    name: 'Hair Growth Stimulating Lotion',
    type: HairLossProductType.topicalAmpouleLotionSerum,
    bestFor:
        'Adults seeking a non-drug leave-in cosmetic adjunct for thinning areas.',
    keyIngredients:
        'Neoxyl®-branded complex; current INCI includes diaminopyrimidine oxide, adenosine, copper tripeptide-1, green-tea/Ecklonia and other botanical actives.',
    regimen:
        'Apply directly to thinning scalp areas twice daily. The brand provides area-based spray examples; part the hair so product reaches scalp rather than hair shafts.',
    duration:
        'Use consistently for at least 3 months before judging; long-term continuation should depend on benefit/tolerance.',
    evidence: HairLossEvidence.productSpecific,
    evidenceNote:
        'Evidence is largely product/manufacturer based. Present as a cosmetic adjunct.',
    safety: [
      'Avoid eyes and irritated scalp.',
      'Not recommended by current manufacturer labeling during pregnancy/breastfeeding.',
    ],
    productLock:
        'Do not market proprietary “Neoxyl 7%” language as proof of equivalence to approved hair-loss drugs.',
    sourceLabel: 'Neofollics official current advanced hair-loss routine 2026',
  ),
  HairLossProduct(
    id: 'vichy-regen',
    brand: 'Vichy Dercos',
    name: 'Aminexil Clinical R.E.G.E.N Booster Serum',
    type: HairLossProductType.topicalAmpouleLotionSerum,
    bestFor:
        'Men or women wanting a leave-in Aminexil dermocosmetic serum for weakened/thinning hair.',
    keyIngredients:
        'Aminexil/diaminopyrimidine oxide, niacinamide, ginger extract and piroctone olamine in an alcohol-containing serum.',
    regimen:
        'After washing, apply to dry or damp scalp. Divide hair into 4 sections and apply one dose to each section.',
    duration: '5–7 applications/week for 12 weeks.',
    evidence: HairLossEvidence.productSpecific,
    evidenceNote:
        'Manufacturer instrumental/self-assessment data support appearance/resistance outcomes. Keep claims within cosmetic adjunct boundaries.',
    safety: [
      'Can irritate sensitive scalp because of alcohol/fragrance.',
    ],
    productLock:
        'Do not confuse the leave-in serum schedule with Dercos Energising rinse-off shampoo.',
    sourceLabel: 'Vichy Dercos official R.E.G.E.N Booster page 2026',
  ),
  HairLossProduct(
    id: 'ducray-creastim',
    brand: 'Ducray',
    name: 'CREASTIM REACTIV Lotion',
    type: HairLossProductType.topicalAmpouleLotionSerum,
    bestFor:
        'Reactive/occasional sudden hair loss, including stress/fatigue/seasonal/postpartum-type pathways after diagnosis.',
    keyIngredients:
        'Trapeptide, creatine and vitamins B5/B6/B8 in the current formula.',
    regimen: 'Apply directly to the scalp 3 times per week.',
    duration: '2 months.',
    evidence: HairLossEvidence.productSpecific,
    evidenceNote:
        'Ducray reports controlled clinical data in reactive hair loss. Still treat it as a dermocosmetic adjunct.',
    safety: [
      'Current official label states use is possible from the 2nd trimester of pregnancy and during breastfeeding; verify local pack before counseling.',
    ],
    productLock:
        'CREASTIM is for reactional/sudden loss. Chronic progressive loss uses a different Ducray pathway.',
    sourceLabel: 'Ducray official CREASTIM REACTIV page 2026',
  ),
  HairLossProduct(
    id: 'ducray-neoptide',
    brand: 'Ducray',
    name: 'NEOPTIDE EXPERT Serum',
    type: HairLossProductType.topicalAmpouleLotionSerum,
    bestFor:
        'Chronic/progressive hair loss as a daily leave-in cosmetic adjunct.',
    keyIngredients:
        'Lespedeza extract, Anchorane™/milk-thistle extract, manganese PCA and supporting excipients.',
    regimen:
        'Once daily: apply 8 sprays to a dry or damp scalp (2 sprays each to middle, right, left and back), then massage. Do not rinse.',
    duration:
        'Brand hair-loss pathway uses daily application for at least about 2–3 months before reassessment; transplant protocols are longer and separate.',
    evidence: HairLossEvidence.productSpecific,
    evidenceNote:
        'Manufacturer studies include observational/usage data. Do not extrapolate transplant-specific instructions to ordinary hair loss.',
    safety: [
      'Alcohol-containing serum can irritate sensitive scalp.',
    ],
    productLock:
        'Hair-transplant instructions are a separate clinician-led protocol; do not apply them to routine thinning.',
    sourceLabel: 'Ducray official NEOPTIDE EXPERT page 2026',
  ),
  HairLossProduct(
    id: 'furterer-triphasic-serum',
    brand: 'René Furterer',
    name: 'Triphasic Reactional / Progressive Serum Ampoules',
    type: HairLossProductType.topicalAmpouleLotionSerum,
    bestFor:
        'Reactional or progressive hair loss when the exact Triphasic serum is matched to the loss pattern.',
    keyIngredients:
        'The exact active complex differs between Reactional and Progressive versions; current range uses botanical/essential-oil complexes targeted to scalp and hair-cycle support.',
    regimen:
        'Apply one full ampoule section by section to a clean, damp scalp after washing; massage in and do not rinse. Current official range uses about 1–2 applications/week depending on the exact version.',
    duration:
        'Reactional programs commonly use 1 application/week for 3 months; verify the exact Progressive pack before counseling.',
    evidence: HairLossEvidence.productSpecific,
    evidenceNote:
        'Brand clinical data support hair-fall reduction, but product/version-specific instructions matter.',
    safety: [
      'Essential oils/fragrance may irritate sensitive scalps.',
    ],
    productLock:
        'Do not use Reactional and Progressive intensive treatments simultaneously unless specifically directed.',
    sourceLabel: 'René Furterer official Triphasic range 2026',
  ),
  HairLossProduct(
    id: 'nioxin-serum',
    brand: 'Nioxin',
    name: 'Hair Fall Defense Serum',
    type: HairLossProductType.topicalAmpouleLotionSerum,
    bestFor:
        'Leave-in cosmetic support for thinning hair and hair anchorage.',
    keyIngredients: 'Sandalore™, caffeine, niacinamide and lauric acid.',
    regimen:
        'Apply up to 15 pumps daily to dry or damp scalp, massage evenly and do not rinse.',
    duration: 'Use daily; brand reports visible anchorage outcomes around 8 weeks.',
    evidence: HairLossEvidence.productSpecific,
    evidenceNote:
        'A brand-reported double-blind study involved 120 panelists; useful but still product-specific cosmetic evidence.',
    safety: [
      'Alcohol/fragrance can irritate sensitive scalps.',
    ],
    productLock:
        'Thickening/anchorage claims should not be translated into guaranteed follicular regrowth.',
    sourceLabel: 'Nioxin official Hair Fall Defense Serum page 2026',
  ),
  HairLossProduct(
    id: 'vichy-shampoo',
    brand: 'Vichy Dercos',
    name: 'Energising Shampoo',
    type: HairLossProductType.shampoo,
    bestFor:
        'Supportive cleansing for fragile/thinning hair, often paired with leave-in Aminexil products.',
    keyIngredients:
        'Aminexil/diaminopyrimidine oxide, niacinamide, panthenol, vitamin B6 and salicylic acid.',
    regimen: 'Apply to wet hair, massage, then rinse. Suitable for frequent use.',
    duration: 'Use according to washing needs; reassess the whole hair-loss plan rather than the shampoo alone.',
    evidence: HairLossEvidence.supportiveOnly,
    evidenceNote:
        'Official claims focus mainly on reduced hair loss due to breakage and support of the anti-hair-loss routine.',
    safety: [
      'May irritate a dry/sensitive scalp depending on surfactant tolerance.',
    ],
    productLock:
        'Rinse-off shampoo is not the same as leave-in Aminexil serum and should not be presented as a stand-alone regrowth treatment.',
    sourceLabel: 'Vichy Dercos official Energising Shampoo page 2026',
  ),
  HairLossProduct(
    id: 'cystiphane-shampoo',
    brand: 'Cystiphane / Laboratoires Bailleul',
    name: 'Anti Hair Loss Shampoo',
    type: HairLossProductType.shampoo,
    bestFor:
        'Supportive shampoo for temporary or chronic hair loss, especially when breakage/shaft weakness is part of the complaint.',
    keyIngredients:
        'Acetyl cysteine, arginine, Larix europaea wood extract, menthol, hydrolyzed wheat protein, glycine and zinc chloride.',
    regimen:
        'Apply to wet hair, massage gently, lather, leave to act briefly and rinse. Brand studies used about 2–3 times/week.',
    duration: 'Use as adjunct during a defined hair-loss program.',
    evidence: HairLossEvidence.supportiveOnly,
    evidenceNote:
        'Brand reports pull-test/usage improvements, but shampoo cannot diagnose or treat the underlying alopecia by itself.',
    safety: [
      'Avoid eyes; menthol/fragrance may bother sensitive scalp.',
    ],
    productLock:
        'Keep shampoo as supportive care even when paired with Cystiphane Fort/Anagen/lotion.',
    sourceLabel: 'Laboratoires Bailleul official Cystiphane shampoo 2026',
  ),
  HairLossProduct(
    id: 'foltene-shampoo-women',
    brand: 'Foltène Pharma',
    name: 'Strengthening Shampoo for Women',
    type: HairLossProductType.shampoo,
    bestFor: 'Fragile/thinning hair needing supportive cleansing/volume.',
    keyIngredients: 'Tricalgoxyl® and Panax ginseng extract.',
    regimen:
        'Use as the cleansing step in the Foltène thinning-hair routine; rinse thoroughly. Exact wash frequency can follow scalp/hair needs.',
    duration: 'Supportive ongoing hair care.',
    evidence: HairLossEvidence.supportiveOnly,
    evidenceNote:
        'Self-evaluation/product data support strength/volume/shine; not a stand-alone regrowth treatment.',
    safety: ['Stop if scalp irritation develops.'],
    productLock:
        'Women and men strengthening shampoos use different highlighted proprietary actives.',
    sourceLabel: 'Foltène Pharma official strengthening shampoo page 2026',
  ),
  HairLossProduct(
    id: 'foltene-shampoo-men',
    brand: 'Foltène Pharma',
    name: 'Strengthening Shampoo for Men',
    type: HairLossProductType.shampoo,
    bestFor: 'Fragile/thinning hair needing supportive cleansing/volume.',
    keyIngredients: 'Tricosaccaride® and capsicum/red-pepper extract.',
    regimen:
        'Use as the cleansing step in the thinning-hair routine; rinse thoroughly. Match frequency to scalp tolerance.',
    duration: 'Supportive ongoing hair care.',
    evidence: HairLossEvidence.supportiveOnly,
    evidenceNote:
        'Product/self-evaluation data support cosmetic strength/volume outcomes.',
    safety: [
      'Capsicum/tonic ingredients may irritate a sensitive scalp.',
    ],
    productLock:
        'Do not equate tingling/warming with clinical regrowth.',
    sourceLabel: 'Foltène Pharma official strengthening shampoo page 2026',
  ),
  HairLossProduct(
    id: 'neofollics-shampoo',
    brand: 'Neofollics',
    name: 'Hair Growth Stimulating Shampoo',
    type: HairLossProductType.shampoo,
    bestFor:
        'Adults wanting a caffeine/piroctone-based adjunctive scalp shampoo in a broader hair routine.',
    keyIngredients:
        'Caffeine, Ecklonia cava, piroctone olamine, EGCG, ginseng, niacinamide, mint/rosemary and other botanical extracts.',
    regimen:
        'Massage directly into wet scalp, leave for 3–5 minutes, then rinse thoroughly.',
    duration:
        'Brand routines use at least 3–4 times/week and sometimes daily depending on the full regimen.',
    evidence: HairLossEvidence.supportiveOnly,
    evidenceNote:
        'Caffeine has some supportive clinical literature, but the exact multi-ingredient shampoo evidence is limited and manufacturer-driven.',
    safety: [
      'Mint/essential-oil/fragrance ingredients can irritate sensitive scalp.',
    ],
    productLock:
        'Do not combine “many active ingredients” with a claim of proven regrowth.',
    sourceLabel: 'Neofollics official current hair-loss routines 2026',
  ),
  HairLossProduct(
    id: 'ducray-anaphase',
    brand: 'Ducray',
    name: 'ANAPHASE / ANAPHASE+ Densifying Shampoo',
    type: HairLossProductType.shampoo,
    bestFor:
        'Supportive shampoo used before leave-in anti-hair-loss care in reactive or chronic loss.',
    keyIngredients:
        'Current formula includes biotin, panthenol, vitamin B6, ruscus extract, hydrolyzed wheat protein and salicylic acid.',
    regimen:
        'Apply and lather, rinse, then reapply and leave for 2–3 minutes before rinsing; follow with the chosen leave-in hair-loss treatment.',
    duration: 'Use as often as necessary according to the current label.',
    evidence: HairLossEvidence.supportiveOnly,
    evidenceNote:
        'Designed as a complement rather than stand-alone treatment.',
    safety: ['Review surfactant tolerance in irritated/dry scalp.'],
    productLock:
        'Do not confuse shampoo “densifying” appearance with reversal of follicle miniaturization.',
    sourceLabel: 'Ducray official ANAPHASE/NEOPTIDE shampoo page 2026',
  ),
  HairLossProduct(
    id: 'alpecin-c1',
    brand: 'Alpecin',
    name: 'Caffeine Shampoo C1',
    type: HairLossProductType.shampoo,
    bestFor:
        'Adults with thinning hair who want a caffeine shampoo and understand that evidence is adjunctive.',
    keyIngredients: 'Caffeine complex with caffeine, zinc PCA, niacinamide and panthenol.',
    regimen:
        'Use daily as a normal shampoo and leave on the scalp for about 2 minutes before rinsing.',
    duration:
        'Manufacturer recommends continuous use for at least 3 months before judging cosmetic benefit.',
    evidence: HairLossEvidence.limited,
    evidenceNote:
        'Topical caffeine systematic review found generally favorable studies but mostly medium/low/very-low quality and heterogeneous products.',
    safety: [
      'Longer contact can increase scalp redness/irritation; more time is not necessarily better.',
    ],
    productLock:
        'Do not present caffeine shampoo as proven equivalent to medical AGA therapy.',
    sourceLabel:
        'Alpecin official C1 label 2026 + 2025 systematic review of topical caffeine',
  ),
  HairLossProduct(
    id: 'furterer-triphasic-shampoo',
    brand: 'René Furterer',
    name: 'Triphasic Anti-Hair-Loss / Thickening Shampoo',
    type: HairLossProductType.shampoo,
    bestFor:
        'Supportive cleansing in Reactional or Progressive Triphasic routines.',
    keyIngredients:
        'Current Triphasic shampoos use brand-specific essential-oil/botanical complexes; exact formula varies by market/version.',
    regimen:
        'Use as the first cleansing step, then apply the matched Reactional or Progressive leave-in serum according to its regimen.',
    duration: 'Ongoing supportive care as tolerated.',
    evidence: HairLossEvidence.supportiveOnly,
    evidenceNote:
        'Small brand clinical studies support reduced breakage/hair fall appearance; evidence remains product-specific.',
    safety: [
      'Essential oils/fragrance can irritate sensitive scalp.',
    ],
    productLock:
        'Use the exact current Triphasic shampoo version; names/formulas have changed over time.',
    sourceLabel: 'René Furterer official Triphasic range 2026',
  ),
];

HairLossProduct hairLossProduct(String id) =>
    hairLossProducts.singleWhere((item) => item.id == id);
