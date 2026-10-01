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

    expect(find.text('Product & Combination Analyzer'), findsOneWidget);
    expect(find.text('Probiotic Strain Atlas'), findsOneWidget);
    expect(find.text('Herbals, Menopause & Nerves'), findsOneWidget);
  });
}
