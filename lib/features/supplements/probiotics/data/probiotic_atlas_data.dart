import '../domain/probiotic_atlas_models.dart';

const probioticProfiles = <ProbioticProfile>[
  ProbioticProfile(
    id: 'lgg',
    displayName: 'Lacticaseibacillus rhamnosus GG (LGG / ATCC 53103)',
    organismType: 'Bacterial probiotic',
    keyRule:
        'LGG evidence is indication-specific. Do not substitute another L. rhamnosus strain just because the species name is similar.',
    uses: [
      ProbioticUse(
        id: 'age',
        indication: 'Acute gastroenteritis',
        population: 'Previously healthy children',
        dose: '≥1 × 10^10 CFU/day',
        frequency:
            'The ESPGHAN recommendation specifies the total daily dose; once-daily vs divided dosing should match the studied/product regimen.',
        duration: '5–7 days',
        exactUse:
            'Use as an adjunct to oral rehydration and continued feeding. Start during the acute episode; it does not replace ORS or assessment for dehydration/red flags.',
        evidence: ProbioticEvidence.low,
        caveat:
            'ESPGHAN gives a weak positive recommendation. AGA 2020 suggested against routine probiotics for pediatric acute infectious gastroenteritis in North America, so local guideline context matters.',
        sourceLabel: 'ESPGHAN 2023 + AGA 2020',
      ),
      ProbioticUse(
        id: 'aad',
        indication: 'Prevention of antibiotic-associated diarrhea',
        population:
            'Children when AAD prevention is considered because of antibiotic/risk factors',
        dose: 'High dose: ≥5 × 10^9 CFU/day',
        frequency:
            'Deliver the verified LGG daily amount according to the product formulation.',
        duration:
            'Start simultaneously with antibiotic treatment. No universal extra number of post-antibiotic days is specified by ESPGHAN.',
        exactUse:
            'Begin on the same day as the antibiotic. Verify that the product actually contains LGG ATCC 53103 and that its end-of-shelf-life CFU reaches the target.',
        evidence: ProbioticEvidence.moderate,
        caveat:
            'Do not replace LGG with a generic “Lactobacillus blend.” For bacterial probiotics, antibiotic spacing should follow the product/studied protocol rather than a universal invented interval.',
        sourceLabel: 'ESPGHAN 2023',
      ),
      ProbioticUse(
        id: 'nosocomial',
        indication: 'Prevention of nosocomial diarrhea',
        population: 'Hospitalized children',
        dose: '≥1 × 10^9 CFU/day',
        frequency: 'Daily',
        duration: 'For the duration of the hospital stay',
        exactUse:
            'Use only if the hospital protocol supports LGG and the child is an appropriate candidate.',
        evidence: ProbioticEvidence.moderate,
        caveat:
            'Hospital infection-control and high-risk-patient policies override retail supplement instructions.',
        sourceLabel: 'ESPGHAN 2023',
      ),
      ProbioticUse(
        id: 'ibs-child',
        indication: 'IBS-related abdominal pain',
        population: 'Children with IBS / functional abdominal pain disorder',
        dose: '1 × 10^9 to 3 × 10^9 CFU per dose',
        frequency: 'Twice daily',
        duration:
            'Use the duration of the selected evidence-based product/study; ESPGHAN does not define one universal duration in its summary recommendation.',
        exactUse:
            'Use only after the functional abdominal pain/IBS diagnosis is appropriate and alarm features have been excluded.',
        evidence: ProbioticEvidence.moderate,
        caveat:
            'The recommendation is weak and is for LGG specifically.',
        sourceLabel: 'ESPGHAN 2023',
      ),
      ProbioticUse(
        id: 'nec',
        indication: 'NEC prevention',
        population: 'Preterm infants in NICU',
        dose: '1 × 10^9 to 6 × 10^9 CFU/day',
        frequency: 'NICU protocol only',
        duration: 'NICU protocol only',
        exactUse:
            'Do not use as a retail/self-directed dose. Product quality, contamination risk, gestational age, feeding and unit policy must all be addressed.',
        evidence: ProbioticEvidence.low,
        caveat:
            'FDA/NCCIH have highlighted severe or fatal probiotic-associated infections in premature infants. This pathway is clinician/NICU controlled.',
        sourceLabel: 'ESPGHAN 2023 + NCCIH/FDA safety warning',
      ),
    ],
    safety: [
      'Avoid treating “Lactobacillus rhamnosus” as automatically equivalent to LGG.',
      'High-risk patients with severe illness or impaired immunity need individualized risk-benefit assessment.',
      'The CFU must be the viable amount expected through expiration, not merely “at manufacture.”',
    ],
  ),
  ProbioticProfile(
    id: 's-boulardii',
    displayName: 'Saccharomyces boulardii (most pediatric evidence: CNCM I-745)',
    organismType: 'Probiotic yeast',
    keyRule:
        'S. boulardii is a yeast, not a bacterial probiotic. Many pediatric trials used CNCM I-745 when the strain could be identified.',
    uses: [
      ProbioticUse(
        id: 'age',
        indication: 'Acute gastroenteritis',
        population: 'Children',
        dose: '250–750 mg/day',
        frequency:
            'The guideline specifies the total daily amount; divide according to the exact medicinal/supplement product.',
        duration: '5–7 days',
        exactUse:
            'Use with oral rehydration and normal feeding as tolerated. Do not convert mg to CFU unless the exact product supplies a validated conversion.',
        evidence: ProbioticEvidence.low,
        caveat:
            'This is adjunctive therapy, not a substitute for ORS. The guideline notes that strain designation was often unavailable, but CNCM I-745 was the most commonly identified strain.',
        sourceLabel: 'ESPGHAN 2023',
      ),
      ProbioticUse(
        id: 'aad',
        indication: 'Prevention of antibiotic-associated diarrhea',
        population:
            'Children when AAD prevention is considered because of risk factors',
        dose: 'High dose: ≥5 × 10^9 CFU/day',
        frequency: 'Daily, using a product with verified viable count',
        duration:
            'Start simultaneously with antibiotic treatment. Do not invent a fixed post-antibiotic extension.',
        exactUse:
            'Because it is yeast, do not assume antibacterial antibiotics inactivate it. However, product-specific directions and concomitant antifungal therapy must be reviewed.',
        evidence: ProbioticEvidence.moderate,
        caveat:
            'Many commercial S. boulardii products label mg rather than CFU; mg ↔ CFU is NOT universally convertible.',
        sourceLabel: 'ESPGHAN 2023',
      ),
      ProbioticUse(
        id: 'hpylori',
        indication: 'Adjunct to H. pylori eradication therapy',
        population: 'Children with H. pylori infection',
        dose:
            'No universal auto-dose encoded: use the exact studied S. boulardii product/protocol.',
        frequency: 'Product/study specific',
        duration: 'During the eradication regimen according to the selected protocol',
        exactUse:
            'Use only as an adjunct to guideline-based H. pylori therapy, not as eradication monotherapy.',
        evidence: ProbioticEvidence.veryLow,
        caveat:
            'ESPGHAN offers only a weak recommendation; the purpose is to improve eradication/tolerability, not replace antibiotics/acid suppression.',
        sourceLabel: 'ESPGHAN 2023',
      ),
    ],
    safety: [
      'Contraindicated in patients with a central venous catheter, critically ill patients and immunocompromised patients because of fungemia risk.',
      'In healthcare settings, avoid opening capsules/sachets near a central venous catheter; EMA highlights airborne/hand contamination risk.',
      'Do not mix a product into very hot liquids; exact temperature limits are product-specific.',
    ],
  ),
  ProbioticProfile(
    id: 'reuteri-17938',
    displayName: 'Limosilactobacillus reuteri DSM 17938',
    organismType: 'Bacterial probiotic',
    keyRule:
        'DSM 17938 has different evidence for colic, acute gastroenteritis and functional abdominal pain; one indication does not prove another.',
    uses: [
      ProbioticUse(
        id: 'age',
        indication: 'Acute gastroenteritis',
        population: 'Children',
        dose: '1 × 10^8 to 4 × 10^8 CFU/day',
        frequency: 'Daily total dose',
        duration: '5 days',
        exactUse:
            'Use only as adjunct to ORS/feeding. Match the exact DSM 17938 strain and viable daily count.',
        evidence: ProbioticEvidence.veryLow,
        caveat: 'ESPGHAN recommendation is weak.',
        sourceLabel: 'ESPGHAN 2023',
      ),
      ProbioticUse(
        id: 'colic',
        indication: 'Treatment of infant colic',
        population: 'Breastfed, full-term infants with infant colic',
        dose: '1 × 10^8 CFU/day',
        frequency: 'Once daily',
        duration: 'At least 21 days',
        exactUse:
            'For the BioGaia Protectis Baby Drops example, 5 drops once daily supplies at least 1 × 10^8 CFU. Shake 10 seconds before use; give on a sterile spoon, breast, milk or formula; do not add to hot food/drink.',
        evidence: ProbioticEvidence.moderate,
        caveat:
            'No recommendation can be made for formula-fed infants because evidence is insufficient. The official BioGaia product is intended for full-term infants, not premature infants.',
        sourceLabel: 'ESPGHAN 2023 + BioGaia official instructions',
      ),
      ProbioticUse(
        id: 'fapd',
        indication: 'Functional abdominal pain disorders',
        population: 'Children',
        dose: '1 × 10^8 to 2 × 10^8 CFU/day',
        frequency: 'Daily',
        duration:
            'Study/product specific; no universal duration in the ESPGHAN summary recommendation.',
        exactUse:
            'Use only after an appropriate functional abdominal pain diagnosis and red-flag assessment.',
        evidence: ProbioticEvidence.moderate,
        caveat: 'Weak recommendation; not a treatment for unexplained abdominal pain.',
        sourceLabel: 'ESPGHAN 2023',
      ),
    ],
    safety: [
      'Do not use the colic regimen as an automatic constipation/diarrhea regimen.',
      'Do not administer the BioGaia bottle directly into the infant mouth; avoid saliva/water contamination of the container.',
      'For the verified Canadian BioGaia product: store dry at ≤25°C and use within 3 months after opening.',
    ],
  ),
  ProbioticProfile(
    id: 'bb12',
    displayName: 'Bifidobacterium animalis subsp. lactis BB-12',
    organismType: 'Bacterial probiotic',
    keyRule:
        'BB-12 is strain-specific. ESPGHAN lists a colic recommendation, but its summary dose and doses in cited RCTs are not perfectly aligned.',
    uses: [
      ProbioticUse(
        id: 'colic',
        indication: 'Treatment of infant colic',
        population: 'Breastfed infants with infant colic',
        dose:
            'ESPGHAN summary recommendation: 1 × 10^8 CFU/day; cited RCTs commonly evaluated 1 × 10^9 CFU/day.',
        frequency: 'Once daily in the cited trials',
        duration: '21–28 days',
        exactUse:
            'Because the guideline summary and cited trial doses differ, do not auto-convert a commercial BB-12 product. Verify the exact product and evidence-based dose before counseling.',
        evidence: ProbioticEvidence.moderate,
        caveat:
            'This internal dose discrepancy is deliberately shown as a safety lock rather than hidden.',
        sourceLabel: 'ESPGHAN 2023',
      ),
      ProbioticUse(
        id: 'nec-combo',
        indication: 'NEC prevention — specific 3-strain combination',
        population: 'Preterm infants in NICU',
        dose:
            'B. infantis BB-02 + B. lactis BB-12 + S. thermophilus TH-4: 3.0–3.5 × 10^8 CFU of EACH strain',
        frequency: 'NICU protocol only',
        duration: 'NICU protocol only',
        exactUse:
            'Do not replace this with “any three-strain probiotic.” Each named strain and its viable dose matter.',
        evidence: ProbioticEvidence.low,
        caveat:
            'Premature infants have a real risk of invasive infection from probiotic organisms; only use under neonatal specialist/unit protocol.',
        sourceLabel: 'ESPGHAN 2023 + NCCIH/FDA safety warning',
      ),
    ],
    safety: [
      'Total-CFU labeling of a multi-strain product is not enough to prove the BB-12 dose.',
      'Do not generalize BB-12 evidence to every B. lactis product.',
    ],
  ),
  ProbioticProfile(
    id: '19070-2-12246',
    displayName:
        'L. rhamnosus 19070-2 + L. reuteri DSM 12246 (specific combination)',
    organismType: 'Two-strain bacterial combination',
    keyRule:
        'This is a combination-specific regimen; both strains must be present at the studied dose.',
    uses: [
      ProbioticUse(
        id: 'age',
        indication: 'Acute gastroenteritis',
        population: 'Children',
        dose: '2 × 10^10 CFU of EACH strain per day',
        frequency: 'Daily total dose',
        duration: '5 days',
        exactUse:
            'Use as adjunct to rehydration. A product that contains only one strain, or gives only a pooled total CFU, does not match this regimen.',
        evidence: ProbioticEvidence.veryLow,
        caveat: 'Weak recommendation based on limited trials.',
        sourceLabel: 'ESPGHAN 2023',
      ),
    ],
    safety: [
      'Do not substitute other L. rhamnosus/L. reuteri strains.',
      'Require per-strain CFU, not just “40 billion total.”',
    ],
  ),
  ProbioticProfile(
    id: 'blongum-35624',
    displayName: 'Bifidobacterium longum subsp. longum 35624',
    organismType: 'Bacterial probiotic',
    keyRule:
        'A low dose can be the studied dose: more CFU is not automatically better.',
    uses: [
      ProbioticUse(
        id: 'ibs-adult',
        indication: 'IBS symptom relief',
        population: 'Adults with IBS',
        dose: '1 × 10^8 CFU/day in strain-specific evidence cited by WGO',
        frequency: 'Once daily',
        duration:
            'Use the evidence-based commercial/study course; do not assume indefinite therapy.',
        exactUse:
            'Match strain 35624 exactly. Reassess symptom benefit rather than escalating CFU just because another product advertises a larger number.',
        evidence: ProbioticEvidence.conflicting,
        caveat:
            'WGO cites strain-specific benefit, while AGA 2020 recommends probiotics for symptomatic IBS only in a clinical-trial context because the overall literature is heterogeneous.',
        sourceLabel: 'WGO 2023 + AGA 2020',
      ),
    ],
    safety: [
      'Do not judge probiotic quality by the largest CFU number.',
      'If no clinically meaningful benefit is seen after a reasonable trial, continuing indefinitely has little rationale.',
    ],
  ),
  ProbioticProfile(
    id: 'hn019',
    displayName: 'Bifidobacterium animalis subsp. lactis HN019',
    organismType: 'Bacterial probiotic',
    keyRule:
        'Earlier small studies suggested constipation benefit, but newer larger randomized trials did not confirm a clinically meaningful advantage over placebo.',
    uses: [
      ProbioticUse(
        id: 'constipation-adult',
        indication: 'Functional constipation',
        population: 'Adults',
        dose:
            'Do not auto-recommend. Trials have studied approximately 10^9–10^10 CFU/day, and a large 2024 trial tested about 4.69–7 × 10^9 CFU/day.',
        frequency: 'Once daily in major recent trials',
        duration: '8 weeks in recent large trials',
        exactUse:
            'Use standard constipation management first. If considered, explain the uncertain benefit and set a stop point if no objective improvement occurs.',
        evidence: ProbioticEvidence.againstRoutineUse,
        caveat:
            'Large 2024 and 2025 randomized trials did not show superiority over placebo for key constipation outcomes.',
        sourceLabel: 'JAMA Network Open 2024 + Mol Nutr Food Res 2025',
      ),
    ],
    safety: [
      'Do not preserve an old positive claim after newer higher-quality negative trials.',
      'Fiber, fluid, activity and evidence-based constipation therapy remain more important than strain marketing.',
    ],
  ),
];

