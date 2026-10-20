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
  /// The FINAL reconstituted volume (not merely supplied diluent volume).
  /// Unknown for products without a reviewed manufacturer IFU.
  final double? reconstitutedMl;
  final String reconstitution;
  final String compatibleInfusionFluids;
  final String administration;
  final String furtherDilution;
  final String safety;
  final String sourceUrl;

  bool get hasVerifiedStockConcentration =>
      reconstitutedMl != null && reconstitutedMl!.isFinite &&
      reconstitutedMl! > 0;

  double? get stockMgPerMl => hasVerifiedStockConcentration
      ? amountMgEquivalent / reconstitutedMl!
      : null;
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
  IvMethylprednisolonePresentation(
    id: 'scotmed-mpsone-1000mg-with-10ml-wfi-unverified',
    label: 'Mpsone 1 g SCOTMED CARE · WFI 10 mL supplied (UNVERIFIED)',
    amountMgEquivalent: 1000,
    // No manufacturer-approved quantity TO ADD or FINAL volume was found.
    // The user reports a supplied 10 mL water ampoule. The company
    // catalogue lists 1 g vial + WFI + tray without dilution instructions.
    reconstitutedMl: null,
    reconstitution:
        'Mpsone 1000 mg (SCOTMED CARE): the available local carton includes '
        'a 10 mL ampoule reportedly supplied as Water for Injection. '
        'Confirm the ampoule actually reads STERILE WATER FOR INJECTION. '
        'The exact volume to ADD and the FINAL reconstituted volume are '
        'NOT VERIFIED by a manufacturer package insert. Do not assume '
        'that the supplied 10 mL must all be added, or that the final '
        'concentration is 100 mg/mL. Obtain and check the Mpsone '
        'manufacturer insert or contact SCOTMED CARE pharmacy information.',
    compatibleInfusionFluids:
        'Mpsone-specific diluent and infusion-fluid compatibility have '
        'NOT been independently verified from its approved insert. '
        'Do not transfer Solu-Medrol/Pfizer reconstitution, stability '
        'or fluid directions to this different brand. Verify the '
        'current approved Mpsone leaflet or hospital pharmacy protocol.',
    administration:
        'For a prescribed 1 g HIGH-DOSE IV methylprednisolone sodium '
        'succinate regimen, reference labeling warns against rapid '
        'administration: generally infuse over at least 30 minutes '
        '(indication/protocol dependent). Cardiac arrhythmias/arrest '
        'have occurred when doses greater than 500 mg were given '
        'in under 10 minutes. This is class/reference-label guidance '
        'NOT a verified Mpsone-specific administration instruction.',
    furtherDilution:
        'Verify Mpsone-specific reconstitution FIRST. Then follow '
        'an independently approved infusion diluent, final volume, '
        'concentration and stability protocol. Do NOT administer '
        'a 1 g pulse as rapid IV push. Product-specific compatibility '
        'and final admixture volume are pending.',
    safety:
        'BRAND-SPECIFIC VERIFICATION PENDING. The pictured pack identifies '
        'Mpsone 1000 mg methylprednisolone sodium succinate for IM/IV '
        'and the user reports 10 mL supplied water. The manufacturer '
        'public catalogue confirms a 1 g vial plus WFI but does not '
        'give the approved added/final volume or final stock mg/mL. '
        'This entry deliberately disables dose-to-mL mathematics. '
        'Do not assume Pfizer preservative or concentration rules.',
    sourceUrl: 'https://www.scotmedcare.com/products/page/5/',

