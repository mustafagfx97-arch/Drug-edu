import '../models/medication.dart';

const expandedMedications34 = <Medication>[
  Medication(
    id: 'carbamazepine-xr-tablets',
    familyId: 'cns',
    name: 'Carbamazepine Extended-Release Tablets',
    subtitle: 'Epilepsy/neuralgia · BID XR · same total daily dose from conventional tablets',
    tags: ['Epilepsy', 'Carbamazepine', 'XR', 'Extended release', 'High risk'],
    aliases: ['Tegretol XR-type', 'Carbamazepine ER tablets'],
    sourceLabel:
        'DailyMed · Carbamazepine extended-release tablets · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Extended-release carbamazepine tablets for labeled seizure disorders and other labeled carbamazepine indications; XR tablets are generally given twice daily.',
      foodTiming:
          'Take with meals for the reviewed XR-tablet labeling and keep administration conditions consistent.',
      duration:
          'Usually chronic for epilepsy and many neurologic indications; abrupt withdrawal should be avoided.',
      formulationHandling:
          'Swallow XR tablets whole. Do not crush or chew. Inspect for chips/cracks or a missing release portal; damaged tablets should not be taken. The tablet coating may appear in stool.',
      releaseConversion:
          'When converting from conventional carbamazepine tablets to carbamazepine extended-release tablets, use the same total daily milligram dose, administered as the XR regimen (generally twice daily). Example: conventional 200 mg three times daily = 600 mg/day; the XR total remains 600 mg/day, commonly divided 300 mg twice daily if the prescribed strengths permit. Conversion from suspension follows a different rule and should not be collapsed into the tablet-to-XR conversion.',
      monitoring:
          'Seizure control, serum carbamazepine concentration when clinically indicated, CBC, sodium, liver function, rash and neurologic toxicity.',
      interactions:
          'Carbamazepine is a strong enzyme inducer with many clinically important interactions, including reduced effectiveness of many hormonal contraceptives and interactions with anticoagulants and other antiseizure medicines.',
      commonMistakes:
          'Keeping the old immediate-release dosing frequency after switching to XR, crushing XR, confusing tablet-to-XR conversion with suspension conversion, or abruptly stopping therapy.',
      specialPopulations:
          'Genetic screening and severe skin-reaction risk vary by ancestry and clinical context. Hepatic disease, hyponatremia risk and polypharmacy require closer review.',
    ),
    sections: [
      MedicationSection(
        title: 'Conventional tablet → XR conversion',
        body:
            'Use the same total daily carbamazepine milligram dose when converting conventional tablets to XR tablets, but administer the XR regimen twice daily. This rule is formulation-specific and does not mean every carbamazepine dosage form is interchangeable.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'XR integrity lock',
        body:
            'Do not crush or chew. Do not use chipped/cracked tablets or tablets missing the release portal; a visible tablet shell/coating in stool can occur.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'صيغة ممتدة المفعول من carbamazepine للصرع وبعض الاستطبابات الأخرى حسب الوصفة.',
      howToUseAr:
          'ابتلع XR كاملة ولا تسحقها أو تمضغها. افحص الحبة؛ إذا كانت متشققة أو متضررة فلا تستخدمها.',
      timingAr:
          'الـXR في هذا المنتج يؤخذ عادةً مرتين يوميًا ومع الوجبات حسب الوصفة.',
      importantAr:
          'عند التحويل من حبوب carbamazepine العادية إلى XR يبقى مجموع الـmg اليومي نفسه، لكن جدول الجرعات يتغير إلى XR. لا تطبق هذه القاعدة على المعلق أو أي صيغة أخرى من نفسك.',
      commonActionableAr:
          'قد يحدث دوار أو نعاس أو عدم اتزان؛ اعرف تأثيره عليك قبل القيادة.',
      missedDoseAr:
          'لا تضاعف الجرعة. إذا تكرر نسيان الجرعات أو حدثت نوبة بعد التحويل تواصل مع الطبيب/الصيدلي.',
      seekHelpAr:
          'اطلب تقييمًا سريعًا عند طفح جديد، تقرحات بالفم، حرارة غير مفسرة، كدمات/نزف غير معتاد أو زيادة النوبات.',
      teachBackAr:
          'إذا كنت تأخذ 600 mg يوميًا من الحبوب العادية ثم تحولت إلى XR، هل يصبح مجموع الجرعة اليومية 1200 mg؟',
    ),
  ),
  Medication(
    id: 'levetiracetam-xr',
    familyId: 'cns',
    name: 'Levetiracetam Extended-Release (XR)',
    subtitle: 'Partial-onset seizures age ≥12 · once daily · no label-endorsed 1:1 conversion rule',
    tags: ['Epilepsy', 'Levetiracetam', 'XR', 'Extended release', 'Renal dosing'],
    aliases: ['KEPPRA XR', 'Levetiracetam ER'],
    sourceLabel:
        'DailyMed · KEPPRA XR levetiracetam extended-release tablets · current labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily extended-release levetiracetam for partial-onset seizures in patients 12 years of age and older.',
      foodTiming:
          'Take once daily with or without food. Food can delay the peak but does not materially change overall exposure.',
      duration:
          'Usually chronic antiseizure therapy; avoid abrupt withdrawal.',
      formulationHandling:
          'Swallow XR tablets whole. Do not chew, break or crush.',
      releaseConversion:
          'Do not encode a universal automatic IR → XR 1:1 clinical conversion. Pharmacokinetic data show that XR 1000 mg once daily produced exposure comparable to IR 500 mg twice daily, but the KEPPRA XR label explicitly states that the relationship between effectiveness of the same daily dose of XR and immediate-release KEPPRA has not been studied and is unknown. Therefore switching should use a prescriber-defined regimen with renal-dose review and seizure follow-up rather than an auto-conversion rule.',
      monitoring:
          'Seizure control, mood/behavior change, somnolence/dizziness and renal function for dose selection.',
      interactions:
          'Few major pharmacokinetic interactions compared with many antiseizure drugs, but CNS depressant effects and the full regimen still require review.',
      commonMistakes:
          'Assuming similar bioavailability means the label endorses an automatic 1:1 efficacy conversion, crushing XR, or using XR in end-stage renal disease/dialysis without product-specific review.',
      specialPopulations:
          'Dose is adjusted by creatinine clearance. The label recommends immediate-release KEPPRA rather than XR in end-stage renal disease on dialysis.',
    ),
    sections: [
      MedicationSection(
        title: 'IR → XR conversion safety lock',
        body:
            'PK example: XR 1000 mg once daily can produce exposure comparable to IR 500 mg twice daily. However, the label says same-daily-dose effectiveness versus IR has not been studied and is unknown. Do not auto-convert solely by total milligrams.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Renal lock',
        body:
            'Renal function materially changes XR dosing. In end-stage renal disease on dialysis, current labeling recommends using immediate-release KEPPRA instead of KEPPRA XR.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'صيغة XR مرة يوميًا من levetiracetam لعلاج partial-onset seizures من عمر 12 سنة فأكثر حسب الوصفة.',
      howToUseAr:
          'ابتلع XR كاملة مرة يوميًا. لا تكسرها ولا تسحقها ولا تمضغها.',
      timingAr:
          'مرة واحدة يوميًا، مع الطعام أو بدونه، وفي وقت ثابت تقريبًا.',
      importantAr:
          'لا تحول من levetiracetam العادي إلى XR بنفسك لمجرد أن مجموع الـmg يبدو متساويًا؛ التعرّض الدوائي قد يكون مشابهًا لكن الـlabel لا يعتبر فعالية نفس الجرعة اليومية بين الصيغ مثبتة مباشرة.',
      commonActionableAr:
          'قد يحدث نعاس أو دوخة أو تغير بالمزاج/السلوك؛ أخبر الطبيب إذا لاحظت تغيرًا غير معتاد.',
      missedDoseAr:
          'لا تضاعف الجرعة. إذا اقترب موعد التالية تجاوز الفائتة حسب تعليمات وصفتك.',
      seekHelpAr:
          'اطلب المساعدة عند زيادة النوبات، أفكار إيذاء النفس، تورم الوجه/اللسان أو صعوبة التنفس.',
      teachBackAr:
          'هل يجوز لك تحويل 500 mg مرتين يوميًا من IR إلى 1000 mg XR من نفسك فقط لأن مجموع الـmg متساوٍ؟',
    ),
  ),
  Medication(
    id: 'topiramate-qudexy-xr',
    familyId: 'cns',
    name: 'Topiramate Extended-Release (QUDEXY XR)',
    subtitle: 'Epilepsy/migraine prevention · once daily · same-total-daily-dose PK switch evidence',
    tags: ['Epilepsy', 'Migraine prevention', 'Topiramate', 'QUDEXY XR', 'Extended release'],
    aliases: ['QUDEXY XR', 'Topiramate ER sprinkle capsule'],
    sourceLabel:
        'DailyMed · QUDEXY XR topiramate extended-release capsules · Aug 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily topiramate XR for labeled epilepsy indications from age 2 years and migraine prevention from age 12 years.',
      foodTiming:
          'May be taken without regard to meals.',
      duration:
          'Usually chronic for epilepsy or migraine prevention when effective and tolerated.',
      formulationHandling:
          'Capsule may be swallowed whole or opened and the entire contents sprinkled on about one teaspoon of soft food; swallow immediately without chewing/crushing and do not store the mixture.',
      releaseConversion:
          'QUDEXY XR pharmacokinetic studies support switching from immediate-release topiramate every 12 hours to QUDEXY XR once daily at the same total daily dose: steady-state exposure was bioequivalent and concentrations remained similar immediately after the switch in healthy subjects. This is pharmacokinetic switch evidence; indication-specific titration, renal adjustment and clinical follow-up still apply.',
      monitoring:
          'Seizure/migraine control, cognition, mood, bicarbonate/metabolic acidosis risk, kidney stones, hydration, ocular symptoms and weight/growth when relevant.',
      interactions:
          'Review valproate, carbonic-anhydrase inhibitors, enzyme-inducing antiseizure drugs and hormonal contraception. Alcohol can worsen CNS effects; product-specific alcohol restrictions differ from TROKENDI XR.',
      commonMistakes:
          'Assuming all topiramate XR brands have the same capsule handling, chewing sprinkled beads, storing the food mixture, or abruptly stopping therapy.',
      specialPopulations:
          'For creatinine clearance below 70 mL/min/1.73 m², current labeling recommends one-half of the usual adult dose; hemodialysis may require supplementation.',
    ),
    sections: [
      MedicationSection(
        title: 'IR → QUDEXY XR switch',
        body:
            'PK studies support the same total daily topiramate dose when switching IR every 12 hours to QUDEXY XR once daily, with similar exposure immediately after the switch. Clinical indication, renal function and tolerability still govern the final regimen.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'QUDEXY ≠ TROKENDI handling',
        body:
            'QUDEXY XR may be opened and sprinkled on soft food; TROKENDI XR must be swallowed whole and must not be sprinkled. Never copy one brand’s handling instructions to the other.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'صيغة topiramate XR للصرع أو للوقاية من migraine حسب العمر والاستطباب.',
      howToUseAr:
          'يمكن ابتلاع كبسولة QUDEXY XR كاملة، أو فتحها ووضع كل المحتوى على نحو ملعقة صغيرة من طعام طري ثم ابتلاعه فورًا دون مضغ أو سحق. لا تخزن الخليط.',
      timingAr:
          'مرة واحدة يوميًا ويمكن مع الطعام أو بدونه.',
      importantAr:
          'عند التحويل من topiramate العادي كل 12 ساعة إلى QUDEXY XR توجد بيانات دوائية تدعم نفس مجموع الجرعة اليومية مرة واحدة، لكن لا تغيّر الجرعة أو الصيغة دون خطة الطبيب. QUDEXY يمكن فتحها؛ TROKENDI لا.',
      commonActionableAr:
          'قد يحدث بطء بالتفكير أو وخز بالأطراف أو نقص شهية؛ اشرب سوائل كافية لتقليل خطر حصى الكلى.',
      missedDoseAr:
          'إذا نسيت جرعة واحدة خذها عند التذكر حسب تعليمات المنتج؛ إذا فاتتك أكثر من جرعة اتصل بالطبيب/الصيدلي ولا تعوض من نفسك.',
      seekHelpAr:
          'اطلب تقييمًا عاجلًا عند ألم/احمرار بالعين أو تشوش مفاجئ بالرؤية، حرارة مع قلة التعرق، ارتباك شديد أو زيادة النوبات.',
      teachBackAr:
          'هل يجوز فتح QUDEXY XR؟ وهل تستطيع تطبيق نفس الطريقة على TROKENDI XR؟',
    ),
  ),
  Medication(
    id: 'topiramate-trokendi-xr',
    familyId: 'cns',
    name: 'Topiramate Extended-Release (TROKENDI XR)',
    subtitle: 'Epilepsy/migraine prevention · once daily · equivalent-daily-dose switch studies',
    tags: ['Epilepsy', 'Migraine prevention', 'Topiramate', 'TROKENDI XR', 'Extended release'],
    aliases: ['TROKENDI XR', 'Topiramate ER whole capsule'],
    sourceLabel:
        'DailyMed · TROKENDI XR topiramate extended-release capsules · Mar 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily topiramate XR for labeled epilepsy indications and migraine prevention according to age/indication.',
      foodTiming:
          'May be taken without regard to meals.',
      duration:
          'Usually chronic for epilepsy or migraine prevention while benefit and tolerability remain favorable.',
      formulationHandling:
          'Swallow the capsule whole and intact. Do not open, sprinkle, break, crush, dissolve or chew.',
      releaseConversion:
          'Switch studies used an equivalent total daily dose when patients moved from immediate-release topiramate to TROKENDI XR once daily. In epilepsy patients there was about a 10% decrease in AUC/Cmax/Cmin on the first day after switching; at steady state AUC and Cmax were comparable, while patients on enzyme-inducing antiseizure drugs had about a 10% lower Cmin. Therefore the starting total daily dose may be equivalent, but seizure control and interacting enzyme inducers must be reviewed rather than assuming perfect interchangeability.',
      monitoring:
          'Seizure/migraine control, cognition, mood, bicarbonate/metabolic acidosis, renal stones, hydration, ocular symptoms and weight/growth when relevant.',
      interactions:
          'Alcohol is contraindicated within 6 hours before and 6 hours after the dose because it can disrupt extended release. Review valproate, enzyme-inducing antiseizure drugs and hormonal contraception.',
      commonMistakes:
          'Opening/sprinkling TROKENDI XR like QUDEXY XR, drinking alcohol near the dose, or assuming equivalent total daily dose means identical concentration profile on day one.',
      specialPopulations:
          'For creatinine clearance below 70 mL/min/1.73 m², current labeling recommends one-half of the usual adult dose; hemodialysis may require supplementation.',
    ),
    sections: [
      MedicationSection(
        title: 'IR → TROKENDI XR switch',
        body:
            'Studies switched patients using an equivalent total daily topiramate dose. Day-1 exposure was about 10% lower in epilepsy patients; steady-state AUC/Cmax became comparable, with a modest Cmin reduction in patients taking enzyme inducers. Monitor rather than assuming mathematically perfect interchangeability.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Alcohol + whole-capsule lock',
        body:
            'Swallow whole; do not sprinkle. Avoid alcohol completely for 6 hours before and 6 hours after TROKENDI XR because alcohol can markedly alter the release pattern.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'صيغة topiramate XR مرة يوميًا للصرع أو للوقاية من migraine حسب الاستطباب.',
      howToUseAr:
          'ابتلع TROKENDI XR كاملة. لا تفتحها ولا ترشها على الطعام ولا تسحقها أو تمضغها أو تذيبها.',
      timingAr:
          'مرة واحدة يوميًا، مع الطعام أو بدونه. تجنب الكحول تمامًا خلال 6 ساعات قبل الجرعة و6 ساعات بعدها.',
      importantAr:
          'عند التحويل من topiramate العادي قد يبدأ الطبيب بنفس مجموع الجرعة اليومية، لكن التعرض في اليوم الأول قد يختلف قليلًا؛ لذلك لا تبدل الصيغة من نفسك وراقب السيطرة على النوبات.',
      commonActionableAr:
          'قد يحدث بطء بالتفكير أو وخز أو نقص شهية؛ حافظ على سوائل كافية لتقليل خطر حصى الكلى.',
      missedDoseAr:
          'لا تضاعف الجرعة. إذا فاتت أكثر من جرعة تواصل مع الطبيب/الصيدلي قبل العودة للجدول.',
      seekHelpAr:
          'اطلب تقييمًا عاجلًا عند ألم/احمرار بالعين أو تشوش مفاجئ بالرؤية، حرارة مع قلة التعرق، ارتباك شديد أو زيادة النوبات.',
      teachBackAr:
          'هل يمكن فتح TROKENDI XR ورشها على الطعام؟ وما مدة الابتعاد عن الكحول حول الجرعة؟',
    ),
  ),
  Medication(
    id: 'metformin-er-tablets',
    familyId: 'diabetes-endocrine',
    name: 'Metformin Extended-Release Tablets',
    subtitle: 'Type 2 diabetes · evening meal · IR→ER same total daily dose up to 2000 mg QD',
    tags: ['Type 2 diabetes', 'Metformin', 'ER', 'Extended release', 'Evening meal'],
    aliases: ['Metformin XR', 'Metformin ER'],
    sourceLabel:
        'DailyMed · Metformin hydrochloride extended-release tablets · Jul 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Extended-release metformin tablets for type 2 diabetes according to the exact product labeling.',
      foodTiming:
          'For the reviewed standard ER-tablet labeling, take once daily with the evening meal.',
      duration:
          'Usually chronic while effective, tolerated and renal function remains appropriate.',
      formulationHandling:
          'Swallow ER tablets whole. Do not crush, cut or chew.',
      releaseConversion:
          'Patients receiving metformin immediate-release tablets may be switched to metformin extended-release tablets once daily at the same total daily dose, up to 2000 mg once daily for the reviewed ER product. Example: IR 1000 mg twice daily = 2000 mg/day → ER 2000 mg once daily with the evening meal. Do not automatically convert IR totals above 2000 mg/day to a once-daily ER dose; product-specific options differ and may require remaining on or returning to IR.',
      monitoring:
          'A1c/glucose, renal function/eGFR, GI tolerance, vitamin B12 with long-term use when clinically indicated, and acute illness/dehydration risks.',
      interactions:
          'Review iodinated contrast procedures, heavy alcohol use and drugs that worsen renal function or acid-base status.',
      commonMistakes:
          'Crushing ER, taking the entire old IR schedule plus ER, assuming IR doses above 2000 mg/day can always become the same once-daily ER dose, or ignoring renal-function limits.',
      specialPopulations:
          'Do not use if eGFR is below 30 mL/min/1.73 m²; initiation is not recommended at eGFR 30–45 for the reviewed label.',
    ),
    sections: [
      MedicationSection(
        title: 'IR → ER conversion',
        body:
            'For the reviewed standard metformin ER tablets: same total daily dose as IR, once daily with the evening meal, up to 2000 mg once daily. Higher IR totals require product-specific review rather than automatic conversion.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Renal + whole-tablet lock',
        body:
            'Swallow whole; do not crush/cut/chew. Confirm eGFR before and during therapy because renal thresholds determine whether metformin can be initiated or continued.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'صيغة ممتدة المفعول من metformin للمساعدة على ضبط سكر الدم في النوع الثاني.',
      howToUseAr:
          'ابتلع ER كاملة ولا تكسرها أو تسحقها أو تمضغها.',
      timingAr:
          'في المنتج الذي تمت مراجعته تؤخذ مرة يوميًا مع وجبة المساء.',
      importantAr:
          'عند التحويل من metformin العادي إلى ER يمكن عادةً استخدام نفس مجموع الجرعة اليومية حتى 2000 mg مرة يوميًا. إذا كانت جرعتك العادية أكثر من 2000 mg يوميًا فلا تحولها بنفسك إلى جرعة ER واحدة.',
      commonActionableAr:
          'قد يحدث غثيان أو إسهال خاصة في البداية؛ أخذها مع وجبة المساء يساعد على التحمل.',
      missedDoseAr:
          'لا تضاعف الجرعة الفائتة. خذ الجرعة التالية مع وجبتها المعتادة حسب الخطة.',
      seekHelpAr:
          'تواصل طبيًا عند قيء/إسهال شديد مع جفاف، ضيق نفس شديد غير معتاد أو ضعف شديد مستمر خاصة مع مرض كلوي أو مرض حاد.',
      teachBackAr:
          'إذا كنت تستخدم 1000 mg IR مرتين يوميًا، ما مجموع الجرعة اليومية؟ وهل تستطيع تحويل 2500 mg/day إلى ER مرة يوميًا بنفسك؟',
    ),
  ),
  Medication(
    id: 'gliclazide-mr-30mg',
    familyId: 'diabetes-endocrine',
    name: 'Gliclazide Modified-Release 30 mg',
    subtitle: 'Sulfonylurea · breakfast · 80 mg IR ≈ 30 mg MR with glucose monitoring',
    tags: ['Type 2 diabetes', 'Gliclazide', 'MR', 'Modified release', 'Hypoglycemia'],
    aliases: ['Diamicron MR 30 mg', 'Gliclazide MR 30'],
    sourceLabel:
        'emc SmPC · Diamicron 30 mg MR / equivalent gliclazide MR 30 mg',
    reviewStatus: 'Verified against current UK SmPC',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily modified-release gliclazide for type 2 diabetes in adults.',
      foodTiming:
          'Take as a single daily dose at breakfast.',
      duration:
          'Usually chronic while effective and hypoglycemia risk remains acceptable.',
      formulationHandling:
          'For the reviewed 30 mg MR product, swallow the tablet whole. Do not apply instructions from other modified-release strengths/brands unless verified.',
      releaseConversion:
          'For the reviewed Diamicron/gliclazide MR 30 mg labeling, one gliclazide immediate-release 80 mg tablet is comparable to one gliclazide MR 30 mg tablet. Therefore the switch can be performed with careful blood-glucose monitoring. Example: IR 80 mg twice daily (160 mg/day) corresponds to MR 60 mg once daily (two 30 mg MR tablets) under the product conversion principle, with clinical review. Do not treat 80 mg IR as 80 mg MR.',
      monitoring:
          'Glucose/A1c and hypoglycemia, especially during dose conversion or irregular meals.',
      interactions:
          'Other glucose-lowering drugs increase hypoglycemia risk; review interacting medicines and alcohol use.',
      commonMistakes:
          'Assuming the milligram numbers are directly interchangeable, skipping breakfast after taking the dose, or compensating a missed dose by taking extra the next day.',
      specialPopulations:
          'Use caution in older/frail patients, irregular eaters, renal/hepatic impairment and anyone at increased risk of prolonged hypoglycemia.',
    ),
    sections: [
      MedicationSection(
        title: '80 mg IR → 30 mg MR conversion',
        body:
            'One 80 mg immediate-release gliclazide tablet is comparable to one 30 mg MR tablet in the reviewed SmPC. The switch requires careful blood-glucose monitoring; the different milligram strengths are not a typo and must not be converted 1:1.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Other sulfonylurea switch',
        body:
            'When switching from another oral antidiabetic, the prior drug dose and half-life matter. A washout of a few days may be needed after a long-half-life sulfonylurea to avoid additive hypoglycemia.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'صيغة MR من gliclazide للمساعدة على خفض سكر الدم في النوع الثاني.',
      howToUseAr:
          'خذ جرعتك مرة واحدة عند الفطور وابتلع الحبة كاملة حسب تعليمات نفس المنتج.',
      timingAr:
          'مرة واحدة يوميًا مع الفطور.',
      importantAr:
          'التحويل ليس mg مقابل mg: في المنتج الذي تمت مراجعته، 80 mg من gliclazide العادي تقابل تقريبًا 30 mg MR، مع مراقبة السكر بدقة بعد التحويل. لا تحوّل 80 mg IR إلى 80 mg MR.',
      commonActionableAr:
          'أهم خطر عملي هو هبوط السكر، خصوصًا إذا أخذت الجرعة ثم لم تأكل.',
      missedDoseAr:
          'إذا نسيت الجرعة فلا تزد جرعة اليوم التالي لتعويضها.',
      seekHelpAr:
          'اطلب المساعدة عند هبوط سكر شديد مع فقدان وعي/تشنج أو تكرر هبوط السكر.',
      teachBackAr:
          'إذا كنت تستخدم gliclazide 80 mg العادي، هل الجرعة المقابلة تكون 80 mg MR أم 30 mg MR في هذا المنتج؟',
    ),
  ),
];
