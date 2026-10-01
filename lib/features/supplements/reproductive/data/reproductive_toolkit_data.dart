import '../domain/reproductive_toolkit_models.dart';

const reproductiveProfiles = <ReproProfile>[
  ReproProfile(
    id: 'l-citrulline',
    name: 'L-citrulline',
    domain: 'Male sexual health',
    coreRule:
        'L-citrulline is a nitric-oxide pathway supplement with small human ED studies. It is NOT an evidence-equivalent substitute for PDE5 inhibitors or a diagnosis of erectile dysfunction.',
    uses: [
      ReproUse(
        indication: 'Mild erectile dysfunction — small-study context',
        population: 'Men with mild ED after cardiovascular/metabolic and medication causes are considered',
        form: 'Oral L-citrulline',
        dose: '1.5 g/day in a small single-blind study.',
        frequency: 'Once daily total dose in the cited study.',
        duration: '1 month of active treatment.',
        exactUse:
            'Use only as a time-limited trial after ED has been clinically assessed. Stop if there is no meaningful improvement rather than escalating indefinitely.',
        evidence: ReproEvidence.limited,
        caveat:
            'The study enrolled only 24 men and was not a large definitive trial. NCCIH states no complementary approach has been proven safe and effective for ED.',
        sourceLabel: 'PubMed L-citrulline mild-ED study + NCCIH ED/Sexual Enhancement',
      ),
    ],
    safety: [
      'Review blood-pressure medicines, nitrates and PDE5-inhibitor use because nitric-oxide pathway stacking can matter clinically.',
      'New or persistent ED warrants medical assessment because ED can be a marker of vascular, neurologic or metabolic disease.',
    ],
  ),
  ReproProfile(
    id: 'l-arginine',
    name: 'L-arginine',
    domain: 'Male sexual health',
    coreRule:
        'High-dose L-arginine has limited ED evidence. A gram dose used in a trial should not be sold as a universal “natural Viagra” dose.',
    uses: [
      ReproUse(
        indication: 'Organic erectile dysfunction — study context',
        population: 'Men with organic ED under clinical review',
        form: 'Oral L-arginine',
        dose: '5 g/day in a double-blind randomized placebo-controlled study.',
        frequency: 'Daily total dose.',
        duration: '6 weeks.',
        exactUse:
            'Use only after medication and blood-pressure review. Define the target as erectile function, not testosterone or fertility.',
        evidence: ReproEvidence.limited,
        caveat:
            'Evidence is old and limited; conventional ED evaluation/treatment has stronger evidence.',
        sourceLabel: 'PubMed high-dose L-arginine ED trial + NCCIH ED/Sexual Enhancement',
      ),
    ],
    safety: [
      'Can cause GI intolerance and may lower blood pressure.',
      'Do not combine casually with multiple nitric-oxide or sexual-enhancement products.',
    ],
  ),
  ReproProfile(
    id: 'korean-red-ginseng',
    name: 'Korean red ginseng / Panax ginseng',
    domain: 'Male sexual health',
    coreRule:
        'Ginseng has small ED trials, but systematic review certainty is low and product standardization matters.',
    uses: [
      ReproUse(
        indication: 'Erectile dysfunction — small RCT context',
        population: 'Men with ED who have had a clinical cause/medication review',
        form: 'Korean red ginseng in the classic crossover RCT',
        dose: '900 mg three times daily (2.7 g/day total).',
        frequency: 'Three times daily.',
        duration: '8 weeks per treatment phase in the cited trial.',
        exactUse:
            'Do not generalize one Korean red ginseng preparation to all ginseng extracts. Reassess rather than continuing without a clear benefit.',
        evidence: ReproEvidence.limited,
        caveat:
            'Cochrane review found low-certainty evidence and at most small effects; NCCIH does not consider herbal ED products definitively proven.',
        sourceLabel: 'Korean red ginseng RCT + Cochrane 2021 + NCCIH Asian Ginseng',
      ),
    ],
    safety: [
      'Insomnia is a common adverse effect.',
      'Review diabetes medicines, blood-pressure medicines, warfarin and other interacting drugs.',
      'Avoid routine use during pregnancy/breastfeeding because safety is uncertain.',
    ],
  ),
  ReproProfile(
    id: 'maca',
    name: 'Maca (Lepidium meyenii)',
    domain: 'Male + female sexual health',
    coreRule:
        'Maca evidence is limited and population-specific. It should not be marketed as a testosterone booster when trials did not establish that claim.',
    uses: [
      ReproUse(
        indication: 'Mild erectile dysfunction — small RCT context',
        population: 'Men with mild ED',
        form: 'Maca dry extract',
        dose: '2,400 mg/day.',
        frequency: 'Daily total dose.',
        duration: '12 weeks.',
        exactUse:
            'Use as a time-limited symptom trial only after ED assessment.',
        evidence: ReproEvidence.limited,
        caveat:
            'The improvement over placebo was small in a 50-man trial; evidence is insufficient for routine ED treatment.',
        sourceLabel: 'PubMed maca mild-ED randomized trial',
      ),
      ReproUse(
        indication: 'SSRI/SNRI-associated sexual dysfunction in women — pilot context',
        population: 'Women with antidepressant-associated sexual dysfunction whose depression is otherwise stable',
        form: 'Maca root',
        dose: '3 g/day in a 12-week randomized placebo-controlled trial.',
        frequency: 'Daily total dose.',
        duration: '12 weeks.',
        exactUse:
            'Do NOT stop or alter the antidepressant independently. Coordinate with the prescriber and use a defined sexual-function target.',
        evidence: ReproEvidence.limited,
        caveat:
            'Small trial; signals were stronger in postmenopausal women and are not enough for a universal recommendation.',
        sourceLabel: 'PubMed maca antidepressant-associated sexual dysfunction trial',
      ),
      ReproUse(
        indication: 'Postmenopausal sexual dysfunction — preliminary context',
        population: 'Postmenopausal women',
        form: 'Maca powder',
        dose: '3.5 g/day.',
        frequency: 'Daily total dose.',
        duration: '6 weeks in a small crossover trial.',
        exactUse:
            'Treat as preliminary symptom support, not hormone replacement.',
        evidence: ReproEvidence.limited,
        caveat:
            'Only 14 women completed the classic crossover trial; hormone levels were not meaningfully changed.',
        sourceLabel: 'PubMed postmenopausal maca crossover trial',
      ),
    ],
    safety: [
      'Product quality and botanical preparation vary.',
      'Do not use sexual-function improvement as evidence that testosterone or estrogen has increased.',
    ],
  ),
  ReproProfile(
    id: 'saffron-sexual',
    name: 'Saffron (Crocus sativus)',
    domain: 'Sexual function',
    coreRule:
        'Saffron findings differ by indication. A small positive female SSRI study does not mean saffron treats male ED.',
    uses: [
      ReproUse(
        indication: 'Fluoxetine-associated sexual dysfunction in women',
        population: 'Women stable on fluoxetine who developed sexual dysfunction',
        form: 'Oral saffron',
        dose: '30 mg/day.',
        frequency: 'Daily total dose.',
        duration: '4 weeks.',
        exactUse:
            'Coordinate with the prescriber. The study signal was in arousal, lubrication and pain, not clearly desire, orgasm or satisfaction.',
        evidence: ReproEvidence.limited,
        caveat:
            'Only 38 women entered the trial; results cannot be generalized to all antidepressants or all female sexual dysfunction.',
        sourceLabel: 'PubMed saffron fluoxetine-associated sexual dysfunction RCT',
      ),
      ReproUse(
        indication: 'Male erectile dysfunction',
        population: 'Men with ED',
        form: 'Oral saffron',
        dose: '30 mg twice daily in a large crossover comparison.',
        frequency: 'Twice daily.',
        duration: '12 weeks.',
        exactUse:
            'Do not recommend saffron for ED based on this study.',
        evidence: ReproEvidence.againstRoutineUse,
        caveat:
            'The 346-man study did not support a beneficial ED effect of saffron compared with sildenafil.',
        sourceLabel: 'PubMed saffron vs sildenafil ED crossover trial',
      ),
    ],
    safety: [
      'Do not stack several “libido” herbs without reviewing the total product and medicines.',
      'Pregnancy use requires clinician review; high supplemental doses should not be self-prescribed.',
    ],
  ),
  ReproProfile(
    id: 'tribulus',
    name: 'Tribulus terrestris',
    domain: 'Female sexual health / marketed male products',
    coreRule:
        'Tribulus is heavily marketed for testosterone and male performance, but evidence is inconsistent. Small female sexual-function trials do not establish a universal aphrodisiac effect.',
    uses: [
      ReproUse(
        indication: 'Hypoactive sexual desire / sexual dysfunction in postmenopausal women',
        population: 'Postmenopausal women with diminished libido after clinical evaluation',
        form: 'Standardized Tribulus extract used in the cited trial',
        dose: '750 mg/day.',
        frequency: 'Daily total dose.',
        duration: '120 days.',
        exactUse:
            'Use only as a limited-evidence trial after addressing GSM, pain, medicines and relationship/psychological factors when relevant.',
        evidence: ReproEvidence.limited,
        caveat:
            'The placebo-controlled study was small (45 randomized; 36 completed).',
        sourceLabel: 'PubMed postmenopausal Tribulus HSDD RCT',
      ),
      ReproUse(
        indication: 'Male ED / testosterone boosting',
        population: 'Men',
        form: 'Tribulus extracts vary widely',
        dose: 'NO universal evidence-based dose encoded.',
        frequency: 'Product/study specific.',
        duration: 'Do not auto-generate.',
        exactUse:
            'Do not sell as a proven testosterone booster or ED treatment.',
        evidence: ReproEvidence.conflicting,
        caveat:
            'Male ED studies are conflicting, and NCCIH does not consider herbal ED products definitively safe/effective.',
        sourceLabel: 'NCCIH sexual-enhancement review',
      ),
    ],
    safety: [
      'Extract strength varies substantially among products.',
      'Avoid substituting Tribulus for evaluation of low libido, menopause-related pain/GSM or erectile dysfunction.',
    ],
  ),
  ReproProfile(
    id: 'yohimbe',
    name: 'Yohimbe / yohimbine-containing supplements',
    domain: 'Sexual enhancement — high risk',
    coreRule:
        'Yohimbe is a high-risk supplement category with unreliable yohimbine content and no established dietary-supplement dose for ED.',
    uses: [
      ReproUse(
        indication: 'Erectile dysfunction / sexual enhancement',
        population: 'Adults',
        form: 'Yohimbe dietary supplements',
        dose: 'NO routine dose encoded.',
        frequency: 'Do not auto-generate.',
        duration: 'Do not auto-generate.',
        exactUse:
            'Avoid routine self-treatment with yohimbe supplements.',
        evidence: ReproEvidence.againstRoutineUse,
        caveat:
            'NCCIH states evidence is insufficient and dietary-supplement yohimbe can have inaccurate labeling and serious toxicity.',
        sourceLabel: 'NCCIH Yohimbe + NCCIH ED/Sexual Enhancement',
      ),
    ],
    safety: [
      'Associated with arrhythmia, blood-pressure problems, myocardial infarction and seizures.',
      'Avoid with MAO inhibitors and tricyclic antidepressants; review all medicines before use.',
      'Avoid during pregnancy/breastfeeding.',
    ],
  ),
  ReproProfile(
    id: 'male-coq10',
    name: 'CoQ10 — male infertility',
    domain: 'Male fertility',
    coreRule:
        'CoQ10 may improve some semen parameters in selected idiopathic male-factor populations, but guidelines do not endorse a specific antioxidant as proven to improve live birth.',
    uses: [
      ReproUse(
        indication: 'Idiopathic asthenozoospermia — study context',
        population: 'Men with abnormal semen motility after male infertility evaluation',
        form: 'Oral CoQ10 (ubiquinone in the cited RCT)',
        dose: '200 mg/day.',
        frequency: 'Once daily total dose.',
        duration: '6 months.',
        exactUse:
            'Only consider after semen analysis and evaluation for correctable causes. Reassess semen outcomes rather than assuming improved pregnancy/live birth.',
        evidence: ReproEvidence.limited,
        caveat:
            'The RCT improved sperm kinetic features, but AUA/ASRM says antioxidant/vitamin supplements have questionable clinical utility and cannot recommend a specific agent.',
        sourceLabel: 'CoQ10 asthenozoospermia RCT + AUA/ASRM Male Infertility Guideline (2020; amended 2024)',
      ),
    ],
    safety: [
      'Do not use CoQ10 to delay evaluation of varicocele, obstruction, endocrine causes or severe semen abnormalities.',
      'Check the general CoQ10 module for formulation and medicine interactions.',
    ],
  ),
  ReproProfile(
    id: 'male-carnitines',
    name: 'L-carnitine + acetyl-L-carnitine',
    domain: 'Male fertility',
    coreRule:
        'Carnitines have motility data in selected asthenozoospermia populations, but this is not proof of higher live-birth rates for every infertile couple.',
    uses: [
      ReproUse(
        indication: 'Idiopathic asthenozoospermia / oligoasthenozoospermia — study context',
        population: 'Men with documented semen abnormalities after evaluation',
        form: 'L-carnitine + acetyl-L-carnitine',
        dose: 'L-carnitine 2 g/day + acetyl-L-carnitine 1 g/day.',
        frequency: 'Total daily dose; studies used divided regimens.',
        duration: '3–6 months in controlled studies.',
        exactUse:
            'Because spermatogenesis takes time, reassess after a planned multi-month trial rather than after a few days. Do not use without a baseline semen analysis.',
        evidence: ReproEvidence.limited,
        caveat:
            'Some RCTs improved motility, especially in men with poorer baseline motility, but AUA/ASRM still does not recommend a specific supplement regimen.',
        sourceLabel: 'L-carnitine/acetyl-L-carnitine RCTs + AUA/ASRM Male Infertility Guideline (2020; amended 2024)',
      ),
    ],
    safety: [
      'GI adverse effects and fishy body odor can occur.',
      'Do not add multiple carnitine-containing fertility blends without counting the total dose.',
    ],
  ),
  ReproProfile(
    id: 'male-nac',
    name: 'N-acetylcysteine (NAC) — male infertility',
    domain: 'Male fertility',
    coreRule:
        'NAC has semen-parameter studies, but a semen improvement is not the same as proven live-birth benefit.',
    uses: [
      ReproUse(
        indication: 'Idiopathic male infertility — study context',
        population: 'Men with documented idiopathic infertility after standard evaluation',
        form: 'Oral NAC',
        dose: '600 mg/day in a placebo-controlled study.',
        frequency: 'Once daily total dose.',
        duration: '3 months in one RCT; 26 weeks in another selenium/NAC study.',
        exactUse:
            'Use only as a planned trial after semen analysis; do not substitute it for infertility evaluation.',
        evidence: ReproEvidence.limited,
        caveat:
            'Individual studies improved semen parameters, while guideline-level evidence remains insufficient to recommend NAC routinely.',
        sourceLabel: 'NAC male-infertility RCTs + AUA/ASRM Male Infertility Guideline (2020; amended 2024)',
      ),
    ],
    safety: [
      'GI upset can occur.',
      'Check all combination products because NAC is often hidden inside multi-antioxidant fertility formulas.',
    ],
  ),
  ReproProfile(
    id: 'male-selenium-nac',
    name: 'Selenium + NAC — male infertility',
    domain: 'Male fertility',
    coreRule:
        'A positive combination trial should not become a blanket selenium prescription; selenium excess is harmful and total intake matters.',
    uses: [
      ReproUse(
        indication: 'Idiopathic oligo-asthenoteratospermia — study context',
        population: 'Men with documented idiopathic OAT',
        form: 'Selenium + oral NAC',
        dose: 'Selenium 200 mcg/day + NAC 600 mg/day.',
        frequency: 'Once daily total doses.',
        duration: '26 weeks.',
        exactUse:
            'Count selenium from multivitamins, fertility blends and diet/supplements before adding this regimen.',
        evidence: ReproEvidence.limited,
        caveat:
            'The trial improved semen parameters, but AUA/ASRM does not recommend a specific antioxidant regimen and MOXI raises concern about assuming antioxidant stacks improve live birth.',
        sourceLabel: 'Selenium/NAC RCT + AUA/ASRM Male Infertility Guideline (2020; amended 2024) + MOXI',
      ),
    ],
    safety: [
      'U.S. adult selenium UL is 400 mcg/day; chronic excess can cause selenosis.',
      'Do not combine several selenium-containing fertility products.',
    ],
  ),
  ReproProfile(
    id: 'male-omega3',
    name: 'Omega-3 EPA+DHA — male infertility',
    domain: 'Male fertility',
    coreRule:
        'Omega-3 has semen-parameter studies, but it is not a guideline-established fertility treatment.',
    uses: [
      ReproUse(
        indication: 'Idiopathic oligoasthenoteratospermia — study context',
        population: 'Men with documented idiopathic OAT',
        form: 'EPA + DHA',
        dose: '1.84 g/day EPA+DHA in a double-blind RCT.',
        frequency: 'Daily total dose.',
        duration: '32 weeks.',
        exactUse:
            'Use only as a limited-evidence adjunct after full evaluation; track the actual EPA+DHA amount rather than fish-oil capsule weight.',
        evidence: ReproEvidence.limited,
        caveat:
            'The trial improved some semen parameters; pregnancy/live-birth benefit remains uncertain.',
        sourceLabel: 'Omega-3 idiopathic-OAT randomized trial',
      ),
    ],
    safety: [
      'Review bleeding risk and antithrombotic medicines at higher supplemental doses.',
      'Count EPA+DHA, not just “fish oil 1,000 mg.”',
    ],
  ),
  ReproProfile(
    id: 'male-antioxidant-stack',
    name: 'Multi-antioxidant male fertility stacks',
    domain: 'Male fertility',
    coreRule:
        'More antioxidants are NOT automatically better. A large fertility blend can increase pill burden and duplication without improving live birth.',
    uses: [
      ReproUse(
        indication: 'Male-factor infertility — MOXI trial context',
        population: 'Men with male-factor infertility',
        form: 'Daily multi-antioxidant combination',
        dose:
            'MOXI used vitamin C 500 mg + vitamin E 400 mg + selenium 200 mcg + L-carnitine 1,000 mg + zinc 20 mg + folic acid 1,000 mcg + lycopene 10 mg daily.',
        frequency: 'Once daily regimen.',
        duration: '3–6 months.',
        exactUse:
            'Do not reproduce this as a recommended fertility stack; it is shown to teach that plausible combinations can fail clinically.',
        evidence: ReproEvidence.againstRoutineUse,
        caveat:
            'MOXI did not improve sperm morphology, motility, DNA fragmentation or cumulative live birth versus placebo.',
        sourceLabel: 'NIH-funded MOXI randomized clinical trial + AUA/ASRM Male Infertility Guideline (2020; amended 2024)',
      ),
    ],
    safety: [
      'Combination products can duplicate selenium, zinc, folic acid, vitamins C/E and carnitine from other supplements.',
      'High-dose antioxidant stacking can obscure which ingredient causes adverse effects.',
    ],
  ),
  ReproProfile(
    id: 'preconception-folate',
    name: 'Folic acid — preconception',
    domain: 'Female preconception',
    coreRule:
        'Folic acid is recommended before pregnancy to reduce neural-tube-defect risk. It is NOT a fertility enhancer and should not be marketed as increasing conception rates.',
    uses: [
      ReproUse(
        indication: 'Preconception neural-tube-defect prevention',
        population: 'Women attempting or planning pregnancy without a separate high-risk folate plan',
        form: 'Folic acid-containing supplement/prenatal',
        dose: '400 mcg/day folic acid for standard preconception neural-tube-defect prevention.',
        frequency: 'Once daily total preventive dose.',
        duration: 'Start before conception and continue into pregnancy according to the prenatal plan.',
        exactUse:
            'Choose a prenatal/supplement that actually provides 400 mcg folic acid for the standard pathway. Higher-risk situations, such as a prior neural-tube-defect-affected pregnancy, require a separate clinician-directed regimen.',
        evidence: ReproEvidence.guidelineRecommended,
        caveat:
            'This prevents neural tube defects; it does not treat infertility.',
        sourceLabel: 'CDC Folic Acid 2026 + ASRM Optimizing Natural Fertility',
      ),
    ],
    safety: [
      'Do not add multiple prenatal/B-complex products without counting total synthetic folic acid.',
      'High-risk folate dosing is a separate clinical pathway.',
    ],
  ),
  ReproProfile(
    id: 'pcos-inositol',
    name: 'Inositol — PCOS / infertility',
    domain: 'Female fertility',
    coreRule:
        'Inositol may be discussed in PCOS, but the 2023 international guideline says specific types/doses/combinations cannot be recommended and infertility use is experimental.',
    uses: [
      ReproUse(
        indication: 'PCOS with infertility',
        population: 'Women with PCOS who are trying to conceive',
        form: 'Myo-inositol / D-chiro-inositol products vary',
        dose: 'NO guideline-endorsed type, dose or ratio can currently be recommended.',
        frequency: 'Do not auto-generate.',
        duration: 'Do not auto-generate.',
        exactUse:
            'If a patient elects to use inositol, document the exact product and dose and ensure it does not delay evidence-based ovulation-induction/fertility care.',
        evidence: ReproEvidence.researchOnly,
        caveat:
            '2023 international PCOS guideline: inositol for infertility is experimental, with uncertain effects on ovulation, clinical pregnancy and live birth.',
        sourceLabel: '2023 International Evidence-Based PCOS Guideline',
      ),
    ],
    safety: [
      'Supplement regulation/quality can vary across inositol products.',
      'Do not assume “40:1” or any other marketed ratio is guideline-endorsed.',
    ],
  ),
  ReproProfile(
    id: 'female-coq10-por',
    name: 'CoQ10 — diminished ovarian reserve / IVF',
    domain: 'Female fertility',
    coreRule:
        'A positive ovarian-response study does not establish a live-birth benefit or a universal CoQ10 fertility dose.',
    uses: [
      ReproUse(
        indication: 'Young low-prognosis women with decreased ovarian reserve before IVF/ICSI — study context',
        population: 'Women younger than 35 in POSEIDON group 3 in the cited RCT',
        form: 'Oral CoQ10',
        dose: '200 mg three times daily (600 mg/day).',
        frequency: 'Three times daily.',
        duration: '60 days before IVF/ICSI stimulation.',
        exactUse:
            'This belongs in reproductive-specialist care, not routine self-treatment. Use only if the fertility team agrees and track the exact CoQ10 form/product.',
        evidence: ReproEvidence.researchOnly,
        caveat:
            'The trial improved ovarian response and embryo-quality measures, but clinical pregnancy/live-birth differences were not statistically significant.',
        sourceLabel: '2018 CoQ10 poor-ovarian-reserve randomized study',
      ),
    ],
    safety: [
      'Do not present CoQ10 as reversing ovarian aging or restoring ovarian reserve.',
      'Do not delay age-appropriate fertility evaluation while trying supplements.',
    ],
  ),
  ReproProfile(
    id: 'dhea-ivf',
    name: 'DHEA — ovarian stimulation',
    domain: 'Female fertility',
    coreRule:
        'DHEA is a hormone precursor, not a routine wellness supplement. Current ESHRE guidance recommends against routine DHEA before/during ovarian stimulation.',
    uses: [
      ReproUse(
        indication: 'Poor/low ovarian response — historical study regimen',
        population: 'Women undergoing IVF/ICSI',
        form: 'Oral DHEA',
        dose: '75 mg/day in many ovarian-stimulation studies.',
        frequency: 'Daily total dose.',
        duration: 'Often 6–12 weeks before stimulation; many studies started about 12 weeks prior.',
        exactUse:
            'Do NOT self-start for infertility. If encountered, treat this as evidence context and coordinate with the reproductive specialist.',
        evidence: ReproEvidence.againstRoutineUse,
        caveat:
            'ESHRE 2025 strongly recommends against DHEA before/during ovarian stimulation for both low responders and normal responders because live-birth/ongoing-pregnancy benefit was not shown.',
        sourceLabel: 'ESHRE Ovarian Stimulation Guideline 2025',
      ),
    ],
    safety: [
      'Androgenic adverse effects can occur; hormone-sensitive conditions and pregnancy require specialist oversight.',
      'DHEA can confound endocrine evaluation if started before fertility testing.',
    ],
  ),
];

