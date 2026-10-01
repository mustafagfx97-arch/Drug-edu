import '../domain/expanded_supplement_models.dart';

const generalExpandedProfiles = <ExpandedSupplementProfile>[
  ExpandedSupplementProfile(
    id: 'general-omega3',
    section: ExpandedSupplementSection.general,
    name: 'Omega-3 / Fish Oil',
    subtitle: 'EPA + DHA are not the same as ALA',
    coreRule:
        'There is no adult RDA/AI for EPA+DHA and no universal routine fish-oil dose. Use a goal-specific dose and count actual EPA+DHA, not “fish oil 1,000 mg.”',
    whyUsed:
        'Patients commonly use omega-3 for cardiovascular health, triglycerides, pregnancy, inflammation or general wellness. Evidence and dosing differ sharply by indication.',
    evidence: ExpandedEvidence.contextSpecific,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Routine healthy-adult supplementation',
        population: 'Healthy adults without a specific indication',
        dose: 'No established routine supplemental EPA+DHA dose.',
        timing: 'May be taken with food; a meal can improve tolerance.',
        duration: 'Reassess whether there is a measurable reason to continue.',
        note:
            'The U.S. AI is for ALA, not for EPA+DHA. Food-first intake of oily fish is often the more practical pathway.',
      ),
      ExpandedDosePathway(
        title: 'Hypertriglyceridemia',
        population: 'Adults with elevated triglycerides under medical care',
        dose:
            'Prescription omega-3 fatty acids: 4 g/day is the evidence-based pharmacologic pathway used to lower triglycerides.',
        timing: 'Use the prescribed product schedule.',
        duration: 'Chronic only when clinically indicated and monitored.',
        note:
            'Do NOT substitute an arbitrary number of OTC fish-oil capsules for prescription therapy; EPA/DHA content, purity and formulation differ.',
      ),
    ],
    administration: [
      'Read the Supplement Facts for EPA and DHA per serving; ignore the front-panel “fish oil” mass when calculating the active dose.',
      'If reflux/fishy burps occur, taking with meals, dividing the dose, or changing formulation can improve tolerance.',
    ],
    commonActionable: [
      'GI upset, fishy aftertaste and reflux are common reasons for nonadherence.',
      'Very high-dose omega-3 regimens should not be started casually; long-term 4 g/day trials in cardiovascular-risk populations found a small increase in atrial fibrillation.',
    ],
    interactions: [
      'Review antithrombotic therapy and bleeding history when high doses are used, especially around procedures.',
    ],
    monitoring: [
      'For triglyceride treatment: fasting/nonfasting lipid follow-up according to the treating clinician.',
      'For general use: there is usually no reason to “titrate” to an omega-3 blood level in routine pharmacy counseling.',
    ],
    avoidOrRefer: [
      'Refer very high triglycerides or pancreatitis-risk patients rather than self-treating with OTC fish oil.',
      'Fish/shellfish allergy and product source should be checked.',
    ],
    labelChecks: [
      'EPA mg + DHA mg per serving',
      'Serving size and capsules required',
      'Triglyceride/ethyl-ester form is secondary to the actual goal, dose and quality',
      'Third-party quality testing when possible',
    ],
    sourceLabel:
        'NIH ODS Omega-3 Fatty Acids Fact Sheet + AHA Science Advisory on omega-3 for hypertriglyceridemia',
    searchTerms: ['fish oil', 'EPA', 'DHA', 'triglyceride', 'ALA'],
  ),
  ExpandedSupplementProfile(
    id: 'general-creatine',
    section: ExpandedSupplementSection.general,
    name: 'Creatine Monohydrate',
    subtitle: 'Most studied creatine form',
    coreRule:
        'Creatine monohydrate is the reference form. Loading is optional; 3–5 g/day reaches muscle saturation more gradually.',
    whyUsed:
        'Improves repeated high-intensity exercise capacity and supports gains in strength/lean mass when combined with resistance training. It is also frequently used outside sport, but disease-specific uses are separate research pathways.',
    evidence: ExpandedEvidence.strong,
    dosePathways: [
      ExpandedDosePathway(
        title: 'No-load practical regimen',
        population: 'Healthy adults using creatine for training/performance',
        dose: '3–5 g creatine monohydrate once daily.',
        timing:
            'Any consistent daily time is acceptable; taking with a meal or post-training is practical.',
        duration:
            'Can be continued long term in healthy adults when tolerated; reassess goal and total supplement stack.',
        note:
            'Muscle stores rise gradually over roughly 3–4 weeks without a loading phase.',
      ),
      ExpandedDosePathway(
        title: 'Rapid loading option',
        population: 'Healthy adults who want faster saturation',
        dose:
            'About 20 g/day as 4 × 5 g doses for ~5–7 days, or ~0.3 g/kg/day divided, then 3–5 g/day maintenance.',
        timing: 'Divide across the day to reduce GI burden.',
        duration: 'Loading only ~5–7 days; maintenance thereafter.',
        note: 'Loading is optional, not “better.”',
      ),
    ],
    administration: [
      'Use creatine monohydrate; other forms have not shown superior outcomes.',
      'Dissolve/mix in a beverage or soft food and consume according to product instructions.',
      'Adequate usual hydration is appropriate; forced excessive water intake is not required.',
    ],
    commonActionable: [
      'Early body-mass increase from water retention is expected and may matter in weight-class or endurance sports.',
      'Large single doses can cause GI discomfort; split them.',
    ],
    interactions: [
      'No routine caffeine separation is required solely because both are used, but very high stimulant intake can worsen GI/sleep issues in a pre-workout stack.',
    ],
    monitoring: [
      'Serum creatinine can rise modestly because creatine contributes to creatinine production; interpret kidney tests in clinical context.',
    ],
    avoidOrRefer: [
      'Known kidney disease, unexplained renal impairment, pregnancy/breastfeeding, or pediatric performance use should be clinician-reviewed.',
    ],
    labelChecks: [
      'Creatine monohydrate grams per serving',
      'Avoid paying extra for proprietary blends that hide the creatine amount',
      'Athletes: prefer batch-tested products',
    ],
    sourceLabel:
        'NIH ODS Exercise and Athletic Performance + Australian Institute of Sport Creatine guidance',
    searchTerms: ['creatine', 'monohydrate', 'strength', 'gym'],
  ),
  ExpandedSupplementProfile(
    id: 'general-choline',
    section: ExpandedSupplementSection.general,
    name: 'Choline',
    subtitle: 'Essential nutrient with AI, not a universal pill dose',
    coreRule:
        'Daily need is a TOTAL-intake target. A choline AI does not mean every adult should take that amount as a supplement.',
    whyUsed:
        'Choline supports cell membranes, acetylcholine and methyl-group metabolism. Supplements are most relevant when diet is low or a life-stage need is not met.',
    evidence: ExpandedEvidence.contextSpecific,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Adult daily nutritional target',
        population: 'Adults',
        dose: 'AI: men 550 mg/day; women 425 mg/day TOTAL choline.',
        timing: 'Food + supplements combined.',
        duration: 'Ongoing nutritional target.',
        note: 'Not a prescription supplement dose.',
      ),
      ExpandedDosePathway(
        title: 'Pregnancy / lactation nutritional target',
        population: 'Pregnancy / breastfeeding',
        dose: 'AI: pregnancy 450 mg/day; lactation 550 mg/day TOTAL choline.',
        timing: 'Food first; use a supplement only for the dietary gap.',
        duration: 'During the relevant life stage.',
        note:
            'Many prenatal products provide little or no choline, so the exact label and diet matter.',
      ),
      ExpandedDosePathway(
        title: 'Routine stand-alone supplement',
        population: 'Healthy adults',
        dose: 'No established routine supplemental dose.',
        timing: 'If used, follow the dose needed to fill the dietary gap.',
        duration: 'Reassess diet and total intake.',
        note:
            'Commercial products often contain much less than the AI and use different forms such as choline bitartrate or phosphatidylcholine.',
      ),
    ],
    administration: [
      'Count choline from food, prenatal/multivitamin products and stand-alone supplements.',
      'Do not confuse phosphatidylcholine mass with elemental choline mass.',
    ],
    commonActionable: [
      'High intakes can cause fishy body odor, sweating, salivation, GI symptoms and hypotension.',
    ],
    interactions: [],
    monitoring: [
      'Routine lab monitoring is not required for ordinary nutritional use.',
    ],
    avoidOrRefer: [
      'Avoid megadosing for “brain boosting” without a specific clinical rationale.',
    ],
    labelChecks: [
      'Actual choline amount per serving',
      'Choline form',
      'Prenatal duplication/gap',
    ],
    sourceLabel: 'NIH ODS Choline Fact Sheet',
    searchTerms: ['phosphatidylcholine', 'bitartrate', 'prenatal choline'],
  ),
  ExpandedSupplementProfile(
    id: 'general-melatonin',
    section: ExpandedSupplementSection.general,
    name: 'Melatonin',
    subtitle: 'Circadian tool — timing matters more than “more mg”',
    coreRule:
        'Melatonin is not a generic nightly vitamin. The indication, timing and formulation determine whether it is useful.',
    whyUsed:
        'Best-supported practical uses include circadian-shift situations such as jet lag; routine long-term treatment of chronic insomnia is not automatically appropriate.',
    evidence: ExpandedEvidence.contextSpecific,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Jet lag / circadian shifting',
        population: 'Adults crossing time zones',
        dose:
            'Often 0.5–1 mg is sufficient for circadian shifting; CDC Yellow Book advises avoiding doses >5 mg for this purpose.',
        timing:
            'Timing depends on travel direction and target bedtime; an evening dose around the new destination bedtime is commonly used.',
        duration: 'Short-term around travel.',
        note:
            'Incorrect timing can shift the body clock in the wrong direction. Dose is not the only variable.',
      ),
      ExpandedDosePathway(
        title: 'Routine chronic insomnia self-treatment',
        population: 'Adults with persistent insomnia',
        dose: 'No established routine supplemental dose.',
        timing: 'Do not default to escalating dose.',
        duration:
            'Persistent insomnia needs assessment of sleep schedule, substances, medicines and underlying disorders.',
        note:
            'Melatonin content can vary markedly among supplements; behavioral therapy remains central for chronic insomnia.',
      ),
    ],
    administration: [
      'Use the lowest practical dose for the specific circadian goal.',
      'Immediate-release and prolonged-release formulations are not interchangeable for every sleep complaint.',
    ],
    commonActionable: [
      'Drowsiness, headache, dizziness and vivid dreams can occur.',
      'Next-day impairment matters for driving or hazardous work.',
    ],
    interactions: [
      'Sedatives/alcohol can increase drowsiness.',
      'Review anticoagulants, antiseizure therapy, immunosuppressants and other complex medication regimens individually.',
    ],
    monitoring: [
      'Track sleep timing and daytime function rather than chasing a laboratory melatonin level.',
    ],
    avoidOrRefer: [
      'Persistent insomnia, loud snoring/apnea symptoms, restless legs, severe mood symptoms, pregnancy/breastfeeding, or significant polypharmacy need clinician review.',
    ],
    labelChecks: [
      'Immediate vs prolonged release',
      'mg per unit',
      'Third-party quality verification',
    ],
    sourceLabel: 'CDC Yellow Book 2026 + NCCIH Melatonin guidance',
    searchTerms: ['sleep', 'jet lag', 'circadian'],
  ),
  ExpandedSupplementProfile(
    id: 'general-coq10',
    section: ExpandedSupplementSection.general,
    name: 'Coenzyme Q10',
    subtitle: 'Ubiquinone / ubiquinol',
    coreRule:
        'CoQ10 has condition-specific research but no universal wellness or performance dose.',
    whyUsed:
        'Commonly marketed for “energy,” statin muscle symptoms, heart failure and mitochondrial support. Evidence differs by indication and is not strong enough to justify one routine dose for everyone.',
    evidence: ExpandedEvidence.contextSpecific,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Healthy adult wellness',
        population: 'Healthy adults',
        dose: 'No established routine supplemental dose.',
        timing: 'If used, take with a meal containing some fat.',
        duration: 'Set a goal and reassess rather than indefinite automatic use.',
        note: 'Commercial 100–200 mg products are market strengths, not an RDA.',
      ),
      ExpandedDosePathway(
        title: 'Statin-associated muscle symptoms',
        population: 'Adults with muscle symptoms while taking a statin',
        dose: 'No established routine dose because overall evidence does not support reliable benefit.',
        timing: 'Do not use CoQ10 to delay evaluation of severe muscle symptoms.',
        duration: 'Clinician-guided trial only if chosen.',
        note:
            'NCCIH notes that overall evidence does not support CoQ10 for statin-associated muscle pain.',
      ),
      ExpandedDosePathway(
        title: 'Exercise performance',
        population: 'Athletes',
        dose: 'No established performance-enhancing dose.',
        timing: 'Not a priority ergogenic aid.',
        duration: 'Not routinely recommended for performance.',
        note:
            'NIH ODS finds little evidence for performance benefit; antioxidant supplementation can sometimes blunt training adaptations.',
      ),
    ],
    administration: [
      'Fat-containing meals improve absorption of this fat-soluble compound.',
      'Ubiquinol and ubiquinone labels should not be assumed dose-equivalent on the basis of marketing alone.',
    ],
    commonActionable: ['GI upset and insomnia-like complaints can occur in some users.'],
    interactions: [
      'Warfarin interaction is possible and INR should be reviewed when CoQ10 is started/stopped in a warfarin-treated patient.',
    ],
    monitoring: [
      'Use symptom/clinical-goal monitoring; no routine CoQ10 level is required.',
    ],
    avoidOrRefer: [
      'Heart failure, severe statin symptoms or suspected rhabdomyolysis require medical care rather than supplement-only management.',
    ],
    labelChecks: ['Ubiquinone vs ubiquinol', 'mg per serving', 'Added oils/other actives'],
    sourceLabel: 'NCCIH Coenzyme Q10 + NIH ODS Exercise Performance',
    searchTerms: ['ubiquinone', 'ubiquinol', 'statin', 'energy'],
  ),
  ExpandedSupplementProfile(
    id: 'general-psyllium',
    section: ExpandedSupplementSection.general,
    name: 'Psyllium Husk',
    subtitle: 'Viscous soluble fiber',
    coreRule:
        'Psyllium works only when taken with adequate fluid. Choking/obstruction risk is a counseling priority.',
    whyUsed:
        'Used for constipation, increasing soluble fiber intake, and as part of cholesterol/heart-health dietary strategies.',
    evidence: ExpandedEvidence.strong,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Constipation',
        population: 'Adults using an OTC psyllium product',
        dose:
            'Use the exact product serving; MedlinePlus notes psyllium is commonly taken 1–3 times daily.',
        timing: 'Each dose must be mixed with at least 240 mL (8 oz) liquid.',
        duration:
            'Short-term self-care unless a clinician recommends longer use for fiber intake.',
        note: 'Do not swallow dry powder.',
      ),
      ExpandedDosePathway(
        title: 'FDA coronary-heart-disease claim context',
        population: 'Adults using psyllium as part of an appropriate diet',
        dose:
            '7 g/day soluble fiber from psyllium husk is the amount used in the authorized health-claim context.',
        timing: 'Divide according to product instructions with ample liquid.',
        duration: 'Long-term dietary strategy if tolerated.',
        note:
            'This is not a drug treatment for established cardiovascular disease.',
      ),
    ],
    administration: [
      'Stir the measured powder/granules briskly into at least 240 mL liquid and drink promptly before it thickens.',
      'Follow with additional fluid if the product label instructs.',
    ],
    commonActionable: [
      'Bloating/gas may occur initially; titrate gradually when used as a fiber supplement.',
    ],
    interactions: [
      'Psyllium can delay or reduce absorption of some medicines. Separate according to the interacting medicine/product instructions rather than using one universal interval.',
    ],
    monitoring: ['Bowel frequency/consistency; lipid response when used for that goal.'],
    avoidOrRefer: [
      'Avoid in swallowing difficulty, bowel obstruction, severe unexplained abdominal pain or inability to drink enough fluid.',
      'Seek urgent help for chest pain, vomiting, trouble swallowing or breathing after a dose.',
    ],
    labelChecks: ['grams psyllium husk', 'grams soluble fiber', 'sugar/sodium additives'],
    sourceLabel: 'MedlinePlus Psyllium + FDA authorized soluble-fiber health claim',
    searchTerms: ['fiber', 'constipation', 'Metamucil', 'soluble fiber'],
  ),
  ExpandedSupplementProfile(
    id: 'general-cranberry',
    section: ExpandedSupplementSection.general,
    name: 'Cranberry Products',
    subtitle: 'Recurrent UTI prevention adjunct — not UTI treatment',
    coreRule:
        'Cranberry may reduce recurrent symptomatic UTI in some populations, but it does not treat an active UTI and products are not standardized enough for one universal dose.',
    whyUsed:
        'Mostly used by women with recurrent UTIs who want a non-antibiotic preventive adjunct.',
    evidence: ExpandedEvidence.moderate,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Recurrent UTI prevention',
        population: 'Selected women with a history of recurrent UTI',
        dose: 'No established universal cranberry supplement dose.',
        timing: 'Use a product with clearly declared formulation/PAC information if chosen.',
        duration: 'Preventive trial with reassessment of recurrence frequency.',
        note:
            'Cochrane/NCCIH evidence suggests a modest reduction in recurrent symptomatic UTI, but juice, extract and PAC content vary widely.',
      ),
    ],
    administration: [
      'Do not use cranberry instead of antibiotics or evaluation when symptoms suggest an active UTI.',
      'Sugar content in juice products can be substantial.',
    ],
    commonActionable: ['GI upset can occur with larger amounts.'],
    interactions: [
      'Warfarin-treated patients should discuss regular/high cranberry intake with their anticoagulation team because interaction reports exist.',
    ],
    monitoring: ['Track actual culture-confirmed/symptomatic UTI recurrence rather than urinary odor alone.'],
    avoidOrRefer: [
      'Fever, flank pain, pregnancy with UTI symptoms, male UTI, hematuria, systemic illness or persistent symptoms need medical evaluation.',
    ],
    labelChecks: ['Juice vs extract', 'PAC standardization if declared', 'Added sugar'],
    sourceLabel: 'NCCIH Cranberry + Cochrane recurrent UTI evidence',
    searchTerms: ['UTI', 'PAC', 'proanthocyanidin'],
  ),
  ExpandedSupplementProfile(
    id: 'general-dmannose',
    section: ExpandedSupplementSection.general,
    name: 'D-Mannose',
    subtitle: 'Popular UTI supplement with negative recent prevention trial',
    coreRule:
        'Do not routinely recommend daily D-mannose for recurrent UTI prevention based on the 2024 large primary-care randomized trial.',
    whyUsed:
        'Marketed to prevent recurrent urinary tract infection by reducing bacterial adherence.',
    evidence: ExpandedEvidence.notRecommended,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Recurrent UTI prevention',
        population: 'Women with recurrent UTI',
        dose: 'No routine prophylactic dose recommended.',
        timing: 'Not applicable as a routine recommendation.',
        duration: 'Not recommended for routine prophylaxis in this population.',
        note:
            'A 2024 randomized clinical trial found daily D-mannose did not reduce medically attended recurrent UTI.',
      ),
    ],
    administration: [
      'If a patient is already using it, explain the newer negative trial rather than implying proven prevention.',
    ],
    commonActionable: ['Loose stool/GI upset may occur.'],
    interactions: [],
    monitoring: ['Monitor recurrence objectively; do not let supplementation delay urine testing when indicated.'],
    avoidOrRefer: [
      'Active UTI symptoms and red flags require appropriate evaluation/treatment.',
    ],
    labelChecks: ['grams per serving', 'hidden combination ingredients'],
    sourceLabel: 'JAMA Internal Medicine randomized D-mannose trial 2024',
    searchTerms: ['mannose', 'UTI'],
  ),
  ExpandedSupplementProfile(
    id: 'general-lutein-zeaxanthin',
    section: ExpandedSupplementSection.general,
    name: 'Lutein + Zeaxanthin',
    subtitle: 'Eye carotenoids — AREDS2 is a specific clinical formula',
    coreRule:
        'Lutein/zeaxanthin are not a generic “vision restoration” supplement. The strongest practical context is the complete AREDS2 formula for appropriate AMD stages.',
    whyUsed:
        'Marketed for macular/eye health. The evidence-based AREDS2 pathway is disease-stage specific and uses a combination, not lutein alone.',
    evidence: ExpandedEvidence.contextSpecific,
    dosePathways: [
      ExpandedDosePathway(
        title: 'General eye wellness',
        population: 'Adults without diagnosed age-related macular degeneration',
        dose: 'No established routine supplemental dose.',
        timing: 'Dietary leafy greens and carotenoid-rich foods remain the default.',
        duration: 'No routine supplement course established.',
        note: 'Do not promise sharper vision or prevention of all eye disease.',
      ),
      ExpandedDosePathway(
        title: 'AREDS2 component dose',
        population: 'Patients for whom an eye-care professional recommends AREDS2',
        dose: 'Lutein 10 mg + zeaxanthin 2 mg/day within the complete AREDS2 formula.',
        timing: 'Use the full labeled regimen.',
        duration: 'Long-term under eye-care guidance.',
        note:
            'The complete formula also contains vitamin C, vitamin E, zinc and copper. The combination is handled separately in Combination Products.',
      ),
    ],
    administration: ['Take with food if the product causes GI upset; carotenoids are fat soluble.'],
    commonActionable: [],
    interactions: [],
    monitoring: ['Ophthalmology monitoring of AMD stage/vision, not supplement level.'],
    avoidOrRefer: ['New visual distortion, sudden vision loss or acute eye symptoms require urgent eye evaluation.'],
    labelChecks: ['lutein mg', 'zeaxanthin mg', 'whether product is true AREDS2 or only “eye support”'],
    sourceLabel: 'National Eye Institute AREDS2 guidance',
    searchTerms: ['eyes', 'macula', 'AREDS2', 'AMD'],
  ),
];

ExpandedSupplementProfile generalExpandedProfile(String id) =>
    generalExpandedProfiles.singleWhere((item) => item.id == id);
