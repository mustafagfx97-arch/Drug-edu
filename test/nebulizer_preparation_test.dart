import 'package:drug_edu/features/more/presentation/more_screen.dart';
import 'package:drug_edu/features/nebulizers/data/nebulizer_preparation_profiles.dart';
import 'package:drug_edu/features/nebulizers/presentation/nebulizer_prep_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  dynamic nebulizerProfileById(String id) =>
      nebulizerPreparationProfiles.firstWhere((item) => item.id == id);

  test('nebulizer library locks concentrate versus ready-to-use preparation', () {
    expect(nebulizerPreparationProfiles.length, greaterThanOrEqualTo(13));

    final albuterolRtu = nebulizerProfileById('albuterol-0083-rtu');
    expect(albuterolRtu.doses.single.finalVolume, '3 mL');
    expect(albuterolRtu.doses.single.diluent, 'None.');
    expect(albuterolRtu.doNot.join(' ').toLowerCase(), contains('concentrate'));

    final albuterolConcentrate =
        nebulizerProfileById('albuterol-05-concentrate');
    expect(albuterolConcentrate.doses[0].drawVolume, contains('0.25 mL'));
    expect(albuterolConcentrate.doses[0].diluent, contains('2.75 mL'));
    expect(albuterolConcentrate.doses[1].drawVolume, contains('0.5 mL'));
    expect(albuterolConcentrate.doses[1].diluent, contains('2.5 mL'));
    expect(
      albuterolConcentrate.doNot.join(' ').toLowerCase(),
      contains('distilled'),
    );
  });

  test('ipratropium and budesonide mixing rules stay source locked', () {
    final ipratropium = nebulizerProfileById('ipratropium-002');
    expect(ipratropium.mixing.toLowerCase(), contains('albuterol'));
    expect(ipratropium.mixing, contains('1 hour'));

    final budesonide = nebulizerProfileById('budesonide-suspension');
    expect(budesonide.mixing.toLowerCase(), contains('separately'));
    expect(budesonide.device.toLowerCase(), contains('jet'));
    expect(budesonide.doNot.join(' ').toLowerCase(), contains('ultrasonic'));
    expect(budesonide.preparation.join(' ').toLowerCase(), contains('shake'));
  });

  test('specialty inhalation solutions preserve do-not-mix restrictions', () {
    final dornase = nebulizerProfileById('dornase-alfa');
    expect(dornase.mixing, contains('DO NOT'));
    expect(dornase.doses.single.diluent, contains('NONE'));

    final tobramycin =
        nebulizerProfileById('tobramycin-inhalation');
    expect(tobramycin.doses.single.finalVolume, '5 mL');
    expect(tobramycin.mixing.toLowerCase(), contains('dornase alfa'));

    final formoterol = nebulizerProfileById('formoterol-neb');
    expect(formoterol.doses.single.finalVolume, '2 mL');
    expect(formoterol.mixing.toLowerCase(), contains('not been established'));
  });

  test('acetylcysteine keeps 10 and 20 percent instructions distinct', () {
    final nac = nebulizerProfileById('acetylcysteine');
    expect(nac.doses[0].sourceStrength, contains('20%'));
    expect(nac.doses[0].drawVolume, contains('3–5 mL'));
    expect(nac.doses[1].sourceStrength, contains('10%'));
    expect(nac.doses[1].drawVolume, contains('6–10 mL'));
    expect(nac.doses[0].diluent, contains('Sterile Water for Inhalation'));
    expect(nac.mixing.toLowerCase(), contains('incompatible'));
  });

  testWidgets('More opens the practical nebulizer preparation library',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MoreScreen(
          themeMode: ThemeMode.light,
          onThemeModeChanged: (_) {},
        ),
      ),
    );

    await tester.tap(find.text('Nebulizer preparation'));
    await tester.pumpAndSettle();

    expect(find.byType(NebulizerPrepScreen), findsOneWidget);
    expect(find.textContaining('source-locked formulations'), findsOneWidget);
    expect(find.text('Albuterol 0.5% concentrate'), findsOneWidget);
  });
}
