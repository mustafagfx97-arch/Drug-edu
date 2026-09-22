import '../models/medication.dart';

const expandedMedications13 = <Medication>[
  Medication(
    id: 'potassium-chloride-klor-con-m',
    familyId: 'kidney-electrolytes',
    name: 'Potassium Chloride ER (KLOR-CON M)',
    subtitle: 'Micro-dispersible ER tablet · meal + water-dispersion instructions',
    tags: ['Potassium', 'Electrolyte', 'ER tablet', 'KLOR-CON M'],
    aliases: ['Klor-Con M10', 'Klor-Con M15', 'Klor-Con M20'],
    sourceLabel:
        'DailyMed · KLOR-CON M potassium chloride extended-release tablets · current active labeling',
    useProfile: MedicationUseProfile(
      route:
          'Extended-release microencapsulated potassium chloride tablets available as 10, 15 and 20 mEq products.',
      foodTiming:
          'Take with meals and with a full glass of water or other liquid. Do not take on an empty stomach because of gastrointestinal irritation risk.',
      duration:
          'Individualized according to the cause of potassium loss and serial serum potassium values; may be short-term replacement or chronic supplementation.',
      formulationHandling:
          'Do not crush, chew or suck the tablet. For swallowing difficulty, the KLOR-CON M label allows breaking the tablet in half and taking each half separately with water, or dispersing the whole tablet(s) in about 4 fl oz water: allow about 2 minutes to disintegrate, stir about 30 seconds, swirl and drink immediately, then rinse the glass with 1 fl oz water twice and drink each rinse. Use water only; discard any suspension not taken immediately.',
      monitoring:
          'Serum potassium and renal function; ECG and other electrolytes when clinically indicated. Severe hypokalemia below 2.5 mEq/L requires clinician-directed IV therapy rather than oral replacement.',
      interactions:
          'Potassium-sparing diuretics, ACE inhibitors, ARBs/ARNI, trimethoprim, potassium-containing salt substitutes and renal impairment can substantially increase hyperkalemia risk.',
      commonMistakes:
          'Crushing or chewing the ER tablet, taking it fasting, mixing it in a non-water liquid, storing the water suspension for later, or continuing the same potassium dose after kidney function/diuretic therapy changes.',
      specialPopulations:
          'GI obstruction/delayed transit and renal impairment increase risk. Product-specific handling matters because other potassium chloride ER tablets may use different technology and may not allow the KLOR-CON M water-dispersion method.',
    ),
    sections: [
      MedicationSection(
        title: 'KLOR-CON M handling lock',
        body:
            'With meal + full glass of fluid. Do not crush/chew/suck. If needed, use only the KLOR-CON M alternate methods: halve and swallow each half separately, or disperse whole tablet(s) in about 4 fl oz water, wait ~2 min, stir ~30 sec, drink immediately, then rinse with 1 fl oz water twice.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Hyperkalemia lock',
        body:
            'Potassium replacement is not a routine supplement. Review kidney function and potassium-raising medicines such as ACEI/ARB/ARNI, spironolactone/eplerenone, trimethoprim and potassium-containing salt substitutes.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يعوض نقص البوتاسيوم عندما يصفه الطبيب بناءً على التحاليل والسبب.',
      howToUseAr:
          'خذه مع الوجبة ومع كوب كامل من الماء. لا تسحق أو تمضغ أو تمص الحبة. إذا كان البلع صعبًا، اتبع فقط طريقة KLOR-CON M الموثقة: يمكن تقسيم الحبة إلى نصفين وأخذ كل نصف مع الماء، أو وضع الحبة كاملة في نحو 4 أونصات ماء، الانتظار حوالي دقيقتين، التحريك نحو 30 ثانية ثم الشرب فورًا، وبعدها اشطف الكأس بأونصة ماء مرتين واشرب كل مرة.',
      timingAr:
          'يؤخذ مع الطعام وليس على معدة فارغة.',
      importantAr:
          'لا تستخدم طريقة إذابة/تفريق KLOR-CON M تلقائيًا مع أي potassium ER آخر؛ تعليمات المنتجات تختلف.',
      commonActionableAr:
          'قد يسبب غثيانًا أو ألمًا بالمعدة؛ أخذه مع الطعام والماء يقلل التهيج.',
      missedDoseAr:
          'لا تضاعف جرعة البوتاسيوم من نفسك. إذا فاتت الجرعة وكنت غير متأكد بسبب عدد الجرعات أو التحاليل فاتصل بالصيدلي.',
      storageAr:
          'يحفظ بدرجة حرارة الغرفة والعبوة مغلقة بإحكام. أي suspension محضر بالماء يجب شربه فورًا وعدم حفظه.',
      seekHelpAr:
          'اطلب تقييمًا سريعًا عند ضعف شديد جديد، خفقان/اضطراب نبض، شلل أو تنميل واضح، براز أسود أو ألم بطني شديد.',
      teachBackAr:
          'هل يجوز سحق الحبة؟ وإذا استخدمت طريقة الماء، كم تنتظر وكيف تتأكد أنك أخذت كامل الجرعة؟',
    ),
  ),
  Medication(
    id: 'potassium-chloride-er-capsule-sprinkle',
    familyId: 'kidney-electrolytes',
    name: 'Potassium Chloride ER Capsule',
    subtitle: 'Microcapsule ER formulation · may sprinkle on soft food',
    tags: ['Potassium', 'Electrolyte', 'ER capsule', 'Sprinkle'],
    aliases: ['Potassium chloride ER 8 mEq capsule', 'Potassium chloride ER 10 mEq capsule', 'Micro-K type'],
    sourceLabel:
        'DailyMed · potassium chloride extended-release capsules · revised Apr 2024',
    useProfile: MedicationUseProfile(
      route:
          'Extended-release potassium chloride capsule containing microencapsulated potassium chloride.',
      foodTiming:
          'Take with meals and with a full glass of water or other liquid; do not take on an empty stomach.',
      duration:
          'Individualized according to potassium deficit, ongoing losses and laboratory monitoring.',
      formulationHandling:
          'Swallow capsule whole when possible. If swallowing is difficult, open the capsule and sprinkle the entire contents on a spoonful of soft food such as applesauce or pudding. Swallow immediately without chewing the microcapsules and follow with a glass of water or juice. Do not add to hot food and do not store the food/microcapsule mixture.',
      monitoring:
          'Serum potassium and renal function; broader electrolyte/ECG monitoring when clinically indicated.',
      interactions:
          'Potassium-sparing diuretics and other potassium-raising medicines increase hyperkalemia risk; renal impairment materially changes safety.',
      commonMistakes:
          'Chewing the microcapsules, mixing into hot food, storing the prepared sprinkle mixture, taking fasting, or assuming the capsule-sprinkle method applies to ER tablets.',
      specialPopulations:
          'Patients with significant GI motility disorders or renal impairment require careful review.',
    ),
    sections: [
      MedicationSection(
        title: 'Sprinkle method lock',
        body:
            'Open only if needed for swallowing difficulty → sprinkle entire capsule contents on a spoonful of soft food such as applesauce/pudding → swallow immediately without chewing microcapsules → follow with water or juice. No hot food and no storage.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يعوض نقص البوتاسيوم حسب التحاليل وخطة الطبيب.',
      howToUseAr:
          'خذه مع الطعام وكوب كامل من الماء. إذا كان بلع الكبسولة صعبًا يمكن فتحها ورش كامل الحبيبات على ملعقة من طعام لين مثل applesauce أو pudding، ثم ابتلاعها فورًا دون مضغ الحبيبات وشرب ماء أو عصير بعدها.',
      timingAr: 'مع الوجبة؛ لا تأخذه على معدة فارغة.',
      importantAr:
          'لا تمضغ الحبيبات، لا تضعها في طعام ساخن، ولا تحفظ الخليط لوقت لاحق.',
      commonActionableAr:
          'قد يسبب تهيجًا أو غثيانًا بالمعدة؛ الطعام وكوب كامل من السائل يساعدان.',
      missedDoseAr:
          'لا تضاعف جرعة البوتاسيوم. اتبع تعليمات الصيدلي إذا اقترب موعد الجرعة التالية.',
      seekHelpAr:
          'راجع سريعًا عند ضعف شديد، خفقان/اضطراب نبض، براز أسود أو ألم معدة شديد.',
      teachBackAr:
          'إذا فتحت الكبسولة، هل تمضغ الحبيبات؟ وهل يمكن خلطها بطعام ساخن أو حفظها؟',
    ),
  ),
  Medication(
    id: 'potassium-chloride-oral-solution',
    familyId: 'kidney-electrolytes',
    name: 'Potassium Chloride Oral Solution',
    subtitle: '10% / 20% liquid · MUST dilute before administration',
    tags: ['Potassium', 'Electrolyte', 'Oral solution', 'Dilution'],
    aliases: ['Potassium chloride 20 mEq/15 mL', 'Potassium chloride 40 mEq/15 mL', 'KCl oral solution'],
    sourceLabel:
        'DailyMed · potassium chloride oral solution 10% and 20% · current labeling',
    useProfile: MedicationUseProfile(
      route:
          'Concentrated oral potassium chloride solution; current labeled products include 10% (20 mEq/15 mL) and 20% (40 mEq/15 mL).',
      foodTiming:
          'Dilute before administration and take with meals or immediately after eating.',
      duration:
          'Individualized according to serum potassium and the underlying cause of potassium loss.',
      formulationHandling:
          'Dilute the prescribed amount in at least 4 ounces of cold water before administration. Never give the concentrated oral solution undiluted. Verify concentration before converting mEq to mL because 10% and 20% products differ twofold.',
      monitoring:
          'Serum potassium and renal function; ECG and broader electrolytes when clinically appropriate.',
      interactions:
          'Concomitant potassium-sparing diuretics are contraindicated in the cited label; other potassium-raising drugs and renal impairment require review.',
      commonMistakes:
          'Giving the concentrate undiluted, confusing 10% with 20%, measuring by household spoon, or taking fasting.',
      specialPopulations:
          'Severe hypokalemia below 2.5 mEq/L requires clinician-directed IV potassium rather than oral solution.',
    ),
    sections: [
      MedicationSection(
        title: 'Dilution is mandatory',
        body:
            'Potassium chloride oral solution must be diluted in at least 4 oz of cold water before administration and taken with meals or immediately after eating.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Concentration lock',
        body:
            '10% = 20 mEq/15 mL; 20% = 40 mEq/15 mL. Never reuse an old mL amount without confirming the current concentration.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يعوض نقص البوتاسيوم عندما يصفه الطبيب.',
      howToUseAr:
          'تأكد من التركيز أولًا، قِس الجرعة بأداة مدرجة، ثم خففها في 4 أونصات على الأقل من الماء البارد قبل الشرب. لا تشرب المحلول المركز مباشرة.',
      timingAr:
          'خذه مع الوجبة أو مباشرة بعد الأكل.',
      importantAr:
          'تركيز 10% يعطي 20 mEq/15 mL بينما 20% يعطي 40 mEq/15 mL؛ نفس mL ليست نفس الجرعة.',
      commonActionableAr:
          'قد يسبب انزعاجًا بالمعدة؛ التخفيف والطعام مهمان لتقليل التهيج.',
      missedDoseAr:
          'لا تضاعف جرعة البوتاسيوم من نفسك.',
      storageAr:
          'احفظه حسب ملصق المنتج وبعيدًا عن متناول الأطفال؛ لا تنقل المحلول إلى عبوة غير معلّمة.',
      seekHelpAr:
          'اطلب تقييمًا عند ضعف شديد، خفقان/اضطراب نبض، تنميل/شلل أو ألم بطني شديد.',
      teachBackAr:
          'كم ماء ستستخدم على الأقل؟ وما الفرق بين 10% و20%؟',
    ),
  ),
  Medication(
    id: 'calcium-acetate-667mg-capsule',
    familyId: 'kidney-electrolytes',
    name: 'Calcium Acetate 667 mg Capsule',
    subtitle: 'Calcium-based phosphate binder · take with each meal',
    tags: ['Phosphate binder', 'Dialysis', 'Calcium acetate', 'Capsule'],
    aliases: ['PhosLo', 'Calcium acetate 667 mg'],
    sourceLabel:
        'DailyMed · calcium acetate 667 mg capsules · current labeling',
    useProfile: MedicationUseProfile(
      route:
          'Oral calcium acetate 667 mg capsules used as a phosphate binder in ESRD.',
      foodTiming:
          'Take with each meal so the binder is present with dietary phosphate.',
      duration:
          'Usually chronic while phosphate binding is required, with dose adjustment based on serum phosphorus and calcium.',
      formulationHandling:
          'Swallow the prescribed capsule count with meals. Do not add extra calcium supplements or calcium-containing nonprescription antacids unless specifically directed.',
      monitoring:
          'Serum phosphorus and calcium. Early dose titration requires closer calcium monitoring because hypercalcemia can occur.',
      interactions:
          'Calcium can bind tetracyclines and fluoroquinolones. For an oral drug where reduced bioavailability would be clinically important, current labeling advises at least 1 hour before or 3 hours after calcium acetate. Hypercalcemia may aggravate digitalis toxicity.',
      commonMistakes:
          'Taking it away from meals, adding OTC calcium/antacids without review, or assuming every concomitant oral medicine uses the same interaction rule.',
      specialPopulations:
          'Contraindicated in hypercalcemia. Dialysis calcium balance, vitamin D therapy and digoxin use increase monitoring importance.',
    ),
    sections: [
      MedicationSection(
        title: 'Meal-linked binder',
        body:
            'Take calcium acetate with each meal. It works by binding dietary phosphate, so taking it away from meals defeats the purpose.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Calcium + interaction lock',
        body:
            'Avoid extra calcium supplements/calcium antacids unless directed. For clinically important oral drugs, use at least 1 hour before or 3 hours after unless a more specific interaction plan applies.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يربط الفوسفات الموجود في الطعام للمساعدة على خفض الفوسفور عند مرضى الكلى.',
      howToUseAr:
          'خذ عدد الكبسولات الموصوف مع كل وجبة.',
      timingAr:
          'مع الوجبات، وليس بين الوجبات.',
      importantAr:
          'لا تضف مكمل كالسيوم أو antacid يحتوي كالسيوم من نفسك. بعض الأدوية الفموية تحتاج فصلًا زمنيًا لأن الكالسيوم قد يقلل امتصاصها.',
      commonActionableAr:
          'قد يحدث إمساك أو غثيان؛ ارتفاع الكالسيوم قد يسبب إمساكًا، فقدان شهية أو غثيانًا ويحتاج تحليلًا ومراجعة.',
      missedDoseAr:
          'لا تجمع جرعتين مع وجبة واحدة لتعويض وجبة سابقة؛ استأنف مع الوجبة التالية حسب خطة فريق الكلى.',
      seekHelpAr:
          'راجع الطبيب عند ارتباك شديد، ضعف واضح، قيء مستمر أو أعراض قد تدل على ارتفاع الكالسيوم.',
      teachBackAr:
          'متى تأخذ calcium acetate؟ وهل تضيف مكمل كالسيوم أو antacid من نفسك؟',
    ),
  ),
  Medication(
    id: 'lanthanum-carbonate-fosrenol-chewable',
    familyId: 'kidney-electrolytes',
    name: 'Lanthanum Carbonate (FOSRENOL) Chewable',
    subtitle: 'Phosphate binder · chew/crush completely, never swallow whole',
    tags: ['Phosphate binder', 'Dialysis', 'FOSRENOL', 'Chewable'],
    aliases: ['Fosrenol chewable', 'Lanthanum carbonate chewable'],
    sourceLabel:
        'DailyMed · FOSRENOL chewable tablets · current Dec 2024 labeling',
    useProfile: MedicationUseProfile(
      route:
          'Chewable lanthanum carbonate phosphate binder, available as 500 mg, 750 mg and 1000 mg tablets.',
      foodTiming:
          'Take with or immediately after meals.',
      duration:
          'Usually chronic while phosphate control is needed, with titration to serum phosphate response.',
      formulationHandling:
          'Chew the tablet completely before swallowing. If unable to chew completely, crush the tablet thoroughly before swallowing or use the separately labeled oral powder formulation. Never swallow the chewable tablet whole.',
      monitoring:
          'Serum phosphate and GI tolerance. Bowel obstruction, ileus, fecal impaction and serious GI complications have been reported, particularly with incompletely chewed tablets or predisposing GI disease.',
      interactions:
          'Oral quinolone antibiotics at least 1 hour before or 4 hours after FOSRENOL. Thyroid hormone replacement at least 2 hours before or 2 hours after, with TSH monitoring. Other compounds affected by cationic antacids should not be taken within 2 hours unless specifically reviewed.',
      commonMistakes:
          'Swallowing the tablet whole, incompletely chewing it, taking it away from food, or using one generic spacing rule for every oral medicine.',
      specialPopulations:
          'Contraindicated in bowel obstruction, ileus and fecal impaction. The oral powder has different handling instructions and should be treated as a separate formulation.',
    ),
    sections: [
      MedicationSection(
        title: 'Never swallow whole',
        body:
            'FOSRENOL chewable tablets must be chewed completely or crushed thoroughly before swallowing. Serious GI complications have been associated with unchewed/incompletely chewed tablets.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Interaction timing',
        body:
            'Quinolones: at least 1 h before or 4 h after. Thyroid hormone: at least 2 h before or 2 h after. Other clinically important oral drugs require individualized spacing review.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يربط الفوسفات من الطعام للمساعدة على خفض الفوسفور عند مرضى الكلى.',
      howToUseAr:
          'امضغ الحبة بالكامل قبل البلع. إذا لا تستطيع مضغها جيدًا، يمكن سحقها تمامًا حسب تعليمات المنتج أو سؤال الصيدلي عن oral powder المنفصل. لا تبتلع الحبة كاملة.',
      timingAr:
          'خذها مع الوجبة أو مباشرة بعدها.',
      importantAr:
          'الـquinolone antibiotics تؤخذ قبل FOSRENOL بساعة على الأقل أو بعده بـ4 ساعات، وlevothyroxine قبل أو بعده بساعتين على الأقل.',
      commonActionableAr:
          'قد يحدث غثيان أو قيء أو ألم بطن؛ إمساك شديد أو انتفاخ/قيء مستمر يحتاج مراجعة.',
      missedDoseAr:
          'لا تضاعف مع وجبة لاحقة؛ استأنف الجرعة مع الوجبة التالية حسب الخطة.',
      seekHelpAr:
          'اطلب تقييمًا سريعًا عند ألم/انتفاخ شديد بالبطن، قيء مستمر، عدم خروج براز/غازات أو أعراض انسداد.',
      teachBackAr:
          'هل تبتلع FOSRENOL كاملة؟ وكم تفصلها عن quinolone وعن levothyroxine؟',
    ),
  ),
];
