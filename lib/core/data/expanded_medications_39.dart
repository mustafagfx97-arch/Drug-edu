import '../models/medication.dart';

const expandedMedications39 = <Medication>[
  Medication(
    id: 'theophylline-er-tablets',
    familyId: 'respiratory',
    name: 'Theophylline Extended-Release Tablets',
    subtitle: 'Narrow therapeutic index · q12h → once daily only after stable levels',
    tags: ['Theophylline', 'Extended release', 'Respiratory', 'Serum level', 'Narrow therapeutic index'],
    aliases: ['Theophylline ER', 'Theophylline SR'],
    sourceLabel:
        'DailyMed · Theophylline extended-release tablets · current 2025-2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Extended-release theophylline for chronic respiratory indications in carefully selected patients. Product selection and serum-level monitoring are essential because the therapeutic index is narrow.',
      foodTiming:
          'Administration conditions and food effects vary by ER product. Use the exact product label and keep administration conditions consistent.',
      duration:
          'Usually chronic/individualized when used; continued need and serum concentrations require periodic reassessment.',
      formulationHandling:
          'Do not crush or chew extended-release dosage forms. Whether a specific tablet may be split is product-specific and must be verified from the exact label.',
      releaseConversion:
          'For the reviewed ER tablet labeling, once-daily dosing should be considered only after the patient has been gradually and satisfactorily titrated to therapeutic serum levels on a q12h ER regimen. The once-daily dose is based on twice the q12h dose and is started at the end of the last q12h dosing interval. Example: 200 mg every 12 hours → 400 mg once daily only if the patient is an appropriate candidate and serum levels support the switch. Peak concentrations may rise and trough concentrations may fall after conversion, so serum theophylline concentrations should be checked before and after the switch. Once-daily dosing is not recommended at night in the reviewed labeling.',
      monitoring:
          'Serum theophylline concentration, symptom control, nausea/vomiting, tremor, insomnia, tachycardia/arrhythmia and seizure symptoms. Recheck levels when smoking status, fever, interacting medicines or major illness changes.',
      interactions:
          'Theophylline has many clinically important interactions. Smoking can increase clearance; stopping smoking can raise levels. Macrolides, fluoroquinolones and other interacting medicines may increase toxicity risk depending on the agent.',
      commonMistakes:
          'Converting to once-daily before stable q12h levels, taking the once-daily dose at night, failing to recheck serum levels, crushing ER, or ignoring smoking/interaction changes.',
      specialPopulations:
          'Older age, liver disease, heart failure, sustained fever and other states that reduce clearance can increase toxicity risk and require more conservative dosing.',
    ),
    sections: [
      MedicationSection(
        title: 'q12h → once-daily conversion',
        body:
            'Only after stable therapeutic levels on q12h ER dosing: once-daily dose = twice the q12h dose, started at the end of the last q12h interval. Check serum concentrations before and after conversion because peaks may rise and troughs may fall.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Morning + level lock',
        body:
            'The reviewed labeling does not recommend once-daily dosing at night. A formulation switch or smoking/interaction change can alter serum exposure enough to cause toxicity.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'Theophylline ER دواء ممتد المفعول لبعض أمراض التنفس، ويحتاج متابعة مستوى الدواء بالدم لأن الفرق بين الجرعة المفيدة والجرعة السامة قد يكون صغيرًا.',
      howToUseAr:
          'ابتلع الشكل الممتد كما هو ولا تسحقه أو تمضغه. لا تقسّم الحبة إلا إذا سمحت نشرة نفس المنتج بذلك.',
      timingAr:
          'إذا استُخدم نظام مرة يوميًا في المنتج المراجع فيكون بعد استقرار الجرعة السابقة ومراقبة المستوى، ولا يُنصح بأخذ الجرعة اليومية ليلًا.',
      importantAr:
          'التحويل من كل 12 ساعة إلى مرة يوميًا لا يتم بمجرد جمع الحبوب؛ يجب أن تكون الجرعة مستقرة أولًا. قاعدة المنتج المراجع: جرعة اليوم مرة واحدة = ضعف جرعة كل 12 ساعة، مع فحص مستوى theophylline قبل وبعد التحويل.',
      commonActionableAr:
          'الغثيان، الرجفة، الأرق أو الخفقان قد تكون علامات ارتفاع المستوى وتحتاج مراجعة.',
      missedDoseAr:
          'لا تضاعف الجرعة. لأن theophylline له مجال علاجي ضيق، اتبع تعليمات الطبيب/الصيدلي للجرعة الفائتة.',
      seekHelpAr:
          'اطلب تقييمًا عاجلًا عند خفقان شديد/غير منتظم، قيء شديد متكرر، تشنج أو ارتباك شديد.',
      teachBackAr:
          'إذا كنت مستقرًا على 200 mg كل 12 ساعة، ما الجرعة اليومية النظرية عند التحويل مرة واحدة؟ ولماذا يجب فحص المستوى قبل وبعد التحويل؟',
    ),
  ),
  Medication(
    id: 'mesalamine-dr-800mg',
    familyId: 'gastrointestinal',
    name: 'Mesalamine Delayed-Release 800 mg Tablets',
    subtitle: 'Moderately active UC · not interchangeable with two 400 mg products',
    tags: ['Ulcerative colitis', 'Mesalamine', 'Delayed release', '800 mg', 'Not interchangeable'],
    aliases: ['Mesalamine DR 800 mg', 'Asacol HD-type'],
    sourceLabel:
        'DailyMed · Mesalamine delayed-release tablets 800 mg · revised Jul 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Delayed-release mesalamine 800 mg tablets for moderately active ulcerative colitis in adults.',
      foodTiming:
          'Take on an empty stomach: at least 1 hour before or 2 hours after a meal. Drink adequate fluids.',
      duration:
          'For the reviewed indication, 1600 mg three times daily for 6 weeks; longer use is not established in this specific label.',
      formulationHandling:
          'Swallow whole. Do not cut, break or chew. Protect from moisture.',
      releaseConversion:
          'Do not substitute one mesalamine delayed-release 800 mg tablet for two mesalamine delayed-release 400 mg oral products, even though the nominal milligram total is the same. The reviewed label explicitly prohibits this substitution because the formulations are not clinically interchangeable. Likewise, do not convert to LIALDA, APRISO, PENTASA or other mesalamine modified-release products solely by matching total daily milligrams.',
      monitoring:
          'Renal function before treatment and periodically, clinical response, hydration, nephrolithiasis symptoms, blood counts when clinically indicated and mesalamine intolerance syndrome.',
      interactions:
          'Nephrotoxic medicines including NSAIDs can increase renal risk. Azathioprine/6-mercaptopurine can increase blood-dyscrasia risk.',
      commonMistakes:
          'Replacing two 400 mg delayed-release products with one 800 mg tablet, taking the 800-mg product with food, crushing it or assuming all mesalamine products are interchangeable.',
      specialPopulations:
          'Use requires renal assessment and product-specific review. This particular 800-mg regimen is an adult moderately active UC regimen.',
    ),
    sections: [
      MedicationSection(
        title: '800 mg ≠ two 400 mg products',
        body:
            'The current label explicitly says not to substitute one 800-mg delayed-release tablet for two 400-mg delayed-release oral products. Equal milligrams do not mean equivalent release behavior.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Empty-stomach lock',
        body:
            'Take at least 1 hour before or 2 hours after food and swallow whole.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'Mesalamine delayed-release 800 mg لعلاج moderately active ulcerative colitis حسب الوصفة.',
      howToUseAr:
          'ابتلع الحبة كاملة ولا تقطعها أو تسحقها أو تمضغها. اشرب سوائل كافية.',
      timingAr:
          'على معدة فارغة: قبل الطعام بساعة على الأقل أو بعده بساعتين.',
      importantAr:
          'لا تستبدل حبة 800 mg بحبتين 400 mg من mesalamine delayed-release من نفسك، حتى لو كان مجموع الـmg نفسه؛ المنتجين ليسا interchangeable حسب الملصق.',
      commonActionableAr:
          'قد يحدث صداع أو ألم بطن. زيادة الإسهال/ألم البطن مع حرارة بعد بدء العلاج قد تشير إلى intolerance وتحتاج مراجعة.',
      missedDoseAr:
          'لا تضاعف الجرعة التالية؛ ارجع للجدول المعتاد حسب الوصفة.',
      seekHelpAr:
          'اطلب تقييمًا عند قلة البول/تورم، ألم شديد بالخاصرة أو دم بالبول، أو تحسس شديد.',
      teachBackAr:
          'هل حبة mesalamine DR 800 mg تساوي تلقائيًا حبتين 400 mg لأن مجموع الـmg متساوٍ؟',
    ),
  ),
];
