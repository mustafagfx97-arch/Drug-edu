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
  /// Nominal FINAL solution volume, not the amount of supplied diluent.
  /// Null when the exact manufacturer has no independently verified IFU.
  final double? reconstitutedMl;
  final String reconstitution;
  final String compatibleInfusionFluids;
  final String administration;
  final String furtherDilution;
  final String safety;
  final String sourceUrl;

  double? get stockMgPerMl => reconstitutedMl == null ||
          reconstitutedMl! <= 0 || !reconstitutedMl!.isFinite
      ? null
      : amountMgEquivalent / reconstitutedMl!;

  bool get sourceVerifiedFinalVolume => stockMgPerMl != null;
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
    id: 'mpsone-scotmed-1000mg-10ml-supplied-unverified',
    label: 'MPSONE 1 g · SCOTMED CARE · 10 mL diluent supplied (verify IFU)',
    amountMgEquivalent: 1000,
    reconstitutedMl: null,
    reconstitution:
        'MPSONE 1 g (SCOTMED CARE, methylprednisolone sodium succinate '
        'powder): local pharmacist reports a SEPARATE 10 mL water ampoule '
        'supplied in the box. Confirm the diluent label says STERILE '
        'WATER FOR INJECTION (WFI), not ordinary distilled water. '
        'The exact manufacturer-approved volume to ADD, final solution '
        'volume and concentration have NOT been confirmed from '
        'this brand\'s official package insert. Do NOT apply Pfizer '
        '1 g Act-O-Vial 8 mL or plain-vial 16 mL instructions. '
        'Do not infer that supplied 10 mL = final 10 mL.',
    compatibleInfusionFluids:
        'Manufacturer-specific MPSONE infusion compatibility NOT yet '
        'verified from a current package insert. Reference labeling '
        'for OTHER methylprednisolone sodium succinate products '
        '(Pfizer) lists 0.9% NaCl, D5W or D5W/NS after reconstitution, '
        'but these data alone do not validate the SCOTMED product. '
        'Confirm with the exact manufacturer insert / pharmacy. '
        'Fluid compatibility never establishes Y-site compatibility.',
    administration:
        '1 g is a HIGH-DOSE methylprednisolone sodium succinate IV '
        'regimen; administer by CONTROLLED infusion under the '
        'indication-specific order. Reference labels for the active '
        'drug recommend at least 30 minutes for high-dose IV '
        'administration; MPSONE-specific directions remain unverified. '
        'Avoid rapid IV push: doses >500 mg in <10 minutes have been '
        'associated with arrhythmia and cardiac arrest.',
    furtherDilution:
        'Determine the actual MPSONE reconstitution instructions '
        'from its insert FIRST. For the later IV infusion, select '
        'fluid and final bag volume from a locally validated '
        'manufacturer/protocol. Do not assume a universal '
        '50/100/250 mL bag size, final concentration, shelf life '
        'or infusion-line compatibility.',
    safety:
        'Confirmed from carton: MPSONE 1,000 mg methylprednisolone '
        'sodium succinate, SCOTMED CARE, labeled IM/IV. '
        '10 mL supplied ampoule is LOCAL PHARMACIST-REPORTED, '
        'not documented by manufacturer IFU. Manufacturer website '
        'confirms product identity, but does NOT provide a verified '
        '10 mL reconstitution instruction, final stock concentration, '
        'preservative content or stability. '
        'Manual withdrawal-volume calculation DISABLED until verified.',
    sourceUrl: 'https://www.scotmedcare.com/products/page/5/',
  ),
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
