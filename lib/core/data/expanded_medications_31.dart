import '../models/medication.dart';

const expandedMedications31 = <Medication>[
  Medication(
    id: 'sumatriptan-nasal-spray',
    familyId: 'cns',
    name: 'Sumatriptan Nasal Spray',
    subtitle: 'Acute migraine · 5/10/20 mg · repeat ≥2 h · max 40 mg/24 h',
    tags: ['Migraine', 'Triptan', 'Nasal spray', 'Acute treatment'],
    aliases: ['Imitrex nasal spray', 'Sumatriptan nasal'],
    sourceLabel:
        'DailyMed · Sumatriptan nasal spray · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Nasal triptan for acute treatment of migraine with or without aura in adults.',
      foodTiming:
          'No meal anchor. Use is linked to the migraine attack rather than food.',
      duration:
          'Acute PRN treatment only; not preventive therapy.',
      formulationHandling:
          '5 mg and 20 mg doses are given as one spray in one nostril. A 10 mg dose is given as one 5 mg spray in each nostril. If needed, one additional dose may be used at least 2 hours later; maximum 40 mg in 24 hours.',
      monitoring:
          'Headache frequency and acute-medicine days, cardiovascular symptoms, blood pressure and medication-overuse headache.',
      interactions:
          'Do not use within 24 hours of another triptan or ergot-type migraine medicine. MAO-A inhibitor use within the prior 2 weeks is contraindicated.',
      commonMistakes:
          'Confusing 10 mg with one 10 mg spray, repeating too early, exceeding 40 mg/day, or using too frequently without reviewing medication-overuse headache.',
      specialPopulations:
          'Avoid in major vascular contraindications and uncontrolled hypertension. This nasal formulation is not established for cluster headache.',
    ),
    sections: [
      MedicationSection(
        title: 'Strength-specific nasal dosing',
        body:
            '5 mg and 20 mg are each a single spray in one nostril; the 10 mg dose is one 5 mg spray in each nostril.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Repeat and overuse lock',
        body:
            'Repeat no sooner than 2 hours if needed; maximum 40 mg/24 h. Frequent acute treatment should trigger medication-overuse review.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'لعلاج نوبة الشقيقة بعد بدايتها، وليس للوقاية اليومية.',
      howToUseAr:
          'استخدم القوة الموصوفة بالضبط: 5 أو 20 mg = بخة واحدة في فتحة أنف واحدة. جرعة 10 mg = بخة 5 mg في كل فتحة أنف.',
      timingAr:
          'استخدمه عند بداية نوبة الشقيقة حسب خطتك. إذا احتجت جرعة ثانية فانتظر ساعتين على الأقل؛ الحد الأقصى 40 mg خلال 24 ساعة.',
      importantAr:
          'لا تستخدم triptan آخر أو ergot خلال 24 ساعة. إذا أصبحت تحتاج أدوية النوبة كثيرًا خلال الشهر فراجع الطبيب بسبب medication-overuse headache.',
      commonActionableAr:
          'قد يحدث طعم غير مستحب أو إحساس بالضغط/الثقل أو دوخة.',
      missedDoseAr:
          'ليس له missed dose مجدولة؛ هو PRN للنوبة. لا تستخدم جرعة إضافية فقط لأنك نسيت وقتًا ثابتًا.',
      seekHelpAr:
          'اطلب المساعدة عند ألم صدري شديد، أعراض سكتة، ضيق نفس شديد أو ارتفاع ضغط شديد مع أعراض.',
      teachBackAr:
          'كيف تعطي جرعة 10 mg؟ وكم تنتظر قبل الجرعة الثانية؟ وما الحد الأقصى اليومي؟',
    ),
  ),
  Medication(
    id: 'sumatriptan-injection-autoinjector',
    familyId: 'cns',
    name: 'Sumatriptan Subcutaneous Injection / Autoinjector',
    subtitle: 'Migraine + cluster headache · SC only · repeat ≥1 h · max 12 mg/24 h',
    tags: ['Migraine', 'Cluster headache', 'Triptan', 'Injection', 'Autoinjector'],
    aliases: ['Imitrex injection', 'Sumatriptan autoinjector', 'Sumatriptan prefilled syringe'],
    sourceLabel:
        'DailyMed · Sumatriptan injection · updated 2026 · SC/autoinjector labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Subcutaneous triptan injection for acute migraine and acute cluster headache in adults.',
      foodTiming:
          'No meal relationship. Use is attack-linked.',
      duration:
          'Acute PRN treatment only; not preventive therapy.',
      formulationHandling:
          'For subcutaneous use only. Standard cluster dose is 6 mg. Total daily maximum is 12 mg, with two 6 mg injections separated by at least 1 hour. Exact cap/activation/site steps vary by the dispensed prefilled syringe/autoinjector and must follow that device IFU.',
      monitoring:
          'Cardiovascular symptoms, blood pressure, headache frequency and medication-overuse headache.',
      interactions:
          'Do not use within 24 hours of another triptan or ergot-type medicine. MAO-A inhibitors within the previous 2 weeks are contraindicated.',
      commonMistakes:
          'Injecting IM/IV instead of SC, repeating before 1 hour, exceeding 12 mg/day, or assuming every sumatriptan autoinjector has identical activation steps.',
      specialPopulations:
          'Use only after a clear diagnosis of migraine or cluster headache and avoid in major vascular contraindications/uncontrolled hypertension.',
    ),
    sections: [
      MedicationSection(
        title: 'Migraine vs cluster dosing',
        body:
            'The maximum single adult dose is 6 mg SC. For cluster headache the labeled single dose is 6 mg; lower-dose efficacy for cluster has not been established.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Device-specific technique',
        body:
            'The product is SC only. Autoinjector/prefilled-syringe mechanics are presentation-specific; demonstrate the exact dispensed device and use its IFU.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'لعلاج نوبة migraine أو cluster headache بسرعة، وليس للوقاية.',
      howToUseAr:
          'الحقنة تحت الجلد فقط. استخدم قلم/سرنجة المنتج الذي صرف لك حسب الـIFU نفسه؛ لا تحقن في الوريد أو العضل.',
      timingAr:
          'عند بداية النوبة حسب الخطة. إذا احتجت جرعة ثانية من 6 mg فانتظر ساعة واحدة على الأقل؛ الحد الأقصى 12 mg خلال 24 ساعة.',
      importantAr:
          'لا تستخدم triptan آخر أو ergot خلال 24 ساعة. لا تفترض أن كل autoinjector يعمل بنفس طريقة الفتح والتفعيل.',
      commonActionableAr:
          'قد يحدث ألم/احمرار موضعي أو إحساس ضغط/ثقل أو دوخة.',
      missedDoseAr:
          'لا توجد جرعة يومية فائتة؛ هذا دواء للنوبة.',
      seekHelpAr:
          'اطلب المساعدة عند ألم صدري شديد، أعراض سكتة، ضيق نفس أو ارتفاع ضغط شديد مع أعراض.',
      teachBackAr:
          'هل الحقن SC أم IM؟ كم تنتظر قبل الجرعة الثانية؟ وما الحد الأقصى خلال 24 ساعة؟',
    ),
  ),
  Medication(
    id: 'zolmitriptan-nasal-spray',
    familyId: 'cns',
    name: 'Zolmitriptan Nasal Spray',
    subtitle: 'Acute migraine · 2.5/5 mg · age ≥12 · repeat ≥2 h',
    tags: ['Migraine', 'Triptan', 'Nasal spray', 'Adolescent'],
    aliases: ['Zomig nasal spray', 'Zolmitriptan nasal'],
    sourceLabel:
        'DailyMed · Zolmitriptan nasal spray · current verified labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Nasal triptan for acute migraine in adults and pediatric patients 12 years and older.',
      foodTiming:
          'No meal anchor. Use is attack-linked.',
      duration:
          'Acute PRN therapy only; not migraine prevention.',
      formulationHandling:
          'Recommended starting dose is 2.5 mg; maximum single dose 5 mg. One additional dose may be used at least 2 hours later; maximum 10 mg/24 h.',
      monitoring:
          'Headache frequency, cardiovascular symptoms, blood pressure and medication-overuse headache.',
      interactions:
          'Do not use within 24 hours of another triptan or ergot. MAO-A inhibitor use within the past 2 weeks is contraindicated.',
      commonMistakes:
          'Repeating before 2 hours, exceeding 10 mg/day, or assuming approval for cluster headache.',
      specialPopulations:
          'Not recommended in moderate-to-severe hepatic impairment; not established for cluster headache.',
    ),
    sections: [
      MedicationSection(
        title: 'Age/formulation lock',
        body:
            'Nasal zolmitriptan is labeled for acute migraine in patients age 12 years and older; do not generalize adult oral instructions to the nasal device.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'Repeat-dose lock',
        body:
            'Repeat only after at least 2 hours; maximum 10 mg in 24 hours.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'لعلاج نوبة migraine بعد بدايتها، وليس للوقاية.',
      howToUseAr:
          'استخدم بخاخ الأنف بالقوة الموصوفة 2.5 أو 5 mg حسب تعليمات الجهاز؛ لا تستخدم أكثر من الجرعة الموصوفة لكل نوبة.',
      timingAr:
          'إذا احتجت جرعة ثانية فانتظر ساعتين على الأقل؛ الحد الأقصى 10 mg خلال 24 ساعة.',
      importantAr:
          'لا تجمعه مع triptan آخر أو ergot خلال 24 ساعة.',
      commonActionableAr:
          'قد يحدث طعم غير طبيعي، إحساس بالحرارة/الثقل أو دوخة.',
      missedDoseAr:
          'هو PRN للنوبة وليس علاجًا يوميًا مجدولًا.',
      seekHelpAr:
          'اطلب المساعدة عند ألم صدري شديد، أعراض سكتة أو ارتفاع ضغط شديد مع أعراض.',
      teachBackAr:
          'كم تنتظر قبل الجرعة الثانية؟ وما الحد الأقصى اليومي؟ وهل هو دواء وقائي؟',
    ),
  ),
  Medication(
    id: 'eletriptan-tablets',
    familyId: 'cns',
    name: 'Eletriptan Tablets',
    subtitle: 'Acute migraine · 20/40 mg · repeat ≥2 h · CYP3A4 lock',
    tags: ['Migraine', 'Triptan', 'Eletriptan', 'CYP3A4'],
    aliases: ['Relpax-type', 'Eletriptan hydrobromide'],
    sourceLabel:
        'DailyMed · Eletriptan hydrobromide tablets · revised May 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Oral triptan for acute migraine with or without aura in adults.',
      foodTiming:
          'No label-required meal anchor; dosing is linked to the migraine attack.',
      duration:
          'Acute PRN therapy only; not preventive therapy.',
      formulationHandling:
          'Single dose 20 or 40 mg; maximum single dose 40 mg. If needed, a second dose may be used at least 2 hours later; maximum 80 mg/24 h.',
      monitoring:
          'Cardiovascular symptoms, blood pressure, migraine frequency and medication-overuse headache.',
      interactions:
          'Do not use within 24 hours of another triptan/ergot. Do not use within at least 72 hours of potent CYP3A4 inhibitors such as clarithromycin, ketoconazole/itraconazole, ritonavir or nelfinavir.',
      commonMistakes:
          'Taking a second dose before 2 hours, exceeding 80 mg/day, or missing the 72-hour potent-CYP3A4 interaction window.',
      specialPopulations:
          'Avoid in major triptan vascular contraindications and uncontrolled hypertension.',
    ),
    sections: [
      MedicationSection(
        title: 'CYP3A4 lock',
        body:
            'Potent CYP3A4 inhibitors create a longer interaction window than many patients expect: eletriptan is contraindicated within at least 72 hours of these drugs.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Acute-dose lock',
        body:
            '20–40 mg per dose; repeat no sooner than 2 hours; maximum 80 mg/24 h.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'لعلاج نوبة migraine بعد بدايتها.',
      howToUseAr: 'خذ 20 أو 40 mg حسب الوصفة عند النوبة؛ لا تتجاوز 40 mg في الجرعة الواحدة.',
      timingAr:
          'إذا احتجت جرعة ثانية فانتظر ساعتين على الأقل؛ الحد الأقصى 80 mg خلال 24 ساعة.',
      importantAr:
          'لا تستخدمه خلال 24 ساعة من triptan/ergot آخر. أخبر الصيدلي إذا أخذت clarithromycin أو azole antifungal أو ritonavir؛ بعض هذه الأدوية تمنع eletriptan لمدة 72 ساعة على الأقل.',
      commonActionableAr:
          'قد يحدث دوار أو غثيان أو إحساس ضغط/ثقل.',
      missedDoseAr:
          'لا يوجد missed dose يومي؛ هو دواء للنوبة فقط.',
      seekHelpAr:
          'اطلب المساعدة عند ألم صدري شديد، أعراض سكتة أو ارتفاع ضغط شديد مع أعراض.',
      teachBackAr:
          'كم تنتظر قبل الجرعة الثانية؟ وما قصة 72 ساعة مع clarithromycin/azole/ritonavir؟',
    ),
  ),
  Medication(
    id: 'lasmiditan-reyvow',
    familyId: 'cns',
    name: 'Lasmiditan (REYVOW)',
    subtitle: 'Acute migraine · one dose/24 h · no driving for ≥8 h',
    tags: ['Migraine', 'Lasmiditan', 'Ditans', 'Driving restriction', 'Acute treatment'],
    aliases: ['REYVOW'],
    sourceLabel:
        'DailyMed · REYVOW lasmiditan tablets · current verified labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Oral 5-HT1F agonist for acute migraine in adults.',
      foodTiming:
          'May be taken with or without food.',
      duration:
          'Acute PRN therapy only. No more than one dose in 24 hours; a second dose for the same attack has not been shown effective.',
      formulationHandling:
          'Swallow tablets whole. Do not split, crush or chew.',
      monitoring:
          'Driving impairment, dizziness/sedation, serotonin-syndrome symptoms and medication-overuse headache.',
      interactions:
          'Alcohol and other CNS depressants can increase impairment. Review serotonergic medicines for serotonin-syndrome risk.',
      commonMistakes:
          'Driving because the patient “feels fine,” taking a second dose the same day, or splitting/crushing tablets.',
      specialPopulations:
          'Patients who cannot avoid driving/operating machinery for at least 8 hours after a dose should not take REYVOW.',
    ),
    sections: [
      MedicationSection(
        title: '8-hour driving lock',
        body:
            'Do not drive or operate machinery for at least 8 hours after every dose, even if the patient believes they feel normal.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'One-dose-per-day lock',
        body:
            'No more than one dose in 24 hours. A second dose for the same migraine attack has not been shown effective.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'لعلاج نوبة migraine الحادة عند البالغين، وليس للوقاية.',
      howToUseAr:
          'ابتلع الحبة كاملة. لا تقسّمها. لا تسحقها. لا تمضغها. لا تأخذ أكثر من جرعة واحدة خلال 24 ساعة.',
      timingAr:
          'يمكن مع الطعام أو بدونه عند النوبة، لكن لا تستخدمه إذا لن تستطيع الامتناع عن القيادة أو تشغيل الآلات لمدة 8 ساعات على الأقل بعدها.',
      importantAr:
          'حتى لو شعرت أنك طبيعي، لا تقد السيارة لمدة 8 ساعات على الأقل. تجنب الكحول والأدوية المهدئة قدر الإمكان مع الجرعة.',
      commonActionableAr:
          'الدوخة والنعاس والتعب شائعة نسبيًا؛ خطط للجرعة بحيث لا تحتاج قيادة بعدها.',
      missedDoseAr:
          'ليس دواءً يوميًا مجدولًا. لا تعيد جرعة ثانية لنفس اليوم فقط لأن الصداع رجع.',
      seekHelpAr:
          'اطلب المساعدة عند serotonin syndrome أو تفاعل تحسسي شديد.',
      teachBackAr:
          'كم جرعة مسموحة خلال 24 ساعة؟ وكم ساعة يجب أن تنتظر قبل القيادة؟',
    ),
  ),
  Medication(
    id: 'atogepant-qulipta',
    familyId: 'cns',
    name: 'Atogepant (QULIPTA)',
    subtitle: 'Migraine prevention · once daily · food flexible',
    tags: ['Migraine prevention', 'CGRP antagonist', 'Atogepant', 'Daily preventive'],
    aliases: ['QULIPTA'],
    sourceLabel:
        'DailyMed · QULIPTA atogepant tablets · revised Sep 2025/current label',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily oral CGRP receptor antagonist for preventive treatment of migraine in adults.',
      foodTiming:
          'Take once daily with or without food.',
      duration:
          'Chronic preventive therapy while effective and tolerated.',
      formulationHandling:
          'Episodic migraine has several labeled dose options; chronic migraine uses 60 mg once daily. Renal and drug-interaction context can require a different regimen.',
      monitoring:
          'Migraine-day reduction, nausea/constipation, blood pressure and Raynaud symptoms when relevant.',
      interactions:
          'Strong CYP3A4 inhibitors/inducers and some OATP inhibitors can require dose modification; review the medication list before selecting strength.',
      commonMistakes:
          'Using QULIPTA only during attacks, treating all strengths as interchangeable, or ignoring renal/drug-interaction dose changes.',
      specialPopulations:
          'Severe renal impairment/ESRD changes episodic-migraine dosing and QULIPTA is not recommended for chronic migraine in that setting.',
    ),
    sections: [
      MedicationSection(
        title: 'Prevention, not rescue',
        body:
            'QULIPTA is taken every day for prevention; it is not an as-needed rescue dose for an active attack.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Indication/renal dose lock',
        body:
            'Episodic and chronic migraine dosing differ, and severe renal impairment/ESRD changes what is appropriate.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'للوقاية من migraine وتقليل عدد أيام النوبات، وليس لإيقاف النوبة فورًا.',
      howToUseAr: 'خذ الجرعة الموصوفة مرة واحدة يوميًا بانتظام.',
      timingAr: 'يمكن مع الطعام أو بدونه وفي وقت ثابت يناسبك يوميًا.',
      importantAr:
          'أخبر الصيدلي عن أدوية CYP3A4 وعن مشاكل الكلى لأن القوة المناسبة قد تختلف. راقب الإمساك والضغط إذا كانا مشكلة لديك.',
      commonActionableAr:
          'قد يحدث غثيان أو إمساك أو تعب؛ راجع الطبيب إذا كان الإمساك شديدًا أو ظهر Raynaud/تغير واضح بالدورة الدموية للأصابع.',
      missedDoseAr:
          'إذا فاتت جرعة لا تضاعف التالية؛ ارجع للجدول المعتاد.',
      seekHelpAr:
          'راجع عند تفاعل تحسسي شديد، ارتفاع ضغط واضح مستمر أو أعراض Raynaud شديدة.',
      teachBackAr:
          'هل QULIPTA تؤخذ فقط وقت الصداع أم كل يوم؟ وهل الطعام ضروري؟',
    ),
  ),
  Medication(
    id: 'erenumab-aimovig',
    familyId: 'cns',
    name: 'Erenumab (AIMOVIG) Injection',
    subtitle: 'Migraine prevention · monthly SC · constipation/BP lock',
    tags: ['Migraine prevention', 'CGRP', 'Erenumab', 'Autoinjector', 'Monthly'],
    aliases: ['AIMOVIG SureClick', 'Erenumab-aooe'],
    sourceLabel:
        'DailyMed · AIMOVIG erenumab-aooe injection · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Monthly subcutaneous CGRP-receptor monoclonal antibody for migraine prevention in adults.',
      foodTiming:
          'No meal relationship.',
      duration:
          'Chronic preventive therapy while beneficial.',
      formulationHandling:
          'Recommended dose is 70 mg SC monthly; some patients use 140 mg monthly. Prefilled autoinjector/syringe is single-dose. Allow at least 30 minutes at room temperature before injection; do not shake or heat.',
      monitoring:
          'Migraine days, severe constipation, blood pressure, Raynaud symptoms and injection reactions.',
      interactions:
          'No major CYP-mediated interaction pattern is expected, but constipation-promoting medicines can worsen constipation risk.',
      commonMistakes:
          'Injecting immediately from the refrigerator, shaking/heating the device, re-refrigerating after room-temperature storage, or ignoring severe constipation.',
      specialPopulations:
          'Room-temperature storage is limited to 7 days at 20–25°C once removed from the refrigerator; do not return it to the refrigerator.',
    ),
    sections: [
      MedicationSection(
        title: 'Monthly device/storage lock',
        body:
            '70 mg monthly; some patients use 140 mg monthly. Warm naturally for at least 30 minutes. Refrigerate 2–8°C; once kept at room temperature, use within 7 days and do not re-refrigerate.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Constipation + BP lock',
        body:
            'Serious constipation and new/worsening hypertension have been reported; counsel patients to act on severe constipation or sustained BP problems.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'حقنة شهرية للوقاية من migraine وتقليل عدد النوبات.',
      howToUseAr:
          'استخدم autoinjector أو prefilled syringe مرة واحدة فقط حسب الـIFU. اترك الجهاز خارج الثلاجة 30 دقيقة على الأقل ليصل لحرارة الغرفة طبيعيًا؛ لا ترجّه ولا تسخنه.',
      timingAr:
          'مرة واحدة كل شهر حسب جرعتك 70 أو 140 mg. إذا فاتت الجرعة خذها بأسرع ما يمكن ثم اجعل الجرعات الشهرية التالية محسوبة من تاريخ آخر جرعة.',
      importantAr:
          'راقب الإمساك؛ إذا أصبح شديدًا أو ترافق بألم وانتفاخ/قيء تواصل سريعًا. راقب الضغط إذا لديك hypertension.',
      commonActionableAr:
          'قد يحدث ألم/احمرار بمكان الحقن أو إمساك.',
      missedDoseAr:
          'خذ الجرعة الفائتة بأسرع ما يمكن، ثم استمر شهريًا من تاريخ الجرعة التي أخذتها.',
      storageAr:
          'في الثلاجة 2–8°C داخل الكرتون. عند إخراجها لحرارة الغرفة 20–25°C استخدمها خلال 7 أيام ولا تعدها للثلاجة.',
      seekHelpAr:
          'راجع عند تفاعل تحسسي شديد، إمساك شديد مع مضاعفات، أو ارتفاع ضغط شديد/مستمر.',
      teachBackAr:
          'كم دقيقة تنتظر بعد إخراج AIMOVIG من الثلاجة؟ وهل يمكن إعادتها للثلاجة بعد بقائها بحرارة الغرفة؟',
    ),
  ),
  Medication(
    id: 'fremanezumab-ajovy',
    familyId: 'cns',
    name: 'Fremanezumab (AJOVY) Injection',
    subtitle: 'Migraine prevention · monthly OR quarterly · 3 injections for 675 mg',
    tags: ['Migraine prevention', 'CGRP', 'Fremanezumab', 'Autoinjector', 'Quarterly'],
    aliases: ['AJOVY'],
    sourceLabel:
        'DailyMed · AJOVY fremanezumab-vfrm injection · revised Jun 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Subcutaneous CGRP monoclonal antibody for migraine prevention.',
      foodTiming:
          'No meal relationship.',
      duration:
          'Chronic preventive therapy while beneficial.',
      formulationHandling:
          'Adult options: 225 mg monthly or 675 mg every 3 months. The 675 mg quarterly dose requires three consecutive 225 mg injections. Allow 30 minutes to reach room temperature; do not shake or heat.',
      monitoring:
          'Migraine days, injection reactions, constipation, blood pressure and Raynaud symptoms when relevant.',
      interactions:
          'No meaningful CYP interaction pattern; focus on clinical adverse effects and correct schedule.',
      commonMistakes:
          'Giving only one 225 mg injection for a 675 mg quarterly dose, miscounting the quarterly interval, or re-refrigerating after room-temperature storage.',
      specialPopulations:
          'Room-temperature storage up to 30°C is limited to 7 days; once at room temperature do not return to the refrigerator.',
    ),
    sections: [
      MedicationSection(
        title: 'Monthly vs quarterly lock',
        body:
            'Adults use either 225 mg monthly or 675 mg every 3 months. The 675 mg dose is three consecutive 225 mg injections.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Device/storage lock',
        body:
            'Allow 30 minutes at room temperature protected from sunlight. Refrigerate 2–8°C; room-temperature storage up to 30°C is limited to 7 days and must not be reversed back to refrigeration.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'حقن للوقاية من migraine.',
      howToUseAr:
          'حسب الخطة: إما 225 mg كل شهر، أو 675 mg كل 3 أشهر. جرعة 675 mg تعني 3 حقن متتالية من 225 mg، وليست حقنة واحدة.',
      timingAr:
          'إذا فاتت الجرعة خذها بأسرع ما يمكن ثم احسب الجرعة التالية من تاريخ الجرعة المتأخرة حسب نظامك الشهري أو كل 3 أشهر.',
      importantAr:
          'اترك الجهاز 30 دقيقة بحرارة الغرفة قبل الحقن. لا ترجّه ولا تسخنه ولا تعيده للثلاجة بعد حفظه بحرارة الغرفة.',
      commonActionableAr:
          'قد يحدث ألم/احمرار أو تصلب موضعي بمكان الحقن.',
      missedDoseAr:
          'خذ الجرعة بأسرع ما يمكن، ثم أعد بناء الجدول من تاريخ الجرعة التي أخذتها.',
      storageAr:
          'في الثلاجة 2–8°C داخل الكرتون. يمكن حتى 30°C لمدة أقصاها 7 أيام؛ بعدها يستخدم أو يتخلص منه، ولا يعاد للثلاجة.',
      seekHelpAr:
          'راجع عند تفاعل تحسسي شديد، ارتفاع ضغط جديد/متفاقم أو أعراض Raynaud شديدة.',
      teachBackAr:
          'إذا كانت جرعتك 675 mg، كم حقنة تحتاج؟ وكم يومًا يمكن أن تبقى AJOVY خارج الثلاجة؟',
    ),
  ),
  Medication(
    id: 'galcanezumab-emgality',
    familyId: 'cns',
    name: 'Galcanezumab (EMGALITY) Injection',
    subtitle: 'Migraine prevention + episodic cluster headache · indication-specific dosing',
    tags: ['Migraine prevention', 'Cluster headache', 'CGRP', 'Galcanezumab', 'Injection'],
    aliases: ['EMGALITY'],
    sourceLabel:
        'DailyMed · EMGALITY galcanezumab-gnlm injection · revised Jun 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Subcutaneous CGRP monoclonal antibody for adult migraine prevention and episodic cluster headache.',
      foodTiming:
          'No meal relationship.',
      duration:
          'Migraine: chronic prevention. Episodic cluster: monthly during the active cluster period.',
      formulationHandling:
          'Migraine: 240 mg loading dose as two consecutive 120 mg injections, then 120 mg monthly. Episodic cluster: 300 mg as three consecutive 100 mg injections at onset of the cluster period, then monthly until it ends. Allow 30 minutes at room temperature before use; do not shake or heat.',
      monitoring:
          'Migraine/cluster frequency, injection reactions, blood pressure and Raynaud symptoms.',
      interactions:
          'No major CYP-mediated interaction pattern expected.',
      commonMistakes:
          'Using the migraine 120 mg maintenance regimen for cluster headache, missing the migraine loading dose, or confusing 120 mg pen with 100 mg cluster syringes.',
      specialPopulations:
          'Room-temperature storage up to 30°C for 7 days in original carton; do not re-refrigerate once stored out.',
    ),
    sections: [
      MedicationSection(
        title: 'Migraine ≠ cluster regimen',
        body:
            'Migraine: 240 mg once (2×120 mg), then 120 mg monthly. Episodic cluster: 300 mg (3×100 mg) at cluster-period onset and monthly until the cluster period ends.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Storage/device lock',
        body:
            'Allow 30 minutes at room temperature before use. Refrigerate 2–8°C; may remain up to 30°C for 7 days in the original carton and then must not be re-refrigerated.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يستخدم للوقاية من migraine، وله نظام مختلف لعلاج episodic cluster headache.',
      howToUseAr:
          'للـmigraine: أول جرعة 240 mg = حقنتان 120 mg متتاليتان، ثم 120 mg شهريًا. للـcluster episodic: 300 mg = ثلاث حقن 100 mg عند بداية cluster period ثم شهريًا حتى انتهائها.',
      timingAr:
          'الجدول يعتمد على الاستطباب؛ لا تبدل بين نظام migraine وcluster. إذا فاتت الجرعة خذها بأسرع ما يمكن ثم احسب الشهر التالي من تاريخ آخر جرعة.',
      importantAr:
          'اترك الجهاز 30 دقيقة بحرارة الغرفة قبل الحقن، ولا ترجّه أو تسخنه.',
      commonActionableAr:
          'ألم/احمرار مكان الحقن هو الأكثر شيوعًا. راقب الضغط وأعراض Raynaud إذا ظهرت.',
      missedDoseAr:
          'خذ الجرعة الفائتة بأسرع ما يمكن ثم استمر شهريًا من تاريخها؛ في cluster يستمر ذلك فقط حتى نهاية cluster period.',
      storageAr:
          'في الثلاجة 2–8°C. يمكن حتى 30°C لمدة 7 أيام داخل الكرتون؛ لا تعده للثلاجة بعد إخراجه للتخزين الخارجي.',
      seekHelpAr:
          'اطلب المساعدة عند تفاعل تحسسي شديد، ارتفاع ضغط شديد/مستمر أو أعراض Raynaud شديدة.',
      teachBackAr:
          'ما الفرق بين جرعة migraine loading وجرعة episodic cluster headache؟',
    ),
  ),
  Medication(
    id: 'dihydroergotamine-trudhesa',
    familyId: 'cns',
    name: 'Dihydroergotamine Nasal Spray (TRUDHESA)',
    subtitle: 'Acute migraine · prime exactly 4 times · 1 spray each nostril',
    tags: ['Migraine', 'Dihydroergotamine', 'Nasal spray', 'Device', 'Ergot'],
    aliases: ['TRUDHESA'],
    hasVisualGuide: true,
    sourceLabel:
        'DailyMed · TRUDHESA dihydroergotamine nasal spray · effective Sep 2026',
    reviewStatus: 'Verified against current DailyMed labeling/IFU',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Single-use nasal dihydroergotamine device for acute migraine in adults.',
      foodTiming:
          'No meal relationship. Use at migraine onset or later during an attack.',
      duration:
          'Acute PRN therapy only; not for chronic daily use.',
      formulationHandling:
          'Assemble the device and prime exactly 4 pumps before use. Then deliver one 0.725 mg spray into each nostril for a total 1.45 mg dose. Use immediately after priming and discard the entire device after dosing. A second complete dose may be used at least 1 hour later with a new device. Maximum 2 doses/24 h and 3 doses/7 days.',
      monitoring:
          'Cardiovascular/vasospasm symptoms, nasal irritation, blood pressure and medication-overuse headache.',
      interactions:
          'Do not use within 24 hours of a triptan or another ergot. Strong CYP3A4 inhibitors are contraindicated because of serious ischemia risk.',
      commonMistakes:
          'Skipping the 4 priming pumps, reusing the device or leftover vial solution, spraying twice in one nostril, repeating before 1 hour, or combining with triptans within 24 hours.',
      specialPopulations:
          'Cardiovascular evaluation is recommended before initiation; in selected patients with CAD risk factors, first-dose administration in an equipped healthcare setting is strongly recommended.',
    ),
    sections: [
      MedicationSection(
        title: 'Exact device lock',
        body:
            'Prime exactly 4 times, then one spray in each nostril. Use immediately and discard the complete device; do not reuse leftover medicine.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Dose + interaction lock',
        body:
            'Repeat only after at least 1 hour using a new device; max 2 doses/24 h and 3 doses/7 days. Keep 24 hours away from triptans/other ergots.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'بخاخ أنفي لعلاج نوبة migraine الحادة عند البالغين.',
      howToUseAr:
          'ركّب الجهاز ثم اعمل priming بالضغط 4 مرات بالضبط بعيدًا عن الوجه. بعدها بخة واحدة في كل فتحة أنف = جرعة كاملة. استخدمه مباشرة بعد الـpriming ثم ارمِ الجهاز كاملًا ولا تعِد استخدامه.',
      timingAr:
          'يمكن استخدامه عند بداية أعراض النوبة أو لاحقًا خلالها. إذا احتجت جرعة ثانية انتظر ساعة على الأقل واستخدم جهازًا جديدًا.',
      importantAr:
          'الحد الأقصى جرعتان خلال 24 ساعة و3 جرعات خلال 7 أيام. لا تستخدم triptan أو ergot آخر خلال 24 ساعة، ولا تستخدمه مع strong CYP3A4 inhibitors مثل بعض azoles/macrolides/protease inhibitors.',
      commonActionableAr:
          'احتقان/انزعاج الأنف، rhinitis أو طعم غير طبيعي قد تحدث.',
      missedDoseAr:
          'ليس علاجًا يوميًا مجدولًا؛ هو للنوبة فقط.',
      storageAr:
          'يحفظ بدرجة حرارة الغرفة 20–25°C. بعد فتح/تركيب الجهاز يجب استخدامه أو التخلص منه خلال 8 ساعات، وبعد priming يستخدم فورًا.',
      seekHelpAr:
          'اطلب المساعدة عند ألم صدري، برودة/ألم شديد بالأطراف، أعراض سكتة، ارتفاع ضغط شديد أو تهيج أنفي شديد مستمر.',
      teachBackAr:
          'كم مرة تعمل priming؟ كم بخة في كل فتحة أنف؟ متى يسمح بالجرعة الثانية؟ وهل تحتفظ بالجهاز لباقي الدواء؟',
    ),
  ),
];
