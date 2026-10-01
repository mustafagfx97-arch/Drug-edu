import '../domain/need_matrix_models.dart';

const healthySupplementRules = <HealthySupplementRule>[
  HealthySupplementRule(
    nutrient: 'Multivitamin/mineral',
    dailyNeed: 'No universal MVM requirement.',
    defaultSupplementDose: 'None required by default.',
    practicalRule:
        'A healthy adult with a varied adequate diet does not automatically need a multivitamin. Use one only to cover a defined dietary/life-stage gap, and avoid high-potency products that duplicate other supplements.',
  ),
  HealthySupplementRule(
    nutrient: 'Vitamin D',
    dailyNeed: '600 IU/day age 19–70; 800 IU/day over age 70 — TOTAL intake.',
    defaultSupplementDose:
        'Healthy adults under 75: no automatic dose above the DRI. Fill only the dietary gap unless another indication exists.',
    practicalRule:
        'Do not use a “vitamin D level” as a routine ticket to supplement healthy adults; established disease indications are a different pathway.',
  ),
  HealthySupplementRule(
    nutrient: 'Calcium',
    dailyNeed:
        'Usually 1,000 mg/day adults; 1,200 mg/day for women 51–70 and adults 71+ — TOTAL intake.',
    defaultSupplementDose:
        'Supplement dose = uncovered dietary gap, not the full RDA.',
    practicalRule:
        'Food first. If diet already supplies the target, extra calcium is unnecessary. If supplementing, count ELEMENTAL calcium and the exact salt/form.',
  ),
  HealthySupplementRule(
    nutrient: 'Iron',
    dailyNeed:
        'Men 19+ and adults 51+: 8 mg/day; women 19–50: 18 mg/day — TOTAL intake. Pregnancy: 27 mg/day.',
    defaultSupplementDose:
        'No routine stand-alone iron dose for a healthy iron-replete adult.',
    practicalRule:
        'Menstruation, pregnancy, diet and blood loss change risk. Do not convert the RDA into an iron tablet automatically.',
  ),
  HealthySupplementRule(
    nutrient: 'Vitamin B12',
    dailyNeed: 'Adults: 2.4 mcg/day TOTAL intake.',
    defaultSupplementDose:
        'No fixed high-dose supplement for an omnivorous healthy adult with adequate intake.',
    practicalRule:
        'Vegans need a reliable fortified-food or supplement source. Adults over 50 are advised to obtain recommended B12 mainly from fortified foods or supplements because food-bound absorption can decline.',
  ),
  HealthySupplementRule(
    nutrient: 'Folate / folic acid',
    dailyNeed: 'Adults: 400 mcg DFE/day TOTAL intake.',
    defaultSupplementDose:
        'Healthy person without pregnancy potential: no automatic folic-acid tablet if diet is adequate.',
    practicalRule:
        'Pregnancy-capable persons are a defined exception: 400 mcg/day folic acid for NTD prevention.',
  ),
  HealthySupplementRule(
    nutrient: 'Magnesium',
    dailyNeed:
        'Men: about 400–420 mg/day; women: about 310–320 mg/day TOTAL intake.',
    defaultSupplementDose:
        'Supplement dose = gap only; there is no routine 350 mg “required supplement dose.”',
    practicalRule:
        'The 350 mg adult UL applies to supplemental/medication magnesium only, not food magnesium. Kidney impairment changes safety.',
  ),
  HealthySupplementRule(
    nutrient: 'Zinc',
    dailyNeed: 'Men: 11 mg/day; women: 8 mg/day TOTAL intake.',
    defaultSupplementDose:
        'No routine stand-alone zinc dose if diet is adequate.',
    practicalRule:
        'Chronic high-dose zinc can produce copper deficiency. Count zinc from immune products, multivitamins and lozenges.',
  ),
  HealthySupplementRule(
    nutrient: 'Iodine',
    dailyNeed: 'Adults: 150 mcg/day TOTAL intake.',
    defaultSupplementDose:
        'No routine extra iodine for every healthy adult with an adequate diet/iodized salt intake.',
    practicalRule:
        'Pregnancy/planning/lactation is a separate pathway; kelp products are not a precise substitute for a declared iodine dose.',
  ),
];

