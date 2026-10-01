import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/supplements/reproductive/data/reproductive_toolkit_data.dart';
import 'package:drug_edu/features/supplements/reproductive/domain/reproductive_toolkit_models.dart';

void main() {
  test('reproductive toolkit covers sexual and fertility core set', () {
    expect(reproductiveProfiles.length, 17);
    expect(
      reproductiveProfiles.map((item) => item.id).toSet(),
      containsAll({
        'l-citrulline',
        'l-arginine',
        'korean-red-ginseng',
        'maca',
        'saffron-sexual',
        'tribulus',
        'yohimbe',
        'male-coq10',
        'male-carnitines',
        'male-nac',
        'male-selenium-nac',
        'male-omega3',
        'male-antioxidant-stack',
        'preconception-folate',
        'pcos-inositol',
        'female-coq10-por',
        'dhea-ivf',
      }),
    );
  });

  test('ED supplements remain limited rather than promoted as proven therapy', () {
    final citrulline = reproductiveProfile('l-citrulline').uses.single;
    expect(citrulline.dose, contains('1.5 g/day'));
    expect(citrulline.duration, contains('1 month'));
    expect(citrulline.evidence, ReproEvidence.limited);

    final arginine = reproductiveProfile('l-arginine').uses.single;
    expect(arginine.dose, contains('5 g/day'));
    expect(arginine.duration, '6 weeks.');
    expect(arginine.evidence, ReproEvidence.limited);
  });

  test('ginseng keeps exact classic study dose and low-certainty boundary', () {
    final use = reproductiveProfile('korean-red-ginseng').uses.single;
    expect(use.dose, contains('900 mg three times daily'));
    expect(use.duration, contains('8 weeks'));
    expect(use.caveat, contains('Cochrane'));
  });

  test('maca separates male ED from female antidepressant sexual dysfunction', () {
    final item = reproductiveProfile('maca');
    expect(item.uses.length, 3);
    expect(item.uses[0].dose, contains('2,400 mg/day'));
    expect(item.uses[1].dose, contains('3 g/day'));
    expect(item.uses[2].dose, contains('3.5 g/day'));
  });

  test('saffron keeps female positive study separate from negative male ED study', () {
    final item = reproductiveProfile('saffron-sexual');
    expect(item.uses.length, 2);
    expect(item.uses[0].dose, contains('30 mg/day'));
    expect(item.uses[0].evidence, ReproEvidence.limited);
    expect(item.uses[1].dose, contains('30 mg twice daily'));
    expect(item.uses[1].evidence, ReproEvidence.againstRoutineUse);
  });

  test('yohimbe gets no routine dose and serious safety lock', () {
    final item = reproductiveProfile('yohimbe');
    expect(item.uses.single.dose, contains('NO routine dose'));
    expect(item.safety.join(' '), contains('arrhythmia'));
    expect(item.safety.join(' '), contains('seizures'));
  });

  test('male CoQ10 and carnitines retain exact study regimens', () {
    final coq10 = reproductiveProfile('male-coq10').uses.single;
    expect(coq10.dose, '200 mg/day.');
    expect(coq10.duration, '6 months.');

    final carnitines = reproductiveProfile('male-carnitines').uses.single;
    expect(carnitines.dose, contains('L-carnitine 2 g/day'));
    expect(carnitines.dose, contains('acetyl-L-carnitine 1 g/day'));
    expect(carnitines.duration, contains('3–6 months'));
  });

  test('NAC selenium pathway preserves dose and selenium UL warning', () {
    final item = reproductiveProfile('male-selenium-nac');
    final use = item.uses.single;
    expect(use.dose, contains('Selenium 200 mcg/day'));
    expect(use.dose, contains('NAC 600 mg/day'));
    expect(use.duration, '26 weeks.');
    expect(item.safety.join(' '), contains('400 mcg/day'));
  });

  test('MOXI negative trial prevents automatic antioxidant fertility stack', () {
    final item = reproductiveProfile('male-antioxidant-stack');
    final use = item.uses.single;
    expect(use.evidence, ReproEvidence.againstRoutineUse);
    expect(use.dose, contains('vitamin C 500 mg'));
    expect(use.dose, contains('selenium 200 mcg'));
    expect(use.caveat, contains('did not improve'));
    expect(use.caveat, contains('live birth'));
  });

  test('preconception folic acid is preventive not a fertility booster', () {
    final use = reproductiveProfile('preconception-folate').uses.single;
    expect(use.dose, contains('400 mcg/day'));
    expect(use.evidence, ReproEvidence.guidelineRecommended);
    expect(use.caveat, contains('does not treat infertility'));
  });

  test('PCOS inositol keeps experimental status with no invented dose', () {
    final use = reproductiveProfile('pcos-inositol').uses.single;
    expect(use.dose, contains('NO guideline-endorsed'));
    expect(use.evidence, ReproEvidence.researchOnly);
    expect(use.caveat, contains('experimental'));
  });

  test('female CoQ10 poor ovarian reserve regimen remains research context', () {
    final use = reproductiveProfile('female-coq10-por').uses.single;
    expect(use.dose, contains('600 mg/day'));
    expect(use.duration, contains('60 days'));
    expect(use.caveat, contains('live-birth differences were not statistically significant'));
  });

  test('DHEA retains historical dose but ESHRE against-routine lock', () {
    final use = reproductiveProfile('dhea-ivf').uses.single;
    expect(use.dose, contains('75 mg/day'));
    expect(use.duration, contains('6–12 weeks'));
    expect(use.evidence, ReproEvidence.againstRoutineUse);
    expect(use.caveat, contains('ESHRE 2025'));
  });

  test('male infertility assessment starts with semen analysis not supplement labs', () {
    final rule = reproductiveAssessmentRules.first;
    final text = rule.actions.join(' ');
    expect(text, contains('semen analyses'));
    expect(text, contains('10 million/mL'));
    expect(text, contains('FSH + testosterone'));
  });

  test('female referral timing remains 12 months, 6 months, then earlier over 40', () {
    final rule = reproductiveAssessmentRules[1];
    final text = rule.actions.join(' ');
    expect(text, contains('12 months'));
    expect(text, contains('6 months'));
    expect(text, contains('over age 40'));
  });

  test('global locks prevent testosterone monotherapy and outcome overclaiming', () {
    final text = reproductiveGlobalLocks.join(' ');
    expect(text, contains('Testosterone monotherapy should NOT'));
    expect(text, contains('live birth'));
  });
}
