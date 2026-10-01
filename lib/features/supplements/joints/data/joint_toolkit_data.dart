import '../domain/joint_toolkit_models.dart';

const jointSupplementProfiles = <JointSupplementProfile>[
  JointSupplementProfile(
    id: 'glucosamine',
    name: 'Glucosamine',
    category: 'Osteoarthritis / cartilage',
    coreRule:
        'Glucosamine sulfate and glucosamine hydrochloride are NOT interchangeable evidence-wise. The best-known positive trials used specific glucosamine sulfate preparations; major guidelines disagree on clinical usefulness.',
    forms: [
      JointForm(
        name: 'Glucosamine sulfate',
        meaning:
            'The form used in several positive trials; prescription crystalline glucosamine sulfate in Europe should not be assumed equivalent to every retail powder/capsule.',
      ),
      JointForm(
        name: 'Glucosamine hydrochloride',
        meaning:
            'Used in the large GAIT trial; do not transfer evidence from crystalline sulfate automatically to HCl.',
      ),
    ],
    uses: [
      JointUse(
        indication: 'Symptomatic knee osteoarthritis — trial context',
        population: 'Adults with diagnosed knee OA after exercise/weight/standard options are addressed',
        form: 'Glucosamine sulfate',
        dose: '1,500 mg/day in major randomized trials.',
        frequency: 'Often 1,500 mg once daily in sulfate trials.',
        duration:
            'Assess response after about 8–12 weeks; major trials ranged from 12 weeks to 6 months.',
        exactUse:
            'Use one clearly identified formulation. Record baseline pain/function. Stop if there is no meaningful benefit rather than continuing indefinitely.',
        evidence: JointEvidence.conflicting,
        caveat:
            'ACR/AF recommends against glucosamine for knee/hip/hand OA, while AAOS lists it as a possible option with inconsistent evidence and ESCEO distinguishes prescription crystalline sulfate from other formulations.',
        sourceLabel: 'NCCIH Glucosamine/Chondroitin + glucosamine sulfate RCTs',
      ),
    ],
    safety: [
      'Warfarin: glucosamine/chondroitin products have been associated with increased bleeding/INR; require anticoagulation review.',
      'Glucosamine may raise blood glucose in some people; diabetes does not automatically prohibit it, but glucose control should not be ignored.',
      'Pregnancy/breastfeeding safety is insufficient for routine self-use.',
      'Source may be shellfish-derived or fermentation-derived; verify the exact product for severe allergy or dietary/religious preferences.',
    ],
  ),
  JointSupplementProfile(
    id: 'chondroitin',
    name: 'Chondroitin sulfate',
    category: 'Osteoarthritis / cartilage',
    coreRule:
        'Chondroitin evidence is product- and joint-specific. A positive hand-OA trial does not prove every retail chondroitin product works for knee OA.',
    forms: [
      JointForm(
        name: 'Chondroitin sulfate',
        meaning:
            'Pharmaceutical-grade and retail products can differ in purity/content; evidence should follow the tested preparation.',
      ),
    ],
    uses: [
      JointUse(
        indication: 'Hand osteoarthritis — guideline-supported option with limited evidence',
        population: 'Adults with symptomatic hand OA',
        form: 'Chondroitin sulfate',
        dose: '800 mg once daily in the key 6-month hand-OA trial.',
        frequency: 'Once daily.',
        duration: '6 months in the cited hand-OA trial.',
        exactUse:
            'Use only after confirming the patient actually has hand OA and set a symptom/function target for reassessment.',
        evidence: JointEvidence.moderate,
        caveat:
            'ACR/AF conditionally recommends chondroitin for hand OA, but strongly recommends against it for knee/hip OA; other organizations differ.',
        sourceLabel: 'NCCIH Arthritis Digest + hand-OA RCT',
      ),
      JointUse(
        indication: 'Knee osteoarthritis — study-dose context',
        population: 'Adults considering a time-limited knee-OA supplement trial',
        form: 'Chondroitin sulfate',
        dose: '800–1,200 mg/day has been used in major knee-OA trials.',
        frequency: 'Once daily or divided depending on the exact studied/product preparation.',
        duration: 'Common trials: 3–6 months or longer.',
        exactUse:
            'Do not promise cartilage rebuilding. Reassess pain/function and stop if ineffective.',
        evidence: JointEvidence.conflicting,
        caveat:
            'High-quality studies and guidelines conflict; retail products should not be assumed equivalent to pharmaceutical-grade preparations.',
        sourceLabel: 'NCCIH Glucosamine/Chondroitin + GAIT + OA trials',
      ),
    ],
    safety: [
      'Warfarin: bleeding/INR interaction concern; do not start without anticoagulation review.',
      'Pregnancy/breastfeeding safety is insufficient for routine use.',
    ],
  ),
  JointSupplementProfile(
    id: 'glucosamine-chondroitin',
    name: 'Glucosamine + chondroitin combination',
    category: 'Combination joint products',
    coreRule:
        'Being commonly combined does NOT mean the combination is proven superior. Evaluate the exact glucosamine form and both ingredient doses.',
    forms: [
      JointForm(
        name: 'GAIT-style combination',
        meaning: 'Glucosamine 1,500 mg/day + chondroitin sulfate 1,200 mg/day.',
      ),
      JointForm(
        name: 'Lower-dose retail combinations',
        meaning:
            'May not reproduce trial exposure. “Joint complex” on the front label is not enough; read Supplement Facts.',
      ),
    ],
    uses: [
      JointUse(
        indication: 'Knee OA — combination trial context',
        population: 'Adults with diagnosed knee OA',
        form: 'Glucosamine 1,500 mg + chondroitin sulfate 1,200 mg',
        dose: '1,500 mg glucosamine/day + 1,200 mg chondroitin sulfate/day in GAIT.',
        frequency: 'Total daily dose; product regimen determines division.',
        duration: '24 weeks in GAIT.',
        exactUse:
            'Count each ingredient separately in the patient stack. Do not add another glucosamine/chondroitin product on top without a reason.',
        evidence: JointEvidence.conflicting,
        caveat:
            'GAIT found no significant overall benefit versus placebo for the main pain outcome. Guideline conclusions remain conflicting.',
        sourceLabel: 'GAIT trial + NCCIH',
      ),
    ],
    safety: [
      'Warfarin interaction concern applies to the combination.',
      'GI upset can increase when several joint ingredients are stacked together.',
    ],
  ),
  JointSupplementProfile(
    id: 'ucii',
    name: 'Native / undenatured type II collagen',
    category: 'Collagen — cartilage',
    coreRule:
        'Undenatured type II collagen is a LOW-milligram product and is not dose-equivalent to hydrolyzed collagen peptides measured in grams.',
    forms: [
      JointForm(
        name: 'UC-II / native type II collagen',
        meaning:
            'A specific undenatured chicken-cartilage preparation has been studied at 40 mg/day.',
      ),
      JointForm(
        name: 'Hydrolyzed type II collagen',
        meaning:
            'Different processing and dosing concept; do not substitute gram-for-milligram based only on “type II” wording.',
      ),
    ],
    uses: [
      JointUse(
        indication: 'Knee osteoarthritis symptom support',
        population: 'Adults with symptomatic knee OA',
        form: 'Undenatured type II collagen',
        dose: '40 mg once daily in multiple randomized trials.',
        frequency: 'Once daily.',
        duration: '12–24 weeks; one major OA trial used 180 days.',
        exactUse:
            'Verify the product is truly native/undenatured type II collagen and not simply hydrolyzed collagen powder.',
        evidence: JointEvidence.moderate,
        caveat:
            'Evidence is promising but not enough to replace exercise, weight management or standard OA care. Several studies are industry-linked.',
        sourceLabel: 'UC-II randomized trials 2016–2026',
      ),
      JointUse(
        indication: 'Activity-related joint discomfort in otherwise healthy adults',
        population: 'Adults without diagnosed arthritis but with exercise-related knee discomfort',
        form: 'Native / undenatured type II collagen',
        dose: '40 mg/day in randomized healthy-volunteer studies.',
        frequency: 'Once daily.',
        duration: '120–180 days in cited trials.',
        exactUse:
            'Use only as a time-limited symptom trial; new swelling, locking, instability or persistent pain needs diagnosis rather than supplementation.',
        evidence: JointEvidence.limited,
        caveat:
            'Healthy-volunteer studies are relatively small and often product-specific.',
        sourceLabel: 'Healthy-volunteer UC-II randomized trials',
      ),
    ],
    safety: [
      'Usually chicken-derived; verify source for allergy/dietary preferences.',
      'Do not confuse 40 mg native type II collagen with 5–10 g collagen peptides.',
    ],
  ),
  JointSupplementProfile(
    id: 'collagen-peptides',
    name: 'Hydrolyzed collagen peptides',
    category: 'Collagen — connective tissue',
    coreRule:
        'Hydrolyzed collagen peptides are measured in GRAMS. Evidence does not justify converting every “type I/III collagen” label into the same clinical dose.',
    forms: [
      JointForm(
        name: 'Hydrolyzed collagen peptides / collagen hydrolysate',
        meaning:
            'Peptides produced by hydrolysis; bovine, porcine or marine source may differ, but source alone does not prove superior efficacy.',
      ),
      JointForm(
        name: 'Gelatin',
        meaning:
            'Partially hydrolyzed collagen with different food/physical properties; do not assume gram-for-gram clinical equivalence to a studied peptide product.',
      ),
    ],
    uses: [
      JointUse(
        indication: 'Knee osteoarthritis symptom adjunct',
        population: 'Adults with diagnosed knee OA',
        form: 'Hydrolyzed collagen peptides',
        dose: '10 g/day in multiple randomized studies.',
        frequency: 'Once daily total dose in cited trials.',
        duration: '8 weeks to 6 months in recent/major trials.',
        exactUse:
            'Powder can be taken with food or drink according to the product. Choose a product that states grams of collagen peptides rather than a tiny proprietary blend.',
        evidence: JointEvidence.limited,
        caveat:
            'Evidence is growing but heterogeneous and does not establish collagen as disease-modifying therapy.',
        sourceLabel: 'Hydrolyzed-collagen knee-OA RCTs 2009 and 2024/2025',
      ),
      JointUse(
        indication: 'Activity-related joint discomfort',
        population: 'Physically active adults without diagnosed joint disease',
        form: 'Collagen hydrolysate',
        dose: '10 g/day in a 24-week athlete trial.',
        frequency: 'Once daily total dose.',
        duration: '24 weeks in the cited trial.',
        exactUse:
            'Treat this as a symptom-support trial, not as a substitute for injury assessment, load management, rehabilitation or adequate protein intake.',
        evidence: JointEvidence.limited,
        caveat:
            'The athlete evidence is limited and older; response should be judged clinically rather than assumed.',
        sourceLabel: '24-week athlete collagen-hydrolysate RCT',
      ),
    ],
    safety: [
      'Check source allergens: marine/fish collagen, bovine, porcine or poultry-derived ingredients.',
      'Collagen is protein, but it is not a complete replacement for adequate dietary protein.',
      'Extra vitamin C is not automatically required if dietary vitamin C is already adequate.',
    ],
  ),
  JointSupplementProfile(
    id: 'oral-ha',
    name: 'Oral hyaluronic acid',
    category: 'Joint matrix / hydration',
    coreRule:
        'Oral hyaluronic acid evidence is much smaller than intra-articular HA evidence. Do not transfer injection evidence to capsules.',
    forms: [
      JointForm(
        name: 'Oral sodium hyaluronate / hyaluronic acid',
        meaning:
            'Molecular weight and formulation vary substantially between products.',
      ),
    ],
    uses: [
      JointUse(
        indication: 'Knee osteoarthritis symptom adjunct',
        population: 'Adults considering an oral HA trial',
        form: 'Oral hyaluronic acid',
        dose: '30–300 mg/day across studies; one 12-month RCT used 200 mg once daily.',
        frequency: 'Usually once daily in the 200 mg study.',
        duration: 'Studies range from 4 weeks to 12 months.',
        exactUse:
            'Do not treat the 30–300 mg study range as a dose escalation ladder. Match the exact product/study when possible and reassess symptoms.',
        evidence: JointEvidence.limited,
        caveat:
            'A 2024 systematic review found small studies and heterogeneous products; more evidence is needed.',
        sourceLabel: 'Oral HA systematic review 2024 + 200 mg knee-OA RCT',
      ),
    ],
    safety: [
      'Do not confuse oral HA capsules with intra-articular injections.',
      'Long-term product-specific safety data are less extensive than for common vitamins/minerals.',
    ],
  ),
  JointSupplementProfile(
    id: 'msm',
    name: 'MSM (methylsulfonylmethane)',
    category: 'Joint pain supplement',
    coreRule:
        'MSM is common in combination products, but evidence is sparse. A dose appearing in a pilot trial is not a universal recommendation.',
    forms: [
      JointForm(
        name: 'MSM',
        meaning: 'Methylsulfonylmethane; oral dietary supplement.',
      ),
    ],
    uses: [
      JointUse(
        indication: 'Knee OA symptom trial — evidence context',
        population: 'Adults with symptomatic knee OA',
        form: 'MSM',
        dose: '3 g twice daily (6 g/day) in a 12-week pilot RCT.',
        frequency: 'Twice daily in the cited trial.',
        duration: '12 weeks.',
        exactUse:
            'If tried, start with a product that gives an exact MSM amount and set a stop date if there is no meaningful pain/function benefit.',
        evidence: JointEvidence.insufficient,
        caveat:
            'NCCIH states that very little research has been done, so no firm efficacy conclusion can be reached.',
        sourceLabel: 'NCCIH Osteoarthritis + MSM pilot RCT',
      ),
    ],
    safety: [
      'Possible GI upset, allergic reactions and skin rash.',
      'Stacking MSM with glucosamine/chondroitin may increase pill burden and GI symptoms without proving additive benefit.',
    ],
  ),
  JointSupplementProfile(
    id: 'same',
    name: 'SAMe (S-adenosyl-L-methionine)',
    category: 'Joint pain / high-interaction supplement',
    coreRule:
        'SAMe has inconsistent OA evidence and clinically important psychiatric/drug-interaction cautions. It should not be treated like a simple joint vitamin.',
    forms: [
      JointForm(
        name: 'Oral SAMe',
        meaning:
            'Oral studies often used enteric-coated tablets; injected SAMe evidence cannot be transferred to oral retail products.',
      ),
    ],
    uses: [
      JointUse(
        indication: 'Knee OA pain — study context',
        population: 'Adults after medication and bipolar-disorder screening',
        form: 'Oral SAMe',
        dose: '1,200 mg/day in several comparative OA trials.',
        frequency: 'Often 400 mg three times daily in one 8-week trial.',
        duration: '4–16 weeks in major comparative trials.',
        exactUse:
            'Do not combine casually with serotonergic drugs/supplements. Reassess pain/function and stop if ineffective.',
        evidence: JointEvidence.conflicting,
        caveat:
            'NCCIH considers OA evidence inconclusive and long-term safety data limited.',
        sourceLabel: 'NCCIH SAMe + OA comparative trials',
      ),
    ],
    safety: [
      'Bipolar disorder: may worsen mania; avoid unsupervised use.',
      'Potential serotonin interaction with antidepressants, L-tryptophan and St. John’s wort.',
      'May reduce levodopa effect.',
      'Pregnancy safety is not established.',
    ],
  ),
];

