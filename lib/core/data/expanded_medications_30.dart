import '../models/medication.dart';

const expandedMedications30 = <Medication>[
  Medication(
    id: 'paroxetine-paxil-cr',
    familyId: 'cns',
    name: 'Paroxetine Controlled-Release (PAXIL CR)',
    subtitle: 'SSRI · morning · food flexible · swallow whole',
    tags: ['Depression', 'Panic disorder', 'Social anxiety', 'PMDD', 'Controlled release'],
    aliases: ['PAXIL CR', 'Paroxetine CR'],
    sourceLabel:
        'DailyMed · PAXIL CR paroxetine controlled-release tablets · effective Sep 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily controlled-release paroxetine for labeled adult psychiatric indications including MDD, panic disorder, social anxiety disorder and PMDD.',
      foodTiming:
          'Take once daily in the morning, with or without food.',
      duration:
          'Usually months or longer when effective. PMDD may be continuous or luteal-phase-only; duration/regimen is indication-specific.',
      formulationHandling:
          'Swallow controlled-release tablets whole. Do not chew or crush.',
      releaseConversion:
          'Current PAXIL CR labeling does not provide a direct immediate-release paroxetine → CR conversion table or an automatic mg-for-mg switch instruction. Do not infer a universal 20 mg IR → 25 mg CR rule solely from historical relative-bioavailability or trial dose ranges. Select the CR dose by indication, prior clinical response, age, renal/hepatic status and tolerability, then reassess after the switch.',
      monitoring:
          'Mood/suicidality after initiation or dose changes, serotonin-syndrome symptoms, sexual adverse effects, hyponatremia in susceptible patients and bleeding risk when relevant.',
      interactions:
          'MAO inhibitors are contraindicated. Review other serotonergic medicines, tamoxifen and medicines that increase bleeding risk.',
      commonMistakes:
          'Treating CR like immediate-release paroxetine, crushing the controlled-release tablet, stopping abruptly, or assuming PMDD must always be dosed continuously.',
      specialPopulations:
          'Lower starting/max doses apply in severe renal or hepatic impairment and in older adults.',
    ),
    sections: [
      MedicationSection(
        title: 'No automatic IR → CR conversion',
        body:
            'The current label provides indication-specific CR starting/titration doses, not a formal IR-to-CR conversion table. Do not encode a blanket 20→25 mg conversion.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'CR administration lock',
        body:
            'Take once daily in the morning with or without food. Swallow whole; do not chew or crush.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'PMDD regimen nuance',
        body:
            'For PMDD, the label allows continuous daily dosing or intermittent luteal-phase dosing; do not generalize one regimen to every indication.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'SSRI لعلاج depression وبعض حالات panic disorder وsocial anxiety وPMDD حسب الوصفة.',
      howToUseAr:
          'خذ PAXIL CR مرة يوميًا وابتلع الحبة كاملة. لا تمضغها أو تسحقها.',
      timingAr:
          'تؤخذ صباحًا، مع الطعام أو بدونه.',
      importantAr:
          'لا تحول من paroxetine العادي إلى CR بنفسك بنسبة ثابتة؛ الملصق الحالي لا يعطي جدول تحويل IR→CR مباشر. لا توقف الدواء فجأة، وإذا كان الاستخدام للـPMDD فقد تكون الخطة يومية أو خلال luteal phase حسب الطبيب.',
          'لا توقفها فجأة بعد الاستخدام المنتظم. إذا كان الاستخدام للـPMDD فقد تكون الخطة يومية طوال الشهر أو فقط خلال luteal phase حسب الطبيب.',
      commonActionableAr:
          'قد يحدث غثيان أو نعاس/أرق أو آثار جنسية. إذا أثرت الأعراض على الالتزام راجع الطبيب بدل إيقاف الدواء بنفسك.',
      missedDoseAr:
          'لا تضاعف الجرعة الفائتة؛ خذ الجرعة التالية حسب الجدول المعتاد.',
      seekHelpAr:
          'اطلب المساعدة عند أفكار انتحارية جديدة/متفاقمة، أعراض serotonin syndrome، نزف شديد أو ارتباك/تشنجات توحي بنقص صوديوم شديد.',
      teachBackAr:
          'متى ستأخذ PAXIL CR؟ وهل يجوز سحقها؟ وهل PMDD دائمًا يحتاج جرعة يومية طوال الشهر؟',
    ),
  ),
  Medication(
    id: 'desvenlafaxine-er',
    familyId: 'cns',
    name: 'Desvenlafaxine Extended-Release Tablets',
    subtitle: 'SNRI · same time daily · food flexible · tablet shell may appear in stool',
    tags: ['Depression', 'SNRI', 'Desvenlafaxine', 'Extended release'],
    aliases: ['Pristiq-type', 'Desvenlafaxine ER'],
    sourceLabel:
        'DailyMed · Desvenlafaxine extended-release tablets · updated Aug 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily extended-release SNRI for major depressive disorder in adults.',
      foodTiming:
          'Take once daily at approximately the same time, with or without food.',
      duration:
          'Usually months or longer when effective; taper gradually when discontinuing.',
      formulationHandling:
          'Swallow whole with fluid. Do not divide, crush, chew or dissolve. An empty tablet shell may appear in stool after the medicine has been absorbed.',
      monitoring:
          'Blood pressure, mood/suicidality, serotonin-syndrome symptoms, sodium in susceptible patients and discontinuation symptoms.',
      interactions:
          'MAO inhibitors are contraindicated. Review other serotonergic agents and medicines that increase bleeding risk.',
      commonMistakes:
          'Crushing the ER tablet, assuming a tablet-like shell in stool means the dose was not absorbed, or stopping suddenly.',
      specialPopulations:
          'Renal impairment lowers the maximum recommended dose and may require every-other-day dosing in severe impairment/ESRD.',
    ),
    sections: [
      MedicationSection(
        title: 'ER handling',
        body:
            'Take once daily at about the same time with or without food. Swallow whole with fluid; do not divide, crush, chew or dissolve.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Ghost-tablet counseling',
        body:
            'A tablet-like shell may appear in stool after the drug has already been absorbed; this alone does not mean treatment failed.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'SNRI لعلاج major depressive disorder عند البالغين.',
      howToUseAr:
          'ابتلع حبة ER كاملة مع سائل. لا تقسّمها. لا تسحقها. لا تمضغها. لا تذيبها.',
      timingAr:
          'مرة يوميًا في وقت متقارب كل يوم، مع الطعام أو بدونه.',
      importantAr:
          'قد ترى شيئًا يشبه الحبة في البراز؛ غالبًا هذه القشرة الفارغة بعد امتصاص الدواء وليست جرعة مفقودة. لا توقف العلاج فجأة.',
      commonActionableAr:
          'قد يحدث غثيان أو تعرق أو دوار، وقد يرتفع الضغط؛ التزم بقياس الضغط إذا طلب الطبيب.',
      missedDoseAr:
          'لا تضاعف الجرعة الفائتة؛ ارجع لوقت الجرعة المعتاد.',
      seekHelpAr:
          'اطلب المساعدة عند أفكار انتحارية جديدة/متفاقمة، serotonin syndrome، ارتفاع ضغط شديد مع أعراض أو نزف شديد.',
      teachBackAr:
          'هل الطعام ضروري؟ وهل يجوز تقسيم ER؟ وماذا يعني ظهور قشرة حبة في البراز؟',
    ),
  ),
  Medication(
    id: 'lumateperone-caplyta',
    familyId: 'cns',
    name: 'Lumateperone (CAPLYTA)',
    subtitle: 'Schizophrenia/bipolar depression/MDD adjunct · once daily · no titration',
    tags: ['Schizophrenia', 'Bipolar depression', 'MDD adjunct', 'Antipsychotic'],
    aliases: ['CAPLYTA', 'Lumateperone'],
    sourceLabel:
        'DailyMed · CAPLYTA lumateperone capsules · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily atypical antipsychotic for schizophrenia, bipolar depression and adjunctive treatment of MDD in adults under current labeling.',
      foodTiming:
          'Take once daily with or without food.',
      duration:
          'Usually long-term when effective; indication and concomitant regimen determine follow-up.',
      formulationHandling:
          'No dose titration is needed for the usual 42 mg regimen. Use the prescribed strength, especially when CYP3A4 inhibitors require dose adjustment.',
      monitoring:
          'Sedation, orthostasis, weight, glucose/lipids, abnormal movements and mood/suicidality when used for depressive indications.',
      interactions:
          'Strong CYP3A4 inducers should be avoided; moderate/strong CYP3A4 inhibitors require lower CAPLYTA strengths per label.',
      commonMistakes:
          'Adding an unnecessary titration schedule, assuming food is required, or failing to adjust for CYP3A4 inhibitors.',
      specialPopulations:
          'Dose strength changes are required with moderate/strong CYP3A4 inhibitors and in some hepatic impairment settings.',
    ),
    sections: [
      MedicationSection(
        title: 'No-titration lock',
        body:
            'Usual CAPLYTA dosing is once daily without titration. Food is optional.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'CYP3A4 strength lock',
        body:
            'Moderate or strong CYP3A4 inhibitors require lower CAPLYTA strengths; strong CYP3A4 inducers should be avoided.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يستخدم للـschizophrenia وbipolar depression، ويمكن أن يكون adjunct لبعض حالات major depression عند البالغين.',
      howToUseAr:
          'خذ الكبسولة مرة يوميًا حسب القوة الموصوفة؛ الجرعة المعتادة لا تحتاج titration تدريجي.',
      timingAr:
          'مرة يوميًا، مع الطعام أو بدونه.',
      importantAr:
          'قد يسبب نعاسًا ودوخة. أخبر الصيدلي عن azole antifungals أو clarithromycin أو أدوية أخرى تؤثر CYP3A4 لأن القوة قد تحتاج تعديلًا.',
      commonActionableAr:
          'النعاس والدوخة وجفاف الفم قد تحدث؛ تجنب القيادة حتى تعرف تأثيره عليك.',
      missedDoseAr:
          'لا تضاعف الجرعة الفائتة؛ ارجع للجدول المعتاد.',
      seekHelpAr:
          'اطلب المساعدة عند حرارة مع تيبس وارتباك، حركات غير طبيعية شديدة، إغماء أو أفكار انتحارية جديدة عند استخدامه للاكتئاب.',
      teachBackAr:
          'هل يحتاج CAPLYTA وجبة؟ وهل تحتاج زيادة تدريجية للجرعة المعتادة؟',
    ),
  ),
  Medication(
    id: 'selegiline-zelapar-odt',
    familyId: 'cns',
    name: 'Selegiline ODT (ZELAPAR)',
    subtitle: 'Parkinson adjunct · morning before breakfast · no food/liquid ±5 min',
    tags: ['Parkinson', 'MAO-B inhibitor', 'Selegiline', 'ODT'],
    aliases: ['ZELAPAR 1.25 mg', 'Selegiline orally disintegrating'],
    sourceLabel:
        'DailyMed · ZELAPAR selegiline orally disintegrating tablets · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Orally disintegrating selegiline used as adjunct in Parkinson disease.',
      foodTiming:
          'Take in the morning before breakfast without liquid. Avoid food or liquids for 5 minutes before and 5 minutes after the dose.',
      duration:
          'Chronic adjunctive therapy while effective and safe.',
      formulationHandling:
          'With dry hands, peel back the blister foil; do not push the tablet through. Remove gently and immediately place on top of the tongue to disintegrate.',
      monitoring:
          'Blood pressure, hallucinations, dyskinesia, orthostasis, oral mucosal irritation and serotonergic/MAOI interaction risk.',
      interactions:
          'Major MAOI-type interactions apply, including contraindicated combinations with certain opioids and other serotonergic/adrenergic medicines. Do not exceed prescribed dose.',
      commonMistakes:
          'Swallowing with water, eating immediately before/after, pushing through foil, or using wet hands.',
      specialPopulations:
          'Contains aspartame; phenylketonuria requires product-specific review. Lower dose is used in mild-to-moderate hepatic impairment.',
    ),
    sections: [
      MedicationSection(
        title: 'Exact ODT technique',
        body:
            'Morning before breakfast, no liquid, and no food/liquid for 5 minutes before or after. Peel foil with dry hands and place immediately on the tongue.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'MAOI interaction lock',
        body:
            'ZELAPAR has clinically important MAOI interactions; opioid, serotonergic and sympathomimetic medicines require careful review.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'MAO-B inhibitor يُضاف لعلاج أعراض Parkinson.',
      howToUseAr:
          'بيدين جافتين انزع غطاء الـfoil بدل دفع الحبة خلاله، ثم ضع الحبة فورًا فوق اللسان لتذوب. لا تأخذها مع ماء.',
      timingAr:
          'صباحًا قبل الفطور. تجنب الأكل والشرب 5 دقائق قبل الجرعة و5 دقائق بعدها.',
      importantAr:
          'تداخلاته الدوائية مهمة جدًا؛ أخبر الصيدلي قبل أي opioid أو antidepressant أو دواء للزكام/احتقان الأنف.',
      commonActionableAr:
          'قد يحدث دوار أو انخفاض ضغط أو dyskinesia، وقد يحدث تهيج بالفم.',
      missedDoseAr:
          'لا تضاعف الجرعة؛ إذا فات وقت الصباح فاسأل الطبيب/الصيدلي بدل نقل الجرعة عشوائيًا لوقت متأخر.',
      seekHelpAr:
          'اطلب المساعدة عند صداع شديد جدًا مع ارتفاع ضغط، serotonin syndrome، hallucinations شديدة أو تورم/قرح فموية شديدة.',
      teachBackAr:
          'متى ستأخذ ZELAPAR؟ كم دقيقة تمنع الأكل والشرب؟ وكيف تخرج الحبة من الـblister؟',
    ),
  ),
  Medication(
    id: 'entacapone-tablets',
    familyId: 'cns',
    name: 'Entacapone Tablets',
    subtitle: 'Parkinson off episodes · with every levodopa/carbidopa dose',
    tags: ['Parkinson', 'COMT inhibitor', 'Entacapone', 'Levodopa adjunct'],
    aliases: ['Comtan-type', 'Entacapone 200 mg'],
    sourceLabel:
        'DailyMed · Entacapone 200 mg tablets · current verified labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'COMT inhibitor used only with levodopa/carbidopa to reduce wearing-off in Parkinson disease.',
      foodTiming:
          'Take one 200 mg tablet with each levodopa/carbidopa dose, up to 8 times daily. May be taken with or without food.',
      duration:
          'Chronic adjunctive therapy while useful and tolerated.',
      formulationHandling:
          'Entacapone has no antiparkinsonian effect by itself; its schedule is locked to the patient’s levodopa/carbidopa doses.',
      monitoring:
          'Dyskinesia, orthostasis, hallucinations, delayed-onset diarrhea and excessive sleepiness.',
      interactions:
          'Levodopa dose may need reduction when entacapone is started if dyskinesia increases.',
      commonMistakes:
          'Taking entacapone on a generic clock instead of with levodopa/carbidopa, using it alone, or continuing despite severe/persistent diarrhea.',
      specialPopulations:
          'Use caution in hepatic impairment. Abrupt withdrawal can worsen Parkinson symptoms and rarely contribute to hyperpyrexia/confusion.',
    ),
    sections: [
      MedicationSection(
        title: 'Levodopa-linked timing',
        body:
            'One 200 mg tablet is taken with each levodopa/carbidopa dose, maximum 8 doses/day. Food is optional.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Dyskinesia/diarrhea lock',
        body:
            'Entacapone can intensify levodopa effects, so dyskinesia may require levodopa adjustment. Persistent or severe diarrhea needs review.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يُضاف إلى levodopa/carbidopa لتقليل wearing-off في Parkinson؛ لا يعمل وحده.',
      howToUseAr:
          'خذ حبة 200 mg مع كل جرعة levodopa/carbidopa حسب جدولك، وبحد أقصى 8 مرات يوميًا.',
      timingAr:
          'مرتبط بجرعات levodopa/carbidopa، ويمكن مع الطعام أو بدونه.',
      importantAr:
          'قد يزيد dyskinesia لأن تأثير levodopa يصبح أقوى. تغير لون البول إلى برتقالي/بني قد يحدث ويكون عادة غير خطير.',
      commonActionableAr:
          'قد يحدث إسهال أو دوخة أو حركات لا إرادية أكثر؛ إذا استمر الإسهال أو اشتد راجع الطبيب.',
      missedDoseAr:
          'لا تأخذ entacapone منفردًا لتعويض جرعة فائتة؛ اربطه بجدول levodopa/carbidopa حسب الخطة.',
      seekHelpAr:
          'راجع عند إسهال شديد مستمر، hallucinations شديدة، إغماء أو تدهور حاد بعد إيقاف مفاجئ.',
      teachBackAr:
          'مع أي دواء يجب أن تأخذ entacapone؟ وهل له جدول مستقل؟',
    ),
  ),
  Medication(
    id: 'ropinirole-er',
    familyId: 'cns',
    name: 'Ropinirole Extended-Release Tablets',
    subtitle: 'Parkinson · once daily · food flexible · swallow whole',
    tags: ['Parkinson', 'Dopamine agonist', 'Ropinirole', 'Extended release'],
    aliases: ['Requip XL-type', 'Ropinirole ER'],
    sourceLabel:
        'DailyMed · Ropinirole extended-release tablets · revised May 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily extended-release dopamine agonist for Parkinson disease.',
      foodTiming:
          'Take once daily with or without food.',
      duration:
          'Chronic therapy; titrate gradually and taper rather than stop abruptly.',
      formulationHandling:
          'Swallow whole. Do not chew, crush or divide. Significant interruption may require re-titration.',
      releaseConversion:
          'Direct Parkinson conversion table from ropinirole IR total daily dose to ER once daily: 0.75–2.25 mg → 2 mg; 3–4.5 → 4 mg; 6 → 6 mg; 7.5–9 → 8 mg; 12 → 12 mg; 15 → 16 mg; 18 → 18 mg; 21 → 20 mg; 24 → 24 mg. Adjust afterward for response and tolerability.',
      monitoring:
          'Sudden sleep episodes, orthostasis, hallucinations, dyskinesia and impulse-control behaviors.',
      interactions:
          'CYP1A2 inhibitors/inducers and smoking changes can alter exposure; other sedating/hypotensive drugs can increase impairment.',
      commonMistakes:
          'Splitting ER tablets, restarting the old dose after a significant interruption, or driving despite sudden-sleep episodes.',
      specialPopulations:
          'ER formulation is indicated for Parkinson disease; do not generalize dosing from immediate-release restless-legs regimens.',
    ),
    sections: [
      MedicationSection(
        title: 'IR → XR conversion',
        body:
            'Use the product conversion table rather than assuming every IR dose is exactly 1:1. Examples: IR 7.5–9 mg/day → ER 8 mg/day; IR 15 mg/day → ER 16 mg/day; IR 21 mg/day → ER 20 mg/day.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'ER handling',
        body:
            'Once daily with or without food. Swallow whole and do not chew, crush or divide.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Interruption/sleep lock',
        body:
            'A significant treatment interruption may require re-titration. Sudden sleep during daily activities can occur.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'dopamine agonist لعلاج Parkinson disease.',
      howToUseAr:
          'خذ حبة ER مرة يوميًا وابتلعها كاملة. لا تمضغها. لا تسحقها. لا تقسّمها.',
      timingAr: 'مرة يوميًا، مع الطعام أو بدونه.',
      importantAr:
          'قد يحدث نوم مفاجئ أو اندفاعات جديدة مثل القمار/الشراء. إذا انقطع العلاج فترة مهمة لا ترجع لنفس الجرعة من نفسك.',
      commonActionableAr:
          'قد يحدث غثيان أو دوخة عند الوقوف أو نعاس؛ انهض ببطء وتجنب القيادة إذا شعرت بالنعاس.',
      missedDoseAr:
          'لا تضاعف الجرعة. إذا كان الانقطاع أكثر من جرعة عابرة فاسأل عن re-titration.',
      seekHelpAr:
          'راجع عند نوم مفاجئ خطير، hallucinations شديدة، إغماء أو سلوك اندفاعي خطير.',
      teachBackAr:
          'هل يجوز تقسيم ER؟ وماذا تفعل بعد انقطاع مهم في العلاج؟',
    ),
  ),
  Medication(
    id: 'amantadine-gocovri',
    familyId: 'cns',
    name: 'Amantadine Extended-Release (GOCOVRI)',
    subtitle: 'Parkinson dyskinesia/off · bedtime · not interchangeable',
    tags: ['Parkinson', 'Amantadine', 'GOCOVRI', 'Extended release', 'Bedtime'],
    aliases: ['GOCOVRI 68.5 mg', 'GOCOVRI 137 mg'],
    sourceLabel:
        'DailyMed · GOCOVRI amantadine extended-release capsules · revised Feb 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily bedtime extended-release amantadine for Parkinson dyskinesia and off episodes under current labeling.',
      foodTiming:
          'Take once daily at bedtime, with or without food. Alcohol with the dose is not recommended.',
      duration:
          'Chronic therapy when effective; avoid sudden discontinuation.',
      formulationHandling:
          'Not substitutable with other immediate- or extended-release amantadine products. Swallow whole, or open and sprinkle the entire contents on about a teaspoon of soft food such as applesauce; swallow immediately without chewing and do not store.',
      releaseConversion:
          'GOCOVRI is not substitutable with other amantadine immediate- or extended-release products. Do not calculate a mg-for-mg conversion from amantadine IR or OSMOLEX ER. The labeled regimen begins at 137 mg once nightly for 1 week, then increases to 274 mg once nightly in patients with appropriate renal function.',
      monitoring:
          'Hallucinations, suicidality/depression, sudden sleep, orthostasis, renal function and corneal/vision symptoms.',
      interactions:
          'Alcohol can worsen release/adverse effects and is not recommended. Renal impairment requires dose reduction and ESRD is contraindicated.',
      commonMistakes:
          'Taking in the morning, substituting another amantadine product mg-for-mg, splitting capsules or abruptly stopping.',
      specialPopulations:
          'Renal function is critical for dosing because amantadine is renally eliminated.',
    ),
    sections: [
      MedicationSection(
        title: 'No amantadine mg-for-mg conversion',
        body:
            'GOCOVRI is explicitly not substitutable with other amantadine IR or ER products. Its bedtime regimen and exposure profile are product-specific.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Bedtime + noninterchangeability lock',
        body:
            'GOCOVRI is taken once daily at bedtime and is not substitutable with other amantadine immediate- or extended-release products.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Sprinkle technique',
        body:
            'If needed, open the capsule and sprinkle the entire contents on a teaspoonful of soft food such as applesauce; swallow immediately without chewing and do not store.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يستخدم في Parkinson لعلاج dyskinesia أو كعلاج مساعد لبعض off episodes.',
      howToUseAr:
          'ابتلع الكبسولة كاملة. إذا تعذر البلع يمكن فتحها ونثر كل المحتوى على كمية صغيرة نحو ملعقة شاي من applesauce وتناوله فورًا دون مضغ أو حفظ.',
      timingAr:
          'مرة واحدة عند النوم، مع الطعام أو بدونه. تجنب الكحول وقت الجرعة.',
      importantAr:
          'GOCOVRI ليست interchangeable مع amantadine العادي أو OSMOLEX ER؛ لا تحسب الجرعة بنفس عدد الـmg. تؤخذ مرة عند النوم ولا توقف فجأة.',
          'GOCOVRI ليست بديلًا mg-for-mg لأي amantadine آخر. لا توقفها فجأة.',
      commonActionableAr:
          'قد يحدث دوار أو hallucinations أو نعاس؛ أخبر الطبيب عن تغير المزاج أو النوم المفاجئ.',
      missedDoseAr:
          'إذا نسيت الجرعة لا تأخذ جرعة إضافية؛ خذ الجرعة المعتادة في الليلة التالية.',
      seekHelpAr:
          'راجع عند hallucinations شديدة، أفكار انتحارية، نوم مفاجئ خطير، أو تغير رؤية/ألم عين جديد.',
      teachBackAr:
          'متى ستأخذ GOCOVRI؟ وهل يمكن استبدالها بنفس mg من amantadine العادي؟',
    ),
  ),
  Medication(
    id: 'siponimod-mayzent',
    familyId: 'cns',
    name: 'Siponimod (MAYZENT)',
    subtitle: 'MS · CYP2C9 genotype · titration/restart · selective first-dose monitoring',
    tags: ['Multiple sclerosis', 'MS', 'Siponimod', 'S1P modulator'],
    aliases: ['MAYZENT'],
    sourceLabel:
        'DailyMed · MAYZENT siponimod tablets · current verified labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily S1P receptor modulator for selected relapsing forms of MS, with genotype-directed dosing.',
      foodTiming:
          'Take once daily with or without food.',
      duration:
          'Chronic disease-modifying therapy; initiation and reinitiation use a titration regimen.',
      formulationHandling:
          'CYP2C9 genotype must be determined before treatment. CYP2C9*3/*3 is contraindicated; selected *1/*3 or *2/*3 genotypes use a lower maintenance dose.',
      monitoring:
          'CBC, liver tests, ECG/cardiac history, ophthalmic evaluation, infection risk, blood pressure and respiratory effects when relevant.',
      interactions:
          'CYP2C9/CYP3A4 interacting drugs and heart-rate-lowering medicines require specialist review.',
      commonMistakes:
          'Starting without CYP2C9 genotype, restarting full maintenance after missed titration/4+ maintenance doses, or assuming every patient needs first-dose observation.',
      specialPopulations:
          'Six-hour first-dose monitoring is recommended for certain preexisting cardiac conditions such as sinus bradycardia, Mobitz I AV block, prior MI or heart failure.',
    ),
    sections: [
      MedicationSection(
        title: 'Genotype lock',
        body:
            'Determine CYP2C9 genotype before treatment. CYP2C9*3/*3 is contraindicated and some genotypes require 1 mg rather than 2 mg maintenance.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Restart lock',
        body:
            'If a titration dose is missed, or 4 or more consecutive maintenance doses are missed, restart from Day 1 titration and follow monitoring recommendations.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'دواء disease-modifying لبعض حالات multiple sclerosis.',
      howToUseAr:
          'ابدأ حسب titration pack والخطة التي يحددها فريق MS بعد فحص CYP2C9 genotype؛ لا تبدأ مباشرة بجرعة maintenance من نفسك.',
      timingAr: 'مرة يوميًا، مع الطعام أو بدونه.',
      importantAr:
          'إذا فاتت جرعة أثناء titration أو فاتت 4 جرعات يومية متتالية خلال maintenance، لا ترجع مباشرة للجرعة المعتادة؛ تحتاج restart من Day 1 titration. بعض مرضى القلب يحتاجون مراقبة 6 ساعات بعد أول جرعة.',
      commonActionableAr:
          'قد يحدث بطء نبض بالبداية أو صداع أو ارتفاع ضغط، كما يزداد خطر العدوى.',
      missedDoseAr:
          'اتبع قاعدة restart أعلاه؛ لا تضاعف الجرعة ولا تستأنف maintenance بعد انقطاع مهم دون مراجعة.',
      seekHelpAr:
          'راجع عند إغماء/بطء نبض شديد، عدوى شديدة، تغير رؤية أو أعراض كبدية.',
      teachBackAr:
          'لماذا نحتاج CYP2C9 قبل البدء؟ وماذا تفعل إذا فاتت 4 جرعات maintenance متتالية؟',
    ),
  ),
  Medication(
    id: 'ozanimod-zeposia',
    familyId: 'cns',
    name: 'Ozanimod (ZEPOSIA)',
    subtitle: 'MS · 7-day starter titration · restart if dose missed in first 14 days',
    tags: ['Multiple sclerosis', 'MS', 'Ozanimod', 'S1P modulator'],
    aliases: ['ZEPOSIA', 'Ozanimod starter pack'],
    sourceLabel:
        'DailyMed · ZEPOSIA ozanimod capsules · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily S1P receptor modulator for relapsing MS and other labeled indications, using a 7-day starter titration.',
      foodTiming:
          'Take once daily with or without food.',
      duration:
          'Chronic disease-modifying therapy; initiation uses a 7-day titration.',
      formulationHandling:
          'Swallow capsules whole. Starter titration: 0.23 mg days 1–4, 0.46 mg days 5–7, then maintenance from day 8 as prescribed.',
      monitoring:
          'CBC, liver tests, cardiac history/ECG, ophthalmic assessment, blood pressure, infection risk and pregnancy counseling when relevant.',
      interactions:
          'MAO inhibitors, certain CYP2C8/BCRP-interacting drugs and heart-rate-lowering medicines require specialist review.',
      commonMistakes:
          'Skipping starter titration, simply continuing after a missed dose in the first 14 days, or doubling a missed dose.',
      specialPopulations:
          'Pregnancy risk persists after stopping; effective contraception is advised during treatment and for 3 months after discontinuation.',
    ),
    sections: [
      MedicationSection(
        title: 'Starter-pack lock',
        body:
            'Use 7-day titration: 0.23 mg days 1–4, 0.46 mg days 5–7, then the prescribed maintenance dose from day 8.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'First-14-days missed-dose lock',
        body:
            'If 1 or more doses are missed during the first 14 days, contact the prescriber and restart using a new 7-day starter pack. After day 14, resume at the next usual scheduled time without doubling.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'دواء disease-modifying لبعض حالات relapsing multiple sclerosis.',
      howToUseAr:
          'ابتلع الكبسولة كاملة وابدأ بالـ7-day starter pack حسب التدرج المكتوب؛ لا تبدأ maintenance مباشرة.',
      timingAr: 'مرة يوميًا، مع الطعام أو بدونه وفي وقت متقارب كل يوم.',
      importantAr:
          'إذا نسيت جرعة واحدة أو أكثر خلال أول 14 يومًا، اتصل بفريق MS لأنك تحتاج عادة restart بـstarter pack جديد. بعد أول 14 يومًا لا تضاعف الجرعة الفائتة.',
      commonActionableAr:
          'قد يحدث صداع أو ارتفاع ضغط، ويزداد خطر العدوى. أخبر الطبيب عن تغير الرؤية أو أعراض كبدية.',
      missedDoseAr:
          'أول 14 يومًا: restart titration بعد أي يوم مفقود حسب الفريق. بعد ذلك: خذ الجرعة التالية في موعدها المعتاد. لا تضاعف الجرعة.',
      seekHelpAr:
          'راجع عند عدوى شديدة، إغماء/بطء نبض شديد، تغير مفاجئ بالرؤية أو اصفرار/بول غامق.',
      teachBackAr:
          'ماذا تفعل إذا نسيت جرعة في اليوم 10؟ وهل يمكنك مضاعفة الجرعة في اليوم التالي؟',
    ),
  ),
  Medication(
    id: 'ofatumumab-kesimpta',
    familyId: 'cns',
    name: 'Ofatumumab (KESIMPTA) Subcutaneous Injection',
    subtitle: 'MS self-injection · weeks 0,1,2 then monthly from week 4',
    tags: ['Multiple sclerosis', 'MS', 'Ofatumumab', 'Injection', 'Device'],
    aliases: ['KESIMPTA Sensoready Pen', 'KESIMPTA prefilled syringe'],
    hasVisualGuide: true,
    sourceLabel:
        'DailyMed · KESIMPTA ofatumumab injection · revised Apr 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          '20 mg/0.4 mL subcutaneous injection by Sensoready Pen or prefilled syringe for relapsing forms of MS in adults.',
      foodTiming:
          'No meal relationship. Timing is calendar-based: Weeks 0, 1 and 2, then monthly starting at Week 4.',
      duration:
          'Chronic disease-modifying therapy while effective and safe.',
      formulationHandling:
          'First injection should be performed under healthcare-professional guidance. Inject subcutaneously into abdomen, thigh or outer upper arm, avoiding moles, scars, stretch marks and tender/bruised/red/scaly/hard skin. Allow device to reach room temperature about 15–30 minutes before use.',
      monitoring:
          'HBV screening, quantitative immunoglobulins, liver tests, vaccination status, infection risk and injection reactions.',
      interactions:
          'Live/live-attenuated vaccines are avoided during treatment and until B-cell repletion; immunosuppressive therapies require specialist review.',
      commonMistakes:
          'Skipping Week 3 nuance, starting monthly injections too early, shaking/freezing the device, injecting into abnormal skin or reusing a single-dose device.',
      specialPopulations:
          'Vaccination timing before initiation is important: live vaccines at least 4 weeks before and inactivated vaccines whenever possible at least 2 weeks before starting.',
    ),
    sections: [
      MedicationSection(
        title: 'Loading-to-monthly calendar lock',
        body:
            'Inject 20 mg at Weeks 0, 1 and 2, skip Week 3, then begin monthly dosing at Week 4.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Device/storage lock',
        body:
            'Refrigerate at 2–8°C, protect from light, do not freeze or shake. Before use allow 15–30 minutes to reach room temperature. If necessary, room-temperature storage up to 30°C is limited and date-tracked per label.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'حقن disease-modifying لبعض حالات relapsing multiple sclerosis.',
      howToUseAr:
          'أول حقنة تكون تحت إشراف مختص. احقن تحت الجلد في البطن أو الفخذ أو الجزء الخارجي من أعلى الذراع، وتجنب الجلد المتحسس/المتأذي والندبات والـstretch marks. الجهاز للاستعمال مرة واحدة فقط.',
      timingAr:
          'الجرعات الأولى في Week 0 وWeek 1 وWeek 2، لا توجد جرعة في Week 3، ثم جرعة شهرية بدءًا من Week 4.',
      importantAr:
          'أخرج القلم/السرنجة من الثلاجة واتركها تصل لحرارة الغرفة نحو 15–30 دقيقة قبل الحقن. لا ترجّها ولا تجمّدها. يحتاج العلاج فحوصات HBV وimmunoglobulins وكبد ولقاحات قبل البدء.',
      commonActionableAr:
          'قد يحدث injection-related reaction أو احمرار/ألم موضعي، وغالبًا تكون التفاعلات أوضح مع الجرعة الأولى.',
      missedDoseAr:
          'إذا فاتت حقنة، خذها بأسرع ما يمكن بدل الانتظار للموعد التالي، ثم أكمل الجرعات اللاحقة حسب الفواصل الموصى بها.',
      storageAr:
          'في الثلاجة 2–8°C داخل الكرتون للحماية من الضوء؛ لا تجمد ولا ترج. يمكن حفظها عند ≤30°C لفترة محدودة حسب تعليمات الملصق مع تسجيل تاريخ إخراجها.',
      seekHelpAr:
          'راجع عند تفاعل تحسسي شديد، صعوبة تنفس، عدوى شديدة أو أعراض كبدية.',
      teachBackAr:
          'ما جدول الأسابيع الأولى؟ أين يمكن الحقن؟ كم تنتظر بعد إخراج الجهاز من الثلاجة؟ وهل يجوز رجّه؟',
    ),
  ),
];
