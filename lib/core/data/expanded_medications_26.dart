import '../models/medication.dart';

const expandedMedications26 = <Medication>[
  Medication(
    id: 'erythromycin-erytab-dr',
    familyId: 'antiinfective',
    name: 'Erythromycin Delayed-Release Tablets (ERY-TAB-type)',
    subtitle: 'DR macrolide · food-flexible, fasting gives optimal levels',
    tags: ['Antibiotic', 'Macrolide', 'Erythromycin', 'Delayed release'],
    aliases: ['ERY-TAB', 'Erythromycin delayed-release tablets'],
    sourceLabel:
        'DailyMed · ERY-TAB erythromycin delayed-release tablets · current labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Oral delayed-release erythromycin tablet; dosing interval and duration depend on indication and total daily dose.',
      foodTiming:
          'May be dosed without regard to meals in most patients, but optimal blood levels are obtained fasting: at least 30 minutes and preferably 2 hours before meals.',
      duration:
          'Short antibiotic course determined by infection and prescribed regimen.',
      formulationHandling:
          'This is a delayed-release formulation. The verified label does not provide an alternate crush/open administration method; do not invent one or substitute another erythromycin formulation without verification.',
      monitoring:
          'Clinical response, significant diarrhea, hepatic symptoms and QT/arrhythmia risk when clinically relevant.',
      interactions:
          'Erythromycin is a clinically important CYP3A/QT-interaction drug. Review statins, antiarrhythmics and other QT-prolonging/CYP3A-sensitive medicines before dispensing.',
      commonMistakes:
          'Calling food absolutely prohibited, or conversely ignoring the fasting option when optimal exposure is desired; confusing delayed-release erythromycin with other erythromycin salts/formulations.',
      specialPopulations:
          'Dose selection and interaction risk require extra care in hepatic disease and patients with substantial QT-risk polypharmacy.',
    ),
    sections: [
      MedicationSection(
        title: 'Food nuance',
        body:
            'ERY-TAB may be taken without regard to meals in most patients, but fasting gives optimal blood levels: at least 30 minutes and preferably 2 hours before meals.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Formulation + interaction lock',
        body:
            'Do not generalize this meal rule or handling to every erythromycin formulation. Check CYP3A and QT interactions before dispensing.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد حيوي macrolide لعلاج التهابات بكتيرية محددة.',
      howToUseAr:
          'خذ الجرعات في الفواصل المكتوبة لك وأكمل الكورس. هذا الشكل delayed-release؛ لا تبدله بشكل erythromycin آخر من نفسك.',
      timingAr:
          'يمكن أخذه دون ارتباط صارم بالطعام عند معظم المرضى، لكن أفضل مستويات الدواء تكون على معدة فارغة: قبل الطعام بـ30 دقيقة على الأقل ويفضل ساعتين.',
      importantAr:
          'أخبر الصيدلي بكل أدويتك لأن erythromycin لديه تداخلات مهمة مع بعض أدوية القلب والـstatins وأدوية تطيل QT.',
      commonActionableAr:
          'قد يسبب مغصًا أو غثيانًا أو إسهالًا؛ إذا أصبح الإسهال شديدًا أو مائيًا بشكل واضح فراجع الطبيب.',
      missedDoseAr:
          'خذ الجرعة عند التذكر إذا لم يقترب موعد التالية؛ لا تضاعف جرعتين.',
      seekHelpAr:
          'اطلب المساعدة عند خفقان/إغماء شديد، تحسس شديد، اصفرار أو إسهال شديد مستمر.',
      teachBackAr:
          'هل الطعام ممنوع تمامًا مع ERY-TAB؟ وإذا أردنا أفضل امتصاص، متى ستأخذه بالنسبة للوجبة؟',
    ),
  ),
  Medication(
    id: 'doxycycline-doryx-mpc',
    familyId: 'antiinfective',
    name: 'Doxycycline Delayed-Release (DORYX MPC)',
    subtitle: 'DR doxycycline · not mg-for-mg interchangeable',
    tags: ['Antibiotic', 'Doxycycline', 'Delayed release', 'DORYX MPC'],
    aliases: ['DORYX MPC 60 mg', 'DORYX MPC 120 mg'],
    sourceLabel:
        'DailyMed · DORYX MPC doxycycline hyclate delayed-release tablets · updated Feb 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Oral delayed-release doxycycline hyclate tablet with product-specific 60 mg and 120 mg dosing.',
      foodTiming:
          'If gastric irritation occurs, DORYX MPC may be given with food or milk; however, calcium-rich food can reduce tetracycline absorption, so do not assume meal timing is clinically irrelevant.',
      duration:
          'Indication-specific; some courses are 7 to 10 days while malaria prophylaxis and anthrax post-exposure schedules are much longer.',
      formulationHandling:
          'Not substitutable mg-for-mg with other oral doxycycline products because bioavailability differs. Do not chew or crush. Give with an adequate amount of fluid to reduce esophageal irritation/ulceration.',
      monitoring:
          'Clinical response, photosensitivity, severe skin reactions, intracranial-hypertension symptoms and organ-function monitoring for long-term therapy.',
      interactions:
          'Aluminum/calcium/magnesium antacids, bismuth subsalicylate and iron reduce absorption. Isotretinoin increases intracranial-hypertension concern; anticoagulants and enzyme-inducing antiepileptics may also matter.',
      commonMistakes:
          'Substituting 100 mg conventional doxycycline for 120 mg DORYX MPC on a mg-for-mg basis, crushing the DR tablet, taking it with inadequate fluid or taking mineral products at the same time.',
      specialPopulations:
          'Pregnancy and tooth-development age require individualized risk-benefit review; product-specific dosing differs from other tetracyclines.',
    ),
    sections: [
      MedicationSection(
        title: 'Do not substitute mg-for-mg',
        body:
            'DORYX MPC differs in bioavailability from other oral doxycycline products. The current label explicitly says not to substitute it mg-for-mg.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration lock',
        body:
            'Do not chew or crush. Use adequate fluid. Food or milk may be used for gastric irritation, but mineral/calcium interactions still matter.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'doxycycline delayed-release لاستطبابات بكتيرية أو وقائية محددة حسب الوصفة.',
      howToUseAr:
          'ابتلع DORYX MPC دون سحق أو مضغ ومع كمية كافية من الماء. لا تستبدله بجرعة doxycycline عادية بنفس عدد الـmg من نفسك.',
      timingAr:
          'إذا أزعج المعدة يمكن أخذه مع الطعام أو الحليب حسب الملصق، لكن افصل مضادات الحموضة التي تحتوي Al/Ca/Mg والحديد وbismuth عن الجرعة حسب خطة الصيدلي.',
      importantAr:
          'هذا المنتج ليس mg-for-mg interchangeable مع doxycycline العادي. تجنب أخذه مباشرة قبل الاستلقاء وخذ معه ماء كافيًا.',
      commonActionableAr:
          'قد يسبب حساسية للشمس أو انزعاج المعدة؛ استخدم حماية من الشمس وراجع طريقة التناول إذا تكرر تهيج المريء.',
      missedDoseAr:
          'خذ الجرعة عند التذكر إذا لم يقترب موعد التالية؛ لا تضاعف.',
      seekHelpAr:
          'راجع سريعًا عند صداع شديد مع تغير الرؤية، طفح جلدي شديد أو ألم/صعوبة واضحة عند البلع.',
      teachBackAr:
          'هل يمكن استبدال DORYX MPC بنفس mg من doxycycline العادي؟ وهل يجوز سحقه؟',
    ),
  ),
  Medication(
    id: 'tenapanor-ibsrela',
    familyId: 'gastrointestinal',
    name: 'Tenapanor (IBSRELA)',
    subtitle: 'IBS-C · immediately before first meal and dinner',
    tags: ['IBS-C', 'Tenapanor', 'Before meals', 'Constipation'],
    aliases: ['IBSRELA 50 mg'],
    sourceLabel:
        'DailyMed · IBSRELA tenapanor hydrochloride tablets · current labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Oral tenapanor 50 mg twice daily for adults with irritable bowel syndrome with constipation.',
      foodTiming:
          'Take immediately before breakfast or the first meal of the day and immediately before dinner.',
      duration:
          'Longer-term IBS-C therapy may be continued while effective and tolerated; reassess severe/persistent diarrhea and overall benefit.',
      formulationHandling:
          'If a dose is missed, skip it and take the next dose at the regular time. Keep tablets in the original tightly closed container; protect from moisture and do not remove the desiccant.',
      monitoring:
          'Stool frequency/consistency, abdominal symptoms and dehydration risk when diarrhea is severe.',
      interactions:
          'Tenapanor can reduce exposure of certain OATP2B1 substrates such as enalapril; medication review is appropriate when clinically relevant.',
      commonMistakes:
          'Taking it after finishing the meal, doubling a missed dose, continuing through severe diarrhea, or removing tablets/desiccant from the original moisture-protective container.',
      specialPopulations:
          'Contraindicated under age 6; avoid use from age 6 to under 12. Safety/effectiveness are not established below age 18.',
    ),
    sections: [
      MedicationSection(
        title: 'Meal-timing lock',
        body:
            'Take immediately before breakfast/first meal and immediately before dinner. Do not move it to after meals or a generic twice-daily clock schedule.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Diarrhea + pediatric lock',
        body:
            'Stop and contact the clinician for severe diarrhea and rehydrate as appropriate. Contraindicated below age 6 and avoided age 6 to under 12.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يعالج IBS-C عند البالغين للمساعدة على الإمساك وأعراض البطن.',
      howToUseAr:
          'خذ حبة 50 mg مرتين يوميًا حسب الوصفة، واتركها في العبوة الأصلية المحكمة مع الـdesiccant.',
      timingAr:
          'خذها مباشرة قبل الفطور أو أول وجبة في اليوم، ومباشرة قبل العشاء.',
      importantAr:
          'إذا حدث إسهال شديد أوقف الدواء واتصل بالطبيب وعوض السوائل حسب حالتك. لا تعطِه لطفل.',
      commonActionableAr:
          'الإسهال والانتفاخ والغازات قد تحدث؛ الإسهال الشديد ليس شيئًا تستمر عليه وتنتظر.',
      missedDoseAr:
          'إذا نسيت جرعة فتجاوزها وخذ التالية في وقتها المعتاد؛ لا تأخذ جرعتين معًا.',
      seekHelpAr:
          'راجع عند إسهال شديد، علامات جفاف، دوخة شديدة أو ألم/انتفاخ يوحي بانسداد.',
      teachBackAr:
          'متى بالضبط ستأخذ الجرعتين بالنسبة للفطور والعشاء؟ وماذا تفعل إذا نسيت جرعة؟',
    ),
  ),
  Medication(
    id: 'eluxadoline-viberzi',
    familyId: 'gastrointestinal',
    name: 'Eluxadoline (VIBERZI)',
    subtitle: 'IBS-D · with food · gallbladder/pancreatitis lock',
    tags: ['IBS-D', 'Eluxadoline', 'With food', 'Pancreatitis'],
    aliases: ['VIBERZI 75 mg', 'VIBERZI 100 mg'],
    sourceLabel:
        'DailyMed · VIBERZI eluxadoline tablets · revised Jul 2024/current label',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Oral eluxadoline for adults with irritable bowel syndrome with diarrhea; standard label dose is 100 mg twice daily, with 75 mg twice daily for selected patients.',
      foodTiming:
          'Take twice daily with food.',
      duration:
          'Individualized longer-term IBS-D treatment while benefit outweighs risk; discontinue for severe constipation or pancreatitis/sphincter-of-Oddi symptoms.',
      formulationHandling:
          'If a dose is missed, skip it and take the next dose at the regular time; do not take two doses at once.',
      monitoring:
          'New/worsening abdominal or biliary-type pain, nausea/vomiting, constipation severity and alcohol intake.',
      interactions:
          'Avoid or carefully review other medicines that cause constipation. OATP1B1 inhibitors and renal/hepatic impairment can require the 75 mg regimen.',
      commonMistakes:
          'Using it in a patient without a gallbladder, taking it fasting, doubling a missed dose, ignoring severe constipation, or continuing excessive alcohol intake.',
      specialPopulations:
          'Contraindicated without a gallbladder, with prior pancreatitis or significant biliary disease, severe hepatic impairment, chronic/severe constipation, and in patients with alcoholism/alcohol abuse or more than 3 alcoholic drinks per day.',
    ),
    sections: [
      MedicationSection(
        title: 'Gallbladder + pancreatitis lock',
        body:
            'Do not use in patients without a gallbladder. New or worsening upper-abdominal/biliary pain with nausea/vomiting requires immediate discontinuation and medical assessment.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Food + missed-dose lock',
        body:
            'Take twice daily with food. If a dose is missed, skip it and resume at the regular time; never double.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يعالج IBS-D عند البالغين في مرضى مختارين.',
      howToUseAr:
          'خذ الجرعة الموصوفة مرتين يوميًا مع الطعام. لا تستخدمه إذا أزيلت المرارة إلا إذا راجعت الطبيب—الملصق الحالي يعتبر غياب المرارة contraindication.',
      timingAr: 'مرتين يوميًا مع الطعام.',
      importantAr:
          'لا تستخدمه إذا لم تكن لديك مرارة. تجنب الإفراط بالكحول، وأخبر الطبيب عن تاريخ pancreatitis أو مشاكل القنوات الصفراوية.',
      commonActionableAr:
          'قد يسبب إمساكًا أو غثيانًا أو ألم بطن؛ أوقفه واتصل بالطبيب إذا أصبح الإمساك شديدًا.',
      missedDoseAr:
          'إذا نسيت جرعة فتجاوزها وخذ التالية في موعدها؛ لا تأخذ جرعتين معًا.',
      seekHelpAr:
          'أوقفه واطلب تقييمًا عند ألم جديد أو شديد أعلى البطن/الجهة اليمنى قد يمتد للظهر أو الكتف مع غثيان أو قيء.',
      teachBackAr:
          'هل لديك مرارة؟ وهل ستأخذ الجرعة مع الطعام؟ وماذا تفعل إذا نسيت جرعة؟',
    ),
  ),
  Medication(
    id: 'netupitant-palonosetron-akynzeo-oral',
    familyId: 'gastrointestinal',
    name: 'Netupitant / Palonosetron (AKYNZEO) Oral Capsule',
    subtitle: 'CINV prevention · one capsule 1 h before chemotherapy',
    tags: ['Antiemetic', 'Chemotherapy', 'AKYNZEO', 'NK1', '5-HT3'],
    aliases: ['AKYNZEO capsule', 'Netupitant 300 mg / palonosetron 0.5 mg'],
    sourceLabel:
        'DailyMed · AKYNZEO netupitant/palonosetron capsules · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Single oral combination capsule containing netupitant and palonosetron, used with dexamethasone as part of an adult chemotherapy antiemetic regimen.',
      foodTiming:
          'Take one capsule approximately 1 hour before chemotherapy; may be taken with or without food.',
      duration:
          'Single oral dose per chemotherapy cycle according to the oncology antiemetic regimen; it is not a routine daily PRN antiemetic.',
      formulationHandling:
          'Use the oral capsule regimen only; IV AKYNZEO products have different preparation and administration instructions.',
      monitoring:
          'Antiemetic control, constipation/headache and hypersensitivity; review serotonin-syndrome risk with other serotonergic drugs.',
      interactions:
          'Netupitant is a moderate CYP3A4 inhibitor whose effect can persist for about 6 days after a single dose. Strong CYP3A4 inducers such as rifampin can reduce efficacy; CYP3A4 substrates, including dexamethasone and some chemotherapy drugs, require regimen-specific review.',
      commonMistakes:
          'Taking it as a general PRN nausea capsule, repeating it on subsequent days without the regimen, ignoring the dexamethasone plan, or applying IV-product instructions to the oral capsule.',
      specialPopulations:
          'Oncology regimen and interaction review are essential; pregnancy, hepatic/renal status and concomitant serotonergic/CYP3A4 drugs should be assessed as relevant.',
    ),
    sections: [
      MedicationSection(
        title: 'Chemotherapy-linked timing',
        body:
            'One oral capsule is taken about 1 hour before chemotherapy, with or without food, as part of a regimen that includes dexamethasone.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'CYP3A4 persistence',
        body:
            'Netupitant inhibits CYP3A4 for days after a single dose. Review CYP3A4 substrates/inducers and do not treat AKYNZEO as a simple standalone PRN antiemetic.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يمنع الغثيان والقيء الحاد والمتأخر المرتبط بالchemotherapy ضمن خطة مضادة للغثيان.',
      howToUseAr:
          'خذ كبسولة واحدة فقط حسب خطة oncology، وعادة تكون مع dexamethasone حسب نوع chemotherapy.',
      timingAr:
          'كبسولة واحدة قبل بدء chemotherapy بحوالي ساعة، ويمكن مع الطعام أو بدونه.',
      importantAr:
          'ليس دواء PRN يوميًا للغثيان. لديه تداخلات CYP3A4 قد تستمر عدة أيام، لذلك لا تضف أو توقف أدوية أخرى دون مراجعة فريق العلاج.',
      commonActionableAr:
          'قد يحدث صداع أو إمساك أو تعب؛ أخبر الفريق إذا أصبح الإمساك مزعجًا أو مستمرًا.',
      missedDoseAr:
          'إذا فات وقت الجرعة قبل chemotherapy، اتصل بفريق oncology بدل أخذها في وقت عشوائي أو تكرارها.',
      seekHelpAr:
          'اطلب المساعدة عند تحسس شديد أو أعراض serotonin syndrome مثل ارتباك شديد مع رجفة/تشنج عضلي وتعرق أو حرارة.',
      teachBackAr:
          'متى ستأخذ AKYNZEO بالنسبة للchemotherapy؟ وهل هي كبسولة PRN تستمر بها في الأيام التالية؟',
    ),
  ),
];
