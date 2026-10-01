enum NerveHairEvidence {
  nutritional,
  limited,
  conflicting,
  insufficient,
  againstRoutineUse,
  treatmentOnly,
}

class NerveHairUse {
  const NerveHairUse({
    required this.indication,
    required this.dose,
    required this.frequency,
    required this.duration,
    required this.evidence,
    required this.exactUse,
    required this.caveat,
    required this.sourceLabel,
  });

  final String indication;
  final String dose;
  final String frequency;
  final String duration;
  final NerveHairEvidence evidence;
  final String exactUse;
  final String caveat;
  final String sourceLabel;
}

class NerveHairProfile {
  const NerveHairProfile({
    required this.id,
    required this.name,
    required this.domain,
    required this.coreRule,
    required this.uses,
    required this.safety,
  });

  final String id;
  final String name;
  final String domain;
  final String coreRule;
  final List<NerveHairUse> uses;
  final List<String> safety;
}