const needPathways = <NeedPathway>[
  NeedPathway(
    id: 'healthy-balanced-adult',
    title: 'Healthy adult with a varied, adequate diet',
    who: 'No symptoms, no known deficiency, no special life stage, no malabsorption and no major medication-driven nutrient risk.',
    tier: NeedActionTier.foodFirst,
    coreDecision:
        'There is NO default supplement stack. Nutrition targets are total intake from food + fortified foods + supplements.',
    supplementPlan:
        'Default supplement dose = 0 when food already meets the individualized target. If diet leaves a gap, supplement only the gap rather than adding a full RDA on top of food.',
    dailyTarget:
        'Use My Daily Needs for age/sex-specific RDA or AI. Formula: supplement gap = max(target − food intake − existing supplements, 0).',
    labPlan:
        'No generic vitamin panel. Do not routinely screen 25-OH vitamin D in otherwise healthy adults. Order a nutrient test only when a clinical question/risk factor would change management.',
    duration:
        'Reassess diet and supplement list periodically; there is no automatic lifelong supplement duration.',
    reviewStopRule:
        'Stop unnecessary products when the dietary gap is closed or when there is no defined indication. Do not “double up” multivitamins or overlapping single nutrients.',
    sourceLabel: 'NIH ODS MVM + NIH ODS FAQ + Endocrine Society Vitamin D 2024',
  ),
  NeedPathway(
    id: 'restricted-low-intake',
    title: 'Restricted diet / low-calorie intake / poor food variety',
    who: 'People who avoid major food groups, eat very low-calorie diets, have poor intake or cannot consistently meet nutrient targets.',
    tier: NeedActionTier.foodFirst,
    coreDecision:
        'A basic multivitamin or selected nutrients may be useful, but choose the actual gaps rather than assuming every nutrient is low.',
    supplementPlan:
        'Prefer a basic age/sex/life-stage product near daily values when several gaps are plausible; avoid high-potency formulas and add single nutrients only for documented/likely gaps.',
    dailyTarget:
        'Use individualized RDA/AI as TOTAL intake. The supplement is the uncovered gap, not an automatic second full daily allowance.',
    labPlan:
        'Testing is targeted to the diet and symptoms—for example CBC/ferritin with iron risk, B12 when vegan or neurologic/anemia risk, and other tests only if clinically indicated.',
    duration:
        'Continue only while the intake restriction persists, with periodic diet and duplication review.',
    reviewStopRule:
        'If food intake normalizes, recalculate the gap before continuing the same supplement doses.',
    sourceLabel: 'NIH ODS MVM Health Professional + NIH ODS FAQ',
  ),
  NeedPathway(
    id: 'pregnancy-capable',
    title: 'Pregnancy possible / planning pregnancy',
    who: 'Any person capable of becoming pregnant, including before pregnancy is recognized.',
    tier: NeedActionTier.preventive,
    coreDecision:
        'Folic acid is a clear preventive exception to the food-gap-only rule.',
    supplementPlan:
        'Take 400 mcg folic acid daily. A prenatal can provide it; verify the label rather than assuming every “prenatal” has the correct amount.',
    dailyTarget:
        '400 mcg/day FOLIC ACID for neural-tube-defect prevention, in addition to a healthful diet. This is not a fertility booster.',
    labPlan:
        'No folate blood test is required before routine preventive folic acid. High-risk prior NTD or other special histories need a separate clinician-directed dose.',
    duration:
        'Start before conception; CDC recommends daily folic acid for all women capable of becoming pregnant. Continue through early pregnancy as part of the prenatal plan.',
    reviewStopRule:
        'Do not stack several prenatal/B-complex products; count synthetic folic acid across all products.',
    sourceLabel: 'CDC Folic Acid 2026 + ACOG Prepregnancy Care',
  ),
  NeedPathway(
    id: 'pregnancy-prenatal',
    title: 'Pregnancy — prenatal nutrition',
    who: 'Pregnant person without a separate specialist micronutrient protocol.',
    tier: NeedActionTier.preventive,
    coreDecision:
        'Pregnancy increases several nutrient needs. A daily prenatal is generally recommended, but more is not better.',
    supplementPlan:
        'Use one daily prenatal serving chosen for the patient. Confirm at minimum folic acid, iron and iodine content rather than trusting the front label.',
    dailyTarget:
        'Key pregnancy totals: iron 27 mg/day, iodine 220 mcg/day, folate 600 mcg DFE/day, vitamin D 600 IU/day. Many organizations recommend 150 mcg/day iodine supplementation as potassium iodide; ACOG notes most prenatals provide about 27 mg iron.',
    labPlan:
        'Pregnancy anemia screening is part of obstetric care. Extra therapeutic iron is added only when indicated; do not take multiple prenatal servings to treat deficiency.',
    duration:
        'Daily through pregnancy according to obstetric care; postpartum/lactation needs are reassessed separately.',
    reviewStopRule:
        'Avoid duplicate prenatal products and excessive preformed vitamin A or iron. A deficiency needs a separate treatment plan rather than doubling the prenatal.',
    sourceLabel: 'NIH ODS Pregnancy + ACOG Healthy Eating During Pregnancy + CDC Folic Acid',
  ),
  NeedPathway(
    id: 'lactation-maternal',
    title: 'Breastfeeding / lactating parent',
    who: 'Lactating person, especially with vegan diet, little iodized salt/seafood/dairy or other dietary restrictions.',
    tier: NeedActionTier.preventive,
    coreDecision:
        'Maternal iodine and B12 status can directly matter to the breastfed infant; use a targeted lactation plan rather than a generic “postnatal stack.”',
    supplementPlan:
        'Professional groups commonly recommend 150 mcg/day iodine as potassium iodide during lactation. A vegan lactating parent needs a reliable B12 source. Other nutrients are gap- or diagnosis-driven.',
    dailyTarget:
        'Iodine RDA during lactation is 290 mcg/day total; B12 is 2.8 mcg/day total. The 150 mcg iodine supplement is part of the total, not an extra RDA.',
    labPlan:
        'No broad vitamin panel. Test B12 or other nutrients when diet, symptoms, infant concerns or malabsorption make deficiency plausible.',
    duration:
        'Throughout lactation while the indication persists, with product/diet review.',
    reviewStopRule:
        'Avoid kelp/seaweed megadoses as a substitute for a known iodine dose.',
    sourceLabel: 'NIH ODS Iodine + NIH ODS Vitamin B12',
  ),
  NeedPathway(
    id: 'breastfed-infant-vitd',
    title: 'Breastfed or partially breastfed infant',
    who: 'Infants receiving breast milk or mixed feeding with less than 32 oz/day formula.',
    tier: NeedActionTier.preventive,
    coreDecision:
        'Vitamin D supplementation is routinely recommended; breast milk alone does not supply enough vitamin D.',
    supplementPlan:
        'Vitamin D 400 IU once daily beginning in the first days of life. Verify concentration in IU/drop or IU/mL every time the product changes.',
    dailyTarget:
        'Infants under 12 months need 400 IU/day vitamin D total. Children 12–24 months need 600 IU/day total.',
    labPlan:
        'Do not require a routine 25-OH vitamin D test before standard preventive infant dosing.',
    duration:
        'Continue according to feeding pattern and age; reassess when formula intake or age changes.',
    reviewStopRule:
        'Never transfer “number of drops” from one brand to another without checking concentration.',
    sourceLabel: 'CDC Vitamin D and Breastfeeding, 2026',
  ),
  NeedPathway(
    id: 'strict-vegan-b12',
    title: 'Strict vegan diet',
    who: 'Adults, adolescents or caregivers of children whose diet contains no reliable animal-source B12.',
    tier: NeedActionTier.preventive,
    coreDecision:
        'Vitamin B12 needs a RELIABLE fortified-food or supplement source; unfortified plant foods are not dependable B12 sources.',
    supplementPlan:
        'Use fortified foods and/or a B12 supplement that reliably covers the age/life-stage requirement. No universal megadose is required for every vegan.',
    dailyTarget:
        'Adult RDA is 2.4 mcg/day total; pregnancy 2.6 mcg/day; lactation 2.8 mcg/day. Product doses may be much higher because absorption is dose-dependent, but high label %DV is not the personal requirement.',
    labPlan:
        'Test B12 when symptoms, anemia/macrocytosis, neuropathy, pregnancy concerns, malabsorption or uncertainty about long-term adequacy make the result useful. MMA can help confirm borderline B12 in appropriate patients.',
    duration:
        'A reliable source is needed as long as the strict vegan diet continues.',
    reviewStopRule:
        'Do not stop B12 simply because symptoms are absent; prevention depends on a reliable ongoing source.',
    sourceLabel: 'NIH ODS Vitamin B12',
  ),
  NeedPathway(
    id: 'age50plus-b12',
    title: 'Older adult — B12 source changes',
    who: 'Adults over 50, especially with reduced gastric acid, atrophic gastritis or acid-suppressing medicines.',
    tier: NeedActionTier.preventive,
    coreDecision:
        'Food-bound B12 absorption may decline with age. Recommended B12 should come mainly from fortified foods or supplements rather than relying only on naturally protein-bound B12.',
    supplementPlan:
        'No universal high-dose tablet is required. Use fortified foods or a supplement sufficient to meet the age-appropriate intake; deficiency treatment is a separate pathway.',
    dailyTarget:
        'Adult RDA remains 2.4 mcg/day total.',
    labPlan:
        'Test when anemia, neuropathy, cognitive/neurologic symptoms, malabsorption or medication risks make deficiency plausible.',
    duration:
        'Ongoing dietary strategy; reassess if a deficiency diagnosis or absorption disorder changes the plan.',
    reviewStopRule:
        'Do not confuse “better source form for absorption” with a requirement for megadoses in every older adult.',
    sourceLabel: 'NIH ODS MVM + NIH ODS Vitamin B12',
  ),
  NeedPathway(
    id: 'age75plus-vitd',
    title: 'Age 75 years or older — vitamin D',
    who: 'Generally healthy adults age 75+ without another established vitamin D treatment indication.',
    tier: NeedActionTier.preventive,
    coreDecision:
        'Endocrine Society 2024 suggests empiric vitamin D in adults 75+ and prefers daily lower-dose use over intermittent high doses.',
    supplementPlan:
        'Aim to meet the age-appropriate daily intake; age >70 RDA is 800 IU/day total. Empiric intake can include fortified foods, a multivitamin and/or a daily supplement.',
    dailyTarget:
        '800 IU/day vitamin D total for adults over 70; do not convert this into repeated high-dose boluses.',
    labPlan:
        'Routine 25-OH vitamin D testing is NOT required solely to start this preventive pathway in healthy adults 75+.',
    duration:
        'Ongoing while age-based preventive indication applies, with medication/renal/calcium review when clinically relevant.',
    reviewStopRule:
        'If a separate disease or deficiency indication exists, move to the disease-specific treatment pathway.',
    sourceLabel: 'Endocrine Society Vitamin D Guideline 2024 + NIH ODS Vitamin D',
  ),
  NeedPathway(
    id: 'metformin-b12',
    title: 'Long-term metformin',
    who: 'People using metformin chronically, especially with anemia, neuropathy or long treatment duration.',
    tier: NeedActionTier.testFirst,
    coreDecision:
        'Metformin increases B12-deficiency risk. The correct default action is PERIODIC ASSESSMENT, not automatic high-dose B12 for everyone.',
    supplementPlan:
        'Supplement B12 if intake is inadequate or deficiency is found; use the B12 treatment module when deficiency is confirmed.',
    dailyTarget:
        'Meet normal age/life-stage B12 intake while monitoring risk. Do not use %DV as proof that deficiency treatment is adequate.',
    labPlan:
        'ADA 2026 recommends periodic B12 assessment with long-term metformin, especially with anemia or peripheral neuropathy; its comprehensive evaluation table flags B12 testing after >5 years, while older-adult guidance notes annual monitoring after >4 years.',
    duration:
        'Monitoring continues with long-term metformin; treatment duration depends on whether deficiency and ongoing risk are present.',
    reviewStopRule:
        'Do not attribute neuropathy automatically to diabetes if B12 deficiency has not been considered.',
    sourceLabel: 'ADA Standards of Care in Diabetes 2026 + NIH ODS Vitamin B12',
  ),
  NeedPathway(
    id: 'longterm-ppi',
    title: 'Long-term proton pump inhibitor',
    who: 'People on prolonged PPI therapy, especially with other magnesium/B12 risk factors.',
    tier: NeedActionTier.testFirst,
    coreDecision:
        'Long-term PPIs can lower magnesium and reduce food-B12 absorption. This creates a monitoring question, not an automatic magnesium/B12 prescription.',
    supplementPlan:
        'Do not pre-emptively add high-dose magnesium or B12 to everyone. Supplement/treat only when intake or measured status indicates a problem.',
    dailyTarget:
        'Continue normal nutrient targets; focus on whether medication-associated deficiency actually develops.',
    labPlan:
        'For prolonged PPI use, FDA/NIH ODS advises considering serum magnesium before long-term therapy and periodically in at-risk patients. Test B12 when symptoms or other risk factors justify it.',
    duration:
        'As long as medication risk persists; reassess whether the PPI itself remains indicated as part of clinical care.',
    reviewStopRule:
        'If hypomagnesemia does not correct with supplementation, medication review may be necessary rather than simply escalating magnesium.',
    sourceLabel: 'NIH ODS Magnesium + NIH ODS Vitamin B12',
  ),
  NeedPathway(
    id: 'bariatric-malabsorption',
    title: 'Bariatric surgery / chronic malabsorption',
    who: 'Post-bariatric patients or people with clinically important malabsorption.',
    tier: NeedActionTier.protocol,
    coreDecision:
        'This group often truly needs lifelong supplementation and laboratory surveillance, but the exact regimen depends on the operation, anatomy, disease and time since surgery.',
    supplementPlan:
        'Use a bariatric/procedure-specific multivitamin and nutrient plan. Do NOT apply one generic iron/calcium/B12 dose to sleeve, RYGB, BPD/DS and other malabsorptive conditions.',
    dailyTarget:
        'Protocol-based; common nutrients requiring attention include thiamin, B12, folate, iron, vitamin D, calcium and fat-soluble vitamins, but exact doses differ by procedure/risk.',
    labPlan:
        'Use procedure-specific surveillance rather than a random wellness panel; trend micronutrients and treat documented deficiencies promptly.',
    duration:
        'Usually long-term/lifelong after bariatric procedures, with regimen changes based on surgery type, labs, pregnancy and tolerance.',
    reviewStopRule:
        'Vomiting, neurologic symptoms or rapid weight loss can make thiamin deficiency urgent; do not wait for a routine supplement visit.',
    sourceLabel: 'ASMBS Integrated Health Nutritional Guidelines — Micronutrients',
  ),
  NeedPathway(
    id: 'confirmed-iron-deficiency',
    title: 'Confirmed iron deficiency / iron-deficiency anemia',
    who: 'Patient with laboratory-confirmed deficiency or a clinician diagnosis.',
    tier: NeedActionTier.treatment,
    coreDecision:
        'This is TREATMENT, not a daily wellness supplement. Find the cause and treat with elemental iron according to the clinical pathway.',
    supplementPlan:
        'Use the Mineral Clinical Toolkit for the selected iron salt, elemental dose, frequency, administration and interactions. Therapeutic doses can exceed the healthy-population UL under supervision.',
    dailyTarget:
        'The RDA is NOT the treatment dose. Treatment dose is based on deficiency severity, formulation, tolerance and response.',
    labPlan:
        'CBC and ferritin are common starting tests; inflammation and the underlying cause can change interpretation and additional studies.',
    duration:
        'Continue until hematologic correction and iron-store repletion according to the treatment plan; reassess cause and response.',
    reviewStopRule:
        'Do not continue high-dose iron indefinitely after correction without confirming ongoing need.',
    sourceLabel: 'NIH ODS Iron + condition-specific iron treatment pathway',
  ),
  NeedPathway(
    id: 'confirmed-b12-deficiency',
    title: 'Confirmed vitamin B12 deficiency',
    who: 'Low B12 with compatible clinical/laboratory context, pernicious anemia or significant malabsorption.',
    tier: NeedActionTier.treatment,
    coreDecision:
        'Deficiency treatment is not the 2.4 mcg RDA. Dose and route depend on severity, neurologic symptoms and whether absorption is impaired.',
    supplementPlan:
        'Use the Vitamin Clinical Toolkit/B12 treatment pathway. High-dose oral or parenteral therapy may be appropriate depending on the cause; do not copy a wellness dose.',
    dailyTarget:
        'RDA remains 2.4 mcg/day for normal intake, but this number is NOT a deficiency-treatment dose.',
    labPlan:
        'Serum/plasma B12 is the first-line test; MMA can help confirm borderline values in appropriate patients, remembering renal impairment can raise MMA.',
    duration:
        'Cause-specific. Irreversible malabsorption/pernicious anemia can require lifelong replacement; reversible dietary deficiency may not.',
    reviewStopRule:
        'Neurologic symptoms require prompt treatment/evaluation; do not delay while trying a low-dose multivitamin.',
    sourceLabel: 'NIH ODS Vitamin B12',
  ),
  NeedPathway(
    id: 'low-calcium-bone-risk',
    title: 'Low calcium intake / osteoporosis risk',
    who: 'Adults with low dietary calcium or a bone-health indication.',
    tier: NeedActionTier.foodFirst,
    coreDecision:
        'Calcium target is a TOTAL intake goal. Serum calcium does not tell you whether the diet supplies enough calcium.',
    supplementPlan:
        'Estimate dietary calcium first, then supplement only the uncovered gap. Choose elemental dose and salt based on patient factors.',
    dailyTarget:
        'Typical adult target: 1,000 mg/day; women 51–70 and adults 71+ generally 1,200 mg/day total.',
    labPlan:
        'Do not order serum calcium to estimate dietary calcium adequacy. Bone/renal/PTH/vitamin D testing follows the clinical bone-health question.',
    duration:
        'As long as the intake gap persists; recalculate when diet changes.',
    reviewStopRule:
        'Avoid adding a full 1,000–1,200 mg supplement on top of adequate dietary calcium.',
    sourceLabel: 'NIH ODS Calcium',
  ),
  NeedPathway(
    id: 'ckd-mineral-safety',
    title: 'Chronic kidney disease / impaired renal function',
    who: 'CKD, reduced eGFR or kidney failure.',
    tier: NeedActionTier.avoidSelfSupplement,
    coreDecision:
        'Do not self-prescribe potassium, magnesium or broad mineral blends. Renal handling and medication interactions can make ordinary supplement doses unsafe.',
    supplementPlan:
        'Use kidney-stage, laboratory and medication-specific decisions. A renal diet/supplement plan may be needed, but it is NOT a generic OTC pathway.',
    dailyTarget:
        'General-population RDAs cannot be converted directly into supplement doses in CKD.',
    labPlan:
        'Use renal function and relevant electrolytes/mineral-bone markers as clinically indicated.',
    duration:
        'Ongoing clinician-guided review.',
    reviewStopRule:
        'Stop and review any potassium/magnesium product when kidney function worsens, hyperkalemia/hypermagnesemia risk rises or interacting medicines change.',
    sourceLabel: 'NIH ODS Magnesium + renal-specific care principles',
  ),
];

