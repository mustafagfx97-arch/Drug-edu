import '../models/medication.dart';

const expandedMedications39 = <Medication>[
  Medication(
    id: 'tapentadol-er',
    familyId: 'cns',
    name: 'Tapentadol Extended-Release',
    subtitle: 'Chronic severe pain · IR total daily dose split into 2 ER doses',
    tags: ['Pain', 'Tapentadol', 'Opioid', 'Extended release', 'Controlled substance'],
    aliases: ['NUCYNTA ER', 'Tapentadol ER'],
    sourceLabel:
        'DailyMed · NUCYNTA ER / tapentadol extended-release tablets · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Extended-release tapentadol for severe persistent pain requiring around-the-clock opioid therapy when alternatives are inadequate.',
      foodTiming:
          'May be taken with or without food. Take approximately every 12 hours according to the ER regimen.',
      duration:
          'Individualized long-term opioid therapy only when benefits outweigh risks; reassess function, pain control and opioid harms regularly.',
      formulationHandling:
          'Swallow ER tablets whole, one at a time, with enough water. Do not cut, break, chew, crush or dissolve because rapid release can cause overdose.',
      releaseConversion:
          'Patients can be converted from tapentadol immediate-release to tapentadol ER using the equivalent total daily tapentadol dose divided into two equal ER doses separated by approximately 12 hours. Example: tapentadol IR 50 mg four times daily = 200 mg/day → tapentadol ER 100 mg twice daily. Conversion may increase risk of excessive sedation or respiratory depression, so reassess after the switch. Do not use this same-dose rule to convert from a different opioid; opioid cross-conversion is a separate high-risk calculation.',
      monitoring:
          'Pain/function, sedation, respiratory rate, constipation, blood pressure, misuse risk, serotonin toxicity risk and concurrent CNS depressants.',
      interactions:
          'Alcohol, benzodiazepines and other CNS depressants increase respiratory-depression risk. MAO inhibitors are contraindicated within the label-defined washout period; serotonergic combinations require caution.',
      commonMistakes:
          'Keeping the old IR frequency after switching, crushing ER, dividing tablets, or applying the tapentadol IR→ER rule to a different opioid.',
      specialPopulations:
          'Renal/hepatic impairment and older/frail patients may require different product suitability or dosing. Opioid-naive patients have a separate ER starting regimen.',
    ),
    sections: [
      MedicationSection(
        title: 'Tapentadol IR → ER conversion',
        body:
            'Use the same total daily tapentadol dose and divide it into two equal ER doses about 12 hours apart. Example: IR 50 mg QID (200 mg/day) → ER 100 mg BID.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Opioid cross-conversion lock',
        body:
            'Do not generalize the same-dose tapentadol rule to other opioids. Cross-opioid conversion requires a separate, conservative clinical assessment.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'صيغة ممتدة من tapentadol للألم الشديد المستمر عندما تكون هناك حاجة لعلاج opioid منتظم.',
      howToUseAr:
          'ابتلع حبة ER كاملة مع الماء. لا تقطعها أو تكسرها أو تسحقها أو تمضغها أو تذيبها لأن ذلك قد يطلق الجرعة بسرعة ويسبب overdose.',
      timingAr:
          'تؤخذ عادةً كل حوالي 12 ساعة حسب الوصفة، مع الطعام أو بدونه.',
      importantAr:
          'عند التحويل من tapentadol العادي إلى ER يبقى مجموع الجرعة اليومية نفسه لكنه يُقسم إلى جرعتين متساويتين. مثال: 50 mg أربع مرات يوميًا = 200 mg/day → 100 mg ER مرتين يوميًا. لا تستخدم هذه القاعدة للتحويل من opioid آخر.',
      commonActionableAr:
          'قد يسبب نعاسًا أو دوخة أو غثيانًا أو إمساكًا؛ تجنب الكحول والمهدئات غير الموصوفة.',
      missedDoseAr:
          'لا تضاعف جرعة ER ولا تأخذ جرعة إضافية من نفسك لتعويض الجرعة الفائتة.',
      seekHelpAr:
          'اطلب إسعافًا عند بطء أو صعوبة التنفس أو نعاس شديد لا يمكن إيقاظ المريض منه.',
      teachBackAr:
          'إذا كان مجموع tapentadol العادي 200 mg/day، كيف يُقسم عند التحويل إلى ER؟ وهل يمكنك تطبيق نفس القاعدة على morphine مثلًا؟',
    ),
  ),
  Medication(
    id: 'theophylline-er-once-daily',
    familyId: 'respiratory',
    name: 'Theophylline Extended-Release Once-Daily Tablets',
    subtitle: 'Stabilized age ≥12 · mg-for-mg transfer with level monitoring',
    tags: ['Theophylline', 'Extended release', 'Respiratory', 'Therapeutic drug monitoring'],
    aliases: ['Theophylline ER 400 mg', 'Theophylline ER 600 mg'],
    sourceLabel:
        'DailyMed · Theophylline anhydrous extended-release tablets 400/600 mg · updated Sep 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily extended-release theophylline in appropriately selected patients; narrow therapeutic index requires careful monitoring.',
      foodTiming:
          'The reviewed 400/600 mg ER tablets may be taken once daily morning or evening. Food exposure changes kinetics, so choose either fed or fasting administration and keep it consistent.',
      duration:
          'Usually chronic/individualized when theophylline is selected; ongoing benefit, toxicity risk and serum levels should be reassessed.',
      formulationHandling:
          'Do not chew or crush. The reviewed scored tablet may be split. An intact matrix shell may rarely appear in stool and usually contains little or no residual theophylline.',
      releaseConversion:
          'Stabilized patients age 12 years or older taking an immediate-release or controlled-release theophylline product may be transferred to once-daily theophylline ER 400 or 600 mg on a milligram-for-milligram basis when the intended daily dose matches an available ER strength. However, once-daily ER can produce different peak and trough serum concentrations than the previous product/regimen, so serum theophylline monitoring and clinical reassessment are required rather than assuming identical exposure.',
      monitoring:
          'Serum theophylline concentration, heart rate, nausea/vomiting, tremor, insomnia, arrhythmia/seizure toxicity and interacting drugs or smoking-status changes.',
      interactions:
          'Many drugs, acute illnesses and smoking changes can alter theophylline clearance. New interacting medicines require review because toxicity can be serious.',
      commonMistakes:
          'Treating mg-for-mg transfer as proof of identical peaks/troughs, crushing ER, changing fed/fasting administration day to day, or ignoring smoking/drug-interaction changes.',
      specialPopulations:
          'Children under 12, older adults, liver disease, heart failure, fever/prolonged illness and interacting medicines require especially cautious dosing and level monitoring.',
    ),
    sections: [
      MedicationSection(
        title: 'IR/controlled-release → once-daily ER',
        body:
            'For stabilized patients age ≥12, current labeling allows mg-for-mg transfer to 400 or 600 mg once-daily ER when the daily dose fits. Peak/trough levels can differ, so follow serum concentrations and symptoms.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Food consistency lock',
        body:
            'Take consistently either with food or fasting. Switching back and forth can change absorption and serum concentrations.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'صيغة ممتدة من theophylline لبعض حالات التنفس المختارة، وهو دواء يحتاج متابعة لأن المجال بين الجرعة المفيدة والجرعة السامة ضيق.',
      howToUseAr:
          'لا تسحق أو تمضغ حبة ER. إذا كان منتجك المراجع scored فقد يسمح بتقسيمها، لكن اتبع نفس المنتج بالضبط.',
      timingAr:
          'مرة يوميًا صباحًا أو مساءً حسب الوصفة، والمهم أن تثبت طريقة الطعام: دائمًا مع الطعام أو دائمًا بدون طعام حسب خطتك.',
      importantAr:
          'في المريض المستقر بعمر 12 سنة فأكثر يمكن أحيانًا التحويل من theophylline العادي أو controlled-release إلى ER مرة يوميًا بنفس مجموع الـmg إذا وافقت القوة المتوفرة، لكن مستوى الدواء في الدم قد يتغير لذلك نحتاج متابعة level والأعراض.',
      commonActionableAr:
          'الغثيان أو الرجفة أو الأرق أو الخفقان قد تكون علامات جرعة زائدة أو مستوى مرتفع وتحتاج مراجعة.',
      missedDoseAr:
          'لا تضاعف الجرعة التالية؛ اسأل إذا كان لديك جدول مراقبة مستوى محدد.',
      seekHelpAr:
          'اطلب تقييمًا عاجلًا عند قيء متكرر شديد، خفقان/اضطراب نبض واضح، ارتباك أو تشنج.',
      teachBackAr:
          'هل mg-for-mg يعني أن peak وtrough سيبقيان مطابقين تمامًا بعد التحويل؟ ولماذا يجب تثبيت طريقة الطعام؟',
    ),
  ),
  Medication(
    id: 'mesalamine-dr-800mg',
    familyId: 'gastrointestinal',
    name: 'Mesalamine Delayed-Release 800 mg Tablets',
    subtitle: 'Ulcerative colitis · release-system specific · not substitutable by tablet arithmetic',
    tags: ['Mesalamine', 'Ulcerative colitis', 'Delayed release', 'GI', 'Formulation specific'],
    aliases: ['Mesalamine DR 800 mg'],
    sourceLabel:
        'DailyMed · Mesalamine delayed-release tablets 800 mg · updated Jul 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Delayed-release mesalamine 800 mg for moderately active ulcerative colitis in adults according to the reviewed product labeling.',
      foodTiming:
          'For the reviewed 800 mg delayed-release tablet, take on an empty stomach at least 1 hour before and 2 hours after a meal.',
      duration:
          'The reviewed 800 mg product labeling supports a 6-week treatment course for moderately active ulcerative colitis; longer-term mesalamine regimens depend on the exact product and indication.',
      formulationHandling:
          'Swallow whole; do not cut, break or chew. Drink adequate fluids.',
      releaseConversion:
          'Do not substitute one mesalamine delayed-release 800 mg tablet for two 400 mg delayed-release mesalamine oral products. Mesalamine products differ in release characteristics and site of drug delivery, so tablet arithmetic does not prove interchangeability. Any switch between mesalamine products should be product- and indication-specific rather than an automatic milligram conversion.',
      monitoring:
          'Renal function before and during treatment, symptom response, hydration and signs of mesalamine intolerance or kidney injury.',
      interactions:
          'Nephrotoxic agents including NSAIDs can increase renal risk. Azathioprine/6-mercaptopurine combinations can increase blood-dyscrasia risk.',
      commonMistakes:
          'Replacing one 800 mg DR tablet with two 400 mg products, taking the reviewed tablet with food, chewing/breaking the DR tablet or assuming all mesalamine brands release at the same site.',
      specialPopulations:
          'Renal impairment requires particular caution. Different mesalamine formulations have different approved indications, food rules and release systems.',
    ),
    sections: [
      MedicationSection(
        title: 'Mesalamine non-interchangeability lock',
        body:
            'One 800 mg delayed-release tablet is NOT automatically interchangeable with two 400 mg delayed-release mesalamine products. Release characteristics matter, not only total milligrams.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Empty-stomach lock',
        body:
            'For the reviewed 800 mg DR product, take at least 1 hour before and 2 hours after food and swallow whole.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'Mesalamine delayed-release لعلاج التهاب القولون التقرحي حسب نوع المنتج والوصفة.',
      howToUseAr:
          'ابتلع الحبة كاملة ولا تقطعها أو تكسرها أو تمضغها، واشرب سوائل كافية.',
      timingAr:
          'للمنتج 800 mg الذي تمت مراجعته: على معدة فارغة، قبل الطعام بساعة على الأقل أو بعده بساعتين.',
      importantAr:
          'لا تعتبر حبة mesalamine 800 mg مساوية تلقائيًا لحبتين 400 mg؛ اختلاف نظام الإطلاق ومكان تحرير الدواء مهم، لذلك تبديل المنتجات يحتاج مراجعة نفس البراند/التركيبة.',
      commonActionableAr:
          'إذا ظهرت آلام بطن أو إسهال يزداد بدل أن يتحسن، أو أعراض غير معتادة بعد بدء المنتج، راجع الطبيب/الصيدلي.',
      missedDoseAr:
          'لا تضاعف الجرعة التالية؛ ارجع إلى جدولك المعتاد حسب الوصفة.',
      seekHelpAr:
          'اطلب تقييمًا عند قلة البول، تورم جديد، طفح شديد أو تدهور واضح في أعراض القولون.',
      teachBackAr:
          'هل تستطيع استبدال قرص 800 mg بقرصين 400 mg لمجرد أن مجموع الـmg متساوٍ؟',
    ),
  ),
];
