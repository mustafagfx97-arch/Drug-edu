import 'dart:io';

import 'package:drug_edu/features/supplements/joints/data/joint_toolkit_data.dart';
import 'package:drug_edu/features/supplements/needs_matrix/data/need_matrix_data.dart';
import 'package:drug_edu/features/supplements/nerve_hair/data/nerve_hair_data.dart';
import 'package:drug_edu/features/supplements/reproductive/data/reproductive_toolkit_data.dart';
import 'package:drug_edu/features/supplements/reproductive/domain/reproductive_toolkit_models.dart';
import 'package:drug_edu/features/supplements/stack/data/stack_safety_data.dart';
import 'package:drug_edu/features/supplements/stack/domain/stack_safety_models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Supplement Edu v1.1 catalogs are frozen and unique', () {
    expect(jointSupplementProfiles.length, 8);
    expect(reproductiveProfiles.length, 17);
    expect(needPathways.length, 16);
    expect(usualSupplementDoseRules.length, 15);
    expect(electiveDailyDoseRules.length, 17);
    expect(nerveHairProfiles.length, 7);
    expect(stackItems.length, 18);

    expect(jointSupplementProfiles.map((item) => item.id).toSet().length,
        jointSupplementProfiles.length);
    expect(reproductiveProfiles.map((item) => item.id).toSet().length,
        reproductiveProfiles.length);
    expect(needPathways.map((item) => item.id).toSet().length,
        needPathways.length);
    expect(nerveHairProfiles.map((item) => item.id).toSet().length,
        nerveHairProfiles.length);
  });

  test('all v1.1 clinical pathways retain source labels', () {
    for (final profile in jointSupplementProfiles) {
      for (final use in profile.uses) {
        expect(use.sourceLabel.trim(), isNotEmpty, reason: profile.name);
      }
    }
    for (final profile in reproductiveProfiles) {
      for (final use in profile.uses) {
        expect(use.sourceLabel.trim(), isNotEmpty, reason: profile.name);
      }
    }
    for (final pathway in needPathways) {
      expect(pathway.sourceLabel.trim(), isNotEmpty, reason: pathway.title);
    }
    for (final item in usualSupplementDoseRules) {
      expect(item.sourceLabel.trim(), isNotEmpty, reason: item.name);
    }
    for (final item in electiveDailyDoseRules) {
      expect(item.sourceLabel.trim(), isNotEmpty, reason: item.nutrient);
    }
    for (final profile in nerveHairProfiles) {
      for (final use in profile.uses) {
        expect(use.sourceLabel.trim(), isNotEmpty, reason: profile.name);
      }
    }
  });

  test('v1.1 dose taxonomy cannot collapse requirement prevention treatment and study dose', () {
    final rules = needMatrixGlobalRules.join(' ');
    expect(rules, contains('Daily requirement (RDA/AI)'));
    expect(rules, contains('routine supplement dose'));
    expect(rules, contains('preventive dose'));
    expect(rules, contains('therapeutic/deficiency dose'));
    expect(rules, contains('study/condition-specific dose'));
    expect(rules, contains('%DV'));
    expect(rules, contains('No established routine supplemental dose'));
  });

  test('age 75 vitamin D does not invent one guideline preventive dose', () {
    final item = needPathway('age75plus-vitd');
    expect(item.supplementPlan,
        contains('does not specify one exact preventive supplement dose'));
    expect(item.dailyTarget, contains('RDA = 800 IU/day'));
    expect(item.dailyTarget, contains('400–3,333 IU/day'));
    expect(item.dailyTarget, contains('weighted average around 900 IU/day'));
    expect(item.labPlan,
        contains('Routine 25-OH vitamin D testing is NOT required'));
  });

  test('male fertility antioxidants remain outcome-bounded', () {
    final stack = reproductiveProfile('male-antioxidant-stack').uses.single;
    expect(stack.evidence, ReproEvidence.againstRoutineUse);
    expect(stack.caveat, contains('live birth'));

    final locks = reproductiveGlobalLocks.join(' ');
    expect(locks, contains('amended 2024'));
    expect(locks, contains('questionable clinical utility'));
    expect(locks, contains('live birth'));
  });

  test('DHEA remains historical dose context and not routine IVF supplementation', () {
    final use = reproductiveProfile('dhea-ivf').uses.single;
    expect(use.dose, contains('75 mg/day'));
    expect(use.evidence, ReproEvidence.againstRoutineUse);
    expect(use.caveat, contains('ESHRE 2025'));
    expect(use.caveat, contains('strongly recommends against'));
  });

  test('standard preconception folic acid remains exact prevention not fertility treatment', () {
    final use = reproductiveProfile('preconception-folate').uses.single;
    expect(use.dose, contains('400 mcg/day folic acid'));
    expect(use.sourceLabel, contains('CDC Folic Acid 2026'));
    expect(use.caveat, contains('does not treat infertility'));
  });

  test('biotin and B6 retain high-value safety locks', () {
    final biotin = nerveHairProfile('biotin');
    final biotinSafety = biotin.safety.join(' ');
    expect(biotinSafety, contains('troponin'));
    expect(biotinSafety, contains('assay-'));
    expect(biotinSafety, contains('24/48-hour'));

    final b6 =
        usualSupplementDoseRules.singleWhere((item) => item.name == 'Vitamin B6');
    expect(b6.highDoseBoundary, contains('12 mg/day'));
    expect(nerveHairProfile('vitamin-b6').safety.join(' '), contains('numbness'));
  });

  test('joint stack anticoagulation lock remains active', () {
    final advice = evaluateStack(
      selectedIds: {'glucosamine', 'chondroitin'},
      flags: {StackPatientFlag.warfarin},
    );
    expect(advice.any((item) => item.level == StackAdviceLevel.review), isTrue);
    expect(advice.map((item) => item.message).join(' '), contains('INR'));
  });

  test('v1.1 release identity and artifact names are locked', () {
    final pubspec = File('pubspec.yaml').readAsStringSync();
    final workflow = File('.github/workflows/flutter-ci.yml').readAsStringSync();

    expect(pubspec, contains('version: 1.1.0+2'));
    expect(workflow, contains('supplement-edu-v1.1-debug-apk'));
    expect(workflow, contains('supplement-edu-v1.1-release-candidate'));
    expect(workflow, contains('com.mustafagfx97.supplement_edu'));
    expect(workflow, contains('android:label="Supplement Edu"'));
  });
}
