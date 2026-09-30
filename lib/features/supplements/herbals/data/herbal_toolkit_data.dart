import '../domain/herbal_toolkit_models.dart';

const herbalProfiles = <HerbalProfile>[
  HerbalProfile(
    id: 'black-cohosh',
    name: 'Black cohosh (Actaea racemosa)',
    category: 'Menopause',
    keyRule:
        'Black cohosh is not a class effect. Evidence is concentrated in specific extracts, while commercial products vary and misidentification/adulteration has been documented.',
    uses: [
      HerbalUse(
        id: 'vms',
        indication: 'Menopausal vasomotor / overall symptoms',
        population: 'Peri- or postmenopausal adults after standard VMS options are reviewed',
        formOrExtract:
            'Standardized black-cohosh root/rhizome extract; do not extrapolate one branded extract to all powders/tinctures.',
        dose:
            'NO universal dose encoded. Research has used specific standardized extracts; dose must match the exact studied/product preparation.',
        frequency: 'Product/study specific.',
        duration:
            'Research has included use for months and up to about 1 year; reassess benefit rather than continuing indefinitely.',
        exactUse:
            'Use only after counseling that major menopause guidance does not recommend herbal supplements routinely for vasomotor symptoms. Stop if no meaningful symptom improvement.',
        evidence: HerbalEvidence.conflicting,
        caveat:
            'The Menopause Society 2023 does not recommend supplements/herbal remedies for VMS overall. NCCIH notes some black-cohosh extracts may help, but results vary by product.',
        sourceLabel: 'The Menopause Society 2023 + NCCIH Black Cohosh 2024',
      ),
    ],
    safety: [
      'Stop and seek assessment for dark urine, jaundice, marked fatigue or other possible liver-injury symptoms.',
      'Pregnancy/breastfeeding: avoid because safety is uncertain.',
      'Hormone-sensitive cancer history requires clinician review because safety is uncertain.',
      'Black cohosh is NOT blue cohosh; blue cohosh has distinct serious toxicity concerns.',
    ],
  ),
  HerbalProfile(
    id: 'soy-isoflavones',
    name: 'Soy isoflavones',
    category: 'Menopause',
    keyRule:
        'Food soy and concentrated isoflavone supplements are not interchangeable. Hot-flash effects are small/inconsistent and not strong enough for routine VMS recommendation.',
    uses: [
      HerbalUse(
        id: 'hot-flash',
        indication: 'Menopausal hot flashes',
        population: 'Postmenopausal adults considering a nonhormonal supplement',
        formOrExtract: 'Soy isoflavone extract or isoflavone-rich soy protein',
        dose:
            'Trials have commonly tested about 80 mg/day total isoflavones; one 12-week trial used 80 mg/day containing 60 mg genistein.',
        frequency: 'Usually once daily in the cited standardized trial.',
        duration: 'About 12 weeks is a reasonable evidence-review checkpoint.',
        exactUse:
            'If tried, use a standardized product with stated total isoflavones and reassess hot-flash frequency/severity after the trial period.',
        evidence: HerbalEvidence.conflicting,
        caveat:
            'The Menopause Society 2023 does not recommend soy foods/extracts for VMS despite some studies showing small benefit.',
        sourceLabel: 'NCCIH Soy + Menopause Society 2023 + soy RCTs',
      ),
    ],
    safety: [
      'Short-term soy extracts appear generally tolerated, but concentrated supplement exposure is different from ordinary food soy.',
      'History of estrogen-sensitive disease requires individualized review rather than assuming a phytoestrogen is harmless.',
    ],
  ),
  HerbalProfile(
    id: 'red-clover',
    name: 'Red clover isoflavones',
    category: 'Menopause',
    keyRule:
        'Red-clover evidence is inconsistent. A positive trial does not override negative or neutral trials and guideline conclusions.',
    uses: [
      HerbalUse(
        id: 'vms',
        indication: 'Menopausal hot flashes',
        population: 'Postmenopausal adults considering a supplement trial',
        formOrExtract: 'Standardized red-clover isoflavone extract',
        dose: '80 mg/day total isoflavones has been used in multiple trials.',
        frequency: 'Once daily total dose in many trials.',
        duration: '12 weeks / about 90 days in common trials.',
        exactUse:
            'Only use a standardized product if a trial is chosen, record baseline hot-flash frequency, and stop if there is no clinically meaningful benefit.',
        evidence: HerbalEvidence.conflicting,
        caveat:
            'Trials conflict: some 80 mg/day studies were positive, while a larger controlled trial found no clinically important effect.',
        sourceLabel: 'Red-clover RCTs + NCCIH Menopause review',
      ),
    ],
    safety: [
      'Treat as a phytoestrogen exposure; use caution with estrogen-sensitive conditions.',
      'Do not combine multiple phytoestrogen supplements without reviewing total exposure.',
    ],
  ),
  HerbalProfile(
    id: 'ashwagandha',
    name: 'Ashwagandha (Withania somnifera)',
    category: 'Stress / Sleep',
    keyRule:
        'Evidence depends on the extract. “600 mg ashwagandha” is not automatically equivalent across root extracts, root+leaf extracts and different withanolide standardizations.',
    uses: [
      HerbalUse(
        id: 'stress',
        indication: 'Stress symptoms',
        population: 'Adults without pregnancy, thyroid/autoimmune contraindications or major interacting medicines',
        formOrExtract: 'Standardized ashwagandha root extract',
        dose: '300 mg twice daily was used in multiple randomized stress trials.',
        frequency: 'Twice daily.',
        duration: 'Common evidence window: 8 weeks; NCCIH considers short-term use up to about 3 months.',
        exactUse:
            'Use the same standardized extract throughout the trial, monitor sedation/GI tolerance, and stop if no meaningful stress/sleep benefit.',
        evidence: HerbalEvidence.limited,
        caveat:
            'NCCIH says some preparations may help stress/insomnia, but evidence is not uniform across products and anxiety evidence remains unclear.',
        sourceLabel: 'NCCIH Ashwagandha + randomized stress trials',
      ),
    ],
    safety: [
      'Avoid during pregnancy and breastfeeding.',
      'Avoid/review in thyroid disorders, autoimmune disease, before surgery, and with sedatives, anticonvulsants or immunosuppressants.',
      'Rare liver injury has been reported; stop for jaundice, dark urine or marked fatigue.',
      'Review diabetes and antihypertensive medicines because additive effects/interactions are possible.',
    ],
  ),
  HerbalProfile(
    id: 'valerian',
    name: 'Valerian (Valeriana officinalis)',
    category: 'Sleep',
    keyRule:
        'Valerian is widely marketed for sleep, but chronic-insomnia efficacy is inconsistent and AASM guidance recommends against it.',
    uses: [
      HerbalUse(
        id: 'sleep',
        indication: 'Short-term sleep supplement trial',
        population: 'Adults who have already addressed sleep hygiene and major insomnia causes',
        formOrExtract: 'Valerian root/rhizome preparation',
        dose: '300–600 mg/day has been used with apparent short-term safety.',
        frequency:
            'Often taken as an evening dose; exact timing depends on the product/study.',
        duration: 'Up to 6 weeks is the better-characterized short-term safety window.',
        exactUse:
            'Do not combine with alcohol or other sedatives. Stop if next-day impairment or paradoxical agitation occurs.',
        evidence: HerbalEvidence.againstRoutineUse,
        caveat:
            'Evidence for insomnia is inconsistent; the American Academy of Sleep Medicine recommended against valerian for chronic insomnia.',
        sourceLabel: 'NCCIH Valerian',
      ),
    ],
    safety: [
      'Can cause headache, GI upset, mental dullness, vivid dreams or paradoxical excitability.',
      'Long-term safety is uncertain.',
      'Abrupt discontinuation after chronic heavy use has rarely been associated with withdrawal-like symptoms.',
    ],
  ),
  HerbalProfile(
    id: 'lavender-silexan',
    name: 'Oral lavender oil (Silexan-type preparation)',
    category: 'Anxiety / Stress',
    keyRule:
        'Evidence applies to a defined oral lavender-oil preparation, not aromatherapy oil swallowed from a bottle or arbitrary lavender capsules.',
    uses: [
      HerbalUse(
        id: 'anxiety',
        indication: 'Anxiety symptoms / GAD-adjacent evidence',
        population: 'Adults in studied anxiety populations',
        formOrExtract: 'Defined oral Lavandula angustifolia oil preparation (Silexan)',
        dose: '80 mg once daily is the most consistently studied dose; 160 mg/day has also been studied in GAD.',
        frequency: 'Once daily.',
        duration: '10 weeks in major placebo-controlled trials.',
        exactUse:
            'Use only the defined oral medicinal/supplement preparation. Do not ingest essential oil products that are not labeled for oral use.',
        evidence: HerbalEvidence.moderate,
        caveat:
            'Do not generalize Silexan evidence to lavender tea, topical oil or diffuser aromatherapy.',
        sourceLabel: 'Silexan randomized trials/meta-analysis',
      ),
    ],
    safety: [
      'Product-specific oral formulation matters.',
      'Review pregnancy/breastfeeding safety and concomitant sedating medicines before use.',
    ],
  ),
  HerbalProfile(
    id: 'l-theanine',
    name: 'L-theanine',
    category: 'Stress / Sleep',
    keyRule:
        'L-theanine has small human trials for stress/sleep. Evidence is promising but not conclusive, and dose-response data are still evolving.',
    uses: [
      HerbalUse(
        id: 'stress-sleep',
        indication: 'Stress-related symptoms / sleep quality',
        population: 'Generally healthy adults',
        formOrExtract: 'Purified L-theanine',
        dose: '200 mg/day in a 4-week randomized placebo-controlled trial.',
        frequency: 'Once daily total dose in the cited trial.',
        duration: '4 weeks in the cited efficacy trial.',
        exactUse:
            'Use as a time-limited trial with a defined target such as sleep latency or perceived stress; do not escalate merely because effects are subtle.',
        evidence: HerbalEvidence.limited,
        caveat:
            'A 2026 dose-response sleep/stress trial protocol reflects that the optimal dose is still not established.',
        sourceLabel: 'L-theanine randomized trial 2019 + 2026 dose-response protocol',
      ),
    ],
    safety: [
      'Long-term high-dose safety is not well established.',
      'Review sedative combinations and blood-pressure-lowering medicines if relevant.',
    ],
  ),
  HerbalProfile(
    id: 'rhodiola',
    name: 'Rhodiola rosea',
    category: 'Stress / Fatigue',
    keyRule:
        'Rhodiola products differ in rosavin/salidroside standardization; evidence should not be transferred across arbitrary extracts.',
    uses: [
      HerbalUse(
        id: 'stress-fatigue',
        indication: 'Stress-related fatigue',
        population: 'Adults with stress-related fatigue after medical causes are excluded',
        formOrExtract: 'Standardized SHR-5 root extract in the cited phase III trial',
        dose: '576 mg/day total extract.',
        frequency: 'Four tablets daily in the cited 28-day trial.',
        duration: '28 days.',
        exactUse:
            'Use only as a short trial after ruling out anemia, thyroid disease, sleep disorders, depression and other fatigue causes.',
        evidence: HerbalEvidence.limited,
        caveat:
            'Evidence is much smaller than marketing suggests and applies to specific standardized extracts.',
        sourceLabel: 'SHR-5 randomized stress-fatigue trial',
      ),
    ],
    safety: [
      'Avoid treating unexplained persistent fatigue with rhodiola alone.',
      'Review psychiatric medicines and stimulating combinations before use.',
    ],
  ),
  HerbalProfile(
    id: 'bacopa',
    name: 'Bacopa monnieri',
    category: 'Cognition',
    keyRule:
        'Bacopa is not an acute nootropic. Trials showing signals generally used chronic standardized extracts for weeks to months.',
    uses: [
      HerbalUse(
        id: 'cognition',
        indication: 'Memory / cognitive-performance adjunct',
        population: 'Adults interested in a time-limited cognition trial',
        formOrExtract: 'Standardized Bacopa monnieri extract',
        dose: '300 mg/day has been used in multiple randomized trials.',
        frequency: 'Once daily total dose in recent trials; older products may divide dosing.',
        duration: '12 weeks is a common trial duration.',
        exactUse:
            'Do not expect an immediate effect. Reassess objective or patient-prioritized cognitive outcomes after the trial period.',
        evidence: HerbalEvidence.limited,
        caveat:
            'Small studies show mixed domain-specific findings; product standardization matters.',
        sourceLabel: 'Bacopa randomized trials 2001–2025',
      ),
    ],
    safety: [
      'GI effects are common enough to affect adherence.',
      'Do not use as a substitute for evaluation of new cognitive decline.',
    ],
  ),
  HerbalProfile(
    id: 'ginkgo',
    name: 'Ginkgo biloba (EGb 761 context)',
    category: 'Cognition / Dementia',
    keyRule:
        'Ginkgo does not prevent dementia. Some trials of the standardized EGb 761 extract at 240 mg/day found symptom benefit in selected dementia populations.',
    uses: [
      HerbalUse(
        id: 'dementia-symptoms',
        indication: 'Selected dementia symptoms — specialist adjunct context',
        population: 'Adults with mild-to-moderate dementia with neuropsychiatric symptoms',
        formOrExtract: 'Standardized EGb 761 extract',
        dose: '240 mg/day.',
        frequency: 'Once daily in major 24-week trials.',
        duration: '22–24 weeks in major trials.',
        exactUse:
            'Use only after diagnosis and medication/bleeding-risk review. Do not use to prevent dementia in healthy older adults.',
        evidence: HerbalEvidence.conflicting,
        caveat:
            'NCCIH concludes there is no conclusive benefit overall and no dementia-prevention benefit, despite positive EGb 761 symptom trials.',
        sourceLabel: 'NCCIH Ginkgo + EGb 761 randomized trials',
      ),
    ],
    safety: [
      'May increase bleeding risk, especially with warfarin or other anticoagulants/antiplatelets.',
      'Raw/fresh ginkgo seeds are toxic; use only standardized leaf extract products.',
      'Pregnancy may carry bleeding/labor concerns.',
    ],
  ),
  HerbalProfile(
    id: 'lions-mane',
    name: 'Lion’s mane (Hericium erinaceus)',
    category: 'Cognition',
    keyRule:
        'Lion’s-mane evidence is preliminary and product-dependent; fruiting-body powder and concentrated extracts are not dose-equivalent.',
    uses: [
      HerbalUse(
        id: 'mci',
        indication: 'Mild cognitive impairment — preliminary evidence',
        population: 'Older adults with diagnosed MCI in a very small trial',
        formOrExtract: '96% lion’s-mane dry powder tablets in the classic trial',
        dose: '3 g/day total dry powder.',
        frequency: '1 g three times daily (four 250 mg tablets three times daily).',
        duration: '16 weeks.',
        exactUse:
            'Do not translate 3 g dry powder directly into a 10:1 extract dose. Treat as a small-study regimen, not established therapy.',
        evidence: HerbalEvidence.limited,
        caveat:
            'The classic trial had only 30 participants; evidence is insufficient for routine cognitive treatment.',
        sourceLabel: 'Hericium erinaceus MCI randomized trial',
      ),
    ],
    safety: [
      'GI discomfort/diarrhea occurred in some reports.',
      'Mushroom allergy is relevant.',
      'Do not delay formal assessment of progressive cognitive symptoms.',
    ],
  ),
  HerbalProfile(
    id: 'st-johns-wort',
    name: 'St. John’s wort (Hypericum perforatum)',
    category: 'Mood / High-interaction herb',
    keyRule:
        'St. John’s wort has one of the highest clinically important interaction burdens among common supplements. Medication review is mandatory before use.',
    uses: [
      HerbalUse(
        id: 'depression-context',
        indication: 'Mild-to-moderate depression evidence context',
        population: 'Adults under clinician-supervised depression care',
        formOrExtract: 'Standardized solid extracts; historical trials often used 0.3% hypericin extracts',
        dose:
            'Historical studies commonly used 300 mg standardized extract three times daily; this is evidence context, not an automatic self-care recommendation.',
        frequency: 'Three times daily in many historical trials.',
        duration:
            'Short-term trials vary; do not self-continue without formal mood/safety follow-up.',
        exactUse:
            'Only consider after a full medicine interaction screen and assessment for bipolar disorder, suicidality and severity of depression.',
        evidence: HerbalEvidence.highRiskInteraction,
        caveat:
            'NCCIH says efficacy is inconsistent and it should not replace conventional care.',
        sourceLabel: 'NCCIH St. John’s Wort + standardized-extract clinical literature',
      ),
    ],
    safety: [
      'Do NOT combine casually with SSRIs/SNRIs/other serotonergic drugs because serotonin syndrome can occur.',
      'Can reduce effectiveness of birth-control pills, cyclosporine, digoxin, warfarin, some HIV drugs, some cancer drugs and other medicines.',
      'May worsen psychosis or bipolar symptoms and can cause photosensitivity.',
      'Depression with suicidality or severe functional impairment requires urgent professional care, not supplement self-treatment.',
    ],
  ),
  HerbalProfile(
    id: 'chamomile',
    name: 'Chamomile',
    category: 'Sleep / Anxiety',
    keyRule:
        'Traditional use is common, but clinical evidence for insomnia is not conclusive.',
    uses: [
      HerbalUse(
        id: 'sleep',
        indication: 'Sleep support',
        population: 'Adults considering a low-risk herbal tea/supplement',
        formOrExtract: 'Tea or standardized oral preparation',
        dose: 'NO universal evidence-based insomnia dose encoded.',
        frequency: 'Product-specific.',
        duration: 'Use only as a short self-care trial.',
        exactUse:
            'If used as tea, counsel it as a comfort routine rather than a proven insomnia treatment.',
        evidence: HerbalEvidence.insufficient,
        caveat: 'NCCIH reports no conclusive clinical-trial evidence for insomnia.',
        sourceLabel: 'NCCIH Sleep Disorders',
      ),
    ],
    safety: [
      'Ragweed/daisy-family allergy can cross-react.',
      'Do not let “natural tea” delay evaluation of persistent insomnia.',
    ],
  ),
  HerbalProfile(
    id: 'passionflower',
    name: 'Passionflower (Passiflora incarnata)',
    category: 'Anxiety / Sleep',
    keyRule:
        'Passionflower has limited small-study evidence and no robust universal dose for anxiety or insomnia.',
    uses: [
      HerbalUse(
        id: 'anxiety-sleep',
        indication: 'Anxiety/sleep support',
        population: 'Adults considering a short herbal trial',
        formOrExtract: 'Product-specific extract/tea',
        dose: 'NO universal evidence-based dose encoded.',
        frequency: 'Product/study specific.',
        duration: 'Short-term only unless clinician-supervised.',
        exactUse:
            'Avoid stacking with multiple sedating herbs/medicines; define the symptom target and stop if ineffective.',
        evidence: HerbalEvidence.insufficient,
        caveat:
            'Evidence is too heterogeneous to translate into one standard dose or a general treatment recommendation.',
        sourceLabel: 'Complementary-medicine evidence reviews',
      ),
    ],
    safety: [
      'Potential additive sedation with alcohol, sleep medicines and other sedating herbs.',
      'Pregnancy safety is uncertain; avoid unsupervised use.',
    ],
  ),
  HerbalProfile(
    id: 'kava',
    name: 'Kava (Piper methysticum)',
    category: 'Anxiety / High-risk herb',
    keyRule:
        'Kava has been studied for anxiety, but serious liver injury has been reported. It is not a routine sleep/anxiety recommendation.',
    uses: [
      HerbalUse(
        id: 'anxiety',
        indication: 'Anxiety — historical evidence context',
        population: 'Adults only under careful clinician review',
        formOrExtract: 'Kavalactone-standardized products vary substantially',
        dose: 'NO routine dose encoded because liver-safety concerns outweigh casual self-use.',
        frequency: 'Do not auto-generate.',
        duration: 'Do not auto-generate.',
        exactUse:
            'If a clinician considers kava despite risks, use a quality-controlled product and monitor for liver-injury symptoms.',
        evidence: HerbalEvidence.againstRoutineUse,
        caveat:
            'NCCIH notes kava use has been linked to liver injury that can be serious or fatal.',
        sourceLabel: 'NCCIH Sleep Disorders / Kava safety',
      ),
    ],
    safety: [
      'Avoid with liver disease, hepatotoxic medicines and alcohol.',
      'Stop immediately for jaundice, dark urine, severe fatigue, nausea or right-upper-quadrant symptoms.',
    ],
  ),
];

HerbalProfile herbalProfile(String id) {
  return herbalProfiles.singleWhere((item) => item.id == id);
}

const menopauseGlobalLocks = <String>[
  'The Menopause Society 2023 does NOT recommend supplements/herbal remedies as a class for vasomotor symptoms. Evidence-based nonhormonal prescription/behavioral options should be discussed when symptoms are clinically important.',
  'Phytoestrogen exposure from soy/red clover is not automatically safe for every patient with a hormone-sensitive cancer history.',
  'Postmenopausal bleeding is NOT a supplement problem; it requires medical evaluation.',
  'New severe headache, chest pain, syncope, focal neurologic deficit or major mood deterioration needs medical assessment rather than another supplement.',
];

const neuroGlobalLocks = <String>[
  '“Memory support” supplements do not replace evaluation of new or progressive cognitive decline.',
  'Any supplement that affects mood/sleep can interact with sedatives, antidepressants, antiseizure medicines or alcohol.',
  'St. John’s wort requires a full medication interaction screen before dispensing.',
  'Do not combine several sedating herbs simply because each one is sold OTC.',
];
