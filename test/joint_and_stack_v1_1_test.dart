import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/supplements/joints/data/joint_toolkit_data.dart';
import 'package:drug_edu/features/supplements/stack/data/stack_safety_data.dart';
import 'package:drug_edu/features/supplements/stack/domain/stack_safety_models.dart';

void main() {
  test('joint toolkit covers requested core joint ingredients', () {
    expect(jointSupplementProfiles.length, 8);
    expect(
      jointSupplementProfiles.map((item) => item.id).toSet(),
      containsAll({
        'glucosamine',
        'chondroitin',
        'glucosamine-chondroitin',
        'ucii',
        'collagen-peptides',
        'oral-ha',
        'msm',
        'same',
      }),
    );
  });

  test('glucosamine keeps sulfate dose and conflicting guideline context', () {
    final use = jointSupplement('glucosamine').uses.single;
    expect(use.dose, contains('1,500 mg/day'));
    expect(use.frequency, contains('once daily'));
    expect(use.caveat, contains('ACR/AF'));
    expect(use.caveat, contains('AAOS'));
  });

  test('chondroitin preserves hand OA 800 mg once daily evidence', () {
    final item = jointSupplement('chondroitin');
    final hand = item.uses.first;
    expect(hand.dose, contains('800 mg'));
    expect(hand.frequency, 'Once daily.');
    expect(hand.duration, contains('6 months'));
  });

  test('native type II and collagen peptides cannot be dose-equated', () {
    final ucii = jointSupplement('ucii');
    final peptides = jointSupplement('collagen-peptides');

    expect(ucii.uses.first.dose, contains('40 mg'));
    expect(peptides.uses.first.dose, contains('10 g/day'));
    expect(ucii.coreRule, contains('not dose-equivalent'));
  });

  test('oral HA keeps study range and 200 mg example without dose ladder', () {
    final use = jointSupplement('oral-ha').uses.single;
    expect(use.dose, contains('30–300 mg/day'));
    expect(use.dose, contains('200 mg'));
    expect(use.exactUse, contains('not treat the 30–300 mg study range'));
  });

  test('MSM remains insufficient evidence despite 6 g pilot dose', () {
    final use = jointSupplement('msm').uses.single;
    expect(use.dose, contains('6 g/day'));
    expect(use.duration, '12 weeks.');
    expect(use.caveat, contains('very little research'));
  });

  test('SAMe keeps serotonin bipolar and levodopa locks', () {
    final item = jointSupplement('same');
    final safety = item.safety.join(' ');
    expect(safety, contains('Bipolar'));
    expect(safety, contains('serotonin'));
    expect(safety, contains('levodopa'));
  });

  test('calcium and iron are separated in stack planner', () {
    final advice = evaluateStack(
      selectedIds: {'calcium', 'iron'},
      flags: {},
    );
    expect(advice.any((item) => item.level == StackAdviceLevel.separate), isTrue);
    expect(advice.map((item) => item.message).join(' '), contains('reduce iron absorption'));
  });

  test('glucosamine and chondroitin can combine but efficacy is not promised', () {
    final advice = evaluateStack(
      selectedIds: {'glucosamine', 'chondroitin'},
      flags: {},
    );
    expect(advice.any((item) => item.level == StackAdviceLevel.okay), isTrue);
    expect(advice.map((item) => item.message).join(' '), contains('not consistently better'));
  });

  test('warfarin creates review for glucosamine chondroitin stack', () {
    final advice = evaluateStack(
      selectedIds: {'glucosamine', 'chondroitin'},
      flags: {StackPatientFlag.warfarin},
    );
    expect(advice.any((item) => item.level == StackAdviceLevel.review), isTrue);
    expect(advice.map((item) => item.message).join(' '), contains('INR'));
  });

  test('sensitive gut flags multi-GI-active stack', () {
    final advice = evaluateStack(
      selectedIds: {'iron', 'magnesium', 'vitamin-c'},
      flags: {StackPatientFlag.sensitiveGut},
    );
    expect(advice.map((item) => item.message).join(' '), contains('Do not start all at once'));
  });

  test('SAMe and St Johns wort are not a casual combination', () {
    final advice = evaluateStack(
      selectedIds: {'same', 'st-johns-wort'},
      flags: {},
    );
    expect(advice.any((item) => item.level == StackAdviceLevel.avoid), isTrue);
    expect(advice.map((item) => item.message).join(' '), contains('serotonergic'));
  });
}
