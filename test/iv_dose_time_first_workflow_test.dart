import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:drug_edu/features/iv_prep/presentation/iv_dose_time_quick_panel.dart';
import 'package:drug_edu/features/iv_prep/presentation/iv_preparation_detail_screen.dart';

void main() {
  test('ordered stock-volume math requires a verified vial and positive dose',
      () {
    expect(quickIvOrderedDoseToMl(
      orderedDose: 150,
      verifiedStockUnitPerMl: 50,
      vialAndUnitConfirmed: true,
    ), 3);
    expect(quickIvOrderedDoseToMl(
      orderedDose: 80,
      verifiedStockUnitPerMl: 40,
      vialAndUnitConfirmed: true,
    ), 2);
    expect(quickIvOrderedDoseToMl(
      orderedDose: 150,
      verifiedStockUnitPerMl: 50,
      vialAndUnitConfirmed: false,
    ), isNull);
    for (final bad in [0.0, -2.0, double.nan, double.infinity]) {
      expect(quickIvOrderedDoseToMl(
        orderedDose: bad,
        verifiedStockUnitPerMl: 50,
        vialAndUnitConfirmed: true,
      ), isNull);
      expect(quickIvOrderedDoseToMl(
        orderedDose: 150,
        verifiedStockUnitPerMl: bad,
        vialAndUnitConfirmed: true,
      ), isNull);
    }
  });

  test('high-alert special stock and NICU/PICU require special calculator',
      () {
    IvPreparationProfile profile(String name, String population) =>
        ivPreparationProfiles.firstWhere(
          (x) => x.name == name && x.population == population,
        );
    for (final med in [
      'Labetalol', 'Norepinephrine', 'Esmolol', 'Clevidipine',
      'Regular insulin infusion', 'Colistimethate / Colistin',
      'Potassium chloride', 'Potassium phosphate',
      'Epinephrine', 'Nitroglycerin', 'Sodium nitroprusside',
      'Phenytoin',
    ]) {
      expect(quickIvNeedsSpecializedCalculator(profile(med, 'General')),
          isTrue);
    }
    expect(quickIvNeedsSpecializedCalculator(profile('Dopamine', 'NICU')),
        isTrue);
    expect(quickIvNeedsSpecializedCalculator(profile('Epinephrine', 'PICU')),
        isTrue);
    expect(quickIvNeedsSpecializedCalculator(profile('Amiodarone', 'General')),
        isFalse);
  });

  testWidgets('details start with four IV facts and hidden calculator',
      (tester) async {
    final profile = ivPreparationProfiles.firstWhere(
      (p) => p.name == 'Amiodarone' && p.population == 'General',
    );
    await tester.pumpWidget(
      MaterialApp(home: IvPreparationDetailScreen(profile: profile)),
    );
    await tester.pumpAndSettle();
    for (final key in [
      'iv-quick-reconstitution', 'iv-quick-fluids',
      'iv-quick-time', 'iv-quick-further-dilution',
    ]) {
      expect(find.byKey(ValueKey(key)), findsOneWidget);
    }
    expect(find.textContaining('150 mg over 10 minutes'), findsWidgets);
    expect(find.byKey(const ValueKey('iv-dose-time-first-panel')),
        findsNothing);
    final toggle = find.byKey(const ValueKey('iv-simple-calc-toggle'));
    await tester.ensureVisible(toggle);
    await tester.tap(toggle);
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('iv-dose-time-first-panel')),
        findsOneWidget);
    await tester.scrollUntilVisible(
      find.byKey(const ValueKey('iv-expand-preparation-details')), 220,
    );
    expect(find.byKey(const ValueKey('iv-expand-preparation-details')),
        findsOneWidget);
  });

  testWidgets('source-verified stock and confirmation unlock dose-to-mL',
      (tester) async {
    final profile = ivPreparationProfiles.firstWhere(
      (p) => p.name == 'Amiodarone' && p.population == 'General',
    );
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: IvDoseTimeQuickPanel(
            profile: profile, onOpenFullCalculator: () {},
          ),
        ),
      ),
    ));
    expect(find.byKey(const ValueKey('iv-quick-withdrawal-result')),
        findsNothing);
    final dropdown = find.byKey(const ValueKey('iv-quick-vial-choice'));
    await tester.ensureVisible(dropdown);
    await tester.tap(dropdown);
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('150 mg/3 mL').last);
    await tester.pumpAndSettle();
    final dose = find.byKey(const ValueKey('iv-quick-ordered-dose'));
    await tester.ensureVisible(dose);
    await tester.enterText(dose, '150');
    await tester.pump();
    expect(find.byKey(const ValueKey('iv-quick-withdrawal-result')),
        findsNothing);
    final confirm = find.byKey(const ValueKey('iv-quick-confirm-vial'));
    await tester.ensureVisible(confirm);
    await tester.tap(confirm);
    await tester.pumpAndSettle();
    expect(find.text('3 mL'), findsOneWidget);
  });
}
