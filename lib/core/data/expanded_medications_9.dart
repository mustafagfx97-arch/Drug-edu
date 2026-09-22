import '../models/medication.dart';

const expandedMedications9 = <Medication>[
  Medication(
    id: 'aspirin-81-antiplatelet-dr',
    familyId: 'anticoagulation',
    name: 'Aspirin 81 mg Delayed-Release (Antiplatelet Use)',
    subtitle: 'Low-dose delayed-release aspirin · clinician-directed cardiovascular/stroke prevention',
    tags: ['Antiplatelet', 'Aspirin', '81 mg', 'Delayed release', 'Bleeding'],
    aliases: ['Low-dose aspirin', 'Baby aspirin', 'Aspirin 81 mg EC'],
    useProfile: MedicationUseProfile(
      route:
          'Oral delayed-release aspirin 81 mg used when specifically recommended as part of a cardiovascular or cerebrovascular prevention plan.',
      foodTiming:
          'Take on the prescribed schedule. Food may reduce stomach upset but does not remove the risk of gastrointestinal bleeding.',
      duration:
          'Often long term when used for secondary prevention, but indication and duration must be clinician-directed. Do not self-start low-dose aspirin solely because it is sold OTC.',
      formulationHandling:
          'This entry is for the delayed-release 81 mg product. Delayed-release aspirin is not a substitute when immediate aspirin effect is required; do not use this product for rapid symptom relief.',
      monitoring:
          'Bleeding/bruising, black or bloody stool, vomiting blood, new anemia symptoms, renal risk when combined with NSAIDs, and whether aspirin remains indicated as the antithrombotic plan changes.',
      interactions:
          'Other NSAIDs, anticoagulants, antiplatelets, corticosteroids and heavy alcohol use can increase bleeding risk. Check all OTC products for duplicate aspirin/NSAIDs.',
      commonMistakes:
          'Self-starting aspirin for “prevention” without reviewing benefit versus bleeding risk, assuming enteric/delayed release eliminates GI bleeding, doubling aspirin through combination OTC products, or stopping prescribed aspirin around a procedure without a plan.',
      specialPopulations:
          'Children and teenagers with viral illness should not use aspirin because of Reye syndrome risk. Pregnancy, prior GI bleeding/ulcer, aspirin-sensitive asthma and concurrent antithrombotic therapy require individualized review.',
    ),
    sourceLabel:
        'DailyMed · Aspirin Low Dose 81 mg delayed-release tablets · updated Jul 2026 · OTC label plus clinician-directed antiplatelet use',
    sections: [
      MedicationSection(
        title: 'Do not self-start for prevention',
        body:
            'OTC availability does not mean every adult should take daily aspirin. The cardiovascular/stroke-prevention indication must be individualized because bleeding risk can outweigh benefit.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Delayed-release lock',
        body:
            'The 81 mg delayed-release product acts too slowly for situations that require immediate aspirin effect. Do not substitute it for an immediate-release/chewable aspirin protocol.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'إذا وصفها الطبيب كـantiplatelet فهي تساعد على تقليل تكوّن الجلطات في حالات قلبية/وعائية محددة.',
      howToUseAr:
          'خذ 81 mg delayed-release حسب الخطة الموصوفة وفي وقت ثابت. لا تضف aspirin آخر أو NSAID من نفسك.',
      timingAr:
          'ليس المهم صباحًا أو مساءً بقدر الثبات على التوقيت الموصوف. هذا الشكل delayed-release ليس مناسبًا عندما نحتاج مفعول aspirin سريعًا.',
      importantAr:
          'لا تبدأ aspirin يوميًا للوقاية من نفسك لمجرد أنه OTC، ولا توقفه قبل عملية/تنظير أو بعد دعامة بدون خطة من الطبيب.',
      commonActionableAr:
          'قد يزيد الكدمات أو نزف اللثة/الأنف. وجود غلاف enteric/delayed-release لا يلغي احتمال نزف المعدة.',
      missedDoseAr:
          'إذا كانت جرعة يومية ونسيتها، لا تأخذ جرعتين معًا. اتبع تعليمات خطتك إذا اقترب موعد الجرعة التالية.',
      storageAr:
          'احفظه في العبوة الأصلية بدرجة حرارة الغرفة وبعيدًا عن الرطوبة والحرارة.',
      seekHelpAr:
          'اطلب تقييمًا عاجلًا عند براز أسود أو دموي، قيء دموي، نزف لا يتوقف، دوخة/إغماء شديد، أو تحسس مع صفير/تورم.',
      teachBackAr:
          'لماذا لا نبدأ aspirin يوميًا من أنفسنا؟ وهل delayed-release 81 mg بديل مناسب إذا احتجنا تأثيرًا سريعًا؟',
    ),
  ),
  Medication(
    id: 'ticagrelor-brilinta',
    familyId: 'anticoagulation',
    name: 'Ticagrelor (BRILINTA)',
    subtitle: 'P2Y12 antiplatelet · indication-specific 90 mg / 60 mg twice-daily regimens',
    tags: ['Antiplatelet', 'P2Y12', 'ACS', 'PCI', 'Stroke/TIA', 'Bleeding'],
    aliases: ['Brilinta', 'Ticagrelor'],
    useProfile: MedicationUseProfile(
      route:
          'Oral P2Y12 platelet inhibitor. Current U.S. labeling includes ACS/history of MI, selected CAD without prior MI/stroke, and short-term acute ischemic stroke/TIA regimens.',
      foodTiming:
          'Take twice daily on the prescribed indication-specific schedule, with or without food.',
      duration:
          'Highly indication-specific: long term in selected coronary disease/previous MI pathways versus up to 30 days for the labeled acute ischemic stroke/TIA pathway.',
      formulationHandling:
          'Tablets may be swallowed whole. If unable to swallow, BRILINTA may be crushed, mixed with water and drunk; the mixture may also be given through a nasogastric tube CH8 or larger. Do not use another oral P2Y12 inhibitor at the same time.',
      monitoring:
          'Bleeding, dyspnea, pulse/bradyarrhythmia symptoms, adherence after PCI/stent, and whether concomitant aspirin remains appropriate.',
      interactions:
          'Avoid strong CYP3A inhibitors/inducers. Simvastatin or lovastatin doses above 40 mg/day increase statin adverse-effect risk; rosuvastatin exposure may also increase. Opioids can reduce ticagrelor exposure.',
      commonMistakes:
          'Taking once daily instead of twice daily, doubling a missed dose, stopping after a stent without cardiology input, using more aspirin than the prescribed maintenance dose, or switching indication/strength without reviewing the plan.',
      specialPopulations:
          'Avoid in severe hepatic impairment. Patients with clinically important bradyarrhythmias or central sleep-apnea symptoms require review. Surgery timing is clinician-directed because interruption increases thrombotic risk.',
    ),
    sourceLabel:
        'DailyMed · BRILINTA (ticagrelor) · current 2026 labeling · indication-specific regimens, aspirin 75–100 mg, crush/NG, surgery interruption guidance',
    sections: [
      MedicationSection(
        title: 'Do not stop after stent/ACS on your own',
        body:
            'Premature discontinuation increases myocardial infarction, stroke and death risk. If interruption is needed for major-bleeding-risk surgery, current labeling advises a clinician-directed interruption about 5 days beforehand when possible and restarting as soon as hemostasis is achieved.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Aspirin co-therapy lock',
        body:
            'When aspirin is part of the BRILINTA regimen, current labeling generally uses a maintenance aspirin dose of 75–100 mg daily unless the clinician intentionally chooses another strategy (including selected post-PCI ticagrelor monotherapy). Do not change aspirin dose yourself.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Dyspnea counseling',
        body:
            'Shortness of breath is common and often mild/moderate, but new, prolonged or worsening dyspnea still requires assessment rather than being automatically attributed to ticagrelor.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يمنع الصفائح من التكتل لتقليل الجلطات في حالات قلبية محددة، وبعد بعض الدعامات، وفي بعض حالات stroke/TIA الحادة حسب الاستطباب.',
      howToUseAr:
          'خذه مرتين يوميًا حسب القوة والاستطباب الموصوفين. إذا لا تستطيع البلع يمكن سحق الحبة وخلطها بالماء حسب تعليمات المنتج.',
      timingAr:
          'التزم بجرعتين يوميًا في أوقات ثابتة. لا تغيّر بين 90 mg و60 mg أو مدة العلاج من نفسك لأن الخطة تعتمد على سبب الاستخدام.',
      importantAr:
          'لا توقف BRILINTA من نفسك، خصوصًا بعد دعامة. إذا وصف الطبيب aspirin معه فعادة تكون جرعة المحافظة 75–100 mg يوميًا ما لم يضع الطبيب خطة مختلفة.',
      commonActionableAr:
          'قد يحدث ضيق نفس أو كدمات/نزف أسهل من المعتاد. ضيق النفس المستمر أو الجديد يحتاج تقييمًا.',
      missedDoseAr:
          'إذا نسيت جرعة، تجاوزها وخذ الجرعة التالية في موعدها المعتاد. لا تأخذ جرعتين معًا.',
      storageAr:
          'احفظ الأقراص بدرجة حرارة الغرفة في العبوة الأصلية وبعيدًا عن الرطوبة.',
      seekHelpAr:
          'اطلب مساعدة عند نزف شديد أو لا يتوقف، براز أسود/دموي، قيء دموي، إغماء، ضيق نفس شديد/متفاقم، أو بطء نبض مع دوخة شديدة.',
      teachBackAr:
          'كم مرة يوميًا تأخذ BRILINTA؟ ماذا تفعل إذا نسيت جرعة؟ وهل تستطيع إيقافه أو رفع جرعة aspirin من نفسك؟',
    ),
  ),
  Medication(
    id: 'prasugrel',
    familyId: 'anticoagulation',
    name: 'Prasugrel',
    subtitle: 'P2Y12 antiplatelet for ACS managed with PCI',
    tags: ['Antiplatelet', 'P2Y12', 'ACS', 'PCI', 'Bleeding', 'Boxed warning'],
    aliases: ['Effient'],
    useProfile: MedicationUseProfile(
      route:
          'Oral P2Y12 inhibitor for thrombotic-risk reduction in acute coronary syndrome managed with PCI.',
      foodTiming:
          'Maintenance treatment is once daily and may be taken with or without food. Aspirin is taken as directed by the treating team.',
      duration:
          'Individualized by ACS/PCI/stent plan. Do not stop early without the prescriber because premature discontinuation increases stent thrombosis, myocardial infarction and death risk.',
      formulationHandling:
          'Take exactly as prescribed. Do not split prasugrel tablets.',
      monitoring:
          'Bleeding, bruising, hemoglobin when clinically indicated, falls/head injury, adherence after PCI and any history of stroke/TIA.',
      interactions:
          'Anticoagulants, chronic NSAID use and other medicines that increase bleeding risk require review. Aspirin 75–325 mg/day may be part of the prescribed regimen.',
      commonMistakes:
          'Using prasugrel despite a previous stroke/TIA, stopping after a stent without cardiology input, doubling a missed dose, or taking it around surgery without informing the procedural team.',
      specialPopulations:
          'Contraindicated with prior TIA or stroke. In patients age 75 years or older it is generally not recommended except selected high-risk situations. Body weight below 60 kg is another bleeding-risk factor and may require a different prescribed maintenance dose.',
    ),
    sourceLabel:
        'DailyMed · Prasugrel tablets / EFFIENT · boxed bleeding warning · ACS with PCI · stop ≥7 days before surgery when possible',
    sections: [
      MedicationSection(
        title: 'Stroke/TIA contraindication',
        body:
            'Do not use prasugrel in a patient with prior transient ischemic attack or stroke. This is a hard product-label contraindication, not merely a dose-adjustment issue.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Surgery + age lock',
        body:
            'When possible, current labeling advises stopping prasugrel at least 7 days before surgery. Age ≥75 years generally shifts against use except selected high-risk patients; body weight <60 kg increases bleeding risk.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'مضاد صفائح يُستخدم في ACS عندما يكون العلاج عبر PCI/دعامة لتقليل الجلطات ومنها جلطة الدعامة.',
      howToUseAr:
          'خذه مرة يوميًا كما وُصف، مع الطعام أو بدونه، ومع aspirin فقط بالطريقة التي حددها طبيب القلب. لا تقسّم الحبة.',
      timingAr:
          'مرة يوميًا في وقت ثابت. مدة العلاج يحددها طبيب القلب حسب ACS/PCI والدعامة.',
      importantAr:
          'لا يُستخدم إذا لديك تاريخ TIA أو stroke. لا توقفه من نفسك بعد الدعامة، وأخبر كل طبيب/طبيب أسنان قبل أي عملية أو إجراء.',
      commonActionableAr:
          'قد تلاحظ كدمات أو نزفًا أسهل. السقوط أو ضربة الرأس مهمة أثناء العلاج وتحتاج تواصلًا طبيًا.',
      missedDoseAr:
          'خذ الجرعة عند التذكر إذا لم يقترب موعد التالية؛ إذا اقترب، تجاوزها وخذ التالية في وقتها. لا تأخذ جرعتين معًا.',
      storageAr:
          'احفظه في العبوة الأصلية بدرجة حرارة الغرفة وبعيدًا عن الرطوبة.',
      seekHelpAr:
          'اطلب مساعدة عند نزف شديد أو مستمر، براز أسود/دموي، قيء دموي، ضعف/ارتباك مفاجئ، أو بعد إصابة رأس مهمة.',
      teachBackAr:
          'ما التاريخ المرضي الذي يمنع prasugrel تمامًا؟ وكم يومًا قبل الجراحة قد يطلب الطبيب إيقافه؟ وهل توقفه بنفسك بعد الدعامة؟',
    ),
  ),
  Medication(
    id: 'aspirin-er-dipyridamole',
    familyId: 'anticoagulation',
    name: 'Aspirin / Extended-Release Dipyridamole',
    subtitle: '25 mg aspirin / 200 mg ER dipyridamole capsule · stroke-risk reduction after TIA/ischemic stroke',
    tags: ['Antiplatelet', 'Stroke', 'TIA', 'Extended release', 'Bleeding'],
    aliases: ['Aggrenox', 'Aspirin dipyridamole ER'],
    useProfile: MedicationUseProfile(
      route:
          'Fixed-combination oral capsule containing aspirin 25 mg plus extended-release dipyridamole 200 mg for stroke-risk reduction after transient cerebral ischemia/TIA or completed thrombotic ischemic stroke.',
      foodTiming:
          'One capsule twice daily, morning and evening, with or without food.',
      duration:
          'Usually ongoing secondary-prevention therapy while clinically appropriate.',
      formulationHandling:
          'Swallow the capsule whole. Do not crush or chew. The combination is not interchangeable with separate aspirin and dipyridamole tablets.',
      monitoring:
          'Bleeding, headache during initiation, GI symptoms, blood pressure in susceptible patients, and new/worsening chest pain in patients with coronary disease.',
      interactions:
          'Anticoagulants, other antiplatelets and NSAIDs increase bleeding risk. The aspirin component means duplicate OTC aspirin/NSAID use must be checked. Inform providers before a pharmacologic cardiac stress test.',
      commonMistakes:
          'Opening/crushing the capsule, replacing it with separate aspirin plus dipyridamole tablets, stopping because of an early headache without contacting the prescriber, or taking NSAIDs casually.',
      specialPopulations:
          'Avoid in aspirin/NSAID allergy and aspirin-sensitive asthma/rhinitis/nasal-polyps syndrome. Children/teenagers with viral illness should not receive the aspirin-containing product because of Reye syndrome risk.',
    ),
    sourceLabel:
        'DailyMed · Aspirin 25 mg / extended-release dipyridamole 200 mg capsules · revised Jun 2026 · twice daily, swallow whole, not interchangeable',
    sections: [
      MedicationSection(
        title: 'Fixed-combination lock',
        body:
            'One 25/200 mg capsule twice daily, morning and evening. Swallow whole; do not crush/chew. It is not interchangeable with taking separate aspirin and dipyridamole tablets.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Early headache counseling',
        body:
            'Headache is common early and often improves. If headache is intolerable, contact the prescriber rather than stopping or inventing a schedule; labeling contains a temporary alternative regimen only under clinician direction.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يقلل خطر stroke لدى بعض المرضى الذين سبق لديهم TIA أو stroke إقفاري بسبب جلطة.',
      howToUseAr:
          'كبسولة واحدة صباحًا وكبسولة واحدة مساءً حسب الوصفة. ابتلع الكبسولة كاملة ولا تسحقها أو تمضغها.',
      timingAr:
          'مرتين يوميًا صباحًا ومساءً، مع الطعام أو بدونه.',
      importantAr:
          'لا تستبدل الكبسولة بأخذ aspirin وdipyridamole كل واحد لوحده. لا تضف NSAID أو aspirin آخر من نفسك بسبب زيادة النزف.',
      commonActionableAr:
          'الصداع شائع خصوصًا في البداية وغالبًا يقل مع الاستمرار. إذا كان شديدًا تواصل مع الطبيب بدل إيقاف الدواء من نفسك.',
      missedDoseAr:
          'إذا نسيت جرعة، خذ الجرعة التالية في موعدها المعتاد فقط. لا تأخذ جرعتين معًا.',
      storageAr:
          'احفظه جافًا بدرجة 15–30°C وفي العبوة الأصلية.',
      seekHelpAr:
          'اطلب مساعدة عند نزف شديد، براز أسود أو دموي، قيء دموي، إغماء/ارتباك شديد، أو ألم صدر جديد/متفاقم.',
      teachBackAr:
          'كم مرة يوميًا تأخذ الكبسولة؟ وهل يمكن سحقها أو استبدالها بحبوب aspirin وdipyridamole منفصلة؟',
    ),
  ),
  Medication(
    id: 'cilostazol',
    familyId: 'anticoagulation',
    name: 'Cilostazol',
    subtitle: 'PDE-III inhibitor for intermittent claudication · contraindicated in any heart failure',
    tags: ['Peripheral artery disease', 'Claudication', 'PDE-III', 'Heart failure contraindication'],
    aliases: ['Pletal'],
    useProfile: MedicationUseProfile(
      route:
          'Oral PDE-III inhibitor used to reduce symptoms of intermittent claudication and increase walking distance.',
      foodTiming:
          'Take twice daily at least 30 minutes before or 2 hours after breakfast and dinner.',
      duration:
          'Benefit may start in 2–4 weeks but can require up to 12 weeks. If symptoms remain unimproved after 3 months, current labeling recommends discontinuation.',
      formulationHandling:
          'Use the exact prescribed strength. CYP3A4 or CYP2C19 inhibitors can require a lower prescribed dose; do not self-adjust.',
      monitoring:
          'Walking distance/symptom response, heart rate/palpitations, blood pressure, bleeding context and drug interactions.',
      interactions:
          'Strong/moderate CYP3A4 inhibitors and CYP2C19 inhibitors can increase exposure and trigger a lower prescribed dose. Grapefruit juice may increase cilostazol exposure. Antithrombotic combinations need bleeding review.',
      commonMistakes:
          'Taking with meals instead of the required fasting interval, giving up after only a few days, continuing beyond 3 months with no benefit, using it in heart failure, or ignoring new interacting medicines such as diltiazem/omeprazole.',
      specialPopulations:
          'Contraindicated in heart failure of any severity. Tachycardia, palpitations, arrhythmia or hypotension can occur; ischemic heart disease requires careful review.',
    ),
    sourceLabel:
        'DailyMed · Cilostazol tablets · current label · boxed warning heart failure; 30 min before/2 h after meals; assess response by 3 months',
    sections: [
      MedicationSection(
        title: 'Heart-failure contraindication',
        body:
            'Cilostazol is contraindicated in heart failure of any severity. This is a boxed warning and should be checked before dispensing.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Food + response lock',
        body:
            'Take at least 30 minutes before or 2 hours after breakfast and dinner. Improvement may take 2–4 weeks and up to 12 weeks; if symptoms are still unimproved after 3 months, labeling recommends stopping therapy.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يساعد بعض مرضى intermittent claudication على المشي مسافة أطول وتقليل ألم الساق مع المشي.',
      howToUseAr:
          'خذه مرتين يوميًا: قبل الإفطار والعشاء بـ30 دقيقة على الأقل أو بعدهما بساعتين.',
      timingAr:
          'لا تأخذه مباشرة مع الطعام. حاول تثبيت نفس الفاصل عن الإفطار والعشاء يوميًا.',
      importantAr:
          'لا تستخدم cilostazol إذا لديك heart failure من أي درجة. أخبر الصيدلي عن omeprazole أو diltiazem أو أدوية جديدة لأن بعضها يغيّر الجرعة الموصوفة.',
      commonActionableAr:
          'قد يسبب صداعًا أو خفقانًا أو إسهالًا. التحسن ليس فوريًا وقد يحتاج أسابيع.',
      missedDoseAr:
          'إذا نسيت جرعة، لا تضاعف الجرعة التالية؛ استأنف جدولك المعتاد مع الحفاظ على فصلها عن الطعام.',
      storageAr:
          'يحفظ بدرجة حرارة الغرفة 25°C تقريبًا، ويسمح بمدى 15–30°C.',
      seekHelpAr:
          'اطلب تقييمًا عند خفقان شديد/إغماء، ألم صدر جديد أو متفاقم، تحسس شديد، أو نزف غير معتاد.',
      teachBackAr:
          'ما قاعدة 30 دقيقة قبل/ساعتين بعد الطعام؟ وما الحالة القلبية التي تمنع cilostazol تمامًا؟ وبعد كم مدة نعيد تقييم الفائدة؟',
    ),
  ),
];
