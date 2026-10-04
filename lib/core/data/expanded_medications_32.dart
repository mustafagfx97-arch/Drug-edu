import '../models/medication.dart';

const expandedMedications32 = <Medication>[
  Medication(
    id: 'naratriptan-tablets',
    familyId: 'cns',
    name: 'Naratriptan Tablets',
    subtitle: 'Acute migraine · repeat after 4 h · max 5 mg/24 h',
    tags: ['Migraine', 'Triptan', 'Naratriptan', 'Acute treatment'],
    aliases: ['Amerge-type', 'Naratriptan 1 mg', 'Naratriptan 2.5 mg'],
    sourceLabel:
        'DailyMed · Naratriptan tablets · updated Jun 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Oral triptan for acute migraine with or without aura in adults.',
      foodTiming:
          'No label-required meal anchor. Use is linked to the migraine attack rather than meals.',
      duration:
          'Acute PRN therapy only; not preventive treatment.',
      formulationHandling:
          'Recommended single dose is 1 mg or 2.5 mg. One repeat dose may be used after at least 4 hours if needed; maximum 5 mg in 24 hours.',
      monitoring:
          'Cardiovascular symptoms, blood pressure, headache frequency and medication-overuse headache.',
      interactions:
          'Do not use within 24 hours of another triptan or ergot-type medicine.',
      commonMistakes:
          'Repeating after only 2 hours by analogy with other triptans, exceeding 5 mg/day, or ignoring renal/hepatic dose limits.',
      specialPopulations:
          'Mild/moderate renal or hepatic impairment starts at 1 mg and should not exceed 2.5 mg/24 h; severe renal or hepatic impairment is contraindicated.',
    ),
    sections: [
      MedicationSection(
        title: 'Four-hour repeat lock',
        body:
            'Naratriptan differs from many other oral triptans: if a repeat dose is needed, wait at least 4 hours.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Renal/hepatic lock',
        body:
            'Mild/moderate renal or hepatic impairment uses 1 mg initially with a lower 2.5 mg/24 h maximum; severe impairment is contraindicated.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'لعلاج نوبة migraine بعد بدايتها، وليس للوقاية.',
      howToUseAr: 'خذ 1 أو 2.5 mg حسب الوصفة عند النوبة.',
      timingAr:
          'إذا احتجت جرعة ثانية فانتظر 4 ساعات على الأقل؛ الحد الأقصى المعتاد 5 mg خلال 24 ساعة.',
      importantAr:
          'لا تستخدم triptan آخر أو ergot خلال 24 ساعة. إذا لديك مرض كلوي أو كبدي قد تكون الجرعة القصوى أقل.',
      commonActionableAr:
          'قد يحدث دوار أو غثيان أو إحساس ضغط/ثقل مؤقت.',
      missedDoseAr:
          'ليس دواءً يوميًا مجدولًا؛ لا توجد missed dose روتينية.',
      seekHelpAr:
          'اطلب المساعدة عند ألم صدري شديد، أعراض سكتة أو ارتفاع ضغط شديد مع أعراض.',
      teachBackAr:
          'كم ساعة تنتظر قبل الجرعة الثانية؟ وما الحد الأقصى المعتاد خلال 24 ساعة؟',
    ),
  ),
  Medication(
    id: 'frovatriptan-tablets',
    familyId: 'cns',
    name: 'Frovatriptan Tablets',
    subtitle: 'Acute migraine · 2.5 mg · repeat ≥2 h · max 7.5 mg/24 h',
    tags: ['Migraine', 'Triptan', 'Frovatriptan', 'Acute treatment'],
    aliases: ['Frova-type', 'Frovatriptan succinate'],
    sourceLabel:
        'DailyMed · Frovatriptan succinate tablets · updated Jan 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Oral triptan for acute migraine with or without aura in adults.',
      foodTiming:
          'No label-required meal anchor; take the 2.5 mg tablet with fluids.',
      duration:
          'Acute PRN treatment only; not migraine prevention.',
      formulationHandling:
          'Take one 2.5 mg tablet with fluids. If the migraine recurs after initial relief, one second tablet may be taken at least 2 hours later. Maximum 3 tablets (7.5 mg) in 24 hours.',
      monitoring:
          'Cardiovascular symptoms, blood pressure, migraine frequency and medication-overuse headache.',
      interactions:
          'Do not use within 24 hours of another triptan or ergot-containing medicine.',
      commonMistakes:
          'Taking three tablets at once, redosing when there was no initial response, or exceeding the 3-tablet daily maximum.',
      specialPopulations:
          'Not established for cluster headache and not a preventive therapy.',
    ),
    sections: [
      MedicationSection(
        title: 'Recurrence-only redose nuance',
        body:
            'The label supports a second tablet when migraine recurs after initial relief; there is no evidence that a second dose helps when the first dose gave no response for the same attack.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'Daily maximum',
        body:
            'Maximum is 3 tablets total (7.5 mg) in 24 hours.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'لعلاج نوبة migraine الحادة عند البالغين.',
      howToUseAr: 'خذ حبة 2.5 mg مع سائل حسب الوصفة عند النوبة.',
      timingAr:
          'إذا تحسنت النوبة ثم رجعت يمكن أخذ حبة ثانية بعد ساعتين على الأقل. لا تتجاوز 3 حبات = 7.5 mg خلال 24 ساعة.',
      importantAr:
          'إذا لم تستجب النوبة أصلًا لأول جرعة، لا تفترض أن الجرعة الثانية ستفيد لنفس النوبة. لا تستخدم triptan/ergot آخر خلال 24 ساعة.',
      commonActionableAr:
          'قد يحدث دوار أو غثيان أو إحساس ضغط/ثقل.',
      missedDoseAr:
          'ليس له جدول يومي؛ يستخدم وقت النوبة.',
      seekHelpAr:
          'اطلب المساعدة عند ألم صدري شديد، أعراض سكتة أو ارتفاع ضغط شديد مع أعراض.',
      teachBackAr:
          'متى تسمح الجرعة الثانية؟ وما الحد الأقصى من الحبات خلال 24 ساعة؟',
    ),
  ),
  Medication(
    id: 'almotriptan-tablets',
    familyId: 'cns',
    name: 'Almotriptan Tablets',
    subtitle: 'Acute migraine age ≥12 · repeat ≥2 h · max 25 mg/24 h',
    tags: ['Migraine', 'Triptan', 'Almotriptan', 'Adolescent'],
    aliases: ['AXERT-type', 'Almotriptan malate'],
    sourceLabel:
        'DailyMed · Almotriptan tablets · current Dec 2025 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Oral triptan for acute migraine in adults and adolescents 12 to 17 years.',
      foodTiming:
          'No label-required meal anchor. Dosing is attack-linked.',
      duration:
          'Acute PRN therapy only; not migraine prevention.',
      formulationHandling:
          'Single dose is 6.25 mg or 12.5 mg. If headache returns after initial relief, repeat after at least 2 hours; maximum 25 mg/24 h.',
      monitoring:
          'Cardiovascular symptoms, blood pressure, attack frequency and medication-overuse headache.',
      interactions:
          'Do not use within 24 hours of another triptan or ergot. Clinically important CYP3A4 inhibitors can matter, especially with renal/hepatic impairment.',
      commonMistakes:
          'Treating a second dose as automatically effective after complete failure of the first dose, exceeding 25 mg/day, or missing the lower limit in hepatic/severe renal impairment.',
      specialPopulations:
          'Hepatic impairment or severe renal impairment: start 6.25 mg and do not exceed 12.5 mg/24 h.',
    ),
    sections: [
      MedicationSection(
        title: 'Adolescent indication',
        body:
            'Almotriptan is labeled for acute migraine in patients age 12 years and older, but pediatric associated-symptom efficacy is limited.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'Impairment dose lock',
        body:
            'Hepatic or severe renal impairment uses 6.25 mg initially and a 12.5 mg/24 h maximum.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'لعلاج نوبة migraine عند البالغين والمراهقين من عمر 12 سنة فأكثر.',
      howToUseAr: 'خذ 6.25 أو 12.5 mg حسب الوصفة عند النوبة.',
      timingAr:
          'إذا تحسن الصداع ثم عاد يمكن تكرار الجرعة بعد ساعتين على الأقل؛ الحد الأقصى المعتاد 25 mg خلال 24 ساعة.',
      importantAr:
          'مرض الكبد أو القصور الكلوي الشديد يخفض الجرعة القصوى. لا تستخدم triptan أو ergot آخر خلال 24 ساعة.',
      commonActionableAr:
          'قد يحدث دوار أو غثيان أو إحساس ضغط/ثقل.',
      missedDoseAr:
          'ليس علاجًا يوميًا مجدولًا.',
      seekHelpAr:
          'اطلب المساعدة عند ألم صدري شديد، أعراض سكتة أو ارتفاع ضغط شديد مع أعراض.',
      teachBackAr:
          'ما الحد الأدنى بين الجرعتين؟ ومتى تكون الجرعة القصوى أقل من 25 mg؟',
    ),
  ),
  Medication(
    id: 'sumatriptan-naproxen-tablets',
    familyId: 'cns',
    name: 'Sumatriptan/Naproxen Sodium Tablets 85/500 mg',
    subtitle: 'Acute migraine · whole tablet · food flexible · max 2/day adults',
    tags: ['Migraine', 'Triptan', 'NSAID', 'Combination', 'Naproxen'],
    aliases: ['TREXIMET-type', 'Sumatriptan 85 mg / naproxen sodium 500 mg'],
    sourceLabel:
        'DailyMed · Sumatriptan and naproxen sodium tablets 85/500 mg · current 2025 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Fixed triptan/NSAID combination for acute migraine in adults and labeled adolescents.',
      foodTiming:
          'May be taken with or without food.',
      duration:
          'Acute PRN therapy only; not preventive therapy.',
      formulationHandling:
          'Adults: one 85/500 mg tablet; if needed, a second tablet may be taken at least 2 hours later. Maximum 2 tablets/24 h. Swallow whole with water or other liquid; do not split, crush or chew.',
      monitoring:
          'Cardiovascular symptoms, blood pressure, GI bleeding, renal risk and medication-overuse headache.',
      interactions:
          'Do not use another triptan/ergot within 24 hours. Avoid duplicate NSAIDs and review anticoagulants/antiplatelets, steroids and MAO-A inhibitors.',
      commonMistakes:
          'Adding OTC naproxen/ibuprofen on top, splitting the tablet, repeating in less than 2 hours, or giving an adolescent a second tablet without prescriber direction.',
      specialPopulations:
          'For age 12–17, the labeled maximum is one 85/500 mg tablet in 24 hours. Severe hepatic impairment is contraindicated.',
    ),
    sections: [
      MedicationSection(
        title: 'Combination-product lock',
        body:
            'This already contains naproxen 500 mg. Do not add another NSAID casually; duplicate NSAID exposure increases bleeding/renal risk.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Handling + age lock',
        body:
            'Swallow whole; do not split/crush/chew. Adults may use up to 2 tablets/24 h separated by at least 2 h; ages 12–17 have a 1-tablet/24 h maximum.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'دواء مركب لعلاج نوبة migraine ويحتوي sumatriptan + naproxen.',
      howToUseAr:
          'ابتلع الحبة كاملة مع ماء أو سائل. لا تقسّمها. لا تسحقها. لا تمضغها.',
      timingAr:
          'يمكن مع الطعام أو بدونه. للبالغ إذا احتجت جرعة ثانية انتظر ساعتين على الأقل؛ لا تتجاوز حبتين خلال 24 ساعة.',
      importantAr:
          'الحبة تحتوي NSAID أصلًا؛ لا تضف ibuprofen/naproxen/NSAID آخر دون مراجعة. لا تستخدم triptan أو ergot آخر خلال 24 ساعة.',
      commonActionableAr:
          'قد يحدث غثيان أو دوخة أو حرقة معدة. راقب علامات نزف المعدة مثل براز أسود أو قيء دموي.',
      missedDoseAr:
          'هو دواء للنوبة وليس علاجًا يوميًا.',
      seekHelpAr:
          'اطلب المساعدة عند ألم صدري شديد، أعراض سكتة، براز أسود/قيء دموي، ضيق نفس أو انخفاض بول واضح.',
      teachBackAr:
          'هل يجوز سحق الحبة؟ وهل تستطيع أخذ ibuprofen معها تلقائيًا؟ وكم حبة يسمح للبالغ خلال 24 ساعة؟',
    ),
  ),
  Medication(
    id: 'dihydroergotamine-brekiya',
    familyId: 'cns',
    name: 'Dihydroergotamine (BREKIYA) Autoinjector',
    subtitle: 'Migraine + cluster headache · 1 mg SC · repeat hourly · max 3/day',
    tags: ['Migraine', 'Cluster headache', 'Dihydroergotamine', 'Autoinjector', 'Device'],
    aliases: ['BREKIYA', 'DHE autoinjector'],
    hasVisualGuide: true,
    sourceLabel:
        'DailyMed · BREKIYA dihydroergotamine mesylate autoinjector · current 2025-2026 IFU',
    reviewStatus: 'Verified against current DailyMed labeling/IFU',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Single-dose subcutaneous autoinjector for acute migraine and acute cluster headache in adults.',
      foodTiming:
          'No meal relationship; use is attack-linked.',
      duration:
          'Acute PRN therapy only; not migraine prevention.',
      formulationHandling:
          'Each device gives 1 mg SC into the middle thigh. Repeat at 1-hour intervals if needed, maximum 3 mg/24 h and 6 mg/7 days. Rotate sites at least 2 inches from the prior injection.',
      monitoring:
          'Cardiovascular/vasospasm symptoms, blood pressure, attack frequency and medication-overuse headache.',
      interactions:
          'Strong CYP3A4 inhibitors are contraindicated. Keep at least 24 hours away from triptans or other ergot-type medicines and avoid other vasoconstrictors.',
      commonMistakes:
          'Injecting IM/IV, using the same exact thigh spot twice, lifting before the approximately 10-second delivery is complete, reusing the autoinjector or exceeding weekly limits.',
      specialPopulations:
          'Cardiovascular evaluation is recommended before initiation; selected higher-risk patients should receive the first dose in an equipped healthcare setting.',
    ),
    sections: [
      MedicationSection(
        title: 'Exact autoinjector lock',
        body:
            'SC into the middle thigh only, at least 2 inches from the prior site. Push down, activate, and keep pressure for about 10 seconds until the viewing window is fully blue.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Dose + interaction lock',
        body:
            '1 mg per device; repeat at ≥1-hour intervals, max 3 doses/24 h and 6 doses/7 days. Keep 24 hours away from triptans/ergots and avoid strong CYP3A4 inhibitors.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'autoinjector لعلاج نوبة migraine أو cluster headache الحادة.',
      howToUseAr:
          'الحقن تحت الجلد في منتصف الفخذ فقط. غيّر المكان واجعل الحقنة الجديدة بعيدة نحو 2 inch عن السابقة. اضغط الجهاز عموديًا، فعّله، واستمر بالضغط نحو 10 ثوانٍ حتى تصبح نافذة الجهاز زرقاء بالكامل.',
      timingAr:
          'كل قلم = 1 mg. إذا احتجت جرعة أخرى انتظر ساعة على الأقل؛ الحد الأقصى 3 جرعات خلال 24 ساعة و6 جرعات خلال 7 أيام.',
      importantAr:
          'لا تستخدم triptan/ergot آخر خلال 24 ساعة. بعض المضادات الحيوية/الفطريات القوية المثبطة لـCYP3A4 ممنوعة معه.',
      commonActionableAr:
          'قد يحدث ألم موضعي أو غثيان أو إحساس شد/ضغط.',
      missedDoseAr:
          'ليس علاجًا يوميًا مجدولًا؛ هو للنوبة.',
      storageAr:
          'يحفظ حسب العبوة في درجة حرارة الغرفة؛ لا تبرد أو تجمد الجهاز.',
      seekHelpAr:
          'اطلب المساعدة عند ألم صدري، برودة/ألم شديد بالأطراف، أعراض سكتة أو ارتفاع ضغط شديد.',
      teachBackAr:
          'أين تحقن BREKIYA؟ كم ثانية تبقي الجهاز ضاغطًا؟ وما حدود اليوم والأسبوع؟',
    ),
  ),
  Medication(
    id: 'dihydroergotamine-nasal-legacy',
    familyId: 'cns',
    name: 'Dihydroergotamine Mesylate Nasal Spray (Legacy Pump)',
    subtitle: 'Acute migraine · prime 4 · repeat sprays after 15 min · discard after 8 h',
    tags: ['Migraine', 'Dihydroergotamine', 'Nasal spray', 'Ergot', 'Device'],
    aliases: ['MIGRANAL-type', 'DHE nasal 4 mg/mL'],
    sourceLabel:
        'DailyMed · Dihydroergotamine mesylate nasal spray 4 mg/mL · current generic labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Legacy-style intranasal dihydroergotamine pump for acute migraine.',
      foodTiming:
          'No meal relationship; use is attack-linked.',
      duration:
          'Acute PRN therapy only; not chronic daily use.',
      formulationHandling:
          'Prime pump by squeezing 4 times. Give one 0.5 mg spray in each nostril, then 15 minutes later one additional 0.5 mg spray in each nostril: four sprays total = 2 mg. Discard prepared applicator and remaining opened vial after 8 hours.',
      monitoring:
          'Vasospasm/cardiovascular symptoms, blood pressure, nasal adverse effects and medication-overuse headache.',
      interactions:
          'Keep 24 hours away from triptans/other ergots. Strong CYP3A4 inhibitors are contraindicated.',
      commonMistakes:
          'Confusing it with TRUDHESA, using all four sprays at once, skipping the 15-minute interval, injecting the nasal solution, or reusing the prepared applicator after 8 hours.',
      specialPopulations:
          'Do not inject this 4 mg/mL nasal solution; it is intended for intranasal use only.',
    ),
    sections: [
      MedicationSection(
        title: 'Legacy pump ≠ TRUDHESA',
        body:
            'This formulation uses 1 spray in each nostril, then repeats both nostrils 15 minutes later. TRUDHESA has a different device and dosing sequence; do not interchange instructions.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Limits',
        body:
            'Single attack dose is 2 mg total (4 sprays). Safety above 3 mg/24 h or 4 mg/7 days is not established.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'بخاخ DHE قديم النمط لعلاج نوبة migraine الحادة.',
      howToUseAr:
          'اعمل priming للمضخة 4 مرات. ثم بخة 0.5 mg في كل فتحة أنف. بعد 15 دقيقة كرر بخة واحدة في كل فتحة؛ المجموع 4 بخات = 2 mg.',
      timingAr:
          'الفاصل بين أول زوج وثاني زوج من البخات هو 15 دقيقة. لا تستخدمه يوميًا بشكل مزمن.',
      importantAr:
          'هذه التعليمات ليست تعليمات TRUDHESA. لا تحقن المحلول. لا تستخدم triptan/ergot آخر خلال 24 ساعة.',
      commonActionableAr:
          'قد يحدث تهيج/احتقان بالأنف أو طعم غير مستحب أو غثيان.',
      missedDoseAr:
          'ليس له جدول يومي؛ يستخدم وقت النوبة فقط.',
      storageAr:
          'بعد تجهيز المضخة يجب التخلص منها ومن الدواء المتبقي في الـvial المفتوح بعد 8 ساعات. لا تبرد أو تجمد حسب العبوة.',
      seekHelpAr:
          'اطلب المساعدة عند ألم صدري، برودة/ألم شديد بالأطراف، أعراض سكتة أو ارتفاع ضغط شديد.',
      teachBackAr:
          'كم مرة تعمل priming؟ ماذا تفعل بعد أول بخة في كل nostril؟ وكم ساعة تحتفظ بالمضخة بعد تجهيزها؟',
    ),
  ),
  Medication(
    id: 'acetaminophen-otc-500mg',
    familyId: 'cns',
    name: 'Acetaminophen OTC 500 mg',
    subtitle: 'Headache pain · product-specific max 3,000 mg/day',
    tags: ['Headache', 'OTC', 'Acetaminophen', 'Pain reliever'],
    aliases: ['Paracetamol 500 mg', 'Extra strength acetaminophen'],
    sourceLabel:
        'DailyMed · Acetaminophen 500 mg OTC labeling · current 2025-2026',
    reviewStatus: 'Verified against current DailyMed OTC labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'OTC acetaminophen 500 mg entry for common extra-strength adult headache/pain labeling.',
      foodTiming:
          'May generally be taken with or without food; no meal anchor is required by the reviewed label.',
      duration:
          'Short-term OTC use. The reviewed product label advises not using for pain longer than 10 days unless directed by a clinician.',
      formulationHandling:
          'Reviewed 500 mg OTC label: adults and age ≥12 take 2 tablets every 6 hours while symptoms last; maximum 6 tablets (3,000 mg) in 24 hours unless directed by a doctor. Product labels differ, so verify the exact bottle.',
      monitoring:
          'Total acetaminophen from all combination products, alcohol use, liver disease and frequency of headache-medication use.',
      interactions:
          'Major practical interaction is duplicate acetaminophen from cold/flu, opioid or combination headache products. Chronic warfarin users may also require review with repeated high-dose use.',
      commonMistakes:
          'Using the 4,000 mg liver-warning threshold as the routine product dose limit, combining multiple acetaminophen-containing products, or treating frequent headaches repeatedly without evaluation.',
      specialPopulations:
          'Liver disease, regular heavy alcohol use, frailty/low body weight and pregnancy require individualized advice.',
    ),
    sections: [
      MedicationSection(
        title: 'Product-specific maximum',
        body:
            'This entry represents common OTC 500 mg extra-strength labeling: 2 tablets every 6 hours, maximum 6 tablets (3,000 mg)/24 h. Do not generalize this exact maximum to every acetaminophen product.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Duplicate ingredient lock',
        body:
            'Check every cold/flu, opioid and migraine combination for acetaminophen before adding another dose.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مسكن OTC للصداع والآلام البسيطة.',
      howToUseAr:
          'لهذه صيغة 500 mg الشائعة: للبالغين وعمر 12+ تؤخذ حبتان كل 6 ساعات عند الحاجة، وبحد أقصى 6 حبات = 3000 mg خلال 24 ساعة، ما لم يوجه الطبيب بغير ذلك. افحص عبوتك لأن المنتجات قد تختلف.',
      timingAr: 'يمكن مع الطعام أو بدونه.',
      importantAr:
          'لا تجمعه مع دواء آخر يحتوي acetaminophen/paracetamol دون حساب المجموع. لا تجعل 4000 mg هدفًا يوميًا لمجرد أنه رقم تحذير الكبد.',
      commonActionableAr:
          'عادة جيد التحمل؛ الغثيان أو الطفح ممكنان. الاستخدام الزائد قد يسبب أذية كبد خطرة حتى دون أعراض مبكرة.',
      missedDoseAr:
          'هو PRN؛ لا توجد جرعة فائتة يجب تعويضها.',
      seekHelpAr:
          'اطلب المساعدة فورًا بعد overdose أو عند طفح شديد/تقشر جلد، وراجع الطبيب إذا الصداع غير معتاد أو يتكرر بشكل متزايد.',
      teachBackAr:
          'ما الحد الأقصى لهذه عبوة 500 mg؟ وما أهم شيء تفحصه في أدوية الزكام أو المسكنات المركبة؟',
    ),
  ),
  Medication(
    id: 'ibuprofen-otc-200mg',
    familyId: 'cns',
    name: 'Ibuprofen OTC 200 mg',
    subtitle: 'Headache pain · q4–6 h PRN · max 1,200 mg/day OTC',
    tags: ['Headache', 'OTC', 'Ibuprofen', 'NSAID'],
    aliases: ['Advil-type 200 mg', 'Motrin IB-type'],
    sourceLabel:
        'DailyMed · Ibuprofen 200 mg OTC tablets · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed OTC labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'OTC NSAID entry for headache and other minor pain in adults and patients age 12 years and older.',
      foodTiming:
          'No mandatory meal anchor; if stomach upset occurs, take with food or milk.',
      duration:
          'Short-term OTC use; label directs medical review if pain worsens or lasts more than 10 days.',
      formulationHandling:
          'Take 1 tablet every 4–6 hours while symptoms persist. If 1 tablet is insufficient, 2 tablets may be used. Do not exceed 6 tablets (1,200 mg) in 24 hours unless directed by a doctor.',
      monitoring:
          'GI bleeding, renal risk, blood pressure/fluid retention and frequency of acute-headache medication use.',
      interactions:
          'Avoid duplicate NSAIDs. Ibuprofen can interfere with low-dose aspirin antiplatelet benefit depending on timing; anticoagulants, steroids and some antihypertensives/diuretics require review.',
      commonMistakes:
          'Combining with naproxen or prescription NSAIDs, using more than 1,200 mg/day OTC, or assuming food prevents all GI bleeding risk.',
      specialPopulations:
          'Higher-risk patients include older adults, prior ulcer/bleeding, kidney disease, cardiovascular disease and pregnancy at 20 weeks or later.',
    ),
    sections: [
      MedicationSection(
        title: 'OTC dose lock',
        body:
            'For common 200 mg OTC labeling: 1 tablet every 4–6 h; 2 tablets may be used if needed; max 6 tablets (1,200 mg)/24 h unless directed by a clinician.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'NSAID duplication',
        body:
            'Do not stack ibuprofen with naproxen or another NSAID just because the headache persists.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'NSAID OTC للصداع والآلام البسيطة.',
      howToUseAr:
          'لعمر 12+: حبة 200 mg كل 4–6 ساعات عند الحاجة. إذا لم تكفِ حبة يمكن استخدام حبتين. لا تتجاوز 6 حبات = 1200 mg خلال 24 ساعة دون توجيه طبي.',
      timingAr:
          'يمكن مع أو بدون الطعام؛ إذا سبب انزعاج معدة خذه مع طعام أو حليب.',
      importantAr:
          'لا تجمعه مع naproxen أو NSAID آخر. إذا تستخدم aspirin منخفض الجرعة للقلب أخبر الصيدلي لأن توقيت ibuprofen قد يؤثر في فائدته.',
      commonActionableAr:
          'قد يسبب حرقة/ألم معدة أو احتباس سوائل/ارتفاع ضغط عند بعض المرضى.',
      missedDoseAr:
          'هو PRN؛ لا تعوض جرعة لم تأخذها.',
      seekHelpAr:
          'أوقفه واطلب المساعدة عند قيء دموي، براز أسود، ضيق نفس، تورم شديد، ألم صدري أو أعراض سكتة.',
      teachBackAr:
          'ما الحد الأقصى OTC خلال 24 ساعة؟ وهل يجوز جمعه مع naproxen؟',
    ),
  ),
  Medication(
    id: 'naproxen-sodium-otc-220mg',
    familyId: 'cns',
    name: 'Naproxen Sodium OTC 220 mg',
    subtitle: 'Headache pain · q8–12 h PRN · max 660 mg/day OTC',
    tags: ['Headache', 'OTC', 'Naproxen', 'NSAID'],
    aliases: ['Aleve-type 220 mg', 'Naproxen sodium headache pain'],
    sourceLabel:
        'DailyMed · Naproxen sodium 220 mg OTC headache labeling · current 2026',
    reviewStatus: 'Verified against current DailyMed OTC labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'OTC NSAID entry for headache and other minor pain in adults and patients age 12 years and older.',
      foodTiming:
          'No mandatory meal anchor. Take each dose with a full glass of water; if stomach upset occurs, take with food or milk.',
      duration:
          'Short-term OTC use; seek review if pain worsens or lasts more than 10 days.',
      formulationHandling:
          'Take 1 tablet every 8–12 hours. For the first dose only, 2 tablets may be taken within the first hour. Do not exceed 2 tablets in any 8–12 hour period or 3 tablets (660 mg) in 24 hours.',
      monitoring:
          'GI bleeding, kidney function/risk, blood pressure/fluid retention and headache-medication frequency.',
      interactions:
          'Avoid duplicate NSAIDs; anticoagulants, antiplatelets, steroids and some antihypertensive/diuretic regimens require review.',
      commonMistakes:
          'Taking 2 tablets at every dose instead of only allowing that option for the first dose, using more than 3 tablets/day, or combining with ibuprofen.',
      specialPopulations:
          'Higher-risk patients include age ≥60, prior ulcer/bleeding, kidney/cardiovascular disease and pregnancy at 20 weeks or later.',
    ),
    sections: [
      MedicationSection(
        title: 'First-dose exception',
        body:
            'Common OTC 220 mg labeling allows 2 tablets within the first hour for the first dose only; routine subsequent dosing is 1 tablet every 8–12 hours.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Daily maximum',
        body:
            'Do not exceed 3 tablets (660 mg) in 24 hours and never more than 2 tablets in any 8–12 hour interval.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'NSAID OTC للصداع والآلام البسيطة.',
      howToUseAr:
          'لعمر 12+: حبة 220 mg كل 8–12 ساعة. للجرعة الأولى فقط يمكن أخذ حبتين خلال أول ساعة. لا تتجاوز 3 حبات = 660 mg خلال 24 ساعة.',
      timingAr:
          'خذ كل جرعة مع كوب ماء كامل. إذا سبب انزعاج معدة خذه مع طعام أو حليب.',
      importantAr:
          'لا تجمع naproxen مع ibuprofen أو NSAID آخر. وجود قرحة/نزف سابق أو anticoagulant يرفع خطر النزف.',
      commonActionableAr:
          'قد يسبب حرقة/ألم معدة أو احتباس سوائل/ارتفاع ضغط.',
      missedDoseAr:
          'هو PRN؛ لا توجد جرعة فائتة يجب تعويضها.',
      seekHelpAr:
          'أوقفه واطلب المساعدة عند براز أسود، قيء دموي، ألم صدري، ضيق نفس أو انخفاض واضح في البول.',
      teachBackAr:
          'متى يسمح بحبتين؟ وما الحد الأقصى خلال 24 ساعة؟',
    ),
  ),
  Medication(
    id: 'acetaminophen-aspirin-caffeine-migraine',
    familyId: 'cns',
    name: 'Acetaminophen/Aspirin/Caffeine Migraine Relief',
    subtitle: '250/250/65 mg per caplet · 2 caplets once · max 2/24 h',
    tags: ['Migraine', 'OTC', 'Combination', 'Acetaminophen', 'Aspirin', 'Caffeine'],
    aliases: ['Excedrin Migraine-type', 'Migraine Relief 250/250/65'],
    sourceLabel:
        'DailyMed · Excedrin Migraine / equivalent acetaminophen-aspirin-caffeine 250/250/65 mg · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed OTC labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'OTC fixed combination for migraine containing acetaminophen 250 mg, aspirin 250 mg and caffeine 65 mg per caplet.',
      foodTiming:
          'No required meal anchor; adults take 2 caplets with a glass of water.',
      duration:
          'Acute OTC migraine use only; persistent/worsening or frequent headaches require evaluation.',
      formulationHandling:
          'Adults: take 2 caplets with a glass of water. Do not exceed 2 caplets in 24 hours unless directed by a doctor. Under age 18: ask a doctor.',
      monitoring:
          'Total acetaminophen, duplicate NSAIDs/aspirin, GI bleeding, caffeine intake and frequency of acute headache-medication use.',
      interactions:
          'Avoid duplicate acetaminophen, aspirin or other NSAIDs. Anticoagulants and other bleeding-risk drugs require review. Additional caffeine can worsen nervousness, insomnia or tachycardia.',
      commonMistakes:
          'Taking another acetaminophen product the same day without counting it, adding ibuprofen/naproxen despite the aspirin component, or repeating another 2-caplet dose later the same day.',
      specialPopulations:
          'Avoid routine self-use in patients under 18 without clinician advice. Pregnancy requires review because of the aspirin component, particularly from 20 weeks onward.',
    ),
    sections: [
      MedicationSection(
        title: 'One-treatment-per-day OTC lock',
        body:
            'Current migraine-relief labeling: adults take 2 caplets with water and do not exceed 2 caplets in 24 hours unless directed by a doctor.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Triple-ingredient duplication lock',
        body:
            'Each caplet already contains acetaminophen 250 mg + aspirin 250 mg + caffeine 65 mg. Check other pain/cold products and limit extra caffeine.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مستحضر OTC مركب لعلاج migraine ويحتوي acetaminophen + aspirin + caffeine.',
      howToUseAr:
          'للبالغين: خذ حبتين مع كوب ماء. لا تتجاوز حبتين خلال 24 ساعة إلا إذا وجه الطبيب بذلك. تحت 18 سنة استشر الطبيب.',
      timingAr:
          'لا يحتاج ارتباطًا محددًا بالطعام؛ استخدمه عند نوبة migraine حسب الملصق.',
      importantAr:
          'كل حبة تحتوي acetaminophen 250 mg + aspirin 250 mg + caffeine 65 mg. لا تضف مسكنات أو منتجات زكام قبل فحص مكوناتها، وقلل القهوة/مشروبات الطاقة لأن الجرعة نفسها تحتوي caffeine.',
      commonActionableAr:
          'قد يسبب حرقة/ألم معدة، أرقًا أو خفقانًا بسبب caffeine. aspirin يرفع خطر النزف الهضمي.',
      missedDoseAr:
          'هو PRN للنوبة؛ لا توجد جرعة فائتة.',
      seekHelpAr:
          'أوقفه واطلب المساعدة عند براز أسود/قيء دموي، طفح شديد، صفير/تورم الوجه، أو صداع مختلف جدًا/أسوأ صداع بالحياة.',
      teachBackAr:
          'كم حبة يسمح خلال 24 ساعة؟ وما المكونات الثلاثة التي يجب أن تبحث عنها قبل إضافة أي دواء آخر؟',
    ),
  ),
];
