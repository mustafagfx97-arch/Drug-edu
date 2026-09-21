import '../models/medication.dart';

const expandedMedications8 = <Medication>[
  Medication(
    id: 'sumatriptan-tablets',
    familyId: 'cns',
    name: 'Sumatriptan Tablets',
    subtitle: 'Oral triptan for acute migraine · 25 / 50 / 100 mg',
    tags: ['Migraine', 'Acute treatment', 'Triptan', 'Oral'],
    aliases: ['Imitrex tablets', 'Sumatriptan oral'],
    useProfile: MedicationUseProfile(
      route:
          'Oral immediate-release tablets for acute migraine with or without aura in adults; not a preventive medicine.',
      foodTiming:
          'May be taken with or without food. Use for an established migraine attack according to the prescribed plan.',
      duration:
          'Intermittent acute treatment. Current labeling states that safety of treating an average of more than 4 headaches in 30 days has not been established.',
      formulationHandling:
          'Swallow the prescribed tablet. If the migraine returns or incompletely resolves after some response, a second dose may be considered at least 2 hours after the first. Maximum labeled total is 200 mg in 24 hours.',
      monitoring:
          'Attack frequency, response, cardiovascular risk, blood pressure and possible medication-overuse headache when acute medicines are used frequently.',
      interactions:
          'Do not use within 24 hours of another triptan or an ergot-type migraine medicine. Sumatriptan is contraindicated with current/recent MAO-A inhibitor use; serotonergic medicines can increase serotonin-syndrome risk.',
      commonMistakes:
          'Using it every day as prevention, repeating too soon, taking another triptan/ergot within 24 hours, or repeatedly treating frequent headaches without reassessing the migraine plan.',
      specialPopulations:
          'Avoid in patients with important ischemic cardiovascular/cerebrovascular disease or uncontrolled hypertension per labeling. Dose selection is prescriber-specific.',
    ),
    sourceLabel:
        'DailyMed · Sumatriptan tablets · updated Aug 2026 · acute migraine; repeat ≥2 h; max 200 mg/24 h',
    sections: [
      MedicationSection(
        title: 'Acute-use lock',
        body:
            'Not migraine prevention. A second tablet dose is separated by at least 2 hours and should only be considered when there was some response to the first dose. Maximum labeled total: 200 mg in 24 hours.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Triptan interaction lock',
        body:
            'Do not combine within 24 hours with another triptan or ergot-type migraine medicine. Review cardiovascular/cerebrovascular history and MAO-A inhibitor use before treatment.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يُستخدم لإيقاف نوبة الشقيقة بعد أن تبدأ؛ ليس دواء وقاية يوميًا.',
      howToUseAr:
          'خذ الجرعة الموصوفة عند نوبة الشقيقة حسب خطتك. إذا حصل تحسن جزئي ثم عاد الصداع، يمكن أن تسمح الوصفة بجرعة ثانية بعد ساعتين على الأقل.',
      timingAr:
          'لا تكرر الجرعة قبل مرور ساعتين، ولا تتجاوز مجموع 200 mg خلال 24 ساعة.',
      importantAr:
          'لا تستخدم triptan آخر أو دواء ergot للشقيقة خلال 24 ساعة من sumatriptan. أخبر الصيدلي إذا لديك مرض شرايين القلب، جلطة/نوبة نقص تروية سابقة أو ضغط غير مسيطر عليه.',
      commonActionableAr:
          'قد يحدث إحساس بالوخز أو الحرارة أو الثقل/الضغط أو دوخة. إذا كان ضغط/ألم الصدر شديدًا أو غير معتاد فلا تفترض أنه أثر بسيط.',
      missedDoseAr:
          'ليس له جرعة يومية فائتة؛ يُستخدم لعلاج النوبة عند الحاجة حسب الوصفة.',
      storageAr:
          'احفظ الأقراص في العبوة الأصلية بدرجة حرارة الغرفة وبعيدًا عن الرطوبة والحرارة الزائدة.',
      seekHelpAr:
          'اطلب مساعدة عاجلة عند ألم صدر شديد، ضعف أو خدر مفاجئ بجهة واحدة، اضطراب كلام، إغماء، أو أعراض تحسس شديد.',
      teachBackAr:
          'بعد كم ساعة فقط يمكن تكرار الجرعة؟ وهل تستطيع أخذ triptan آخر أو ergot خلال نفس 24 ساعة؟',
    ),
  ),
  Medication(
    id: 'rizatriptan-odt',
    familyId: 'cns',
    name: 'Rizatriptan Orally Disintegrating Tablet',
    subtitle: 'ODT triptan for acute migraine · adult and pediatric labeling',
    tags: ['Migraine', 'Acute treatment', 'Triptan', 'ODT'],
    aliases: ['Rizatriptan ODT', 'Maxalt-MLT'],
    hasVisualGuide: true,
    useProfile: MedicationUseProfile(
      route:
          'Orally disintegrating triptan for acute migraine. Current labeling includes adults and pediatric patients 6 to 17 years with weight-based prescribed dosing.',
      foodTiming:
          'May be taken without liquid. Use for an established migraine attack according to the prescribed plan.',
      duration:
          'Intermittent acute treatment. Safety of treating, on average, more than 4 headaches in 30 days has not been established.',
      formulationHandling:
          'Use dry hands, remove the ODT only immediately before dosing, place it on the tongue and allow it to dissolve and be swallowed with saliva. In adults, if headache returns, a second dose may be given at least 2 hours later; maximum labeled adult total is 30 mg/24 h. More than one dose in 24 hours has not been established in pediatric patients 6 to 17 years.',
      monitoring:
          'Attack frequency, response, cardiovascular risk, blood pressure and frequent acute-medication use.',
      interactions:
          'Do not use within 24 hours of another triptan or ergot. Propranolol increases rizatriptan exposure and requires a lower prescribed rizatriptan regimen; verify the prescription rather than using the usual strength. MAO-A inhibitor use is contraindicated.',
      commonMistakes:
          'Removing the ODT early with wet hands, assuming liquid is required, repeating pediatric dosing within 24 hours, or ignoring the propranolol-specific dose adjustment.',
      specialPopulations:
          'Pediatric dose is weight-based and must not be selected by the app. In patients taking propranolol, the labeled rizatriptan regimen changes; verify exact age/weight/product instructions.',
    ),
    sourceLabel:
        'DailyMed · Rizatriptan benzoate ODT · updated Aug 2026 · adult repeat ≥2 h; pediatric repeat not established; propranolol adjustment',
    sections: [
      MedicationSection(
        title: 'ODT technique',
        body:
            'Dry hands → remove only just before dosing → place on tongue → allow to dissolve and swallow with saliva. No liquid is required.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'Adult vs pediatric repeat lock',
        body:
            'Adults may have a prescribed repeat dose ≥2 hours later with a labeled maximum of 30 mg/24 h. Efficacy/safety of more than one dose in 24 hours is not established for patients age 6–17 years.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Propranolol lock',
        body:
            'Propranolol increases rizatriptan exposure and changes the labeled dose limits. Do not infer the usual dose; verify the exact prescription.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'ODT لعلاج نوبة الشقيقة بعد أن تبدأ.',
      howToUseAr:
          'استخدم يدين جافتين، وأخرج الحبة فقط وقت الجرعة ثم ضعها على اللسان واتركها تذوب وتُبلع مع اللعاب؛ لا تحتاج ماء.',
      timingAr:
          'للبالغ قد تسمح الوصفة بجرعة ثانية بعد ساعتين على الأقل إذا عاد الصداع، وبحد أقصى 30 mg خلال 24 ساعة. للأطفال 6–17 سنة لا تُكرر جرعة ثانية خلال 24 ساعة من نفسك.',
      importantAr:
          'إذا تستخدم propranolol أخبر الصيدلي لأن جرعة rizatriptan المسموحة تختلف. لا تستخدم triptan آخر أو ergot خلال 24 ساعة.',
      commonActionableAr:
          'قد يحدث دوار أو نعاس أو إحساس بالضغط/الثقل.',
      missedDoseAr:
          'ليس دواءً يوميًا؛ يُستخدم للنوبة حسب الخطة.',
      storageAr:
          'أبقِ ODT في العبوة الأصلية حتى وقت الاستخدام واحمها من الرطوبة.',
      seekHelpAr:
          'اطلب مساعدة عند ألم صدر شديد، أعراض جلطة/ضعف مفاجئ، تحسس شديد، أو أعراض عصبية غير معتادة عن الشقيقة المعتادة.',
      teachBackAr:
          'هل تحتاج ماء مع ODT؟ وإذا كان المريض طفلًا، هل نكرر جرعة ثانية تلقائيًا؟ وماذا لو كان يستخدم propranolol؟',
    ),
  ),
  Medication(
    id: 'rimegepant-nurtec-odt',
    familyId: 'cns',
    name: 'Rimegepant (NURTEC ODT)',
    subtitle: 'CGRP antagonist · acute migraine or every-other-day prevention',
    tags: ['Migraine', 'CGRP', 'ODT', 'Acute', 'Prevention'],
    aliases: ['Nurtec ODT', 'Rimegepant'],
    hasVisualGuide: true,
    useProfile: MedicationUseProfile(
      route:
          '75 mg orally disintegrating tablet for adults; labeled both for acute migraine treatment and preventive treatment of episodic migraine.',
      foodTiming:
          'May be taken with or without food. Timing depends on the selected indication: as-needed acute treatment versus every-other-day prevention.',
      duration:
          'Indication-specific. Acute use is intermittent; preventive use is scheduled every other day while clinically appropriate.',
      formulationHandling:
          'Use dry hands. Peel back the blister foil; do NOT push the ODT through the foil. Remove immediately, place on or under the tongue, allow it to disintegrate in saliva and swallow without additional liquid. Do not store it outside the blister after opening.',
      monitoring:
          'Attack frequency/response, preventive benefit when used for prevention, blood pressure and symptoms of Raynaud phenomenon after current postmarketing label updates.',
      interactions:
          'Avoid strong CYP3A4 inhibitors and strong/moderate CYP3A inducers. With moderate CYP3A4 inhibitors or potent P-gp inhibitors, avoid another NURTEC dose within 48 hours.',
      commonMistakes:
          'Pushing the fragile ODT through the foil, taking more than one 75 mg dose in 24 hours, confusing acute and every-other-day preventive schedules, or ignoring the 48-hour interaction rule.',
      specialPopulations:
          'Avoid in severe hepatic impairment. Current labeling is for adults. For acute treatment, maximum is 75 mg/24 h and safety of >18 doses in 30 days is not established.',
    ),
    sourceLabel:
        'DailyMed · NURTEC ODT (rimegepant) · revised Mar 2026 · acute + episodic migraine prevention',
    sections: [
      MedicationSection(
        title: 'Two-indication lock',
        body:
            'Acute migraine: 75 mg as needed, maximum 75 mg in 24 hours. Episodic migraine prevention: 75 mg every other day. The app should ask which indication is being used before presenting timing.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'ODT blister lock',
        body:
            'Dry hands → peel foil → do not push tablet through foil → place on or under tongue immediately → no additional liquid required.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'Interaction interval',
        body:
            'Avoid strong CYP3A4 inhibitors and strong/moderate CYP3A inducers. Avoid another dose within 48 hours when used with a moderate CYP3A4 inhibitor or potent P-gp inhibitor.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'قد يُستخدم لعلاج نوبة الشقيقة عند حدوثها أو للوقاية منها كل يومين؛ اختر الاستعمال الصحيح داخل التطبيق.',
      howToUseAr:
          'بيدين جافتين انزع ورق الـfoil من الخلف ولا تدفع الحبة عبره. ضع ODT على اللسان أو تحته فورًا واتركها تذوب مع اللعاب؛ لا تحتاج ماء.',
      timingAr:
          'للنوبة الحادة: حسب الحاجة وبحد أقصى حبة 75 mg واحدة خلال 24 ساعة. للوقاية: 75 mg كل يومين حسب الوصفة.',
      importantAr:
          'بعض أدوية CYP3A/P-gp تغيّر التعرض للدواء وقد تفرض تجنب الجرعة أو الانتظار 48 ساعة؛ راجع التداخلات قبل استخدام دواء جديد.',
      commonActionableAr:
          'الغثيان قد يحدث. أبلغ الطبيب إذا ظهر ارتفاع واضح بالضغط أو برودة/ألم وتغير لون الأصابع بشكل جديد أو شديد.',
      missedDoseAr:
          'في العلاج الحاد لا توجد جرعة فائتة. في الوقاية كل يومين، لا تضاعف الجرعة لتعويض جرعة منسية؛ اتبع الخطة الموصوفة.',
      storageAr:
          'أبقِ الحبة داخل الـblister حتى وقت الاستخدام ولا تخزنها خارجه بعد فتحه.',
      seekHelpAr:
          'أوقف الدواء واطلب المساعدة عند تورم/ضيق نفس أو تحسس شديد؛ بعض تفاعلات الحساسية قد تتأخر.',
      teachBackAr:
          'ما الفرق بين جدول NURTEC للنوبة الحادة وجدول الوقاية؟ وكيف تفتح الـblister بدون كسر ODT؟',
    ),
  ),
  Medication(
    id: 'ubrogepant-ubrelvy',
    familyId: 'cns',
    name: 'Ubrogepant (UBRELVY)',
    subtitle: 'Oral CGRP antagonist for acute migraine',
    tags: ['Migraine', 'CGRP', 'Acute treatment', 'Oral'],
    aliases: ['Ubrelvy', 'Ubrogepant'],
    useProfile: MedicationUseProfile(
      route:
          'Oral tablet for acute treatment of migraine with or without aura in adults; not a preventive schedule.',
      foodTiming:
          'May be taken with or without food.',
      duration:
          'Intermittent acute treatment. Safety of treating more than 8 migraines in 30 days has not been established.',
      formulationHandling:
          'Use the prescribed 50 mg or 100 mg tablet. If needed and permitted by the regimen, a second dose may be taken at least 2 hours after the first. Maximum labeled total is 200 mg in 24 hours.',
      monitoring:
          'Attack response/frequency, hepatic/renal context when relevant, blood pressure and new/worsening Raynaud symptoms under current CGRP-antagonist warnings.',
      interactions:
          'Strong CYP3A4 inhibitors are contraindicated. Other CYP3A4 inhibitors/inducers and P-gp/BCRP inhibitors can change the prescribed dose or whether a second dose is allowed; medication review is essential.',
      commonMistakes:
          'Repeating before 2 hours, exceeding 200 mg/day, assuming the second dose is always allowed despite interacting medicines, or using it as scheduled prevention.',
      specialPopulations:
          'Avoid in end-stage renal disease under current labeling. Severe renal/hepatic impairment and interacting drugs require dose-specific prescriber review.',
    ),
    sourceLabel:
        'DailyMed · UBRELVY (ubrogepant) · current label · second dose ≥2 h; max 200 mg/24 h; CYP3A interaction table',
    sections: [
      MedicationSection(
        title: 'Repeat-dose lock',
        body:
            'A second dose, when permitted, is separated by at least 2 hours. Maximum labeled total: 200 mg in 24 hours. Safety of treating >8 migraines in 30 days is not established.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'CYP3A interaction lock',
        body:
            'Strong CYP3A4 inhibitors are contraindicated. Moderate/weak inhibitors, inducers and P-gp/BCRP inhibitors can change the allowable dose and whether a second dose is permitted; do not auto-schedule a repeat dose.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يعالج نوبة الشقيقة عند حدوثها، وليس دواء وقاية مجدولًا.',
      howToUseAr:
          'خذ القوة الموصوفة عند النوبة. إذا كانت خطتك تسمح بجرعة ثانية، انتظر ساعتين على الأقل.',
      timingAr:
          'لا تتجاوز مجموع 200 mg خلال 24 ساعة.',
      importantAr:
          'بعض الأدوية، خصوصًا مثبطات CYP3A القوية، قد تمنع استخدام UBRELVY أو تغيّر الجرعة/الجرعة الثانية. أخبر الصيدلي بكل الأدوية الجديدة.',
      commonActionableAr:
          'قد يحدث غثيان أو نعاس أو جفاف بالفم.',
      missedDoseAr:
          'ليس له جرعة يومية فائتة؛ يُستخدم للنوبة الحادة حسب الحاجة.',
      storageAr:
          'احفظ الأقراص في العبوة الأصلية بدرجة حرارة الغرفة.',
      seekHelpAr:
          'اطلب تقييمًا عند تحسس شديد أو ارتفاع ضغط جديد/شديد أو أعراض Raynaud جديدة ومزعجة.',
      teachBackAr:
          'بعد كم ساعة يمكن أخذ الجرعة الثانية إذا كانت مسموحة؟ وما الحد الأقصى خلال 24 ساعة؟',
    ),
  ),
  Medication(
    id: 'zavegepant-zavzpret-nasal',
    familyId: 'cns',
    name: 'Zavegepant (ZAVZPRET) Nasal Spray',
    subtitle: '10 mg single-use intranasal CGRP antagonist for acute migraine',
    tags: ['Migraine', 'CGRP', 'Nasal spray', 'Single-use'],
    aliases: ['Zavzpret', 'Zavegepant nasal spray'],
    hasVisualGuide: true,
    useProfile: MedicationUseProfile(
      route:
          'Intranasal acute migraine treatment in adults. One single-use device delivers one 10 mg spray into one nostril.',
      foodTiming:
          'Not meal-related. Use for an acute migraine according to the prescribed plan.',
      duration:
          'Intermittent acute treatment. Maximum is one 10 mg dose in 24 hours; safety of treating more than 8 migraines in 30 days has not been established.',
      formulationHandling:
          'Keep sealed until ready. Gently blow the nose first. Do NOT test or prime. With head level/upright, close the opposite nostril, insert the nozzle comfortably into the open nostril, slowly breathe in through the nose while firmly pressing the plunger once, then keep the head level and breathe gently for 10–20 seconds.',
      monitoring:
          'Migraine response, nasal/taste effects, blood pressure and new/worsening Raynaud symptoms.',
      interactions:
          'Avoid intranasal decongestants before ZAVZPRET because they may reduce absorption; if one is needed, current labeling says use it at least 1 hour after ZAVZPRET. Transporter interactions also require medication review.',
      commonMistakes:
          'Testing/priming the single-use device and losing the dose, spraying into both nostrils, using more than one dose in 24 hours, tilting/lying down during administration, or using a nasal decongestant too soon.',
      specialPopulations:
          'Current labeling is for adults and is not for migraine prevention. Use is not recommended in severe hepatic impairment or severe renal impairment under labeling.',
    ),
    sourceLabel:
        'DailyMed · ZAVZPRET (zavegepant) nasal spray · updated Aug 2025/current IFU · 10 mg one spray/one nostril',
    sections: [
      MedicationSection(
        title: 'Single-use nasal device lock',
        body:
            'One device = one 10 mg dose = one spray into one nostril. Do not test or prime. Maximum one dose in 24 hours.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Technique',
        body:
            'Blow nose → head level/upright → close opposite nostril → insert nozzle → slowly inhale through nose while pressing plunger once → keep head level and breathe gently for 10–20 seconds.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'Decongestant spacing',
        body:
            'Avoid intranasal decongestants before ZAVZPRET. If one is needed, current labeling directs using it at least 1 hour after ZAVZPRET.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'بخاخ أنفي لعلاج نوبة الشقيقة الحادة عند البالغين؛ ليس للوقاية اليومية.',
      howToUseAr:
          'لا تختبر الجهاز. انفخ أنفك بلطف، أبقِ الرأس مستقيمًا، أغلق الفتحة الأخرى، أدخل الفوهة في فتحة واحدة ثم خذ شهيقًا بطيئًا من الأنف واضغط المكبس بقوة مرة واحدة. بعدها أبقِ الرأس مستقيمًا وتنفس بلطف 10–20 ثانية.',
      timingAr:
          'جهاز واحد = بخة واحدة 10 mg في فتحة واحدة فقط، ولا تستخدم أكثر من جرعة واحدة خلال 24 ساعة.',
      importantAr:
          'لا تستخدم decongestant أنفي قبل ZAVZPRET؛ إذا احتجته فاستخدمه بعد ZAVZPRET بساعة على الأقل حسب الملصق الحالي.',
      commonActionableAr:
          'تغير/اضطراب الطعم، الغثيان أو انزعاج الأنف قد يحدث.',
      missedDoseAr:
          'ليس دواءً مجدولًا؛ يُستخدم للنوبة الحادة فقط.',
      storageAr:
          'احفظ الجهاز داخل الـblister المغلق بدرجة حرارة 20–25°C ولا تجمّده.',
      seekHelpAr:
          'اطلب المساعدة عند تحسس شديد، ارتفاع ضغط شديد جديد، أو برودة/ألم وتغير لون الأصابع بشكل جديد أو شديد.',
      teachBackAr:
          'هل تختبر البخاخ قبل الاستخدام؟ كم فتحة أنف تستخدم؟ وكم جرعة مسموحة خلال 24 ساعة؟',
    ),
  ),
];
