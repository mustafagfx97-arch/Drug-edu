import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/app.dart';

void main() {
  testWidgets('renders the main clinical workspace', (tester) async {
    await tester.pumpWidget(const DrugEduApp());
    await tester.pumpAndSettle();

    expect(find.text('Drug Edu'), findsOneWidget);
    expect(find.text('Clinical Pharmacist Encyclopedia'), findsOneWidget);
    expect(find.text('IV Prep'), findsOneWidget);
    expect(find.text('Calculators'), findsOneWidget);
  });
}
