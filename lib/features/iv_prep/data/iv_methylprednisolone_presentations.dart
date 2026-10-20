/// Manufacturer/product-specific METHYLPREDNISOLONE SODIUM SUCCINATE
/// presentations. Amounts are methylprednisolone EQUIVALENTS, not the
/// molecular mass of its sodium succinate ester. The two 1 g presentations
/// have DIFFERENT preparation systems and stock concentrations.
/// US-labelled manufacturer products are examples; local availability
/// and the actual carton/insert MUST be checked before preparation.
class IvMethylprednisolonePresentation {
  const IvMethylprednisolonePresentation({
    required this.id,
    required this.label,
    required this.amountMgEquivalent,
    required this.reconstitutedMl,
    required this.reconstitution,
    required this.compatibleInfusionFluids,
    required this.administration,
    required this.furtherDilution,
    required this.safety,
    required this.sourceUrl,
  });

  final String id;
  final String label;
  final double amountMgEquivalent;
  final double reconstitutedMl;
  final String reconstitution;
  final String compatibleInfusionFluids;
  final String administration;
  final String furtherDilution;
  final String safety;
  final String sourceUrl;

  double get stockMgPerMl => amountMgEquivalent / reconstitutedMl;
}

const _pfizerSoluMedrol = 'https://labeling.pfizer.com/ShowLabeling.aspx?id=10890';
const _pfizerLabelLegacy = 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=cd99be87-c8d9-48d6-a8e5-e081052e3f19';

const _reconstitutedInfusionFluid =
    'For an IV INFUSION after reconstitution: D5W, 0.9% sodium chloride '
    '(isotonic saline), or D5W in 0.9% sodium chloride, as stated in '
    'the cited Pfizer label. Do not assume Y-site compatibility.';

const _usualMethylpredAdministration =
    'IV injection or IV infusion is product/indication-specific. '
    'For a HIGH-DOSE regimen, infuse over at least 30 minutes. '
    'Rapid administration of more than 500 mg in less than 10 minutes '
    'has been associated with arrhythmia/cardiac arrest. '
    'Confirm the actual order/indication and monitor BP, HR and glucose.';

const _furtherDilution =
    'Reconstitute the vial FIRST. For IV infusion, transfer the prescribed '
    'amount into a separately verified volume of a listed compatible '
    'fluid. The label does not prescribe ONE universal bag size for 1 g; '
    'use the exact manufacturer/local protocol. Do not administer a '
    '1 g pulse as a rapid IV push.';

