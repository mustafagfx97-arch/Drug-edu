import '../models/medication.dart';

const expandedMedications36 = <Medication>[
  Medication(
    id: 'metoprolol-succinate-er',
    familyId: 'cardiovascular',
    name: 'Metoprolol Succinate Extended-Release',
    subtitle: 'Beta-blocker · once daily · IR metoprolol → same total daily dose',
    tags: ['Metoprolol', 'Beta blocker', 'Extended release', 'Heart failure', 'Hypertension'],
    aliases: ['Toprol-XL-type', 'Metoprolol succinate ER'],
    sourceLabel:
        'DailyMed · Metoprolol succinate extended-release tablets · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily metoprolol succinate ER for hypertension, angina and selected stable symptomatic heart failure.',
      foodTiming:
          'Take regularly once daily; current patient labeling advises preferably with or immediately following meals.',
      duration:
          'Usually chronic cardiovascular therapy; abrupt withdrawal should be avoided.',
      formulationHandling:
          'ER tablets may be scored and can be divided when the exact product permits, but the whole or half tablet must not be crushed or chewed.',
      releaseConversion:
          'When switching from immediate-release metoprolol to metoprolol succinate extended-release tablets, use the same total daily metoprolol dose once daily. Example: metoprolol immediate-release 50 mg twice daily = 100 mg/day; the labeled starting conversion is metoprolol succinate ER 100 mg once daily, with later titration according to indication, heart rate, blood pressure and tolerability.',
      monitoring:
          'Heart rate, blood pressure, dizziness, heart-failure symptoms and signs of excessive beta blockade.',
      interactions:
          'Other rate-slowing medicines such as diltiazem, verapamil, digoxin or antiarrhythmics can increase bradycardia/conduction risk. Beta blockers can mask tachycardia from hypoglycemia.',
      commonMistakes:
          'Keeping the old twice-daily IR frequency after converting to ER, doubling after a missed dose, crushing ER or stopping abruptly.',
      specialPopulations:
          'Heart-failure conversion/titration requires clinical follow-up; asthma/COPD, conduction disease, diabetes and frailty modify counseling priorities.',
    ),
    sections: [
      MedicationSection(
        title: 'IR → succinate ER conversion',
        body:
            'Use the same total daily metoprolol dose when switching from immediate-release metoprolol to metoprolol succinate ER, then administer once daily. Subsequent titration remains indication- and response-specific.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Do not stop abruptly',
        body:
            'Abrupt beta-blocker withdrawal can worsen angina or precipitate cardiovascular events in susceptible patients. Tapering is clinician-directed.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'صيغة ممتدة من metoprolol لخفض الضغط أو علاج الذبحة أو دعم علاج بعض حالات فشل القلب.',
      howToUseAr:
          'خذها مرة واحدة يوميًا، ويفضل مع الوجبة أو بعدها مباشرة. إذا كانت الحبة مسموحًا بقسمها في منتجك يمكن تقسيمها، لكن لا تسحق أو تمضغ الحبة أو نصفها.',
      timingAr:
          'مرة واحدة يوميًا في وقت ثابت تقريبًا.',
      importantAr:
          'عند التحويل من metoprolol العادي إلى succinate ER نستخدم نفس مجموع الجرعة اليومية: مثلًا 50 mg مرتين يوميًا من العادي = 100 mg/day، فيكون بدء التحويل 100 mg ER مرة يوميًا حسب الوصفة.',
      commonActionableAr:
          'قد يسبب دوخة أو تعبًا أو بطء النبض. انهض ببطء واعرف الحدود التي أعطاها لك الطبيب للنبض والضغط.',
      missedDoseAr:
          'إذا نسيت الجرعة خذ فقط الجرعة التالية في موعدها المعتاد؛ لا تضاعف.',
      seekHelpAr:
          'اطلب تقييمًا عند إغماء، بطء شديد في النبض مع أعراض، ضيق نفس جديد أو زيادة سريعة في الوزن/التورم عند مريض فشل القلب.',
      teachBackAr:
          'إذا كنت تأخذ metoprolol العادي 50 mg مرتين يوميًا، ما مجموع الجرعة اليومية عند التحويل إلى ER؟ وكم مرة يوميًا يؤخذ ER؟',
    ),
  ),
  Medication(
    id: 'verapamil-er-tablets',
    familyId: 'cardiovascular',
    name: 'Verapamil Extended-Release Tablets',
    subtitle: 'Calcium-channel blocker · IR may keep same total daily mg',
    tags: ['Verapamil', 'Extended release', 'Hypertension', 'Rate control', 'Angina'],
    aliases: ['Verapamil ER', 'Verapamil SR tablets'],
    sourceLabel:
        'DailyMed · Verapamil hydrochloride extended-release tablets · current 2026 generic labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Extended-release verapamil tablet; the reviewed generic ER tablet labeling is primarily for essential hypertension, while other verapamil ER/SR products can have different indications and timing.',
      foodTiming:
          'For the reviewed ER tablet label, administer with food; morning dosing is used in the labeled hypertension regimen. Other verapamil ER/PM products require product-specific review.',
      duration:
          'Usually chronic when used for hypertension or other appropriate cardiovascular indications.',
      formulationHandling:
          'Do not crush an extended-release product. Splitting/opening instructions vary by exact verapamil ER product and strength; verify the dispensed formulation.',
      releaseConversion:
          'When switching from immediate-release verapamil hydrochloride tablets to the reviewed verapamil extended-release tablets, the total daily dose in milligrams may remain the same. Example: IR verapamil totaling 240 mg/day may be converted to an ER regimen totaling 240 mg/day when clinically appropriate. Do not generalize this to every verapamil ER/SR/PM product without checking its release system and schedule.',
      monitoring:
          'Blood pressure, heart rate, constipation, edema and symptoms of AV block or heart failure.',
      interactions:
          'Additive bradycardia/conduction slowing can occur with beta blockers, digoxin and other rate-slowing drugs. CYP3A interactions can be clinically important.',
      commonMistakes:
          'Assuming every verapamil ER brand has the same timing/food rules, crushing ER, or carrying the IR dosing frequency into the ER regimen.',
      specialPopulations:
          'Conduction disease, reduced ventricular function, hepatic impairment and older/frail patients require more cautious titration.',
    ),
    sections: [
      MedicationSection(
        title: 'IR → ER conversion',
        body:
            'For the reviewed generic ER tablets, the total daily verapamil milligram dose may remain the same when switching from immediate-release tablets. The new ER schedule is product-specific.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Product-specific ER lock',
        body:
            'Verapamil has multiple extended/sustained-release technologies, including products with different timing and food instructions. Do not copy one ER brand’s administration directions to another.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'صيغة ممتدة من verapamil تُستخدم لبعض حالات الضغط أو القلب حسب المنتج والوصفة.',
      howToUseAr:
          'ابتلع منتج ER بالطريقة المكتوبة لنفس العبوة ولا تسحقه. لا تقسمه أو تفتحه إلا إذا سمحت تعليمات نفس المنتج بذلك.',
      timingAr:
          'المنتج الذي تمت مراجعته يؤخذ مع الطعام ويستخدم نظامًا ممتدًا؛ بعض منتجات verapamil الأخرى لها توقيت مختلف.',
      importantAr:
          'عند التحويل من verapamil العادي إلى ER من النوع المراجع قد يبقى نفس مجموع الـmg اليومي، لكن عدد المرات والتوقيت يتغيران حسب المنتج؛ لا تبدل البراند أو الصيغة من نفسك.',
      commonActionableAr:
          'قد يسبب إمساكًا أو دوخة أو بطء النبض؛ اهتم بالسوائل/الألياف إذا كانت مناسبة لك وراقب النبض حسب الخطة.',
      missedDoseAr:
          'لا تضاعف الجرعة الفائتة؛ ارجع لجدول منتجك المعتاد.',
      seekHelpAr:
          'اطلب تقييمًا عند إغماء، بطء شديد في النبض مع أعراض، ضيق نفس أو تورم متزايد.',
      teachBackAr:
          'هل يعني بقاء نفس total daily mg أن كل منتجات verapamil ER لها نفس التوقيت وطريقة الاستخدام؟',
    ),
  ),
  Medication(
    id: 'propranolol-er-capsules',
    familyId: 'cardiovascular',
    name: 'Propranolol Extended-Release Capsules',
    subtitle: 'Once daily · not a simple mg-for-mg substitute',
    tags: ['Propranolol', 'Beta blocker', 'Extended release', 'Hypertension', 'Migraine prevention'],
    aliases: ['Propranolol LA', 'Inderal LA-type'],
    sourceLabel:
        'DailyMed · Propranolol hydrochloride extended-release capsules · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily sustained/extended-release propranolol capsule for labeled cardiovascular and selected other indications according to the exact product.',
      foodTiming:
          'Use the exact product instructions and take consistently at the prescribed time; the key switch issue is the different extended-release pharmacokinetic profile.',
      duration:
          'Usually chronic/indication-specific; abrupt beta-blocker withdrawal should be avoided.',
      formulationHandling:
          'Use the exact ER capsule as dispensed; do not crush or chew extended-release contents.',
      releaseConversion:
          'Propranolol extended-release capsules should NOT be considered a simple milligram-for-milligram substitute for conventional propranolol tablets. With the same numeric daily dose, ER capsules produce lower blood levels than conventional dosing two to four times daily. When switching, verify that therapeutic effect is maintained and consider retitration upward if needed, especially near the end of the 24-hour dosing interval. Although same-mg ER has shown similar 24-hour clinical effects in some hypertension/angina settings, the label still instructs against automatic mg-for-mg substitution.',
      monitoring:
          'Heart rate, blood pressure, indication-specific response, dizziness, bronchospasm risk and symptoms of excessive beta blockade.',
      interactions:
          'Other rate-slowing drugs can increase bradycardia/conduction risk. Propranolol also has clinically important interactions with several drugs, including rizatriptan.',
      commonMistakes:
          'Automatically converting the conventional total daily milligrams to the identical ER dose, failing to reassess end-of-interval control, or abruptly stopping therapy.',
      specialPopulations:
          'Asthma/COPD, diabetes, conduction disease and frailty require individualized risk assessment.',
    ),
    sections: [
      MedicationSection(
        title: 'Conventional → ER conversion',
        body:
            'Do not auto-convert mg-for-mg. ER produces lower blood levels than conventional propranolol at the same numeric daily dose; reassess clinical effect and retitrate when necessary.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'صيغة ممتدة من propranolol تُستخدم حسب الحالة للضغط أو بعض مشاكل القلب أو استعمالات أخرى مثل الوقاية من الشقيقة.',
      howToUseAr:
          'خذ كبسولة ER مرة يوميًا حسب الوصفة ولا تسحق أو تمضغ الشكل ممتد المفعول.',
      timingAr:
          'مرة يوميًا في وقت ثابت تقريبًا حسب الوصفة.',
      importantAr:
          'لا تحول propranolol العادي إلى ER بنفس رقم الـmg من نفسك؛ الـER قد يعطي مستويات دم أقل رغم نفس الرقم وقد يحتاج الطبيب لإعادة ضبط الجرعة حسب الاستجابة.',
      commonActionableAr:
          'قد يسبب دوخة أو تعبًا أو بطء النبض؛ اعرف تأثيره عليك قبل القيادة.',
      missedDoseAr:
          'لا تضاعف الجرعة. ارجع للجدول المعتاد حسب تعليمات الوصفة.',
      seekHelpAr:
          'اطلب تقييمًا عند إغماء، بطء شديد في النبض مع أعراض أو ضيق نفس/صفير جديد.',
      teachBackAr:
          'إذا كنت تستخدم propranolol العادي بمجموع 80 mg/day، هل يمكنك افتراض أن 80 mg ER هي جرعة مكافئة تلقائيًا؟',
    ),
  ),
  Medication(
    id: 'tolterodine-la',
    familyId: 'urology',
    name: 'Tolterodine Extended-Release (LA)',
    subtitle: 'Overactive bladder · 4 mg once daily standard · no direct IR→LA switch rule',
    tags: ['Tolterodine', 'DETROL LA', 'Overactive bladder', 'Extended release', 'Antimuscarinic'],
    aliases: ['DETROL LA', 'Tolterodine ER'],
    sourceLabel:
        'DailyMed · Tolterodine tartrate extended-release capsules · revised Jun 2026 + current IR tablet labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily extended-release tolterodine for overactive bladder with urgency, frequency and urge urinary incontinence.',
      foodTiming:
          'Take once daily with water and swallow the capsule whole; current LA labeling does not require a meal anchor.',
      duration:
          'Usually chronic while symptoms improve and anticholinergic adverse effects remain acceptable.',
      formulationHandling:
          'Swallow the LA capsule whole with water.',
      releaseConversion:
          'The usual labeled adult regimens are tolterodine immediate-release 2 mg twice daily and tolterodine LA 4 mg once daily, which both total 4 mg/day. However, the current LA label does not provide a direct IR→LA conversion instruction. Therefore do not encode an automatic 2 mg BID → 4 mg QD switch without clinical review. LA should be 2 mg once daily in mild-to-moderate hepatic impairment, severe renal impairment (CrCl 10–30 mL/min), or with potent CYP3A4 inhibitors; severe hepatic impairment and CrCl below 10 mL/min require avoidance per labeling.',
      monitoring:
          'Overactive-bladder response, dry mouth, constipation, urinary retention, cognition, visual symptoms and QT-risk context when relevant.',
      interactions:
          'Potent CYP3A4 inhibitors require a lower LA dose. Other anticholinergics increase dry mouth, constipation, blurred vision and urinary-retention risk.',
      commonMistakes:
          'Assuming the equal usual total daily dose means an automatic IR→LA conversion, ignoring renal/hepatic dose reduction or swallowing/opening instructions.',
      specialPopulations:
          'Use 2 mg once daily in mild-to-moderate hepatic impairment or severe renal impairment (CrCl 10–30 mL/min); avoid in severe hepatic impairment or CrCl below 10 mL/min according to labeling.',
    ),
    sections: [
      MedicationSection(
        title: 'IR → LA conversion caution',
        body:
            'IR 2 mg twice daily and LA 4 mg once daily are the usual labeled adult regimens, but the LA label does not publish a formal direct switch instruction. Treat the change as clinician-directed rather than an automatic schedule conversion.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: '2 mg LA dose lock',
        body:
            'Use 2 mg once daily with mild-to-moderate hepatic impairment, severe renal impairment (CrCl 10–30 mL/min), or potent CYP3A4 inhibitors.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'Tolterodine LA صيغة ممتدة مرة يوميًا لعلاج الإلحاح وكثرة التبول وتسرب البول في فرط نشاط المثانة.',
      howToUseAr:
          'ابتلع كبسولة LA كاملة مع الماء مرة يوميًا.',
      timingAr:
          'مرة واحدة يوميًا في وقت ثابت تقريبًا.',
      importantAr:
          'الجرعة المعتادة للعادي هي 2 mg مرتين يوميًا ولـLA هي 4 mg مرة يوميًا، لكن لا تعتبر ذلك تحويلًا تلقائيًا؛ أمراض الكبد/الكلى وبعض CYP3A4 inhibitors قد تجعل جرعة LA المناسبة 2 mg فقط.',
      commonActionableAr:
          'قد يسبب جفاف الفم أو الإمساك أو تشوش الرؤية أو دوخة؛ انتبه أيضًا لصعوبة التبول.',
      missedDoseAr:
          'لا تضاعف الجرعة التالية؛ ارجع إلى الجرعة اليومية المعتادة.',
      seekHelpAr:
          'اطلب تقييمًا عند عدم القدرة على التبول، ألم عين/هالات مع تشوش، إغماء أو تحسس شديد.',
      teachBackAr:
          'هل تطابق total daily mg بين tolterodine IR وLA يعني أنك تستطيع التحويل بنفسك؟ ومتى قد تنخفض LA إلى 2 mg/day؟',
    ),
  ),
];
