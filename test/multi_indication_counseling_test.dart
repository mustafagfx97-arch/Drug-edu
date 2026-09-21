import 'package:drug_edu/core/data/medication_indication_options.dart';
import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/features/encyclopedia/presentation/medication_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('spironolactone exposes indication-specific patient choices', () {
    final options = indicationOptionsFor('spironolactone');
    expect(options.map((item) => item.id), containsAll(<String>[
      'heart-failure',
      'hypertension',
      'edema',
      'primary-hyperaldosteronism',
      'hormonal-acne-hirsutism',
    ]));

    final hormonal = indicationOptionFor(
      'spironolactone',
      'hormonal-acne-hirsutism',
    )!;
    expect(hormonal.offLabel, isTrue);
    expect(hormonal.purposeAr, contains('حب الشباب'));
    expect(hormonal.importantAr, contains('الحمل'));
  });

  test('multi-use options preserve product or indication distinctions', () {
    expect(
      indicationOptionsFor('montelukast')
          .firstWhere((item) => item.id == 'exercise-induced-bronchoconstriction')
          .timingEn,
      contains('2 hours'),
    );
    expect(
      indicationOptionsFor('finasteride')
          .firstWhere((item) => item.id == 'bph')
          .importantEn,
      contains('5 mg'),
    );
    expect(
      indicationOptionsFor('finasteride')
          .firstWhere((item) => item.id == 'male-pattern-hair-loss')
          .importantEn,
      contains('1 mg'),
    );
    expect(indicationOptionsFor('duloxetine').length, 5);
    expect(indicationOptionsFor('pregabalin').length, 5);
  });

  testWidgets('spironolactone patient explanation changes with selected use',
      (tester) async {
    final medicine = sampleMedications.firstWhere(
      (item) => item.id == 'spironolactone',
    );

    await tester.pumpWidget(
      MaterialApp(home: MedicationDetailScreen(medication: medicine)),
    );

    await tester.tap(find.text('Patient'));
    await tester.pumpAndSettle();

    expect(find.text('حدد سبب استخدام الدواء'), findsOneWidget);
    expect(find.textContaining('يساعد الجسم على التخلص من السوائل'), findsOneWidget);

    await tester.tap(find.byType(DropdownButtonFormField<String?>));
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('استخدام هرموني').last);
    await tester.pumpAndSettle();

    expect(find.textContaining('حب الشباب الهرموني'), findsOneWidget);
    expect(find.textContaining('استخدام خارج النشرة'), findsWidgets);

    await tester.tap(find.text('Print Card'));
    await tester.pumpAndSettle();
    expect(find.textContaining('حب الشباب الهرموني'), findsOneWidget);
  });
}
