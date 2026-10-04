import '../models/medication.dart';

const expandedMedications29 = <Medication>[
  Medication(
    id: 'vilazodone-tablets',
    familyId: 'cns',
    name: 'Vilazodone Tablets',
    subtitle: 'MDD · once daily with food · titration required',
    tags: ['Depression', 'Antidepressant', 'Vilazodone', 'With food'],
    aliases: ['Viibryd-type', 'Vilazodone HCl'],
    sourceLabel:
        'DailyMed · Vilazodone hydrochloride tablets · current verified labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Oral serotonergic antidepressant used for major depressive disorder in adults.',
      foodTiming:
          'Take once daily with food. Food is clinically important for exposure and should not be treated as optional.',
      duration:
          'Usually months or longer when effective; treatment duration is individualized and discontinuation should be gradual.',
      formulationHandling:
          'Use the prescribed tablet strength. Titration is required rather than starting directly at the target dose.',
      monitoring:
          'Mood/suicidality early in treatment or after dose changes, serotonin-syndrome symptoms, bleeding risk, sodium in susceptible patients and activation/mania in bipolar-spectrum disease.',
      interactions:
          'MAO inhibitors are contraindicated. Strong CYP3A4 inhibitors can require a lower vilazodone maximum; other serotonergic or bleeding-risk medicines require review.',
      commonMistakes:
          'Taking it fasting, skipping the titration schedule, stopping suddenly, or assuming a missed dose should be doubled.',
      specialPopulations:
          'Screen for bipolar disorder before initiation; pregnancy and hepatic/renal context should be reviewed individually.',
    ),
    sections: [
      MedicationSection(
        title: 'Food lock',
        body:
            'Vilazodone is dosed once daily with food. Do not convert this to a food-optional antidepressant instruction.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Titration lock',
        body:
            'Label titration starts at 10 mg once daily for 7 days, then 20 mg once daily; further increase to 40 mg requires at least another 7 days.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد اكتئاب لعلاج major depressive disorder عند البالغين.',
      howToUseAr:
          'خذ الجرعة مرة يوميًا حسب خطة الزيادة التدريجية؛ لا تبدأ مباشرة بجرعة عالية ولا توقفه فجأة.',
      timingAr: 'خذ vilazodone مع الطعام كل يوم.',
      importantAr:
          'أخبر الصيدلي عن أي أدوية serotonergic أو MAOI. راقب تغير المزاج أو زيادة القلق/الاندفاع خصوصًا في البداية أو بعد تغيير الجرعة.',
      commonActionableAr:
          'الغثيان أو الإسهال قد يحدثان خصوصًا في البداية؛ تناوله مع الطعام كما هو مطلوب وقد تتحسن الأعراض مع الوقت.',
      missedDoseAr:
          'إذا اقترب موعد الجرعة التالية فتجاوز الفائتة؛ لا تضاعف الجرعة.',
      seekHelpAr:
          'اطلب المساعدة عند أفكار انتحارية جديدة/متفاقمة، أعراض serotonin syndrome، نزف غير معتاد أو أعراض mania واضحة.',
      teachBackAr:
          'هل ستأخذ vilazodone مع الطعام أم بدونه؟ وهل تبدأ مباشرة بالجرعة النهائية؟',
    ),
  ),
  Medication(
    id: 'asenapine-sublingual',
    familyId: 'cns',
    name: 'Asenapine Sublingual Tablets',
    subtitle: 'Schizophrenia/bipolar I · under tongue · no food/drink 10 min',
    tags: ['Schizophrenia', 'Bipolar I', 'Antipsychotic', 'Sublingual'],
    aliases: ['SAPHRIS', 'Asenapine SL'],
    sourceLabel:
        'DailyMed · SAPHRIS / asenapine sublingual tablets · current verified labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Sublingual atypical antipsychotic used for schizophrenia and bipolar I disorder in labeled populations.',
      foodTiming:
          'Place under the tongue and allow to dissolve completely. Do not eat or drink for 10 minutes after each dose.',
      duration:
          'Usually longer-term when effective; exact dose and duration depend on diagnosis and response.',
      formulationHandling:
          'Do not split, crush, chew or swallow the sublingual tablet. Leave it under the tongue until dissolved.',
      monitoring:
          'Sedation, orthostasis, metabolic parameters, abnormal movements, oral mucosal reactions and neuroleptic malignant syndrome symptoms.',
      interactions:
          'Other CNS depressants and hypotensive medicines can worsen sedation/orthostasis; review QT-risk and CYP-interacting medicines when relevant.',
      commonMistakes:
          'Swallowing the tablet, chewing it, drinking water immediately afterward, or eating within the first 10 minutes.',
      specialPopulations:
          'Contraindicated in severe hepatic impairment and not approved for dementia-related psychosis.',
    ),
    sections: [
      MedicationSection(
        title: 'Sublingual technique lock',
        body:
            'Place under the tongue, allow complete dissolution, and do not split, crush, chew or swallow.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: '10-minute lock',
        body:
            'Avoid all food and drink for 10 minutes after each dose to preserve absorption.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يستخدم لعلاج schizophrenia وبعض حالات bipolar I.',
      howToUseAr:
          'ضع الحبة تحت اللسان واتركها تذوب بالكامل. لا تقسّمها أو تسحقها أو تمضغها أو تبتلعها مباشرة.',
      timingAr:
          'بعد وضع الحبة لا تأكل ولا تشرب أي شيء لمدة 10 دقائق.',
      importantAr:
          'قد يحدث خدر/تغير إحساس بالفم أو نعاس ودوخة؛ لا تقد السيارة حتى تعرف تأثيره عليك.',
      commonActionableAr:
          'قد تشعر بطعم غير معتاد أو خدر مؤقت في الفم. راجع الطبيب إذا ظهرت قرحة/تورم أو تفاعل فموي شديد.',
      missedDoseAr:
          'لا تضاعف الجرعة الفائتة؛ ارجع للجدول المعتاد حسب الخطة.',
      seekHelpAr:
          'اطلب المساعدة عند حرارة مع تيبس وارتباك، تورم الفم/اللسان أو صعوبة تنفس، أو حركات لا إرادية شديدة.',
      teachBackAr:
          'أرني كيف ستضع الحبة. هل ستبتلعها؟ وكم دقيقة تنتظر قبل الأكل أو الشرب؟',
    ),
  ),
  Medication(
    id: 'phenytoin-extended-capsules',
    familyId: 'cns',
    name: 'Extended Phenytoin Sodium Capsules',
    subtitle: 'Epilepsy · sodium salt · formulation switching requires monitoring',
    tags: ['Epilepsy', 'Phenytoin', 'Extended release', 'Narrow therapeutic index'],
    aliases: ['Dilantin extended capsules', 'Phenytek-type'],
    sourceLabel:
        'DailyMed · Extended phenytoin sodium capsules · revised 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Extended-release phenytoin sodium capsules for seizure disorders; dose is individualized using clinical response and serum concentrations.',
      foodTiming:
          'Current verified labeling does not establish a universal meal anchor. Keep administration conditions consistent when possible rather than inventing a meal rule.',
      duration:
          'Usually chronic antiseizure therapy; abrupt withdrawal should be avoided.',
      formulationHandling:
          'Extended capsules contain phenytoin sodium, whereas oral suspension and chewable tablets use phenytoin free acid. These forms differ by about 8% in drug content and may require dose adjustment and level monitoring when switching.',
      monitoring:
          'Serum phenytoin concentration, seizure control, neurologic toxicity, oral health, skin reactions and unbound concentration in renal/hepatic disease or hypoalbuminemia.',
      interactions:
          'Phenytoin is a major enzyme inducer with many interactions, including reduced hormonal contraceptive efficacy and interactions with anticoagulants and other antiseizure drugs.',
      commonMistakes:
          'Switching capsule/suspension/chewable formulations by the same milligram dose without monitoring, changing brands/formulations repeatedly, or stopping abruptly.',
      specialPopulations:
          'Renal/hepatic disease and low albumin require interpretation of unbound rather than total concentrations when clinically appropriate.',
    ),
    sections: [
      MedicationSection(
        title: 'Formulation conversion lock',
        body:
            'Suspension/chewable products use phenytoin free acid, while extended capsules use phenytoin sodium. The approximately 8% content difference can matter clinically.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Once-daily caveat',
        body:
            'Once-daily 300 mg extended-capsule dosing is only an option in selected adults already controlled on 300 mg/day; do not generalize once-daily dosing to all phenytoin regimens.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'دواء للتحكم بالنوبات ويحتاج جرعة دقيقة ومتابعة لأن مجاله العلاجي ضيق.',
      howToUseAr:
          'خذ نفس formulation والجرعة كما وُصفت لك. لا تبدل بين capsule وsuspension أو chewable بنفس عدد الـmg من نفسك.',
      timingAr:
          'الملصق الموثق لا يفرض قاعدة طعام عامة؛ خذه بنفس الطريقة يوميًا وحافظ على ثبات روتينك.',
      importantAr:
          'لا توقف phenytoin فجأة. أخبر الصيدلي قبل أي دواء جديد لأن تداخلاته كثيرة، وقد يقلل فعالية موانع الحمل الهرمونية.',
      commonActionableAr:
          'قد يحدث دوار/عدم توازن أو تضخم اللثة؛ اهتم بنظافة الفم والأسنان وراجع الجرعة إذا ظهرت أعراض سمية عصبية.',
      missedDoseAr:
          'لا تضاعف جرعة فائتة؛ اتبع خطة الصرع الخاصة بك أو تواصل مع الصيدلي إذا لم تكن متأكدًا.',
      seekHelpAr:
          'اطلب المساعدة عند طفح شديد، تورم/صعوبة تنفس، ترنح شديد أو زيادة واضحة بالنوبات.',
      teachBackAr:
          'هل يمكنك تبديل capsule إلى suspension بنفس الـmg؟ ولماذا يجب إخبار الصيدلي قبل أي دواء جديد؟',
    ),
  ),
  Medication(
    id: 'pramipexole-er',
    familyId: 'cns',
    name: 'Pramipexole Extended-Release Tablets',
    subtitle: 'Parkinson · once daily · food flexible · swallow whole',
    tags: ['Parkinson', 'Dopamine agonist', 'Pramipexole', 'Extended release'],
    aliases: ['Pramipexole ER', 'Mirapex ER-type'],
    sourceLabel:
        'DailyMed · Pramipexole dihydrochloride extended-release tablets · current labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily extended-release dopamine agonist for Parkinson disease.',
      foodTiming:
          'Take once daily with or without food.',
      duration:
          'Chronic individualized therapy; titration is gradual and discontinuation should also be gradual.',
      formulationHandling:
          'Swallow ER tablets whole. Do not chew, crush or divide.',
      monitoring:
          'Sudden sleep episodes, orthostatic hypotension, impulse-control disorders, hallucinations, dyskinesia and renal function for dosing.',
      interactions:
          'Other sedating or hypotensive medicines can worsen impairment; renal function strongly affects exposure.',
      commonMistakes:
          'Splitting the ER tablet, using it for restless legs without recognizing this ER product is a Parkinson formulation, driving despite sleep attacks, or stopping suddenly.',
      specialPopulations:
          'Significant interruption may require re-titration. Renal impairment requires product-specific adjustment.',
    ),
    sections: [
      MedicationSection(
        title: 'ER administration',
        body:
            'Take once daily with or without food and swallow whole; do not chew, crush or divide.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Sleep/impulse-control lock',
        body:
            'Sudden sleep during daily activities and new compulsive behaviors can occur and should be actively screened.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'dopamine agonist لعلاج أعراض Parkinson disease.',
      howToUseAr:
          'خذ حبة ER مرة يوميًا وابتلعها كاملة؛ لا تمضغها أو تسحقها أو تقسّمها.',
      timingAr: 'يمكن أخذها مع الطعام أو بدونه وفي وقت ثابت يوميًا.',
      importantAr:
          'قد تسبب نومًا مفاجئًا حتى دون إنذار. أخبر الطبيب إذا ظهرت رغبات اندفاعية جديدة مثل القمار أو الشراء أو زيادة النشاط الجنسي.',
      commonActionableAr:
          'قد يحدث غثيان أو دوخة عند الوقوف أو نعاس؛ انهض ببطء وتجنب القيادة إذا شعرت بالنعاس.',
      missedDoseAr:
          'لا تضاعف الجرعة. إذا حدث انقطاع مهم في العلاج فقد تحتاج إعادة titration بدل العودة مباشرة للجرعة السابقة.',
      seekHelpAr:
          'راجع عند نوم مفاجئ أثناء القيادة/النشاط، hallucinations شديدة، إغماء أو اندفاعات خطرة جديدة.',
      teachBackAr:
          'هل يجوز تقسيم ER؟ وماذا ستفعل إذا بدأت تغفو فجأة خلال النهار؟',
    ),
  ),
  Medication(
    id: 'opicapone-ongentys',
    familyId: 'cns',
    name: 'Opicapone (ONGENTYS)',
    subtitle: 'Parkinson off episodes · bedtime · fasting 1 h before/after',
    tags: ['Parkinson', 'COMT inhibitor', 'Opicapone', 'Bedtime', 'Empty stomach'],
    aliases: ['ONGENTYS 50 mg', 'Opicapone'],
    sourceLabel:
        'DailyMed · ONGENTYS opicapone capsules · current labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily COMT inhibitor used as adjunct to levodopa/carbidopa in Parkinson disease with off episodes.',
      foodTiming:
          'Take once daily at bedtime. Do not eat for 1 hour before and for at least 1 hour after the dose.',
      duration:
          'Chronic adjunctive therapy while effective and tolerated.',
      formulationHandling:
          'Use the prescribed capsule strength. If a dose is missed, take the next dose at the scheduled time the next day.',
      monitoring:
          'Dyskinesia, hallucinations/psychosis, orthostasis, excessive sleepiness and impulse-control symptoms.',
      interactions:
          'Nonselective MAO inhibitors are contraindicated; levodopa dose may need adjustment if dopaminergic adverse effects increase.',
      commonMistakes:
          'Taking with a bedtime snack, doubling the next day after a missed dose, or failing to recognize new dyskinesia/hallucinations as potentially treatment-related.',
      specialPopulations:
          'Moderate hepatic impairment uses the lower 25 mg dose; avoid in severe hepatic impairment.',
    ),
    sections: [
      MedicationSection(
        title: 'Bedtime fasting lock',
        body:
            'Take at bedtime with no food for 1 hour before and at least 1 hour after the dose.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Missed-dose lock',
        body:
            'If missed, do not catch up; take the next scheduled dose the following day.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يُضاف إلى levodopa/carbidopa لتقليل off episodes في Parkinson.',
      howToUseAr: 'خذ الكبسولة مرة واحدة يوميًا عند النوم حسب الجرعة الموصوفة.',
      timingAr:
          'عند النوم، ولا تأكل لمدة ساعة قبل الجرعة ولا لمدة ساعة على الأقل بعدها.',
      importantAr:
          'قد يزيد dyskinesia أو hallucinations بسبب زيادة تأثير levodopa؛ أخبر الطبيب إذا ظهرت أو ساءت.',
      commonActionableAr:
          'قد يحدث إمساك أو دوخة أو حركات لا إرادية؛ انهض ببطء وراجع الجرعة إذا زادت dyskinesia.',
      missedDoseAr:
          'إذا نسيت الجرعة فتجاوزها وخذ الجرعة التالية في موعدها في اليوم التالي؛ لا تضاعف.',
      seekHelpAr:
          'راجع عند hallucinations شديدة، إغماء، نوم مفاجئ خطير أو حركات لا إرادية شديدة.',
      teachBackAr:
          'متى ستأخذ ONGENTYS؟ وكم ساعة ستتجنب الطعام حول الجرعة؟',
    ),
  ),
  Medication(
    id: 'donepezil-odt',
    familyId: 'cns',
    name: 'Donepezil Orally Disintegrating Tablets (ODT)',
    subtitle: 'Alzheimer · evening · with/without food · dissolve on tongue',
    tags: ['Alzheimer', 'Donepezil', 'ODT', 'Evening'],
    aliases: ['ARICEPT ODT', 'Donepezil ODT'],
    sourceLabel:
        'DailyMed · ARICEPT / ARICEPT ODT · current verified labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Orally disintegrating donepezil for Alzheimer dementia.',
      foodTiming:
          'Take in the evening just before retiring; may be taken with or without food.',
      duration:
          'Chronic symptomatic therapy while benefit outweighs adverse effects.',
      formulationHandling:
          'Allow ODT to dissolve on the tongue, then follow with water. Do not transfer the handling instructions of the 23 mg film-coated tablet to ODT.',
      monitoring:
          'Heart rate/syncope, weight/appetite, nausea/vomiting, GI bleeding risk and sleep disturbance.',
      interactions:
          'Other bradycardic or cholinergic drugs can increase adverse effects; NSAID use can increase GI risk.',
      commonMistakes:
          'Swallowing the ODT dry like a conventional tablet, confusing ODT with the 23 mg tablet, or ignoring syncope/bradycardia.',
      specialPopulations:
          'Older adults with low body weight or conduction disease require closer monitoring.',
    ),
    sections: [
      MedicationSection(
        title: 'ODT technique',
        body:
            'Allow the orally disintegrating tablet to dissolve on the tongue and follow with water.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Evening timing',
        body:
            'Current ARICEPT labeling directs evening dosing just before retiring, with or without food.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد على أعراض الذاكرة والإدراك في Alzheimer disease.',
      howToUseAr:
          'ضع ODT على اللسان واتركها تذوب ثم اشرب ماء بعدها.',
      timingAr:
          'تؤخذ مساءً قبل النوم مباشرة، ويمكن مع الطعام أو بدونه.',
      importantAr:
          'قد يبطئ النبض أو يسبب دوخة/إغماء عند بعض المرضى؛ أخبر الطبيب إذا تكرر الإغماء.',
      commonActionableAr:
          'قد يحدث غثيان أو إسهال أو نقص شهية. راقب الوزن إذا كان المريض ضعيف البنية.',
      missedDoseAr:
          'لا تضاعف الجرعة الفائتة؛ خذ الجرعة التالية في موعدها المعتاد.',
      seekHelpAr:
          'راجع عند إغماء، بطء نبض واضح، قيء مستمر أو براز أسود/نزف هضمي.',
      teachBackAr:
          'كيف ستأخذ ODT؟ ومتى في اليوم؟ وهل الطعام ضروري؟',
    ),
  ),
  Medication(
    id: 'memantine-xr',
    familyId: 'cns',
    name: 'Memantine Extended-Release Capsules',
    subtitle: 'Moderate-severe Alzheimer · once daily · applesauce option',
    tags: ['Alzheimer', 'Memantine', 'Extended release', 'Applesauce'],
    aliases: ['NAMENDA XR-type', 'Memantine ER/XR'],
    sourceLabel:
        'DailyMed · Memantine hydrochloride extended-release capsules · current verified labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily extended-release memantine for moderate-to-severe Alzheimer dementia.',
      foodTiming:
          'May be taken with or without food.',
      duration:
          'Chronic symptomatic therapy while benefit persists.',
      formulationHandling:
          'Swallow whole or open and sprinkle the entire capsule contents on applesauce and swallow. Do not divide the contents, chew or crush.',
      monitoring:
          'Cognition/function, dizziness, constipation, blood pressure and renal function for dose selection.',
      interactions:
          'Urine-alkalinizing conditions/drugs can reduce elimination; other NMDA antagonists such as amantadine or ketamine warrant caution.',
      commonMistakes:
          'Dividing capsule beads between doses, chewing the beads, or restarting the prior high dose after several missed days.',
      specialPopulations:
          'Severe renal impairment requires a lower maximum dose.',
    ),
    sections: [
      MedicationSection(
        title: 'Applesauce technique',
        body:
            'The capsule may be opened and the entire contents sprinkled on applesauce; consume all at once and do not divide the dose.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Restart lock',
        body:
            'After several missed days, lower-dose restart and re-titration may be necessary rather than resuming the previous dose.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يعالج أعراض moderate-to-severe Alzheimer dementia.',
      howToUseAr:
          'ابتلع كبسولة XR كاملة، أو افتحها وانثر كل المحتوى على applesauce وتناول الكمية كاملة. لا تقسّم الحبيبات ولا تمضغها أو تسحقها.',
      timingAr: 'مرة يوميًا، مع الطعام أو بدونه.',
      importantAr:
          'إذا توقفت عدة أيام لا ترجع تلقائيًا لنفس الجرعة؛ قد تحتاج إعادة titration من جرعة أقل.',
      commonActionableAr:
          'قد يحدث دوار أو إمساك؛ انتبه للسقوط خصوصًا لدى كبار السن.',
      missedDoseAr:
          'إذا نسيت جرعة واحدة فلا تضاعف التالية. إذا فاتت عدة أيام اتصل بالطبيب قبل العودة.',
      seekHelpAr:
          'راجع عند ارتباك شديد جديد، دوخة/سقوط متكرر أو تغير واضح في الوظيفة بعد تعديل الجرعة.',
      teachBackAr:
          'إذا فتحت الكبسولة، هل يجوز تقسيم الحبيبات؟ وماذا تفعل بعد عدة أيام بدون الدواء؟',
    ),
  ),
  Medication(
    id: 'dimethyl-fumarate-dr',
    familyId: 'cns',
    name: 'Dimethyl Fumarate Delayed-Release Capsules',
    subtitle: 'Relapsing MS · BID · food may reduce flushing · swallow whole',
    tags: ['Multiple sclerosis', 'MS', 'Dimethyl fumarate', 'Delayed release'],
    aliases: ['TECFIDERA-type', 'Dimethyl fumarate DR'],
    sourceLabel:
        'DailyMed · Dimethyl fumarate delayed-release capsules · current verified labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Delayed-release oral disease-modifying therapy for relapsing forms of MS in adults.',
      foodTiming:
          'May be taken with or without food. Taking with food may reduce flushing.',
      duration:
          'Chronic disease-modifying therapy while effective and safe.',
      formulationHandling:
          'Swallow capsules whole and intact. Do not crush, chew or sprinkle capsule contents on food.',
      monitoring:
          'CBC/lymphocytes, liver tests, infection/PML vigilance and severe GI symptoms.',
      interactions:
          'Avoid duplicating therapy with another fumarate unless specifically directed. Aspirin pretreatment for flushing is a clinician-directed option, not a default self-care instruction.',
      commonMistakes:
          'Opening the DR capsule, stopping after flushing without counseling, or ignoring required lymphocyte/liver monitoring.',
      specialPopulations:
          'Serious infection, persistent lymphopenia or suspected PML requires specialist review and possible interruption.',
    ),
    sections: [
      MedicationSection(
        title: 'Dose + food lock',
        body:
            'Label dosing starts at 120 mg twice daily for 7 days, then 240 mg twice daily. Food is optional but can reduce flushing.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'DR handling',
        body:
            'Swallow whole and intact; do not crush, chew or sprinkle contents on food.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'دواء disease-modifying لبعض حالات relapsing multiple sclerosis.',
      howToUseAr:
          'ابتلع الكبسولة كاملة. لا تفتحها أو تسحقها أو تمضغها أو تنثر محتواها على الطعام.',
      timingAr:
          'مرتين يوميًا حسب الخطة، ويمكن مع الطعام أو بدونه. الطعام قد يساعد على تقليل flushing.',
      importantAr:
          'يحتاج CBC/lymphocytes وفحوصات كبد ومراقبة العدوى حسب الخطة.',
      commonActionableAr:
          'flushing والغثيان/ألم البطن قد يحدثان خاصة في البداية؛ الطعام قد يقلل flushing.',
      missedDoseAr:
          'لا تضاعف جرعة فائتة؛ ارجع للجدول المعتاد حسب خطة فريق MS.',
      seekHelpAr:
          'راجع عند عدوى شديدة، ضعف/تغير رؤية أو ارتباك عصبي جديد متفاقم، أو ألم/نزف هضمي شديد.',
      teachBackAr:
          'هل يجوز فتح الكبسولة؟ وهل الطعام مطلوب أم اختياري؟ وما الفائدة المحتملة من أخذه مع الطعام؟',
    ),
  ),
  Medication(
    id: 'teriflunomide-tablets',
    familyId: 'cns',
    name: 'Teriflunomide Tablets',
    subtitle: 'Relapsing MS · once daily · food independent · long elimination',
    tags: ['Multiple sclerosis', 'MS', 'Teriflunomide', 'High risk'],
    aliases: ['AUBAGIO-type', 'Teriflunomide 7 mg', 'Teriflunomide 14 mg'],
    sourceLabel:
        'DailyMed · Teriflunomide tablets · revised Aug 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily pyrimidine-synthesis inhibitor for relapsing forms of MS in adults.',
      foodTiming:
          'Take once daily with or without food.',
      duration:
          'Chronic disease-modifying therapy while effective and safe; drug can remain in the body for a prolonged period after stopping.',
      formulationHandling:
          'Use the prescribed 7 mg or 14 mg tablet once daily. Do not self-initiate accelerated elimination therapy.',
      monitoring:
          'Liver enzymes/bilirubin, CBC, latent TB screening before treatment, blood pressure, infection symptoms and pregnancy status when relevant.',
      interactions:
          'Current leflunomide treatment is contraindicated; hepatotoxic and immunosuppressive medicines require review.',
      commonMistakes:
          'Assuming stopping the tablet removes the drug quickly, ignoring pregnancy risk, or missing liver monitoring during the first 6 months.',
      specialPopulations:
          'Contraindicated in pregnancy and severe hepatic impairment. Accelerated elimination is used when rapid drug removal is clinically necessary.',
    ),
    sections: [
      MedicationSection(
        title: 'Long-elimination lock',
        body:
            'Teriflunomide can persist for many months after stopping. When rapid elimination is required, the label uses an 11-day cholestyramine or activated-charcoal procedure under clinician direction.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Pregnancy/liver lock',
        body:
            'Exclude pregnancy before treatment in patients who can become pregnant and monitor liver tests closely, especially during the first 6 months.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'دواء disease-modifying لبعض حالات relapsing multiple sclerosis.',
      howToUseAr: 'خذ 7 mg أو 14 mg مرة يوميًا حسب الوصفة.',
      timingAr: 'مرة يوميًا، مع الطعام أو بدونه.',
      importantAr:
          'الدواء يبقى في الجسم مدة طويلة حتى بعد إيقافه. إذا حدث حمل أو سمية كبدية أو سبب آخر يستلزم إخراجه سريعًا، يستخدم الفريق الطبي إجراء accelerated elimination خاص؛ لا تنفذه من نفسك.',
      commonActionableAr:
          'قد يحدث غثيان أو تساقط شعر أو ارتفاع إنزيمات الكبد/الضغط؛ الالتزام بالفحوصات مهم.',
      missedDoseAr:
          'إذا نسيت الجرعة فلا تضاعف التالية؛ استمر بالجدول اليومي المعتاد.',
      seekHelpAr:
          'راجع فورًا عند اصفرار/بول غامق، طفح جلدي شديد، عدوى شديدة أو إذا حدث حمل أثناء العلاج.',
      teachBackAr:
          'هل الطعام يهم مع teriflunomide؟ وهل يختفي الدواء سريعًا من الجسم بمجرد إيقافه؟',
    ),
  ),
  Medication(
    id: 'fingolimod-capsules',
    familyId: 'cns',
    name: 'Fingolimod Capsules',
    subtitle: 'Relapsing MS · once daily · first-dose cardiac monitoring',
    tags: ['Multiple sclerosis', 'MS', 'Fingolimod', 'First dose monitoring'],
    aliases: ['GILENYA-type', 'Fingolimod 0.5 mg'],
    sourceLabel:
        'DailyMed · Fingolimod capsules · current 2025-2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily S1P receptor modulator for relapsing forms of MS in labeled adults and pediatric patients.',
      foodTiming:
          'Take once daily with or without food.',
      duration:
          'Chronic disease-modifying therapy; interruption and restart can require renewed cardiac monitoring.',
      formulationHandling:
          'Use the prescribed capsule strength consistently. Initial dose is given under first-dose cardiac monitoring.',
      monitoring:
          'Before/after first dose ECG, pulse/BP for at least 6 hours, infection risk, CBC, liver function, ophthalmic monitoring for macular edema and blood pressure.',
      interactions:
          'Heart-rate-slowing and AV-conduction-slowing medicines, QT-prolonging drugs and immunosuppressants require specialist review.',
      commonMistakes:
          'Starting the first dose at home without monitoring, restarting after a long interruption without checking whether first-dose monitoring is required, or ignoring visual symptoms/infection risk.',
      specialPopulations:
          'Restart thresholds depend on when in therapy the interruption occurs: early-treatment interruptions can trigger repeat first-dose monitoring after much shorter gaps.',
    ),
    sections: [
      MedicationSection(
        title: 'First-dose monitoring lock',
        body:
            'Initial dosing requires at least 6 hours of bradycardia monitoring with pulse/BP hourly and ECG before and at the end of observation.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Restart thresholds',
        body:
            'Repeat first-dose monitoring after interruption of ≥1 day during the first 2 weeks, >7 days during weeks 3–4, or >14 days after the first month.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'دواء disease-modifying لبعض حالات relapsing multiple sclerosis.',
      howToUseAr:
          'خذ الكبسولة مرة يوميًا حسب الخطة، لكن الجرعة الأولى ليست جرعة منزلية عادية؛ تحتاج مراقبة قلبية مخصصة.',
      timingAr: 'مرة يوميًا، مع الطعام أو بدونه.',
      importantAr:
          'إذا انقطع العلاج لا تبدأه من نفسك. حسب مدة الانقطاع ومرحلة العلاج قد تحتاج إعادة first-dose monitoring لمدة 6 ساعات.',
      commonActionableAr:
          'قد يبطئ النبض خصوصًا بعد الجرعة الأولى، وقد يزيد خطر العدوى. أخبر الطبيب عن دوخة/إغماء أو أعراض عدوى.',
      missedDoseAr:
          'لا تضاعف الجرعة. تواصل مع فريق MS قبل استئناف العلاج إذا كان الانقطاع يقترب من حدود restart monitoring.',
      seekHelpAr:
          'اطلب المساعدة عند إغماء/بطء نبض شديد، ضيق نفس، عدوى شديدة، أو تغير مفاجئ في الرؤية.',
      teachBackAr:
          'هل يمكنك أخذ أول جرعة وحدك في المنزل؟ وماذا تفعل إذا انقطع العلاج عدة أيام؟',
    ),
  ),
];
