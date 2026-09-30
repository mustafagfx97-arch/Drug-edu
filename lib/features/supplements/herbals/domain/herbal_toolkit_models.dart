enum HerbalEvidence {
  moderate,
  limited,
  conflicting,
  insufficient,
  againstRoutineUse,
  highRiskInteraction,
  productSpecific,
}

class HerbalUse {
  const HerbalUse({
    required this.id,
    required this.indication,
    required this.population,
    required this.formOrExtract,
    required this.dose,
    required this.frequency,
    required this.duration,
    required this.exactUse,
    required this.evidence,
    required this.caveat,
    required this.sourceLabel,
  });

  final String id;
  final String indication;
  final String population;
  final String formOrExtract;
  final String dose;
  final String frequency;
  final String duration;
  final String exactUse;
  final HerbalEvidence evidence;
  final String caveat;
  final String sourceLabel;
}

class HerbalProfile {
  const HerbalProfile({
    required this.id,
    required this.name,
    required this.category,
    required this.keyRule,
    required this.uses,
    required this.safety,
  });

  final String id;
  final String name;
  final String category;
  final String keyRule;
  final List<HerbalUse> uses;
  final List<String> safety;
}
