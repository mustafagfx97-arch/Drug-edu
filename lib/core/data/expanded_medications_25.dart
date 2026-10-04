import '../models/medication.dart';

const expandedMedications25 = <Medication>[
  Medication(
    id: 'amoxicillin-clavulanate-xr',
    familyId: 'antiinfective',
    name: 'Amoxicillin / Clavulanate Extended-Release (AUGMENTIN XR-type)',
    subtitle: '1000/62.5 mg ER · start of meal · not mg-for-mg interchangeable',
    tags: ['Antibiotic', 'Augmentin XR', 'Extended release', 'Food timing'],
    aliases: ['AUGMENTIN XR', 'Amoxicillin clavulanate XR 1000/62.5'],
    sourceLabel:
        'DailyMed · Amoxicillin and clavulanate potassium extended-release tablets · revised Dec 2025',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Extended-release bilayer tablet containing amoxicillin 1000 mg plus clavulanate 62.5 mg per tablet.',
      foodTiming:
          'Take at the start of a meal. Avoid taking with a high-fat meal because clavulanate absorption is reduced.',
      duration:
          'Label regimens are indication-specific: acute bacterial sinusitis 10 days; community-acquired pneumonia 7 to 10 days.',
      formulationHandling:
          'The scored tablet may be split in half for swallowing difficulty, but both halves must be taken immediately. It is not substitutable mg-for-mg with immediate-release amoxicillin/clavulanate; two 500 mg IR tablets are not equivalent to one 1000 mg XR tablet.',
      monitoring:
          'Clinical response, allergy, significant diarrhea and hepatic symptoms; renal function matters because this XR product is contraindicated when creatinine clearance is below 30 mL/min or in hemodialysis.',
      interactions:
          'Review oral anticoagulants/INR, allopurinol and probenecid. Do not convert between amoxicillin/clavulanate products without checking both formulation and clavulanate content.',
      commonMistakes:
          'Taking it fasting, taking it with a high-fat meal, substituting regular Augmentin by amoxicillin milligrams alone, or taking only one half after splitting the scored XR tablet.',
      specialPopulations:
          'Current label use is for adults and pediatric patients at least 40 kg who can swallow tablets; severe renal impairment and hemodialysis are contraindications for this XR formulation.',
    ),
    sections: [
      MedicationSection(
        title: 'XR formulation lock',
        body:
            'AUGMENTIN XR-type 1000/62.5 mg is not mg-for-mg interchangeable with immediate-release amoxicillin/clavulanate. Two 500 mg IR tablets do not equal one 1000 mg XR tablet.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Meal + split lock',
        body:
            'Take at the start of a meal; avoid a high-fat meal. If swallowing is difficult, the scored XR tablet may be halved, but both halves must be taken immediately.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'مضاد حيوي ممتد المفعول لاستطبابات محددة مثل بعض حالات sinusitis أو community-acquired pneumonia.',
      howToUseAr:
          'خذ الجرعة الموصوفة في بداية الوجبة. إذا احتجت تقسيم الحبة على خط التقسيم، خذ النصفين فورًا معًا ولا تترك نصفًا لوقت لاحق.',
      timingAr:
          'في بداية الوجبة. لا يُنصح بأخذه مع وجبة عالية الدهون، ولا تبدله بمنتج Augmentin عادي من نفسك.',
      importantAr:
          'هذا XR ليس مكافئًا mg-for-mg للـAugmentin العادي؛ حتى لو كان مجموع amoxicillin متشابهًا فطريقة التحرر وكمية clavulanate تختلف.',
      commonActionableAr:
          'الإسهال أو الغثيان قد يحدثان؛ أخذه في بداية الوجبة يساعد على التحمل.',
      missedDoseAr:
          'خذ الجرعة المنسية عند التذكر إذا لم يقترب موعد التالية، ولا تضاعف جرعتين.',
      seekHelpAr:
          'اطلب المساعدة عند تحسس شديد، طفح متفاقم، إسهال مائي/دموي شديد أو اصفرار الجلد والعينين.',
      teachBackAr:
          'متى ستأخذ XR بالنسبة للوجبة؟ وهل يمكن استبداله بحبتين Augmentin عاديتين لأن مجموع amoxicillin مشابه؟',
    ),
  ),
  Medication(
    id: 'sulfasalazine-dr',
    familyId: 'gastrointestinal',
    name: 'Sulfasalazine Delayed-Release Tablets',
    subtitle: 'UC/RA therapy · preferably after meals · swallow whole',
    tags: ['Sulfasalazine', 'Delayed release', 'Ulcerative colitis', 'Rheumatology'],
    aliases: ['Sulfasalazine DR', 'AZULFIDINE EN-tabs-type'],
    sourceLabel:
        'DailyMed · Sulfasalazine delayed-release tablets · current labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Oral delayed-release sulfasalazine; dose and divided-dose schedule depend on indication and response.',
      foodTiming:
          'Take in evenly divided doses, preferably after meals.',
      duration:
          'Often longer-term for inflammatory disease, but induction/maintenance dose and duration are indication-specific.',
      formulationHandling:
          'Swallow delayed-release tablets whole. If intact tablets are repeatedly seen in the stool, the label advises stopping the delayed-release product and contacting the prescriber.',
      monitoring:
          'CBC, liver function and renal status as clinically directed; assess for serious rash, blood dyscrasia and hepatic toxicity.',
      interactions:
          'Sulfasalazine can reduce folic-acid and digoxin absorption. Folate needs special attention in pregnancy/preconception and selected long-term users.',
      commonMistakes:
          'Crushing the delayed-release tablet, taking large doses together instead of divided dosing, inadequate fluid intake, or ignoring fever/sore throat/bruising/jaundice.',
      specialPopulations:
          'Maintain adequate fluid intake to reduce crystalluria/stone risk when appropriate. G6PD deficiency and pregnancy require individualized review.',
    ),
    sections: [
      MedicationSection(
        title: 'Delayed-release administration',
        body:
            'Take evenly divided doses preferably after meals and swallow tablets whole. Maintain adequate fluid intake unless clinically fluid-restricted.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Blood/liver red flags',
        body:
            'Fever, sore throat, unusual pallor/bruising or jaundice can signal serious toxicity and require prompt medical review rather than routine continuation.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يُستخدم لعلاج أمراض التهابية مثل ulcerative colitis أو بعض حالات rheumatoid arthritis حسب خطة الطبيب.',
      howToUseAr:
          'ابتلع حبة delayed-release كاملة وخذ الجرعات مقسمة كما في الوصفة. اشرب سوائل كافية إذا لم يكن لديك تقييد سوائل.',
      timingAr:
          'يفضل بعد الوجبات، مع توزيع الجرعات بالتساوي حسب الخطة.',
      importantAr:
          'لا تسحق أو تمضغ حبة DR. إذا لاحظت خروج الحبة كاملة في البراز بشكل واضح، أوقف هذا الشكل وتواصل مع الطبيب/الصيدلي.',
      commonActionableAr:
          'قد يحدث غثيان أو صداع؛ أخذ الجرعة بعد الطعام قد يساعد على تحمل المعدة.',
      missedDoseAr:
          'خذ الجرعة عند التذكر إذا لم يقترب موعد التالية، ولا تضاعف.',
      seekHelpAr:
          'تواصل سريعًا عند حرارة أو التهاب حلق غير معتاد، شحوب/كدمات، طفح شديد أو اصفرار.',
      teachBackAr:
          'هل ستسحق حبة DR؟ ومتى ستأخذها بالنسبة للوجبة؟ وما الأعراض التي تستدعي مراجعة سريعة؟',
    ),
  ),
  Medication(
    id: 'dicyclomine-oral',
    familyId: 'gastrointestinal',
    name: 'Dicyclomine Oral',
    subtitle: 'IBS antispasmodic · no label-established meal anchor',
    tags: ['IBS', 'Antispasmodic', 'Anticholinergic', 'Dicyclomine'],
    aliases: ['Bentyl-type', 'Dicyclomine capsules', 'Dicyclomine tablets'],
    sourceLabel:
        'DailyMed · Dicyclomine hydrochloride capsules/tablets · revised Aug 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Oral anticholinergic antispasmodic for functional bowel/irritable bowel syndrome; tablets, capsules and oral solution exist.',
      foodTiming:
          'Current labeling does not establish a required before/with/after-meal anchor. Follow the prescribed clock schedule rather than inventing a meal rule.',
      duration:
          'Individualized. Labeling calls for reassessment: if efficacy is not achieved or adverse effects require less than 80 mg/day after 2 weeks, therapy should be discontinued.',
      formulationHandling:
          'Use the exact prescribed dosage form and strength. Measure oral solution with a calibrated device when used.',
      monitoring:
          'Benefit versus anticholinergic effects, especially dry mouth, constipation, blurred vision, urinary retention, confusion and heat intolerance.',
      interactions:
          'Avoid simultaneous administration with antacids because they may interfere with dicyclomine absorption. Other anticholinergic or sedating drugs can increase adverse effects.',
      commonMistakes:
          'Assuming every IBS antispasmodic must be taken before meals, taking antacids at the same time, driving despite blurred vision/drowsiness, or ignoring reduced sweating in hot weather.',
      specialPopulations:
          'Contraindicated in infants younger than 6 months and in several conditions including glaucoma and obstructive GI/urinary disease; current labeling also contraindicates use in nursing mothers.',
    ),
    sections: [
      MedicationSection(
        title: 'No invented meal anchor',
        body:
            'The current dicyclomine label does not establish a required meal relationship. Do not convert absence of a meal rule into a false “before meals” instruction.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Anticholinergic safety',
        body:
            'Avoid simultaneous antacids. Warn about drowsiness/blurred vision and reduced sweating; heat prostration/heat stroke can occur in high environmental temperatures.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يخفف تقلصات وألم الأمعاء في functional bowel/IBS عند بعض المرضى.',
      howToUseAr:
          'خذ الجرعات حسب الجدول المكتوب لك. إذا كان سائلًا فقِس الجرعة بأداة مدرجة.',
      timingAr:
          'الملصق الحالي لا يفرض قبل/مع/بعد الطعام؛ اتبع وقت الوصفة. لا تأخذ antacid في نفس الوقت معه.',
      importantAr:
          'قد يقلل التعرق ويسبب دوخة أو تشوش رؤية؛ لا تقد السيارة حتى تعرف تأثيره عليك وانتبه للحر الشديد.',
      commonActionableAr:
          'جفاف الفم أو الإمساك قد يحدثان. إذا أصبحت الأعراض مزعجة أو شديدة فراجع الجرعة بدل زيادتها.',
      missedDoseAr:
          'إذا نسيت جرعة فاستمر بالجدول الطبيعي ولا تضاعف الجرعة لتعويضها.',
      seekHelpAr:
          'أوقفه واطلب المشورة عند حرارة شديدة/قلة تعرق مع تشوش، ارتباك شديد، احتباس بول أو ألم عين حاد.',
      teachBackAr:
          'هل يجب أخذه قبل الطعام؟ وماذا ستفعل إذا كنت تحتاج antacid أو ستتعرض لحر شديد؟',
    ),
  ),
  Medication(
    id: 'hyoscyamine-sl',
    familyId: 'gastrointestinal',
    name: 'Hyoscyamine Sulfate Sublingual 0.125 mg',
    subtitle: 'SL anticholinergic · 30–60 min before meals',
    tags: ['Antispasmodic', 'Sublingual', 'Hyoscyamine', 'Before meals'],
    aliases: ['Hyoscyamine SL', 'Hyoscyamine sulfate sublingual 0.125 mg'],
    sourceLabel:
        'DailyMed · Hyoscyamine sulfate sublingual tablets 0.125 mg · current labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Sublingual hyoscyamine 0.125 mg anticholinergic/antispasmodic product.',
      foodTiming:
          'Current SL labeling directs dosing 30 minutes to 1 hour before meals and at bedtime.',
      duration:
          'Usually symptom- and indication-specific; frequency may be scheduled or as needed within the prescribed maximum.',
      formulationHandling:
          'Place the SL tablet under the tongue. The verified SL label also permits taking it with or without water and notes that this product may be chewed or swallowed orally; do not generalize that handling to every hyoscyamine formulation.',
      monitoring:
          'Anticholinergic effects such as dry mouth, constipation, blurred vision, urinary retention, tachycardia, confusion and reduced sweating.',
      interactions:
          'Other anticholinergics and several medicines can have additive effects or altered absorption; review antacids, adsorbent antidiarrheals, metoclopramide, opioids and potassium chloride when relevant.',
      commonMistakes:
          'Confusing SL with extended-release hyoscyamine, taking it after meals despite a before-meal label, or driving despite blurred vision/drowsiness.',
      specialPopulations:
          'Older adults may be more sensitive to usual doses. Heat exposure can increase risk of overheating because sweating is reduced.',
    ),
    sections: [
      MedicationSection(
        title: 'SL timing lock',
        body:
            'For this verified 0.125 mg sublingual product, dose 30 to 60 minutes before meals and at bedtime. Do not extrapolate this timing/handling to hyoscyamine ER formulations.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يخفف التقلصات وبعض أعراض الجهاز الهضمي حسب الاستطباب.',
      howToUseAr:
          'ضع حبة SL تحت اللسان حسب وصفك. هذا المنتج الموثق يمكن أخذه مع أو بدون ماء؛ لا تطبق نفس الطريقة على أي hyoscyamine ER.',
      timingAr:
          'قبل الوجبة بـ30–60 دقيقة وعند النوم حسب الجدول الموصوف.',
      importantAr:
          'قد يسبب دوخة أو تشوش رؤية ويقلل التعرق؛ انتبه للقيادة والجو الحار.',
      commonActionableAr:
          'جفاف الفم أو الإمساك قد يحدثان.',
      missedDoseAr:
          'إذا كانت الجرعة مجدولة ونسيتها فتجاوزها إذا اقترب موعد التالية، ولا تضاعف.',
      seekHelpAr:
          'راجع عند ارتباك شديد، احتباس بول، خفقان شديد أو أعراض overheating.',
      teachBackAr:
          'قبل الوجبة بكم دقيقة ستأخذ SL؟ وما الفرق بينها وبين hyoscyamine ER؟',
    ),
  ),
  Medication(
    id: 'promethazine-oral-tablets',
    familyId: 'gastrointestinal',
    name: 'Promethazine Oral Tablets',
    subtitle: 'Antiemetic/motion sickness · sedation + indication-linked timing',
    tags: ['Antiemetic', 'Promethazine', 'Motion sickness', 'Sedation'],
    aliases: ['Promethazine HCl tablets', 'Phenergan-type tablets'],
    sourceLabel:
        'DailyMed · Promethazine hydrochloride tablets · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Oral promethazine tablet used for selected nausea/vomiting, motion sickness and other labeled indications.',
      foodTiming:
          'There is no single universal meal rule. For motion sickness, the initial adult dose is taken 30 to 60 minutes before anticipated travel; subsequent-day timing can differ.',
      duration:
          'Generally short-term or as-needed and indication-specific rather than a chronic routine antiemetic.',
      formulationHandling:
          'Use the oral tablet only as prescribed; do not transfer injectable-product warnings or instructions to the oral tablet.',
      monitoring:
          'Sedation, anticholinergic effects, respiratory risk and fall/confusion risk in susceptible patients.',
      interactions:
          'Alcohol, opioids, sedatives/hypnotics, tranquilizers and other CNS depressants can markedly increase impairment and respiratory depression.',
      commonMistakes:
          'Taking a first motion-sickness dose after travel has already started, driving despite marked drowsiness, combining with alcohol/opioids, or using in a child younger than 2 years.',
      specialPopulations:
          'Boxed warning: do not use in children younger than 2 years because of potentially fatal respiratory depression. Use extra caution in older adults and patients with compromised respiratory function.',
    ),
    sections: [
      MedicationSection(
        title: 'Motion-sickness timing',
        body:
            'For adult motion-sickness prevention, the initial oral dose is taken 30 to 60 minutes before anticipated travel; repeat timing is regimen-specific.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'Sedation + pediatric lock',
        body:
            'Marked drowsiness can impair driving and is worsened by alcohol/opioids/other CNS depressants. Oral promethazine is contraindicated in children younger than 2 years because of fatal respiratory-depression risk.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يستخدم للغثيان/القيء أو للوقاية من motion sickness في خطط محددة.',
      howToUseAr:
          'خذ الجرعة فقط حسب سبب الاستخدام والخطة المكتوبة لك؛ ليس antiemetic يوميًا تلقائيًا.',
      timingAr:
          'لا توجد قاعدة طعام واحدة لكل الاستطبابات. للوقاية من motion sickness تؤخذ الجرعة الأولى للبالغ عادة قبل السفر بـ30–60 دقيقة.',
      importantAr:
          'قد يسبب نعاسًا واضحًا؛ تجنب القيادة والكحول، ولا تجمعه من نفسك مع opioids أو مهدئات. لا يُستخدم للأطفال أقل من سنتين.',
      commonActionableAr:
          'النعاس وجفاف الفم شائعان نسبيًا؛ خطط للجرعة بحيث لا تحتاج قيادة أو عملًا خطِرًا بعدها.',
      missedDoseAr:
          'إذا كان PRN فلا توجد جرعة منسية. إذا كان ضمن جدول محدد فلا تضاعف جرعة متأخرة.',
      seekHelpAr:
          'اطلب المساعدة عند صعوبة تنفس، نعاس شديد غير معتاد، إغماء أو تفاعل تحسسي شديد.',
      teachBackAr:
          'إذا كان للسفر، قبل كم دقيقة ستأخذه؟ وهل ستقود أو تشرب كحولًا بعد الجرعة؟',
    ),
  ),
];
