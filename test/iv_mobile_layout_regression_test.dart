import 'package:drug_edu/main_iv.dart';
import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:drug_edu/features/iv_prep/presentation/iv_preparation_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void setPhoneSize(WidgetTester tester, Size size) {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(() {
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });
}

void main() {
  testWidgets('narrow phone PWA keeps readable labels and main navigation',
      (tester) async {
    setPhoneSize(tester, const Size(320, 700));
    await tester.pumpWidget(const DrugIvApp());
    await tester.pumpAndSettle();

    expect(find.text('Drug IV'), findsOneWidget);
    expect(find.byKey(const ValueKey('iv-only-search')), findsOneWidget);
    expect(find.text('IV drugs'), findsOneWidget);
    expect(tester.takeException(), isNull);

    await tester.tap(find.text('Infusion'));
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('quick-drip-screen')), findsOneWidget);
    expect(find.text('1 · Medicine & stock'), findsOneWidget);
    expect(find.text('2 · Weight & dose'), findsOneWidget);
    expect(find.text('3 · Dilution'), findsOneWidget);
    expect(find.text('4 · Dilution check & rate'), findsOneWidget);
    final fieldTheme = Theme.of(tester.element(
        find.byKey(const ValueKey('quick-drip-screen'))));
    expect(fieldTheme.inputDecorationTheme.floatingLabelBehavior,
        FloatingLabelBehavior.always);
    expect(tester.takeException(), isNull);

    final amount = find.byKey(const ValueKey('quick-drip-stock-mg'));
    await tester.ensureVisible(amount);
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    final fluid = find.byKey(const ValueKey('quick-drip-fluid-ml'));
    await tester.ensureVisible(fluid);
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('quick-drip-fluid-type')),
        findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('IV detail shows preparation before administration on a phone',
      (tester) async {
    setPhoneSize(tester, const Size(320, 700));
    final profile = findIvPreparationProfile('Deferoxamine', 'General')!;
    await tester.pumpWidget(MaterialApp(
      home: IvPreparationDetailScreen(profile: profile),
    ));
    await tester.pumpAndSettle();
    expect(find.text('Preparation essentials'), findsOneWidget);
    expect(find.text('1 · Prepare'), findsOneWidget);
    expect(find.text('2 · Administer'), findsOneWidget);
    expect(find.byKey(const ValueKey('iv-quick-reconstitution')),
        findsOneWidget);
    expect(find.byKey(const ValueKey('iv-quick-further-dilution')),
        findsOneWidget);
    expect(find.byKey(const ValueKey('iv-quick-fluids')), findsOneWidget);
    expect(find.byKey(const ValueKey('iv-quick-time')), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
