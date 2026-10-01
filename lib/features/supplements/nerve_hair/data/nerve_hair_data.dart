import '../domain/nerve_hair_models.dart';

const nerveHairProfiles = <NerveHairProfile>[
  NerveHairProfile(
    id: 'biotin',
    name: 'Biotin (Vitamin B7)',
    domain: 'Hair / nails / neurologic high-dose marketing',
    coreRule:
        'Biotin has THREE very different dose contexts: nutritional intake in micrograms, cosmetic supplements in milligrams, and experimental pharmacologic doses hundreds of milligrams. Do not mix them.',
    uses: [
      NerveHairUse(
        indication: 'Normal daily nutritional intake',
        dose: '30 mcg/day for adults; 35 mcg/day during lactation.',
        frequency: 'Daily total intake from food + supplements.',
        duration: 'Ongoing nutritional intake.',
        evidence: NerveHairEvidence.nutritional,
        exactUse:
            'A low-dose multivitamin/B-complex around the daily need is enough if a patient elects to supplement despite an adequate diet.',
        caveat:
            'Biotin deficiency is rare in healthy people eating a mixed diet. More biotin does not automatically produce more hair growth.',
        sourceLabel: 'NIH ODS Biotin',
      ),
      NerveHairUse(
        indication: 'Brittle nails — small-study context',
        dose: '2.5 mg/day (2,500 mcg/day).',
        frequency: 'Once daily total dose.',
        duration: 'About 5.5 months in one small study; 6–15 months in a retrospective series.',
        evidence: NerveHairEvidence.limited,
        exactUse:
            'Use only after common nail causes are considered. This dose is about 80 times the adult AI and is not a routine nutritional requirement.',
        caveat:
            'Evidence comes from small uncontrolled/retrospective studies, not modern large randomized trials.',
        sourceLabel: 'NIH ODS Biotin — brittle nail studies',
      ),
      NerveHairUse(
        indication: 'Hair growth in otherwise healthy adults',
        dose:
            'NO evidence-based hair-growth dose. Market products commonly reach milligram doses; a verified NOW example provides 5 mg (5,000 mcg) once daily.',
        frequency: 'Product-specific.',
        duration: 'Do not auto-generate.',
        evidence: NerveHairEvidence.insufficient,
        exactUse:
            'If the patient takes a cosmetic biotin product anyway, record the exact mcg/mg dose and flag it before laboratory testing.',
        caveat:
            'NIH ODS states evidence supporting biotin for hair/skin/nails in healthy people is limited; case reports for hair benefit largely involve rare disorders/deficiency.',
        sourceLabel: 'NIH ODS Biotin + NOW Biotin 5,000 mcg label',
      ),
      NerveHairUse(
        indication: 'Progressive multiple sclerosis — historical high-dose trial',
        dose: '100 mg three times daily = 300 mg/day pharmaceutical-grade biotin.',
        frequency: 'Three times daily.',
        duration: '15+ months in the phase 3 SPI2 trial.',
        evidence: NerveHairEvidence.againstRoutineUse,
        exactUse:
            'Do NOT reproduce this as a supplement recommendation.',
        caveat:
            'SPI2 did not significantly improve disability or walking speed and concluded high-dose biotin cannot be recommended for progressive MS; laboratory-test interference remained clinically important.',
        sourceLabel: 'Lancet Neurology SPI2 phase 3 trial',
      ),
    ],
    safety: [
      'Biotin can cause clinically important interference with susceptible immunoassays, including some thyroid and troponin tests. The laboratory/clinician must know the exact dose.',
      'A single 10 mg dose has been reported to interfere with thyroid tests; high-dose products create greater concern.',
      'No UL is established because classic toxicity is low, but “no UL” does NOT mean no risk because assay interference can cause harmful misdiagnosis.',
      'Long-term anticonvulsant therapy can lower biotin status, but this is a risk-assessment question rather than an automatic megadose indication.',
    ],
  ),
  NerveHairProfile(
    id: 'thiamin-benfotiamine',
    name: 'Thiamin (B1) / Benfotiamine',
    domain: 'Nerve health / diabetic neuropathy marketing',
    coreRule:
        'Nutritional thiamin is measured around 1 mg/day; benfotiamine neuropathy studies use hundreds of milligrams. They are not the same clinical purpose.',
    uses: [
      NerveHairUse(
        indication: 'Normal daily nutritional intake',
        dose: 'Men 1.2 mg/day; women 1.1 mg/day. Typical multivitamins provide about 1.5 mg.',
        frequency: 'Once daily total intake.',
        duration: 'Ongoing nutrition.',
        evidence: NerveHairEvidence.nutritional,
        exactUse:
            'If a healthy patient wants a B1-containing multivitamin anyway, an amount near the daily requirement is sufficient.',
        caveat:
            'B-50/B-100 products can contain 50–100 mg thiamin, far above nutritional need without proving extra nerve benefit.',
        sourceLabel: 'NIH ODS Thiamin + current B-complex labels',
      ),
      NerveHairUse(
        indication: 'Diabetic sensorimotor polyneuropathy — benfotiamine evidence context',
        dose: '300 mg twice daily (600 mg/day).',
        frequency: 'Twice daily.',
        duration: '12 months in the 2026 BOND study.',
        evidence: NerveHairEvidence.againstRoutineUse,
        exactUse:
            'Do not sell this as proven long-term nerve regeneration therapy.',
        caveat:
            'The 2026 BOND randomized trial found no significant benefit on multiple morphometric, neurophysiologic or clinical neuropathy outcomes despite higher thiamine metabolites.',
        sourceLabel: 'BOND randomized trial 2026',
      ),
    ],
    safety: [
      'Benfotiamine is a synthetic thiamin derivative; do not equate its milligram dose with ordinary thiamin nutrition.',
      'Thiamin deficiency treatment and Wernicke-risk treatment are separate urgent clinical pathways and should not use wellness doses.',
    ],
  ),
  NerveHairProfile(
    id: 'vitamin-b6',
    name: 'Vitamin B6 (Pyridoxine / P5P)',
    domain: 'Nerve function — deficiency and toxicity both matter',
    coreRule:
        'Vitamin B6 is unusual: deficiency can cause neurologic problems, but chronic excess can ALSO cause sensory neuropathy.',
    uses: [
      NerveHairUse(
        indication: 'Normal daily nutritional intake',
        dose:
            'Adults 19–50: 1.3 mg/day; men 51+: 1.7 mg/day; women 51+: 1.5 mg/day.',
        frequency: 'Daily total intake.',
        duration: 'Ongoing nutrition.',
        evidence: NerveHairEvidence.nutritional,
        exactUse:
            'For a healthy person who insists on supplementing, keep a routine nutritional dose near the RDA/DV rather than using “B-50” or “B-100” as the default.',
        caveat:
            'More B6 is not better for nerve health.',
        sourceLabel: 'NIH ODS Vitamin B6',
      ),
      NerveHairUse(
        indication: 'High-dose B-complex / nerve formulas — market example',
        dose:
            '50–100 mg/day B6 occurs in current B-50/B-100 products, but these are HIGH doses relative to nutritional need.',
        frequency: 'Often once daily on product labels.',
        duration: 'Do NOT assume chronic daily use is appropriate.',
        evidence: NerveHairEvidence.againstRoutineUse,
        exactUse:
            'Count B6 from every B-complex, magnesium/nerve formula and multivitamin before continuing a high-dose product.',
        caveat:
            'NIH ODS notes neuropathy with excessive supplemental B6. The U.S. adult UL is 100 mg/day, while EFSA set a much lower adult UL of 12 mg/day in 2023 based on neuropathy risk.',
        sourceLabel: 'NIH ODS Vitamin B6 + EFSA 2023 + current NOW B-50/B-100 labels',
      ),
    ],
    safety: [
      'New numbness, burning, tingling or gait problems in a person taking high-dose B6 should trigger supplement review rather than adding another nerve vitamin.',
      'P5P versus pyridoxine branding does not justify ignoring the total B6 dose.',
    ],
  ),
  NerveHairProfile(
    id: 'vitamin-b12',
    name: 'Vitamin B12',
    domain: 'Nerve function / anemia / high-dose supplement market',
    coreRule:
        'B12 deficiency can cause neurologic injury, but a healthy person with adequate intake does not need a deficiency-treatment dose.',
    uses: [
      NerveHairUse(
        indication: 'Normal daily nutritional intake',
        dose: '2.4 mcg/day adults; 2.6 mcg pregnancy; 2.8 mcg lactation.',
        frequency: 'Daily total intake.',
        duration: 'Ongoing nutrition.',
        evidence: NerveHairEvidence.nutritional,
        exactUse:
            'If supplementing without deficiency, choose a dose appropriate to diet/risk rather than assuming 1,000 mcg is required.',
        caveat:
            'Vegans, older adults, metformin users and people with malabsorption may need a more deliberate B12 strategy.',
        sourceLabel: 'NIH ODS Vitamin B12',
      ),
      NerveHairUse(
        indication: 'Common supplement-market dose context',
        dose:
            'Multivitamins: typically 5–25 mcg; B-complex: 50–500 mcg; B12-only products: commonly 500–1,000 mcg.',
        frequency: 'Usually daily product serving.',
        duration: 'Depends on indication.',
        evidence: NerveHairEvidence.nutritional,
        exactUse:
            'These are common LABEL amounts, not personal requirements. High %DV is common because absorption falls markedly at large oral doses.',
        caveat:
            'No UL is established, but high dose does not prove greater benefit in an already replete person.',
        sourceLabel: 'NIH ODS Vitamin B12',
      ),
    ],
    safety: [
      'Neurologic symptoms plus possible B12 deficiency require prompt evaluation; do not mask them with an unmonitored B-complex.',
      'NIH ODS reports no evidence that cyanocobalamin, methylcobalamin and other supplement forms differ meaningfully in absorption efficacy.',
    ],
  ),
  NerveHairProfile(
    id: 'alpha-lipoic-acid',
    name: 'Alpha-lipoic acid (ALA)',
    domain: 'Diabetic peripheral neuropathy adjunct',
    coreRule:
        'ALA is not a vitamin requirement. Its main nerve evidence is symptom adjunct use in diabetic polyneuropathy, especially around 600 mg/day.',
    uses: [
      NerveHairUse(
        indication: 'Diabetic peripheral neuropathy symptom adjunct',
        dose: '600 mg/day oral is the most consistently studied practical dose.',
        frequency: 'Once daily in many regimens/products.',
        duration: 'Trials vary from weeks to months; reassess symptoms rather than continuing automatically.',
        evidence: NerveHairEvidence.limited,
        exactUse:
            'Use only after diabetic neuropathy is clinically assessed and glucose management/standard neuropathy care are addressed.',
        caveat:
            'A 2026 meta-analysis found symptom improvements particularly around 600 mg/day, but nerve-conduction and long-term glycemic outcomes remained inconclusive.',
        sourceLabel: '2026 DPN ALA systematic review/meta-analysis',
      ),
    ],
    safety: [
      'May lower glucose; review insulin and glucose-lowering medicines.',
      'GI upset can occur.',
      'This is not a treatment for unexplained neuropathy before B12 deficiency, medication toxicity and other causes are considered.',
    ],
  ),
  NerveHairProfile(
    id: 'acetyl-l-carnitine',
    name: 'Acetyl-L-carnitine (ALC)',
    domain: 'Diabetic peripheral neuropathy — limited evidence',
    coreRule:
        'ALC has neuropathy trials at gram doses, but evidence quality has historically been low and it is not a universal nerve supplement.',
    uses: [
      NerveHairUse(
        indication: 'Diabetic peripheral neuropathy — study range',
        dose: '1,500–3,000 mg/day in trials; a 2024 phase 3 trial used 1,500 mg/day.',
        frequency: 'Divided or daily total depending on trial/product.',
        duration: '24 weeks in the 2024 phase 3 trial; older studies ran 6–12 months.',
        evidence: NerveHairEvidence.conflicting,
        exactUse:
            'Use only with a defined neuropathy diagnosis and measurable symptom/clinical goal.',
        caveat:
            'Cochrane found very low-certainty evidence for pain benefit; the newer 2024 trial improved a clinical neuropathy score but not pain significantly and electrophysiology remained inconclusive.',
        sourceLabel: 'Cochrane ALC review + 2024 phase 3 DPN trial',
      ),
    ],
    safety: [
      'GI effects, headache and paresthesia have been reported.',
      'Do not add ALC casually on top of multiple carnitine-containing fertility/mitochondrial products without counting total intake.',
    ],
  ),
  NerveHairProfile(
    id: 'b-complex',
    name: 'B-Complex (B-50 / B-100 style products)',
    domain: 'Common “nerve vitamin” combinations',
    coreRule:
        'The product name B-50 or B-100 describes milligram-heavy marketing, not a physiologic daily need. The main chronic safety trap is vitamin B6.',
    uses: [
      NerveHairUse(
        indication: 'Healthy adult taking a B-complex “for nerves/energy” anyway',
        dose:
            'Prefer a low-potency formula near daily values. Current B-50/B-100 examples contain 50–100 mg of B1/B2/B3/B6 plus 50–100 mcg B12/biotin per daily tablet/capsule.',
        frequency: 'Usually once daily with food on current product labels.',
        duration: 'Low-potency use can be periodic/ongoing if justified; high-potency chronic use needs review.',
        evidence: NerveHairEvidence.insufficient,
        exactUse:
            'Read every B-vitamin amount individually; do not judge safety from “B-complex” on the front label.',
        caveat:
            'A B-complex does not treat unexplained neuropathy by itself. High-dose B6 can cause neuropathy, while high biotin can interfere with tests.',
        sourceLabel: 'NIH ODS B-vitamin fact sheets + current NOW B-50/B-100 labels',
      ),
    ],
    safety: [
      'Avoid chronic B-50/B-100 use as an automatic wellness habit without reviewing B6, niacin, folic acid and biotin exposure.',
      'Taking two B-complex products together is usually duplication, not synergy.',
    ],
  ),
];

NerveHairProfile nerveHairProfile(String id) {
  return nerveHairProfiles.singleWhere((item) => item.id == id);
}

const nerveHairGlobalLocks = <String>[
  'Neuropathy is a diagnosis problem first: diabetes, B12 deficiency, B6 excess, alcohol, medications, compression and many other causes can look similar.',
  'A “nerve support” label does not prove the product treats neuropathy.',
  'Biotin high dose can distort laboratory results; B6 high dose can itself cause neuropathy.',
  'Hair loss is not automatically biotin deficiency. Sudden, patchy, scarring or persistent diffuse hair loss needs diagnosis rather than escalating biotin.',
];