const ivMethylprednisolonePresentations =
    <IvMethylprednisolonePresentation>[
  IvMethylprednisolonePresentation(
    id: 'solu-medrol-40mg-actovial',
    label: 'SOLU-MEDROL 40 mg ACT-O-VIAL · preservative-free',
    amountMgEquivalent: 40,
    reconstitutedMl: 1,
    reconstitution:
        'ACT-O-VIAL: press plastic activator, allow the built-in '
        'diluent to mix with powder, gently agitate, remove tab, '
        'disinfect stopper; nominal 1 mL provides 40 mg.',
    compatibleInfusionFluids: _reconstitutedInfusionFluid,
    administration:
        'Follow the indication-specific IV order. Do not copy the '
        'high-dose regimen to routine small IV doses.',
    furtherDilution:
        'For IV infusion, further dilute only according to the '
        'specific regimen and compatible fluid list.',
    safety:
        'This 40 mg presentation contains lactose derived from cow milk; '
        'contraindicated in patients with known or suspected cow-milk '
        'hypersensitivity. Do not confuse with a plain vial.',
    sourceUrl: _pfizerSoluMedrol,
  ),
  IvMethylprednisolonePresentation(
    id: 'solu-medrol-125mg-actovial',
    label: 'SOLU-MEDROL 125 mg ACT-O-VIAL · preservative-free',
    amountMgEquivalent: 125,
    reconstitutedMl: 2,
    reconstitution:
        'ACT-O-VIAL: activate enclosed diluent, gently agitate, '
        'remove tab and disinfect; 125 mg in a nominal final 2 mL '
        '(62.5 mg/mL).',
    compatibleInfusionFluids: _reconstitutedInfusionFluid,
    administration:
        'Follow the indication-specific IV order. High-dose '
        'pulse timing is NOT an automatic rule for 125 mg.',
    furtherDilution:
        'For IV infusion, transfer the prepared prescribed dose '
        'to the source-supported infusion fluid as ordered.',
    safety:
        'Preservative-free Act-O-Vial; do not use plain-vial '
        'reconstitution instructions.',
    sourceUrl: _pfizerSoluMedrol,
  ),
  IvMethylprednisolonePresentation(
    id: 'solu-medrol-500mg-actovial',
    label: 'SOLU-MEDROL 500 mg ACT-O-VIAL · preservative-free',
    amountMgEquivalent: 500,
    reconstitutedMl: 4,
    reconstitution:
        'Activate the built-in ACT-O-VIAL diluent, gently mix '
        'to dissolve, disinfect stopper; 500 mg in a nominal '
        'final 4 mL (125 mg/mL). DO NOT add 8 mL: that applies '
        'to the separate preserved 500 mg plain vial.',
    compatibleInfusionFluids: _reconstitutedInfusionFluid,
    administration: _usualMethylpredAdministration,
    furtherDilution: _furtherDilution,
    safety:
        'Preservative-free ACT-O-VIAL is different from a '
        'benzyl-alcohol-containing conventional 500 mg vial.',
    sourceUrl: _pfizerLabelLegacy,
  ),
  IvMethylprednisolonePresentation(
    id: 'solu-medrol-1000mg-actovial',
    label: 'SOLU-MEDROL 1 g ACT-O-VIAL · preservative-free',
    amountMgEquivalent: 1000,
    reconstitutedMl: 8,
    reconstitution:
        'ACT-O-VIAL (integrated diluent): press the activator, '
        'gently mix, disinfect and withdraw. '
        '1,000 mg in a nominal final 8 mL = 125 mg/mL. '
        'Do NOT add 16 mL: that belongs to the separate '
        'plain-vial product.',
    compatibleInfusionFluids: _reconstitutedInfusionFluid,
    administration: _usualMethylpredAdministration,
    furtherDilution: _furtherDilution,
    safety:
        'This is a preservative-free 1 g ACT-O-VIAL, NOT the '
        'benzyl-alcohol-containing 1 g plain vial. '
        'Check the actual country/manufacturer packaging.',
    sourceUrl: _pfizerLabelLegacy,
  ),
  IvMethylprednisolonePresentation(
    id: 'solu-medrol-500mg-plain',
    label: 'SOLU-MEDROL 500 mg PLAIN vial · benzyl alcohol diluent',
    amountMgEquivalent: 500,
    reconstitutedMl: 8,
    reconstitution:
        'PLAIN vial (no prefilled activator): Pfizer label calls for '
        '8 mL of specified Bacteriostatic Water for Injection '
        'containing benzyl alcohol; nominal 500 mg/8 mL '
        '= 62.5 mg/mL. Verify actual local insert.',
    compatibleInfusionFluids: _reconstitutedInfusionFluid,
    administration: _usualMethylpredAdministration,
    furtherDilution: _furtherDilution,
    safety:
        'Benzyl alcohol-containing preparation is NOT interchangeable '
        'with preservative-free ACT-O-VIAL and must not be used in '
        'premature infants.',
    sourceUrl: _pfizerLabelLegacy,
  ),
  IvMethylprednisolonePresentation(
    id: 'solu-medrol-1000mg-plain',
    label: 'SOLU-MEDROL 1 g PLAIN vial · benzyl alcohol diluent',
    amountMgEquivalent: 1000,
    reconstitutedMl: 16,
    reconstitution:
        'PLAIN vial (without built-in diluent): reconstitute '
        'with 16 mL of the specified Bacteriostatic Water for '
        'Injection containing benzyl alcohol, according to '
        'the cited Pfizer plain-vial label. Nominal stock '
        '1,000 mg/16 mL = 62.5 mg/mL. Check the actual carton: '
        'this is NOT the 1 g ACT-O-VIAL (8 mL).',
    compatibleInfusionFluids: _reconstitutedInfusionFluid,
    administration: _usualMethylpredAdministration,
    furtherDilution: _furtherDilution,
    safety:
        'Preserved plain-vial preparation; benzyl alcohol is '
        'contraindicated for premature infants. Some OTHER brands '
        'call for different reconstitution volumes (e.g. 15.6 mL), '
        'so this 16 mL rule applies ONLY to the specified '
        'Pfizer plain vial. Inspect the exact product insert.',
    sourceUrl: _pfizerSoluMedrol,
  ),
];


