import '../../library/data/supplement_library_catalog.dart';
import '../../products/data/product_analyzer_data.dart';
import '../data/scanner_ingredient_dictionary.dart';
import '../domain/product_scanner_models.dart';

class ProductScanEngine {
  const ProductScanEngine();

  ProductScanReport analyze({
    required String frontText,
    required String factsText,
    required List<String> frontBarcodes,
    required List<String> factsBarcodes,
  }) {
    final front = frontText.trim();
    final facts = factsText.trim();
    final combined = [front, facts]
        .where((item) => item.isNotEmpty)
        .join('\n')
        .trim();

    final barcodes = <String>{
      ...frontBarcodes.where((item) => item.trim().isNotEmpty),
      ...factsBarcodes.where((item) => item.trim().isNotEmpty),
    }.toList()
      ..sort();

    final verifiedCandidates = _verifiedProductCandidates(front);
    final libraryCandidates = _libraryIdentityCandidates(front);
    final ingredients = _parseIngredients(facts.isNotEmpty ? facts : combined);
    final servingSize = _parseServingSize(facts);

    final warnings = <String>[
      'OCR is a reading aid, not proof of the label. Visually confirm every clinically important number, unit and ingredient before using it for counseling.',
    ];

    if (front.isEmpty) {
      warnings.add(
        'No front-label scan is available, so product identity is not considered verified even if ingredients match the encyclopedia.',
      );
    }
    if (facts.isEmpty) {
      warnings.add(
        'No Supplement Facts / Ingredients scan is available. Product-name recognition alone is not enough for a formulation-specific recommendation.',
      );
    }
    if (barcodes.isNotEmpty) {
      warnings.add(
        'Barcode detected. This build records the code as an identity signal but does not claim a formulation match unless that barcode exists in the verified local registry.',
      );
    }
    if (ingredients.any((item) => !item.amountKnown)) {
      warnings.add(
        'At least one recognized ingredient has no reliable numeric amount. Do not calculate a daily total from that ingredient until the label is checked manually.',
      );
    }
    final lowerFacts = facts.toLowerCase();
    if (lowerFacts.contains('proprietary blend') ||
        lowerFacts.contains('proprietary matrix') ||
        lowerFacts.contains('complex blend')) {
      warnings.add(
        'A proprietary/pooled blend was detected. Ingredient presence may be visible while individual doses remain unknown.',
      );
    }

    final confidence = _confidence(
      verifiedCandidates: verifiedCandidates,
      libraryCandidates: libraryCandidates,
      ingredients: ingredients,
      hasFront: front.isNotEmpty,
    );

    return ProductScanReport(
      confidence: confidence.$1,
      confidenceLabel: confidence.$2,
      confidenceReason: confidence.$3,
      servingSize: servingSize,
      detectedBarcodes: barcodes,
      verifiedProductCandidates: verifiedCandidates,
      libraryCandidates: libraryCandidates,
      ingredients: ingredients,
      warnings: warnings,
      rawText: combined,
    );
  }

  List<ProductScanCandidate> _verifiedProductCandidates(String frontText) {
    if (frontText.trim().isEmpty) return const [];
    final scanTokens = _tokens(frontText);
    final scanNormalized = _normalize(frontText);
    final matches = <ProductScanCandidate>[];

    for (final product in realProductProfiles) {
      final brandTokens = _meaningfulTokens(product.brand);
      final nameTokens = _meaningfulTokens(product.name);
      final brandPresent =
          brandTokens.isNotEmpty && brandTokens.every(scanTokens.contains);
      final matchedName =
          nameTokens.where(scanTokens.contains).toList(growable: false);
      final nameCoverage =
          nameTokens.isEmpty ? 0.0 : matchedName.length / nameTokens.length;

      var score = 0.0;
      final reasons = <String>[];
      if (brandPresent) {
        score += 0.38;
        reasons.add('brand text matched');
      }
      if (nameCoverage > 0) {
        score += 0.52 * nameCoverage;
        reasons.add(
          matchedName.length.toString() +
              '/' +
              nameTokens.length.toString() +
              ' distinctive product-name token(s) matched',
        );
      }
      final normalizedName = _normalize(product.name);
      if (normalizedName.isNotEmpty && scanNormalized.contains(normalizedName)) {
        score += 0.10;
        reasons.add('full product name appears in the front-label OCR');
      }

      if (brandPresent && nameCoverage >= 0.45) {
        matches.add(
          ProductScanCandidate(
            id: product.id,
            title: product.brand + ' — ' + product.name,
            subtitle: product.servingSize + ' · ' + product.sourceLabel,
            score: score.clamp(0.0, 1.0).toDouble(),
            reasons: reasons,
            kind: 'verified-product',
          ),
        );
      }
    }

    matches.sort((a, b) => b.score.compareTo(a.score));
    return matches.take(3).toList(growable: false);
  }

