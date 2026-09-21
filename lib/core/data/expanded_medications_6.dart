import '../models/medication.dart';

const expandedMedications6 = <Medication>[
  Medication(
    id: 'nayzilam-midazolam-nasal',
    familyId: 'cns',
    name: 'NAYZILAM Midazolam Nasal Spray',
    subtitle: '5 mg single-dose seizure-cluster rescue spray · age 12 years and older',
    tags: ['Seizure rescue', 'Nasal spray', 'Benzodiazepine', 'Emergency plan'],
    aliases: ['Nayzilam', 'Midazolam nasal spray 5 mg'],
    hasVisualGuide: true,
    useProfile: MedicationUseProfile(
      route:
          'Nasal rescue treatment for seizure clusters in patients 12 years and older. Each single-use unit contains one 5 mg dose.',
      foodTiming:
          'Not meal-related. Use only for the seizure-cluster pattern and timing defined in the patient-specific rescue plan.',
      duration:
          'Intermittent rescue use only. Current labeling recommends treating no more than one seizure-cluster episode every 3 days and no more than 5 episodes per month.',
      formulationHandling:
          'Do not open the blister until ready. Do not test or prime. Give one spray into one nostril. If the prescriber has authorized a second dose and the cluster continues, use a NEW unit in the opposite nostril after 10 minutes.',
      monitoring:
          'Observe breathing, level of alertness, seizure response and whether emergency rescue criteria are met. Do not give a second dose if there is concern about breathing or unusual/excessive sedation.',
      interactions:
          'Opioids and other CNS depressants can markedly increase sedation and respiratory-depression risk. Alcohol and sedatives require review.',
      commonMistakes:
          'Priming the device and losing the only dose, opening the blister early, using the same unit twice, giving the second dose too soon, using the same nostril for the second dose, or giving a second dose despite breathing concern.',
      specialPopulations:
          'Safety and effectiveness below age 12 years have not been established in current U.S. labeling. Rescue criteria and whether a second dose is permitted must be individualized.',
    ),
    sourceLabel:
        'DailyMed · NAYZILAM (midazolam) nasal spray 5 mg · current label/IFU · one unit = one dose; second dose after 10 min in opposite nostril only if authorized',
    sections: [
      MedicationSection(
        title: 'Single-dose device + second-dose lock',
        body:
            'One unit contains one 5 mg dose. Do not test or prime. If the patient-specific plan allows a second dose, use a NEW unit in the opposite nostril after 10 minutes. Do not give the second dose when breathing is concerning or sedation is excessive/unusual.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Frequency ceiling',
        body:
            'Current labeling recommends no more than 2 doses for one seizure cluster, no more than 1 treated episode every 3 days, and no more than 5 treated episodes per month.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'دواء إنقاذ لنوبات seizure cluster المحددة في خطة المريض، وليس لكل نوبة عادية.',
      howToUseAr:
          'لا تفتح الـblister إلا وقت الحاجة ولا تختبر أو تجهّز البخاخ مسبقًا. ضع الفوهة في فتحة أنف واحدة واضغط مرة واحدة؛ كل جهاز يحتوي جرعة واحدة فقط.',
      timingAr:
          'إذا استمرت النوبات بعد 10 دقائق وكان الطبيب قد سمح بجرعة ثانية، استخدم جهازًا جديدًا في فتحة الأنف الأخرى.',
      importantAr:
          'لا تعطِ الجرعة الثانية إذا كان التنفس مقلقًا أو كان النعاس/التهدئة أشد من المعتاد. لا تتجاوز جرعتين لنفس cluster.',
      commonActionableAr:
          'قد يحدث نعاس أو صداع أو انزعاج/سيلان بالأنف.',
      missedDoseAr:
          'ليس دواءً يوميًا؛ استخدمه فقط حسب خطة إنقاذ seizure cluster ولا تعطِ جرعة تعويضية.',
      storageAr:
          'احفظه داخل الـblister بدرجة حرارة الغرفة 20–25°C حتى وقت الاستخدام.',
      seekHelpAr:
          'اطلب مساعدة طارئة إذا لم تتوقف النوبات بعد استخدام خطة الإنقاذ، أو ظهر ضعف تنفس، زرقة، إصابة، أو تغير مقلق في الوعي.',
      teachBackAr:
          'إذا احتجت جرعة ثانية، بعد كم دقيقة؟ وهل ستكون في نفس فتحة الأنف أم الفتحة الأخرى؟ ومتى يجب ألا تعطيها؟',
    ),
  ),
  Medication(
    id: 'valtoco-diazepam-nasal',
    familyId: 'cns',
    name: 'VALTOCO Diazepam Nasal Spray',
    subtitle: 'Age/weight-selected seizure-cluster rescue dose · single-use nasal devices',
    tags: ['Seizure rescue', 'Nasal spray', 'Diazepam', 'Emergency plan'],
    aliases: ['Valtoco', 'Diazepam nasal spray'],
    hasVisualGuide: true,
    useProfile: MedicationUseProfile(
      route:
          'Nasal rescue treatment for seizure clusters in adults and pediatric patients 2 years and older. The prescribed dose is selected by age and weight.',
      foodTiming:
          'Not meal-related. Use only according to the individualized seizure-cluster rescue plan.',
      duration:
          'Intermittent rescue use only. Current labeling limits treatment to no more than one episode every 5 days and no more than 5 episodes per month.',
      formulationHandling:
          'Do not open blister packs or test devices before use. Prescribed 5 mg and 10 mg doses use one device and one spray in one nostril. Prescribed 15 mg and 20 mg doses require two devices: one spray in each nostril. Each device sprays once only.',
      monitoring:
          'Observe seizure response, breathing and level of alertness. If the prescribed plan includes a second dose, it may be given at least 4 hours after the first using a NEW blister pack; do not give it if breathing is concerning, breathing support is needed, or extreme drowsiness is present.',
      interactions:
          'Opioids and other CNS depressants increase risk of profound sedation and respiratory depression. Alcohol and sedatives require review.',
      commonMistakes:
          'Testing a single-use device, opening blister packs early, assuming every VALTOCO dose is one spray, forgetting that 15/20 mg use two devices and both nostrils, or repeating before 4 hours.',
      specialPopulations:
          'Current labeling supports use from age 2 years. Dose/device count is age- and weight-based and must be prescribed; the app must not calculate or select it.',
    ),
    sourceLabel:
        'DailyMed · VALTOCO (diazepam) nasal spray · effective Jun 2026 · 5/10 mg one device; 15/20 mg two devices; second dose ≥4 h if prescribed',
    sections: [
      MedicationSection(
        title: 'Device-count lock',
        body:
            '5 mg and 10 mg doses = one single-use device, one spray into one nostril. 15 mg and 20 mg doses = two devices, one spray into each nostril. Never infer device count from another rescue product.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Second-dose lock',
        body:
            'A prescribed second dose is separated by at least 4 hours and uses a NEW blister pack. Do not give it when breathing is concerning, breathing support is needed, or extreme drowsiness is present.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'دواء إنقاذ لنوبات seizure cluster المحددة في خطة المريض.',
      howToUseAr:
          'لا تفتح الـblister ولا تختبر الجهاز قبل الحاجة. إذا كانت الجرعة الموصوفة 5 أو 10 mg فهي جهاز واحد في فتحة أنف واحدة؛ أما 15 أو 20 mg فتحتاج جهازين، بخة واحدة في كل فتحة أنف.',
      timingAr:
          'إذا كانت خطة الطبيب تسمح بجرعة ثانية، لا تُعطى قبل مرور 4 ساعات على الأقل وتُستخدم عبوة جديدة.',
      importantAr:
          'كل جهاز يُستخدم مرة واحدة فقط. لا تختَر القوة أو عدد الأجهزة من نفسك لأن الجرعة تعتمد على العمر والوزن والوصفة.',
      commonActionableAr:
          'قد يحدث نعاس أو انزعاج بالأنف أو صداع.',
      missedDoseAr:
          'ليس دواءً يوميًا؛ يُستخدم عند seizure cluster حسب خطة الإنقاذ فقط.',
      storageAr:
          'احفظه بدرجة حرارة الغرفة 20–25°C، لا تجمّده، واحمه من الضوء داخل العبوة حتى وقت الاستخدام.',
      seekHelpAr:
          'اطلب المساعدة إذا كانت النوبات مختلفة أو أشد/أطول من المعتاد، أو كان التنفس مقلقًا، أو كان النعاس شديدًا بشكل غير معتاد.',
      teachBackAr:
          'إذا كانت جرعتك 15 mg، كم جهازًا تستخدم وأين؟ وبعد كم ساعة يمكن أن تكون الجرعة الثانية إذا كانت موصوفة؟',
    ),
  ),
  Medication(
    id: 'diastat-acudial-diazepam-rectal',
    familyId: 'cns',
    name: 'DIASTAT / DIASTAT AcuDial Diazepam Rectal Gel',
    subtitle: 'Prefilled rectal seizure-cluster rescue system · caregiver-administered',
    tags: ['Seizure rescue', 'Rectal gel', 'Diazepam', 'Caregiver device'],
    aliases: ['Diastat', 'Diastat AcuDial', 'Diazepam rectal gel'],
    hasVisualGuide: true,
    useProfile: MedicationUseProfile(
      route:
          'Rectal rescue treatment for intermittent seizure clusters in patients 2 years and older. Caregiver administration requires prior training.',
      foodTiming:
          'Not meal-related. Use only for the exact seizure pattern and trigger criteria agreed with the prescriber.',
      duration:
          'Intermittent rescue use. Current labeling recommends no more than one treated episode every 5 days and no more than 5 episodes per month.',
      formulationHandling:
          'For AcuDial, before use confirm the prescribed dose is visible in the dose window and the green READY band is visible; the pharmacist sets and locks the dose. Lubricate the rectal tip, position the patient on the side, insert gently, push the plunger slowly while counting to 3, count to 3 before removing, then hold the buttocks together while counting to 3.',
      monitoring:
          'Stay with and observe the patient after treatment; caregiver instructions specify observation for 4 hours. A prescriber may order a second dose 4–12 hours later. Monitor breathing, color, alertness and seizure response.',
      interactions:
          'Opioids and other CNS depressants can cause profound sedation and respiratory depression with diazepam.',
      commonMistakes:
          'Using AcuDial without checking the dose window and green READY band, trying to adjust a pharmacist-locked dose, failing to remove the cap/seal pin, skipping lubricant, pushing/removing too fast, or assuming a second dose is always due.',
      specialPopulations:
          'Prescribed dose depends on age and weight and should be periodically reassessed as the patient grows. The app must not set or calculate the AcuDial dose.',
    ),
    sourceLabel:
        'DailyMed · DIASTAT / DIASTAT AcuDial diazepam rectal gel · caregiver and pharmacist IFU · current labeling',
    sections: [
      MedicationSection(
        title: 'Pharmacist lock',
        body:
            'AcuDial dose must be set and locked by the pharmacist. Before dispensing, confirm the prescribed dose is displayed and the green READY band is visible. Once locked, it cannot be unlocked.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Caregiver technique',
        body:
            'Side position → lubricate tip → expose rectum → insert gently → push plunger while slowly counting 1-2-3 → count 1-2-3 before removing → hold buttocks together while counting 1-2-3. Continue observation after administration.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'جل diazepam إنقاذي لنوبات seizure cluster ويعطيه شخص مدرَّب حسب خطة الطبيب.',
      howToUseAr:
          'قبل الاستخدام تأكد أن الجرعة الموصوفة ظاهرة في نافذة AcuDial وأن الشريط الأخضر READY ظاهر. ضع المريض على جانبه، زيّت الطرف، أدخله بلطف، واضغط المكبس ببطء مع العد 1-2-3، ثم انتظر 1-2-3 قبل إخراجه واضغط الإليتين معًا 1-2-3.',
      timingAr:
          'يُستخدم فقط عندما تتحقق شروط seizure cluster المتفق عليها. إذا وصف الطبيب جرعة ثانية فهي بعد 4–12 ساعة، وليست تلقائية لكل مريض.',
      importantAr:
          'لا تغيّر قرص/قفل الجرعة بنفسك؛ الصيدلي يضبط AcuDial حسب الوصفة. ابقَ مع المريض وراقب التنفس واللون والوعي بعد الجرعة.',
      commonActionableAr:
          'النعاس شائع وقد يحدث عدم اتزان بعد السيطرة على النوبة.',
      missedDoseAr:
          'ليس علاجًا يوميًا؛ لا توجد جرعة تعويضية. استخدمه حسب خطة الإنقاذ فقط.',
      storageAr:
          'يحفظ بدرجة حرارة الغرفة 25°C تقريبًا؛ يسمح بمدى 15–30°C حسب الملصق.',
      seekHelpAr:
          'اطلب تقييمًا عاجلًا إذا كان التنفس أو اللون غير طبيعي، لم تستجب النوبات كما هو متوقع، حدثت إصابة، أو بدا المريض أكثر نعاسًا/تدهورًا من المعتاد.',
      teachBackAr:
          'ما الشيئان اللذان يجب أن تراهما على AcuDial قبل الاستخدام؟ وما قاعدة العد 1-2-3 أثناء الإعطاء؟',
    ),
  ),
  Medication(
    id: 'gvoke-hypopen-glucagon',
    familyId: 'diabetes-endocrine',
    name: 'GVOKE HypoPen Glucagon',
    subtitle: 'Ready-to-use single-dose glucagon auto-injector for severe hypoglycemia',
    tags: ['Severe hypoglycemia', 'Emergency', 'Glucagon', 'Auto-injector'],
    aliases: ['Gvoke HypoPen', 'Glucagon HypoPen'],
    hasVisualGuide: true,
    useProfile: MedicationUseProfile(
      route:
          'Subcutaneous rescue injection for severe hypoglycemia in adults and pediatric patients 2 years and older. HypoPen strengths are 0.5 mg/0.1 mL and 1 mg/0.2 mL.',
      foodTiming:
          'Emergency use only. Once awake and able to swallow safely, give fast-acting carbohydrate followed by longer-acting carbohydrate/food.',
      duration:
          'Keep an unexpired rescue device available and replace it after use.',
      formulationHandling:
          'Keep sealed in the foil pouch until use. Inspect solution; it should be clear/colorless to pale yellow. Pull the red cap straight off, inject on bare skin of lower abdomen, outer thigh, or outer upper arm, press straight down until the click, hold while slowly counting to 5, and confirm the viewing window turns red.',
      monitoring:
          'Call emergency medical help after use. Turn an unconscious patient onto the side. If there is no response after 15 minutes, another dose from a NEW device may be given while waiting for help. Do not reuse a device.',
      interactions:
          'Glucagon response can be reduced when hepatic glycogen is depleted. Indomethacin and warfarin have label interaction considerations.',
      commonMistakes:
          'Removing the red cap before an emergency, covering the yellow needle guard with fingers, injecting through clothing, lifting before the 5-count/window-red confirmation, reusing the device, or giving food to an unconscious patient.',
      specialPopulations:
          'Current labeling: age 12 years and older uses 1 mg; age 2 to <12 years uses 0.5 mg if <45 kg or 1 mg if ≥45 kg. Strength selection belongs to the prescriber/pharmacy plan, not an app calculator.',
    ),
    sourceLabel:
        'DailyMed · GVOKE HypoPen (glucagon) · current 2026 labeling/IFU · 0.5 mg and 1 mg single-dose auto-injectors',
    sections: [
      MedicationSection(
        title: 'HypoPen technique lock',
        body:
            'Red cap off only when ready → bare skin → straight down → listen for click → hold and count slowly to 5 → window turns red. Do not inject through clothing and do not cover the yellow needle guard.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'After-use rescue sequence',
        body:
            'Turn an unconscious patient onto the side, call emergency medical help, and give oral carbohydrate only after the patient wakes and can swallow. If no response after 15 minutes, a NEW glucagon device may be used if available.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'حقنة إنقاذ جاهزة لهبوط السكر الشديد عندما لا يستطيع المريض علاج نفسه.',
      howToUseAr:
          'افتح الـfoil وقت الحاجة فقط. افحص السائل، اسحب الغطاء الأحمر، وضع القلم مباشرة على جلد مكشوف في أسفل البطن أو خارج الفخذ أو خارج أعلى الذراع. اضغط للأسفل حتى تسمع click واستمر بالضغط وعد ببطء إلى 5؛ اكتمال الجرعة يظهر عندما تتحول نافذة الجهاز إلى اللون الأحمر.',
      timingAr:
          'استخدمه فور severe hypoglycemia حسب خطة الطوارئ واتصل بالمساعدة الطبية. إذا لم يستجب بعد 15 دقيقة يمكن استخدام جهاز جديد إذا كان متوفرًا.',
      importantAr:
          'لا تحقن فوق الملابس، ولا تضع أصابعك فوق الـyellow needle guard، ولا تعِد استخدام القلم. ضع فاقد الوعي على جانبه لتقليل خطر الاختناق إذا تقيأ.',
      commonActionableAr:
          'قد يحدث غثيان أو قيء أو صداع بعد glucagon.',
      missedDoseAr:
          'ليس علاجًا يوميًا؛ هو دواء إنقاذ للطوارئ فقط.',
      storageAr:
          'يحفظ داخل الـfoil الأصلي بدرجة حرارة الغرفة 20–25°C. لا يُحفظ في الثلاجة ولا يُجمّد.',
      seekHelpAr:
          'اطلب المساعدة الطبية فورًا بعد الحقن. بعد أن يستيقظ المريض ويستطيع البلع بأمان، أعطه مصدر سكر سريع ثم طعامًا/سناكًا أطول مفعولًا.',
      teachBackAr:
          'هل يمكن الحقن فوق الملابس؟ إلى كم ستعد بعد الـclick؟ وما اللون الذي يؤكد اكتمال الجرعة؟',
    ),
  ),
  Medication(
    id: 'neffy-epinephrine-nasal',
    familyId: 'allergy-dermatology',
    name: 'neffy Epinephrine Nasal Spray',
    subtitle: 'Single-dose intranasal epinephrine for anaphylaxis · weight-based strength',
    tags: ['Anaphylaxis', 'Emergency', 'Nasal spray', 'Epinephrine'],
    aliases: ['neffy', 'Epinephrine nasal spray'],
    hasVisualGuide: true,
    useProfile: MedicationUseProfile(
      route:
          'Single-dose epinephrine nasal spray for emergency treatment of type I allergic reactions including anaphylaxis in patients who weigh at least 15 kg.',
      foodTiming: 'Emergency use only; not meal-related.',
      duration:
          'Keep two in-date devices immediately available as recommended by current labeling and replace after use or expiration.',
      formulationHandling:
          'Do not prime. Insert the nozzle fully into one nostril until fingers touch the nose. Hold the device straight into the nose rather than angling toward the septum or outer wall, press the plunger firmly once, and do not sniff during or after administration.',
      monitoring:
          'If symptoms do not improve or worsen, give a second dose with a NEW device in the SAME nostril starting 5 minutes after the first dose. More than two sequential epinephrine doses should be given under direct medical supervision. Follow the emergency medical-assistance plan discussed with the prescriber.',
      interactions:
          'Beta-blockers, alpha-blockers and several cardiac/adrenergic medicines can alter epinephrine response, but anaphylaxis rescue should not be delayed while seeking interaction advice.',
      commonMistakes:
          'Priming the device, angling it toward the septum/outer nasal wall, sniffing after the spray, using the opposite nostril for the second dose, waiting too long when symptoms worsen, or carrying only one device.',
      specialPopulations:
          'Current 2026 labeling is weight-based: 1 mg for 15 to <30 kg and 2 mg for ≥30 kg. Strength selection is a prescribed product choice; the app must not calculate the dose.',
    ),
    sourceLabel:
        'DailyMed · neffy (epinephrine nasal spray) · revised Mar 2026/current label · 1 mg and 2 mg single-dose devices',
    sections: [
      MedicationSection(
        title: 'Weight + same-nostril lock',
        body:
            'Current labeling: 1 mg for 15 to <30 kg and 2 mg for ≥30 kg. If symptoms continue/worsen, use a NEW device in the SAME nostril starting 5 minutes after the first dose.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Technique lock',
        body:
            'Do not prime. Insert fully until fingers touch the nose, keep the spray straight rather than angled toward the septum or outer wall, press firmly once, and do not sniff during or after administration.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'Epinephrine أنفي لإنقاذ الحساسية الشديدة/anaphylaxis عند المرضى الذين وزنهم 15 kg أو أكثر.',
      howToUseAr:
          'لا تختبر الجهاز. أدخل الفوهة كاملة في فتحة أنف واحدة حتى تلامس الأصابع الأنف، وأبقِ الجهاز مستقيمًا داخل الأنف ثم اضغط المكبس بقوة مرة واحدة. لا تشم أو تسحب الهواء بقوة أثناء الرش أو بعده.',
      timingAr:
          'استخدمه فور anaphylaxis حسب خطة الطوارئ. إذا لم تتحسن الأعراض أو ساءت، استخدم جهازًا جديدًا في نفس فتحة الأنف ابتداءً من 5 دقائق بعد الجرعة الأولى.',
      importantAr:
          'احمل جهازين معك. القوة تعتمد على الوزن: 1 mg للوزن 15 إلى أقل من 30 kg، و2 mg لوزن 30 kg أو أكثر؛ لا تبدّل القوة من نفسك.',
      commonActionableAr:
          'قد يحدث انزعاج أو سيلان بالأنف، صداع، دوخة، غثيان أو خفقان.',
      missedDoseAr:
          'ليس علاجًا يوميًا؛ استخدمه فور الطوارئ ولا تنتظر جرعة تعويضية.',
      storageAr:
          'يحفظ بدرجة حرارة الغرفة 20–25°C داخل الـblister أو الحافظة. لا تجمّده عمدًا؛ إذا كان الجهاز متجمّدًا وقت الطوارئ فقد لا يرش.',
      seekHelpAr:
          'اتبع خطة الطوارئ التي شرحها الطبيب لطلب المساعدة الطبية، خصوصًا إذا استمرت/ساءت الأعراض أو احتجت جرعة ثانية.',
      teachBackAr:
          'إذا احتجت الجرعة الثانية، هل تستخدم نفس فتحة الأنف أم الأخرى؟ وبعد كم دقيقة؟ وهل تشم الدواء بعد الرش؟',
    ),
  ),
];
