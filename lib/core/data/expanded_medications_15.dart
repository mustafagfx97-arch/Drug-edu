import '../models/medication.dart';

const expandedMedications15 = <Medication>[
  Medication(
    id: 'calcium-carbonate-antacid-500mg-chewable',
    familyId: 'otc',
    name: 'Calcium Carbonate 500 mg Chewable Antacid',
    subtitle: '500 mg calcium carbonate = 200 mg elemental calcium · chew completely',
    tags: ['OTC', 'Antacid', 'Heartburn', 'Chewable'],
    aliases: ['Calcium carbonate antacid 500 mg', 'Regular strength antacid chewable'],
    sourceLabel:
        'DailyMed · Calcium Carbonate 500 mg Chewable Antacid · updated Apr 27, 2026',
    useProfile: MedicationUseProfile(
      route:
          'OTC chewable antacid tablet containing calcium carbonate 500 mg per tablet, equivalent to 200 mg elemental calcium in the cited product.',
      foodTiming:
          'Use as symptoms occur according to the product label. It is not a scheduled acid-suppression medicine.',
      duration:
          'Short self-care use. The cited 500 mg product warns not to use the maximum dosage for more than 2 weeks unless directed by a doctor.',
      formulationHandling:
          'Chew tablets completely before swallowing. Current cited directions are 2–4 tablets as symptoms occur; do not exceed 15 tablets in 24 hours. Other strengths/products can have different limits.',
      monitoring:
          'Refer persistent/recurrent heartburn or alarm symptoms rather than repeatedly extending self-treatment.',
      interactions:
          'Antacids can interact with prescription medicines. Calcium can impair absorption of selected drugs; medication-specific separation should be checked rather than assuming one universal interval.',
      commonMistakes:
          'Swallowing the chewable tablet whole, using the maximum dose for weeks, adding it on top of other calcium products without review, or assuming all calcium-carbonate strengths have the same tablet limit.',
      specialPopulations:
          'Kidney disease and pregnancy/breastfeeding require additional review. This antacid record is not a calcium-supplement dosing recommendation.',
    ),
    sections: [
      MedicationSection(
        title: 'Strength + elemental-calcium lock',
        body:
            'This record is for calcium carbonate 500 mg chewable antacid, equivalent to 200 mg elemental calcium per tablet in the cited label. Do not transfer its tablet-count limits to a different strength.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'OTC duration boundary',
        body:
            'Current label: chew 2–4 tablets as symptoms occur, do not exceed 15 tablets in 24 hours, and do not use the maximum dosage for more than 2 weeks unless a doctor directs it.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'مضاد حموضة سريع للحموضة وحرقة المعدة العابرة.',
      howToUseAr:
          'هذا المنتج 500 mg calcium carbonate للحبة الواحدة؛ امضغ الحبة جيدًا قبل البلع. اتبع عدد الحبات المكتوب على نفس العبوة ولا تنقل جرعة منتج إلى تركيز آخر.',
      timingAr:
          'يؤخذ عند حدوث الأعراض حسب ملصق المنتج، وليس كدواء حموضة مجدول يوميًا.',
      importantAr:
          'الـantacids قد تقلل امتصاص بعض الأدوية. إذا تستخدم أدوية وصفية مثل levothyroxine أو بعض المضادات الحيوية فاسأل الصيدلي عن الفصل المناسب لنفس الدواء.',
      commonActionableAr:
          'قد يسبب إمساكًا أو غازات عند بعض الأشخاص.',
      missedDoseAr:
          'دواء عند الحاجة؛ لا توجد جرعة منسية ولا حاجة لتعويضها.',
      storageAr:
          'احفظه بدرجة حرارة الغرفة وبعيدًا عن الرطوبة حسب العبوة.',
      seekHelpAr:
          'راجع الطبيب إذا أصبحت الحموضة متكررة/مستمرة، أو ظهر صعوبة بلع، قيء دموي، براز أسود، ألم صدر غير معتاد أو نقص وزن غير مقصود.',
      teachBackAr:
          'هل تبتلع الحبة كاملة أم تمضغها؟ وهل تستخدم نفس عدد الحبات إذا تغير تركيز المنتج؟',
    ),
  ),
  Medication(
    id: 'magnesium-hydroxide-milk-of-magnesia-2400mg30ml',
    familyId: 'otc',
    name: 'Magnesium Hydroxide (Milk of Magnesia)',
    subtitle: '2400 mg/30 mL suspension · antacid vs laxative directions differ',
    tags: ['OTC', 'Constipation', 'Antacid', 'Suspension'],
    aliases: ['Milk of Magnesia', 'Magnesium hydroxide 400 mg/5 mL'],
    sourceLabel:
        'DailyMed · Milk of Magnesia 2400 mg/30 mL · current 2026 labeling',
    useProfile: MedicationUseProfile(
      route:
          'Oral magnesium hydroxide suspension containing 2400 mg per 30 mL (400 mg/5 mL) in the cited product.',
      foodTiming:
          'Antacid and laxative uses have different directions. For laxative use, take the measured dose with a full 8 oz glass of liquid.',
      duration:
          'Occasional self-care only. For laxative use, seek review if needed for more than 1 week. For antacid use, do not use the maximum dosage for more than 2 weeks unless directed.',
      formulationHandling:
          'Shake well before every dose and measure in mL. Cited adult/≥12-year directions: antacid 30 mL up to twice daily; laxative 30–60 mL as one daily dose or divided doses, maximum 60 mL/24 hours. Product usually produces a bowel movement in 1/2 to 6 hours.',
      monitoring:
          'Assess kidney disease, magnesium restriction, abdominal pain/nausea/vomiting and prolonged change in bowel habits before recommending as a laxative.',
      interactions:
          'Antacid/laxative magnesium can interact with prescription medicines; exact separation depends on the other medicine.',
      commonMistakes:
          'Not shaking, measuring with a household spoon, using antacid directions for constipation or vice versa, exceeding 60 mL/day, or using in kidney disease without review.',
      specialPopulations:
          'Kidney disease materially increases magnesium accumulation risk. Children under 12 should use only with clinician-directed product instructions.',
    ),
    sections: [
      MedicationSection(
        title: 'Two uses, two direction sets',
        body:
            'Do not treat the antacid and laxative directions as interchangeable. Laxative use requires a full 8 oz glass of liquid and generally works within 1/2–6 hours.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Kidney + self-care boundary',
        body:
            'Ask before use with kidney disease or a magnesium-restricted diet. Stop and seek review for rectal bleeding/no bowel movement after laxative use or if laxative treatment is needed beyond 1 week.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يمكن أن يعمل كمضاد حموضة أو كملين للإمساك العرضي، لكن جرعة كل استخدام مختلفة.',
      howToUseAr:
          'رج العبوة جيدًا ثم قِس الجرعة بالمليلتر. إذا تستخدمه كملين، اشرب معه كوبًا كاملًا حوالي 8 أونصات من السوائل.',
      timingAr:
          'للإمساك قد يبدأ المفعول خلال نصف ساعة إلى 6 ساعات. اتبع جدول الاستخدام المكتوب لنفس الغرض على العبوة.',
      importantAr:
          'لا تستخدم جرعة الحموضة كأنها جرعة الإمساك أو العكس. إذا لديك مرض كلوي أو حمية قليلة المغنيسيوم اسأل الطبيب/الصيدلي قبل الاستخدام.',
      commonActionableAr:
          'قد يسبب برازًا رخوًا أو مغصًا؛ لا تكرر الجرعة أسرع من تعليمات العبوة.',
      missedDoseAr:
          'عادةً دواء عند الحاجة؛ لا تضاعف لتعويض جرعة سابقة.',
      storageAr:
          'يحفظ بدرجة الغرفة ويحُمى من التجمد حسب الملصق.',
      seekHelpAr:
          'أوقفه وراجع عند نزف شرجي، عدم حدوث تبرز بعد استخدام الملين، ألم بطن شديد/قيء، أو الحاجة للملين لأكثر من أسبوع.',
      teachBackAr:
          'هل تستخدمه للحموضة أم للإمساك؟ وهل ترج العبوة وتشرب كوبًا كاملًا من السوائل مع جرعة الملين؟',
    ),
  ),
  Medication(
    id: 'glycerin-adult-suppository-2g',
    familyId: 'otc',
    name: 'Glycerin Adult Suppository 2 g',
    subtitle: 'Rectal laxative · retain 15 minutes · usually works in 15–60 minutes',
    tags: ['OTC', 'Constipation', 'Suppository', 'Rectal'],
    aliases: ['Glycerin suppository adult', 'Glycerin 2 g suppository'],
    hasVisualGuide: true,
    sourceLabel:
        'DailyMed · Adult Glycerin Suppository 2 g · current 2026 labeling',
    useProfile: MedicationUseProfile(
      route:
          'Rectal glycerin suppository 2 g for occasional constipation.',
      foodTiming:
          'Not food-related. Choose a time when toilet access is available because action is usually within 1/4 to 1 hour.',
      duration:
          'Occasional use only. Do not use laxative products longer than 1 week unless directed by a doctor.',
      formulationHandling:
          'Rectal use only. Unwrap, insert one suppository well into the rectum and retain for 15 minutes; it does not need to melt to work. Do not exceed one adult suppository daily in the cited product.',
      monitoring:
          'Refer before use when abdominal pain, nausea/vomiting or a sudden bowel-habit change lasting over 2 weeks is present.',
      interactions:
          'No routine systemic timing interaction is central; avoid stacking multiple rectal/laxative products without a clear plan.',
      commonMistakes:
          'Swallowing the suppository, inserting only partially, immediately expelling it instead of retaining for 15 minutes, or repeating more than once daily.',
      specialPopulations:
          'Adult-size products are not interchangeable with pediatric suppositories. Product age cutoffs vary; verify the exact package for children.',
    ),
    sections: [
      MedicationSection(
        title: 'Rectal technique lock',
        body:
            'Insert one suppository well into the rectum and retain for 15 minutes. It need not melt to produce laxative action. Do not exceed one adult suppository daily for the cited product.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Referral boundary',
        body:
            'Stop and seek review for rectal bleeding or failure to have a bowel movement after use. Do not continue laxative self-treatment beyond 1 week without medical advice.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'تحميلة شرجية للإمساك العرضي وتعمل عادةً بسرعة.',
      howToUseAr:
          'افتح الغلاف وأدخل تحميلة واحدة جيدًا داخل المستقيم، ثم حاول الاحتفاظ بها 15 دقيقة. لا تحتاج أن تذوب بالكامل حتى تعمل.',
      timingAr:
          'غالبًا يحدث التبرز خلال 15–60 دقيقة، لذلك استخدمها عندما يكون الحمام متاحًا.',
      importantAr:
          'للاستخدام الشرجي فقط ولا تُبلع. لا تكرر أكثر من تحميلة واحدة يوميًا لنفس المنتج.',
      commonActionableAr:
          'قد يحدث انزعاج أو حرقة خفيفة بالمستقيم.',
      missedDoseAr:
          'تستخدم عند الحاجة؛ لا توجد جرعة منسية ولا تستخدم جرعتين معًا.',
      storageAr:
          'احفظها بعيدًا عن الحرارة الزائدة حتى لا تلين أو تذوب.',
      seekHelpAr:
          'أوقفها وراجع عند نزف شرجي، عدم حدوث تبرز بعد الاستخدام، أو وجود ألم بطن/غثيان/قيء غير مفسر.',
      teachBackAr:
          'أين تُستخدم التحميلة؟ كم دقيقة تحاول الاحتفاظ بها؟ وهل يجب أن تذوب بالكامل حتى تعمل؟',
    ),
  ),
  Medication(
    id: 'meclizine-25mg-motion-sickness-otc',
    familyId: 'otc',
    name: 'Meclizine HCl 25 mg (Motion Sickness OTC)',
    subtitle: 'Once-daily motion-sickness tablet · first dose 30–60 minutes before activity',
    tags: ['OTC', 'Motion sickness', 'Antiemetic', 'Sedating'],
    aliases: ['Meclizine 25 mg', 'Less drowsy motion sickness'],
    sourceLabel:
        'DailyMed · Meclizine HCl 25 mg Motion Sickness · updated Aug 21, 2026',
    useProfile: MedicationUseProfile(
      route:
          'OTC oral meclizine hydrochloride 25 mg tablet for prevention/treatment of nausea, vomiting or dizziness associated with motion sickness.',
      foodTiming:
          'Not meal-dependent. Take the first dose 1/2 to 1 hour before starting the motion-provoking activity.',
      duration:
          'Short, situation-specific self-care. The cited label allows 1–2 tablets once daily for adults and children 12 years and older.',
      formulationHandling:
          'Swallow the tablet according to the product label; chewable meclizine products also exist and should follow their own labeling.',
      monitoring:
          'Assess sedation and anticholinergic vulnerability, especially glaucoma, urinary difficulty from enlarged prostate and chronic breathing disease.',
      interactions:
          'Alcohol, sedatives and tranquilizers increase drowsiness. Other sedating or anticholinergic medicines can also increase impairment.',
      commonMistakes:
          'Taking it only after travel has already started when prevention was intended, redosing multiple times in one day, driving before knowing its effect, or combining with alcohol.',
      specialPopulations:
          'Current OTC label: children under 12 should not use unless directed by a doctor. Pregnancy/breastfeeding and glaucoma/urinary retention/breathing disease warrant professional review.',
    ),
    sections: [
      MedicationSection(
        title: 'Pre-travel timing lock',
        body:
            'Take the first dose 1/2 to 1 hour before starting activity. Cited adult/≥12-year directions are 1–2 tablets once daily; do not redose every few hours.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Sedation lock',
        body:
            'Drowsiness may occur. Avoid alcohol, and use caution with driving/machinery; sedatives and tranquilizers can increase impairment.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'للوقاية أو العلاج من الغثيان والدوخة والقيء المرتبط بدوار الحركة.',
      howToUseAr:
          'خذ الجرعة الأولى قبل السفر أو النشاط المسبب للدوار بـ30–60 دقيقة. منتج 25 mg الحالي للبالغين ومن عمر 12 سنة فأكثر يُستخدم مرة واحدة يوميًا حسب تعليمات العبوة.',
      timingAr:
          'الأفضل قبل بدء السفر بـ30–60 دقيقة عندما يكون الهدف الوقاية.',
      importantAr:
          'قد يسبب نعاسًا؛ تجنب الكحول ولا تقد السيارة أو تستخدم آلة حتى تعرف تأثيره عليك. المهدئات قد تزيد النعاس.',
      commonActionableAr:
          'قد يحدث نعاس أو جفاف فم؛ خطط للسفر بحيث لا تحتاج للقيادة إذا سبب لك نعاسًا.',
      missedDoseAr:
          'ليس علاجًا بجدول ثابت عادةً؛ لا تكرر جرعات إضافية في نفس اليوم لتعويض توقيت فات.',
      storageAr:
          'يحفظ بدرجة الغرفة ويُحمى من الحرارة والرطوبة حسب العبوة.',
      seekHelpAr:
          'اطلب تقييمًا إذا كانت الدوخة غير مرتبطة بالحركة أو مصحوبة بإغماء/ضعف عصبي، أو إذا حدث احتباس بول أو أعراض عين حادة.',
      teachBackAr:
          'متى تأخذ أول جرعة قبل السفر؟ وما الذي يجب تجنبه بسبب النعاس؟',
    ),
  ),
];
