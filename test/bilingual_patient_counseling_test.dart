import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/features/encyclopedia/presentation/medication_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('reviewed medicine exposes Arabic English patient toggle',
      (tester) async {
    final warfarin = sampleMedications.firstWhere(
      (medicine) => medicine.id == 'warfarin',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: MedicationDetailScreen(medication: warfarin),
      ),
    );

    await tester.tap(find.text('Patient'));
    await tester.pumpAndSettle();

    expect(find.text('English'), findsOneWidget);
    expect(find.text('العربية'), findsOneWidget);

    await tester.tap(find.text('English'));
    await tester.pumpAndSettle();

    expect(
      find.text('Patient-focused counseling only: simple, actionable instructions without unnecessary clinical detail.'),
      findsOneWidget,
    );
    expect(find.text('Why am I using it?'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Teach-back'),
      500,
      scrollable: find.byType(Scrollable).last,
    );
    expect(find.text('Teach-back'), findsOneWidget);
  });

  testWidgets('newly reviewed medicine exposes bilingual counseling',
      (tester) async {
    final medicine = sampleMedications.firstWhere(
      (item) => item.id == 'cetirizine',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: MedicationDetailScreen(medication: medicine),
      ),
    );

    await tester.tap(find.text('Patient'));
    await tester.pumpAndSettle();

    expect(find.text('English'), findsOneWidget);
    expect(find.text('العربية'), findsOneWidget);

    await tester.tap(find.text('English'));
    await tester.pumpAndSettle();

    expect(find.text('Why am I using it?'), findsOneWidget);
  });
}