  List<ProductScanCandidate> _libraryIdentityCandidates(String frontText) {
    if (frontText.trim().isEmpty) return const [];
    final scanTokens = _tokens(frontText);
    final scanNormalized = _normalize(frontText);
    final matches = <ProductScanCandidate>[];

    for (final entry in supplementLibraryEntries) {
      final titleTokens = _meaningfulTokens(entry.title);
      if (titleTokens.isEmpty) continue;
      final matched =
          titleTokens.where(scanTokens.contains).toList(growable: false);
      final coverage = matched.length / titleTokens.length;
      final longSingleTokenMatch = titleTokens.length == 1 &&
          titleTokens.first.length >= 7 &&
          matched.isNotEmpty;
      if (!(matched.length >= 2 || longSingleTokenMatch)) continue;

      var score = 0.22 + (0.68 * coverage);
      final reasons = <String>[
        matched.length.toString() +
            '/' +
            titleTokens.length.toString() +
            ' encyclopedia title token(s) matched',
      ];
      final titleNormalized = _normalize(entry.title);
      if (titleNormalized.isNotEmpty &&
          scanNormalized.contains(titleNormalized)) {
        score += 0.10;
        reasons.add('full local encyclopedia title matched');
      }

      matches.add(
        ProductScanCandidate(
          id: entry.id,
          title: entry.title,
          subtitle: entry.subtitle,
          score: score.clamp(0.0, 1.0).toDouble(),
          reasons: reasons,
          kind: 'library-entry',
        ),
      );
    }

    matches.sort((a, b) => b.score.compareTo(a.score));
    return matches.take(5).toList(growable: false);
  }

  List<ParsedSupplementIngredient> _parseIngredients(String text) {
    if (text.trim().isEmpty) return const [];
    final results = <ParsedSupplementIngredient>[];
    final seen = <String>{};

    for (final raw in text.split(RegExp(r'[\r\n]+'))) {
      final line = raw.trim();
      if (line.length < 2) continue;
      final normalizedLine = _normalize(line);

      final matchingRules = scannerIngredientRules
          .where(
            (rule) => rule.aliases.any(
              (alias) => _containsAlias(normalizedLine, _normalize(alias)),
            ),
          )
          .toList()
        ..sort(
          (a, b) => _longestAliasLength(b).compareTo(_longestAliasLength(a)),
        );

      if (matchingRules.isEmpty) continue;

      final rule = matchingRules.first;
      final amountData = _findAmount(line, rule);
      final key = rule.id + '|' + line.toLowerCase();
      if (!seen.add(key)) continue;

      String? warning;
      if (rule.id == 'folate') {
        warning =
            'Folate/DFE and folic acid are not numerically interchangeable. Use the parenthetical folic-acid amount when the label provides one.';
      } else if (rule.id == 'vitamin-a' ||
          rule.id == 'vitamin-a-preformed') {
        warning =
            'Check the vitamin A source. Beta-carotene and preformed retinol/retinyl esters have different safety interpretation.';
      } else if (rule.id == 'omega3') {
        warning =
            'Total fish-oil/omega-3 mass does not replace the need to read EPA and DHA separately.';
      }

      results.add(
        ParsedSupplementIngredient(
          ruleId: rule.id,
          displayName: rule.displayName,
          rawLine: line,
          amountKnown: amountData != null,
          amount: amountData?.originalAmount ?? 0,
          unit: amountData?.originalUnit ?? '',
          normalizedAmount: amountData?.normalizedAmount ?? 0,
          normalizedUnit: amountData?.normalizedUnit ?? rule.preferredUnit,
          libraryQuery: rule.libraryQuery,
          analyzerIngredientId: rule.analyzerIngredientId,
          warning: warning,
        ),
      );
    }

    return results;
  }

