import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/iv_prep/data/iv_guided_preparation_options.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:drug_edu/features/iv_prep/presentation/iv_dose_time_quick_panel.dart';

void main() {
  IvGuidedDoseOption option(String id) =>
      ivGuidedAdultDoseOptions.firstWhere((v) => v.id == id);

  test('adult acetaminophen labeled weight brackets cannot cross over', () {
    expect(option('apap-50plus-1000q6').doseMg(weightKg: 50), 1000);
    expect(option('apap-50plus-1000q6').doseMg(weightKg: 49.99), isNull);
    expect(option('apap-under50-15q6').doseMg(weightKg: 49), 735);
    expect(option('apap-under50-15q6').doseMg(weightKg: 50), isNull);
    expect(option('apap-under50-12_5q4').doseMg(weightKg: 40), 500);
    expect(option('apap-under50-15q6').doseMg(), isNull);
  });

  test('ondansetron mg/kg cap and invalid weights are blocked', () {
    final chemo = option('ondansetron-adult-chemo');
    expect(chemo.doseMg(weightKg: 70), closeTo(10.5, 1e-9));
    expect(chemo.doseMg(weightKg: 120), 16);
    for (final bad in [0.0, -1.0, double.nan, double.infinity]) {
      expect(chemo.doseMg(weightKg: bad), isNull);
    }
    expect(option('ondansetron-adult-ponv').doseMg(), 4);
    expect(guidedDoseOptionsFor('Ondansetron', 'NICU'), isEmpty);
    expect(guidedDoseOptionsFor('Norepinephrine', 'General'), isEmpty);
  });

  test('dose-free dilution recipes preserve added vs final volume', () {
    final nic = dilutionRecipesFor('Nicardipine', 'General').single;
    expect(nic.stockVolumeMl, 10);
    expect(nic.addedDiluentMl, 240);
    expect(nic.finalVolumeMl, 250);
    expect(nic.finalMgPerMl, 0.1);
    final lab = dilutionRecipesFor('Labetalol', 'General');
    expect(lab, hasLength(2));
    expect(lab[0].finalVolumeMl, 200);
    expect(lab[0].finalMgPerMl, 1);
    expect(lab[1].finalVolumeMl, 290);
    expect(lab[1].finalMgPerMl, closeTo(200 / 290, 1e-9));
    expect(dilutionRecipesFor('Labetalol', 'NICU'), isEmpty);
    expect(dilutionRecipesFor('Clevidipine', 'General'), isEmpty);
  });

  testWidgets('dose-free mode works for high-alert labetalol without order',
      (tester) async {
    final profile = ivPreparationProfiles.firstWhere(
      (v) => v.name == 'Labetalol' && v.population == 'General',
    );
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: SingleChildScrollView(
        child: IvDoseTimeQuickPanel(profile: profile,
            onOpenFullCalculator: () {}),
      )),
    ));
    await tester.tap(find.byKey(const ValueKey('iv-mode-prep-only')));
    await tester.pumpAndSettle();
    expect(find.textContaining('No structured manufacturer'), findsNothing);
    final recipe = find.byKey(const ValueKey('iv-prep-only-recipe-choice'));
    await tester.ensureVisible(recipe);
    await tester.tap(recipe);
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('FINAL 200 mL').last);
    await tester.pumpAndSettle();
    expect(find.textContaining('Final concentration: 1 mg/mL'), findsOneWidget);
    expect(find.byKey(const ValueKey('iv-quick-withdrawal-result')), findsNothing);
  });

  testWidgets('amiodarone labeled example needs order and vial confirmations',
      (tester) async {
    final profile = ivPreparationProfiles.firstWhere(
      (v) => v.name == 'Amiodarone' && v.population == 'General',
    );
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: SingleChildScrollView(
        child: IvDoseTimeQuickPanel(profile: profile,
            onOpenFullCalculator: () {}),
      )),
    ));
    final vial = find.byKey(const ValueKey('iv-quick-vial-choice'));
    await tester.ensureVisible(vial);
    await tester.tap(vial);
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('150 mg/3 mL').last);
    await tester.pumpAndSettle();
    final guide = find.byKey(const ValueKey('iv-guided-indication-dose'));
    await tester.ensureVisible(guide);
    await tester.tap(guide);
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('150 mg INITIAL').last);
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('iv-quick-withdrawal-result')),
        findsNothing);
    final order = find.byKey(const ValueKey('iv-guided-confirm-order'));
    await tester.ensureVisible(order);
    await tester.tap(order);
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('iv-quick-withdrawal-result')),
        findsNothing);
    final confirm = find.byKey(const ValueKey('iv-quick-confirm-vial'));
    await tester.ensureVisible(confirm);
    await tester.tap(confirm);
    await tester.pumpAndSettle();
    expect(find.text('3 mL'), findsOneWidget);
  });
}
