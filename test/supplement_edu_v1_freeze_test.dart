import 'dart:io';

import 'package:drug_edu/features/supplements/data/supplement_profiles.dart';
import 'package:drug_edu/features/supplements/herbals/data/herbal_toolkit_data.dart';
import 'package:drug_edu/features/supplements/minerals/data/mineral_toolkit_data.dart';
import 'package:drug_edu/features/supplements/products/data/product_analyzer_data.dart';
import 'package:drug_edu/features/supplements/products/domain/product_analyzer_models.dart';
import 'package:drug_edu/features/supplements/probiotics/data/probiotic_atlas_data.dart';
import 'package:drug_edu/features/supplements/specialty/data/specialty_toolkit_data.dart';
import 'package:drug_edu/features/supplements/vitamins/data/vitamin_toolkit_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Supplement Edu v1.0 clinical catalogs are frozen and unique', () {
    expect(supplementProfiles.length, 37);
    expect(mineralToolkitEntries.length, 4);
    expect(vitaminToolkitEntries.length, 13);
    expect(probioticProfiles.length, 7);
    expect(specialtyIngredients.length, 9);
    expect(herbalProfiles.length, 15);
    expect(realProductProfiles.length, 6);
    expect(analyzerIngredientRules.length, 17);

    expect(
      supplementProfiles.map((item) => item.id).toSet().length,
      supplementProfiles.length,
    );
    expect(
      mineralToolkitEntries.map((item) => item.id).toSet().length,
      mineralToolkitEntries.length,
    );
    expect(
      vitaminToolkitEntries.map((item) => item.id).toSet().length,
      vitaminToolkitEntries.length,
    );
    expect(
      probioticProfiles.map((item) => item.id).toSet().length,
      probioticProfiles.length,
    );
    expect(
      specialtyIngredients.map((item) => item.id).toSet().length,
      specialtyIngredients.length,
    );
    expect(
      herbalProfiles.map((item) => item.id).toSet().length,
      herbalProfiles.length,
    );
    expect(
      realProductProfiles.map((item) => item.id).toSet().length,
      realProductProfiles.length,
    );
    expect(
      analyzerIngredientRules.map((item) => item.id).toSet().length,
      analyzerIngredientRules.length,
    );
  });

  test('all deep clinical pathways retain source labels', () {
    for (final entry in mineralToolkitEntries) {
      for (final preset in entry.presets) {
        expect(preset.sourceLabel.trim(), isNotEmpty, reason: entry.name);
      }
      for (final protocol in entry.protocols) {
        expect(protocol.sourceLabel.trim(), isNotEmpty, reason: entry.name);
      }
    }

    for (final entry in vitaminToolkitEntries) {
      for (final pathway in entry.pathways) {
        expect(pathway.sourceLabel.trim(), isNotEmpty, reason: entry.name);
      }
    }

    for (final profile in probioticProfiles) {
      for (final use in profile.uses) {
        expect(use.sourceLabel.trim(), isNotEmpty, reason: profile.displayName);
      }
    }
    for (final item in probioticProductExamples) {
      expect(item.sourceLabel.trim(), isNotEmpty, reason: item.name);
    }
    for (final item in microbiomeAdjuncts) {
      expect(item.sourceLabel.trim(), isNotEmpty, reason: item.name);
    }

    for (final entry in specialtyIngredients) {
      for (final use in entry.uses) {
        expect(use.sourceLabel.trim(), isNotEmpty, reason: entry.name);
      }
    }
    for (final item in specialtyProductTechniques) {
      expect(item.sourceLabel.trim(), isNotEmpty, reason: item.name);
    }

    for (final entry in herbalProfiles) {
      for (final use in entry.uses) {
        expect(use.sourceLabel.trim(), isNotEmpty, reason: entry.name);
      }
    }

    for (final product in realProductProfiles) {
      expect(product.sourceLabel.trim(), isNotEmpty, reason: product.name);
      expect(product.sourceLabel, contains('verified 2026-10-01'));
    }
  });

  test('v1 high-risk supplement safety locks remain explicit', () {
    final magnesium = analyzerRule('magnesium');
    expect(magnesium.thresholds.single.value, 350);
    expect(
      magnesium.thresholds.single.scope,
      contains('Supplements/medications only'),
    );
    expect(
      magnesium.interactions[PatientMedicationFlag.renalImpairment],
      contains('toxicity'),
    );

    final b6 = analyzerRule('vitamin-b6');
    expect(b6.thresholds.map((item) => item.value).toSet(), {12, 100});

    final vitaminA = analyzerRule('vitamin-a-preformed');
    expect(
      vitaminA.interactions[
        PatientMedicationFlag.pregnantOrCouldBecomePregnant
      ],
      contains('birth defects'),
    );

    final calcium = analyzerRule('calcium');
    expect(
      calcium.interactions[PatientMedicationFlag.dolutegravir],
      contains('2 hours before or 6 hours after'),
    );

    final iron = analyzerRule('iron');
    expect(
      iron.interactions[PatientMedicationFlag.levodopa],
      contains('reduce levodopa absorption'),
    );

    final zinc = analyzerRule('zinc');
    expect(
      zinc.interactions[PatientMedicationFlag.penicillamine],
      contains('at least 1 hour'),
    );
  });

  test('v1 evidence-boundary locks prevent common supplement overclaims', () {
    final dao = specialtyIngredient('dao').uses.single;
    expect(dao.dose, contains('NO universal dose'));

    final sBoulardii = probioticProfile('s-boulardii');
    expect(
      sBoulardii.safety.join(' '),
      contains('central venous catheter'),
    );

    final hn019 = probioticProfile('hn019').uses.single;
    expect(hn019.caveat, contains('did not show superiority'));

    final sjw = herbalProfile('st-johns-wort');
    expect(sjw.safety.join(' '), contains('serotonin syndrome'));
    expect(sjw.safety.join(' '), contains('cyclosporine'));

    final kava = herbalProfile('kava').uses.single;
    expect(kava.dose, contains('NO routine dose'));

    final probioticProduct = realProductProfiles.singleWhere(
      (item) => item.id == 'now-probiotic10-25',
    );
    expect(
      probioticProduct.clinicalLocks.join(' '),
      contains('Do not divide 25 billion by 10'),
    );
  });

  test('v1 release metadata and artifact names are frozen', () {
    final pubspec = File('pubspec.yaml').readAsStringSync();
    final workflow =
        File('.github/workflows/flutter-ci.yml').readAsStringSync();

    expect(pubspec, contains('version: 1.0.0+1'));
    expect(workflow, contains('name: Supplement Edu CI'));
    expect(workflow, contains('supplement-edu-v1-debug-apk'));
    expect(workflow, contains('supplement-edu-v1-release-candidate'));
    expect(workflow, isNot(contains('supplement-edu-foundation-')));
  });

  test('Supplement Edu runtime has no release-blocking placeholders', () {
    final files = Directory('lib/features/supplements')
        .listSync(recursive: true)
        .whereType<File>()
        .where((file) => file.path.endsWith('.dart'));

    final forbidden = <RegExp>[
      RegExp(r'\bTODO\b', caseSensitive: false),
      RegExp(r'\bFIXME\b', caseSensitive: false),
      RegExp(r'\bTBD\b', caseSensitive: false),
      RegExp(r'locked until', caseSensitive: false),
      RegExp(r'exact product data are verified', caseSensitive: false),
      RegExp(r'unverified placeholder', caseSensitive: false),
    ];

    for (final file in files) {
      final text = file.readAsStringSync();
      for (final pattern in forbidden) {
        expect(
          pattern.hasMatch(text),
          isFalse,
          reason: file.path + ' contains forbidden placeholder ' + pattern.pattern,
        );
      }
    }
  });
}
