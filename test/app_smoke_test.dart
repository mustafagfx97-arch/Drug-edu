import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/app.dart';

void main() {
  testWidgets('renders the patient-education-first workspace', (tester) async {
    await tester.pumpWidget(const DrugEduApp());
    await tester.pumpAndSettle();

    expect(find.text('Drug Edu'), findsOneWidget);
    expect(
      find.text('Patient Education for Clinical Pharmacists'),
      findsOneWidget,
    );
    expect(find.text('Patient Education Encyclopedia'), findsOneWidget);
    expect(find.text('IV Prep'), findsOneWidget);
    expect(find.text('Calculators'), findsOneWidget);
  });
}
