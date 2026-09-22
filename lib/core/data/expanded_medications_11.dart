import '../models/medication.dart';

const expandedMedications11 = <Medication>[
  Medication(
    id: 'patiromer-veltassa',
    familyId: 'kidney-electrolytes',
    name: 'Patiromer (VELTASSA)',
    subtitle: 'Potassium binder powder · preparation + 3-hour interaction lock',
    tags: ['Hyperkalemia', 'Potassium binder', 'Powder', 'VELTASSA'],
    aliases: ['Veltassa', 'Patiromer'],
    sourceLabel: 'DailyMed · VELTASSA (patiromer) · revised Jan 2025',
    useProfile: MedicationUseProfile(
      route:
          'Oral patiromer powder for suspension for treatment of hyperkalemia; current U.S. labeling includes adults and pediatric patients 12 years and older.',
      foodTiming:
          'Use at the prescribed time. Separate other oral medicines by at least 3 hours before or after VELTASSA unless the exact concomitant medicine is specifically shown in current labeling not to require separation.',
      duration:
          'Duration is individualized according to potassium control and the underlying cause of hyperkalemia; it may be continued as maintenance when clinically appropriate.',
      formulationHandling:
          'Prepare immediately before use. Measure 1/3 cup water, pour half into a glass, add the prescribed packet(s), stir, add the remaining water and stir thoroughly. The powder does not dissolve. Drink immediately; if powder remains, add more water, stir and drink until the full dose is taken. Do not take the powder dry and do not heat it or add it to heated food/liquid.',
      monitoring:
          'Serum potassium and magnesium; bowel function and GI tolerance. Current labeling warns about worsening GI motility disorders and hypomagnesemia.',
      interactions:
          'Patiromer can bind some oral drugs and reduce absorption. The default product rule is at least 3 hours of separation unless the exact interacting medicine is listed in the current no-separation table.',
      commonMistakes:
          'Swallowing the powder dry, heating it, leaving residue in the glass, or applying a blanket no-separation assumption to every concomitant medicine without checking the current interaction table.',
      specialPopulations:
          'Not an emergency treatment for life-threatening hyperkalemia because of delayed onset. Avoid routine use in severe constipation, bowel obstruction/impaction or major motility disorders without specialist review.',
    ),
    sections: [
      MedicationSection(
        title: 'Preparation lock',
        body:
            '1/3 cup water total: half water → packet(s) → stir → remaining water → stir thoroughly → drink immediately. The powder does not dissolve. Rinse the glass with more water until no dose remains. Never take dry or heat.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Interaction + emergency lock',
        body:
            'Default separation is at least 3 hours before/after other oral medicines unless the exact drug is in the label\'s no-separation table. VELTASSA is not for emergency treatment of life-threatening hyperkalemia.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يُستخدم لخفض البوتاسيوم المرتفع في الدم، لكنه ليس علاج إسعاف للحالات الخطرة جدًا.',
      howToUseAr:
          'حضّر الجرعة مباشرة قبل الاستعمال: ضع نصف ثلث كوب ماء في الكأس، أضف الـpacket/packets وحرّك، ثم أضف بقية الماء وحرّك جيدًا. المسحوق لا يذوب. اشربه فورًا، وإذا بقي مسحوق أضف ماء وحرّك واشرب حتى تأخذ الجرعة كاملة.',
      timingAr:
          'افصل أغلب الأدوية الفموية الأخرى 3 ساعات على الأقل قبل أو بعد VELTASSA إلا إذا تأكد الصيدلي أن دواءك من الاستثناءات الموثقة.',
      importantAr:
          'لا تأخذ المسحوق جافًا ولا تسخنه أو تضعه في طعام/شراب ساخن.',
      commonActionableAr:
          'قد يحدث إمساك أو انزعاج بالمعدة، وقد ينخفض المغنيسيوم؛ أخبر الطبيب إذا أصبح الإمساك شديدًا أو مستمرًا.',
      missedDoseAr:
          'لا تضاعف الـpackets لتعويض جرعة منسية؛ اتبع خطة الجرعات التي أعطاك الطبيب أو الصيدلي.',
      storageAr:
          'يحفظ مبردًا 2–8°C. إذا أُخرج للحفظ بدرجة الغرفة فيجب استخدامه خلال 3 أشهر، ولا تعرضه لحرارة زائدة.',
      seekHelpAr:
          'اطلب تقييمًا سريعًا إذا ظهر ضعف شديد، خفقان غير معتاد، إمساك شديد مع انتفاخ/قيء، أو أعراض تدهور واضح في البوتاسيوم.',
      teachBackAr:
          'اشرح لي كيف ستخلط VELTASSA، وهل يجوز أخذه جافًا أو مع دواء فموي آخر في نفس الوقت؟',
    ),
  ),
  Medication(
    id: 'sodium-zirconium-cyclosilicate-lokelma',
    familyId: 'kidney-electrolytes',
    name: 'Sodium Zirconium Cyclosilicate (LOKELMA)',
    subtitle: 'Potassium binder powder · water mixing + 2-hour interaction lock',
    tags: ['Hyperkalemia', 'Potassium binder', 'Powder', 'LOKELMA'],
    aliases: ['Lokelma', 'Sodium zirconium cyclosilicate'],
    sourceLabel: 'DailyMed · LOKELMA · revised May 2023',
    useProfile: MedicationUseProfile(
      route:
          'Oral sodium zirconium cyclosilicate powder for suspension for treatment of hyperkalemia in adults.',
      foodTiming:
          'Use according to the prescribed correction or maintenance schedule. In general, separate other oral medicines by at least 2 hours before or after LOKELMA.',
      duration:
          'Can be used for a short correction phase or ongoing maintenance depending on potassium response; chronic hemodialysis patients use it only on non-dialysis days according to the labeled regimen.',
      formulationHandling:
          'Empty the entire packet dose into a drinking glass containing approximately 3 tablespoons of water or more. Stir well and drink immediately. If powder remains, add more water, stir and drink immediately; repeat until the entire dose is taken.',
      monitoring:
          'Serum potassium and volume status. Each 5 g dose contains sodium; monitor for edema, particularly in patients prone to fluid overload or heart failure.',
      interactions:
          'LOKELMA can transiently increase gastric pH and alter absorption of medicines with pH-dependent solubility. In general separate oral medicines by at least 2 hours before or after, while recognizing that proven pH-independent drugs may not require spacing.',
      commonMistakes:
          'Using too little/no water, failing to drink residual powder, treating it as an emergency rescue for life-threatening hyperkalemia, or forgetting sodium/edema risk.',
      specialPopulations:
          'Not an emergency treatment for life-threatening hyperkalemia because of delayed onset. Dialysis dosing is specifically on non-dialysis days and should not be generalized to non-dialysis patients.',
    ),
    sections: [
      MedicationSection(
        title: 'Water-mixing lock',
        body:
            'Entire packet dose + about 3 tablespoons of water or more → stir well → drink immediately. Add more water and repeat if powder remains so the full dose is consumed.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: '2-hour + sodium lock',
        body:
            'In general separate other oral medicines by at least 2 hours before/after. LOKELMA contains sodium and can cause edema; it is not emergency rescue for life-threatening hyperkalemia.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يُستخدم لخفض البوتاسيوم المرتفع في الدم عند البالغين، لكنه ليس علاج إسعاف للحالة المهددة للحياة.',
      howToUseAr:
          'أفرغ كامل الجرعة في كأس فيه تقريبًا 3 ملاعق طعام من الماء أو أكثر، حرّك جيدًا واشرب فورًا. إذا بقي مسحوق، أضف ماء وحرّك واشرب وكرر حتى تأخذ الجرعة كلها.',
      timingAr:
          'بصورة عامة افصل الأدوية الفموية الأخرى ساعتين على الأقل قبل أو بعد LOKELMA، إلا إذا أكد الصيدلي أن الدواء لا يحتاج فصلًا.',
      importantAr:
          'الدواء يحتوي صوديوم؛ إذا لديك قابلية للتورم أو فشل قلب راقب زيادة التورم/الوزن حسب خطة الطبيب.',
      commonActionableAr:
          'قد يحدث تورم بسبب احتباس السوائل عند بعض المرضى.',
      missedDoseAr:
          'لا تضاعف الـpackets لتعويض الجرعة؛ ارجع لجدولك الموصوف، وخاصة إذا كنت على غسيل كلوي لأن أيام الجرعات تختلف.',
      seekHelpAr:
          'اطلب تقييمًا إذا ظهر ضيق نفس جديد، تورم سريع وواضح، زيادة وزن مفاجئة، أو أعراض اضطراب شديد في البوتاسيوم.',
      teachBackAr:
          'كم ماء ستستخدم تقريبًا؟ وكم ساعة تفصل LOKELMA عن أغلب الأدوية الفموية؟',
    ),
  ),
  Medication(
    id: 'sevelamer-carbonate-renvela-tablet',
    familyId: 'kidney-electrolytes',
    name: 'Sevelamer Carbonate (RENVELA) Tablet',
    subtitle: '800 mg tablet · phosphate binder taken with meals',
    tags: ['Phosphate binder', 'CKD', 'Dialysis', 'RENVELA', 'Tablet'],
    aliases: ['Renvela tablet', 'Sevelamer carbonate 800 mg'],
    sourceLabel: 'DailyMed · RENVELA tablets · revised Mar 2023',
    useProfile: MedicationUseProfile(
      route:
          'RENVELA sevelamer carbonate 800 mg film-coated tablet for control of serum phosphorus in adults and children 6 years and older with CKD on dialysis.',
      foodTiming:
          'Take with meals. The prescribed amount is meal-linked because the binder must be present with dietary phosphate.',
      duration:
          'Usually chronic while phosphate control is needed, with dose titration based on serum phosphorus and the dialysis nutrition plan.',
      formulationHandling:
          'Use the tablet product exactly as dispensed. The current RENVELA label provides a separate powder formulation for patients needing suspension; it does not provide a routine tablet-crushing method, so do not improvise crushing without exact product verification.',
      monitoring:
          'Serum phosphorus and GI tolerance. New or worsening constipation, dysphagia, bowel obstruction symptoms or bloody stool need prompt review.',
      interactions:
          'For oral drugs where reduced bioavailability would be clinically important, the patient counseling section advises at least 1 hour before or 3 hours after RENVELA unless a drug-specific interval applies. Ciprofloxacin requires at least 2 hours before or 6 hours after; mycophenolate mofetil at least 2 hours before.',
      commonMistakes:
          'Taking the binder away from meals, assuming every oral drug uses the same separation interval, or crushing the tablet without verifying the exact product.',
      specialPopulations:
          'Contraindicated in bowel obstruction. Patients with swallowing difficulty or major GI motility problems need formulation and risk review.',
    ),
    sections: [
      MedicationSection(
        title: 'Meal-linked phosphate binding',
        body:
            'RENVELA tablets are taken with meals. Do not schedule them as a generic empty-stomach medicine.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Interaction timing is not one-size-fits-all',
        body:
            'General patient-counseling rule for clinically important oral drugs is at least 1 hour before or 3 hours after RENVELA, but ciprofloxacin is 2 hours before or 6 hours after and mycophenolate mofetil at least 2 hours before.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يربط الفوسفات من الطعام للمساعدة على خفض الفوسفور عند مرضى الكلى على الغسيل.',
      howToUseAr:
          'خذ حبة RENVELA مع الوجبة وبالعدد الموصوف لك. إذا كان بلع الحبة صعبًا لا تسحقها من نفسك؛ اسأل عن الـpowder المخصص بدلًا من ذلك.',
      timingAr:
          'يؤخذ مع الوجبات. بعض الأدوية تحتاج فصلًا زمنيًا خاصًا، لذلك أعطِ الصيدلي قائمة أدويتك.',
      importantAr:
          'لا تستخدم قاعدة فصل واحدة لكل الأدوية: ciprofloxacin وmycophenolate لهما تعليمات خاصة، وأدوية أخرى قد تحتاج مراقبة أو فصل مختلف.',
      commonActionableAr:
          'قد يحدث غثيان أو إمساك. عالج الإمساك مبكرًا ولا تتجاهل صعوبة البلع.',
      missedDoseAr:
          'لا تجمع جرعتين مع وجبة واحدة لتعويض جرعة مرتبطة بوجبة سابقة؛ استأنف الخطة مع الوجبة التالية حسب تعليمات فريق الكلى.',
      storageAr:
          'يحفظ بدرجة حرارة الغرفة 25°C مع الحماية من الرطوبة.',
      seekHelpAr:
          'راجع الطبيب سريعًا عند إمساك شديد أو متفاقم، صعوبة بلع، ألم/انتفاخ شديد بالبطن، قيء مستمر أو براز دموي.',
      teachBackAr:
          'متى تأخذ RENVELA؟ وهل كل الأدوية الأخرى لها نفس فترة الفصل عنه؟',
    ),
  ),
  Medication(
    id: 'sevelamer-carbonate-renvela-powder',
    familyId: 'kidney-electrolytes',
    name: 'Sevelamer Carbonate (RENVELA) Powder',
    subtitle: '0.8 g / 2.4 g packets · water suspension with meals',
    tags: ['Phosphate binder', 'CKD', 'Dialysis', 'RENVELA', 'Powder'],
    aliases: ['Renvela powder', 'Sevelamer carbonate powder'],
    sourceLabel: 'DailyMed · RENVELA powder for oral suspension · revised Mar 2023',
    useProfile: MedicationUseProfile(
      route:
          'RENVELA sevelamer carbonate powder for oral suspension, supplied as 0.8 g and 2.4 g packets, for control of serum phosphorus in CKD patients on dialysis.',
      foodTiming:
          'Take with meals. The prepared suspension is part of the meal-linked phosphate-binding dose.',
      duration:
          'Usually chronic while phosphate control is needed, with titration based on serum phosphorus.',
      formulationHandling:
          'Place the entire packet contents in a cup. Mix each 0.8 g packet with at least 30 mL (1 oz / 2 tablespoons) water and each 2.4 g packet with at least 60 mL (2 oz / 4 tablespoons) water. Stir thoroughly; the powder does not dissolve. Stir again immediately before drinking if needed and consume the entire preparation within 30 minutes.',
      monitoring:
          'Serum phosphorus, adherence to the meal-linked regimen and GI tolerance; promptly review worsening constipation, dysphagia, obstruction symptoms or bloody stool.',
      interactions:
          'Same RENVELA interaction rules as tablets: clinically important oral drugs may require separation; ciprofloxacin at least 2 hours before or 6 hours after, mycophenolate mofetil at least 2 hours before.',
      commonMistakes:
          'Expecting the powder to dissolve completely, using the wrong water volume for packet strength, preparing it far in advance, or taking it without the meal.',
      specialPopulations:
          'Contraindicated in bowel obstruction. Dose selection and packet combinations remain clinician-directed and should not be inferred from another phosphate binder.',
    ),
    sections: [
      MedicationSection(
        title: 'Packet preparation lock',
        body:
            '0.8 g packet → at least 30 mL water. 2.4 g packet → at least 60 mL water. Stir thoroughly; it does not dissolve. Consume the full preparation within 30 minutes.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Meal + interaction lock',
        body:
            'Take with meals. Do not assume a universal separation interval for every medicine; ciprofloxacin and mycophenolate have explicit product-specific intervals.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يربط الفوسفات من الطعام للمساعدة على خفض الفوسفور عند مرضى الكلى على الغسيل.',
      howToUseAr:
          'ضع كامل محتوى الـpacket في كأس: 0.8 g مع 30 mL ماء على الأقل، و2.4 g مع 60 mL ماء على الأقل. حرّك جيدًا؛ لن يذوب تمامًا. حرّك مرة أخرى قبل الشرب إذا ترسب، واشرب الكمية كاملة خلال 30 دقيقة.',
      timingAr:
          'يؤخذ مع الوجبات، وليس بعيدًا عنها.',
      importantAr:
          'لا تحضّره قبل وقت طويل ولا تتوقع أن يصبح محلولًا صافيًا؛ هو suspension. راجع الصيدلي لفصل الأدوية الأخرى.',
      commonActionableAr:
          'قد يحدث غثيان أو إمساك؛ لا تتجاهل الإمساك المتفاقم.',
      missedDoseAr:
          'لا تضاعف كمية الـpowder مع وجبة لاحقة لتعويض وجبة فاتت؛ استأنف الجرعات مع الوجبات حسب الخطة.',
      storageAr:
          'يحفظ بدرجة حرارة الغرفة 25°C مع الحماية من الرطوبة.',
      seekHelpAr:
          'راجع الطبيب سريعًا عند إمساك شديد أو متفاقم، صعوبة بلع، ألم/انتفاخ شديد بالبطن، قيء مستمر أو براز دموي.',
      teachBackAr:
          'كم mL ماء تحتاج لـ0.8 g وكم تحتاج لـ2.4 g؟ وهل يجب أن يذوب المسحوق تمامًا؟',
    ),
  ),
  Medication(
    id: 'sucroferric-oxyhydroxide-velphoro',
    familyId: 'kidney-electrolytes',
    name: 'Sucroferric Oxyhydroxide (VELPHORO)',
    subtitle: '500 mg chewable phosphate binder · chew/crush with meals',
    tags: ['Phosphate binder', 'CKD', 'Dialysis', 'VELPHORO', 'Chewable'],
    aliases: ['Velphoro', 'Sucroferric oxyhydroxide'],
    sourceLabel: 'DailyMed · VELPHORO · revised Mar 2026',
    useProfile: MedicationUseProfile(
      route:
          'Chewable phosphate binder for adults and pediatric patients 9 years and older with CKD on dialysis.',
      foodTiming:
          'Must be taken with meals. If daily tablets cannot be divided equally among meals, current labeling places the larger portion with the largest meal.',
      duration:
          'Usually chronic while phosphate control is needed, with regular serum phosphorus monitoring and titration.',
      formulationHandling:
          'Chew or crush the tablet; do not swallow it whole.',
      monitoring:
          'Serum phosphorus and GI tolerance. Monitor iron homeostasis in patients with iron-accumulation disorders or other high-risk GI/hepatic situations described in labeling.',
      interactions:
          'Current labeling: aspirin, cephalexin and doxycycline at least 1 hour before VELPHORO; levothyroxine at least 4 hours before. Other clinically important oral drugs may also need individualized separation.',
      commonMistakes:
          'Swallowing the chewable tablet whole, taking it without food, or assuming the dark stool it causes always rules out GI bleeding.',
      specialPopulations:
          'Current U.S. labeling is for CKD on dialysis and age 9 years or older; not approved for younger children because an appropriate dosage strength is lacking.',
    ),
    sections: [
      MedicationSection(
        title: 'Chew/crush — never whole',
        body:
            'VELPHORO tablets should be chewed or crushed and taken with meals. Do not swallow the tablet whole.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Expected dark stool + interaction lock',
        body:
            'Dark/black stool can occur from the iron-containing binder, but clinically concerning bleeding symptoms still require evaluation. Aspirin/cephalexin/doxycycline are taken at least 1 hour before; levothyroxine at least 4 hours before.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يربط الفوسفات من الطعام للمساعدة على خفض الفوسفور عند مرضى الكلى على الغسيل.',
      howToUseAr:
          'امضغ حبة VELPHORO جيدًا أو اسحقها حسب التعليمات، وخذها مع الوجبة. لا تبتلع الحبة كاملة.',
      timingAr:
          'يؤخذ مع الوجبات. levothyroxine يؤخذ قبل VELPHORO بـ4 ساعات على الأقل، وبعض الأدوية مثل doxycycline/cephalexin/aspirin قبلها بساعة على الأقل.',
      importantAr:
          'قد يصبح لون البراز داكنًا/أسود وهذا متوقع مع هذا الدواء المحتوي على الحديد، لكنه لا يعني تجاهل علامات نزف حقيقية.',
      commonActionableAr:
          'قد يحدث إسهال أو تغير لون البراز؛ وقد يسبب الدواء تصبغ الأسنان عند بعض المرضى.',
      missedDoseAr:
          'إذا نسيت جرعة، استأنف الدواء مع الوجبة التالية ولا تعوض بجرعة مضاعفة.',
      storageAr:
          'احفظ العبوة مغلقة بإحكام وبعيدة عن الرطوبة في درجة حرارة الغرفة.',
      seekHelpAr:
          'راجع الطبيب عند إسهال شديد مستمر، طفح مهم، ألم بطن شديد، أو أعراض نزف مثل دوخة شديدة/إغماء أو قيء دموي.',
      teachBackAr:
          'هل تبتلع VELPHORO كاملة؟ ومع ماذا تؤخذ؟ وما فترة الفصل عن levothyroxine؟',
    ),
  ),
];
