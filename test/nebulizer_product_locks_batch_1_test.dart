import 'package:drug_edu/features/nebulizers/data/nebulizer_preparation_profiles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  dynamic profile(String id) =>
      nebulizerPreparationProfiles.firstWhere((item) => item.id == id);

  test('expanded nebulizer library adds five product-locked preparation pathways', () {
    expect(nebulizerPreparationProfiles.length, greaterThanOrEqualTo(19));

    for (final id in <String>[
      'albuterol-lower-strength-rtu',
      'cromolyn-sodium-20mg-2ml',
      'cayston-aztreonam-75mg',
      'arikayce-590mg-8_4ml',
      'pentamidine-inhalation-300mg',
      'hypertonic-sodium-chloride-3-7',
    ]) {
      final item = profile(id);
      expect(item.source.trim(), isNotEmpty, reason: id);
      expect(item.device.trim(), isNotEmpty, reason: id);
      expect(item.preparation, isNotEmpty, reason: id);
      expect(item.doNot, isNotEmpty, reason: id);
    }
  });

  test('lower-strength albuterol remains ready to use and distinct from concentrate', () {
    final item = profile('albuterol-lower-strength-rtu');
    expect(item.doses.length, 2);
    expect(item.doses[0].sourceStrength, contains('0.63 mg / 3 mL'));
    expect(item.doses[1].sourceStrength, contains('1.25 mg / 3 mL'));
    expect(item.doses[0].diluent.toLowerCase(), contains('no mixing'));
    expect(item.doses[1].finalVolume, '3 mL');
    expect(item.doNot.join(' ').toLowerCase(), contains('0.5%'));
  });

  test('cromolyn preserves powered-nebulizer and no-mixing locks', () {
    final item = profile('cromolyn-sodium-20mg-2ml');
    expect(item.doses.single.sourceStrength, '20 mg / 2 mL');
    expect(item.device, contains('6–8 L/min'));
    expect(item.device.toLowerCase(), contains('hand-operated'));
    expect(item.mixing.toLowerCase(), contains('not been established'));
    expect(item.administration.join(' '), contains('5–10 minutes'));
  });

  test('CAYSTON requires supplied 0.17 percent diluent and Altera only', () {
    final item = profile('cayston-aztreonam-75mg');
    expect(item.doses.single.sourceStrength, contains('75 mg'));
    expect(item.doses.single.diluent, contains('1 mL'));
    expect(item.doses.single.diluent, contains('0.17%'));
    expect(item.device, contains('Altera'));
    expect(item.preparation.join(' ').toLowerCase(), contains('immediately'));
    expect(item.doNot.join(' '), contains('0.9%'));
    expect(item.mixing.toLowerCase(), contains('do not mix'));
  });

  test('ARIKAYCE locks Lamira, room-temperature step and 8.4 mL whole vial', () {
    final item = profile('arikayce-590mg-8_4ml');
    expect(item.doses.single.sourceStrength, '590 mg / 8.4 mL');
    expect(item.doses.single.finalVolume, '8.4 mL');
    expect(item.device, contains('Lamira'));
    expect(item.preparation.join(' '), contains('45 minutes'));
    expect(item.preparation.join(' '), contains('10–15 seconds'));
    expect(item.mixing.toLowerCase(), contains('do not'));
    expect(item.cleaning, contains('7 uses'));
    expect(item.cleaning, contains('28 days'));
  });

  test('pentamidine uses 6 mL SWFI only and never saline', () {
    final item = profile('pentamidine-inhalation-300mg');
    expect(item.doses.single.sourceStrength, contains('300 mg'));
    expect(item.doses.single.diluent, contains('6 mL'));
    expect(item.doses.single.diluent, contains('Sterile Water for Injection'));
    expect(item.device, contains('Respirgard II'));
    expect(item.mixing.toLowerCase(), contains('precipitate'));
    expect(item.doNot.join(' ').toLowerCase(), contains('normal saline'));
    expect(item.administration.join(' '), contains('30–45 minutes'));
  });

  test('hypertonic saline keeps 3 and 7 percent strengths separate', () {
    final item = profile('hypertonic-sodium-chloride-3-7');
    expect(item.doses.length, 2);
    expect(item.doses[0].sourceStrength, contains('3%'));
    expect(item.doses[0].sourceStrength, contains('120 mg in 4 mL'));
    expect(item.doses[1].sourceStrength, contains('7%'));
    expect(item.doses[1].sourceStrength, contains('280 mg in 4 mL'));
    expect(item.doNot.join(' ').toLowerCase(), contains('do not inject'));
    expect(item.mixing.toLowerCase(), contains('not establish'));
  });
}
