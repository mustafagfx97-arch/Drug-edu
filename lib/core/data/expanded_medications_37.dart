import '../models/medication.dart';

const expandedMedications37 = <Medication>[
  Medication(
    id: 'lithium-carbonate-er-450',
    familyId: 'cns',
    name: 'Lithium Carbonate Extended-Release 450 mg',
    subtitle: 'Bipolar disorder · controlled release · IR→ER same total daily dose when possible',
    tags: ['Lithium', 'Bipolar', 'Extended release', 'Narrow therapeutic index', 'High risk'],
    aliases: ['Lithium ER 450 mg', 'Lithium carbonate CR 450 mg'],
    sourceLabel:
        'DailyMed · Lithium carbonate extended-release tablets 450 mg · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Controlled-release lithium carbonate tablet used for acute mania and maintenance treatment in bipolar disorder according to the exact product.',
      foodTiming:
          'Take consistently with respect to food and maintain a stable, clinically appropriate salt/fluid intake. ER tablets are commonly given about every 12 hours.',
      duration:
          'Often long-term maintenance therapy. Dose is individualized to serum concentration and clinical response.',
      formulationHandling:
          'Swallow the extended-release tablet whole. Do not chew or crush.',
      releaseConversion:
          'When switching from immediate-release lithium capsules to the reviewed 450-mg extended-release tablets, use the same total daily dose when possible. If the prior IR total is not a multiple of 450 mg, start the nearest 450-mg multiple below the prior total. Label example: IR 1500 mg/day → ER 1350 mg/day, usually 450 mg in the morning and 900 mg in the evening. Monitor serum lithium at 1- to 2-week intervals until stable; use IR capsules when finer dose titration is required.',
      monitoring:
          'Serum lithium concentration, renal function, thyroid function, calcium, hydration/sodium status and interacting medicines. Trough levels are drawn immediately before the next dose, roughly 8–12 hours after the previous dose.',
      interactions:
          'NSAIDs, ACE inhibitors/ARBs and many diuretics can increase lithium exposure. Dehydration, diarrhea, fever and heavy sweating can precipitate toxicity.',
      commonMistakes:
          'Crushing ER, matching a non-450-multiple IR total by rounding up, changing salt/fluid intake abruptly, or changing formulation without serum-level follow-up.',
      specialPopulations:
          'Renal impairment, older age, pregnancy and acute illness require individualized management.',
    ),
    sections: [
      MedicationSection(
        title: 'IR → ER 450 mg conversion',
        body:
            'Same total daily lithium dose when possible. If the IR total is not a multiple of 450 mg, use the nearest lower 450-mg multiple initially. Example: 1500 mg/day IR → 1350 mg/day ER. Recheck lithium levels and clinical response.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Lithium toxicity lock',
        body:
            'A formulation switch is not complete until lithium level, renal status, hydration and interacting medicines are reviewed. Toxicity can occur close to therapeutic concentrations.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'صيغة ممتدة من lithium لتثبيت المزاج وعلاج/وقاية نوبات bipolar حسب الخطة.',
      howToUseAr:
          'ابتلع ER كاملة ولا تسحقها أو تمضغها. خذها بطريقة ثابتة يوميًا وحافظ على نمط ثابت نسبيًا للسوائل والملح حسب تعليمات الطبيب.',
      timingAr:
          'غالبًا تُقسم جرعة ER على نحو كل 12 ساعة حسب الوصفة.',
      importantAr:
          'عند التحويل من lithium العادي إلى ER 450 mg نحافظ على نفس مجموع الجرعة اليومية عندما تسمح القوة. إذا كانت الجرعة القديمة لا تنقسم على 450 mg نبدأ عادة بأقرب multiple أقل؛ مثال 1500 mg/day → 1350 mg/day ER مع متابعة مستوى lithium.',
      commonActionableAr:
          'قد يحدث عطش أو تبول أكثر أو رجفة خفيفة. لا تبدأ ibuprofen/naproxen أو مدر/دواء ضغط جديد من دون مراجعة.',
      missedDoseAr:
          'لا تضاعف جرعة lithium. إذا اقترب موعد التالية فتجاوز المنسية واتبع خطة الطبيب.',
      seekHelpAr:
          'اطلب تقييمًا عاجلًا عند رجفة شديدة، ترنح، تشوش، قيء/إسهال شديد أو نعاس غير معتاد.',
      teachBackAr:
          'إذا كنت على 1500 mg/day من lithium العادي، ما جرعة البدء المذكورة في ملصق ER 450 mg؟ ولماذا نعيد فحص مستوى lithium بعد التحويل؟',
    ),
  ),
  Medication(
    id: 'amantadine-osmolex-er',
    familyId: 'cns',
    name: 'Amantadine Extended-Release Tablets (OSMOLEX ER)',
    subtitle: 'Parkinson/drug-induced EPS · morning · not interchangeable with amantadine products',
    tags: ['Amantadine', 'OSMOLEX ER', 'Parkinson', 'Drug-induced EPS', 'Extended release'],
    aliases: ['OSMOLEX ER'],
    sourceLabel:
        'DailyMed · OSMOLEX ER amantadine extended-release tablets · current labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Extended-release amantadine tablet for Parkinson disease and drug-induced extrapyramidal reactions in adults.',
      foodTiming:
          'Take once daily in the morning, with or without food.',
      duration:
          'Usually chronic/individualized. Avoid abrupt discontinuation after regular use.',
      formulationHandling:
          'Swallow tablets whole. Do not chew, crush or divide.',
      releaseConversion:
          'OSMOLEX ER is not interchangeable with other amantadine immediate- or extended-release products. Do not calculate a universal mg-for-mg conversion. Current labeling states that patients unable to tolerate more than 100 mg/day of immediate-release amantadine have no equivalent OSMOLEX ER dose or dosing regimen. The labeled initial dose is 129 mg once each morning with weekly titration in normal renal function.',
      monitoring:
          'Parkinson/EPS response, hallucinations, orthostasis, edema, sleepiness, impulse-control symptoms and renal function.',
      interactions:
          'Renal impairment changes the titration interval and, in moderate/severe impairment, the dosing frequency. Avoid abrupt withdrawal.',
      commonMistakes:
          'Using GOCOVRI bedtime instructions for OSMOLEX ER, converting IR by equal milligrams or splitting/crushing the ER tablet.',
      specialPopulations:
          'Moderate/severe renal impairment can require dosing every 48 or 96 hours rather than daily; use the exact renal table.',
    ),
    sections: [
      MedicationSection(
        title: 'No IR / GOCOVRI → OSMOLEX conversion',
        body:
            'OSMOLEX ER is explicitly not interchangeable with other amantadine products. No equivalent OSMOLEX regimen exists for patients unable to tolerate more than 100 mg/day of IR amantadine.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'OSMOLEX ER صيغة amantadine ممتدة للـParkinson أو بعض الحركات الجانبية الناتجة من الأدوية.',
      howToUseAr:
          'خذ الحبة صباحًا وابتلعها كاملة. لا تسحقها أو تقسمها أو تمضغها.',
      timingAr:
          'مرة واحدة صباحًا في الوظيفة الكلوية المناسبة؛ أمراض الكلى قد تغيّر عدد الأيام بين الجرعات.',
      importantAr:
          'لا تبدل amantadine العادي أو GOCOVRI إلى OSMOLEX بنفس رقم الـmg. إذا كنت لا تتحمل أكثر من 100 mg/day من amantadine العادي فلا يوجد equivalent OSMOLEX dose في الملصق.',
      commonActionableAr:
          'قد يحدث دوار، تورم، هلوسة أو نعاس؛ انتبه للقيادة والسقوط.',
      missedDoseAr:
          'لا تضاعف الجرعة. لأن أمراض الكلى قد تجعل الجدول كل 48 أو 96 ساعة، اتبع نفس خطة الوصفة.',
      seekHelpAr:
          'اطلب تقييمًا عند هلوسة شديدة، إغماء، نعاس مفاجئ أو تدهور واضح بالأعراض.',
      teachBackAr:
          'هل OSMOLEX ER وGOCOVRI interchangeable؟ وفي أي وقت من اليوم يؤخذ OSMOLEX ER؟',
    ),
  ),
  Medication(
    id: 'methylphenidate-concerta',
    familyId: 'cns',
    name: 'Methylphenidate Extended-Release (CONCERTA)',
    subtitle: 'ADHD · morning · product-specific IR conversion table',
    tags: ['Methylphenidate', 'CONCERTA', 'ADHD', 'Extended release', 'Controlled substance'],
    aliases: ['CONCERTA'],
    sourceLabel:
        'DailyMed · CONCERTA methylphenidate extended-release tablets · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily extended-release methylphenidate for ADHD in labeled age groups.',
      foodTiming:
          'Take once daily in the morning, with or without food.',
      duration:
          'Usually chronic/individualized with periodic reassessment of benefit, growth, cardiovascular effects and misuse risk.',
      formulationHandling:
          'Swallow the tablet whole with liquid. Do not chew, divide or crush. The nonabsorbable shell may appear in stool.',
      releaseConversion:
          'Official CONCERTA starting conversion from immediate-release methylphenidate given twice or three times daily: IR 5 mg BID or TID → CONCERTA 18 mg each morning; 10 mg BID or TID → 36 mg QAM; 15 mg BID or TID → 54 mg QAM; 20 mg BID or TID → 72 mg QAM (the 72-mg conversion applies to ages 13–65). This table is specific to CONCERTA and must not be copied to other methylphenidate ER brands.',
      monitoring:
          'ADHD response, appetite/weight/growth, sleep, blood pressure, heart rate, mood/tics and misuse/diversion risk.',
      interactions:
          'MAOI use within 14 days is contraindicated. Review other sympathomimetics and cardiovascular risk.',
      commonMistakes:
          'Using total daily IR milligrams as a simple 1:1 CONCERTA dose, copying the CONCERTA table to another methylphenidate ER product, crushing the tablet or taking it late in the day.',
      specialPopulations:
          'Dose limits depend on age; the 72-mg conversion row is not for children 6–12 years.',
    ),
    sections: [
      MedicationSection(
        title: 'IR methylphenidate → CONCERTA table',
        body:
            '5 mg BID/TID→18 mg QAM; 10 mg BID/TID→36 mg QAM; 15 mg BID/TID→54 mg QAM; 20 mg BID/TID→72 mg QAM (age 13–65 only). Product-specific table: do not generalize to other ER methylphenidate brands.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'CONCERTA صيغة methylphenidate ممتدة لعلاج ADHD.',
      howToUseAr:
          'خذها صباحًا وابتلع الحبة كاملة مع سائل. لا تسحقها أو تقسمها أو تمضغها. قد ترى غلاف الحبة في البراز وهذا قد يكون طبيعيًا.',
      timingAr:
          'مرة واحدة صباحًا لتقليل تأثيرها على النوم.',
      importantAr:
          'التحويل من methylphenidate العادي إلى CONCERTA له جدول خاص وليس mg مقابل mg: 5 mg مرتين/ثلاث يوميًا → 18 mg صباحًا؛ 10 mg →36 mg؛ 15 mg→54 mg؛ 20 mg→72 mg وفق العمر. لا تطبق هذا الجدول على براند XR آخر.',
      commonActionableAr:
          'قد يقل الشهية أو يسبب أرقًا أو خفقانًا؛ راقب الوزن/النوم والنبض حسب الخطة.',
      missedDoseAr:
          'إذا تأخرت كثيرًا عن جرعة الصباح لا تعوضها ليلًا من نفسك لأن ذلك قد يسبب أرقًا.',
      seekHelpAr:
          'اطلب تقييمًا عند ألم صدر، إغماء، أعراض نفسية شديدة جديدة أو ارتفاع شديد بالنبض/الضغط.',
      teachBackAr:
          'هل 20 mg/day من methylphenidate العادي تعني 20 mg CONCERTA؟ وهل جدول CONCERTA يصلح لأي methylphenidate XR آخر؟',
    ),
  ),
  Medication(
    id: 'mixed-amphetamine-salts-adderall-xr',
    familyId: 'cns',
    name: 'Mixed Amphetamine Salts Extended-Release (ADDERALL XR)',
    subtitle: 'ADHD · morning · same total daily dose from divided IR ADDERALL',
    tags: ['Amphetamine', 'ADDERALL XR', 'ADHD', 'Extended release', 'Controlled substance'],
    aliases: ['ADDERALL XR', 'Mixed amphetamine salts XR'],
    sourceLabel:
        'DailyMed · ADDERALL XR mixed amphetamine salts extended-release capsules · current labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily mixed amphetamine salts extended-release capsule for ADHD in labeled age groups.',
      foodTiming:
          'Take once daily in the morning, with or without food. Avoid afternoon dosing because of insomnia risk.',
      duration:
          'Usually chronic/individualized with periodic reassessment of benefit, growth, cardiovascular effects and misuse/diversion risk.',
      formulationHandling:
          'Swallow capsule whole or open and sprinkle the entire contents on applesauce. Swallow immediately without chewing; do not store and do not divide a capsule dose.',
      releaseConversion:
          'Based on bioequivalence data, patients taking divided doses of immediate-release ADDERALL (for example twice daily) may be switched to ADDERALL XR at the same total daily dose taken once daily. Example: IR ADDERALL 10 mg twice daily = 20 mg/day → ADDERALL XR 20 mg once each morning as a labeled starting switch, followed by weekly titration to efficacy/tolerability.',
      monitoring:
          'ADHD response, appetite/weight/growth, sleep, blood pressure, heart rate, psychiatric symptoms and misuse/diversion risk.',
      interactions:
          'MAOIs are contraindicated within 14 days. Review serotonergic agents, acidifying/alkalinizing drugs and cardiovascular risk.',
      commonMistakes:
          'Keeping the old divided IR schedule after starting XR, taking XR in the afternoon, chewing sprinkled beads or dividing a capsule’s contents into partial doses.',
      specialPopulations:
          'Dose selection and maximums are age-specific; use the exact label and clinical response.',
    ),
    sections: [
      MedicationSection(
        title: 'IR ADDERALL → XR conversion',
        body:
            'Use the same total daily mixed-amphetamine-salts dose once daily in the morning when switching from divided IR ADDERALL, then titrate weekly as needed. This rule is specific to ADDERALL formulations and should not be generalized to other amphetamine products.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Sprinkle technique',
        body:
            'Open capsule if needed → sprinkle all contents on applesauce → swallow immediately without chewing → do not store → never split one capsule into partial doses.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'ADDERALL XR صيغة ممتدة من mixed amphetamine salts لعلاج ADHD.',
      howToUseAr:
          'خذه صباحًا. يمكن ابتلاع الكبسولة كاملة أو فتحها ورش كل المحتوى على applesauce ثم ابتلاعه فورًا دون مضغ؛ لا تقسّم محتوى الكبسولة إلى جرعات.',
      timingAr:
          'مرة واحدة صباحًا، وتجنب أخذها بعد الظهر لتقليل الأرق.',
      importantAr:
          'عند التحويل من ADDERALL العادي المقسم على اليوم إلى XR نستخدم نفس مجموع الجرعة اليومية مرة واحدة صباحًا؛ مثال 10 mg مرتين يوميًا = 20 mg/day → 20 mg XR صباحًا حسب الوصفة. لا تطبق هذه القاعدة على amphetamine product آخر.',
      commonActionableAr:
          'قد يقل الشهية أو يسبب أرقًا أو خفقانًا؛ راقب الوزن والنوم والنبض حسب الخطة.',
      missedDoseAr:
          'إذا فاتت جرعة الصباح لا تعوضها متأخرًا من نفسك؛ قد تسبب أرقًا.',
      seekHelpAr:
          'اطلب تقييمًا عند ألم صدر، إغماء، أعراض نفسية شديدة جديدة أو ارتفاع شديد بالنبض/الضغط.',
      teachBackAr:
          'إذا كنت تستخدم ADDERALL العادي 10 mg مرتين يوميًا، ما جرعة XR اليومية الابتدائية حسب قاعدة التحويل؟',
    ),
  ),
];
