import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/iv_prep/data/iv_unified_infusion_library.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:drug_edu/features/iv_prep/domain/iv_infusion_rate_engine.dart';
import 'package:drug_edu/features/iv_prep/domain/iv_unified_infusion_engine.dart';
import 'package:drug_edu/features/iv_prep/presentation/iv_unified_infusion_screen.dart';
import 'package:drug_edu/features/iv_prep/presentation/iv_preparation_detail_screen.dart';

void main() {
  IvInfusionPreparation recipe(String id) =>
      ivUnifiedInfusionPreparations.firstWhere((p) => p.id == id);
  double pump(String drug, String id, IvOrderedRateUnit unit,
      double prescribed, double? kg) {
    final v = calculateVerifiedIvPump(
      drug: drug, reviewedPreparation: recipe(id),
      orderedUnit: unit, orderedRate: prescribed,
      dosingWeightKg: kg, checkedProductAndProtocol: true,
      checkedClinicianOrder: true,
    );
    expect(v, isNotNull, reason: '$drug $id should calculate only after verification');
    return v!.pumpMlPerHour;
  }

  test('high-use General continuous drips have audited route to pump', () {
    for (final drug in [
      'Dobutamine', 'Dopamine', 'Epinephrine', 'Nitroglycerin',
      'Dexmedetomidine', 'Sodium nitroprusside', 'Amiodarone',
      'Norepinephrine', 'Nicardipine', 'Clevidipine', 'Esmolol', 'Labetalol',
    ]) {
      expect(ivUnifiedInfusionDrugNames.contains(drug), isTrue, reason: drug);
      expect(ivUnifiedPreparationsFor(drug), isNotEmpty);
      expect(ivApprovedOrderUnits(drug), isNotEmpty);
      expect(ivPreparationProfiles.where(
        (p) => p.name == drug && p.population == 'General'), isNotEmpty);
    }
    expect(ivUnifiedInfusionDrugNames.length, 12);
    expect(ivUnifiedInfusionPreparations.map((x) => x.id).toSet().length,
        ivUnifiedInfusionPreparations.length);
    for (final p in ivUnifiedInfusionPreparations) {
      expect(p.nominalMcgPerMl.isFinite, isTrue, reason: p.id);
      expect(p.nominalMcgPerMl, greaterThan(0), reason: p.id);
      expect(p.sourceUrl.startsWith('https://'), isTrue, reason: p.id);
      expect(ivApprovedOrderUnits(p.drug), containsAll(p.orderUnits));
    }
  });

  test('dobutamine stock 250mg/20mL, weight and dose to rate', () {
    final a = recipe('dobutamine-hospira-250mg-in-250ml-diluent');
    final b = recipe('dobutamine-hospira-250mg-in-500ml-diluent');
    expect(a.stockLabel, contains('12.5 mg/mL'));
    expect(a.stockWithdrawalMl, 20);
    expect(a.isManufacturerNominal, isTrue);
    expect(b.isManufacturerNominal, isTrue);
    expect(pump('Dobutamine', a.id, IvOrderedRateUnit.mcgPerKgMin,
        5, 70), 21);
    expect(pump('Dobutamine', b.id, IvOrderedRateUnit.mcgPerKgMin,
        5, 70), 42);
  });

  test('dopamine source table concentrations and bag sizes', () {
    expect(recipe('dopamine-hospira-200mg-in-250ml').stockLabel,
        contains('40 mg/mL'));
    expect(pump('Dopamine', 'dopamine-hospira-200mg-in-250ml',
        IvOrderedRateUnit.mcgPerKgMin, 5, 70), 26.25);
    expect(pump('Dopamine', 'dopamine-hospira-400mg-in-250ml',
        IvOrderedRateUnit.mcgPerKgMin, 5, 70), 13.125);
    expect(pump('Dopamine', 'dopamine-hospira-200mg-in-500ml',
        IvOrderedRateUnit.mcgPerKgMin, 5, 70), 52.5);
  });

  test('epinephrine septic shock stock is NOT the 1mcg/mL infusion', () {
    final p = recipe('epinephrine-1mg-1000ml-dextrose-septic');
    expect(p.stockLabel, contains('1 mg/mL'));
    expect(p.nominalMcgPerMl, 1);
    expect(p.isManufacturerNominal, true);
    expect(p.safety, contains('NOT IM anaphylaxis'));
    expect(pump('Epinephrine', p.id,
        IvOrderedRateUnit.mcgPerKgMin, 0.05, 70), 210);
  });

  test('nitroglycerin fixed mcg/min at 100, 200 and 400mcg/mL', () {
    expect(pump('Nitroglycerin', 'nitroglycerin-final-100mcg-ml',
        IvOrderedRateUnit.mcgPerMin, 20, null), 12);
    expect(pump('Nitroglycerin', 'nitroglycerin-50mg-250ml-final-200mcg',
        IvOrderedRateUnit.mcgPerMin, 20, null), 6);
    expect(pump('Nitroglycerin', 'nitroglycerin-50mg-125ml-final-400mcg',
        IvOrderedRateUnit.mcgPerMin, 20, null), 3);
    expect(recipe('nitroglycerin-50mg-125ml-final-400mcg').stockLabel,
        contains('5 mg/mL'));
  });

  test('dexmedetomidine hourly vs minute dose unit is locked', () {
    final p = recipe('dexmedetomidine-200mcg-in-final-50ml');
    expect(p.nominalMcgPerMl, 4);
    expect(p.stockWithdrawalMl, 2);
    expect(p.isManufacturerNominal, false);
    expect(pump('Dexmedetomidine', p.id,
        IvOrderedRateUnit.mcgPerKgHour, 0.4, 70), 7);
    expect(calculateVerifiedIvPump(
      drug: 'Dexmedetomidine', reviewedPreparation: p,
      orderedUnit: IvOrderedRateUnit.mcgPerKgMin,
      orderedRate: 0.4, dosingWeightKg: 70,
      checkedProductAndProtocol: true, checkedClinicianOrder: true,
    ), isNull);
    expect(calculateOrderedIvInfusion(
      prescribedRate: 0.4,
      rateUnit: IvOrderedRateUnit.mcgPerKgHour,
      finalMicrogramsPerMilliliter: 4, weightKg: null,
    ), isNull);
  });

  test('nitroprusside and amiodarone have distinct safe units', () {
    expect(pump('Sodium nitroprusside', 'nitroprusside-50mg-in-250ml-d5w',
        IvOrderedRateUnit.mcgPerKgMin, 0.3, 70),
        closeTo(6.3, 0.000001));
    expect(pump('Amiodarone', 'amiodarone-vt-maintenance-900mg-in-500ml-d5w',
        IvOrderedRateUnit.mgPerMin, 1, null),
        closeTo(33.333333, 0.00001));
    expect(recipe('nitroprusside-50mg-in-250ml-d5w').instructions,
        contains('PROTECT FROM LIGHT'));
    expect(calculateVerifiedIvPump(
      drug: 'Amiodarone',
      reviewedPreparation: recipe('amiodarone-vt-maintenance-900mg-in-500ml-d5w'),
      orderedUnit: IvOrderedRateUnit.mcgPerKgMin,
      orderedRate: 1, dosingWeightKg: 70,
      checkedProductAndProtocol: true, checkedClinicianOrder: true,
    ), isNull);
  });

  test('not-yet-reviewed heparin/insulin units are NOT mg pump shortcuts', () {
    for (final drug in ['Heparin', 'Regular insulin infusion',
        'Propofol', 'Furosemide']) {
      expect(ivUnifiedInfusionDrugNames, isNot(contains(drug)));
    }
  });

  testWidgets('Dobutamine screen shows stock BEFORE final concentration',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: IvUnifiedInfusionScreen(initialDrug: 'Dobutamine'),
    ));
    expect(find.text('Dobutamine'), findsWidgets);
    final picker = find.byKey(const ValueKey('unified-preparation-Dobutamine'));
    await tester.ensureVisible(picker);
    await tester.tap(picker);
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('250 mg/20 mL vial + 250 mL').last);
    await tester.pumpAndSettle();
    expect(find.textContaining('12.5 mg/mL'), findsWidgets);
    expect(find.byKey(const ValueKey('unified-stock-withdrawal')),
        findsOneWidget);
    expect(find.byKey(const ValueKey('unified-pump-result')), findsNothing);
    expect(find.byKey(const ValueKey('unified-nominal-warning')), findsOneWidget);
  });

  testWidgets('Drug details offer mL/hr for all reviewed adult drips',
      (tester) async {
    final p = ivPreparationProfiles.firstWhere(
      (p) => p.name == 'Dobutamine' && p.population == 'General');
    await tester.pumpWidget(MaterialApp(home: IvPreparationDetailScreen(
      profile: p,
    )));
    expect(find.byKey(const ValueKey('iv-open-unified-infusion')), findsOneWidget);
  });
}
