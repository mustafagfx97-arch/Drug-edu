import '../models/medication.dart';

const expandedMedications37 = <Medication>[
  Medication(
    id: 'guanfacine-er-adhd',
    familyId: 'cns',
    name: 'Guanfacine Extended-Release',
    subtitle: 'ADHD · once daily · IR guanfacine is NOT mg-for-mg interchangeable',
    tags: ['ADHD', 'Guanfacine', 'Extended release', 'Non-stimulant', 'Conversion'],
    aliases: ['Intuniv-type', 'Guanfacine ER'],
    sourceLabel:
        'DailyMed · Guanfacine extended-release tablets · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily extended-release guanfacine for ADHD as monotherapy or adjunctive therapy according to age/weight and product labeling.',
      foodTiming:
          'May be taken in the morning or evening, but do not take with a high-fat meal because exposure increases.',
      duration:
          'Often long-term when effective; periodically reassess ongoing need. Taper when discontinuing to reduce rebound hypertension risk.',
      formulationHandling:
          'Swallow ER tablets whole. Do not crush, chew or break.',
      releaseConversion:
          'Do not substitute immediate-release guanfacine on a milligram-per-milligram basis. When switching from IR guanfacine, discontinue IR and titrate ER from the labeled ER schedule: begin 1 mg once daily and increase by no more than 1 mg/week according to response, tolerability and weight-based target range. The same numeric dose has lower Cmax and bioavailability and a later Tmax with ER than IR.',
      monitoring:
          'Blood pressure, heart rate, sedation/fatigue, dizziness/syncope, ADHD response and rebound hypertension during tapering.',
      interactions:
          'Strong/moderate CYP3A4 inhibitors or inducers can alter guanfacine exposure. Additive sedation and blood-pressure lowering can occur with other CNS depressants or antihypertensives.',
      commonMistakes:
          'Copying the IR milligram dose into ER, crushing ER, taking it with a high-fat meal, or stopping abruptly.',
      specialPopulations:
          'Weight-based target ranges apply in pediatric ADHD. Renal/hepatic impairment and interacting CYP3A4 medicines may require individualized dosing.',
    ),
    sections: [
      MedicationSection(
        title: 'IR → ER conversion',
        body:
            'Stop immediate-release guanfacine and re-titrate the ER product rather than copying the milligram dose. Start ER at 1 mg once daily and increase by no more than 1 mg/week according to the labeled plan.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'High-fat meal + taper lock',
        body:
            'Do not take with a high-fat meal. When stopping ER, taper in decrements of no more than 1 mg every 3–7 days to reduce rebound hypertension risk.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'صيغة guanfacine ممتدة المفعول لعلاج ADHD، وتؤخذ مرة يوميًا حسب الخطة.',
      howToUseAr:
          'ابتلع حبة ER كاملة ولا تسحقها أو تمضغها أو تكسرها. لا تأخذها مع وجبة عالية الدهون.',
      timingAr:
          'مرة واحدة يوميًا صباحًا أو مساءً حسب الوصفة.',
      importantAr:
          'لا تحول guanfacine العادي إلى ER بنفس رقم الـmg. عند التحويل يُوقف النوع العادي ويبدأ ER من جدول التدرج الخاص به، عادةً 1 mg مرة يوميًا ثم زيادة تدريجية حسب الطبيب.',
      commonActionableAr:
          'قد تسبب نعاسًا أو دوخة أو انخفاض ضغط؛ انهض ببطء واعرف تأثيرها عليك قبل القيادة.',
      missedDoseAr:
          'لا تضاعف الجرعة. إذا فاتت عدة جرعات تواصل مع الطبيب/الصيدلي لأن العودة للجرعة القديمة مباشرة قد لا تكون مناسبة.',
      seekHelpAr:
          'اطلب تقييمًا عند إغماء، بطء شديد في النبض مع أعراض أو ارتفاع ضغط شديد بعد إيقاف مفاجئ.',
      teachBackAr:
          'إذا كنت تستخدم 2 mg من guanfacine العادي، هل تبدأ 2 mg ER تلقائيًا؟',
    ),
  ),
  Medication(
    id: 'clonidine-er-adhd',
    familyId: 'cns',
    name: 'Clonidine Extended-Release',
    subtitle: 'ADHD · BID ER schedule · not mg-for-mg interchangeable with other clonidine',
    tags: ['ADHD', 'Clonidine', 'Extended release', 'Non-stimulant', 'Rebound hypertension'],
    aliases: ['Kapvay-type', 'Clonidine ER'],
    sourceLabel:
        'DailyMed · Clonidine hydrochloride extended-release tablets · current labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Extended-release clonidine for ADHD as monotherapy or adjunctive therapy to stimulants.',
      foodTiming:
          'May be taken with or without food.',
      duration:
          'Often long-term when effective; taper when discontinuing to avoid rebound hypertension.',
      formulationHandling:
          'Swallow ER tablets whole. Do not crush, chew or break.',
      releaseConversion:
          'Do not substitute clonidine ER for immediate-release clonidine or other clonidine products on a milligram-per-milligram basis because pharmacokinetic profiles differ. The reviewed ER ADHD regimen starts at 0.1 mg at bedtime for 1 week, then increases by 0.1 mg/day at weekly intervals as needed. ER doses are divided twice daily, with the bedtime dose equal to or larger than the morning dose; studied/recommended total daily dose does not exceed 0.4 mg/day.',
      monitoring:
          'Blood pressure, heart rate, sedation, dizziness/syncope, ADHD response and rebound hypertension risk.',
      interactions:
          'Additive sedation and hypotension can occur with CNS depressants or antihypertensives. Conduction-slowing drugs may increase bradycardia risk.',
      commonMistakes:
          'Copying the immediate-release dose directly into ER, crushing ER, putting the larger split in the morning instead of bedtime, or stopping abruptly.',
      specialPopulations:
          'Renal impairment may require individualized dosing. Pediatric ADHD dosing should follow the ER-specific titration schedule.',
    ),
    sections: [
      MedicationSection(
        title: 'No mg-for-mg clonidine conversion',
        body:
            'ER clonidine is not substituted mg-for-mg for other clonidine products. Use its own ADHD titration: 0.1 mg at bedtime initially, then weekly 0.1 mg/day increases with twice-daily split dosing once the total requires it.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Rebound-hypertension lock',
        body:
            'When discontinuing, taper total daily dose by no more than 0.1 mg every 3–7 days to reduce rebound hypertension risk.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'Clonidine ER صيغة مخصصة لعلاج ADHD وليست نفس جدول clonidine العادي أو اللاصقة.',
      howToUseAr:
          'ابتلع حبة ER كاملة ولا تسحقها أو تمضغها أو تكسرها.',
      timingAr:
          'يبدأ الجدول عادةً 0.1 mg عند النوم؛ ومع الزيادة قد تصبح الجرعة مرتين يوميًا ويكون مقدار جرعة النوم مساويًا أو أكبر من جرعة الصباح.',
      importantAr:
          'لا تحول clonidine العادي إلى ER بنفس رقم الـmg. الـER له تدرج وجدول مستقل، ولا توقفه فجأة لأن الضغط قد يرتفع بشكل ارتدادي.',
      commonActionableAr:
          'قد يسبب نعاسًا أو دوخة أو بطء النبض؛ انهض ببطء.',
      missedDoseAr:
          'لا تضاعف الجرعة. إذا فاتت عدة جرعات أو انقطع العلاج اتصل بالطبيب/الصيدلي قبل العودة للجدول السابق.',
      seekHelpAr:
          'اطلب تقييمًا عند إغماء، بطء شديد في النبض مع أعراض أو ارتفاع ضغط شديد مع صداع/أعراض عصبية بعد الانقطاع.',
      teachBackAr:
          'هل يمكن تحويل clonidine العادي إلى ER mg-for-mg؟ ولماذا لا نوقف clonidine فجأة؟',
    ),
  ),
  Medication(
    id: 'methylphenidate-ritalin-la',
    familyId: 'cns',
    name: 'Methylphenidate Extended-Release (RITALIN LA)',
    subtitle: 'ADHD · morning · exact Ritalin BID→LA conversion table',
    tags: ['ADHD', 'Methylphenidate', 'Ritalin LA', 'Extended release', 'Controlled substance'],
    aliases: ['RITALIN LA'],
    sourceLabel:
        'DailyMed · RITALIN LA methylphenidate extended-release capsules · current labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily extended-release methylphenidate capsule for ADHD.',
      foodTiming:
          'Take once daily in the morning. Capsule may be swallowed whole or opened and sprinkled on a spoonful of cool/room-temperature applesauce; swallow immediately without chewing and do not store.',
      duration:
          'Usually chronic/individualized for ADHD with periodic reassessment of benefit, growth/appetite and cardiovascular effects.',
      formulationHandling:
          'Do not crush, chew or divide capsule contents. If sprinkled, take the entire contents immediately and do not use warm applesauce.',
      releaseConversion:
          'For patients taking immediate-release Ritalin twice daily, use the labeled table: 5 mg BID → Ritalin LA 10 mg QAM; 10 mg BID → 20 mg QAM; 15 mg BID → 30 mg QAM; 20 mg BID → 40 mg QAM; 30 mg BID → 60 mg QAM. If switching from other methylphenidate products, discontinue the prior product and titrate Ritalin LA; do not substitute other methylphenidate products milligram-for-milligram because formulations and pharmacokinetics differ.',
      monitoring:
          'ADHD response, appetite/weight/growth, blood pressure/heart rate, sleep, mood/psychosis/tics and misuse risk.',
      interactions:
          'MAOI use or use within 14 days is contraindicated. Review other sympathomimetics and medicines that can raise blood pressure/heart rate.',
      commonMistakes:
          'Using the Ritalin-specific table for a different methylphenidate brand, chewing sprinkled beads, storing the applesauce mixture or taking the dose late in the day.',
      specialPopulations:
          'Growth, appetite and cardiovascular history are especially important in pediatric patients; exact age indications and maximum doses are product-specific.',
    ),
    sections: [
      MedicationSection(
        title: 'Ritalin BID → Ritalin LA table',
        body:
            '5 BID→10 QAM; 10 BID→20 QAM; 15 BID→30 QAM; 20 BID→40 QAM; 30 BID→60 QAM. This table applies to Ritalin immediate-release twice-daily dosing—not to every methylphenidate product.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Other methylphenidate products',
        body:
            'Do not use a milligram-for-milligram switch from other methylphenidate formulations. Stop the prior product and titrate Ritalin LA using clinical judgment.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'RITALIN LA صيغة methylphenidate ممتدة لعلاج ADHD وتؤخذ صباحًا.',
      howToUseAr:
          'ابتلع الكبسولة كاملة، أو افتحها وضع كل الحبيبات على ملعقة applesauce غير ساخنة وابتلعها فورًا دون مضغ. لا تخزن الخليط ولا تقسّم محتوى الكبسولة.',
      timingAr:
          'مرة واحدة صباحًا.',
      importantAr:
          'إذا كنت على Ritalin العادي مرتين يوميًا فهناك جدول تحويل خاص: 5 mg مرتين → 10 mg LA صباحًا، 10×2 → 20 mg، 15×2 → 30 mg، 20×2 → 40 mg، 30×2 → 60 mg. لا تطبق هذا الجدول على أي براند methylphenidate آخر.',
      commonActionableAr:
          'قد يقلل الشهية أو يؤخر النوم أو يرفع النبض/الضغط؛ راقب الطعام والوزن والنوم حسب الخطة.',
      missedDoseAr:
          'لا تضاعف الجرعة ولا تأخذ جرعة متأخرة من نفسك إذا فاتت جرعة الصباح؛ اتبع خطة الطبيب لأن الجرعة المتأخرة قد تؤثر في النوم.',
      seekHelpAr:
          'اطلب المساعدة عند ألم صدر، إغماء، أعراض ذهانية/هوسية جديدة أو تحسس شديد.',
      teachBackAr:
          'هل جدول Ritalin BID→LA يصلح لأي methylphenidate XR آخر؟ وكيف تتعامل مع الحبيبات إذا فتحت الكبسولة؟',
    ),
  ),
  Medication(
    id: 'amphetamine-adderall-xr',
    familyId: 'cns',
    name: 'Mixed Amphetamine Salts Extended-Release (ADDERALL XR)',
    subtitle: 'ADHD · morning · divided IR ADDERALL→same total daily dose XR',
    tags: ['ADHD', 'Amphetamine', 'ADDERALL XR', 'Extended release', 'Controlled substance'],
    aliases: ['ADDERALL XR', 'Mixed amphetamine salts XR'],
    sourceLabel:
        'DailyMed · ADDERALL XR mixed amphetamine salts extended-release capsules · revised Apr 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily mixed amphetamine salts extended-release capsule for ADHD.',
      foodTiming:
          'Take once daily in the morning upon awakening. Capsule may be swallowed whole or opened and sprinkled on applesauce; consume immediately without chewing and do not divide the capsule dose.',
      duration:
          'Usually chronic/individualized for ADHD with periodic reassessment of efficacy, appetite/growth, cardiovascular effects and misuse risk.',
      formulationHandling:
          'Swallow whole or sprinkle the entire capsule contents on applesauce and consume immediately. Do not chew beads and do not take less than one capsule’s full contents.',
      releaseConversion:
          'Patients taking divided doses of immediate-release ADDERALL may be switched to ADDERALL XR once daily at the same total daily dose, then titrated at weekly intervals for efficacy and tolerability. Example: ADDERALL IR 10 mg twice daily = 20 mg/day → ADDERALL XR 20 mg once daily in the morning. This same-dose rule applies to ADDERALL IR → ADDERALL XR and should not be generalized to unrelated amphetamine products with different base compositions or pharmacokinetics.',
      monitoring:
          'ADHD response, appetite/weight/growth, blood pressure/heart rate, sleep, mood/psychosis/tics and abuse/misuse risk.',
      interactions:
          'MAOI use or use within 14 days is contraindicated. Acidifying/alkalinizing agents and other sympathomimetics can alter exposure or cardiovascular effects.',
      commonMistakes:
          'Applying the ADDERALL-specific same-total-dose rule to a different amphetamine product, taking XR late in the day, chewing beads or dividing capsule contents.',
      specialPopulations:
          'Severe renal impairment changes dosing; current labeling does not recommend use in end-stage renal disease.',
    ),
    sections: [
      MedicationSection(
        title: 'ADDERALL IR → XR conversion',
        body:
            'For divided doses of immediate-release ADDERALL, use the same total daily dose as ADDERALL XR once each morning, then titrate weekly as needed.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Brand-specific amphetamine lock',
        body:
            'Do not copy this conversion rule to other amphetamine products whose base composition or pharmacokinetic profile differs.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'ADDERALL XR صيغة ممتدة من mixed amphetamine salts لعلاج ADHD وتؤخذ صباحًا.',
      howToUseAr:
          'ابتلع الكبسولة كاملة، أو افتحها وضع كل المحتوى على applesauce وابتلعه فورًا دون مضغ. لا تقسم محتوى الكبسولة.',
      timingAr:
          'مرة واحدة صباحًا عند الاستيقاظ تقريبًا.',
      importantAr:
          'إذا كنت تستخدم ADDERALL العادي بجرعات مقسمة فيمكن التحويل إلى XR بنفس مجموع الجرعة اليومية: مثال 10 mg مرتين يوميًا = 20 mg/day → 20 mg XR صباحًا. لا تطبق هذا على أي amphetamine product آخر.',
      commonActionableAr:
          'قد يقلل الشهية أو يسبب أرقًا أو يرفع النبض/الضغط؛ راقب النوم والوزن حسب الخطة.',
      missedDoseAr:
          'إذا فاتت جرعة الصباح لا تعوضها بجرعة متأخرة من نفسك ولا تضاعف الجرعة التالية.',
      seekHelpAr:
          'اطلب تقييمًا عند ألم صدر، إغماء، أعراض ذهانية/هوسية جديدة أو علامات جرعة زائدة/إساءة استخدام.',
      teachBackAr:
          'إذا كنت على ADDERALL IR 10 mg مرتين يوميًا، ما total daily dose عند التحويل إلى XR؟ وهل تنطبق القاعدة على كل amphetamine؟',
    ),
  ),
  Medication(
    id: 'tramadol-er-tablets',
    familyId: 'pain-inflammation',
    name: 'Tramadol Extended-Release Tablets',
    subtitle: 'Chronic pain · IR 24-hour dose rounded DOWN to lower 100-mg ER increment',
    tags: ['Pain', 'Tramadol', 'Extended release', 'Opioid', 'Controlled substance'],
    aliases: ['Tramadol ER'],
    sourceLabel:
        'DailyMed · Tramadol hydrochloride extended-release tablets · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily extended-release tramadol for pain severe enough to require an opioid when alternative treatments are inadequate; not an as-needed rescue formulation.',
      foodTiming:
          'Take once daily according to the exact product instructions. Swallow whole; do not split, crush, chew or dissolve.',
      duration:
          'Individualized opioid therapy with frequent reassessment of benefit, function, adverse effects and ongoing need. Avoid abrupt discontinuation in a physically dependent patient.',
      formulationHandling:
          'Swallow ER tablets intact. Crushing, chewing or dissolving can release a potentially dangerous amount rapidly.',
      releaseConversion:
          'For patients currently taking tramadol immediate-release products, calculate the total 24-hour IR tramadol dose and start ER at the next LOWER 100-mg increment. Example: IR total 250 mg/day → ER 200 mg once daily; IR total 300 mg/day → ER 300 mg once daily. Because ER dose flexibility is limited, some patients on IR tramadol cannot be directly converted. Maximum labeled ER dose is 300 mg/day. Do not use other tramadol products concurrently.',
      monitoring:
          'Pain/function, sedation, respiratory depression, constipation, misuse/addiction risk, seizure risk, serotonin-toxicity risk and renal/hepatic status.',
      interactions:
          'Alcohol, benzodiazepines and other CNS depressants increase respiratory/sedation risk. Serotonergic drugs and medicines that lower seizure threshold require careful review.',
      commonMistakes:
          'Rounding the IR total upward instead of downward, using ER for breakthrough pain, combining ER with another tramadol product, crushing ER or stopping abruptly after physical dependence develops.',
      specialPopulations:
          'Renal/hepatic impairment, older age, respiratory disease, seizure disorder and serotonergic polypharmacy materially change risk.',
    ),
    sections: [
      MedicationSection(
        title: 'IR → ER conversion',
        body:
            'Calculate the 24-hour IR tramadol dose and round DOWN to the next lower 100-mg ER increment. Some IR regimens cannot be converted because of limited ER strengths. Never exceed 300 mg/day ER.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Opioid ER safety lock',
        body:
            'Not for PRN breakthrough use. Do not crush/chew/dissolve and do not combine with another tramadol product. Reassess sedation, breathing, misuse risk, serotonin toxicity and seizures after conversion.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'Tramadol ER مسكن ممتد للحالات التي تحتاج علاجًا يوميًا مستمرًا، وليس حبة إسعافية عند اللزوم.',
      howToUseAr:
          'ابتلع حبة ER كاملة. لا تقسّمها أو تسحقها أو تمضغها أو تذيبها.',
      timingAr:
          'مرة واحدة يوميًا حسب الوصفة.',
      importantAr:
          'التحويل من tramadol العادي يتم بجمع كل جرعات 24 ساعة ثم التقريب إلى أقل 100 mg: مثلًا 250 mg/day من IR → 200 mg ER، و300 mg/day → 300 mg ER. بعض الجرعات لا يمكن تحويلها مباشرة، والحد الأقصى للـER المراجع 300 mg/day. لا تجمعه مع tramadol آخر.',
      commonActionableAr:
          'قد يسبب نعاسًا أو دوخة أو إمساكًا؛ تجنب الكحول والمهدئات غير المراجعة، ولا تقد السيارة حتى تعرف تأثيره عليك.',
      missedDoseAr:
          'لا تضاعف أو تأخذ جرعة إضافية لتعويض المنسية؛ اتبع خطة الطبيب لأن زيادة الجرعة قد تسبب تثبيط التنفس أو تشنجات.',
      seekHelpAr:
          'اطلب إسعافًا عند بطء/صعوبة التنفس أو نعاس لا يمكن إيقاظ المريض منه، واطلب تقييمًا سريعًا عند تشنج أو أعراض serotonin toxicity مثل حرارة مع رجفان/هيجان شديد.',
      teachBackAr:
          'إذا كان مجموع tramadol IR هو 250 mg/day، إلى أي جرعة ER نقرّب: 200 أم 300 mg؟ وهل يجوز سحق ER أو استخدامها عند اللزوم؟',
    ),
  ),
];
