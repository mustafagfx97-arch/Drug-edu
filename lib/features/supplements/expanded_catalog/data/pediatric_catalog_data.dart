import '../domain/expanded_supplement_models.dart';

const pediatricExpandedProfiles = <ExpandedSupplementProfile>[
  ExpandedSupplementProfile(
    id: 'peds-vitamin-d-infant',
    section: ExpandedSupplementSection.pediatric,
    name: 'Infant Vitamin D',
    subtitle: 'Breastfed and partially breastfed infants',
    coreRule:
        'Infants need a daily vitamin-D plan shortly after birth. Concentrated drop products are a major dosing-error risk.',
    whyUsed:
        'Prevents vitamin D deficiency/rickets when breast milk does not provide enough vitamin D.',
    evidence: ExpandedEvidence.strong,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Birth to 12 months',
        population: 'Breastfed or partially breastfed infants',
        dose: '400 IU (10 mcg) vitamin D daily.',
        timing: 'Once daily; start shortly after birth.',
        duration:
            'Continue while breast milk remains a major source unless adequate vitamin D intake is achieved through fortified formula/diet according to pediatric guidance.',
        note: 'This is preventive dosing, not treatment of documented deficiency.',
      ),
      ExpandedDosePathway(
        title: '12–24 months nutritional target',
        population: 'Children age 12–24 months',
        dose: '600 IU (15 mcg) vitamin D/day TOTAL intake.',
        timing: 'Food + supplement gap as needed.',
        duration: 'Ongoing nutritional target.',
        note: 'Not every child needs a 600-IU supplement if diet already provides the target.',
      ),
    ],
    administration: [
      'Show the caregiver the exact dropper/syringe and confirm how many drops or mL deliver 400 IU.',
      'Do not assume all infant drops are 400 IU/drop; products vary dramatically.',
    ],
    commonActionable: ['Dosing errors are more important than minor adverse effects at preventive doses.'],
    interactions: [],
    monitoring: [
      'Routine 25-OH-D testing is not required for every healthy infant on standard prevention.',
    ],
    avoidOrRefer: [
      'Suspected rickets, malabsorption, chronic liver/kidney disease, anticonvulsant therapy or documented deficiency requires clinician-directed dosing.',
    ],
    labelChecks: ['IU or mcg per DROP vs per mL', 'dropper calibration', 'other vitamin D sources'],
    sourceLabel: 'CDC Infant and Toddler Nutrition Vitamin D 2026 + AAP HealthyChildren',
    searchTerms: ['baby vitamin D', '400 IU', 'drops'],
  ),
  ExpandedSupplementProfile(
    id: 'peds-iron-breastfed',
    section: ExpandedSupplementSection.pediatric,
    name: 'Iron — Exclusively Breastfed Term Infant',
    subtitle: 'Preventive infant iron pathway',
    coreRule:
        'Infant iron prevention is weight-based and feeding-dependent; do not copy adult iron dosing.',
    whyUsed:
        'Helps prevent iron deficiency once fetal iron stores decline in exclusively breastfed term infants.',
    evidence: ExpandedEvidence.strong,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Term exclusively breastfed infant',
        population: 'Healthy term infant, exclusively breastfed',
        dose:
            'AAP 2026: 1 mg/kg/day elemental iron by 4 months; some infants may defer until ~6 months when iron-rich complementary foods are reliably introduced.',
        timing: 'Once daily according to the exact liquid product.',
        duration:
            'Until sufficient iron-containing complementary foods are established, according to pediatric guidance.',
        note:
            'This is a prevention pathway. Formula-fed infants receiving iron-fortified formula usually follow a different plan.',
      ),
    ],
    administration: [
      'Dose by ELEMENTAL iron and use an oral syringe/dropper marked in mL.',
      'Keep iron products out of reach; pediatric iron overdose can be life-threatening.',
    ],
    commonActionable: ['Dark stools, constipation and GI upset can occur.'],
    interactions: [
      'Do not mix the dose into a full bottle that the infant may not finish.',
    ],
    monitoring: ['Risk-based anemia screening; CBC/ferritin when clinically indicated.'],
    avoidOrRefer: [
      'Prematurity, low birth weight, anemia, transfusion history, chronic disease or suspected deficiency requires a specific pediatric plan.',
    ],
    labelChecks: ['mg elemental iron per mL', 'dropper size', 'ferrous salt form'],
    sourceLabel: 'AAP Clinical Report: Diagnosis and Prevention of Iron Deficiency 2026',
    searchTerms: ['infant iron', 'breastfed', '1 mg/kg'],
  ),
  ExpandedSupplementProfile(
    id: 'peds-iron-preterm',
    section: ExpandedSupplementSection.pediatric,
    name: 'Iron — Preterm Infant',
    subtitle: 'Higher-risk neonatal prevention',
    coreRule:
        'Preterm iron is a neonatal/clinician pathway, not an OTC wellness recommendation.',
    whyUsed:
        'Preterm infants have lower iron stores and rapid growth, increasing deficiency risk.',
    evidence: ExpandedEvidence.strong,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Preterm enteral iron prevention',
        population: 'Preterm infants on full enteral feeding',
        dose:
            'AAP 2026 target: about 2–3 mg/kg/day elemental iron, beginning by approximately 2 weeks of age.',
        timing: 'Per NICU/pediatric feeding-medication plan.',
        duration: 'Clinician-directed; depends on gestation, feeding, transfusions and growth.',
        note: 'Exact dosing must account for iron from feeds/fortifiers and clinical history.',
      ),
    ],
    administration: ['Use only the NICU/pediatric prescribed elemental dose and product concentration.'],
    commonActionable: ['GI intolerance can occur.'],
    interactions: [],
    monitoring: ['Hemoglobin/ferritin and growth follow-up according to neonatal plan.'],
    avoidOrRefer: ['Do not independently start/change iron in a preterm infant.'],
    labelChecks: ['elemental iron mg/mL', 'iron already present in fortifier/formula'],
    sourceLabel: 'AAP Clinical Report on Iron Deficiency 2026',
    searchTerms: ['preterm iron', 'NICU', '2 mg/kg', '3 mg/kg'],
  ),
  ExpandedSupplementProfile(
    id: 'peds-zinc-diarrhea',
    section: ExpandedSupplementSection.pediatric,
    name: 'Zinc — Acute Childhood Diarrhea',
    subtitle: 'WHO treatment adjunct in applicable settings',
    coreRule:
        'This is a short treatment course for acute diarrhea in WHO guidance, not a daily wellness zinc dose for all children.',
    whyUsed:
        'Zinc can shorten/severity-modify acute diarrhea in children in settings/populations where WHO zinc treatment is recommended.',
    evidence: ExpandedEvidence.strong,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Acute diarrhea — under 6 months',
        population: 'Children <6 months',
        dose: '10 mg elemental zinc once daily.',
        timing: 'Daily during the diarrheal episode.',
        duration: '10–14 days.',
        note: 'Use with appropriate oral rehydration and feeding; not a substitute for dehydration assessment.',
      ),
      ExpandedDosePathway(
        title: 'Acute diarrhea — 6 months and older',
        population: 'Children ≥6 months',
        dose: '20 mg elemental zinc once daily.',
        timing: 'Daily during the diarrheal episode.',
        duration: '10–14 days.',
        note: 'WHO treatment context; local pediatric protocols may differ.',
      ),
    ],
    administration: ['Use an age-appropriate product and confirm elemental zinc per tablet/mL.'],
    commonActionable: ['Nausea/vomiting can occur.'],
    interactions: [],
    monitoring: ['Hydration, urine output, feeding and danger signs matter more than zinc alone.'],
    avoidOrRefer: [
      'Blood in stool, severe dehydration, persistent vomiting, lethargy, very young infant or prolonged diarrhea needs medical assessment.',
    ],
    labelChecks: ['elemental zinc mg', 'syrup/tablet concentration'],
    sourceLabel: 'WHO Zinc supplementation in the management of diarrhoea',
    searchTerms: ['diarrhea', 'zinc 10 mg', 'zinc 20 mg'],
  ),
  ExpandedSupplementProfile(
    id: 'peds-fluoride',
    section: ExpandedSupplementSection.pediatric,
    name: 'Fluoride Supplement',
    subtitle: 'Only when drinking-water fluoride is inadequate',
    coreRule:
        'Fluoride supplementation is age- and water-fluoride-dependent. Never recommend a dose without knowing the child’s primary water source.',
    whyUsed:
        'Prevention of dental caries in selected children whose drinking water has insufficient fluoride and whose dentist/pediatric clinician recommends supplementation.',
    evidence: ExpandedEvidence.contextSpecific,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Systemic fluoride supplementation',
        population: 'Children with inadequate fluoride exposure',
        dose: 'No universal dose without age + local water-fluoride concentration.',
        timing: 'Follow the current dentist/pediatric prescription schedule.',
        duration: 'Reassess when residence/water source changes.',
        note:
            'The dose schedule depends on age and fluoride ppm in drinking water; excess can cause fluorosis.',
      ),
    ],
    administration: [
      'Ask about tap, bottled and filtered water before recommending.',
      'Do not combine a systemic fluoride supplement with another fluoride source without reviewing total exposure.',
    ],
    commonActionable: ['Chronic excess during tooth development can cause dental fluorosis.'],
    interactions: ['Calcium-rich foods/products can reduce absorption of swallowed fluoride; follow product-specific instructions.'],
    monitoring: ['Dental follow-up and water-fluoride exposure.'],
    avoidOrRefer: ['Refer to dentist/pediatric clinician when water fluoride is unknown or multiple residences/water sources are used.'],
    labelChecks: ['fluoride ion amount', 'age directions', 'water-fluoride requirement'],
    sourceLabel: 'AAPD Fluoride Therapy guidance',
    searchTerms: ['fluoride', 'teeth', 'caries'],
  ),
  ExpandedSupplementProfile(
    id: 'peds-b12-vegan',
    section: ExpandedSupplementSection.pediatric,
    name: 'Vitamin B12 — Vegan / Low-Animal-Food Child',
    subtitle: 'Diet-pattern supplementation',
    coreRule:
        'Strict vegan children need a reliable B12 source; the daily requirement is not the same as a tablet strength.',
    whyUsed:
        'Prevents B12 deficiency and neurologic/hematologic complications when dietary B12 is inadequate.',
    evidence: ExpandedEvidence.strong,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Nutrition target',
        population: 'Children/adolescents on a strict vegan diet',
        dose:
            'Use age-specific B12 RDA as the TOTAL nutritional target; supplement dose depends on product frequency and absorption.',
        timing: 'Consistent scheduled supplementation or reliably fortified foods.',
        duration: 'Ongoing while dietary intake remains inadequate.',
        note:
            'No single universal pediatric pill dose is encoded because age and dosing frequency change the practical amount.',
      ),
    ],
    administration: ['Use a product intended for the child’s age and ensure a reliable recurring source.'],
    commonActionable: [],
    interactions: [],
    monitoring: ['Diet review; CBC/B12 and related markers when deficiency is suspected.'],
    avoidOrRefer: ['Neurologic symptoms, anemia, growth concerns or malabsorption require medical evaluation.'],
    labelChecks: ['mcg B12 per dose', 'age labeling', 'daily vs weekly schedule'],
    sourceLabel: 'NIH ODS Vitamin B12 Fact Sheet + pediatric nutrition guidance',
    searchTerms: ['vegan child', 'B12', 'vegetarian'],
  ),
  ExpandedSupplementProfile(
    id: 'peds-calcium-gap',
    section: ExpandedSupplementSection.pediatric,
    name: 'Calcium — Dietary Gap in Children',
    subtitle: 'Fill the gap; do not automatically supplement every child',
    coreRule:
        'Calcium supplementation should fill a dietary gap, not sit on top of adequate dairy/fortified-food intake.',
    whyUsed:
        'Supports bone mineralization when diet is inadequate, particularly in dairy-free/restricted diets.',
    evidence: ExpandedEvidence.contextSpecific,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Dietary-gap supplementation',
        population: 'Children with low calcium intake',
        dose:
            'No universal supplement dose. Compare age-specific calcium RDA with estimated food intake and replace only the gap.',
        timing:
            'Split larger supplemental amounts; calcium absorption is best when individual elemental doses are ~500 mg or less.',
        duration: 'Until diet reliably meets needs or clinician changes the plan.',
        note: 'Total intake = food + fortified drinks + supplements.',
      ),
    ],
    administration: [
      'Calcium carbonate is best with food; calcium citrate can be taken with or without food.',
      'Counsel by elemental calcium.',
    ],
    commonActionable: ['Constipation can occur, especially with calcium carbonate.'],
    interactions: ['Separate from interacting medicines according to the medicine-specific instructions.'],
    monitoring: ['Dietary intake and growth; labs only when clinically indicated.'],
    avoidOrRefer: ['Kidney stones, hypercalcemia, renal disease or complex bone disease require clinician review.'],
    labelChecks: ['elemental calcium per serving', 'carbonate vs citrate', 'vitamin D duplication'],
    sourceLabel: 'NIH ODS Calcium Fact Sheet',
    searchTerms: ['child calcium', 'dairy free', 'bone'],
  ),
  ExpandedSupplementProfile(
    id: 'peds-multivitamin',
    section: ExpandedSupplementSection.pediatric,
    name: 'Children’s Multivitamin',
    subtitle: 'Not routine for every healthy child',
    coreRule:
        'Healthy children eating a varied balanced diet generally do not need a multivitamin.',
    whyUsed:
        'May help selected children with restricted diets, deficiency risk, poor intake, malabsorption or clinician-identified gaps.',
    evidence: ExpandedEvidence.contextSpecific,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Healthy child with balanced diet',
        population: 'Healthy child growing normally',
        dose: 'No established routine supplemental dose.',
        timing: 'Food-first.',
        duration: 'Not routinely needed.',
        note: 'AAP advises against routine extra vitamins for most healthy children with a balanced diet.',
      ),
      ExpandedDosePathway(
        title: 'Restricted diet / identified gap',
        population: 'Child with a specific nutrient gap',
        dose: 'Choose an age-appropriate product that covers the gap without megadoses.',
        timing: 'Follow the exact product label.',
        duration: 'Reassess diet and growth periodically.',
        note: 'A multivitamin is not a substitute for feeding assessment.',
      ),
    ],
    administration: ['Keep gummies/chewables away from young children; they can be mistaken for candy.'],
    commonActionable: ['Iron-containing products create important overdose risk.'],
    interactions: [],
    monitoring: ['Growth, diet quality, and labs only for suspected deficiencies.'],
    avoidOrRefer: ['Poor growth, developmental concerns, severe food restriction or eating disorder features need professional assessment.'],
    labelChecks: ['age range', 'iron content', 'vitamin A form/dose', 'zinc and vitamin D duplication'],
    sourceLabel: 'AAP HealthyChildren vitamins/minerals guidance 2025',
    searchTerms: ['kids multivitamin', 'gummy', 'restricted diet'],
  ),
  ExpandedSupplementProfile(
    id: 'peds-oral-nutrition',
    section: ExpandedSupplementSection.pediatric,
    name: 'Pediatric Oral Nutrition Supplement',
    subtitle: 'For faltering weight / inadequate intake — not a height booster',
    coreRule:
        'Pediatric nutrition drinks are medical nutrition tools when intake/growth is inadequate, not proven “height growth” products for healthy children.',
    whyUsed:
        'Can add calories/protein/micronutrients when a child has faltering weight or cannot meet needs with food alone.',
    evidence: ExpandedEvidence.contextSpecific,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Faltering weight',
        population: 'Child with clinician/dietitian-identified inadequate energy/protein intake',
        dose:
            'AAP guidance allows oral nutrition supplements to provide roughly 25–50% of estimated/measured energy and protein needs in selected cases.',
        timing:
            'Schedule so the supplement supports intake without displacing meals, usually between meals rather than immediately before them.',
        duration: 'Time-limited plan with growth and food-intake reassessment.',
        note:
            'Exact volume depends on product kcal/mL, age, weight and dietary assessment.',
      ),
    ],
    administration: [
      'Use the exact product kcal/mL and serving volume.',
      'Do not allow drinks to replace developmental feeding work or a varied diet.',
    ],
    commonActionable: [
      'Excess use can reduce appetite for meals, cause excess weight gain, constipation or micronutrient duplication.',
    ],
    interactions: [],
    monitoring: ['Weight, height/length, growth trajectory, dietary intake and tolerance.'],
    avoidOrRefer: [
      'Poor growth without diagnosis, dysphagia, vomiting, chronic diarrhea, feeding disorder or suspected systemic disease requires pediatric evaluation.',
    ],
    labelChecks: ['kcal/mL', 'protein g/serving', 'age indication', 'allergens', 'micronutrient totals'],
    sourceLabel: 'AAP Pediatrics clinical guidance on faltering weight 2026',
    searchTerms: ['Pediasure', 'nutrition drink', 'faltering weight', 'growth drink'],
  ),
  ExpandedSupplementProfile(
    id: 'peds-melatonin',
    section: ExpandedSupplementSection.pediatric,
    name: 'Pediatric Melatonin',
    subtitle: 'Do not self-dose as a candy-like sleep supplement',
    coreRule:
        'Parents should discuss melatonin with a pediatric health professional before use; many sleep problems are better treated by schedules/behavior.',
    whyUsed:
        'Sometimes used for selected pediatric sleep/circadian disorders, including in some neurodevelopmental conditions, under professional guidance.',
    evidence: ExpandedEvidence.contextSpecific,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Routine healthy-child sleep complaint',
        population: 'Child with bedtime resistance or insomnia symptoms',
        dose: 'No established routine self-care dose.',
        timing: 'Timing is diagnosis-dependent.',
        duration: 'Use only after sleep-hygiene/behavior assessment and clinician discussion.',
        note: 'Supplement content can vary; accidental ingestion is a major safety issue.',
      ),
    ],
    administration: ['Use the exact clinician-recommended product/dose; avoid escalating because a child “did not get sleepy.”'],
    commonActionable: ['Morning drowsiness, headache, vivid dreams and behavior changes can occur.'],
    interactions: ['Review sedating medicines and other neurologic/psychiatric therapies.'],
    monitoring: ['Sleep schedule, daytime function and ongoing need.'],
    avoidOrRefer: ['Snoring/apnea, seizures, major behavioral changes, chronic insomnia or complex neurodevelopmental conditions require professional assessment.'],
    labelChecks: ['mg per gummy/drop', 'immediate vs extended release', 'quality verification'],
    sourceLabel: 'American Academy of Sleep Medicine pediatric melatonin health advisory',
    searchTerms: ['kids sleep', 'gummy melatonin'],
  ),
  ExpandedSupplementProfile(
    id: 'peds-omega3',
    section: ExpandedSupplementSection.pediatric,
    name: 'Pediatric Omega-3',
    subtitle: 'No universal fish-oil dose for healthy children',
    coreRule:
        'Do not convert “brain development” marketing into a routine pediatric EPA/DHA dose.',
    whyUsed:
        'Parents commonly request omega-3 for cognition, attention, development or low fish intake.',
    evidence: ExpandedEvidence.contextSpecific,
    dosePathways: [
      ExpandedDosePathway(
        title: 'Healthy child wellness',
        population: 'Healthy child without a specific indication',
        dose: 'No established routine supplemental EPA+DHA dose.',
        timing: 'Food sources are preferred when feasible.',
        duration: 'No universal course.',
        note: 'Use condition-specific pediatric evidence only when the diagnosis matches.',
      ),
    ],
    administration: ['Verify age-appropriate formulation and actual EPA+DHA amount, not total fish-oil mg.'],
    commonActionable: ['Fishy taste/reflux and GI upset can impair adherence.'],
    interactions: [],
    monitoring: [],
    avoidOrRefer: ['Fish allergy, bleeding disorders or high-dose plans need clinician review.'],
    labelChecks: ['EPA mg', 'DHA mg', 'age labeling', 'vitamin A/D if cod-liver oil'],
    sourceLabel: 'NIH ODS Omega-3 Fact Sheet + pediatric dietary guidance',
    searchTerms: ['children fish oil', 'DHA kids', 'brain supplement'],
  ),
];

ExpandedSupplementProfile pediatricExpandedProfile(String id) =>
    pediatricExpandedProfiles.singleWhere((item) => item.id == id);
