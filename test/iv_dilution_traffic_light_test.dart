import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/iv_prep/domain/iv_dilution_safety_engine.dart';
import 'package:drug_edu/features/iv_prep/presentation/iv_unified_infusion_screen.dart';

void main() {
  IvDilutionAssessment check(
    String drug, double mg, double finalMl, {
    IvDiluent fluid = IvDiluent.d5w,
    IvLineType line = IvLineType.peripheral,
    bool verified = true,
    bool shield = false,
    bool tubing = false,
  }) => assessAdultIvDilution(
    drug: drug, drugMg: mg, actualFinalMl: finalMl,
    fluid: fluid, line: line, productAndProtocolVerified: verified,
    lightProtectionVerified: shield, lowSorptionSetVerified: tubing,
  );

  test('green dobutamine exact concentration needs verified protocol', () {
    expect(check('Dobutamine', 250, 250).light, IvDilutionLight.green);
    expect(check('Dobutamine', 250, 250, verified: false).light,
        IvDilutionLight.yellow);
    expect(check('Dobutamine', 250, 50).light, IvDilutionLight.yellow);
    expect(check('Dobutamine', 250, 40).light, IvDilutionLight.red);
    expect(check('Dobutamine', 250, 45).blocked, isTrue);
    expect(check('Dobutamine', 250, 400).light, IvDilutionLight.yellow);
    expect(check('Dobutamine', 250, 250,
        fluid: IvDiluent.bicarbonate).light, IvDilutionLight.red);
  });

  test('nitroglycerin exceeds labeled max; tubing generates yellow', () {
    expect(check('Nitroglycerin', 50, 500).light,
        IvDilutionLight.yellow);
    expect(check('Nitroglycerin', 50, 500, tubing: true).light,
        IvDilutionLight.green);
    expect(check('Nitroglycerin', 50, 250, tubing: true).light,
        IvDilutionLight.green);
    expect(check('Nitroglycerin', 50, 125, tubing: true).light,
        IvDilutionLight.green);
    expect(check('Nitroglycerin', 50, 100, tubing: true).light,
        IvDilutionLight.red);
    expect(check('Nitroglycerin', 50, 500,
        fluid: IvDiluent.lactatedRingers, tubing: true).blocked, isTrue);
  });

  test('amiodarone >2mg/mL red peripheral, yellow central', () {
    final p = check('Amiodarone', 900, 300);
    expect(p.light, IvDilutionLight.red);
    expect(p.reason, contains('peripheral'));
    final c = check('Amiodarone', 900, 300, line: IvLineType.central);
    expect(c.light, IvDilutionLight.yellow);
    expect(c.action, contains('central'));
    expect(check('Amiodarone', 900, 500, line: IvLineType.central).light,
        IvDilutionLight.green);
    expect(check('Amiodarone', 900, 500,
        fluid: IvDiluent.normalSaline).blocked, isTrue);
    expect(check('Amiodarone', 900, 100, line: IvLineType.central).blocked,
        isTrue);
  });

  test('dexmedetomidine requires 200mcg in exact 50mL saline', () {
    expect(check('Dexmedetomidine', 0.2, 50,
        fluid: IvDiluent.normalSaline).light, IvDilutionLight.green);
    expect(check('Dexmedetomidine', 0.2, 100,
        fluid: IvDiluent.normalSaline).blocked, isTrue);
    expect(check('Dexmedetomidine', 0.2, 50).blocked, isTrue);
    expect(check('Dexmedetomidine', 0.4, 100,
        fluid: IvDiluent.normalSaline).light, IvDilutionLight.yellow);
  });

  test('nitroprusside fluid and light protection are mandatory', () {
    expect(check('Sodium nitroprusside', 50, 250).light,
        IvDilutionLight.yellow);
    expect(check('Sodium nitroprusside', 50, 250, shield: true).light,
        IvDilutionLight.green);
    expect(check('Sodium nitroprusside', 50, 100, shield: true).blocked,
        isTrue);
    expect(check('Sodium nitroprusside', 50, 250,
        fluid: IvDiluent.normalSaline, shield: true).blocked, isTrue);
  });

  test('epinephrine NS not recommended; nominal remains caution', () {
    expect(check('Epinephrine', 1, 1000,
        fluid: IvDiluent.normalSaline).light, IvDilutionLight.yellow);
    expect(check('Epinephrine', 1, 1000).light, IvDilutionLight.yellow);
  });

  test('clevidipine premix is never automatically approved for compounding', () {
    expect(check('Clevidipine', 25, 50).blocked, isTrue);
    expect(check('Esmolol', 2500, 250).blocked, isTrue);
  });

  test('bad inputs are red; unknown/not-verified are yellow not green', () {
    expect(check('Dobutamine', -1, 100).blocked, isTrue);
    expect(check('Dobutamine', 10, 0).blocked, isTrue);
    expect(check('Dobutamine', double.nan, 250).blocked, isTrue);
    expect(check('Unreviewed drip', 10, 100).light,
        IvDilutionLight.yellow);
    expect(assessAdultIvDilution(
      drug: 'Dobutamine', drugMg: 250, actualFinalMl: null,
      fluid: IvDiluent.d5w, line: IvLineType.central,
      productAndProtocolVerified: true,
      lightProtectionVerified: true,
      lowSorptionSetVerified: true,
    ).light, IvDilutionLight.yellow);
  });

  testWidgets('local traffic light turns red for forbidden nitroglycerin dilution',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: IvUnifiedInfusionScreen(initialDrug: 'Nitroglycerin'),
    ));
    final local = find.byKey(const ValueKey('unified-local-mode'));
    await tester.ensureVisible(local);
    await tester.tap(local);
    await tester.pumpAndSettle();
    final mg = find.byKey(const ValueKey('unified-total-active-mg'));
    await tester.ensureVisible(mg);
    await tester.enterText(mg, '50');
    final vol = find.byKey(const ValueKey('unified-actual-final-ml'));
    await tester.ensureVisible(vol);
    await tester.enterText(vol, '100');
    final fld = find.byKey(const ValueKey('dilution-fluid-Nitroglycerin'));
    await tester.ensureVisible(fld);
    await tester.tap(fld);
    await tester.pumpAndSettle();
    await tester.tap(find.text('D5W (5% dextrose)').last);
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('dilution-traffic-light')), findsOneWidget);
    expect(find.textContaining('RED · STOP'), findsOneWidget);
    expect(find.byKey(const ValueKey('unified-pump-result')), findsNothing);
  });
}