/// A documented local BRAND, but with NO validated manufacturer
/// reconstitution/finished-volume instructions on file. Do NOT infer a
/// concentration from the 10 mL supplied diluent. The manufacturer catalogue
/// confirms the 1 g vial + WFI kit but DOES NOT specify the WFI volume.
class IvMethylprednisolonePendingPresentation {
  const IvMethylprednisolonePendingPresentation({
    required this.id,
    required this.label,
    required this.amountMgEquivalent,
    required this.localReportedSuppliedWfiMl,
    required this.sourceUrl,
  });

  final String id;
  final String label;
  final double amountMgEquivalent;
  final double localReportedSuppliedWfiMl;
  final String sourceUrl;

  bool get stockConcentrationVerified => false;

  String get reconstitution =>
      'SCOTMED CARE MPSONE 1 g lyophilized vial. '
      'The local carton reportedly includes a 10 mL ampoule of water. '
      'This is a SUPPLIED diluent amount, NOT independently verified '
      'manufacturer instructions to add all 10 mL and NOT the final '
      'reconstituted volume. Check the exact package insert/ampoule '
      'label before reconstituting. Do NOT substitute the Pfizer '
      'SOLU-MEDROL 8 mL or 16 mL methods.';

  String get compatibleInfusionFluids =>
      'Mpsone-specific dilution-fluid compatibility has NOT been '
      'confirmed from an approved product insert. 0.9% NaCl / D5W '
      'are listed for some other methylprednisolone sodium succinate '
      'products, but are NOT automatically authorized for this brand. '
      'Verify the exact local/manufacturer protocol.';

  String get administration =>
      'For a prescribed high-dose 1 g IV pulse, use controlled IV '
      'infusion over AT LEAST 30 minutes per methylprednisolone sodium '
      'succinate labeling/approved local protocol, not rapid IV push. '
      'Serious arrhythmia/cardiac arrest has occurred with rapid '
      '>500 mg IV doses in less than 10 minutes. Monitor the patient.';

  String get furtherDilution =>
      'Manufacturer-specific reconstitution and final stock '
      'concentration are not yet documented. Do not calculate '
      'withdrawal volume from 1,000 mg / 10 mL. Final IV infusion '
      'volume, fluid compatibility and stability require the '
      'exact Mpsone package insert or independent local approval.';

  String get safety =>
      'MPSone is methylprednisolone sodium succinate (IV/IM); '
      'SCOTMED also markets methylprednisolone ACETATE suspension '
      '(not for IV). Verify package identity. The local 10 mL WFI '
      'ampoule is reported by the clinician, not a manufacturer-'
      'verified preparation instruction. Unknown preservative '
      'status, excipients and after-reconstitution BUD.';

  String get sourceStatus =>
      'Manufacturer product catalogue verifies MPSONE 1 g '
      '(30 mL capacity vial + WFI kit). It does NOT specify 10 mL '
      'WFI, exact preparation volume or finished concentration. '
      'A local front-carton photo establishes 1 g sodium succinate '
      'IV/IM and clinician reports a 10 mL supplied diluent.';
}

const ivMpsoneLocalPending = IvMethylprednisolonePendingPresentation(
  id: 'scotmed-mpsone-1000mg-wfi-pending',
  label: 'MPSONE 1 g (SCOTMED CARE) · 10 mL WFI kit reported · VERIFY',
  amountMgEquivalent: 1000,
  localReportedSuppliedWfiMl: 10,
  sourceUrl:
      'https://www.scotmedcare.com/wp-content/uploads/2024/02/Scotmed-Care-Pvt-Ltd-PCD.pdf',
);
