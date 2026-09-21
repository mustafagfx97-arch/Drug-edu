import 'package:drug_edu/features/calculators/presentation/iv_preparation_calculator_screen.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:drug_edu/features/iv_prep/presentation/iv_prep_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IvPreparationProfile profile(String name) =>
      ivPreparationProfiles.firstWhere((item) => item.name == name);

  test('all verified IV profiles are represented in calculator architecture', () {
    expect(ivPreparationProfiles.length, greaterThanOrEqualTo(24));

    final calculatorEnabled =
        ivPreparationProfiles.where((item) => item.calculatorVariants.isNotEmpty);
    expect(calculatorEnabled.length, greaterThanOrEqualTo(23));

    for (final item in calculatorEnabled) {
      for (final variant in item.calculatorVariants) {
        expect(variant.concentration, greaterThan(0), reason: item.name);
        expect(variant.unit.trim(), isNotEmpty, reason: item.name);
        expect(variant.label.trim(), isNotEmpty, reason: item.name);
        expect(variant.note.trim(), isNotEmpty, reason: item.name);
      }
    }
  });

  test('multi-presentation IV medicines require the exact vial variant', () {
    final cefepime = profile('Cefepime');
    expect(cefepime.calculatorVariants.length, 2);
    expect(cefepime.calculatorVariants[0].concentration, 100);
    expect(cefepime.calculatorVariants[1].concentration, 160);
    expect(cefepime.calculatorVariants[1].note, contains('2 g vial'));

    final micafungin = profile('Micafungin');
    expect(micafungin.calculatorVariants.length, 2);
    expect(micafungin.calculatorVariants[0].concentration, 10);
    expect(micafungin.calculatorVariants[1].concentration, 20);
  });

  test('previously omitted ready solutions now have verified calculations', () {
    expect(profile('Metronidazole').calculatorVariants.single.concentration, 5);
    expect(profile('Linezolid').calculatorVariants.single.concentration, 2);
    expect(profile('Fluconazole').calculatorVariants.single.concentration, 2);
    expect(
      profile('Norepinephrine').calculatorVariants.single.concentration,
      1,
    );
    expect(
      profile('Piperacillin / Tazobactam')
          .calculatorVariants
          .single
          .concentration,
      202.5,
    );
  });

  test('ampicillin stays manual instead of using the IM withdrawal table for IV', () {
    final ampicillin = profile('Ampicillin');
    expect(ampicillin.calculatorVariants, isEmpty);
    expect(ampicillin.reconstitution, contains('direct IV'));
    expect(ampicillin.reconstitution, contains('250 mg/mL'));
  });

  testWidgets('IV prep UI hides unverified catalog backlog', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: IvPrepScreen())));
    await tester.pumpAndSettle();

    expect(find.textContaining('locked until exact product data are verified'),
        findsNothing);
    expect(find.text('Ceftriaxone'), findsOneWidget);
    expect(find.text('Cefotaxime'), findsNothing);
    expect(
      find.textContaining('Only exact source-locked preparation profiles'),
      findsOneWidget,
    );
  });

  testWidgets('IV calculator exposes verified profiles and variant selector',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: IvPreparationCalculatorScreen()),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('verified profiles'), findsOneWidget);
    expect(find.textContaining('calculator-enabled'), findsOneWidget);
    expect(find.text('Verified preparation profile'), findsOneWidget);
  });
}
