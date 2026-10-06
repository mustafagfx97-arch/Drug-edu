import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/core/data/sample_medications.dart';

void main() {
  test('standalone Patient Edu keeps the full verified medication encyclopedia', () {
    expect(sampleMedications.length, 410);
    expect(sampleMedications.map((m) => m.id).toSet().length, 410);
  });
}
