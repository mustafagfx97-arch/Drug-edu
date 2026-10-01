import 'package:drug_edu/features/supplements/scanner/application/product_scan_engine.dart';
import 'package:drug_edu/features/supplements/scanner/domain/product_scanner_models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const engine = ProductScanEngine();

  test('verified local product requires front-label identity signals', () {
    final report = engine.analyze(
      frontText: 'NOW Magnesium Glycinate Tablets 200 mg',
      factsText: '''
Supplement Facts
Serving Size 2 Tablets
Magnesium (as magnesium bisglycinate) 200 mg
''',
      frontBarcodes: const [],
      factsBarcodes: const [],
    );

    expect(report.confidence, ProductScanConfidence.exactVerifiedProduct);
    expect(report.verifiedProductCandidates, isNotEmpty);
    expect(
      report.verifiedProductCandidates.first.title,
      contains('NOW'),
    );
    expect(report.servingSize, '2 Tablets');
  });

  test('facts-only scan cannot claim exact product identity', () {
    final report = engine.analyze(
      frontText: '',
      factsText: '''
Supplement Facts
Serving Size 2 Capsules
Magnesium 200 mg
Vitamin B6 10 mg
Zinc 15 mg
''',
      frontBarcodes: const [],
      factsBarcodes: const [],
    );

    expect(report.confidence, ProductScanConfidence.ingredientLevelOnly);
    expect(report.verifiedProductCandidates, isEmpty);
    expect(report.ingredients.length, greaterThanOrEqualTo(3));
    expect(
      report.warnings.join(' '),
      contains('No front-label scan'),
    );
  });

  test('vitamin D prefers IU and handles thousands separator correctly', () {
    final report = engine.analyze(
      frontText: '',
      factsText: 'Vitamin D3 25 mcg (1,000 IU)',
      frontBarcodes: const [],
      factsBarcodes: const [],
    );

    final vitaminD =
        report.ingredients.singleWhere((item) => item.ruleId == 'vitamin-d');
    expect(vitaminD.amountKnown, isTrue);
    expect(vitaminD.normalizedUnit, 'IU');
    expect(vitaminD.normalizedAmount, 1000);
  });

  test('vitamin D mcg converts to IU when IU is not printed', () {
    final report = engine.analyze(
      frontText: '',
      factsText: 'Vitamin D3 25 mcg',
      frontBarcodes: const [],
      factsBarcodes: const [],
    );

    final vitaminD =
        report.ingredients.singleWhere((item) => item.ruleId == 'vitamin-d');
    expect(vitaminD.normalizedUnit, 'IU');
    expect(vitaminD.normalizedAmount, 1000);
  });

  test('probiotic billion CFU amount is normalized to absolute CFU', () {
    final report = engine.analyze(
      frontText: '',
      factsText: 'Probiotic Blend 25 Billion CFU',
      frontBarcodes: const [],
      factsBarcodes: const [],
    );

    final probiotic =
        report.ingredients.singleWhere((item) => item.ruleId == 'probiotic');
    expect(probiotic.normalizedUnit, 'CFU');
    expect(probiotic.normalizedAmount, 25000000000);
  });

  test('creatine converts mg label amount to grams', () {
    final report = engine.analyze(
      frontText: '',
      factsText: 'Creatine Monohydrate 5,000 mg',
      frontBarcodes: const [],
      factsBarcodes: const [],
    );

    final creatine =
        report.ingredients.singleWhere((item) => item.ruleId == 'creatine');
    expect(creatine.normalizedUnit, 'g');
    expect(creatine.normalizedAmount, 5);
  });

  test('folate and folic acid remain distinct parser concepts', () {
    final report = engine.analyze(
      frontText: '',
      factsText: '''
Folate 680 mcg DFE
Folic Acid 400 mcg
''',
      frontBarcodes: const [],
      factsBarcodes: const [],
    );

    final folate =
        report.ingredients.singleWhere((item) => item.ruleId == 'folate');
    final folicAcid =
        report.ingredients.singleWhere((item) => item.ruleId == 'folic-acid');

    expect(folate.analyzerIngredientId, isNull);
    expect(folate.warning, contains('not numerically interchangeable'));
    expect(folicAcid.analyzerIngredientId, 'folic-acid');
    expect(folicAcid.normalizedAmount, 400);
  });

  test('generic vitamin A does not become preformed-vitamin-A analyzer line', () {
    final generic = engine.analyze(
      frontText: '',
      factsText: 'Vitamin A 900 mcg RAE',
      frontBarcodes: const [],
      factsBarcodes: const [],
    );
    final genericA =
        generic.ingredients.singleWhere((item) => item.ruleId == 'vitamin-a');
    expect(genericA.analyzerIngredientId, isNull);

    final retinol = engine.analyze(
      frontText: '',
      factsText: 'Retinyl Palmitate 900 mcg',
      frontBarcodes: const [],
      factsBarcodes: const [],
    );
    final preformed = retinol.ingredients
        .singleWhere((item) => item.ruleId == 'vitamin-a-preformed');
    expect(preformed.analyzerIngredientId, 'vitamin-a-preformed');
  });

  test('barcode alone does not verify formulation', () {
    final report = engine.analyze(
      frontText: 'Unknown Product',
      factsText: '',
      frontBarcodes: const ['0123456789012'],
      factsBarcodes: const [],
    );

    expect(report.confidence, ProductScanConfidence.unresolved);
    expect(report.detectedBarcodes, contains('0123456789012'));
    expect(
      report.warnings.join(' '),
      contains('does not claim a formulation match'),
    );
  });

  test('known encyclopedia brand can create high local match without exact registry', () {
    final report = engine.analyze(
      frontText: 'Bayer Priorin Extra',
      factsText: '',
      frontBarcodes: const [],
      factsBarcodes: const [],
    );

    expect(
      {
        ProductScanConfidence.highConfidenceLocalMatch,
        ProductScanConfidence.probableLocalMatch,
      },
      contains(report.confidence),
    );
    expect(
      report.libraryCandidates.any(
        (item) => item.title.toLowerCase().contains('priorin'),
      ),
      isTrue,
    );
  });

  test('proprietary blend creates explicit dose-uncertainty warning', () {
    final report = engine.analyze(
      frontText: '',
      factsText: '''
Proprietary Blend 1200 mg
Caffeine
L-Citrulline
''',
      frontBarcodes: const [],
      factsBarcodes: const [],
    );

    expect(
      report.warnings.join(' ').toLowerCase(),
      contains('proprietary/pooled blend'),
    );
    expect(
      report.ingredients.any((item) => !item.amountKnown),
      isTrue,
    );
  });

  test('serving size is parsed but never assumed to equal servings per day', () {
    final report = engine.analyze(
      frontText: '',
      factsText: '''
Serving Size: 3 Capsules
Zinc 15 mg
''',
      frontBarcodes: const [],
      factsBarcodes: const [],
    );

    expect(report.servingSize, '3 Capsules');
    final zinc =
        report.ingredients.singleWhere((item) => item.ruleId == 'zinc');
    expect(zinc.normalizedAmount, 15);
  });
}
