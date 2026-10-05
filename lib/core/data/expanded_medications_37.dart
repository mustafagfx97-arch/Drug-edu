import '../models/medication.dart';

const expandedMedications37 = <Medication>[
  Medication(
    id: 'amphetamine-mixed-salts-adderall-xr',
    familyId: 'cns',
    name: 'Mixed Amphetamine Salts Extended-Release (ADDERALL XR)',
    subtitle: 'ADHD · morning · IR divided doses → same total daily dose once daily',
    tags: ['ADHD', 'Amphetamine', 'ADDERALL XR', 'Extended release', 'Controlled substance'],
    aliases: ['ADDERALL XR', 'Mixed amphetamine salts XR'],
    sourceLabel:
        'DailyMed · ADDERALL XR mixed amphetamine salts extended-release capsules · current labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily extended-release mixed amphetamine salts for ADHD according to age and product labeling.',
      foodTiming:
          'Take once daily in the morning, with or without food. Avoid late-day dosing because insomnia can occur.',
      duration:
          'Often long-term/individualized for ADHD; periodically reassess benefit, adverse effects and misuse risk.',
      formulationHandling:
          'Capsules may be swallowed whole or opened and the entire contents sprinkled on applesauce. Swallow immediately without chewing; do not store the mixture and do not divide a capsule dose.',
      releaseConversion:
          'Patients taking divided doses of immediate-release ADDERALL may be switched to ADDERALL XR at the same total daily amphetamine-salt dose taken once daily, then titrated according to efficacy and tolerability. Example: immediate-release ADDERALL 10 mg twice daily = 20 mg/day → ADDERALL XR 20 mg once each morning as the labeled conversion principle. This rule is specific to mixed amphetamine salts IR → ADDERALL XR and must not be generalized to other amphetamine products or prodrugs.',
      monitoring:
          'Blood pressure, heart rate, appetite/weight, sleep, psychiatric symptoms, growth in pediatric patients and misuse/diversion risk.',
      interactions:
          'MAO inhibitors are contraindicated within the required washout interval. Review serotonergic drugs, alkalinizing/acidifying agents and other sympathomimetics.',
      commonMistakes:
          'Taking XR late in the day, keeping the old divided IR schedule after conversion, dividing capsule contents, chewing beads or assuming other amphetamine XR products are dose-equivalent.',
      specialPopulations:
          'Cardiovascular disease, hypertension, tic disorders, psychiatric comorbidity and substance-use risk require individualized assessment.',
    ),
    sections: [
      MedicationSection(
        title: 'IR ADDERALL → XR conversion',
        body:
            'Use the same total daily dose when switching divided immediate-release ADDERALL doses to ADDERALL XR once daily. Reassess efficacy and tolerability after the switch.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Sprinkle technique',
        body:
            'Open capsule only if needed → sprinkle the entire contents on applesauce → swallow immediately without chewing → do not store or divide the dose.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'صيغة ممتدة من mixed amphetamine salts لعلاج ADHD حسب العمر والوصفة.',
      howToUseAr:
          'خذها صباحًا مرة واحدة. يمكن ابتلاع الكبسولة كاملة أو فتحها ووضع كل المحتوى على applesauce وابتلاعه فورًا دون مضغ. لا تقسّم محتوى الكبسولة ولا تخزن الخليط.',
      timingAr:
          'مرة واحدة صباحًا؛ تجنب أخذها متأخرًا لأن ذلك قد يسبب الأرق.',
      importantAr:
          'عند التحويل من ADDERALL العادي المقسم على جرعات إلى ADDERALL XR نستخدم نفس مجموع الجرعة اليومية مرة واحدة صباحًا. مثال: 10 mg مرتين يوميًا = 20 mg/day → 20 mg XR صباحًا حسب خطة الطبيب.',
      commonActionableAr:
          'قد تقل الشهية أو يحدث أرق أو خفقان/ارتفاع ضغط؛ راقب النوم والشهية والنبض حسب الخطة.',
      missedDoseAr:
          'إذا فاتتك جرعة الصباح فلا تأخذ جرعة متأخرة من نفسك لأن ذلك قد يسبب أرقًا؛ اتبع تعليمات وصفك.',
      seekHelpAr:
          'اطلب تقييمًا عند ألم صدر، إغماء، خفقان شديد مستمر، هياج/هلاوس جديدة أو أعراض تحسس شديد.',
      teachBackAr:
          'إذا كنت تأخذ ADDERALL العادي 10 mg مرتين يوميًا، ما مجموع الجرعة اليومية عند التحويل إلى XR؟',
    ),
  ),
  Medication(
    id: 'dexmethylphenidate-focalin-xr',
    familyId: 'cns',
    name: 'Dexmethylphenidate Extended-Release (FOCALIN XR)',
    subtitle: 'ADHD · morning · two distinct conversion rules',
    tags: ['ADHD', 'Dexmethylphenidate', 'FOCALIN XR', 'Extended release', 'Controlled substance'],
    aliases: ['FOCALIN XR', 'Dexmethylphenidate XR'],
    sourceLabel:
        'DailyMed · FOCALIN XR dexmethylphenidate extended-release capsules · updated Sep 2025',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily dexmethylphenidate XR for ADHD in patients 6 years and older according to current labeling.',
      foodTiming:
          'Take once daily in the morning, with or without food.',
      duration:
          'Often long-term/individualized for ADHD; periodically reassess ongoing benefit and misuse risk.',
      formulationHandling:
          'Capsule may be swallowed whole or opened and the entire contents sprinkled on applesauce. Consume immediately without chewing; do not divide the capsule dose.',
      releaseConversion:
          'There are two different labeled conversion rules. If switching from Focalin immediate-release (dexmethylphenidate), use the same total daily dexmethylphenidate dose as Focalin XR once daily. If switching from racemic methylphenidate, start Focalin XR at one-half (1/2) of the current total daily methylphenidate dose. Example: dexmethylphenidate IR 5 mg twice daily = 10 mg/day → Focalin XR 10 mg once daily; racemic methylphenidate total 20 mg/day → Focalin XR 10 mg once daily.',
      monitoring:
          'Blood pressure, heart rate, appetite/weight, sleep, growth in pediatric patients, psychiatric symptoms and misuse/diversion risk.',
      interactions:
          'MAO inhibitors are contraindicated within the required washout interval. Review other sympathomimetics and medicines affecting blood pressure or psychiatric status.',
      commonMistakes:
          'Using the methylphenidate half-dose rule when converting from Focalin itself, or using the same-dose Focalin rule when converting from racemic methylphenidate.',
      specialPopulations:
          'Current labeling does not recommend use below age 6. Cardiovascular disease, tics, psychiatric comorbidity and misuse risk require individualized review.',
    ),
    sections: [
      MedicationSection(
        title: 'Two conversion rules',
        body:
            'Focalin IR → Focalin XR: same total daily dexmethylphenidate dose. Racemic methylphenidate → Focalin XR: one-half the current total daily methylphenidate dose.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Capsule handling',
        body:
            'Swallow whole or sprinkle the entire capsule contents on applesauce. Consume immediately without chewing; never divide one capsule across doses.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'صيغة ممتدة من dexmethylphenidate لعلاج ADHD.',
      howToUseAr:
          'خذها صباحًا مرة واحدة. يمكن ابتلاعها كاملة أو فتح الكبسولة ورش كل المحتوى على applesauce ثم ابتلاعه فورًا دون مضغ. لا تقسّم محتوى الكبسولة.',
      timingAr:
          'مرة واحدة صباحًا، مع الطعام أو بدونه.',
      importantAr:
          'هناك قاعدتان مختلفتان: إذا كنت تستخدم Focalin العادي فـXR يبدأ بنفس مجموع الجرعة اليومية. أما إذا كنت تستخدم methylphenidate العادي فـFocalin XR يبدأ بنصف مجموع جرعة methylphenidate اليومية.',
      commonActionableAr:
          'قد تقل الشهية أو يحدث أرق أو ارتفاع بالنبض/الضغط؛ راقب الوزن والنوم حسب الخطة.',
      missedDoseAr:
          'لا تعوض الجرعة المتأخرة قرب المساء من نفسك لأن الأرق قد يزداد؛ اتبع خطة وصفك.',
      seekHelpAr:
          'اطلب تقييمًا عند ألم صدر، إغماء، خفقان شديد مستمر أو هياج/هلاوس جديدة.',
      teachBackAr:
          'ما الفرق بين التحويل من Focalin IR إلى XR والتحويل من methylphenidate العادي إلى Focalin XR؟',
    ),
  ),
  Medication(
    id: 'methylphenidate-concerta-er',
    familyId: 'cns',
    name: 'Methylphenidate Extended-Release (CONCERTA)',
    subtitle: 'ADHD · morning · product-specific IR conversion table',
    tags: ['ADHD', 'Methylphenidate', 'CONCERTA', 'Extended release', 'Controlled substance'],
    aliases: ['CONCERTA', 'Methylphenidate OROS ER'],
    sourceLabel:
        'DailyMed · CONCERTA methylphenidate hydrochloride extended-release tablets · updated 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily OROS-type methylphenidate ER for ADHD in labeled age groups.',
      foodTiming:
          'Take once daily in the morning, with or without food.',
      duration:
          'Often long-term/individualized for ADHD; periodically reassess benefit, adverse effects and misuse risk.',
      formulationHandling:
          'Swallow the tablet whole with liquid. Do not chew, divide or crush. The nonabsorbable tablet shell may be seen in stool.',
      releaseConversion:
          'CONCERTA uses a product-specific conversion table rather than a simple milligram-for-milligram switch from immediate-release methylphenidate given twice or three times daily: IR 5 mg BID or TID → CONCERTA 18 mg every morning; IR 10 mg BID or TID → 36 mg every morning; IR 15 mg BID or TID → 54 mg every morning; IR 20 mg BID or TID → 72 mg every morning (the 72-mg conversion applies only to patients 13–65 years in current labeling). Conversion should not exceed the age-appropriate maximum and should be individualized by clinical judgment.',
      monitoring:
          'Blood pressure, heart rate, appetite/weight, sleep, growth in pediatric patients, psychiatric symptoms and misuse/diversion risk.',
      interactions:
          'MAO inhibitors are contraindicated within the required washout interval. Review other sympathomimetics and medicines affecting blood pressure.',
      commonMistakes:
          'Converting IR methylphenidate mg-for-mg, crushing the OROS tablet, interpreting the empty shell in stool as treatment failure or applying the 72-mg option to younger children.',
      specialPopulations:
          'Current labeling has age-specific maximum doses: 54 mg/day for ages 6–12 and up to 72 mg/day for ages 13–65, with adolescent weight limits also applying.',
    ),
    sections: [
      MedicationSection(
        title: 'IR methylphenidate → CONCERTA table',
        body:
            '5 mg BID/TID → 18 mg QAM; 10 mg BID/TID → 36 mg QAM; 15 mg BID/TID → 54 mg QAM; 20 mg BID/TID → 72 mg QAM for eligible patients age 13–65. This is a CONCERTA-specific table, not a universal methylphenidate-ER rule.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'OROS tablet lock',
        body:
            'Swallow whole. Do not chew, divide or crush. The tablet shell may appear in stool after the drug has been released.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'صيغة ممتدة من methylphenidate لعلاج ADHD مرة واحدة صباحًا.',
      howToUseAr:
          'ابتلع CONCERTA كاملة مع الماء. لا تسحقها أو تقسمها أو تمضغها. قد ترى غلاف الحبة في البراز وهذا قد يكون طبيعيًا.',
      timingAr:
          'مرة واحدة صباحًا، مع الطعام أو بدونه.',
      importantAr:
          'التحويل من methylphenidate العادي إلى CONCERTA ليس mg مقابل mg. الجدول المراجع: 5 mg مرتين/ثلاث يوميًا → 18 mg صباحًا؛ 10 mg → 36 mg؛ 15 mg → 54 mg؛ 20 mg → 72 mg للمرضى المؤهلين عمر 13–65.',
      commonActionableAr:
          'قد تقل الشهية أو يحدث أرق أو ارتفاع بالنبض/الضغط؛ راقب الوزن والنوم حسب الخطة.',
      missedDoseAr:
          'إذا تذكرت الجرعة متأخرًا لا تأخذها قرب المساء من نفسك لأن الأرق قد يزداد؛ اتبع تعليمات وصفك.',
      seekHelpAr:
          'اطلب تقييمًا عند ألم صدر، إغماء، خفقان شديد مستمر أو أعراض نفسية جديدة شديدة.',
      teachBackAr:
          'إذا كنت تأخذ methylphenidate 10 mg مرتين يوميًا، هل تتحول إلى CONCERTA 20 mg أم 36 mg حسب الجدول؟',
    ),
  ),
];
