import '../domain/expanded_supplement_models.dart';

const combinationExpandedProfiles = <ExpandedSupplementProfile>[
  ExpandedSupplementProfile(
    id: 'combo-basic-mvm',
    section: ExpandedSupplementSection.combinations,
    name: 'Basic Multivitamin / Multimineral',
    subtitle: 'Gap-filler, not a disease-treatment formula',
    coreRule:
        'There is no standard legal formula for “multivitamin.” Audit the exact Supplement Facts instead of assuming two brands are equivalent.',
    whyUsed:
        'May help fill small dietary gaps in selected adults with restricted or inconsistent diets. It is not a substitute for food quality and is not automatically needed by every healthy adult.',
    evidence: ExpandedEvidence.contextSpecific,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Healthy adult with adequate diet',
        population: 'Generally healthy adults',
        dose: 'No established routine supplemental dose.',
        timing: 'Food first; a basic once-daily product can be used if a dietary gap is identified or preferred.',
        duration: 'Reassess diet and duplication periodically.',
        note: 'The value is gap-filling, not megadosing.',
      ),
      ExpandedDosePathway(
        title: 'Restricted or low-quality diet',
        population: 'Adults with multiple likely micronutrient gaps',
        dose:
            'Choose a product providing roughly daily-value-level amounts rather than high-potency multiples unless a specific deficiency requires separate treatment.',
        timing: 'Usually with food for tolerance.',
        duration: 'While the dietary limitation persists, with periodic reassessment.',
        note: 'A multivitamin cannot replace treatment doses for documented deficiency.',
      ),
    ],
    administration: [
      'Take with a meal if nausea occurs.',
      'Count overlapping vitamin D, zinc, B6, folic acid, vitamin A and iron from all products.',
    ],
    commonActionable: ['Nausea can occur, especially with iron-containing products on an empty stomach.'],
    interactions: [
      'Vitamin K can interfere with warfarin management if intake changes abruptly.',
      'Minerals can bind some medicines; spacing follows the interacting medicine.',
    ],
    monitoring: ['No routine “multivitamin blood panel” is required in healthy users.'],
    avoidOrRefer: [
      'Megadose products, unexplained anemia, malabsorption, kidney disease or pregnancy require a more specific plan.',
    ],
    labelChecks: [
      'Iron present or iron-free',
      'Preformed vitamin A vs beta-carotene',
      'B6, zinc and vitamin D totals',
      'Vitamin K if warfarin is used',
    ],
    sourceLabel: 'NIH ODS Multivitamin/mineral Supplements Fact Sheet',
    searchTerms: ['multivitamin', 'multimineral', 'once daily'],
  ),
  ExpandedSupplementProfile(
    id: 'combo-prenatal',
    section: ExpandedSupplementSection.combinations,
    name: 'Prenatal Multivitamin',
    subtitle: 'Audit the label — “prenatal” does not guarantee complete coverage',
    coreRule:
        'Prenatal formulas vary widely. Check folic acid/folate, iron, iodine, vitamin D and choline rather than trusting the word “prenatal.”',
    whyUsed:
        'Supports pregnancy-specific nutrient needs and neural-tube-defect prevention when started before conception.',
    evidence: ExpandedEvidence.strong,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Standard preconception folic-acid prevention',
        population: 'People who can become pregnant',
        dose: '400–800 mcg/day folic acid from supplements/fortified foods is the standard prevention range used by major guidance.',
        timing: 'Begin before conception and continue through early pregnancy; prenatal use usually continues through pregnancy.',
        duration: 'Preconception through pregnancy; postpartum plan is individualized.',
        note:
            'Pregnancy folate RDA is 600 mcg DFE/day TOTAL intake. Folic acid amount and DFE are not the same label concept.',
      ),
      ExpandedDosePathway(
        title: 'Pregnancy iron target',
        population: 'Pregnancy',
        dose: 'RDA 27 mg/day iron TOTAL intake; many prenatal products provide approximately this amount.',
        timing: 'Take according to product tolerance; therapeutic iron deficiency dosing is separate.',
        duration: 'During pregnancy if needed.',
        note: 'A prenatal dose is not adequate treatment for every case of iron-deficiency anemia.',
      ),
      ExpandedDosePathway(
        title: 'Iodine supplement component',
        population: 'Planning pregnancy / pregnancy / lactation',
        dose: 'Many professional groups recommend a prenatal supplement containing 150 mcg iodine/day, usually as potassium iodide.',
        timing: 'Daily.',
        duration: 'Preconception through pregnancy/lactation when appropriate.',
        note: 'Thyroid disease requires individualized review.',
      ),
    ],
    administration: [
      'If nausea occurs, try taking with food or at bedtime unless the exact formulation says otherwise.',
      'Do not double a missed dose if that would create a large iron/vitamin A intake.',
    ],
    commonActionable: ['Iron commonly causes nausea/constipation; gummies may avoid iron but then leave an iron gap.'],
    interactions: [
      'Iron/calcium can interfere with levothyroxine and some antibiotics; use medicine-specific separation.',
    ],
    monitoring: [
      'Pregnancy labs and deficiency testing are clinician-directed; the prenatal label does not replace antenatal care.',
    ],
    avoidOrRefer: [
      'Previous neural-tube-defect pregnancy, antiseizure medicines, malabsorption, severe anemia or bariatric surgery needs a specialized regimen.',
    ],
    labelChecks: [
      'Folic acid amount vs mcg DFE',
      'Iron mg',
      'Iodine mcg and source',
      'Choline mg — often low/absent',
      'Vitamin A form',
      'Vitamin D amount',
    ],
    sourceLabel: 'NIH ODS Dietary Supplements and Life Stages: Pregnancy',
    searchTerms: ['prenatal', 'pregnancy', 'folic acid', 'iodine', 'iron'],
  ),
  ExpandedSupplementProfile(
    id: 'combo-prenatal-gummy',
    section: ExpandedSupplementSection.combinations,
    name: 'Prenatal Gummies',
    subtitle: 'Convenient, but often incomplete',
    coreRule:
        'Many prenatal gummies contain no iron and little/no choline. Never assume gummies are nutritionally equivalent to tablets/capsules.',
    whyUsed:
        'Chosen for swallowing difficulty or nausea, but the easier formulation may omit bulky or metallic-tasting nutrients.',
    evidence: ExpandedEvidence.contextSpecific,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Use as prenatal',
        population: 'Pregnancy-capable people who prefer gummies',
        dose: 'Follow the exact serving size; no universal gummy dose exists.',
        timing: 'Daily according to the label.',
        duration: 'As part of the prenatal plan.',
        note:
            'Audit iron, iodine, folic acid/folate, vitamin D and choline. Missing nutrients may require diet or separate supplementation.',
      ),
    ],
    administration: [
      'Count how many gummies make one serving — many labels require 2–4 pieces.',
      'Keep out of children’s reach; candy-like appearance increases accidental ingestion risk.',
    ],
    commonActionable: ['Added sugars, GI upset and dental exposure can matter.'],
    interactions: [],
    monitoring: ['Same antenatal monitoring as other prenatal regimens.'],
    avoidOrRefer: ['Do not self-add iron or iodine without checking the current prenatal and clinical context.'],
    labelChecks: ['iron often absent', 'choline often absent/low', 'iodine', 'serving size', 'folic acid/DFE'],
    sourceLabel: 'NIH ODS Pregnancy Fact Sheet + current prenatal-label principles',
    searchTerms: ['prenatal gummy', 'gummies', 'pregnancy vitamin'],
  ),
  ExpandedSupplementProfile(
    id: 'combo-areds2',
    section: ExpandedSupplementSection.combinations,
    name: 'AREDS2 Formula',
    subtitle: 'Specific AMD formula — not a generic eye multivitamin',
    coreRule:
        'Use only when an eye-care professional identifies an AREDS2-appropriate stage of age-related macular degeneration.',
    whyUsed:
        'Reduces risk of progression to advanced AMD in appropriate patients; it does not prevent AMD in everyone and does not restore lost vision.',
    evidence: ExpandedEvidence.strong,
    dosePathways: [
      ExpandedDosePathway(
        title: 'AREDS2 daily formula',
        population: 'Appropriate intermediate/advanced AMD categories under eye-care guidance',
        dose:
            'Vitamin C 500 mg + vitamin E 400 IU + zinc 80 mg + copper 2 mg + lutein 10 mg + zeaxanthin 2 mg daily.',
        timing: 'Use the labeled divided or daily regimen with food if needed for tolerance.',
        duration: 'Long-term if recommended by the eye-care professional.',
        note:
            'Choose AREDS2 rather than older beta-carotene-containing formulas for current/former smokers.',
      ),
    ],
    administration: ['Use the complete formula; do not recreate it by casually stacking multiple eye products.'],
    commonActionable: ['High zinc can cause GI upset; the formula is intentionally high-potency and disease-specific.'],
    interactions: ['Review high-dose vitamin E and zinc in patients with complex medicines or surgery plans.'],
    monitoring: ['Ophthalmology follow-up and visual symptoms.'],
    avoidOrRefer: ['New distortion, sudden visual loss or acute eye symptoms need urgent assessment.'],
    labelChecks: ['true AREDS2 amounts', 'NO beta-carotene for current/former smokers', 'zinc/copper balance'],
    sourceLabel: 'National Eye Institute AREDS2 guidance',
    searchTerms: ['AREDS', 'macular degeneration', 'eye vitamin'],
  ),
  ExpandedSupplementProfile(
    id: 'combo-high-potency-b',
    section: ExpandedSupplementSection.combinations,
    name: 'High-Potency B-Complex (B50 / B100)',
    subtitle: 'Marketed strength ≠ physiologic requirement',
    coreRule:
        'B50/B100 products are not “daily needs.” They can deliver chronically excessive B6 and other B vitamins without a clear indication.',
    whyUsed:
        'Often marketed for energy, stress, nerves or hair. Most healthy adults do not need high multiples of daily requirements.',
    evidence: ExpandedEvidence.notRecommended,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Routine wellness',
        population: 'Healthy adults',
        dose: 'No established routine supplemental dose for B50/B100 products.',
        timing: 'Do not use potency branding as a dosing target.',
        duration: 'Avoid indefinite high-potency use without a specific indication.',
        note:
            'B6 is the major chronic-toxicity concern; neuropathy can occur with excessive long-term intake.',
      ),
    ],
    administration: ['Take with food if nausea occurs, but the larger issue is whether the product is needed at all.'],
    commonActionable: ['Bright-yellow urine from riboflavin is harmless; neuropathy from chronic B6 excess is not.'],
    interactions: ['Levodopa without carbidopa can interact with pyridoxine/B6.'],
    monitoring: ['Review total B6 across multivitamins, energy products, magnesium products and nerve supplements.'],
    avoidOrRefer: ['Tingling/numbness while using B6-containing products requires stopping excess exposure and clinical evaluation.'],
    labelChecks: ['B6 mg', 'niacin form/dose', 'folic acid', 'biotin', 'duplicate B products'],
    sourceLabel: 'NIH ODS Vitamin B6 + EFSA 2023 B6 UL context',
    searchTerms: ['B50', 'B100', 'B complex', 'energy vitamin'],
  ),
  ExpandedSupplementProfile(
    id: 'combo-bone-support',
    section: ExpandedSupplementSection.combinations,
    name: 'Calcium + Vitamin D ± Vitamin K Bone Formula',
    subtitle: 'Useful only when the patient has a calcium/vitamin-D gap or specific bone plan',
    coreRule:
        'Do not automatically pair high-dose calcium with vitamin D. Count dietary calcium and separate nutrient targets.',
    whyUsed:
        'Used for bone-health supplementation when dietary calcium is low and vitamin D intake/status requires support.',
    evidence: ExpandedEvidence.contextSpecific,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Calcium gap',
        population: 'Adults not meeting calcium needs from food',
        dose:
            'Supplement only the dietary gap; keep individual elemental-calcium doses around 500 mg or less for best absorption.',
        timing: 'Carbonate with food; citrate with or without food.',
        duration: 'While the gap persists.',
        note: 'Total calcium = food + fortified food + supplement.',
      ),
      ExpandedDosePathway(
        title: 'Vitamin D component',
        population: 'Adults using a combined bone product',
        dose:
            'Use the age/condition-appropriate vitamin D target; the combination product does not create a new universal dose.',
        timing: 'Daily lower-dose regimens are generally preferred over unindicated intermittent megadoses.',
        duration: 'Reassess indication and total vitamin D intake.',
        note: 'Deficiency treatment is a separate clinician-directed pathway.',
      ),
    ],
    administration: ['Split large calcium totals rather than taking all at once.'],
    commonActionable: ['Calcium carbonate can cause constipation/bloating.'],
    interactions: [
      'Separate calcium from levothyroxine by about 4 hours and from interacting antibiotics/bisphosphonates according to their instructions.',
      'Vitamin K requires consistency/review with warfarin.',
    ],
    monitoring: ['Diet, kidney-stone history and disease-specific bone monitoring.'],
    avoidOrRefer: ['Hypercalcemia, kidney stones, advanced kidney disease or unexplained osteoporosis requires clinician review.'],
    labelChecks: ['elemental calcium', 'carbonate vs citrate', 'vitamin D IU/mcg', 'vitamin K form/dose'],
    sourceLabel: 'NIH ODS Calcium + Vitamin D + Vitamin K Fact Sheets',
    searchTerms: ['bone formula', 'calcium D3 K2', 'K2'],
  ),
  ExpandedSupplementProfile(
    id: 'combo-iron-vitc',
    section: ExpandedSupplementSection.combinations,
    name: 'Iron + Vitamin C Combination',
    subtitle: 'Elemental iron determines the dose',
    coreRule:
        'Vitamin C can improve nonheme iron absorption, but the clinical iron dose is based on elemental iron and the indication.',
    whyUsed:
        'Convenient combination for selected patients taking oral iron, especially when the product simplifies adherence.',
    evidence: ExpandedEvidence.contextSpecific,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Iron deficiency treatment',
        population: 'Confirmed/suspected iron deficiency',
        dose:
            'No universal combo-product dose. Match the elemental iron amount to the clinician-directed iron regimen; vitamin C does not define the treatment dose.',
        timing:
            'Iron is best absorbed on an empty stomach, but can be taken with a small amount of food if GI upset limits adherence.',
        duration: 'Continue until iron stores and the underlying cause are appropriately addressed.',
        note: 'Do not dose by ferrous-salt weight.',
      ),
    ],
    administration: ['Keep calcium, milk and antacids away from the iron dose when possible.'],
    commonActionable: ['Constipation, nausea and dark stools are common.'],
    interactions: ['Iron interacts with levothyroxine, tetracyclines, quinolones and several other medicines; use medicine-specific spacing.'],
    monitoring: ['CBC, ferritin and cause evaluation when treating deficiency.'],
    avoidOrRefer: ['Unexplained anemia or iron overload disorders require evaluation before supplementation.'],
    labelChecks: ['ELEMENTAL iron mg', 'ferrous salt', 'vitamin C mg', 'other minerals'],
    sourceLabel: 'NIH ODS Iron + MedlinePlus iron administration',
    searchTerms: ['iron with vitamin C', 'ferrous ascorbate', 'anemia'],
  ),
  ExpandedSupplementProfile(
    id: 'combo-senior-mvm',
    section: ExpandedSupplementSection.combinations,
    name: 'Older-Adult / 50+ Multivitamin',
    subtitle: 'Age-marketing does not replace a nutrient-gap assessment',
    coreRule:
        'A “50+” label often changes iron, B12, vitamin D and other amounts, but there is no single standard senior formula.',
    whyUsed:
        'Can be useful when diet is limited or age-related intake/absorption risks make several nutrient gaps plausible.',
    evidence: ExpandedEvidence.contextSpecific,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Routine use',
        population: 'Generally healthy older adults',
        dose: 'No established universal routine multivitamin dose.',
        timing: 'Use a basic once-daily product only if it helps fill actual dietary gaps.',
        duration: 'Reassess diet, medicines and duplication periodically.',
        note:
            'B12 from fortified foods/supplements becomes particularly relevant with age because food-bound B12 absorption can decline.',
      ),
    ],
    administration: ['Take with food if needed for tolerance.'],
    commonActionable: [],
    interactions: ['Vitamin K/warfarin and mineral-drug interactions remain relevant.'],
    monitoring: ['Target B12, vitamin D, iron and other labs to risk factors rather than the marketing category.'],
    avoidOrRefer: ['Avoid iron-containing “senior” products unless iron is appropriate; many older adults do not need extra iron.'],
    labelChecks: ['iron or iron-free', 'B12', 'vitamin D', 'vitamin K', 'zinc'],
    sourceLabel: 'NIH ODS Multivitamin + Vitamin B12 Fact Sheets',
    searchTerms: ['50+', 'senior multivitamin', 'older adult'],
  ),
  ExpandedSupplementProfile(
    id: 'combo-vegan-mvm',
    section: ExpandedSupplementSection.combinations,
    name: 'Vegan Multinutrient Formula',
    subtitle: 'B12 is mandatory; iodine, vitamin D, calcium, iron and zinc depend on the diet',
    coreRule:
        'A vegan label does not guarantee adequate B12 or balanced minerals. Audit the diet and the exact formula.',
    whyUsed:
        'Convenient way to cover common vegan dietary gaps, especially B12, when fortified-food intake is inconsistent.',
    evidence: ExpandedEvidence.contextSpecific,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Strict vegan diet',
        population: 'Adults avoiding all animal foods',
        dose:
            'No universal combo dose. Ensure a reliable B12 source; use iodine, vitamin D, calcium, iron, zinc and omega-3 only according to dietary gap/risk.',
        timing: 'Daily or according to the exact B12/product schedule.',
        duration: 'Ongoing while the diet creates the gap.',
        note: 'Menstruating adults and pregnancy require a more specific plan.',
      ),
    ],
    administration: ['Do not assume plant-based iron/zinc intake equals absorbed intake; diet composition matters.'],
    commonActionable: ['High zinc without copper balance and excess iodine are common formulation problems.'],
    interactions: ['Mineral-drug interactions depend on the ingredients present.'],
    monitoring: ['B12 status and other labs when risk/symptoms indicate.'],
    avoidOrRefer: ['Pregnancy, anemia, neuropathy or severe dietary restriction requires clinician/dietitian review.'],
    labelChecks: ['B12', 'iodine', 'vitamin D', 'iron', 'zinc', 'calcium', 'algal DHA if included'],
    sourceLabel: 'NIH ODS nutrient fact sheets + evidence-based vegan nutrition principles',
    searchTerms: ['vegan vitamin', 'plant based multivitamin'],
  ),
  ExpandedSupplementProfile(
    id: 'combo-bariatric-mvm',
    section: ExpandedSupplementSection.combinations,
    name: 'Bariatric Multivitamin',
    subtitle: 'Surgery-specific lifelong nutrition — not a standard OTC multivitamin',
    coreRule:
        'After bariatric surgery, nutrient needs depend on the procedure. Use a bariatric protocol/product; ordinary multivitamins may be inadequate.',
    whyUsed:
        'Prevents predictable deficiencies after procedures that reduce intake and/or absorption.',
    evidence: ExpandedEvidence.strong,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Post-bariatric maintenance',
        population: 'After sleeve gastrectomy, gastric bypass or other bariatric procedure',
        dose: 'No single universal dose across all procedures; follow the bariatric team’s surgery-specific micronutrient protocol.',
        timing: 'Daily lifelong regimen with product-specific mineral spacing.',
        duration: 'Long term/lifelong.',
        note:
            'Iron, B12, folate, thiamine, calcium citrate, vitamin D and fat-soluble vitamins may require separate or higher amounts depending on procedure/labs.',
      ),
    ],
    administration: ['Calcium and iron are usually separated; exact timing follows the bariatric plan.'],
    commonActionable: ['Pill burden, nausea and constipation often impair adherence.'],
    interactions: [],
    monitoring: ['Regular surgery-specific micronutrient laboratory surveillance is essential.'],
    avoidOrRefer: ['Vomiting, rapid weight loss, neuropathy/confusion or inability to take supplements can signal thiamine deficiency and needs urgent care.'],
    labelChecks: ['bariatric-specific dosing', 'thiamine', 'B12', 'iron', 'folate', 'vitamin D', 'vitamin A/K/E', 'copper/zinc'],
    sourceLabel: 'ASMBS bariatric micronutrient guidance',
    searchTerms: ['gastric bypass vitamins', 'sleeve vitamins', 'bariatric'],
  ),
];

ExpandedSupplementProfile combinationExpandedProfile(String id) =>
    combinationExpandedProfiles.singleWhere((item) => item.id == id);
