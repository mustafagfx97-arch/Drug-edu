class TubeFeedInteractionRecord {
  const TubeFeedInteractionRecord({
    required this.medicine,
    required this.issue,
    required this.feedInstruction,
    required this.monitoring,
    required this.source,
  });

  final String medicine;
  final String issue;
  final String feedInstruction;
  final String monitoring;
  final String source;
}

class TubeSafetyRule {
  const TubeSafetyRule({
    required this.title,
    required this.action,
    required this.why,
    required this.source,
    this.critical = false,
  });

  final String title;
  final String action;
  final String why;
  final String source;
  final bool critical;
}

/// Current practical medicine-feed interactions summarized from NHS SPS
/// "Managing interactions between medicines and enteral feeds",
/// republished 18 Sep 2025.
const tubeFeedInteractions = <TubeFeedInteractionRecord>[
  TubeFeedInteractionRecord(
    medicine: 'Digoxin',
    issue: 'High-fibre enteral feeds can reduce digoxin absorption.',
    feedInstruction:
        'For high-fibre feeds, withhold feed for 2 hours before and 1 hour after the dose.',
    monitoring:
        'Monitor clinical response and digoxin monitoring parameters according to the indication and patient risk.',
    source: 'NHS SPS · Managing interactions between medicines and enteral feeds · 2025',
  ),
  TubeFeedInteractionRecord(
    medicine: 'Fluoroquinolones',
    issue:
        'Calcium, magnesium, iron, zinc and other multivalent cations in enteral feeds can chelate fluoroquinolones and reduce absorption.',
    feedInstruction:
        'Prefer an alternative route/antibiotic when appropriate. If enteral administration is used, NHS SPS advises withholding feed for 2 hours before and 2 hours after the dose.',
    monitoring:
        'Assess treatment response closely; antibiotic choice and dose remain prescriber decisions.',
    source: 'NHS SPS · Managing interactions between medicines and enteral feeds · 2025',
  ),
  TubeFeedInteractionRecord(
    medicine: 'Phenoxymethylpenicillin (Penicillin V)',
    issue: 'Enteral nutrition can significantly reduce absorption.',
    feedInstruction:
        'Consider an alternative route/antibiotic. If enteral use is necessary, NHS SPS advises withholding feed for 2 hours before and 1 hour after.',
    monitoring: 'Monitor clinical response.',
    source: 'NHS SPS · Managing interactions between medicines and enteral feeds · 2025',
  ),
  TubeFeedInteractionRecord(
    medicine: 'Phenytoin',
    issue: 'Enteral nutrition can significantly reduce phenytoin absorption.',
    feedInstruction:
        'Avoid feeding-tube administration when a suitable alternative exists. If it must be used, NHS SPS advises withholding feed for 2 hours before and 2 hours after.',
    monitoring:
        'Serum phenytoin concentrations and clinical response require close monitoring when administration or feed pattern changes.',
    source: 'NHS SPS · Managing interactions between medicines and enteral feeds · 2025',
  ),
  TubeFeedInteractionRecord(
    medicine: 'Warfarin',
    issue: 'Enteral nutrition can reduce warfarin absorption/clinical effect.',
    feedInstruction:
        'NHS SPS advises withholding feed for 1 to 2 hours before and after each dose.',
    monitoring:
        'Monitor INR closely when feed formulation, feed timing or warfarin administration changes.',
    source: 'NHS SPS · Managing interactions between medicines and enteral feeds · 2025',
  ),
];

const tubeSafetyRules = <TubeSafetyRule>[
  TubeSafetyRule(
    title: 'Modified-release / prolonged-release products',
    action:
        'Do not routinely crush or open. Verify the exact product and release mechanism; choose a suitable alternative formulation when the release system would be destroyed.',
    why:
        'Crushing can release the whole dose rapidly or change the intended absorption profile.',
    source: 'NHS SPS · Choosing medicines for enteral tube administration · 2025',
    critical: true,
  ),
  TubeSafetyRule(
    title: 'Enteric-coated / gastro-resistant products',
    action:
        'Do not routinely crush. Verify whether an alternative formulation or a validated tube method exists for the exact product.',
    why:
        'Destroying the coating can expose an acid-labile drug, irritate the stomach or change the intended site of release.',
    source: 'NHS SPS · Swallowing difficulties / enteral tube guidance · 2025–2026',
    critical: true,
  ),
  TubeSafetyRule(
    title: 'Hazardous handling',
    action:
        'Avoid open crushing when occupational exposure is a concern. Assess PPE, containment and alternative formulations for cytotoxic, teratogenic, hormonal, selected antibiotic or immunosuppressive medicines.',
    why:
        'Crushing/opening can generate powder or droplets that expose staff, carers or family members.',
    source: 'NHS SPS · Choosing medicines for enteral tube administration · 2025',
    critical: true,
  ),
  TubeSafetyRule(
    title: 'Liquids are not automatically safer',
    action:
        'Check concentration, viscosity, osmolality, sorbitol/excipients, sodium load and tube compatibility before selecting a liquid.',
    why:
        'Viscous liquids can resist flushing; hyperosmolar or sorbitol-rich products can cause GI intolerance, and some formulations may block small-bore tubes.',
    source: 'NHS SPS · Choosing medicines for enteral tube administration · 2025',
  ),
  TubeSafetyRule(
    title: 'Granules / effervescent products',
    action:
        'Verify particle size and whether complete dispersion is possible before use through the actual tube bore.',
    why:
        'Large granules, gels, gas production or sediment can obstruct the tube.',
    source: 'NHS SPS · Choosing medicines for enteral tube administration · 2025',
  ),
  TubeSafetyRule(
    title: 'Gastric vs post-pyloric tube',
    action:
        'Confirm the tube tip location before recommending administration. Do not assume gastric and jejunal delivery are interchangeable.',
    why:
        'Site of absorption, first-pass metabolism and local drug action can change when the stomach is bypassed.',
    source: 'NHS SPS · Choosing medicines for enteral tube administration · 2025',
    critical: true,
  ),
];

const injectableEnteralSafetyRules = <TubeSafetyRule>[
  TubeSafetyRule(
    title: 'No blanket permission',
    action:
        'Do not label an ampoule/vial as drinkable or tube-safe merely because it is injectable. Verify the exact formulation and a licensed or supported enteral route.',
    why:
        'Most injections are not licensed for enteral use, and excipients, pH, bioavailability and acid stability can differ from oral formulations.',
    source: 'NHS SPS · Assessing injectables for enteral administration · updated 2026',
    critical: true,
  ),
  TubeSafetyRule(
    title: 'Document off-label enteral use',
    action:
        'When an injectable is deliberately used enterally, document the product, route, preparation method and monitoring plan in the medication record/care plan.',
    why:
        'Complex manipulation and off-label use introduce additional error and monitoring requirements.',
    source: 'NHS SPS · Assessing injectables for enteral administration · updated 2026',
  ),
  TubeSafetyRule(
    title: 'Glass ampoules need appropriate withdrawal equipment',
    action:
        'Use locally approved equipment such as a filter straw/needle when required, then transfer to an enteral/oral syringe for administration.',
    why:
        'This reduces the risk of glass-particle ingestion and route-selection errors.',
    source: 'NHS SPS · Assessing injectables for enteral administration · updated 2026',
  ),
];