NeedPathway needPathway(String id) {
  return needPathways.singleWhere((item) => item.id == id);
}

const healthyLabRules = <HealthyLabRule>[
  HealthyLabRule(
    test: 'Broad “vitamin panel”',
    routineHealthyUse: 'NO.',
    whenUseful:
        'Order only specific nutrients when symptoms, diet, disease, surgery or medicines create a plausible deficiency question.',
    doNotMisread:
        'More tests are not automatically safer; low-yield screening can create incidental results and unnecessary supplements.',
    sourceLabel: 'NIH ODS',
  ),
  HealthyLabRule(
    test: '25-OH vitamin D',
    routineHealthyUse: 'NO routine screening in healthy adults.',
    whenUseful:
        'Use for established clinical indications such as disorders affecting calcium/vitamin D metabolism, malabsorption or a specific treatment question.',
    doNotMisread:
        'A healthy person does not need a vitamin D test merely to decide whether to meet the normal RDA.',
    sourceLabel: 'Endocrine Society Vitamin D Guideline 2024',
  ),
  HealthyLabRule(
    test: 'CBC + ferritin / iron studies',
    routineHealthyUse: 'Not a universal supplement screen.',
    whenUseful:
        'Anemia symptoms, heavy blood loss/menstruation, pregnancy context, restrictive diet, GI blood loss risk or other iron-deficiency risk.',
    doNotMisread:
        'Ferritin can rise with inflammation; iron treatment should include a cause, not just a low number.',
    sourceLabel: 'NIH ODS Iron',
  ),
  HealthyLabRule(
    test: 'Vitamin B12 ± MMA',
    routineHealthyUse: 'Not required for every healthy omnivore.',
    whenUseful:
        'Vegan diet with uncertain adequacy, anemia/macrocytosis, neuropathy, long-term metformin, gastric/intestinal surgery, malabsorption or acid-suppression risk.',
    doNotMisread:
        'MMA can help with borderline B12, but renal impairment can raise MMA independently.',
    sourceLabel: 'NIH ODS Vitamin B12 + ADA 2026',
  ),
  HealthyLabRule(
    test: 'Serum calcium',
    routineHealthyUse: 'NO for checking dietary calcium adequacy.',
    whenUseful:
        'Suspected calcium/PTH/vitamin D/renal/bone-metabolism disorder.',
    doNotMisread:
        'Normal serum calcium does not prove adequate calcium intake; serum calcium is tightly regulated.',
    sourceLabel: 'NIH ODS Calcium',
  ),
  HealthyLabRule(
    test: 'Serum magnesium',
    routineHealthyUse: 'NO routine wellness test.',
    whenUseful:
        'Symptoms/risk, prolonged PPI use, relevant diuretics, GI losses, arrhythmia/electrolyte questions or renal safety assessment.',
    doNotMisread:
        'Serum magnesium is useful clinically but does not perfectly reflect total-body stores.',
    sourceLabel: 'NIH ODS Magnesium',
  ),
  HealthyLabRule(
    test: 'Zinc / iodine screening',
    routineHealthyUse: 'NO routine wellness testing.',
    whenUseful:
        'Targeted specialist/nutrition evaluation when a specific deficiency or thyroid/iodine question exists.',
    doNotMisread:
        'Serum zinc has multiple confounders, and a single spot urinary iodine is mainly a population tool rather than a reliable individual iodine diagnosis.',
    sourceLabel: 'NIH ODS Zinc + NIH ODS Iodine',
  ),
];

const needMatrixGlobalRules = <String>[
  'Daily requirement ≠ supplement dose ≠ deficiency-treatment dose ≠ %DV.',
  'For a healthy person, supplement dose is usually the uncovered dietary gap — and the gap can be zero.',
  'Routine prevention is reserved for defined evidence-based situations such as folic acid with pregnancy potential and vitamin D for breastfed infants.',
  'A disease, surgery or medication can create a testing/protocol question without automatically creating a supplement prescription.',
  'Do not use a multivitamin to hide unexplained anemia, neuropathy, weight loss, malabsorption, bleeding or other symptoms that need diagnosis.',
];
