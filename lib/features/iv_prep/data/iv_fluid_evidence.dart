/// Small, explicit evidence matrix for a specific manufacturer formulation.
/// NEVER infer compatibility from the presence of a drug or fluid name in
/// free-text monographs. Unknown is not compatible.
enum IvFluid {
  normalSaline,
  halfNormalSaline,
  dextrose5,
  dextrose5NormalSaline,
  dextrose5HalfNormalSaline,
  dextrose10,
  sterileWaterForInjection,
  lactatedRingers,
  sodiumBicarbonate5,
}

extension IvFluidLabel on IvFluid {
  String get label => switch (this) {
        IvFluid.normalSaline => '0.9% NaCl',
        IvFluid.halfNormalSaline => '0.45% NaCl',
        IvFluid.dextrose5 => 'D5W (5% Dextrose)',
        IvFluid.dextrose5NormalSaline => 'D5 in 0.9% NaCl',
        IvFluid.dextrose5HalfNormalSaline => 'D5 in 0.45% NaCl',
        IvFluid.dextrose10 => 'D10W (10% Dextrose)',
        IvFluid.sterileWaterForInjection => 'Sterile Water for Injection',
        IvFluid.lactatedRingers => 'Lactated Ringer’s',
        IvFluid.sodiumBicarbonate5 => '5% Sodium Bicarbonate',
      };
}

enum IvFluidEvidenceStatus {
  verifiedDiluent,
  incompatibleDiluent,
  coadministrationOnly,
  unknown,
}

class IvFluidEvidence {
  const IvFluidEvidence({
    required this.status,
    required this.explanation,
    required this.source,
  });

  final IvFluidEvidenceStatus status;
  final String explanation;
  final String source;

  bool get mayBeUsedAsDiluent =>
      status == IvFluidEvidenceStatus.verifiedDiluent;
}

const _cardeneUrl =
    'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=5749599d-ff2a-42e4-aa72-cd25013feee8';
const _cleviprexUrl =
    'https://dailymed.nlm.nih.gov/dailymed/fda/fdaDrugXsl.cfm?setid=f9290625-b723-4eda-bab8-a97bef6041f6';
const _nitroglycerinUrl =
    'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=578d8159-5ec6-457f-b4a8-9add624d43a8';
const _nitroprussideUrl =
    'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=6fbfb86c-da8d-4741-b1e0-7000e2bbad5f';

