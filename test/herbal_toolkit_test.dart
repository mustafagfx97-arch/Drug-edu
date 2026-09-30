import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/supplements/herbals/data/herbal_toolkit_data.dart';

void main() {
  test('herbal toolkit covers the planned menopause and neuro core set', () {
    expect(herbalProfiles.length, 15);
    expect(herbalProfiles.map((e) => e.id).toSet().length, 15);
  });

  test('menopause global lock preserves 2023 nonhormone guidance', () {
    expect(
      menopauseGlobalLocks.first,
      contains('does NOT recommend supplements/herbal remedies'),
    );
  });

  test('soy trial dose is not converted into a routine guideline recommendation', () {
    final soy = herbalProfile('soy-isoflavones');
    final use = soy.uses.single;

    expect(use.dose, contains('80 mg/day'));
    expect(use.caveat, contains('does not recommend'));
  });

  test('red clover keeps conflicting 80 mg evidence context', () {
    final red = herbalProfile('red-clover');
    final use = red.uses.single;

    expect(use.dose, contains('80 mg/day'));
    expect(use.evidence.name, 'conflicting');
  });

  test('ashwagandha preserves 300 mg twice daily study regimen and safety locks', () {
    final item = herbalProfile('ashwagandha');
    final use = item.uses.single;

    expect(use.dose, contains('300 mg twice daily'));
    expect(use.duration, contains('8 weeks'));
    expect(item.safety.join(' '), contains('thyroid'));
    expect(item.safety.join(' '), contains('pregnancy'));
    expect(item.safety.join(' '), contains('liver injury'));
  });

  test('valerian remains against routine chronic insomnia use', () {
    final item = herbalProfile('valerian');
    final use = item.uses.single;

    expect(use.dose, contains('300–600 mg/day'));
    expect(use.duration, contains('6 weeks'));
    expect(use.caveat, contains('recommended against'));
  });

  test('Silexan evidence is locked to the exact oral lavender preparation', () {
    final item = herbalProfile('lavender-silexan');
    final use = item.uses.single;

    expect(use.dose, contains('80 mg once daily'));
    expect(use.duration, '10 weeks in major placebo-controlled trials.');
    expect(use.caveat, contains('Do not generalize'));
  });

  test('L-theanine trial dose remains 200 mg daily for four weeks', () {
    final item = herbalProfile('l-theanine');
    final use = item.uses.single;

    expect(use.dose, contains('200 mg/day'));
    expect(use.duration, contains('4 weeks'));
  });

  test('rhodiola study is tied to SHR-5 rather than generic root powder', () {
    final item = herbalProfile('rhodiola');
    final use = item.uses.single;

    expect(use.formOrExtract, contains('SHR-5'));
    expect(use.dose, contains('576 mg/day'));
    expect(use.duration, '28 days.');
  });

  test('bacopa is chronic not acute and keeps 300 mg daily trial dose', () {
    final item = herbalProfile('bacopa');
    final use = item.uses.single;

    expect(use.dose, contains('300 mg/day'));
    expect(use.duration, contains('12 weeks'));
    expect(item.keyRule, contains('not an acute nootropic'));
  });

  test('ginkgo separates dementia symptom trials from prevention', () {
    final item = herbalProfile('ginkgo');
    final use = item.uses.single;

    expect(use.dose, '240 mg/day.');
    expect(use.frequency, contains('Once daily'));
    expect(use.caveat, contains('no dementia-prevention benefit'));
  });

  test('lion mane keeps small MCI trial and dry-powder equivalence lock', () {
    final item = herbalProfile('lions-mane');
    final use = item.uses.single;

    expect(use.dose, contains('3 g/day'));
    expect(use.frequency, contains('1 g three times daily'));
    expect(use.caveat, contains('30 participants'));
  });

  test('St Johns wort carries interaction and serotonin locks', () {
    final item = herbalProfile('st-johns-wort');
    final safety = item.safety.join(' ');

    expect(safety, contains('serotonin syndrome'));
    expect(safety, contains('birth-control pills'));
    expect(safety, contains('cyclosporine'));
    expect(safety, contains('warfarin'));
  });

  test('kava does not receive a casual dose because of liver risk', () {
    final item = herbalProfile('kava');
    final use = item.uses.single;

    expect(use.dose, contains('NO routine dose'));
    expect(use.caveat, contains('serious or fatal'));
  });
}
