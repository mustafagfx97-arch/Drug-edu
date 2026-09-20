import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/patient_cards/domain/patient_card_data.dart';

void main() {
  test('patient card hides empty sections and keeps QR concise', () {
    const card = PatientCardData(
      id: 'test',
      templateName: 'Test Card',
      medicationName: 'Medicine',
      subtitleAr: 'تعليمات مختصرة',
      category: 'Medication',
      howToUseAr: 'خذ الدواء حسب الوصفة.',
      importantAr: 'لا تضاعف الجرعة.',
    );

    expect(card.items.length, 2);
    expect(card.toQrText(), contains('كيف أستخدمه؟'));
    expect(card.toQrText(), contains('أهم تنبيه'));
    expect(card.toQrText(), isNot(contains('إذا نسيت الجرعة')));
  });
}
