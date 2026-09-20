import 'package:drug_edu/features/encyclopedia/presentation/medicines_encyclopedia_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('medicines screen provides Material ancestor for search field',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MedicinesEncyclopediaScreen(),
      ),
    );

    expect(find.byType(TextField), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
