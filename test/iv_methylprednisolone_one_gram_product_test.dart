import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/iv_prep/data/iv_methylprednisolone_presentations.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:drug_edu/features/iv_prep/presentation/iv_preparation_detail_screen.dart';
import 'package:drug_edu/features/iv_prep/presentation/iv_dose_time_quick_panel.dart';

void main() {
  test('1 g Act-O-Vial and plain vial require different preparation', () {
    final act = ivMethylprednisolonePresentations.firstWhere(
      (p) => p.id == 'solu-medrol-1000mg-actovial',
    );
    final plain = ivMethylprednisolonePresentations.firstWhere(
      (p) => p.id == 'solu-medrol-1000mg-plain',
    );
    expect(act.amountMgEquivalent, 1000);
    expect(plain.amountMgEquivalent, 1000);
    expect(act.reconstitutedMl, 8);
    expect(plain.reconstitutedMl, 16);
    expect(act.stockMgPerMl, 125);
    expect(plain.stockMgPerMl, 62.5);
    expect(act.reconstitution, contains('integrated diluent'));
    expect(plain.reconstitution, contains('Bacteriostatic Water'));
    expect(plain.safety.toLowerCase(), contains('benzyl'));
    expect(act.safety.toLowerCase(), contains('preservative-free'));
    expect(act.sourceUrl, startsWith('https://'));
    expect(plain.sourceUrl, startsWith('https://'));
    expect(act.administration, contains('at least 30 minutes'));
    expect(plain.administration, contains('at least 30 minutes'));
    expect(act.administration, contains('cardiac arrest'));
  });

  test('six vial choices have unique source-linked IDs and match profile', () {
    final profile = findIvPreparationProfile(
      'Methylprednisolone', 'General',
    )!;
    final ids = <String>{};
    expect(ivMethylprednisolonePresentations.length, 7);
    expect(profile.calculatorVariants.length, 6);
    for (final p in ivMethylprednisolonePresentations) {
      expect(ids.add(p.id), isTrue);
      expect(p.amountMgEquivalent > 0, isTrue);
      if (p.sourceVerifiedFinalVolume) {
        expect(p.reconstitutedMl! > 0, isTrue);
      } else {
        expect(p.reconstitutedMl, isNull);
      }
      if (!p.sourceVerifiedFinalVolume) {
        expect(p.id, contains('mpsone-scotmed'));
        expect(p.stockMgPerMl, isNull);
        expect(profile.calculatorVariants.where((v) => v.id == p.id), isEmpty);
        continue;
      }
      final variant = profile.calculatorVariants.singleWhere(
        (v) => v.id == p.id,
      );
      expect(variant.unit, 'mg');
      expect(variant.concentration, closeTo(p.stockMgPerMl!, 0.000001));
    }
    expect(profile.criticalLocks.join(' '), contains('30 minutes'));
    expect(profile.allowedDiluents, contains('D5W'));
    expect(profile.allowedDiluents, contains('0.9%'));
    expect(profile.furtherDilution, contains('no universal'));
    expect(profile.incompatibilities, contains('acetate'));
  });

  test('dose-to-mL arithmetic reflects selected manufacturer stock only', () {
    expect(quickIvOrderedDoseToMl(
      orderedDose: 1000, verifiedStockUnitPerMl: 125,
      vialAndUnitConfirmed: true,
    ), 8);
    expect(quickIvOrderedDoseToMl(
      orderedDose: 1000, verifiedStockUnitPerMl: 62.5,
      vialAndUnitConfirmed: true,
    ), 16);
    expect(quickIvOrderedDoseToMl(
      orderedDose: 1000, verifiedStockUnitPerMl: 125,
      vialAndUnitConfirmed: false,
    ), isNull);
  });

  test('SCOTMED MPSONE local 10 mL diluent is not a validated final volume', () {
    final mpsone = ivMethylprednisolonePresentations.singleWhere(
      (p) => p.id ==
          'mpsone-scotmed-1000mg-10ml-supplied-unverified',
    );
    expect(mpsone.amountMgEquivalent, 1000);
    expect(mpsone.reconstitutedMl, isNull);
    expect(mpsone.stockMgPerMl, isNull);
    expect(mpsone.sourceVerifiedFinalVolume, isFalse);
    expect(mpsone.reconstitution, contains('10 mL'));
    expect(mpsone.reconstitution, contains('NOT been confirmed'));
    expect(mpsone.reconstitution, contains('Do not infer'));
    expect(mpsone.safety, contains('LOCAL PHARMACIST-REPORTED'));
    expect(mpsone.furtherDilution, contains('locally validated'));
    expect(mpsone.sourceUrl, contains('scotmedcare.com'));
    final pfizer = ivMethylprednisolonePresentations
        .where((p) => p.stockMgPerMl != null).toList();
    expect(pfizer.length, 6);
  });

  testWidgets('MPSONE selection never shows unverified dose-to-mL',
      (tester) async {
    final profile = findIvPreparationProfile('Methylprednisolone', 'General')!;
    await tester.pumpWidget(
      MaterialApp(home: IvPreparationDetailScreen(profile: profile)),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(
      const ValueKey('iv-methylprednisolone-product'),
    ));
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining(
      'MPSONE 1 g', findRichText: true,
    ).last);
    await tester.pumpAndSettle();
    expect(find.textContaining('10 mL water ampoule'), findsWidgets);
    await tester.tap(find.byKey(const ValueKey('iv-quick-reconstitution')));
    await tester.pumpAndSettle();
    expect(find.textContaining('Final volume/concentration: NOT verified'),
        findsWidgets);
    final panel = find.byKey(const ValueKey('iv-simple-calc-toggle'));
    await tester.scrollUntilVisible(panel, 220);
    await tester.tap(panel);
    await tester.pumpAndSettle();
    expect(find.textContaining('dose-to-mL calculator unavailable'),
        findsOneWidget);
    expect(find.byKey(const ValueKey('iv-dose-time-first-panel')), findsNothing);
  });

  testWidgets('methylprednisolone requires exact 1g vial selection before facts',
      (tester) async {
    final profile = findIvPreparationProfile('Methylprednisolone', 'General')!;
    await tester.pumpWidget(
      MaterialApp(home: IvPreparationDetailScreen(profile: profile)),
    );
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('iv-methylprednisolone-product')),
        findsOneWidget);
    expect(find.textContaining('Select the exact methylprednisolone vial'),
        findsWidgets);
    await tester.tap(find.byKey(
      const ValueKey('iv-methylprednisolone-product'),
    ));
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining(
      '1 g PLAIN vial', findRichText: true,
    ).last);
    await tester.pumpAndSettle();
    expect(find.textContaining('16 mL of the specified'), findsWidgets);
    expect(find.textContaining('at least 30 minutes'), findsWidgets);
    final chosen = tester.widget<DropdownButtonFormField<String>>(
      find.byKey(const ValueKey('iv-methylprednisolone-product')),
    );
    expect(chosen.initialValue, 'solu-medrol-1000mg-plain');
  });
}
