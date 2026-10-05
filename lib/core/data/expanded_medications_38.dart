import '../models/medication.dart';

const expandedMedications38 = <Medication>[
  Medication(
    id: 'guanfacine-intuniv-er',
    familyId: 'cns',
    name: 'Guanfacine Extended-Release (INTUNIV)',
    subtitle: 'ADHD · once daily · IR guanfacine is not mg-for-mg interchangeable',
    tags: ['ADHD', 'Guanfacine', 'INTUNIV', 'Extended release', 'Alpha-2 agonist'],
    aliases: ['INTUNIV', 'Guanfacine ER'],
    sourceLabel:
        'DailyMed · INTUNIV guanfacine extended-release tablets · current labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily guanfacine ER for ADHD as monotherapy or adjunctive therapy to stimulants.',
      foodTiming:
          'Take once daily in the morning or evening. Do not administer with a high-fat meal because exposure increases.',
      duration:
          'Often long-term/individualized for ADHD; taper when stopping to reduce rebound hypertension risk.',
      formulationHandling:
          'Swallow ER tablets whole. Do not crush, chew or break.',
      releaseConversion:
          'Do not substitute immediate-release guanfacine with INTUNIV on a milligram-per-milligram basis because the pharmacokinetic profiles differ. When switching from IR guanfacine, discontinue the IR product and start/titrate INTUNIV according to its own regimen: generally start 1 mg once daily and increase by no more than 1 mg/week toward the weight- and response-based target. This is a re-titration, not a same-dose conversion.',
      monitoring:
          'Blood pressure, heart rate, dizziness/syncope, sedation, ADHD response and adherence.',
      interactions:
          'CNS depressants can increase sedation. Strong CYP3A4 inhibitors or inducers can alter guanfacine exposure and may require product-specific dose adjustment.',
      commonMistakes:
          'Copying the IR milligram dose into ER, crushing ER, taking it with a high-fat meal or stopping suddenly.',
      specialPopulations:
          'Use extra caution with hypotension, bradycardia, heart block, dehydration and renal/hepatic impairment.',
    ),
    sections: [
      MedicationSection(
        title: 'IR guanfacine → INTUNIV',
        body:
            'Stop the immediate-release product and titrate INTUNIV using its own ER regimen. Do not convert mg-for-mg.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Taper lock',
        body:
            'When discontinuing INTUNIV, reduce by no more than 1 mg every 3 to 7 days to reduce rebound blood-pressure elevation.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'INTUNIV صيغة ممتدة من guanfacine لعلاج ADHD، وحدها أو مع stimulant حسب الوصفة.',
      howToUseAr:
          'خذها مرة يوميًا صباحًا أو مساءً وابتلع الحبة كاملة. لا تسحقها أو تمضغها أو تكسرها.',
      timingAr:
          'مرة يوميًا. تجنب الوجبة العالية جدًا بالدهون حول الجرعة لأن ذلك قد يزيد امتصاص الدواء.',
      importantAr:
          'لا تحول guanfacine العادي إلى INTUNIV بنفس رقم الـmg؛ الصيغ ليست mg-for-mg interchangeable. عند التحويل يوقف الطبيب العادي ويبدأ INTUNIV بجرعة ER خاصة ثم يرفعها تدريجيًا.',
      commonActionableAr:
          'قد يسبب نعاسًا أو دوخة أو انخفاض ضغط/بطء نبض؛ انهض ببطء واعرف تأثيره عليك قبل القيادة.',
      missedDoseAr:
          'لا تضاعف الجرعة. إذا فاتتك جرعات متتالية اسأل قبل العودة للجرعة السابقة لأن إعادة التدرج قد تكون مطلوبة.',
      seekHelpAr:
          'اطلب تقييمًا عند إغماء، بطء شديد بالنبض مع أعراض أو نعاس شديد غير معتاد.',
      teachBackAr:
          'هل تستطيع استبدال 2 mg guanfacine العادي بـ2 mg INTUNIV تلقائيًا؟',
    ),
  ),
  Medication(
    id: 'clonidine-er-adhd',
    familyId: 'cns',
    name: 'Clonidine Hydrochloride Extended-Release',
    subtitle: 'ADHD · bedtime/BID titration · not mg-for-mg with other clonidine',
    tags: ['ADHD', 'Clonidine', 'Extended release', 'Alpha-2 agonist'],
    aliases: ['Clonidine ER', 'KAPVAY-type ER'],
    sourceLabel:
        'DailyMed · Clonidine hydrochloride extended-release tablets · current labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Extended-release clonidine for ADHD as monotherapy or adjunctive therapy to psychostimulants.',
      foodTiming:
          'May be taken with or without food. ER dosing is product-specific and is commonly split morning/bedtime after titration, with an equal or larger portion at bedtime.',
      duration:
          'Often long-term/individualized for ADHD; taper when discontinuing to reduce rebound hypertension risk.',
      formulationHandling:
          'Swallow ER tablets whole. Do not crush, chew or break because this increases the release rate.',
      releaseConversion:
          'Do not substitute clonidine ER for immediate-release clonidine or other clonidine products on a milligram-per-milligram basis because pharmacokinetic profiles differ and controlled switch data are lacking. For the reviewed ADHD ER label, start 0.1 mg at bedtime, then increase by 0.1 mg/day at weekly intervals as needed; doses are divided twice daily with an equal or higher portion at bedtime. Doses above 0.4 mg/day were not evaluated/recommended for ADHD in the reviewed labeling.',
      monitoring:
          'Blood pressure, heart rate, sedation, dizziness/syncope, ADHD response and adherence.',
      interactions:
          'Other sedatives can increase CNS depression; other rate-slowing or antihypertensive drugs can increase bradycardia/hypotension risk.',
      commonMistakes:
          'Copying an IR clonidine dose into ER, crushing ER, stopping suddenly or placing the larger split dose in the morning instead of bedtime.',
      specialPopulations:
          'Renal impairment may require a lower starting dose and cautious titration. Conduction disease and baseline hypotension require closer monitoring.',
    ),
    sections: [
      MedicationSection(
        title: 'No mg-for-mg clonidine conversion',
        body:
            'ER clonidine is not a direct milligram substitute for immediate-release clonidine. Use the ER ADHD titration regimen rather than copying the prior dose.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Taper lock',
        body:
            'When stopping clonidine ER, taper by no more than 0.1 mg every 3 to 7 days to reduce rebound hypertension.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'صيغة ممتدة من clonidine لعلاج ADHD حسب الوصفة.',
      howToUseAr:
          'ابتلع حبة ER كاملة ولا تسحقها أو تمضغها أو تكسرها.',
      timingAr:
          'يبدأ المنتج المراجع عادةً 0.1 mg وقت النوم ثم تُرفع الجرعة تدريجيًا؛ عند تقسيم الجرعة يكون الجزء المساوي أو الأكبر عادةً وقت النوم.',
      importantAr:
          'لا تحول clonidine العادي إلى ER بنفس رقم الـmg؛ الصيغ ليست interchangeable mg-for-mg ويجب إعادة ضبط الجرعة تدريجيًا.',
      commonActionableAr:
          'قد يسبب نعاسًا أو دوخة أو انخفاض ضغط/بطء نبض.',
      missedDoseAr:
          'لا تضاعف الجرعة، ولا توقف العلاج فجأة لأن الضغط قد يرتفع ارتداديًا.',
      seekHelpAr:
          'اطلب تقييمًا عند إغماء، بطء شديد بالنبض مع أعراض أو نعاس شديد غير معتاد.',
      teachBackAr:
          'لماذا لا يجوز نقل نفس جرعة clonidine العادي مباشرة إلى ER؟',
    ),
  ),
  Medication(
    id: 'amantadine-gocovri',
    familyId: 'cns',
    name: 'Amantadine Extended-Release (GOCOVRI)',
    subtitle: 'Parkinson dyskinesia/OFF · bedtime · not substitutable with other amantadine',
    tags: ['Parkinson', 'Amantadine', 'GOCOVRI', 'Extended release'],
    aliases: ['GOCOVRI'],
    sourceLabel:
        'DailyMed / manufacturer PI · GOCOVRI amantadine ER capsules · current 2026 labeling',
    reviewStatus: 'Verified against current labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Amantadine ER for dyskinesia in Parkinson disease on levodopa-based therapy and as adjunctive treatment for OFF episodes.',
      foodTiming:
          'Take once daily at bedtime, with or without food. Concomitant alcohol is not recommended.',
      duration:
          'Usually chronic/individualized in Parkinson disease; avoid abrupt discontinuation.',
      formulationHandling:
          'Swallow capsule whole or, if needed, carefully open and sprinkle the entire contents on a teaspoonful of soft food such as applesauce; swallow immediately without chewing.',
      releaseConversion:
          'GOCOVRI is not substitutable with other immediate-release or extended-release amantadine products. Do not calculate an IR→GOCOVRI dose by matching milligrams. The reviewed GOCOVRI regimen starts at 137 mg once daily at bedtime and increases after 1 week to 274 mg once daily, with renal-dose modification when indicated.',
      monitoring:
          'Dyskinesia/OFF response, hallucinations, orthostasis/falls, daytime sleepiness, mood/suicidality, impulse-control behaviors, vision changes and renal function.',
      interactions:
          'Avoid alcohol; review anticholinergic burden and drugs/conditions that alter urinary pH.',
      commonMistakes:
          'Using an IR amantadine milligram total as the GOCOVRI dose, taking GOCOVRI in the morning, chewing sprinkled pellets or stopping abruptly.',
      specialPopulations:
          'Renal function substantially affects dosing; end-stage renal disease is contraindicated in current labeling.',
    ),
    sections: [
      MedicationSection(
        title: 'No IR/other ER substitution',
        body:
            'GOCOVRI has its own bedtime regimen and is not substitutable with immediate-release amantadine or other amantadine ER products.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Bedtime product lock',
        body:
            'Initial 137 mg at bedtime for 1 week, then 274 mg at bedtime in patients who do not require renal adjustment.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'GOCOVRI صيغة amantadine ممتدة تستخدم في باركنسون لعلاج dyskinesia أو للمساعدة على تقليل OFF episodes مع levodopa.',
      howToUseAr:
          'خذها وقت النوم. يمكن ابتلاع الكبسولة كاملة أو فتحها ووضع كل المحتوى على كمية صغيرة من طعام طري مثل applesauce ثم ابتلاعه فورًا دون مضغ.',
      timingAr:
          'مرة يوميًا وقت النوم، مع الطعام أو بدونه.',
      importantAr:
          'لا تحول amantadine العادي أو OSMOLEX إلى GOCOVRI بنفس رقم الـmg؛ GOCOVRI له جرعته وجدوله الخاصان وليس substitutable مع صيغ amantadine الأخرى.',
      commonActionableAr:
          'قد يحدث دوار، هبوط ضغط، تورم، إمساك أو hallucinations؛ انتبه للسقوط والنعاس.',
      missedDoseAr:
          'لا تضاعف الجرعة التالية؛ اتبع تعليمات المنتج والطبيب.',
      seekHelpAr:
          'اطلب تقييمًا عند hallucinations شديدة، سلوك اندفاعي جديد، إغماء، أفكار إيذاء النفس أو تغير جديد مهم بالرؤية.',
      teachBackAr:
          'هل يمكنك تحويل amantadine 100 mg مرتين يوميًا مباشرةً إلى GOCOVRI 200 mg؟',
    ),
  ),
  Medication(
    id: 'amantadine-osmolex-er',
    familyId: 'cns',
    name: 'Amantadine Extended-Release (OSMOLEX ER)',
    subtitle: 'Parkinson/EPS · morning · not interchangeable with other amantadine',
    tags: ['Parkinson', 'Amantadine', 'OSMOLEX ER', 'Extended release'],
    aliases: ['OSMOLEX ER'],
    sourceLabel:
        'DailyMed · OSMOLEX ER amantadine extended-release tablets · current labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily amantadine ER for Parkinson disease and drug-induced extrapyramidal reactions in adults.',
      foodTiming:
          'Take in the morning, with or without food.',
      duration:
          'Usually chronic/individualized; avoid abrupt discontinuation.',
      formulationHandling:
          'Swallow tablet whole. Do not chew, crush or divide. The tablet shell may appear in stool.',
      releaseConversion:
          'OSMOLEX ER is not interchangeable with other immediate-release or extended-release amantadine products. Do not auto-convert by matching milligrams. The reviewed starting regimen is 129 mg once daily in the morning, increased at weekly intervals when appropriate up to 322 mg/day. For patients unable to tolerate more than 100 mg/day of immediate-release amantadine, the label states there is no equivalent OSMOLEX ER dose or regimen.',
      monitoring:
          'Parkinson/EPS response, hallucinations, orthostasis, sleep attacks, impulse-control symptoms and renal function.',
      interactions:
          'Review anticholinergic burden, alcohol use, live attenuated influenza vaccine and drugs/conditions affecting urinary pH.',
      commonMistakes:
          'Switching from IR or GOCOVRI by milligram matching, taking OSMOLEX at bedtime, crushing/dividing the tablet or ignoring renal-frequency changes.',
      specialPopulations:
          'Renal impairment changes titration interval and dosing frequency: moderate impairment may require every-48-hour dosing and severe impairment every-96-hour dosing; ESRD is contraindicated.',
    ),
    sections: [
      MedicationSection(
        title: 'No amantadine auto-conversion',
        body:
            'OSMOLEX ER is explicitly not interchangeable with immediate-release amantadine or other ER amantadine products.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'IR tolerance lock',
        body:
            'If the patient cannot tolerate more than 100 mg/day of immediate-release amantadine, current labeling states there is no equivalent OSMOLEX ER dose or regimen.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'OSMOLEX ER صيغة amantadine ممتدة تستخدم لباركنسون أو بعض الأعراض الحركية الناتجة عن الأدوية.',
      howToUseAr:
          'خذ الحبة صباحًا وابتلعها كاملة. لا تسحقها أو تمضغها أو تقسمها. قد يظهر غلاف الحبة في البراز وهذا قد يكون طبيعيًا.',
      timingAr:
          'مرة صباحًا حسب وظيفة الكلى؛ بعض حالات ضعف الكلى تحتاج فاصلًا أطول بين الجرعات.',
      importantAr:
          'لا تحول amantadine العادي أو GOCOVRI إلى OSMOLEX بنفس رقم الـmg. وإذا لم تتحمل أكثر من 100 mg/day من amantadine العادي فلا يوجد في الملصق جرعة OSMOLEX مكافئة مباشرة.',
      commonActionableAr:
          'قد يحدث دوار أو نعاس مفاجئ أو hallucinations؛ انتبه للقيادة والسقوط.',
      missedDoseAr:
          'إذا نسيت الجرعة فلا تعوضها؛ خذ الجرعة المعتادة التالية صباحًا حسب جدولك.',
      seekHelpAr:
          'اطلب تقييمًا عند hallucinations شديدة، إغماء، نوم مفاجئ أثناء النشاط أو سلوك اندفاعي جديد.',
      teachBackAr:
          'هل OSMOLEX وGOCOVRI وamantadine العادي interchangeable بنفس الـmg؟',
    ),
  ),
  Medication(
    id: 'tramadol-er',
    familyId: 'cns',
    name: 'Tramadol Extended-Release',
    subtitle: 'Chronic severe pain · IR 24-hour dose rounded down to next 100 mg',
    tags: ['Pain', 'Tramadol', 'Opioid', 'Extended release', 'Controlled substance'],
    aliases: ['Tramadol ER', 'Tramadol XR'],
    sourceLabel:
        'DailyMed · Tramadol hydrochloride extended-release tablets/capsules · current labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily extended-release tramadol for pain severe enough to require daily, around-the-clock, long-term opioid treatment when alternatives are inadequate.',
      foodTiming:
          'Take once daily at a consistent time. Exact food instructions can differ by ER product; verify the dispensed label.',
      duration:
          'Individualized long-term opioid therapy only when benefits outweigh risks; regularly reassess need and taper rather than abruptly stopping after physical dependence develops.',
      formulationHandling:
          'Swallow ER dosage forms whole unless the exact product label states otherwise. Do not crush, chew or dissolve because dose dumping can cause overdose.',
      releaseConversion:
          'For patients maintained on tramadol immediate-release products, calculate the total 24-hour IR tramadol dose and start tramadol ER once daily at the next lower 100-mg increment. Example: IR total 250 mg/day → ER 200 mg once daily; IR total 300 mg/day → ER 300 mg once daily. The reviewed ER maximum is 300 mg/day. Some IR patients cannot be converted because of limited ER strengths. Do not use a conversion ratio from other opioids to tramadol ER; no established clinical-trial conversion ratio exists.',
      monitoring:
          'Pain/function, sedation, respiratory depression, constipation, seizure risk, serotonin toxicity, misuse, renal/hepatic function and concurrent CNS depressants.',
      interactions:
          'Major risks include alcohol/benzodiazepines/other CNS depressants, serotonergic drugs and MAO inhibitors. CYP interactions can alter tramadol/M1 exposure.',
      commonMistakes:
          'Rounding the IR total upward instead of downward, exceeding 300 mg/day ER, continuing scheduled IR tramadol on top of ER, crushing ER or applying an opioid conversion ratio that is not established.',
      specialPopulations:
          'Renal/hepatic impairment and older age can materially alter suitability and dosing. Seizure disorders and serotonergic polypharmacy increase risk.',
    ),
    sections: [
      MedicationSection(
        title: 'IR → ER conversion',
        body:
            'Calculate the 24-hour IR tramadol dose, then round DOWN to the next lower 100-mg ER dose once daily. Example: 250 mg/day IR → 200 mg ER once daily. Maximum reviewed ER dose: 300 mg/day.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Other opioids conversion lock',
        body:
            'There is no established clinical-trial conversion ratio from other opioids to tramadol ER. Do not invent an equianalgesic switch.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'صيغة ممتدة من tramadol للألم الشديد المزمن عندما تكون هناك حاجة لعلاج opioid يومي مستمر.',
      howToUseAr:
          'خذها مرة يوميًا حسب الوصفة وابتلع الشكل الممتد كاملًا؛ لا تسحقه أو تمضغه أو تذبه لأن ذلك قد يطلق الجرعة بسرعة ويسبب overdose.',
      timingAr:
          'مرة واحدة يوميًا في وقت ثابت تقريبًا حسب منتجك.',
      importantAr:
          'عند التحويل من tramadol العادي نجمع كل جرعة 24 ساعة ثم ننزل إلى أقرب 100 mg أقل: مثلًا 250 mg/day من العادي → 200 mg ER once daily، وليس 300 mg. الحد الأعلى للمنتج المراجع 300 mg/day.',
      commonActionableAr:
          'قد يسبب نعاسًا أو دوخة أو غثيانًا أو إمساكًا. تجنب الكحول والمهدئات غير الموصوفة.',
      missedDoseAr:
          'لا تضاعف جرعة ER ولا تعوضها بجرعات إضافية من tramadol العادي من نفسك.',
      seekHelpAr:
          'اطلب إسعافًا عند بطء/صعوبة التنفس أو نعاس شديد لا يمكن إيقاظك منه، واطلب تقييمًا عاجلًا عند تشنج أو أعراض serotonin toxicity مثل هياج مع تعرق ورجفان وحرارة.',
      teachBackAr:
          'إذا كان مجموع tramadol العادي 250 mg/day، هل تبدأ ER 300 mg أم 200 mg حسب قاعدة التحويل؟',
    ),
  ),
];
