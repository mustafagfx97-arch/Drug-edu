class FeedingTubeProfile {
  const FeedingTubeProfile({
    required this.name,
    required this.formulation,
    required this.route,
    required this.preparation,
    required this.feedHandling,
    required this.flushNote,
    required this.safety,
    required this.source,
  });

  final String name;
  final String formulation;
  final String route;
  final String preparation;
  final String feedHandling;
  final String flushNote;
  final String safety;
  final String source;
}

const feedingTubeProfiles = <FeedingTubeProfile>[
  FeedingTubeProfile(
    name: 'Metoprolol tartrate',
    formulation: 'Immediate-release tablet',
    route: 'Gastric or post-pyloric tube',
    preparation:
        'Crush tablet(s) to a fine powder and disperse in 10 mL purified water; draw into an enteral syringe and administer promptly.',
    feedHandling:
        'Hold enteral nutrition during administration. For intermittent feeds, give just before the scheduled feed; for continuous feeds, restart after the final flush.',
    flushNote:
        'Flush before and after with the lowest volume needed to clear the tube, individualized to patient size/tube and local policy.',
    safety:
        'Some film-coated tablets may increase clogging risk if not dispersed well. Keep administration consistent in relation to feeds.',
    source: 'Project library · Metoprolol enteral monograph',
  ),
  FeedingTubeProfile(
    name: 'Metoprolol succinate',
    formulation: 'Extended-release tablet',
    route: 'Feeding tube',
    preparation:
        'Do NOT crush extended-release tablets for feeding-tube administration.',
    feedHandling: 'Not applicable for crushed ER tablet administration.',
    flushNote: 'Choose a suitable alternative formulation if enteral-tube delivery is required.',
    safety:
        'Enteral administration of ER tablets is not recommended; crushing modified-release tablets can cause dose dumping and dangerous variability.',
    source: 'Project library · Metoprolol enteral monograph',
  ),
  FeedingTubeProfile(
    name: 'Metoprolol succinate sprinkle capsule',
    formulation: 'Extended-release sprinkle capsule',
    route: 'Gastric tube ≥12 Fr when exact product supports this method',
    preparation:
        'Open capsule, place contents in an all-plastic enteral syringe, add 15 mL purified water and gently shake for about 10 seconds; administer immediately and ensure no pellets remain.',
    feedHandling: 'Hold enteral nutrition during administration and restart after final flush.',
    flushNote:
        'Flush before and after with an individualized volume; rinse syringe to deliver retained pellets.',
    safety:
        'This applies to supported sprinkle-capsule formulations, not to ER tablets generally.',
    source: 'Project library · Metoprolol enteral monograph',
  ),
  FeedingTubeProfile(
    name: 'Phenytoin',
    formulation: 'Oral liquid / enteral administration',
    route: 'Prefer gastric over jejunal when feasible',
    preparation:
        'Use the appropriate liquid/formulation and administer separately from other medicines. Dose/formulation conversion and level interpretation require pharmacist review.',
    feedHandling:
        'Enteral feeds can markedly reduce absorption. ICU reference recommends stopping feeds for 2 hours before and 2 hours after phenytoin administration, with concentration monitoring and local protocol confirmation.',
    flushNote:
        'Flush tube before and after according to patient/tube requirements and institutional protocol.',
    safety:
        'Jejunal administration is not recommended when avoidable because reduced effectiveness/absorption problems can occur. Monitor levels closely if tube route changes.',
    source: 'Handbook of Drugs in Intensive Care 7th ed. 2025',
  ),
  FeedingTubeProfile(
    name: 'Sodium valproate',
    formulation: 'Oral liquid',
    route: 'NG/enteral when suitable product is used',
    preparation:
        'Sodium valproate liquid is a practical enteral option. Verify the exact salt/formulation and concentration before conversion.',
    feedHandling:
        'No universal feed hold is assumed; follow formulation-specific/local enteral guidance.',
    flushNote:
        'Administer separately and flush appropriately before/after.',
    safety:
        'Do not confuse sodium valproate with valproic acid/divalproex products. ICU reference specifically warns against assuming valproic-acid formulations are suitable for NG use.',
    source: 'Handbook of Drugs in Intensive Care 7th ed. 2025',
  ),
  FeedingTubeProfile(
    name: 'Amiodarone',
    formulation: 'Oral tablet',
    route: 'Gastric or post-pyloric tube only when no preferred alternative',
    preparation:
        'Tube administration is not preferred because crushed tablets have produced unpredictable absorption. If use is necessary under a validated protocol: crush to fine powder and disperse in at least 15 mL purified water immediately before administration.',
    feedHandling:
        'Hold enteral nutrition during administration; maintain consistent timing relative to feeds and restart after the final flush.',
    flushNote:
        'Flush before and after with an individualized amount of purified water; rinse preparation container/syringe to ensure full dose delivery.',
    safety:
        'Monitor clinical response because tube absorption may be reduced or unpredictable.',
    source: 'Project library · Amiodarone enteral monograph',
  ),
  FeedingTubeProfile(
    name: 'Omeprazole delayed-release capsule',
    formulation: 'Enteric-coated pellets in capsule',
    route: 'Tube use is product/protocol specific',
    preparation:
        'Do not crush or chew enteric-coated pellets. The current DailyMed capsule label supports opening onto applesauce for oral use, but that does NOT automatically establish a universal NG method.',
    feedHandling:
        'Use a validated tube-specific formulation/protocol if enteral-tube administration is required.',
    flushNote:
        'Flush requirements depend on the selected validated preparation and tube.',
    safety:
        'Avoid improvised crushing or mixing that destroys enteric coating; tube clogging and loss of acid protection can occur.',
    source: 'DailyMed omeprazole delayed-release labeling',
  ),
];
