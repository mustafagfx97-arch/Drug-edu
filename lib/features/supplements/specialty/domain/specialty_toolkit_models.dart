enum SpecialtyEvidence {
  establishedUse,
  moderate,
  limited,
  conflicting,
  insufficient,
  againstRoutineUse,
  productSpecific,
}

class SpecialtyUse {
  const SpecialtyUse({
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
  final SpecialtyEvidence evidence;
  final String caveat;
  final String sourceLabel;
}

class SpecialtyIngredient {
  const SpecialtyIngredient({
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
  final List<SpecialtyUse> uses;
  final List<String> safety;
}

class SpecialtyProductTechnique {
  const SpecialtyProductTechnique({
    required this.name,
    required this.ingredient,
    required this.amount,
    required this.directions,
    required this.storage,
    required this.lock,
    required this.sourceLabel,
  });

  final String name;
  final String ingredient;
  final String amount;
  final String directions;
  final String storage;
  final String lock;
  final String sourceLabel;
}