  _AmountData? _findAmount(
    String line,
    ScannerIngredientRule rule,
  ) {
    final matches = RegExp(
      r'([0-9][0-9,]*(?:\.[0-9]+)?)\s*(billion\s*cfu|million\s*cfu|trillion\s*cfu|cfu|mcg|µg|μg|ug|mg|g|iu)\b',
      caseSensitive: false,
    ).allMatches(line).toList();

    if (matches.isEmpty) return null;

    _AmountData? fallback;
    for (final match in matches) {
      final rawNumber = match.group(1) ?? '';
      final value = _parseNumber(rawNumber);
      if (value == null) continue;
      final unit = (match.group(2) ?? '').trim();
      final normalized = _normalizeAmount(value, unit, rule);
      if (normalized == null) continue;
      final data = _AmountData(
        originalAmount: value,
        originalUnit: unit,
        normalizedAmount: normalized.$1,
        normalizedUnit: normalized.$2,
      );
      fallback ??= data;
      if (_canonicalUnit(unit) == rule.preferredUnit.toLowerCase()) {
        return data;
      }
      if (rule.id == 'vitamin-d' && _canonicalUnit(unit) == 'iu') {
        return data;
      }
    }
    return fallback;
  }

  (double, String)? _normalizeAmount(
    double value,
    String unit,
    ScannerIngredientRule rule,
  ) {
    final source = _canonicalUnit(unit);
    final target = rule.preferredUnit.toLowerCase();

    if (source == 'billion cfu') return (value * 1000000000, 'CFU');
    if (source == 'million cfu') return (value * 1000000, 'CFU');
    if (source == 'trillion cfu') return (value * 1000000000000, 'CFU');
    if (source == 'cfu') return (value, 'CFU');

    if (rule.id == 'vitamin-d') {
      if (source == 'iu') return (value, 'IU');
      if (source == 'mcg') return (value * 40, 'IU');
    }

    if (source == target) {
      return (value, _displayUnit(target));
    }

    if (source == 'g' && target == 'mg') {
      return (value * 1000, 'mg');
    }
    if (source == 'mg' && target == 'g') {
      return (value / 1000, 'g');
    }
    if (source == 'mg' && target == 'mcg') {
      return (value * 1000, 'mcg');
    }
    if (source == 'mcg' && target == 'mg') {
      return (value / 1000, 'mg');
    }
    if (source == 'g' && target == 'mcg') {
      return (value * 1000000, 'mcg');
    }
    if (source == 'mcg' && target == 'g') {
      return (value / 1000000, 'g');
    }

    return null;
  }

  String? _parseServingSize(String factsText) {
    if (factsText.trim().isEmpty) return null;
    for (final raw in factsText.split(RegExp(r'[\r\n]+'))) {
      final line = raw.trim();
      final match = RegExp(
        r'serving\s+size\s*[:\-]?\s*(.+)$',
        caseSensitive: false,
      ).firstMatch(line);
      final value = match?.group(1)?.trim();
      if (value != null && value.isNotEmpty) return value;
    }
    return null;
  }

