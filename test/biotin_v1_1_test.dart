import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/supplements/vitamins/data/vitamin_toolkit_data.dart';
import 'package:drug_edu/features/supplements/vitamins/domain/vitamin_toolkit_models.dart';

void main() {
  test('biotin separates nutrition beauty genetic disease and MS research doses', () {
    final item = vitaminToolkitEntries.singleWhere(
      (entry) => entry.id == VitaminId.biotinB7,
    );

    expect(item.pathways.length, 5);

    final nutritional =
        item.pathways.singleWhere((path) => path.id == 'nutritional');
    expect(nutritional.dose, contains('30 mcg/day'));

    final hair = item.pathways.singleWhere((path) => path.id == 'hair-nails');
    expect(hair.dose, contains('2,500–5,000 mcg/day'));
    expect(hair.caveat, contains('Commonly sold'));

    final genetic =
        item.pathways.singleWhere((path) => path.id == 'biotinidase-deficiency');
    expect(genetic.dose, contains('5–10 mg/day'));
    expect(genetic.duration, contains('Lifelong'));

    final btbgd = item.pathways.singleWhere((path) => path.id == 'btbgd');
    expect(btbgd.dose, contains('5–10 mg/kg/day'));
    expect(btbgd.dose, contains('biotin 600 mg/day'));

    final ms =
        item.pathways.singleWhere((path) => path.id == 'progressive-ms');
    expect(ms.dose, contains('100 mg three times daily'));
    expect(ms.dose, contains('300 mg/day'));
    expect(ms.whenToUse, contains('DO NOT recommend'));
    expect(ms.caveat, contains('cannot be recommended'));
  });

  test('biotin retains lab interference as the major high-dose safety lock', () {
    final item = vitaminToolkitEntries.singleWhere(
      (entry) => entry.id == VitaminId.biotinB7,
    );
    final safety = item.safety.join(' ');

    expect(safety, contains('10 mg'));
    expect(safety, contains('troponin'));
    expect(safety, contains('thyroid'));
  });
}
