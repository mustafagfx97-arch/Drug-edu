enum ProbioticEvidence {
  strong,
  moderate,
  low,
  veryLow,
  conflicting,
  insufficient,
  againstRoutineUse,
}

class ProbioticUse {
  const ProbioticUse({
    required this.id,
    required this.indication,
    required this.population,
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
  final String dose;
  final String frequency;
  final String duration;
  final String exactUse;
  final ProbioticEvidence evidence;
  final String caveat;
  final String sourceLabel;
}

class ProbioticProfile {
  const ProbioticProfile({
    required this.id,
    required this.displayName,
    required this.organismType,
    required this.keyRule,
    required this.uses,
    required this.safety,
  });

  final String id;
  final String displayName;
  final String organismType;
  final String keyRule;
  final List<ProbioticUse> uses;
  final List<String> safety;
}

class ProbioticProductExample {
  const ProbioticProductExample({
    required this.name,
    required this.strain,
    required this.amount,
    required this.directions,
    required this.storage,
    required this.productSpecificLock,
    required this.sourceLabel,
  });

  final String name;
  final String strain;
  final String amount;
  final String directions;
  final String storage;
  final String productSpecificLock;
  final String sourceLabel;
}

class MicrobiomeAdjunct {
  const MicrobiomeAdjunct({
    required this.name,
    required this.category,
    required this.dose,
    required this.use,
    required this.caveat,
    required this.sourceLabel,
  });

  final String name;
  final String category;
  final String dose;
  final String use;
  final String caveat;
  final String sourceLabel;
}

class ProbioticDoseMatch {
  const ProbioticDoseMatch({
    required this.locked,
    required this.servingsPerDay,
    required this.message,
  });

  final bool locked;
  final double servingsPerDay;
  final String message;
}