const probioticProductExamples = <ProbioticProductExample>[
  ProbioticProductExample(
    name: 'BioGaia Protectis Baby Drops',
    strain: 'L. reuteri DSM 17938',
    amount: '5 drops = at least 1 × 10^8 CFU',
    directions:
        'Shake well for 10 seconds. Give 5 drops once daily on a sterile spoon, on the breast, or mixed into breast milk/formula. Do not add to hot food/drink and do not feed directly from the bottle.',
    storage:
        'Verified Canada label: store dry at ≤25°C, keep container closed, avoid saliva/water contamination, and use within 3 months after opening.',
    productSpecificLock:
        'Full-term infants only on the verified label. Do not copy “5 drops” to another brand: drop concentration differs by product.',
    sourceLabel: 'BioGaia official product instructions',
  ),
  ProbioticProductExample(
    name: 'Florastor Dual Action',
    strain: 'S. boulardii CNCM I-745',
    amount:
        'Official current page gives the serving as 2 capsules; it does not provide a universal mg↔CFU conversion on the displayed Supplement Information.',
    directions:
        '2 capsules 1–2 times daily. Swallow with at least 4 oz water/juice, with or without food. Capsule may be opened into soft food or noncarbonated beverage; avoid very hot (>122°F/50°C), alcoholic or carbonated beverages and consume within 30 minutes after mixing.',
    storage: 'Room temperature; official page says do not refrigerate.',
    productSpecificLock:
        'These are product-label directions, not a substitute for indication-specific guideline dosing. S. boulardii is contraindicated with central venous catheter, critical illness or immunocompromise per EMA safety labeling.',
    sourceLabel: 'Florastor official label page + EMA',
  ),
];

