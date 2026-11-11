import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/main_iv.dart';
import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:drug_edu/features/iv_prep/data/iv_quick_drip_profiles.dart';
import 'package:drug_edu/features/iv_prep/presentation/iv_dose_time_quick_panel.dart';

void main() {
  IvPreparationProfile adult(String name) =>
      findIvPreparationProfile(name, 'General')!;

  const newNames = [
    'Deferoxamine',
    'Fomepizole',
    'Hydroxocobalamin (Cyanokit)',
    'Methylene blue (ProvayBlue)',
    'Leucovorin calcium',
    'Vasopressin',
  ];

  test('six new source-verified General profiles, searchable, no duplicates', () {
    expect(ivPreparationProfiles.length, greaterThanOrEqualTo(142));
    for (final name in newNames) {
      final all = ivPreparationProfiles.where(
        (x) => x.name == name && x.population == 'General',
      );
      expect(all, hasLength(1), reason: name);
      final p = adult(name);
      expect(p.sourceLabel, contains('https://'), reason: name);
      expect(p.reconstitution.trim(), isNotEmpty, reason: name);
      expect(p.allowedDiluents.trim(), isNotEmpty, reason: name);
      expect(p.administration.trim(), isNotEmpty, reason: name);
      expect(p.criticalLocks, isNotEmpty, reason: name);
      final matches = ivMedicationCatalog.where(
        (x) => x.name == name && x.population == 'General' && x.structured,
      );
      expect(matches, hasLength(1), reason: name);
    }
    final knownPairs = ivPreparationProfiles.map((p) =>
      '${p.population}|${p.name}').toList();
    expect(knownPairs.toSet().length, knownPairs.length);
    expect(ivMedicationCatalog.length, ivPreparationProfiles.length);
  });

  test('deferoxamine IV is NOT IM reconstitution; 95 not 100 mg/mL', () {
    final p = adult('Deferoxamine');
    expect(p.calculatorVariants, hasLength(2));
    expect(p.calculatorVariants.every((x) => x.concentration == 95), isTrue);
    expect(p.formulation, contains('500 mg'));
    expect(p.reconstitution, contains('500 mg vial'));
    expect(p.reconstitution, contains('5 mL'));
    expect(p.reconstitution, contains('2 g'));
    expect(p.reconstitution, contains('20 mL'));
    expect(p.furtherDilution, contains('150 mL'));
    expect(p.furtherDilution, contains('3–3.5 mg/mL'));
    expect(p.criticalLocks.join(' '), contains('500 mg + 2 mL is IM'));
    expect(p.criticalLocks.join(' '), contains('2 g/150 mL'));
    expect(p.administration, contains('15 mg/kg/hour'));
    expect(p.administration, contains('125 mg/hour'));
    expect(p.administration, contains('cardiovascular collapse'));
    expect(p.stability, contains('DO NOT refrigerate'));
    expect(quickDripOptionsFor('Deferoxamine'), isEmpty);
  });

  test('fomepizole 1 g/mL 30 minute and non-polycarbonate lock', () {
    final p = adult('Fomepizole');
    expect(p.calculatorVariants.single.concentration, 1000);
    expect(p.calculatorVariants.single.unit, 'mg');
    expect(p.furtherDilution, contains('AT LEAST 100 mL'));
    expect(p.furtherDilution, contains('NON-POLYCARBONATE'));
    expect(p.allowedDiluents, contains('D5W'));
    expect(p.allowedDiluents, contains('0.9% Sodium Chloride'));
    expect(p.administration, contains('30 minutes'));
    expect(p.reconstitution, contains('SOLIDIFY'));
    expect(p.criticalLocks.join(' '), contains('DIALYSIS LOCK'));
    expect(quickDripOptionsFor('Fomepizole'), isEmpty);
  });

  test('Cyanokit must be rocked and has a separate line', () {
    final p = adult('Hydroxocobalamin (Cyanokit)');
    expect(p.reconstitution, contains('200 mL'));
    expect(p.reconstitution, contains('DO NOT SHAKE'));
    expect(p.resultingConcentration, contains('25 mg/mL'));
    expect(p.administration, contains('15 minutes'));
    expect(p.incompatibilities, contains('SEPARATE IV line'));
    expect(p.incompatibilities, contains('sodium thiosulfate'));
    expect(p.stability, contains('6 hours'));
    expect(p.calculatorVariants, isEmpty);
    expect(quickDripOptionsFor(p.name), isEmpty);
  });

  test('ProvayBlue cannot be mixed with NS and carries important contraindications', () {
    final p = adult('Methylene blue (ProvayBlue)');
    expect(p.withdrawalConcentration, 5);
    expect(p.allowedDiluents, contains('D5W only'));
    expect(p.furtherDilution, contains('50 mL D5W'));
    expect(p.administration, contains('5–30 minutes'));
    expect(p.criticalLocks.join(' '), contains('G6PD'));
    expect(p.criticalLocks.join(' '), contains('serotonin syndrome'));
    expect(quickDripOptionsFor(p.name), isEmpty);
  });

  test('leucovorin 350 mg vial cannot be mistaken for 10 mg/mL', () {
    final p = adult('Leucovorin calcium');
    expect(p.calculatorVariants, hasLength(2));
    expect(p.calculatorVariants[0].concentration, 10);
    expect(p.calculatorVariants[1].concentration, 20);
    expect(p.reconstitution, contains('350 mg + 17.5 mL'));
    expect(p.administration, contains('160 mg'));
    expect(p.criticalLocks.join(' '), contains('NEVER intrathecal'));
    expect(p.incompatibilities, contains('5-fluorouracil'));
    expect(p.stability, contains('SWFI'));
  });

  test('vasopressin is UNITS per minute, not mg and not generic quick drip', () {
    final p = adult('Vasopressin');
    expect(p.withdrawalConcentration, 20);
    expect(p.withdrawalUnit, 'units');
    expect(p.resultingConcentration, contains('0.1 UNITS/mL'));
    expect(p.resultingConcentration, contains('1 UNIT/mL'));
    expect(p.furtherDilution, contains('2.5 mL'));
    expect(p.furtherDilution, contains('5 mL'));
    expect(p.administration, contains('UNITS/MIN'));
    expect(p.criticalLocks.join(' '), contains('UNITS LOCK'));
    expect(quickIvNeedsSpecializedCalculator(p), isTrue);
    expect(quickDripOptionsFor('Vasopressin'), isEmpty);
  });

  testWidgets('Desferal brand search finds Deferoxamine without a duplicate', (tester) async {
    await tester.pumpWidget(const DrugIvApp());
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(const ValueKey('iv-only-search')),
      'Desferal',
    );
    await tester.pumpAndSettle();
    expect(find.text('1 matching verified IV profiles'), findsOneWidget);
    // Sliver rows can be off-screen and not built in a small phone viewport.
    expect(ivMedicationCatalog.singleWhere((e) =>
      e.name == 'Deferoxamine' && e.population == 'General').searchAliases,
      contains('Desferal'));
  });

  testWidgets('search Deferoxamine and open exact IV prep', (tester) async {
    await tester.pumpWidget(const DrugIvApp());
    await tester.pumpAndSettle();
    final search = find.byKey(const ValueKey('iv-only-search'));
    await tester.enterText(search, 'Deferoxamine');
    await tester.pumpAndSettle();
    expect(find.text('Deferoxamine'), findsOneWidget);
    await tester.tap(find.text('Deferoxamine'));
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('iv-quick-reconstitution')), findsOneWidget);
    expect(find.text('IV · General'), findsOneWidget);
  });
}
