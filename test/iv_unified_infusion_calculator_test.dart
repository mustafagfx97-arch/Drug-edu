import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/iv_prep/data/iv_unified_infusion_library.dart';
import 'package:drug_edu/features/iv_prep/domain/iv_infusion_rate_engine.dart';
import 'package:drug_edu/features/iv_prep/domain/iv_unified_infusion_engine.dart';
import 'package:drug_edu/features/iv_prep/presentation/iv_unified_infusion_screen.dart';
import 'package:drug_edu/main_iv.dart';

void main() {
  IvInfusionPreparation stock(String id) =>
      ivUnifiedInfusionPreparations.firstWhere((x) => x.id == id);

  test('reviewed library contains only identified adult infusion products', () {
    expect(ivUnifiedInfusionDrugNames, containsAll([
      'Norepinephrine', 'Nicardipine', 'Clevidipine',
      'Esmolol', 'Nitroglycerin', 'Labetalol',
    ]));
    expect(ivUnifiedInfusionPreparations.length, 10);
    expect(ivUnifiedInfusionPreparations.map((p) => p.id).toSet().length,
        ivUnifiedInfusionPreparations.length);
    expect(ivUnifiedPreparationsFor('Vancomycin'), isEmpty);
    expect(ivApprovedOrderUnits('Vancomycin'), isEmpty);
    expect(stock('norepinephrine-concentrate-final-4mcg-ml')
        .isManufacturerNominal, isTrue);
    expect(stock('baxter-premix-4mg-250ml').readyToUse, isTrue);
    expect(stock('labetalol-200-in-290').nominalMcgPerMl,
        closeTo(200000 / 290, 1e-8));
  });

  test('patient 70kg, ordered norepinephrine 0.05, exact bag 16mcg/mL', () {
    final r = calculateVerifiedIvPump(
      drug: 'Norepinephrine',
      reviewedPreparation: stock('baxter-premix-4mg-250ml'),
      orderedUnit: IvOrderedRateUnit.mcgPerKgMin,
      orderedRate: 0.05,
      dosingWeightKg: 70,
      checkedProductAndProtocol: true,
      checkedClinicianOrder: true,
    )!;
    expect(r.finalMicrogramsPerMl, 16);
    expect(r.deliveryMicrogramsPerHour, 210);
    expect(r.pumpMlPerHour, 13.125);
    expect(r.sourceLocked, isTrue);
    expect(r.nominalConcentration, isFalse);
  });

  test('rate automatically updates for each reviewed concentration', () {
    for (final pair in [
      ('norepinephrine-concentrate-final-4mcg-ml', 52.5),
      ('baxter-premix-4mg-250ml', 13.125),
      ('baxter-premix-8mg-250ml', 6.5625),
      ('baxter-premix-16mg-250ml', 3.28125),
    ]) {
      final r = calculateVerifiedIvPump(
        drug: 'Norepinephrine',
        reviewedPreparation: stock(pair.$1),
        orderedUnit: IvOrderedRateUnit.mcgPerKgMin,
        orderedRate: 0.05,
        dosingWeightKg: 70,
        checkedProductAndProtocol: true,
        checkedClinicianOrder: true,
      )!;
      expect(r.pumpMlPerHour, closeTo(pair.$2, 1e-9));
    }
  });

  test('locally verified total active mg / ACTUAL final mL', () {
    expect(verifiedLocalFinalMcgPerMl(
      totalActiveMg: 4, actualFinalVolumeMl: 250,
      protocolVerified: true,
    ), 16);
    expect(verifiedLocalFinalMcgPerMl(
      totalActiveMg: 4, actualFinalVolumeMl: 1004,
      protocolVerified: true,
    ), closeTo(4000 / 1004, 1e-9));
    expect(verifiedLocalFinalMcgPerMl(
      totalActiveMg: 4, actualFinalVolumeMl: 250,
      protocolVerified: false,
    ), isNull);
    for (final invalid in [0.0, -1.0, double.nan, double.infinity]) {
      expect(verifiedLocalFinalMcgPerMl(
        totalActiveMg: invalid, actualFinalVolumeMl: 250,
        protocolVerified: true,
      ), isNull);
      expect(verifiedLocalFinalMcgPerMl(
        totalActiveMg: 4, actualFinalVolumeMl: invalid,
        protocolVerified: true,
      ), isNull);
    }
  });

  test('local arithmetic requires independent checks and allowed rate units', () {
    IvUnifiedPumpResult? local({
      bool protocol = true,
      bool product = true,
      bool order = true,
      double activeMg = 4,
      double finalMl = 250,
      double dose = 0.05,
      double? kg = 70,
      String drug = 'Norepinephrine',
      IvOrderedRateUnit unit = IvOrderedRateUnit.mcgPerKgMin,
    }) => calculateVerifiedIvPump(
      drug: drug, orderedUnit: unit,
      orderedRate: dose, dosingWeightKg: kg,
      checkedProductAndProtocol: product, checkedClinicianOrder: order,
      localTotalActiveMg: activeMg, localFinalVolumeMl: finalMl,
      localProtocolConfirmed: protocol,
    );
    expect(local()!.pumpMlPerHour, 13.125);
    expect(local(protocol: false), isNull);
    expect(local(product: false), isNull);
    expect(local(order: false), isNull);
    expect(local(finalMl: 0), isNull);
    expect(local(kg: 0), isNull);
    expect(local(dose: -1), isNull);
    expect(local(unit: IvOrderedRateUnit.mgPerHour), isNull);
    expect(local(drug: 'Vancomycin'), isNull);
  });

  test('labetalol 2 mg/min = 120 mL/hr at exactly 1 mg/mL', () {
    final r = calculateVerifiedIvPump(
      drug: 'Labetalol',
      reviewedPreparation: stock('labetalol-200-in-200'),
      orderedUnit: IvOrderedRateUnit.mgPerMin,
      orderedRate: 2,
      dosingWeightKg: null,
      checkedProductAndProtocol: true,
      checkedClinicianOrder: true,
    )!;
    expect(r.deliveryMicrogramsPerHour, 120000);
    expect(r.pumpMlPerHour, 120);
    final other = calculateVerifiedIvPump(
      drug: 'Labetalol',
      reviewedPreparation: stock('labetalol-200-in-290'),
      orderedUnit: IvOrderedRateUnit.mgPerMin,
      orderedRate: 2,
      dosingWeightKg: null,
      checkedProductAndProtocol: true,
      checkedClinicianOrder: true,
    )!;
    expect(other.pumpMlPerHour, 174);
  });

  test('cross-drug preparation use blocked; unconfirmed blocked', () {
    expect(calculateVerifiedIvPump(
      drug: 'Norepinephrine',
      reviewedPreparation: stock('cleviprex-rtu-500mcg-ml'),
      orderedUnit: IvOrderedRateUnit.mcgPerKgMin,
      orderedRate: 0.05, dosingWeightKg: 70,
      checkedProductAndProtocol: true, checkedClinicianOrder: true,
    ), isNull);
    expect(calculateVerifiedIvPump(
      drug: 'Norepinephrine',
      reviewedPreparation: stock('baxter-premix-4mg-250ml'),
      orderedUnit: IvOrderedRateUnit.mcgPerKgMin,
      orderedRate: 0.05, dosingWeightKg: 70,
      checkedProductAndProtocol: false, checkedClinicianOrder: true,
    ), isNull);
  });

  testWidgets('unified infusion starts blank until dose/bag are verified',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: IvUnifiedInfusionScreen(initialDrug: 'Norepinephrine'),
    ));
    expect(find.byKey(const ValueKey('unified-pump-result')), findsNothing);
    final picker =
        find.byKey(const ValueKey('unified-preparation-Norepinephrine'));
    await tester.ensureVisible(picker);
    await tester.tap(picker);
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('Baxter READY TO USE · 4 mg').last);
    await tester.pumpAndSettle();
    final weight = find.byKey(const ValueKey('unified-patient-weight'));
    await tester.ensureVisible(weight);
    await tester.enterText(weight, '70');
    final dose = find.byKey(const ValueKey('unified-prescribed-rate'));
    await tester.ensureVisible(dose);
    await tester.enterText(dose, '0.05');
    await tester.pump();
    expect(find.byKey(const ValueKey('unified-pump-result')), findsNothing);
    final match = find.byKey(const ValueKey('unified-confirm-concentration'));
    await tester.ensureVisible(match);
    await tester.tap(match);
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('unified-pump-result')), findsNothing);
    final order = find.byKey(const ValueKey('unified-confirm-order'));
    await tester.ensureVisible(order);
    await tester.tap(order);
    await tester.pumpAndSettle();
    expect(find.text('13.125 mL/hr'), findsOneWidget);
    await tester.ensureVisible(dose);
    await tester.enterText(dose, '0.1');
    await tester.pump();
    expect(find.byKey(const ValueKey('unified-pump-result')), findsNothing);
  });

  testWidgets('main Drug IV infusion tab opens the unified calculator',
      (tester) async {
    await tester.pumpWidget(const DrugIvApp());
    await tester.pumpAndSettle();
    await tester.tap(find.text('Infusion'));
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('unified-infusion-screen')),
        findsOneWidget);
  });
}