IvFluidEvidence reviewedIvFluidEvidence({
  required String name,
  required String population,
  required IvFluid fluid,
}) {
  if (population != 'General') return _unverified;
  if (name == 'Nicardipine') {
    if (fluid == IvFluid.normalSaline ||
        fluid == IvFluid.halfNormalSaline ||
        fluid == IvFluid.dextrose5 ||
        fluid == IvFluid.dextrose5NormalSaline ||
        fluid == IvFluid.dextrose5HalfNormalSaline) {
      return const IvFluidEvidence(
        status: IvFluidEvidenceStatus.verifiedDiluent,
        explanation:
            'For CARDENE IV 25 mg/10 mL concentrate ONLY: labeled dilution '
            'to 25 mg in a FINAL 250 mL is compatible with this IV fluid. '
            'This does NOT establish compatibility with another drug at a Y-site.',
        source: _cardeneUrl,
      );
    }
    if (fluid == IvFluid.lactatedRingers ||
        fluid == IvFluid.sodiumBicarbonate5) {
      return const IvFluidEvidence(
        status: IvFluidEvidenceStatus.incompatibleDiluent,
        explanation:
            'CARDENE IV 25 mg/10 mL labeling explicitly reports this '
            'fluid as NOT compatible. Do not use it for dilution.',
        source: _cardeneUrl,
      );
    }
    return const IvFluidEvidence(
      status: IvFluidEvidenceStatus.unknown,
      explanation:
          'This fluid is not listed in the exact CARDENE IV concentrate '
          'label dilution compatibility list. Do not assume compatibility.',
      source: _cardeneUrl,
    );
  }
  if (name == 'Clevidipine') {
    if (fluid == IvFluid.normalSaline ||
        fluid == IvFluid.dextrose5 ||
        fluid == IvFluid.dextrose5NormalSaline ||
        fluid == IvFluid.sterileWaterForInjection ||
        fluid == IvFluid.lactatedRingers) {
      return const IvFluidEvidence(
        status: IvFluidEvidenceStatus.coadministrationOnly,
        explanation:
            'Cleviprex is a READY-TO-USE lipid emulsion: DO NOT DILUTE. '
            'This fluid is listed for co-administration, but NEVER add it to '
            'the vial and NEVER administer Cleviprex in a line with another medication.',
        source: _cleviprexUrl,
      );
    }
    return const IvFluidEvidence(
      status: IvFluidEvidenceStatus.unknown,
      explanation:
          'This fluid is not in the cited Cleviprex co-administration list. '
          'Do NOT dilute Cleviprex with any fluid.',
      source: _cleviprexUrl,
    );
  }
  if (name == 'Nitroglycerin') {
    if (fluid == IvFluid.normalSaline || fluid == IvFluid.dextrose5) {
      return const IvFluidEvidence(
        status: IvFluidEvidenceStatus.verifiedDiluent,
        explanation: 'For the selected nitroglycerin 5 mg/mL '
            'CONCENTRATE ONLY: D5W or 0.9% NaCl is listed for mandatory '
            'dilution. Exact final volume, glass/nonadsorbing set and '
            'no other drugs in the same solution are critical.',
        source: _nitroglycerinUrl,
      );
    }
    return const IvFluidEvidence(
      status: IvFluidEvidenceStatus.unknown,
      explanation:
          'This fluid is not listed for dilution of the cited '
          'nitroglycerin concentrate. Do not assume compatibility.',
      source: _nitroglycerinUrl,
    );
  }
  if (name == 'Sodium nitroprusside') {
    if (fluid == IvFluid.dextrose5) {
      return const IvFluidEvidence(
        status: IvFluidEvidenceStatus.verifiedDiluent,
        explanation:
            'For the 50 mg/2 mL CONCENTRATE ONLY: manufacturer specifies '
            'dilution in 250–1,000 mL of 5% dextrose and protection from light. '
            'Confirm final prepared volume/concentration; this is NOT Y-site evidence.',
        source: _nitroprussideUrl,
      );
    }
    return const IvFluidEvidence(
      status: IvFluidEvidenceStatus.unknown,
      explanation:
          'This fluid is not the D5W dilution specified for the 50 mg/2 mL '
          'CONCENTRATE label. Do not import saline compatibility from '
          'separately marketed ready-to-use nitroprusside products.',
      source: _nitroprussideUrl,
    );
  }
  return _unverified;
}

const _unverified = IvFluidEvidence(
  status: IvFluidEvidenceStatus.unknown,
  explanation:
      'No reviewed product-and-fluid pair is stored in this quick-check matrix. '
      'Read the source-locked preparation profile below and verify the exact '
      'manufacturer, strength, final concentration and diluent in the current label. '
      'Do not treat missing evidence as compatibility or incompatibility.',
  source: 'Open the selected drug preparation profile for its source.',
);

enum IvYsiteStatus { prohibitedByLabel, unverified }

IvYsiteStatus reviewIvYsite({
  required String firstDrug,
  required String secondDrug,
  required String firstPopulation,
  required String secondPopulation,
}) {
  if ((firstDrug == 'Clevidipine' && firstPopulation == 'General') ||
      (secondDrug == 'Clevidipine' && secondPopulation == 'General')) {
    return IvYsiteStatus.prohibitedByLabel;
  }
  // No pairs are positively certified by this app's matrix.
  return IvYsiteStatus.unverified;
}