JointSupplementProfile jointSupplement(String id) {
  return jointSupplementProfiles.singleWhere((item) => item.id == id);
}

const collagenTypeReference = <CollagenTypeReference>[
  CollagenTypeReference(
    type: 'Type I',
    whereItMatters: 'Skin, bone, tendon and many connective tissues',
    supplementMeaning:
        'Common in bovine/marine hydrolyzed collagen. A “Type I” label alone does not define a proven joint dose.',
  ),
  CollagenTypeReference(
    type: 'Type II',
    whereItMatters: 'Articular cartilage',
    supplementMeaning:
        'Native/undenatured type II has been studied at about 40 mg/day; hydrolyzed type II is a different product concept.',
  ),
  CollagenTypeReference(
    type: 'Type III',
    whereItMatters: 'Skin, vessels and connective tissue; often occurs with Type I',
    supplementMeaning:
        'Often marketed together with Type I in hydrolyzed collagen. Do not infer a unique disease indication from the type number alone.',
  ),
  CollagenTypeReference(
    type: 'Types V / X and others',
    whereItMatters: 'Specialized tissue roles',
    supplementMeaning:
        'REFERENCE ONLY: there is no routine patient-counseling dose based simply on these collagen type numbers.',
  ),
];

const jointGlobalLocks = <String>[
  'Osteoarthritis is not a vitamin deficiency. Exercise/strength, weight management when relevant, and standard medical care remain foundational.',
  'New hot/swollen joint, trauma, locking, instability, fever, rapid loss of function or unexplained severe pain needs assessment before supplements.',
  'Do not stack glucosamine + chondroitin + MSM + collagen + HA merely because all are “joint supplements.” Choose a target and reassess benefit.',
  'Front-label words such as “Joint Complex” are not enough. Verify exact form and amount in Supplement Facts.',
];
