import '../models/medication.dart';

const expandedMedications18 = <Medication>[
  Medication(
    id: 'glipizide-ir',
    familyId: 'diabetes-endocrine',
    name: 'Glipizide Immediate-Release',
    subtitle: 'Sulfonylurea · meal-timed immediate-release tablet',
    tags: ['Diabetes', 'Sulfonylurea', 'Oral', 'Before food'],
    aliases: ['Glucotrol', 'Glipizide regular tablet'],
    sourceLabel:
        'DailyMed · Glipizide immediate-release tablets · updated Feb 23, 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Immediate-release oral glipizide tablet for type 2 diabetes. Do not transfer timing instructions from extended-release glipizide.',
      foodTiming:
          'Give approximately 30 minutes before a meal; a once-daily starting regimen is commonly before breakfast. Divided regimens are tied to meals according to the prescription.',
      duration:
          'Usually long-term glucose-lowering therapy while effective and clinically appropriate.',
      formulationHandling:
          'This record is for immediate-release glipizide. Extended-release glipizide has a different administration rule and should not be substituted instruction-for-instruction.',
      monitoring:
          'Blood glucose and A1c; hypoglycemia risk increases with missed/delayed meals, reduced intake, renal/hepatic impairment, older age and combination glucose-lowering therapy.',
      interactions:
          'Other glucose-lowering agents increase hypoglycemia risk. Alcohol and some interacting medicines can alter glucose control; medication review is important.',
      commonMistakes:
          'Taking the immediate-release tablet with or after the meal, skipping the meal after taking it, or assuming the ER product has the same 30-minute pre-meal instruction.',
      specialPopulations:
          'Older/frail patients and patients with renal/hepatic impairment need conservative dosing and closer hypoglycemia monitoring.',
    ),
    sections: [
      MedicationSection(
        title: 'IR vs ER timing lock',
        body:
            'Immediate-release glipizide is generally administered about 30 minutes before a meal for best post-meal glucose effect. Do not copy this instruction to glipizide ER, which is taken with breakfast or the first main meal.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Hypoglycemia counseling',
        body:
            'Counsel around skipped or delayed meals, alcohol, exercise and concurrent insulin/secretagogues. The patient should know the personal plan for treating low glucose.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد على خفض سكر الدم في السكري النوع الثاني.',
      howToUseAr:
          'هذا هو glipizide العادي—not ER. خذ الجرعة تقريبًا قبل الوجبة بـ30 دقيقة حسب جدولك، ولا تأخذ الحبة ثم تؤخر أو تلغي الوجبة.',
      timingAr:
          'إذا كانت مرة يوميًا فغالبًا قبل الفطور؛ إذا كانت الجرعات مقسمة فاربط كل جرعة بالوجبة التي حددها الطبيب.',
      importantAr:
          'قد يسبب هبوط السكر، خصوصًا إذا تأخرت الوجبة أو لم تأكل. لا تطبق تعليماته على glipizide ممتد المفعول.',
      commonActionableAr:
          'قد يحدث رجفان، تعرق، جوع، خفقان أو دوخة عند انخفاض السكر؛ اتبع خطة علاج هبوط السكر التي أعطاها لك الفريق.',
      missedDoseAr:
          'إذا فات وقت الجرعة المرتبط بالوجبة لا تعوضها قرب الوجبة التالية من نفسك ولا تضاعف الجرعة؛ اتبع خطة السكري المكتوبة.',
      seekHelpAr:
          'اطلب المساعدة عند هبوط سكر شديد، فقدان وعي، تشنج، أو تكرر هبوط السكر رغم الالتزام.',
      teachBackAr:
          'هل هذا النوع عادي أم ER؟ كم دقيقة قبل الوجبة ستأخذه، وماذا ستفعل إذا لم تستطع تناول الوجبة؟',
    ),
  ),
  Medication(
    id: 'glipizide-er',
    familyId: 'diabetes-endocrine',
    name: 'Glipizide Extended-Release',
    subtitle: 'Once-daily sulfonylurea ER · breakfast/first-meal rule',
    tags: ['Diabetes', 'Sulfonylurea', 'ER', 'With food'],
    aliases: ['Glucotrol XL', 'Glipizide XL', 'Glipizide ER'],
    sourceLabel:
        'DailyMed · Glipizide extended-release tablets · updated Aug 27, 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Extended-release oral glipizide tablet for type 2 diabetes.',
      foodTiming:
          'Take once daily with breakfast or the first main meal of the day.',
      duration:
          'Usually long-term glucose-lowering therapy while effective and appropriate.',
      formulationHandling:
          'Swallow the ER tablet whole. Do not chew, crush or split an extended-release tablet unless the exact product label explicitly permits a specific manipulation.',
      monitoring:
          'Blood glucose and A1c; monitor for hypoglycemia, especially with low intake, older age, renal/hepatic impairment or combination therapy.',
      interactions:
          'Other glucose-lowering agents raise hypoglycemia risk. Review alcohol and interacting medicines that can alter glucose control.',
      commonMistakes:
          'Using the immediate-release rule of 30 minutes before meals, crushing the ER tablet, or taking the medicine and then skipping the first meal.',
      specialPopulations:
          'Older/frail patients and those with renal/hepatic impairment need cautious dosing and hypoglycemia surveillance.',
    ),
    sections: [
      MedicationSection(
        title: 'ER administration lock',
        body:
            'Current ER labeling directs once-daily administration with breakfast or the first main meal. This differs from immediate-release glipizide, which is generally given about 30 minutes before a meal.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد على خفض سكر الدم في السكري النوع الثاني.',
      howToUseAr:
          'إذا كانت العبوة مكتوب عليها ER/XL فخذها مرة يوميًا مع الفطور أو أول وجبة رئيسية، وابتلع الحبة كاملة.',
      timingAr:
          'مع الفطور أو أول وجبة رئيسية في اليوم، وليس 30 دقيقة قبل الطعام مثل النوع العادي.',
      importantAr:
          'لا تسحق أو تمضغ حبة ER. قد تسبب هبوط السكر، لذلك لا تتجاوز الوجبة بعد أخذها.',
      commonActionableAr:
          'انتبه لأعراض هبوط السكر مثل التعرق، الرجفة، الجوع، الدوخة أو الخفقان واتبع خطة علاج الهبوط.',
      missedDoseAr:
          'إذا فاتت جرعة اليوم لا تضاعف الجرعة التالية؛ تعامل معها حسب خطة السكري وتعليمات الوصفة.',
      seekHelpAr:
          'اطلب المساعدة عند هبوط سكر شديد أو فقدان وعي أو تكرر الهبوط.',
      teachBackAr:
          'أرني على العبوة أين مكتوب ER/XL، ومتى ستأخذها مقارنةً بـglipizide العادي؟',
    ),
  ),
  Medication(
    id: 'insulin-aspart-novolog',
    familyId: 'diabetes-endocrine',
    name: 'Insulin Aspart (NovoLog-type)',
    subtitle: 'Rapid-acting mealtime insulin · 5–10 min before meal',
    tags: ['Diabetes', 'Insulin', 'Rapid acting', 'Mealtime'],
    aliases: ['NovoLog', 'NovoRapid', 'Insulin aspart'],
    sourceLabel: 'DailyMed · NOVOLOG insulin aspart · current labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Subcutaneous rapid-acting insulin aspart. This record follows NOVOLOG timing; other insulin-aspart products such as faster aspart can have different meal timing.',
      foodTiming:
          'Inject subcutaneously within 5–10 minutes before a meal. The meal should be ready; do not inject and then unexpectedly delay or skip eating without a diabetes plan.',
      duration:
          'Usually long-term insulin therapy; dose is individualized to glucose, carbohydrate intake and the prescribed regimen.',
      formulationHandling:
          'Use only clear, colorless solution. Rotate injection sites. Never share pens, cartridges or needles. Pump and dilution instructions are product/device-specific.',
      monitoring:
          'Glucose/CGM, hypoglycemia, injection sites and insulin technique. Dose changes with illness, exercise, meal pattern or other insulin require individualized guidance.',
      interactions:
          'Other glucose-lowering medicines and many drugs can alter insulin requirements. Beta-blockers may blunt some warning symptoms of hypoglycemia.',
      commonMistakes:
          'Confusing NOVOLOG timing with regular insulin, injecting before food is available, using the same damaged/lumpy injection site repeatedly, or assuming all insulin-aspart brands share the same timing.',
      specialPopulations:
          'Children, pregnancy, renal/hepatic impairment and patients with variable food intake require individualized dosing and hypoglycemia planning.',
    ),
    sections: [
      MedicationSection(
        title: 'Meal-ready lock',
        body:
            'NOVOLOG subcutaneous dosing is within 5–10 minutes before the meal. Faster insulin-aspart formulations can have different timing; verify the exact brand before counseling.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Never share pens',
        body:
            'Pens and cartridges are single-patient-use devices even if the needle is changed.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'إنسولين سريع لتغطية ارتفاع السكر المرتبط بالوجبات.',
      howToUseAr:
          'إذا كان منتجك NOVOLOG/NovoRapid-type insulin aspart فاحقنه تحت الجلد خلال 5–10 دقائق قبل الوجبة، ودوّر أماكن الحقن.',
      timingAr:
          'الوجبة يجب أن تكون جاهزة. لا تحقن الجرعة ثم تؤخر أو تلغي الأكل من دون خطة واضحة.',
      importantAr:
          'لا تشارك قلم الإنسولين أو الخرطوشة مع أي شخص حتى لو تغيرت الإبرة. بعض منتجات insulin aspart الأسرع لها توقيت مختلف، لذلك تحقق من اسم البراند.',
      commonActionableAr:
          'أهم مشكلة هي هبوط السكر؛ احمل علاجًا سريعًا للهبوط حسب خطتك وتعرف على أعراضك.',
      missedDoseAr:
          'جرعة الوجبة المنسية لا تُعوض تلقائيًا بجرعة مضاعفة؛ افحص السكر واتبع خطة التصحيح الشخصية.',
      storageAr:
          'التخزين قبل وبعد بدء الاستعمال يختلف حسب القلم/الخرطوشة/الفيال؛ اتبع تعليمات نفس المنتج ولا تجمّد الإنسولين.',
      seekHelpAr:
          'اطلب المساعدة عند هبوط شديد، فقدان وعي، تشنج، أو إذا كان السكر مرتفعًا مع كيتونات/قيء حسب خطة الطوارئ.',
      teachBackAr:
          'كم دقيقة قبل الوجبة ستأخذ NOVOLOG؟ ماذا تفعل إذا الطعام لم يصبح جاهزًا؟ وأين ستغير موضع الحقن؟',
    ),
  ),
  Medication(
    id: 'isosorbide-mononitrate-er',
    familyId: 'cardiovascular',
    name: 'Isosorbide Mononitrate Extended-Release',
    subtitle: 'Long-acting nitrate · morning dose · not for acute angina',
    tags: ['Angina', 'Nitrate', 'ER', 'Morning'],
    aliases: ['Imdur', 'Isosorbide mononitrate ER'],
    sourceLabel:
        'DailyMed · Isosorbide mononitrate extended-release tablets · revised Mar 2025',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Extended-release oral nitrate for prevention of angina, not rapid treatment of an acute attack.',
      foodTiming:
          'Take the once-daily ER dose in the morning on arising, according to the prescription.',
      duration:
          'Usually ongoing preventive antianginal therapy while effective and tolerated.',
      formulationHandling:
          'Do not chew or crush the ER tablet. Splitting permissions differ by strength/product; follow the exact tablet label rather than assuming every ER strength can be split.',
      monitoring:
          'Angina frequency, blood pressure, dizziness and headache. Persistent worsening chest pain requires reassessment rather than extra ER doses.',
      interactions:
          'PDE-5 inhibitors such as sildenafil/tadalafil/vardenafil and riociguat can cause profound hypotension and are contraindicated with organic nitrates.',
      commonMistakes:
          'Using the ER tablet as rescue treatment, taking it at random times rather than the morning schedule, crushing it, or combining it with erectile-dysfunction medicines.',
      specialPopulations:
          'Hypotension, volume depletion and concomitant vasodilators increase dizziness/fainting risk.',
    ),
    sections: [
      MedicationSection(
        title: 'Morning ER lock',
        body:
            'Current ER labeling directs the daily dose in the morning on arising. Do not chew or crush the tablet.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'Not rescue + PDE-5 lock',
        body:
            'This long-acting product does not replace sublingual nitroglycerin for acute chest pain. Never combine nitrates with PDE-5 inhibitors or riociguat.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يقلل نوبات ألم الصدر المزمن عن طريق الوقاية، وليس لعلاج النوبة المفاجئة.',
      howToUseAr:
          'خذ حبة ER صباحًا عند الاستيقاظ حسب الوصفة، وابتلعها دون مضغ أو سحق.',
      timingAr: 'مرة يوميًا صباحًا في وقت ثابت تقريبًا.',
      importantAr:
          'لا تستخدمها بدل nitroglycerin تحت اللسان عند ألم الصدر الحاد. لا تجمعها مع sildenafil أو tadalafil أو vardenafil أو riociguat.',
      commonActionableAr:
          'الصداع شائع خاصة في البداية وقد تحدث دوخة؛ انهض ببطء واستشر الطبيب إذا كانت الأعراض شديدة.',
      missedDoseAr:
          'إذا نسيت جرعة لا تضاعف التالية ولا تغير جدول الصباح من نفسك؛ اتبع تعليمات الوصفة.',
      seekHelpAr:
          'تعامل مع ألم صدر جديد/شديد أو غير المعتاد كحالة طارئة حسب خطة القلب، واطلب المساعدة عند إغماء شديد.',
      teachBackAr:
          'هل هذه الحبة للوقاية أم للنوبة الحادة؟ متى ستأخذها، وما أدوية الانتصاب التي يمنع جمعها معها؟',
    ),
  ),
  Medication(
    id: 'clonidine-transdermal',
    familyId: 'cardiovascular',
    name: 'Clonidine Transdermal Patch',
    subtitle: '7-day antihypertensive patch · withdrawal and MRI locks',
    tags: ['Blood pressure', 'Patch', 'Weekly', 'Clonidine'],
    aliases: ['Catapres-TTS', 'Clonidine patch'],
    sourceLabel:
        'DailyMed · Clonidine Transdermal System USP · updated Mar 30, 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Transdermal clonidine system delivering medication continuously for 7 days.',
      foodTiming:
          'Not meal-related. Replace once every 7 days on the same day of the week.',
      duration:
          'Usually ongoing antihypertensive therapy until the prescriber changes/tapers it.',
      formulationHandling:
          'Apply to clean, dry, intact, hairless skin on the upper outer arm or upper chest; rotate sites and do not apply over folds/irritated skin. Do not cut the patch. Use the supplied adhesive cover if the system begins to loosen when the exact product provides one.',
      monitoring:
          'Blood pressure, pulse, sedation/dizziness and skin reaction. Abrupt interruption can cause rebound hypertension.',
      interactions:
          'Other sedating medicines/alcohol can worsen sedation. Beta-blocker co-therapy is especially relevant when clonidine is being discontinued.',
      commonMistakes:
          'Forgetting the weekly change, placing a new patch over the same irritated site, stopping suddenly, or leaving an aluminized patch on for MRI.',
      specialPopulations:
          'Patch skin reactions, older age, bradycardia and concomitant rate-slowing therapy require closer review.',
    ),
    sections: [
      MedicationSection(
        title: 'Weekly patch technique',
        body:
            'Replace every 7 days on a fresh hairless intact area of upper outer arm or chest. Do not shave the chosen site immediately before application and rotate sites.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'Withdrawal + MRI lock',
        body:
            'Do not stop clonidine suddenly because rebound hypertension can be severe. Current transdermal labeling states the system contains aluminum and should be removed before MRI.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'لاصقة تخفض ضغط الدم وتطلق clonidine بشكل مستمر لمدة أسبوع.',
      howToUseAr:
          'ضع اللاصقة على جلد سليم وجاف وخالٍ من الشعر في أعلى الذراع الخارجي أو أعلى الصدر، وغيّر المكان كل أسبوع.',
      timingAr:
          'غيّر اللاصقة كل 7 أيام في نفس يوم الأسبوع تقريبًا. انزع القديمة قبل وضع الجديدة.',
      importantAr:
          'لا توقف clonidine فجأة لأن الضغط قد يرتفع بشكل خطير. انزع اللاصقة قبل MRI حسب تعليمات الملصق الحالي لأنها تحتوي على الألمنيوم.',
      commonActionableAr:
          'قد يحدث نعاس، دوخة أو تهيج مكان اللاصقة. تجنب القيادة حتى تعرف تأثيرها عليك.',
      missedDoseAr:
          'إذا تأخرت عن تغيير اللاصقة لا تضع عدة لاصقات للتعويض؛ تواصل مع الصيدلي/الطبيب لتصحيح الجدول.',
      storageAr:
          'احفظ اللصقات في أكياسها حتى الاستخدام، وتخلص من المستعملة بحيث لا تبقى المادة اللاصقة مكشوفة وبعيدًا عن الأطفال والحيوانات.',
      seekHelpAr:
          'راجع بسرعة عند طفح شديد أو فقاعات مكان اللاصقة، إغماء/بطء نبض شديد، أو ارتفاع شديد في الضغط بعد توقف مفاجئ.',
      teachBackAr:
          'في أي يوم ستغيّر اللاصقة؟ أين ستضع الجديدة؟ وماذا يجب أن تفعل قبل MRI أو إذا أراد الطبيب إيقاف clonidine؟',
    ),
  ),
  Medication(
    id: 'esomeprazole-dr-capsule',
    familyId: 'gastrointestinal',
    name: 'Esomeprazole Delayed-Release Capsule',
    subtitle: 'PPI · at least 1 hour before meals · granules must stay intact',
    tags: ['GERD', 'PPI', 'Before food', 'Delayed release'],
    aliases: ['Nexium capsule', 'Esomeprazole DR'],
    sourceLabel:
        'DailyMed · Esomeprazole magnesium delayed-release capsules · current labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Delayed-release esomeprazole capsule. This record does not cover every packet/suspension formulation.',
      foodTiming:
          'Take at least 1 hour before meals. Frequency and duration depend on the indication.',
      duration:
          'Indication-specific: common GERD courses are time-limited, while maintenance or hypersecretory conditions may require longer therapy.',
      formulationHandling:
          'Swallow whole; do not crush or chew. If swallowing is difficult, the capsule may be opened and intact granules sprinkled on one tablespoon of applesauce, swallowed immediately without chewing; use of other foods is not established for the cited capsule label.',
      monitoring:
          'Reassess ongoing need for long-term PPI therapy; prolonged therapy can warrant magnesium, B12, bone or renal review depending on risk.',
      interactions:
          'Important interactions include selected antiretrovirals, high-dose methotrexate and CYP-related interactions; medication review is appropriate for chronic polypharmacy.',
      commonMistakes:
          'Taking after breakfast, chewing the granules, storing a prepared applesauce mixture, or assuming every esomeprazole formulation has identical administration instructions.',
      specialPopulations:
          'Alarm symptoms such as progressive dysphagia, GI bleeding, significant weight loss or recurrent vomiting need assessment rather than indefinite self-treatment.',
    ),
    sections: [
      MedicationSection(
        title: 'Before-food lock',
        body:
            'Current capsule labeling instructs administration at least 1 hour before meals.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Open-capsule option',
        body:
            'For swallowing difficulty, the capsule can be opened onto one tablespoon of applesauce. Swallow the intact granules immediately without chewing/crushing; do not store the mixture.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يقلل حموضة المعدة لعلاج الارتجاع أو حالات أخرى حسب وصفك.',
      howToUseAr:
          'خذ الكبسولة قبل الطعام بساعة على الأقل. ابتلعها كاملة؛ إذا لا تستطيع بلعها يمكن فتحها ووضع الحبيبات على ملعقة كبيرة من applesauce وابتلاعها فورًا دون مضغ.',
      timingAr:
          'قبل الوجبة بساعة على الأقل؛ إذا كانت الوصفة أكثر من مرة يوميًا فاتبع الوجبات المحددة لها.',
      importantAr:
          'لا تسحق أو تمضغ الحبيبات ولا تخزن خليط applesauce لوقت لاحق.',
      missedDoseAr:
          'خذ الجرعة عند التذكر إذا لم يقترب موعد التالية؛ إذا اقترب الموعد تجاوزها ولا تأخذ جرعتين معًا.',
      seekHelpAr:
          'راجع الطبيب عند صعوبة بلع متزايدة، براز أسود/قيء دموي، نقص وزن غير مفسر أو قيء مستمر.',
      teachBackAr:
          'كم ساعة قبل الطعام ستأخذها؟ وإذا فتحت الكبسولة، هل تمضغ الحبيبات أم تبتلعها مباشرة؟',
    ),
  ),
  Medication(
    id: 'fosfomycin-tromethamine-sachet',
    familyId: 'antiinfective',
    name: 'Fosfomycin Tromethamine 3 g Sachet',
    subtitle: 'Single-dose oral solution for uncomplicated cystitis',
    tags: ['UTI', 'Antibiotic', 'Sachet', 'Single dose'],
    aliases: ['Monurol', 'Fosfomycin 3 g sachet'],
    sourceLabel:
        'DailyMed · Fosfomycin tromethamine granules for oral solution · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Single-dose 3 g fosfomycin-equivalent sachet for oral solution for labeled uncomplicated acute cystitis in adult women.',
      foodTiming:
          'May be taken with or without food.',
      duration:
          'One sachet is one complete labeled course for uncomplicated cystitis; do not repeat daily unless a specialist has intentionally prescribed a different regimen.',
      formulationHandling:
          'Never swallow the dry granules. Empty the whole sachet into 3–4 oz (about 1/2 cup) of water, stir to dissolve, do not use hot water, and drink immediately.',
      monitoring:
          'Symptoms should improve; persistent/worsening urinary symptoms, fever or flank pain require reassessment for resistant/complicated infection or pyelonephritis.',
      interactions:
          'Metoclopramide can reduce fosfomycin concentrations; review concurrent medicines when relevant.',
      commonMistakes:
          'Swallowing the powder dry, mixing it with hot water, saving the prepared solution, or taking one sachet every day as though it were a multi-day antibiotic.',
      specialPopulations:
          'This labeled single-dose regimen is for uncomplicated cystitis in adult women; pregnancy, men, children, recurrent/complicated UTI and suspected upper-tract infection require individualized assessment.',
    ),
    sections: [
      MedicationSection(
        title: 'Single-dose lock',
        body:
            'For the labeled uncomplicated cystitis indication, one 3 g sachet is the complete course. Repeated daily dosing is not recommended simply because symptoms persist.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Preparation',
        body:
            'Dissolve the entire sachet in 3–4 oz of water. Do not use hot water and do not take the granules dry. Drink immediately after dissolving.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد حيوي بجرعة واحدة لبعض حالات التهاب المثانة غير المعقد عند النساء البالغات.',
      howToUseAr:
          'افرغ الكيس كاملًا في نصف كوب ماء تقريبًا، حرّكه حتى يذوب واشربه فورًا. لا تستخدم ماءً ساخنًا ولا تبلع المسحوق جافًا.',
      timingAr: 'جرعة واحدة فقط حسب الوصفة، ويمكن مع الطعام أو بدونه.',
      importantAr:
          'لا تكرر كيسًا كل يوم من نفسك؛ الكيس الواحد هو الكورس الموصوف لهذه الحالة.',
      commonActionableAr:
          'قد يحدث إسهال أو غثيان أو صداع عند بعض المرضى.',
      missedDoseAr:
          'هذا علاج بجرعة واحدة؛ إذا لم تأخذه في الوقت المقصود خذه عند تمكنك حسب الوصفة بدل مضاعفة أي جرعة.',
      storageAr: 'يحفظ الكيس الجاف بدرجة حرارة الغرفة حسب العبوة.',
      seekHelpAr:
          'راجع الطبيب إذا ظهرت حرارة، ألم بالخاصرة/الظهر، قيء، تدهور واضح أو استمرت الأعراض؛ قد لا تكون الحالة التهاب مثانة بسيطًا.',
      teachBackAr:
          'هل ستبلع المسحوق جافًا؟ كم كيسًا يشكل الكورس المعتاد لهذه الحالة، وما نوع الماء الذي لن تستخدمه؟',
    ),
  ),
  Medication(
    id: 'levofloxacin-oral',
    familyId: 'antiinfective',
    name: 'Levofloxacin Oral Tablets',
    subtitle: 'Fluoroquinolone · mineral separation and serious toxicity counseling',
    tags: ['Antibiotic', 'Fluoroquinolone', 'Oral', 'Mineral separation'],
    aliases: ['Levaquin', 'Levofloxacin tablets'],
    sourceLabel: 'DailyMed · Levofloxacin tablets · current labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Oral levofloxacin tablet; dose and duration vary by infection and renal function.',
      foodTiming:
          'Tablets may be taken with or without food. Separate by at least 2 hours before or 2 hours after magnesium/aluminum antacids, sucralfate, iron, zinc-containing multivitamins and listed cation products.',
      duration:
          'Short, infection-specific course; use only when the indication and risk-benefit justify a fluoroquinolone.',
      formulationHandling:
          'Swallow with adequate fluid. Maintain hydration unless fluid restriction is medically required.',
      monitoring:
          'Clinical response, renal function when relevant, and prompt recognition of tendon injury, peripheral neuropathy or serious CNS effects.',
      interactions:
          'Major chelation with polyvalent cations. Review QT-prolonging drugs, glucose-lowering therapy, corticosteroids and other risk-increasing medicines.',
      commonMistakes:
          'Taking with iron/zinc/antacid at the same time, continuing exercise through new tendon pain, or ignoring new numbness/burning or major neuropsychiatric symptoms.',
      specialPopulations:
          'Renal impairment requires dose adjustment. Older age, corticosteroid use, transplant history and selected vascular risk factors can increase serious adverse-event risk.',
    ),
    sections: [
      MedicationSection(
        title: '2-hour mineral separation',
        body:
            'Give the tablet at least 2 hours before or 2 hours after magnesium/aluminum antacids, sucralfate, iron, zinc-containing multivitamins and other listed cation products.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'High-value fluoroquinolone warning',
        body:
            'Do not dump every rare adverse effect. Counsel the patient to stop and obtain prompt medical advice for new tendon pain/swelling, significant numbness/burning/weakness or severe CNS effects.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد حيوي لبعض الالتهابات البكتيرية عندما يكون مناسبًا للحالة.',
      howToUseAr:
          'خذ الجرعة في وقتها ويمكن مع الطعام أو بدونه، واشرب سوائل كافية إذا لم يكن لديك تقييد للسوائل.',
      timingAr:
          'افصل الجرعة ساعتين على الأقل قبل أو بعد مضادات الحموضة التي تحتوي مغنيسيوم/ألمنيوم، sucralfate، الحديد أو الزنك.',
      importantAr:
          'أوقف الدواء واتصل بالطبيب بسرعة عند ألم/تورم وتر جديد أو تنميل/حرق/ضعف عصبي واضح. لا تكمل التمارين فوق ألم وتر جديد.',
      commonActionableAr:
          'قد يحدث غثيان أو إسهال خفيف، لكن الأعراض العصبية أو ألم الأوتار ليست شيئًا تتجاهله.',
      missedDoseAr:
          'إذا تذكرت الجرعة وبقي أكثر من 8 ساعات للجرعة التالية خذها؛ إذا بقي أقل من 8 ساعات انتظر الجرعة التالية ولا تضاعف.',
      seekHelpAr:
          'اطلب مساعدة عاجلة عند تمزق/ألم وتر شديد، أعراض عصبية شديدة، إغماء/خفقان شديد أو تفاعل تحسسي.',
      teachBackAr:
          'ما المعادن/مضادات الحموضة التي ستفصلها ساعتين؟ وماذا ستفعل إذا ظهر ألم مفاجئ في وتر؟',
    ),
  ),
  Medication(
    id: 'topiramate-tablets',
    familyId: 'cns',
    name: 'Topiramate Tablets',
    subtitle: 'Epilepsy/migraine prevention · hydration, cognition and eye red flags',
    tags: ['Epilepsy', 'Migraine prevention', 'Oral', 'Chronic'],
    aliases: ['Topamax', 'Topiramate'],
    sourceLabel:
        'DailyMed · Topiramate tablets · updated Jun 2026 medication guide/labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Immediate-release topiramate tablets; indication and titration differ between epilepsy and migraine prevention.',
      foodTiming:
          'May be taken with or without food. Maintain adequate fluid intake unless medically restricted.',
      duration:
          'Usually long-term preventive/antiseizure therapy with gradual titration and gradual discontinuation when appropriate.',
      formulationHandling:
          'Use the exact tablet/capsule/liquid formulation prescribed; sprinkle capsules and oral solution have separate instructions.',
      monitoring:
          'Clinical response, cognitive effects, weight, bicarbonate/metabolic acidosis risk and kidney-stone risk when clinically indicated.',
      interactions:
          'Valproate can increase hyperammonemia/hypothermia risk. Other carbonic anhydrase inhibitors/ketogenic diet can increase acidosis and kidney-stone risk. Hormonal contraception interaction can matter at selected doses.',
      commonMistakes:
          'Stopping abruptly, poor hydration, assuming tingling/cognitive slowing is unrelated, or ignoring sudden eye pain/blurred vision.',
      specialPopulations:
          'Pregnancy is a major counseling issue because fetal risk is established; patients who can become pregnant need effective contraception and preconception review.',
    ),
    sections: [
      MedicationSection(
        title: 'Hydration + cognitive counseling',
        body:
            'Adequate hydration is recommended to reduce kidney-stone risk. Tingling, cognitive slowing, word-finding difficulty and sleepiness can affect adherence and safety.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'Eye emergency + do not stop abruptly',
        body:
            'Acute myopia/secondary angle-closure glaucoma can present with sudden eye pain or visual change and needs urgent evaluation. Antiseizure therapy should not be stopped abruptly without a plan.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يستخدم للصرع أو للوقاية من الشقيقة حسب الحالة—not لعلاج نوبة الشقيقة فورًا.',
      howToUseAr:
          'خذه حسب جدول الزيادة الذي وصفه الطبيب ويمكن مع الطعام أو بدونه. اشرب سوائل كافية خلال اليوم إذا لم يمنعك الطبيب.',
      timingAr: 'خذ الجرعات في أوقات ثابتة حسب الوصفة.',
      importantAr:
          'لا توقفه فجأة. قد يسبب بطئًا في التفكير أو صعوبة إيجاد الكلمات أو تنميلًا بالأطراف. الحمل يحتاج مناقشة مسبقة لأن الدواء قد يضر الجنين.',
      commonActionableAr:
          'التنميل، نقص الشهية أو بطء التفكير قد يحدث؛ إذا أثر على القيادة أو الدراسة/العمل أخبر الطبيب.',
      missedDoseAr:
          'إذا نسيت جرعة واحدة خذها عند التذكر، لكن إذا بقي أقل من 6 ساعات للجرعة التالية فتجاوزها. لا تضاعف، وإذا فاتت أكثر من جرعة تواصل مع الطبيب.',
      seekHelpAr:
          'اطلب تقييمًا عاجلًا عند ألم مفاجئ في العين أو تشوش/نقص الرؤية، أو أعراض شديدة غير معتادة.',
      teachBackAr:
          'لماذا سنركز على شرب السوائل؟ وما أعراض العين التي لا تنتظر؟ وهل توقف الدواء فجأة؟',
    ),
  ),
  Medication(
    id: 'aripiprazole-tablets',
    familyId: 'cns',
    name: 'Aripiprazole Tablets',
    subtitle: 'Atypical antipsychotic · once daily · impulse-control counseling',
    tags: ['Antipsychotic', 'Bipolar', 'Schizophrenia', 'Oral'],
    aliases: ['Abilify', 'Aripiprazole'],
    sourceLabel:
        'DailyMed · Aripiprazole tablets · updated Aug 30, 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Oral aripiprazole tablet. Long-acting injections and oral solution/ODT are separate formulations.',
      foodTiming:
          'Administer once daily without regard to meals; choose a consistent time based on tolerability and regimen.',
      duration:
          'Usually ongoing psychiatric treatment, with duration individualized to diagnosis, relapse risk and response.',
      formulationHandling:
          'Swallow tablet whole. Do not transfer missed-dose or conversion instructions from long-acting injectable aripiprazole products.',
      monitoring:
          'Symptoms, akathisia/restlessness, sedation, orthostasis, weight/metabolic parameters and emergence of compulsive behaviors.',
      interactions:
          'Strong CYP2D6/CYP3A4 inhibitors and CYP3A4 inducers can require dose adjustment. Alcohol/sedatives can worsen impairment.',
      commonMistakes:
          'Assuming new gambling/shopping/sexual/binge-eating urges are unrelated, stopping abruptly without prescriber guidance, or confusing oral tablet dosing with LAI schedules.',
      specialPopulations:
          'Older adults with dementia-related psychosis have increased mortality and aripiprazole is not approved for that use. Monitor suicidality when used in populations/indications where antidepressant boxed warnings apply.',
    ),
    sections: [
      MedicationSection(
        title: 'Impulse-control counseling',
        body:
            'Ask patients/caregivers about new or intense gambling, sexual, shopping or binge-eating urges. Patients may not recognize these as medication-related.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يستخدم لبعض حالات الفصام أو الاضطراب ثنائي القطب وحالات أخرى حسب وصف الطبيب.',
      howToUseAr:
          'خذ الحبة مرة يوميًا في وقت ثابت تقريبًا، مع الطعام أو بدونه.',
      timingAr:
          'لا يوجد وقت صباح/مساء إلزامي؛ اختر الوقت المتفق عليه حسب تأثيره عليك والتزم به.',
      importantAr:
          'أخبر الطبيب إذا ظهرت رغبة جديدة قوية بالمقامرة أو التسوق أو الجنس أو الأكل القهري؛ قد تكون مرتبطة بالدواء.',
      commonActionableAr:
          'قد يحدث توتر/عدم القدرة على الجلوس (akathisia)، دوخة أو نعاس عند بعض المرضى.',
      missedDoseAr:
          'خذ الجرعة عند التذكر إذا لم يقترب موعد التالية؛ إذا اقترب تجاوزها ولا تأخذ جرعتين معًا.',
      seekHelpAr:
          'اطلب مساعدة عند أفكار إيذاء النفس، تيبس شديد مع حرارة/ارتباك، إغماء أو تفاعل تحسسي شديد.',
      teachBackAr:
          'ما التغير السلوكي غير المعتاد الذي ستخبر الطبيب عنه؟ وهل تحتاج الطعام مع الجرعة؟',
    ),
  ),
  Medication(
    id: 'olanzapine-tablets',
    familyId: 'cns',
    name: 'Olanzapine Tablets',
    subtitle: 'Atypical antipsychotic · metabolic and sedation counseling',
    tags: ['Antipsychotic', 'Bipolar', 'Schizophrenia', 'Oral'],
    aliases: ['Zyprexa', 'Olanzapine'],
    sourceLabel:
        'DailyMed · ZYPREXA olanzapine tablets · updated Jan 31, 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Oral olanzapine tablet. ODT and injectable products are separate formulations.',
      foodTiming:
          'Once daily without regard to meals. Timing can be individualized; sedation often influences the chosen time but is not a universal label requirement.',
      duration:
          'Usually ongoing psychiatric therapy, individualized to diagnosis, response and relapse risk.',
      formulationHandling:
          'This record is for standard oral tablets; do not transfer administration instructions from Zydis ODT or injectable olanzapine.',
      monitoring:
          'Weight/BMI, appetite, glucose/A1c, lipids, sedation, orthostasis and movement symptoms.',
      interactions:
          'Smoking status can alter olanzapine exposure through CYP1A2. Alcohol and sedatives can worsen impairment; medication review is important.',
      commonMistakes:
          'Ignoring rapid weight/appetite change or hyperglycemia symptoms, stopping suddenly after improvement, or assuming every olanzapine formulation is interchangeable.',
      specialPopulations:
          'Older adults with dementia-related psychosis have increased mortality and olanzapine is not approved for that use.',
    ),
    sections: [
      MedicationSection(
        title: 'Metabolic counseling',
        body:
            'Weight gain and metabolic changes are high-value counseling points. Monitor weight, glucose and lipids rather than giving an exhaustive adverse-effect list.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يستخدم لبعض حالات الفصام أو الاضطراب ثنائي القطب وحالات أخرى حسب الخطة.',
      howToUseAr:
          'خذ الحبة مرة يوميًا في الوقت الذي حدده الطبيب، مع الطعام أو بدونه.',
      timingAr:
          'لا يشترط الطعام. إذا سبب نعاسًا قد يختار الطبيب وقتًا يناسب ذلك، لكن لا تغيّر التوقيت من نفسك إذا كانت لديك خطة محددة.',
      importantAr:
          'راقب زيادة الشهية والوزن؛ يحتاج الدواء متابعة السكر والدهون عند الاستخدام المستمر.',
      commonActionableAr:
          'النعاس وزيادة الشهية/الوزن شائعان وقد تحدث دوخة عند الوقوف.',
      missedDoseAr:
          'خذ الجرعة عند التذكر إذا لم يقترب موعد التالية؛ لا تضاعف الجرعة.',
      seekHelpAr:
          'اطلب المساعدة عند عطش وتبول شديدين مع تعب/قيء، تيبس شديد مع حرارة وارتباك، إغماء أو تفاعل شديد.',
      teachBackAr:
          'ما الأمور التي سنراقبها مع الوزن؟ وهل يجب أخذه مع الطعام؟',
    ),
  ),
  Medication(
    id: 'tranexamic-acid-hmb-650mg',
    familyId: 'womens-health',
    name: 'Tranexamic Acid 650 mg for Heavy Menstrual Bleeding',
    subtitle: 'Cycle-limited antifibrinolytic · maximum 5 days per period',
    tags: ['Heavy menstrual bleeding', 'Oral', 'Short course', 'Women’s health'],
    aliases: ['Lysteda', 'Tranexamic acid 650 mg'],
    sourceLabel:
        'DailyMed · Tranexamic acid 650 mg tablets for heavy menstrual bleeding · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Oral 650 mg tablet record for cyclic heavy menstrual bleeding in females of reproductive potential; other tranexamic-acid indications/routes use different dosing.',
      foodTiming:
          'May be taken with or without food. Start only once menstruation has started.',
      duration:
          'Use for a maximum of 5 days during each monthly menstruation; not a daily medicine between periods.',
      formulationHandling:
          'Swallow tablets whole; do not chew or break apart.',
      monitoring:
          'Bleeding response, renal function for dose adjustment, thrombotic risk and new visual symptoms.',
      interactions:
          'Combined hormonal contraception is contraindicated in the U.S. label because thromboembolic risk can increase. Review procoagulant therapies and relevant leukemia treatments.',
      commonMistakes:
          'Starting before the period, taking it between periods, exceeding 5 days, breaking tablets, or combining with estrogen-containing contraception without review.',
      specialPopulations:
          'Renal impairment requires dose reduction. A history/current thrombosis or intrinsic high thrombotic risk can contraindicate treatment.',
    ),
    sections: [
      MedicationSection(
        title: 'Cycle-only lock',
        body:
            'For the heavy-menstrual-bleeding label, treatment begins after the period starts and is used for a maximum of 5 days during that menstruation.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Combined hormonal contraception lock',
        body:
            'Current U.S. labeling contraindicates use with combined hormonal contraception because of thromboembolic risk.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يقلل غزارة نزف الدورة الشهرية؛ لا يوقف الدورة ولا يُستخدم يوميًا طوال الشهر.',
      howToUseAr:
          'ابدئيه فقط بعد بدء الدورة وخذيه بالجرعة المكتوبة لك لمدة لا تتجاوز 5 أيام في نفس الدورة. ابتلعي الحبات كاملة.',
      timingAr:
          'يمكن مع الطعام أو بدونه، لكن لا يؤخذ عندما لا توجد دورة.',
      importantAr:
          'أخبري الطبيب إذا تستخدمين حبوب/لاصقة/حلقة منع حمل مركبة تحتوي estrogen؛ الجمع ممنوع في الملصق الأمريكي بسبب خطر الجلطات.',
      commonActionableAr:
          'قد يحدث صداع أو ألم بطني/عضلي عند بعض المريضات.',
      missedDoseAr:
          'إذا نسيت جرعة خذيها عند التذكر، واجعلي الجرعة التالية بعد 6 ساعات على الأقل. لا تأخذي أكثر من حبتين 650 mg دفعة واحدة لتعويض جرعة منسية.',
      seekHelpAr:
          'أوقفيه واطلبي تقييمًا عند ألم/تورم ساق، ضيق نفس مفاجئ، ألم صدر أو أي تغير جديد في الرؤية.',
      teachBackAr:
          'متى تبدأين الدواء ومتى يجب إيقافه في كل دورة؟ وما نوع مانع الحمل الذي يجب أن تخبريني عنه؟',
    ),
  ),
  Medication(
    id: 'micronized-progesterone-oral',
    familyId: 'womens-health',
    name: 'Micronized Progesterone Oral Capsules',
    subtitle: 'Bedtime oral progesterone · sedation and product-allergy locks',
    tags: ['Progesterone', 'Women’s health', 'Oral', 'Bedtime'],
    aliases: ['Prometrium', 'Micronized progesterone'],
    sourceLabel:
        'DailyMed · PROMETRIUM / progesterone capsules · updated Jan 6, 2026 and current generics',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Oral micronized progesterone capsule. Vaginal progesterone products use different routes, doses and administration.',
      foodTiming:
          'Take the prescribed oral dose at bedtime because dizziness/drowsiness can be prominent. Food increases progesterone exposure; keep administration consistent with the prescribed product instructions.',
      duration:
          'Indication-specific cyclic therapy. U.S. labeling includes 12 days per 28-day cycle for endometrial-hyperplasia prevention with estrogen and 10 days for secondary amenorrhea; other specialist indications use different regimens.',
      formulationHandling:
          'Swallow the capsule as directed. Do not substitute vaginal progesterone instructions. PROMETRIUM and many U.S. generics contain peanut/arachis oil; verify the exact product in patients with peanut allergy.',
      monitoring:
          'Indication response, abnormal bleeding, dizziness/sedation and relevant estrogen/progestogen risk assessment.',
      interactions:
          'Sedating medicines can worsen drowsiness. CYP3A4 inhibitors may increase exposure; clinically important interaction review depends on the full regimen.',
      commonMistakes:
          'Taking it in the morning before driving, copying a fertility/vaginal progesterone regimen, or overlooking peanut-oil excipient allergy in the exact capsule product.',
      specialPopulations:
          'Pregnancy/fertility use, menopausal hormone therapy and amenorrhea require different specialist regimens. Do not infer one schedule from another.',
    ),
    sections: [
      MedicationSection(
        title: 'Bedtime lock',
        body:
            'Current oral capsule labeling directs a single daily dose at bedtime because marked dizziness/drowsiness can occur.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'Route + excipient lock',
        body:
            'Oral micronized progesterone is not instruction-equivalent to vaginal progesterone. PROMETRIUM and multiple U.S. generic capsules contain peanut/arachis oil; check the exact product for patients with peanut allergy.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم كبروجسترون فموي في خطط نسائية محددة حسب السبب.',
      howToUseAr:
          'خذ الكبسولة في موعد النوم حسب الجدول الذي وصفه الطبيب؛ بعض الخطط تكون أيامًا محددة فقط من كل دورة.',
      timingAr:
          'عند النوم لأن الدواء قد يسبب دوخة ونعاسًا واضحين. حافظ على نفس الطريقة بالنسبة للطعام حسب تعليمات منتجك.',
      importantAr:
          'لا تستخدم جدول الكبسولات الفموية بدل progesterone المهبلي أو العكس. بعض المنتجات مثل PROMETRIUM وعدة generics تحتوي peanut oil؛ تحقق من المنتج إذا لديك حساسية فول سوداني.',
      commonActionableAr:
          'النعاس والدوخة قد يكونان واضحين خصوصًا في البداية؛ لا تقد السيارة بعد الجرعة.',
      missedDoseAr:
          'لأن الجداول دورية وتختلف حسب الاستطباب، لا تضاعف جرعة منسية؛ اتبع تعليمات الخطة الخاصة بك.',
      seekHelpAr:
          'راجع الطبيب عند نزف غير معتاد شديد، إغماء/دوخة شديدة أو أعراض تحسس.',
      teachBackAr:
          'متى ستأخذ الكبسولة؟ هل خطتك يومية أم أيام محددة من الدورة؟ وهل منتجك يحتوي peanut oil؟',
    ),
  ),
];