const microbiomeAdjuncts = <MicrobiomeAdjunct>[
  MicrobiomeAdjunct(
    name: 'Short-chain fructo-oligosaccharides (scFOS)',
    category: 'Prebiotic',
    dose: '5 g/day in a WGO-listed IBS evidence pathway',
    use:
        'May influence persistence of IBS symptoms in selected adult evidence; it is not interchangeable with every FOS/inulin product.',
    caveat:
        'Can increase gas/bloating. Start-low/go-slow may improve tolerance, but the evidence-based 5 g/day target should not be silently replaced by another fiber dose.',
    sourceLabel: 'WGO Probiotics & Prebiotics Guideline 2023',
  ),
  MicrobiomeAdjunct(
    name: 'Galacto-oligosaccharides (GOS)',
    category: 'Prebiotic',
    dose: '3.5 g/day in WGO-listed IBS evidence',
    use:
        'A prebiotic option with strain-independent microbiome effects; use is indication/product specific.',
    caveat:
        'Not all “prebiotic blends” reproduce this dose or composition. GI gas/bloating can limit use.',
    sourceLabel: 'WGO Probiotics & Prebiotics Guideline 2023',
  ),
  MicrobiomeAdjunct(
    name: 'Synbiotic',
    category: 'Probiotic + substrate',
    dose: 'No universal dose',
    use:
        'Must name BOTH the live strain(s) and the substrate, then match the exact combination to human evidence.',
    caveat:
        'A product is not evidence-based merely because it contains a probiotic plus fiber.',
    sourceLabel: 'ISAPP/WGO concepts',
  ),
  MicrobiomeAdjunct(
    name: 'Postbiotic',
    category: 'Preparation of inanimate microorganisms/components',
    dose: 'Product/indication specific',
    use:
        'Keep separate from live probiotics. CFU dosing logic does not apply the same way.',
    caveat:
        'Do not market or counsel a postbiotic as if it were simply a “dead probiotic” equivalent to the live strain.',
    sourceLabel: 'ISAPP consensus terminology',
  ),
];

