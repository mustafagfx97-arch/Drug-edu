import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/app.dart';

void main() {
  testWidgets('renders the Supplement Edu decision-first workspace', (tester) async {
    await tester.pumpWidget(const SupplementEduApp());
    await tester.pumpAndSettle();

    expect(find.text('Supplement Edu'), findsOneWidget);
    expect(
      find.text('Evidence-based supplement decisions for clinical pharmacists'),
      findsOneWidget,
    );
    expect(find.text('Do I need a supplement?'), findsWidgets);
    expect(find.text('Clinical Toolkits'), findsOneWidget);
    expect(find.text('Decision'), findsOneWidget);
    expect(find.text('Needs'), findsOneWidget);
    expect(find.text('Toolkits'), findsOneWidget);
    expect(find.text('Library'), findsOneWidget);

    await tester.tap(find.text('Toolkits'));
    await tester.pumpAndSettle();

    expect(find.text('Probiotic Strain Atlas'), findsOneWidget);

    for (final title in [
      'Joint & Collagen Toolkit',
      'Sexual Health & Fertility',
      'Can I Take These Together?',
      'Product & Combination Analyzer',
    ]) {
      await tester.scrollUntilVisible(
        find.text(title),
        280,
        scrollable: find.byType(Scrollable).last,
      );
      await tester.pumpAndSettle();
      expect(find.text(title), findsOneWidget);
    }
  });
}
