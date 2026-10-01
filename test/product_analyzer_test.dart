import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/supplements/products/data/product_analyzer_data.dart';
import 'package:drug_edu/features/supplements/products/domain/product_analyzer_models.dart';

void main() {
  test('duplicate magnesium lines aggregate daily elemental dose', () {
    final result = analyzeSupplementLines(
      lines: const [
        AnalyzerLine(
          productName: 'A',
          ingredientId: 'magnesium',
          amountPerServing: 200,
          servingsPerDay: 1,
          amountKnown: true,
        ),
        AnalyzerLine(
          productName: 'B',
          ingredientId: 'magnesium',
          amountPerServing: 150,
          servingsPerDay: 1,
          amountKnown: true,
        ),
      ],
      medicationFlags: {},
    );

    expect(result.summaries.single.totalPerDay, 350);
    expect(result.duplicateMessages.single, contains('across 2 product(s)'));
    expect(result.thresholdMessages, isEmpty);
  });

  test('supplemental magnesium above 350 triggers threshold review', () {
    final result = analyzeSupplementLines(
      lines: const [
        AnalyzerLine(
          productName: 'NOW Magnesium Glycinate',
          ingredientId: 'magnesium',
          amountPerServing: 200,
          servingsPerDay: 2,
          amountKnown: true,
        ),
      ],
      medicationFlags: {},
    );

    expect(result.thresholdMessages.single, contains('350 mg'));
    expect(result.thresholdMessages.single, contains('Supplements/medications only'));
  });

  test('B6 engine preserves EFSA reference before older US ceiling', () {
    final result = analyzeSupplementLines(
      lines: const [
        AnalyzerLine(
          productName: 'Combo A',
          ingredientId: 'vitamin-b6',
          amountPerServing: 15,
          servingsPerDay: 1,
          amountKnown: true,
        ),
      ],
      medicationFlags: {},
    );

    expect(result.thresholdMessages.length, 1);
    expect(result.thresholdMessages.first, contains('EFSA 2023'));
  });

  test('hidden proprietary amount makes total incomplete', () {
    final result = analyzeSupplementLines(
      lines: const [
        AnalyzerLine(
          productName: 'Mystery blend',
          ingredientId: 'zinc',
          amountPerServing: 0,
          servingsPerDay: 1,
          amountKnown: false,
        ),
      ],
      medicationFlags: {},
    );

    expect(
      result.unknownAmountMessages.single,
      contains('calculated daily total is incomplete'),
    );
  });

  test('levothyroxine context flags calcium and iron timing', () {
    final result = analyzeSupplementLines(
      lines: const [
        AnalyzerLine(
          productName: 'Calcium',
          ingredientId: 'calcium',
          amountPerServing: 500,
          servingsPerDay: 1,
          amountKnown: true,
        ),
        AnalyzerLine(
          productName: 'Iron',
          ingredientId: 'iron',
          amountPerServing: 65,
          servingsPerDay: 1,
          amountKnown: true,
        ),
      ],
      medicationFlags: {PatientMedicationFlag.levothyroxine},
    );

    expect(result.interactionMessages.join(' '), contains('4 hours'));
    expect(result.interactionMessages.join(' '), contains('Iron'));
  });

  test('warfarin context gives consistency not avoidance for vitamin K', () {
    final result = analyzeSupplementLines(
      lines: const [
        AnalyzerLine(
          productName: 'K2',
          ingredientId: 'vitamin-k',
          amountPerServing: 100,
          servingsPerDay: 1,
          amountKnown: true,
        ),
      ],
      medicationFlags: {PatientMedicationFlag.warfarin},
    );

    expect(
      result.interactionMessages.single,
      contains('Do not eliminate vitamin K'),
    );
    expect(result.interactionMessages.single, contains('INR'));
  });

  test('NOW magnesium glycinate example imports 200 mg elemental per serving', () {
    final product = realProductProfiles.singleWhere(
      (item) => item.id == 'now-mag-glycinate',
    );

    expect(product.servingSize, '2 tablets');
    expect(product.analyzerLines.single.amountPerServing, 200);
    expect(product.suggestedUse, contains('1–2 times daily with food'));
  });

  test('NOW CoQ10 liquid exposes B6 duplicate risk and refrigeration', () {
    final product = realProductProfiles.singleWhere(
      (item) => item.id == 'now-coq10-liquid',
    );

    expect(product.storage, contains('Refrigerate'));
    expect(
      product.analyzerLines.any(
        (line) =>
            line.ingredientId == 'vitamin-b6' && line.amountPerServing == 7,
      ),
      isTrue,
    );
    expect(product.clinicalLocks.join(' '), contains('B-complex'));
  });

  test('NOW black cohosh is treated as a three-active combination', () {
    final product = realProductProfiles.singleWhere(
      (item) => item.id == 'now-black-cohosh',
    );

    expect(product.ingredients.length, 3);
    expect(
      product.transparencyFlags.join(' '),
      contains('NOT a single-ingredient'),
    );
    expect(
      product.clinicalLocks.join(' '),
      contains('Licorice and dong quai'),
    );
  });

  test('NOW Probiotic-10 pooled total cannot prove per-strain dose', () {
    final product = realProductProfiles.singleWhere(
      (item) => item.id == 'now-probiotic10-25',
    );

    expect(product.ingredients.single.amount, contains('25 billion CFU total'));
    expect(
      product.transparencyFlags.join(' '),
      contains('Per-strain CFU is NOT stated'),
    );
    expect(
      product.clinicalLocks.join(' '),
      contains('Do not divide 25 billion by 10'),
    );
  });

  test('FDA literacy rules preserve elemental and proprietary-blend principles', () {
    expect(
      fdaLabelRules.any((item) => item.contains('not the full salt weight')),
      isTrue,
    );
    expect(
      fdaLabelRules.any((item) => item.contains('cannot be reconstructed')),
      isTrue,
    );
    expect(
      fdaLabelRules.any((item) => item.contains('NOT the patient')),
      isTrue,
    );
  });
}
