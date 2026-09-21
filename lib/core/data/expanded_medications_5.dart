import '../models/medication.dart';

const expandedMedications5 = <Medication>[
  Medication(
    id: 'semaglutide-oral-tablets',
    familyId: 'diabetes-endocrine',
    name: 'Semaglutide Oral Tablets',
    subtitle: 'RYBELSUS / OZEMPIC tablets · formulation-specific oral semaglutide',
    tags: ['Diabetes', 'GLP-1', 'Oral', 'Empty stomach', 'Formulation lock'],
    aliases: [
      'Rybelsus',
      'Ozempic tablets',
      'Oral semaglutide',
    ],
    useProfile: MedicationUseProfile(
      route:
          'Oral semaglutide tablet. Current U.S. labeling includes RYBELSUS 3/7/14 mg and OZEMPIC tablets 1.5/4/9 mg; the formulations are not substitutable mg-for-mg.',
      foodTiming:
          'Take once daily on an empty stomach in the morning with plain water only, no more than 4 oz (120 mL). Wait at least 30 minutes before food, other drinks, or any other oral medicine.',
      duration:
          'Usually long-term treatment while effective, tolerated and clinically indicated.',
      formulationHandling:
          'Swallow the tablet whole. Do not split, crush, chew or dissolve it. Keep tablets in the original bottle to protect them from moisture.',
      monitoring:
          'Glycemic response, GI tolerability, hydration/renal status when vomiting or diarrhea is significant, and eye symptoms in patients at risk for diabetic retinopathy.',
      interactions:
          'Semaglutide delays gastric emptying and can affect absorption of oral medicines. Current labeling reports increased levothyroxine exposure with oral semaglutide; medication timing and monitoring may need review.',
      commonMistakes:
          'Taking the tablet with coffee or another drink, using more than 120 mL water, eating or taking another medicine before 30 minutes, crushing the tablet, or substituting one oral semaglutide formulation strength for another mg-for-mg.',
      specialPopulations:
          'Pregnancy planning requires clinician review because semaglutide has a long washout. Dose selection and switching between formulations are prescriber decisions.',
    ),
    sourceLabel:
        'DailyMed · RYBELSUS and OZEMPIC tablets (semaglutide) · current 2026 labeling · oral formulations are not substitutable mg-for-mg',
    sections: [
      MedicationSection(
        title: 'Formulation lock · not mg-for-mg',
        body:
            'Current labeling contains different oral semaglutide formulations/strengths. Do not convert or substitute RYBELSUS and OZEMPIC tablet strengths on a milligram-for-milligram basis.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration lock',
        body:
            'Morning empty stomach + plain water only up to 4 oz (120 mL) + wait at least 30 minutes before any food, drink or other oral medicine. Swallow whole.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يساعد على خفض سكر الدم، وقد يكون له فائدة قلبية حسب المنتج والاستطباب.',
      howToUseAr:
          'خذ حبة واحدة صباحًا على معدة فارغة مع ماء عادي فقط وبكمية لا تتجاوز 120 mL تقريبًا. ابتلع الحبة كاملة ولا تكسرها أو تسحقها أو تذيبها.',
      timingAr:
          'بعد الحبة انتظر 30 دقيقة على الأقل قبل الأكل أو القهوة أو أي شراب آخر أو أي دواء فموي آخر.',
      importantAr:
          'هناك تراكيز/تركيبات مختلفة من semaglutide tablets وليست بدائل mg مقابل mg. لا تبدل بين RYBELSUS وOZEMPIC tablets أو بين التراكيز من نفسك.',
      commonActionableAr:
          'الغثيان أو قلة الشهية أو الإسهال/الإمساك قد يحدث خصوصًا عند تغيير الجرعة. الوجبات الأصغر وتجنب الوجبات الثقيلة قد يساعدان.',
      missedDoseAr:
          'إذا نسيت الجرعة، تجاوزها وخذ الجرعة التالية في اليوم التالي. لا تأخذ جرعتين في يوم واحد.',
      storageAr:
          'احفظ الحبوب في العبوة الأصلية وفي مكان جاف بعيدًا عن الرطوبة وبدرجة حرارة الغرفة حسب الملصق.',
      seekHelpAr:
          'اطلب تقييمًا عند ألم بطن شديد ومستمر، قيء/إسهال شديد مع جفاف، تحسس شديد، أو تغير واضح ومفاجئ في النظر.',
      teachBackAr:
          'كم ماء ستستخدم؟ وكم دقيقة ستنتظر قبل الفطور أو باقي الأدوية؟ وهل يمكن تبديل تركيزين مختلفين mg مقابل mg؟',
    ),
  ),
  Medication(
    id: 'epipen-auto-injector',
    familyId: 'allergy-dermatology',
    name: 'EpiPen / EpiPen Jr Auto-Injector',
    subtitle: 'Epinephrine emergency auto-injector for anaphylaxis',
    tags: ['Anaphylaxis', 'Emergency', 'Auto-injector', 'Epinephrine'],
    aliases: ['EpiPen', 'EpiPen Jr', 'Epinephrine auto-injector'],
    useProfile: MedicationUseProfile(
      route:
          'Single-dose epinephrine auto-injector for injection into the middle of the outer thigh; it may be given through clothing when necessary.',
      foodTiming: 'Emergency use only; not meal-related.',
      duration:
          'Keep available for emergency use and replace before expiration or immediately after a device is used.',
      formulationHandling:
          'EpiPen 0.3 mg and EpiPen Jr 0.15 mg are fixed-dose devices. Pull the blue safety top straight up, place the orange needle end against the middle outer thigh, push firmly and hold for 3 seconds. Do not put fingers over the orange end.',
      monitoring:
          'After use, obtain emergency medical evaluation even if symptoms improve. A second device may be needed if symptoms continue or return.',
      interactions:
          'Do not delay epinephrine because of expected transient tremor or palpitations during anaphylaxis. Concomitant cardiovascular medicines can modify response, but emergency treatment takes priority.',
      commonMistakes:
          'Holding the device backwards, placing a thumb over the orange needle end, twisting the blue safety top, injecting into the buttock/hand/foot, removing it too early, or failing to seek emergency care after use.',
      specialPopulations:
          'Current EpiPen labeling uses 0.3 mg for patients at least 30 kg and 0.15 mg for 15–30 kg. Fixed-dose selection remains a prescriber decision; hold a young child leg firmly during injection to reduce injury from movement.',
    ),
    sourceLabel:
        'DailyMed · EPIPEN / EPIPEN Jr epinephrine auto-injector · current labeling and Instructions for Use',
    sections: [
      MedicationSection(
        title: 'Emergency technique',
        body:
            'Blue safety top off straight upward; orange end to the middle outer thigh; push firmly and hold 3 seconds. Through clothing is permitted if needed. Seek emergency medical care immediately after use.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Strength + storage lock',
        body:
            'EpiPen and EpiPen Jr are fixed-dose devices selected by patient weight. Store at 20–25°C, protect from light, do not refrigerate/freeze, and replace if the solution becomes pink/brown or contains particles.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'حقنة إسعاف للحساسية الشديدة أو anaphylaxis. تُستخدم فورًا عند ظهور أعراض الطوارئ التي تم تدريبك عليها.',
      howToUseAr:
          'اسحب الغطاء الأزرق للأعلى بشكل مستقيم. ضع الطرف البرتقالي على منتصف الجهة الخارجية للفخذ، واضغط بقوة وثبته 3 ثوانٍ. يمكن إعطاؤه عبر الملابس عند الحاجة.',
      timingAr:
          'استخدمه فورًا في حالة الحساسية الشديدة حسب خطة الطوارئ، ثم اطلب المساعدة الطبية الطارئة مباشرة.',
      importantAr:
          'لا تضع إصبعك أو إبهامك فوق الطرف البرتقالي. احمل الجهازين الموصوفين لك؛ قد تحتاج جهازًا ثانيًا إذا استمرت الأعراض أو عادت أثناء انتظار الإسعاف.',
      commonActionableAr:
          'قد يحدث خفقان أو رجفة أو توتر بعد epinephrine؛ هذه الأعراض المتوقعة لا تعني أن الجرعة كانت خطأ.',
      missedDoseAr:
          'هذا دواء إسعاف وليس له جرعة يومية فائتة. إذا حدثت anaphylaxis استخدمه فورًا ولا تنتظر.',
      storageAr:
          'احفظه بدرجة حرارة الغرفة 20–25°C بعيدًا عن الضوء والحرارة الشديدة، ولا تضعه في الثلاجة أو الفريزر. افحص نافذة السائل دوريًا.',
      seekHelpAr:
          'بعد الحقن اطلب الطوارئ فورًا حتى لو تحسنت الأعراض. إذا استمرت الأعراض أو عادت، استخدم الجهاز الثاني الموصوف لك أثناء انتظار المساعدة.',
      teachBackAr:
          'أرني أي طرف يذهب على الفخذ، كم ثانية ستثبته، وماذا ستفعل مباشرة بعد الحقن؟',
    ),
  ),
  Medication(
    id: 'naloxone-narcan-nasal',
    familyId: 'cns',
    name: 'Naloxone Nasal Spray 4 mg (NARCAN)',
    subtitle: 'Single-use intranasal opioid-overdose rescue device',
    tags: ['Opioid overdose', 'Emergency', 'Nasal spray', 'Naloxone', 'OTC'],
    aliases: ['Narcan', 'Naloxone 4 mg nasal spray'],
    useProfile: MedicationUseProfile(
      route:
          'Intranasal emergency rescue. Each NARCAN 4 mg device delivers one spray into one nostril and is single use.',
      foodTiming: 'Emergency use only; not meal-related.',
      duration:
          'Keep available wherever opioid overdose could occur; replace used, damaged or expired devices.',
      formulationHandling:
          'Do not prime or test the device. Insert the nozzle into either nostril and press the plunger firmly once. Each repeat dose requires a new device.',
      monitoring:
          'Call emergency services immediately after the first dose. Watch breathing and responsiveness continuously; repeat a new 4 mg device every 2–3 minutes if there is no response or respiratory depression returns.',
      interactions:
          'Naloxone can precipitate acute opioid withdrawal in an opioid-dependent person. This is not a reason to withhold lifesaving treatment in suspected overdose.',
      commonMistakes:
          'Testing the spray before use, assuming one device contains multiple sprays, waiting too long to call emergency services, failing to repeat dosing when needed, or leaving the person alone after they wake.',
      specialPopulations:
          'Emergency supportive measures may still be required. Pediatric and adult overdose emergencies use the labeled intranasal rescue approach; clinical follow-up is necessary because some opioids outlast naloxone.',
    ),
    sourceLabel:
        'DailyMed · NARCAN naloxone hydrochloride nasal spray 4 mg · OTC Drug Facts updated Aug 2026',
    sections: [
      MedicationSection(
        title: 'Rescue sequence',
        body:
            'Suspected overdose: give one spray into one nostril, call emergency services immediately, watch the person, and use a NEW device every 2–3 minutes if they do not respond or become very sleepy/not breathing well again.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Device lock',
        body:
            'Do not prime or test. One device = one spray = one dose. Repeat doses always require a new device.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'دواء إسعاف لإنقاذ شخص يُشتبه أن لديه overdose من الأفيونات ولا يستيقظ أو لا يتنفس بشكل طبيعي.',
      howToUseAr:
          'لا تختبر الجهاز. أدخل الفوهة في إحدى فتحتي الأنف واضغط المكبس بقوة مرة واحدة. كل جهاز يعطي جرعة واحدة فقط.',
      timingAr:
          'أعط الجرعة فور الاشتباه بالـoverdose واتصل بالطوارئ مباشرة. إذا لم يستجب خلال 2–3 دقائق أو عاد النعاس/ضعف التنفس، استخدم جهازًا جديدًا.',
      importantAr:
          'ابقَ مع الشخص حتى وصول الإسعاف. قد يحتاج أكثر من جرعة لأن تأثير بعض الأفيونات أطول من naloxone.',
      commonActionableAr:
          'عند الاستيقاظ قد يحدث تعرق أو رجفة أو غثيان أو عصبية بسبب انسحاب الأفيون المفاجئ.',
      missedDoseAr:
          'ليس له جرعة يومية فائتة؛ يُستخدم كدواء إنقاذ عند الطوارئ فقط.',
      storageAr:
          'يحفظ بين 2–25°C، لا يجمّد، ويحمى من الضوء والحرارة الزائدة. لا تستخدم العبوة إذا كان الـblister مفتوحًا أو الجهاز متضررًا.',
      seekHelpAr:
          'الـoverdose حالة طارئة: اتصل بالطوارئ بعد الجرعة الأولى حتى لو استيقظ الشخص، وكرر الجرعات بجهاز جديد عند الحاجة.',
      teachBackAr:
          'هل ستختبر البخاخ قبل الاستعمال؟ وبعد أول جرعة متى تتصل بالطوارئ ومتى تعطي جهازًا جديدًا؟',
    ),
  ),
  Medication(
    id: 'baqsimi-glucagon-nasal',
    familyId: 'diabetes-endocrine',
    name: 'BAQSIMI Glucagon Nasal Powder 3 mg',
    subtitle: 'Single-use rescue device for severe hypoglycemia',
    tags: ['Severe hypoglycemia', 'Emergency', 'Nasal', 'Glucagon'],
    aliases: ['Baqsimi', 'Glucagon nasal powder'],
    useProfile: MedicationUseProfile(
      route:
          'Intranasal glucagon powder. One device delivers 3 mg into one nostril; inhalation is not required.',
      foodTiming:
          'Emergency use only. Once the patient is awake and can swallow safely, give fast-acting carbohydrate followed by a longer-acting snack/food.',
      duration:
          'Keep an unexpired device available for emergency use and replace it immediately after use.',
      formulationHandling:
          'Keep the device sealed in its shrink-wrapped tube until needed. Do not test or press the plunger before use. Insert the tip gently into one nostril until fingers touch the outside of the nose, then push the plunger fully until the green line disappears.',
      monitoring:
          'Call emergency medical help immediately after administration. If there is no response after 15 minutes, another 3 mg dose from a NEW device may be given while waiting for help.',
      interactions:
          'Clinical response may be reduced when hepatic glycogen is depleted. Indomethacin and warfarin have product-label interaction considerations that warrant pharmacist/clinician review.',
      commonMistakes:
          'Opening the protective tube in advance, testing the plunger, thinking the patient must inhale the powder, reusing the same device, or giving food/drink before an unconscious patient can swallow safely.',
      specialPopulations:
          'Current labeling supports severe hypoglycemia in adults and pediatric patients aged 1 year and older. Pheochromocytoma and insulinoma are contraindication/specialist-review issues.',
    ),
    sourceLabel:
        'DailyMed · BAQSIMI glucagon nasal powder 3 mg · revised Mar 2025/current 2026 labeling and IFU',
    sections: [
      MedicationSection(
        title: 'No inhalation required',
        body:
            'BAQSIMI works by nasal absorption; the patient does not need to inhale. Do not test the device. Press the plunger fully until the green line is no longer visible.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'After the dose',
        body:
            'Call emergency help immediately. If no response after 15 minutes, a second dose may be given from a NEW device. Give oral carbohydrate only after the person is awake and can swallow safely.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'دواء إنقاذ لانخفاض السكر الشديد عندما يحتاج الشخص لمساعدة غيره أو لا يستطيع أخذ السكر بنفسه.',
      howToUseAr:
          'لا تفتح الـtube ولا تختبر الجهاز مسبقًا. عند الطوارئ أدخل الطرف بلطف في فتحة أنف واحدة حتى تلامس أصابعك خارج الأنف، ثم اضغط المكبس بالكامل حتى يختفي الخط الأخضر. لا يحتاج المريض أن يستنشق.',
      timingAr:
          'استخدمه فورًا عند severe hypoglycemia حسب خطة الطوارئ، ثم اتصل بالطوارئ مباشرة.',
      importantAr:
          'إذا لم يستجب بعد 15 دقيقة يمكن إعطاء جرعة أخرى من جهاز جديد إذا كانت متوفرة. لا تحاول إعطاء أكل أو شراب لشخص فاقد الوعي.',
      commonActionableAr:
          'قد يحدث غثيان أو قيء أو صداع أو انزعاج/احتقان بالأنف.',
      missedDoseAr:
          'ليس له جرعة يومية فائتة؛ هو دواء إنقاذ للطوارئ.',
      storageAr:
          'احفظه داخل الـshrink-wrapped tube المغلق حتى لحظة الاستخدام وبدرجة حرارة لا تتجاوز 30°C. استبدل الجهاز بعد استخدامه وقبل انتهاء الصلاحية.',
      seekHelpAr:
          'اطلب الطوارئ بعد إعطاء الجرعة. عندما يستيقظ الشخص ويستطيع البلع بأمان، أعطه مصدر سكر سريع ثم وجبة/سناك يساعد على منع عودة الانخفاض.',
      teachBackAr:
          'هل يحتاج المريض أن يستنشق الدواء؟ وهل ستفتح الـtube مسبقًا؟ وماذا تفعل إذا لم يستجب بعد 15 دقيقة؟',
    ),
  ),
  Medication(
    id: 'dulaglutide-trulicity',
    familyId: 'diabetes-endocrine',
    name: 'Dulaglutide (TRULICITY)',
    subtitle: 'Once-weekly single-dose GLP-1 injection pen',
    tags: ['Diabetes', 'GLP-1', 'Weekly injection', 'Pen device'],
    aliases: ['Trulicity', 'Dulaglutide'],
    useProfile: MedicationUseProfile(
      route:
          'Single-dose subcutaneous pen available as 0.75, 1.5, 3 and 4.5 mg per 0.5 mL. Inject into abdomen, thigh or upper arm; upper arm injection is given by another person in the IFU.',
      foodTiming:
          'Once weekly at any time of day, with or without food. If changing the weekly day, keep at least 72 hours between doses.',
      duration:
          'Usually long-term treatment while effective, tolerated and clinically indicated.',
      formulationHandling:
          'Keep the pen locked while removing the base cap. Place the clear base flat and firmly on the skin, unlock the ring, press the green button, and keep the base against the skin until the second loud click, about 5–10 seconds. Injection is complete when the gray plunger is visible.',
      monitoring:
          'Glycemic response, GI tolerability, hydration/renal status if vomiting/diarrhea is substantial, and hypoglycemia when combined with insulin or a sulfonylurea.',
      interactions:
          'Delayed gastric emptying can affect oral medicine absorption. Insulin or sulfonylureas increase hypoglycemia risk and may require regimen review.',
      commonMistakes:
          'Unlocking/pressing the button before removing the base cap, removing the pen after the first click, not rotating sites, reusing the single-dose pen, or taking two weekly doses too close together.',
      specialPopulations:
          'Current U.S. labeling supports type 2 diabetes in pediatric patients 10 years and older with age-specific maximum dosing. Dose selection/escalation remains a prescriber decision.',
    ),
    sourceLabel:
        'DailyMed · TRULICITY (dulaglutide) single-dose pen · current 2026 prescribing information and IFU',
    sections: [
      MedicationSection(
        title: 'Pen technique lock',
        body:
            'Keep locked → pull base cap straight off → clear base flat on skin → unlock → press green button → hold until second loud click (about 5–10 seconds). Gray plunger visible confirms completion.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Missed dose + storage',
        body:
            'Take a missed dose only if at least 72 hours remain until the next scheduled dose; otherwise skip it. Refrigerate at 2–8°C; a pen may be kept below 30°C for a total of 14 days. Do not freeze.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'حقنة أسبوعية تساعد على خفض سكر الدم في النوع الثاني.',
      howToUseAr:
          'اختر البطن أو الفخذ وبدّل مكان الحقن. اترك القلم مقفولًا واسحب الغطاء السفلي، ضع القاعدة الشفافة ملاصقة للجلد، افتح القفل ثم اضغط الزر الأخضر. ابقِ القلم على الجلد حتى تسمع الـclick الثاني؛ عادة خلال 5–10 ثوانٍ.',
      timingAr:
          'مرة واحدة أسبوعيًا في نفس اليوم تقريبًا، في أي وقت ومع الطعام أو بدونه. لا تجعل جرعتين أقل من 72 ساعة عن بعضهما.',
      importantAr:
          'القلم جرعة واحدة فقط. إذا كنت تستخدم insulin أو sulfonylurea فقد يرتفع خطر هبوط السكر ويجب مراجعة الخطة.',
      commonActionableAr:
          'الغثيان أو الإسهال أو قلة الشهية أو القيء قد يحدث خصوصًا في بداية العلاج أو بعد رفع الجرعة؛ الوجبات الأصغر قد تساعد.',
      missedDoseAr:
          'إذا نسيت الجرعة وخ بقي 72 ساعة على الأقل حتى الجرعة القادمة، خذها عند التذكر. إذا بقي أقل من 72 ساعة، تجاوز الجرعة وخذ التالية في يومها المعتاد.',
      storageAr:
          'يحفظ في الثلاجة 2–8°C. يمكن إبقاء القلم تحت 30°C لمدة إجمالية تصل إلى 14 يومًا. لا تجمّده واحمه من الضوء.',
      seekHelpAr:
          'راجع الطبيب فورًا عند ألم بطن شديد ومستمر، قيء شديد مع جفاف، أو تحسس شديد. إذا كان السكر ينخفض مع أدوية أخرى فراجع جرعات الخطة.',
      teachBackAr:
          'متى تعرف أن الحقنة اكتملت؟ وما قاعدة 72 ساعة إذا نسيت الجرعة؟',
    ),
  ),
];