const probioticGuidelineLocks = <String>[
  'Pediatric acute gastroenteritis: ESPGHAN 2023 weakly supports selected strains, while AGA 2020 suggests against routine probiotic use in North American children. Show both rather than pretending consensus.',
  'Pediatric functional constipation: ESPGHAN recommends against probiotics evaluated so far as single or adjunct therapy because efficacy is lacking.',
  'Crohn disease and ulcerative colitis: major GI guidelines do not support generic probiotic treatment; use only condition/formulation-specific guidance.',
  'C. difficile: probiotics are not treatment for active infection. AGA supports only selected formulations for prevention in antibiotic-exposed patients and recommends active CDI probiotic treatment only in clinical trials.',
  'Preterm/NICU probiotics are not retail self-care. Product contamination and invasive infection risk must be considered.',
];

ProbioticProfile probioticProfile(String id) {
  return probioticProfiles.singleWhere((item) => item.id == id);
}

ProbioticDoseMatch matchProbioticCfu({
  required double targetCfuPerDay,
  required double cfuPerServingForExactStrain,
  required bool perStrainCfuVerified,
}) {
  if (!perStrainCfuVerified) {
    return const ProbioticDoseMatch(
      locked: true,
      servingsPerDay: 0,
      message:
          'LOCKED: total blend CFU is not enough. Enter the CFU for the exact strain being matched.',
    );
  }
  if (targetCfuPerDay <= 0 || cfuPerServingForExactStrain <= 0) {
    return const ProbioticDoseMatch(
      locked: true,
      servingsPerDay: 0,
      message: 'Enter a valid target CFU/day and per-serving strain CFU.',
    );
  }
  final servings = targetCfuPerDay / cfuPerServingForExactStrain;
  return ProbioticDoseMatch(
    locked: false,
    servingsPerDay: servings,
    message:
        'Mathematical match only. Confirm the product formulation, maximum labeled serving, storage and the exact indication before counseling.',
  );
}
