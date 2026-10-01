enum AnalyzerUnit { mg, mcg, iu, cfu }

enum PatientMedicationFlag {
  levothyroxine,
  tetracyclineOrQuinolone,
  warfarin,
  upcomingBiotinSensitiveLabs,
}

class AnalyzerIngredientRule {
  const AnalyzerIngredientRule({
    required this.id,
    required this.name,
    required this.unit,
    required this.amountBasis,
    required this.thresholds,
    required this.interactions,
  });

  final String id;
  final String name;
  final AnalyzerUnit unit;
  final String amountBasis;
  final List<AnalyzerThreshold> thresholds;
  final Map<PatientMedicationFlag, String> interactions;
}

class AnalyzerThreshold {
  const AnalyzerThreshold({
    required this.value,
    required this.label,
    required this.scope,
  });

  final double value;
  final String label;
  final String scope;
}

class AnalyzerLine {
  const AnalyzerLine({
    required this.productName,
    required this.ingredientId,
    required this.amountPerServing,
    required this.servingsPerDay,
    required this.amountKnown,
  });

  final String productName;
  final String ingredientId;
  final double amountPerServing;
  final double servingsPerDay;
  final bool amountKnown;
}

class AnalyzerIngredientSummary {
  const AnalyzerIngredientSummary({
    required this.ingredientId,
    required this.totalPerDay,
    required this.knownLines,
    required this.hiddenLines,
    required this.productNames,
  });

  final String ingredientId;
  final double totalPerDay;
  final int knownLines;
  final int hiddenLines;
  final List<String> productNames;
}

class AnalyzerResult {
  const AnalyzerResult({
    required this.summaries,
    required this.duplicateMessages,
    required this.thresholdMessages,
    required this.interactionMessages,
    required this.unknownAmountMessages,
  });

  final List<AnalyzerIngredientSummary> summaries;
  final List<String> duplicateMessages;
  final List<String> thresholdMessages;
  final List<String> interactionMessages;
  final List<String> unknownAmountMessages;
}

class RealProductIngredient {
  const RealProductIngredient({
    required this.name,
    required this.amount,
    required this.note,
  });

  final String name;
  final String amount;
  final String note;
}

class RealProductProfile {
  const RealProductProfile({
    required this.id,
    required this.brand,
    required this.name,
    required this.servingSize,
    required this.suggestedUse,
    required this.storage,
    required this.ingredients,
    required this.transparencyFlags,
    required this.clinicalLocks,
    required this.sourceLabel,
    required this.analyzerLines,
  });

  final String id;
  final String brand;
  final String name;
  final String servingSize;
  final String suggestedUse;
  final String storage;
  final List<RealProductIngredient> ingredients;
  final List<String> transparencyFlags;
  final List<String> clinicalLocks;
  final String sourceLabel;
  final List<AnalyzerLine> analyzerLines;
}
