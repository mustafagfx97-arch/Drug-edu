enum ProductScanConfidence {
  exactVerifiedProduct,
  highConfidenceLocalMatch,
  probableLocalMatch,
  ingredientLevelOnly,
  unresolved,
}

class OnDeviceImageScan {
  const OnDeviceImageScan({
    required this.recognizedText,
    required this.barcodes,
  });

  final String recognizedText;
  final List<String> barcodes;
}

class ScannerIngredientRule {
  const ScannerIngredientRule({
    required this.id,
    required this.displayName,
    required this.aliases,
    required this.preferredUnit,
    required this.libraryQuery,
    this.analyzerIngredientId,
  });

  final String id;
  final String displayName;
  final List<String> aliases;
  final String preferredUnit;
  final String libraryQuery;
  final String? analyzerIngredientId;
}

class ParsedSupplementIngredient {
  const ParsedSupplementIngredient({
    required this.ruleId,
    required this.displayName,
    required this.rawLine,
    required this.amountKnown,
    required this.amount,
    required this.unit,
    required this.normalizedAmount,
    required this.normalizedUnit,
    required this.libraryQuery,
    this.analyzerIngredientId,
    this.warning,
  });

  final String ruleId;
  final String displayName;
  final String rawLine;
  final bool amountKnown;
  final double amount;
  final String unit;
  final double normalizedAmount;
  final String normalizedUnit;
  final String libraryQuery;
  final String? analyzerIngredientId;
  final String? warning;
}

class ProductScanCandidate {
  const ProductScanCandidate({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.score,
    required this.reasons,
    required this.kind,
  });

  final String id;
  final String title;
  final String subtitle;
  final double score;
  final List<String> reasons;
  final String kind;
}

class ProductScanReport {
  const ProductScanReport({
    required this.confidence,
    required this.confidenceLabel,
    required this.confidenceReason,
    required this.servingSize,
    required this.detectedBarcodes,
    required this.verifiedProductCandidates,
    required this.libraryCandidates,
    required this.ingredients,
    required this.warnings,
    required this.rawText,
  });

  final ProductScanConfidence confidence;
  final String confidenceLabel;
  final String confidenceReason;
  final String? servingSize;
  final List<String> detectedBarcodes;
  final List<ProductScanCandidate> verifiedProductCandidates;
  final List<ProductScanCandidate> libraryCandidates;
  final List<ParsedSupplementIngredient> ingredients;
  final List<String> warnings;
  final String rawText;
}