ReproProfile reproductiveProfile(String id) {
  return reproductiveProfiles.singleWhere((item) => item.id == id);
}

const reproductiveAssessmentRules = <ReproAssessmentRule>[
  ReproAssessmentRule(
    title: 'Male fertility: test before selling a stack',
    who: 'Couples with infertility or a suspected male factor',
    actions: [
      'Obtain reproductive history and one or more semen analyses as the initial male evaluation.',
      'If the first semen analysis is abnormal, repeat testing is often important because semen parameters vary substantially; AUA/ASRM notes at least two analyses, ideally about a month apart, are useful especially when the first is abnormal.',
      'FSH + testosterone are NOT blanket first-line tests for every man; they are indicated in selected men such as oligospermia below 10 million/mL. Add LH when testosterone is low and prolactin when hypogonadotropic hypogonadism or decreased libido suggests it.',
      'Azoospermia, severe abnormalities, failed ART/recurrent pregnancy loss, varicocele concerns, obstruction or endocrine abnormalities need specialist evaluation rather than supplements.',
    ],
    sourceLabel: 'AUA/ASRM Male Infertility Guideline (2020; amended 2024)',
  ),
  ReproAssessmentRule(
    title: 'Female fertility: know when to refer',
    who: 'Women/couples trying to conceive',
    actions: [
      'If age is under 35 and there is no known risk factor, evaluate after 12 months of regular unprotected intercourse without conception.',
      'At age 35 or older, start evaluation after 6 months; over age 40, more immediate evaluation may be warranted.',
      'Do not wait for those time thresholds when there are irregular/absent cycles, suspected endometriosis or tubal/uterine disease, known male subfertility, sexual dysfunction or other known infertility risks.',
      'Female evaluation is not a “vitamin panel”: assess ovulation and reproductive anatomy/tubal patency as clinically indicated, while the male partner is evaluated in parallel.',
    ],
    sourceLabel: 'ASRM Fertility Evaluation of Infertile Women',
  ),
  ReproAssessmentRule(
    title: 'Natural fertility: what actually helps',
    who: 'Couples without known infertility',
    actions: [
      'Intercourse every 1–2 days during the 6-day fertile window gives the highest pregnancy rates; 2–3 times weekly is nearly equivalent.',
      'Women trying to conceive should take folic acid at least 400 mcg/day for neural-tube-defect prevention.',
      'Healthy diet/lifestyle are appropriate, but antioxidants, herbs and special “fertility diets” are not proven to improve natural fertility in ovulatory women.',
    ],
    sourceLabel: 'ASRM Optimizing Natural Fertility',
  ),
  ReproAssessmentRule(
    title: 'Sexual dysfunction: do not hide the diagnosis with supplements',
    who: 'Men or women with persistent sexual symptoms',
    actions: [
      'Persistent ED needs medical review because vascular disease, diabetes, neurologic disease and medicines can contribute.',
      'Female low desire, arousal problems or pain should prompt review of menopause/GSM, pelvic pain, medicines such as antidepressants, endocrine issues and psychosocial/relationship factors as relevant.',
      'Be especially cautious with online/OTC “sexual enhancement” blends: NCCIH warns that products in this category may contain undeclared drug ingredients, including compounds that can dangerously interact with nitrates.',
      'A supplement trial should have a defined symptom target and stop date; lack of response means reassess the diagnosis, not stack more products.',
    ],
    sourceLabel: 'NCCIH ED/Sexual Enhancement + ASRM fertility evaluation',
  ),
];

const reproductiveGlobalLocks = <String>[
  'AUA/ASRM Male Infertility Guideline (2020; amended 2024): antioxidants/vitamins for male infertility have questionable clinical utility; evidence is inadequate to recommend a specific agent.',
  'Testosterone monotherapy should NOT be prescribed to a man who wants current or future fertility because exogenous testosterone can suppress spermatogenesis.',
  'Do not use AMH/ovarian-reserve tests as a “fertility score” in a healthy woman with no infertility indication; age and the clinical fertility context matter more.',
  'Supplement improvement in semen parameters, ovulation markers or embryo quality is NOT the same as proven improvement in pregnancy or live birth.',
  'Sexual enhancement and fertility products are high-risk areas for overmarketing, proprietary blends and hidden duplication; read the exact label.',
];