  (ProductScanConfidence, String, String) _confidence({
    required List<ProductScanCandidate> verifiedCandidates,
    required List<ProductScanCandidate> libraryCandidates,
    required List<ParsedSupplementIngredient> ingredients,
    required bool hasFront,
  }) {
    if (verifiedCandidates.isNotEmpty &&
        verifiedCandidates.first.score >= 0.82) {
      return (
        ProductScanConfidence.exactVerifiedProduct,
        'Exact verified local product candidate',
        'Brand + product-name signals match a product whose label is already stored in the verified local registry. Confirm the photographed Supplement Facts before treating the formulation as exact.',
      );
    }

    if (hasFront &&
        libraryCandidates.isNotEmpty &&
        libraryCandidates.first.score >= 0.82) {
      return (
        ProductScanConfidence.highConfidenceLocalMatch,
        'High-confidence local match',
        'The front-label text strongly matches an encyclopedia entry, but this is not yet a barcode/formulation-locked product record.',
      );
    }

    if (hasFront &&
        libraryCandidates.isNotEmpty &&
        libraryCandidates.first.score >= 0.62) {
      return (
        ProductScanConfidence.probableLocalMatch,
        'Probable local match',
        'Some identity signals match the local encyclopedia. Verify brand, strength, country/version and Supplement Facts before product-specific counseling.',
      );
    }

    if (ingredients.isNotEmpty) {
      return (
        ProductScanConfidence.ingredientLevelOnly,
        'Ingredient-level analysis only',
        'The scanner can analyze recognized ingredients against the local clinical encyclopedia, but it cannot verify the exact commercial formulation from the available identity signals.',
      );
    }

    return (
      ProductScanConfidence.unresolved,
      'Unresolved product',
      'The scan does not contain enough reliable identity or ingredient information. Retake the front and Supplement Facts images in good light.',
    );
  }

  bool _containsAlias(String normalizedLine, String normalizedAlias) {
    if (normalizedAlias.isEmpty) return false;
    return RegExp(
      r'(^|\s)' + RegExp.escape(normalizedAlias) + r'($|\s)',
    ).hasMatch(normalizedLine);
  }

  int _longestAliasLength(ScannerIngredientRule rule) {
    var longest = 0;
    for (final item in rule.aliases) {
      final value = _normalize(item).length;
      if (value > longest) longest = value;
    }
    return longest;
  }

  Set<String> _tokens(String text) => _normalize(text)
      .split(' ')
      .where((item) => item.length >= 2)
      .toSet();

  List<String> _meaningfulTokens(String text) {
    const stop = <String>{
      'mg',
      'mcg',
      'iu',
      'cfu',
      'the',
      'and',
      'with',
      'for',
      'capsule',
      'capsules',
      'tablet',
      'tablets',
      'softgel',
      'softgels',
      'veg',
      'supplement',
      'supplements',
      'support',
      'formula',
    };
    return _normalize(text)
        .split(' ')
        .where((item) => item.length >= 2 && !stop.contains(item))
        .toSet()
        .toList(growable: false);
  }

  String _normalize(String value) => value
      .toLowerCase()
      .replaceAll('µ', 'u')
      .replaceAll(RegExp(r'[^a-z0-9]+'), ' ')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();

  double? _parseNumber(String raw) {
    final value = raw.trim();
    if (value.isEmpty) return null;
    if (value.contains(',') && !value.contains('.')) {
      final parts = value.split(',');
      final thousandsStyle =
          parts.length > 1 && parts.skip(1).every((part) => part.length == 3);
      if (thousandsStyle) {
        return double.tryParse(parts.join());
      }
      return double.tryParse(value.replaceAll(',', '.'));
    }
    return double.tryParse(value.replaceAll(',', ''));
  }

  String _canonicalUnit(String value) {
    return value
        .toLowerCase()
        .replaceAll('µg', 'mcg')
        .replaceAll('μg', 'mcg')
        .replaceAll('ug', 'mcg')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }

  String _displayUnit(String canonical) => switch (canonical) {
        'iu' => 'IU',
        'cfu' => 'CFU',
        _ => canonical,
      };
}

class _AmountData {
  const _AmountData({
    required this.originalAmount,
    required this.originalUnit,
    required this.normalizedAmount,
    required this.normalizedUnit,
  });

  final double originalAmount;
  final String originalUnit;
  final double normalizedAmount;
  final String normalizedUnit;
}
