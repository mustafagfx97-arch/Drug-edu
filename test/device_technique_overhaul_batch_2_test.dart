import 'package:flutter_test/flutter_test.dart';

import 'package:drug_edu/features/visual_guides/data/visual_guide_catalog.dart';

void main() {
  group('Devices and technique overhaul batch 2', () {
    test('budesonide/formoterol offers exact device choices', () {
      expect(
        medicationVisualGuideIds['budesonide-formoterol'],
        containsAll(<String>['symbicort-pmdi', 'turbuhaler']),
      );

      final pmdi = visualGuideById('symbicort-pmdi');
      final turbo = visualGuideById('turbuhaler');

      expect(pmdi, isNotNull);
      expect(turbo, isNotNull);
      expect(pmdi!.firstUseSteps.join(' ').toLowerCase(), contains('2 test sprays'));
      expect(turbo!.firstUseSteps.join(' ').toLowerCase(), contains('repeat'));
      expect(
        pmdi.scopeNote.toLowerCase(),
        contains('pressurized'),
      );
      expect(
        turbo.scopeNote.toLowerCase(),
        contains('turbohaler'),
      );
    });

    test('RESPIMAT locks first-use priming and daily TOP separately', () {
      final respimat = visualGuideById('respimat')!;

      expect(respimat.firstUseSteps, isNotEmpty);
      expect(
        respimat.firstUseSteps.join(' ').toLowerCase(),
        contains('3 more times'),
      );
      expect(
        respimat.steps.join(' ').toLowerCase(),
        contains('turn'),
      );
      expect(
        respimat.steps.join(' ').toLowerCase(),
        contains('open'),
      );
      expect(
        respimat.steps.join(' ').toLowerCase(),
        contains('press'),
      );
      expect(
        respimat.cleaningSteps.join(' ').toLowerCase(),
        contains('once weekly'),
      );
    });

    test('DPI guides reject pMDI-style technique', () {
      final diskus = visualGuideById('diskus')!;
      final ellipta = visualGuideById('ellipta')!;

      expect(diskus.steps.join(' ').toLowerCase(), contains('quickly and deeply'));
      expect(diskus.mistakes.join(' ').toLowerCase(), contains('spacer'));
      expect(ellipta.steps.join(' ').toLowerCase(), contains('air vent'));
      expect(
        ellipta.mistakes.join(' ').toLowerCase(),
        contains('opening and closing'),
      );
    });

    test('nasal, eye and ear technique preserve product-specific locks', () {
      final nasal = visualGuideById('nasal-spray')!;
      final eye = visualGuideById('eye-drops')!;
      final ear = visualGuideById('ear-drops')!;

      expect(
        nasal.steps.join(' ').toLowerCase(),
        contains('away from the nasal septum'),
      );
      expect(
        nasal.scopeNote.toLowerCase(),
        contains('priming'),
      );
      expect(
        eye.afterUseSteps.join(' ').toLowerCase(),
        contains('5 minutes'),
      );
      expect(
        ear.scopeNote.toLowerCase(),
        contains('eardrum'),
      );
    });

    test('high-value technique guides expose verified sources and media', () {
      for (final id in <String>[
        'mdi',
        'spacer',
        'symbicort-pmdi',
        'turbuhaler',
        'diskus',
        'ellipta',
        'respimat',
        'nasal-spray',
        'eye-drops',
        'ear-drops',
      ]) {
        final guide = visualGuideById(id);
        expect(guide, isNotNull, reason: id);
        expect(guide!.sourceLabel, isNotEmpty, reason: id);
        expect(guide.teachBackAr, isNotEmpty, reason: id);
      }

      expect(
        visualGuideById('symbicort-pmdi')!
            .mediaLinks
            .any((link) => link.isVideo),
        isTrue,
      );
      expect(
        visualGuideById('respimat')!
            .mediaLinks
            .any((link) => link.isVideo),
        isTrue,
      );
    });
  });
}
