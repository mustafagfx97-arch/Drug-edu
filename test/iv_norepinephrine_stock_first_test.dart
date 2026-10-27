import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/iv_prep/domain/iv_unified_infusion_engine.dart';
import 'package:drug_edu/features/iv_prep/presentation/iv_unified_infusion_screen.dart';

void main() {
  test('matching 4 mg/4 mL BASE vial has 1 mg/mL stock', () {
    expect(reviewedNorepinephrineStockBaseMgPerMl, 1);
    expect(reviewedNorepinephrineVialBaseMg, 4);
    for (final amount in [1.0, 4.0, 8.0]) {
      expect(norepinephrineReviewedStockWithdrawalMl(
        totalNorepinephrineBaseMg: amount,
        matchingVialVerified: true,
      ), amount);
    }
    expect(norepinephrineReviewedStockWithdrawalMl(
      totalNorepinephrineBaseMg: 4,
      matchingVialVerified: false,
    ), isNull);
    for (final amount in [0.0, -5.0, double.nan, double.infinity]) {
      expect(norepinephrineReviewedStockWithdrawalMl(
        totalNorepinephrineBaseMg: amount,
        matchingVialVerified: true,
      ), isNull);
    }
  });

  test('arithmetic final dilution differs from original vial concentration', () {
    const stockMgPerMl = reviewedNorepinephrineStockBaseMgPerMl;
    final volumeDrawn = 4 / stockMgPerMl;
    expect(volumeDrawn, 4);
    final actualFinalMl = 46 + volumeDrawn;
    expect(actualFinalMl, 50);
    expect(verifiedLocalFinalMcgPerMl(
      totalActiveMg: 4,
      actualFinalVolumeMl: actualFinalMl,
      protocolVerified: true,
    ), 80);
    expect(verifiedLocalFinalMcgPerMl(
      totalActiveMg: 4,
      actualFinalVolumeMl: actualFinalMl,
      protocolVerified: false,
    ), isNull);
  });

  testWidgets('norepinephrine stock displays 1 mg/1 mL before bag selection',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: IvUnifiedInfusionScreen(initialDrug: 'Norepinephrine'),
    ));
    expect(find.byKey(const ValueKey('norepi-stock-one-mg-ml')),
        findsOneWidget);
    expect(find.text('1 mg / 1 mL'), findsOneWidget);
    expect(find.byKey(const ValueKey('unified-pump-result')),
        findsNothing);
  });

  testWidgets('hospital dilution shows withdrawal and final volume safely',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: IvUnifiedInfusionScreen(initialDrug: 'Norepinephrine'),
    ));
    final local = find.byKey(const ValueKey('unified-local-mode'));
    await tester.ensureVisible(local);
    await tester.tap(local);
    await tester.pumpAndSettle();

    final protocol = find.byKey(const ValueKey('unified-protocol-reference'));
    await tester.ensureVisible(protocol);
    await tester.enterText(protocol, 'Reviewed local ICU policy');
    final matchingStock = find.byKey(
      const ValueKey('norepi-confirm-one-mg-stock'),
    );
    await tester.ensureVisible(matchingStock);
    await tester.pumpAndSettle();
    await tester.tap(matchingStock);
    await tester.pumpAndSettle();

    final amount = find.byKey(const ValueKey('unified-total-active-mg'));
    await tester.ensureVisible(amount);
    await tester.enterText(amount, '4');
    final finalVolume = find.byKey(const ValueKey('unified-actual-final-ml'));
    await tester.ensureVisible(finalVolume);
    await tester.enterText(finalVolume, '50');
    await tester.pumpAndSettle();
    final withdrawal = find.byKey(
      const ValueKey('norepi-vial-withdrawal-ml'),
    );
    await tester.ensureVisible(withdrawal);
    await tester.pumpAndSettle();
    expect(find.textContaining('Withdraw 4 mL'), findsOneWidget);
    expect(find.text('Actual final volume: 50 mL'), findsOneWidget);
    expect(find.byKey(const ValueKey('unified-local-concentration')),
        findsNothing);
    expect(find.byKey(const ValueKey('unified-pump-result')),
        findsNothing);

    final verifiedProtocol = find.byKey(
      const ValueKey('unified-local-protocol-confirm'),
    );
    await tester.ensureVisible(verifiedProtocol);
    await tester.tap(verifiedProtocol);
    await tester.pumpAndSettle();
    expect(find.textContaining('80 mcg/mL'), findsOneWidget);
    expect(find.byKey(const ValueKey('unified-pump-result')),
        findsNothing);
  });
}
