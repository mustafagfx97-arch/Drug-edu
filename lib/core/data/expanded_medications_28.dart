import '../models/medication.dart';

const expandedMedications28 = <Medication>[
  Medication(
    id: 'trazodone-ir-tablets',
    familyId: 'cns',
    name: 'Trazodone Immediate-Release Tablets',
    subtitle: 'Depression · shortly after meal/light snack · sedation/orthostasis',
    tags: ['Depression', 'Antidepressant', 'Trazodone', 'Food timing'],
    aliases: ['Trazodone HCl tablets'],
    sourceLabel:
        'DailyMed · Trazodone hydrochloride tablets · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Immediate-release oral trazodone tablets used for major depressive disorder; dosing may be divided and individualized.',
      foodTiming:
          'Take shortly after a meal or light snack.',
      duration:
          'Usually continued for months or longer when effective; duration is individualized and abrupt discontinuation should be avoided.',
      formulationHandling:
          'Swallow whole or break only along the score line when the exact tablet is scored. Do not chew or crush.',
      monitoring:
          'Mood/suicidality early in treatment or after dose changes, sedation, orthostatic symptoms and clinically important serotonin/QT risk.',
      interactions:
          'Do not combine with MAOIs. Review other serotonergic drugs, CNS depressants and medicines that increase bleeding or QT risk.',
      commonMistakes:
          'Taking on an empty stomach, using it only as a sleeping pill without confirming the treatment plan, driving despite sedation, or stopping suddenly after regular use.',
      specialPopulations:
          'Falls/orthostasis risk is especially important in older adults. Bipolar history requires monitoring for mania/hypomania.',
    ),
    sections: [
      MedicationSection(
        title: 'Meal timing matters',
        body:
            'Immediate-release trazodone tablets should be taken shortly after a meal or light snack; do not convert this to a fasting instruction.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Actionable red flags',
        body:
            'Serotonin syndrome, syncope/marked orthostasis, severe rhythm symptoms and prolonged painful erection require urgent assessment.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'مضاد اكتئاب. قد يسبب النعاس لذلك يحدد الطبيب وقت الجرعة أو تقسيمها حسب الخطة.',
      howToUseAr:
          'خذ الجرعة كما وُصفت لك. إذا كانت الحبة scored فيمكن تقسيمها على خط التقسيم عند الحاجة؛ لا تمضغها أو تسحقها.',
      timingAr:
          'خذ trazodone بعد الوجبة أو snack خفيف بقليل، وليس على معدة فارغة.',
      importantAr:
          'قد يسبب نعاسًا أو دوخة عند الوقوف؛ لا تقد السيارة حتى تعرف تأثيره عليك، ولا توقفه فجأة بعد الاستخدام المنتظم.',
      commonActionableAr:
          'النعاس والدوخة وجفاف الفم قد تحدث. انهض ببطء من الجلوس أو النوم.',
      missedDoseAr:
          'لا تضاعف الجرعة لتعويض جرعة فائتة؛ اتبع خطة الطبيب/الصيدلي حسب جدولك.',
      seekHelpAr:
          'اطلب مساعدة عاجلة عند إغماء شديد، أعراض serotonin syndrome، أفكار انتحارية جديدة/متفاقمة، أو انتصاب مؤلم يستمر ساعات.',
      teachBackAr:
          'متى ستأخذ الجرعة بالنسبة للطعام؟ وهل ستقود إذا سببت لك نعاسًا؟',
    ),
  ),
  Medication(
    id: 'lurasidone-tablets',
    familyId: 'cns',
    name: 'Lurasidone Tablets',
    subtitle: 'Schizophrenia/bipolar depression · ≥350 kcal meal',
    tags: ['Schizophrenia', 'Bipolar depression', 'Antipsychotic', 'Food calories'],
    aliases: ['Latuda-type', 'Lurasidone HCl tablets'],
    sourceLabel:
        'DailyMed · Lurasidone hydrochloride tablets · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Oral atypical antipsychotic used for schizophrenia and bipolar depression in labeled populations.',
      foodTiming:
          'Take with food containing at least 350 calories. Food substantially increases absorption.',
      duration:
          'Usually long-term when effective; duration and dose depend on diagnosis, response and tolerability.',
      formulationHandling:
          'Use the exact tablet strength prescribed. Do not improvise dose changes around meals.',
      monitoring:
          'Akathisia, sedation, orthostasis, metabolic parameters and abnormal movements; monitor mood/suicidality in bipolar depression.',
      interactions:
          'Strong CYP3A4 inhibitors and strong CYP3A4 inducers are contraindicated. Avoid grapefruit/grapefruit juice; moderate CYP3A4 interactions may require dose adjustment.',
      commonMistakes:
          'Taking it with only coffee or a very small snack, skipping food, combining with clarithromycin/azole therapy without interaction review, or stopping abruptly.',
      specialPopulations:
          'Renal/hepatic impairment can lower the maximum recommended dose. Not approved for dementia-related psychosis.',
    ),
    sections: [
      MedicationSection(
        title: '350-calorie lock',
        body:
            'Lurasidone must be taken with at least 350 calories. A tiny snack is not an equivalent substitute because absorption is food-dependent.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'CYP3A4 lock',
        body:
            'Strong CYP3A4 inhibitors/inducers are contraindicated; grapefruit should be avoided and moderate interactions require dose review.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يستخدم لعلاج schizophrenia وبعض حالات bipolar depression.',
      howToUseAr:
          'خذ الجرعة مرة يوميًا حسب الوصفة ولا تغير الجرعة بنفسك.',
      timingAr:
          'يجب أن تؤخذ مع وجبة أو طعام يحتوي على 350 سعرة حرارية على الأقل؛ القهوة أو snack صغير جدًا لا يكفي.',
      importantAr:
          'تجنب grapefruit. أخبر الصيدلي إذا وُصف لك clarithromycin أو antifungal azole أو rifampin/carbamazepine/phenytoin لأن التداخل قد يكون مهمًا جدًا.',
      commonActionableAr:
          'قد يحدث نعاس أو دوخة أو restlessness/akathisia. إذا صعب عليك الجلوس بهدوء أو حدثت حركات غير طبيعية فراجع الطبيب.',
      missedDoseAr:
          'لا تضاعف الجرعة. إذا فاتتك جرعة فاسأل عن أفضل وقت للجرعة التالية حسب وقت الوجبة.',
      seekHelpAr:
          'اطلب مساعدة عند حرارة مع تيبس/ارتباك، حركات غير طبيعية شديدة، إغماء شديد أو أفكار انتحارية جديدة.',
      teachBackAr:
          'كم سعرة تقريبًا يجب أن يحتوي الطعام مع الجرعة؟ وما الأدوية التي يجب أن تخبر الصيدلي عنها قبل جمعها معه؟',
    ),
  ),
  Medication(
    id: 'ziprasidone-capsules',
    familyId: 'cns',
    name: 'Ziprasidone Capsules',
    subtitle: 'Schizophrenia/bipolar I · twice daily with food · QT lock',
    tags: ['Schizophrenia', 'Bipolar I', 'Antipsychotic', 'With food', 'QT'],
    aliases: ['Geodon-type capsules', 'Ziprasidone HCl'],
    sourceLabel:
        'DailyMed · Ziprasidone hydrochloride capsules · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Oral atypical antipsychotic capsule for schizophrenia and selected bipolar I regimens.',
      foodTiming:
          'Administer with food. Many labeled regimens are twice daily.',
      duration:
          'Usually long-term when effective; regimen depends on diagnosis and maintenance plan.',
      formulationHandling:
          'Swallow capsules whole. Do not open, crush or chew.',
      monitoring:
          'QT/arrhythmia risk, potassium/magnesium when clinically indicated, sedation/orthostasis and abnormal movements.',
      interactions:
          'Avoid other drugs with established QT-prolonging risk where contraindicated; correct clinically significant hypokalemia/hypomagnesemia and review interacting therapy.',
      commonMistakes:
          'Taking it fasting, opening the capsule, forgetting both daily doses need food, or combining multiple QT-prolonging medicines without review.',
      specialPopulations:
          'Contraindicated in known QT prolongation, recent acute MI, uncompensated heart failure and with certain QT-prolonging medicines.',
    ),
    sections: [
      MedicationSection(
        title: 'Food lock',
        body:
            'Ziprasidone capsules are administered with food; do not label the meal as optional.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'QT safety',
        body:
            'Review QT-prolonging drugs and clinically important electrolyte disturbances before and during treatment when relevant.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يستخدم لعلاج schizophrenia وبعض حالات bipolar I.',
      howToUseAr:
          'ابتلع الكبسولة كاملة ولا تفتحها أو تسحقها أو تمضغها.',
      timingAr:
          'خذ كل جرعة مع الطعام حسب جدولك، وغالبًا تكون الجرعات مرتين يوميًا.',
      importantAr:
          'أخبر الطبيب/الصيدلي إذا لديك مشكلة rhythm/QT أو تستخدم أدوية أخرى قد تطيل QT.',
      commonActionableAr:
          'قد يحدث نعاس أو دوخة. انهض ببطء ولا تقد السيارة حتى تعرف تأثيره.',
      missedDoseAr:
          'لا تأخذ جرعتين معًا لتعويض جرعة فائتة؛ حافظ على الجرعة التالية مع الطعام.',
      seekHelpAr:
          'اطلب المساعدة عند خفقان شديد مع دوخة/إغماء، حرارة مع تيبس وارتباك، أو حركات لا إرادية شديدة.',
      teachBackAr:
          'هل ستأخذ الجرعة مع الطعام أم بدونه؟ وهل يجوز فتح الكبسولة؟',
    ),
  ),
  Medication(
    id: 'quetiapine-xr',
    familyId: 'cns',
    name: 'Quetiapine Extended-Release (XR)',
    subtitle: 'XR · evening · fasting or light meal ≈300 kcal · swallow whole',
    tags: ['Schizophrenia', 'Bipolar', 'Depression adjunct', 'XR', 'Evening'],
    aliases: ['SEROQUEL XR', 'Quetiapine extended-release'],
    sourceLabel:
        'DailyMed · SEROQUEL XR / quetiapine extended-release · current labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily extended-release quetiapine used for several psychiatric indications.',
      foodTiming:
          'Take without food or with a light meal of approximately 300 calories.',
      duration:
          'Usually long-term when effective; indication-specific dose and duration require follow-up.',
      formulationHandling:
          'Swallow XR tablets whole. Do not split, chew or crush.',
      releaseConversion:
          'Patients already taking immediate-release quetiapine may be switched to quetiapine XR at the equivalent total daily dose taken once daily. Individual dose adjustment may still be necessary.',
      monitoring:
          'Sedation, orthostasis/falls, weight, glucose/lipids and abnormal movements.',
      interactions:
          'Strong CYP3A4 inhibitors/inducers can markedly change exposure; alcohol and other CNS depressants increase impairment.',
      commonMistakes:
          'Treating XR like immediate-release quetiapine, taking with a large/high-calorie meal, crushing XR tablets or changing to daytime dosing despite marked sedation without review.',
      specialPopulations:
          'Older adults and hepatic impairment require lower/slower titration. Not approved for dementia-related psychosis.',
    ),
    sections: [
      MedicationSection(
        title: 'IR → XR conversion',
        body:
            'Current labeling allows a direct IR → XR switch using the same total daily quetiapine dose, given once daily as XR; reassess tolerability and clinical response after the switch.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'XR ≠ immediate release',
        body:
            'SEROQUEL XR-type tablets are once daily, preferably evening, and have a specific food rule. Do not generalize immediate-release instructions to XR.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Whole-tablet lock',
        body:
            'Take without food or with a light meal (~300 calories) and swallow whole; do not split, chew or crush.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يستخدم في schizophrenia وbipolar وبعض حالات depression كعلاج مساعد حسب الوصفة.',
      howToUseAr:
          'ابتلع حبة XR كاملة. لا تكسرها أو تمضغها أو تسحقها.',
      timingAr:
          'مرة يوميًا ويفضل مساءً، بدون طعام أو مع وجبة خفيفة حوالي 300 سعرة؛ لا تأخذها مع وجبة كبيرة.',
      importantAr:
          'قد تسبب نعاسًا ودوخة عند الوقوف؛ تجنب القيادة والكحول حتى تعرف تأثيرها.',
      commonActionableAr:
          'النعاس وزيادة الشهية/الوزن والدوخة قد تحدث؛ راقب الوزن والمتابعة الاستقلابية حسب الخطة.',
      missedDoseAr:
          'لا تضاعف جرعة XR. إذا فاتتك الجرعة فراجع التوقيت المناسب للجرعة التالية.',
      seekHelpAr:
          'اطلب المساعدة عند حرارة مع تيبس/ارتباك، إغماء شديد، أو حركات لا إرادية جديدة ومستمرة.',
      teachBackAr:
          'متى ستأخذ XR؟ وما حجم الوجبة المسموح بها؟ وهل يجوز سحقها؟',
    ),
  ),
  Medication(
    id: 'oxcarbazepine-oxtellar-xr',
    familyId: 'cns',
    name: 'Oxcarbazepine Extended-Release (OXTELLAR XR)',
    subtitle: 'Seizures · once daily empty stomach · whole tablet',
    tags: ['Epilepsy', 'Seizures', 'Oxcarbazepine', 'XR', 'Empty stomach'],
    aliases: ['OXTELLAR XR'],
    sourceLabel:
        'DailyMed · OXTELLAR XR oxcarbazepine extended-release tablets · current labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily extended-release oxcarbazepine for partial-onset seizures in labeled patients.',
      foodTiming:
          'Take on an empty stomach: at least 1 hour before or at least 2 hours after meals.',
      duration:
          'Chronic antiseizure therapy when effective; do not stop abruptly.',
      formulationHandling:
          'Swallow whole. Do not cut, crush or chew.',
      releaseConversion:
          'When converting immediate-release oxcarbazepine to OXTELLAR XR, higher OXTELLAR XR doses may be necessary. The label does not provide a universal fixed mg-for-mg conversion ratio.',
      monitoring:
          'Serum sodium when clinically indicated, seizure control, dizziness/somnolence, serious skin reactions and hypersensitivity.',
      interactions:
          'Can affect hormonal contraceptive efficacy and interact with other antiseizure drugs; review full medication list.',
      commonMistakes:
          'Taking XR with food, cutting the tablet, substituting directly for immediate-release oxcarbazepine mg-for-mg, or stopping abruptly.',
      specialPopulations:
          'Renal impairment and conversion from immediate-release oxcarbazepine require product-specific dosing.',
    ),
    sections: [
      MedicationSection(
        title: 'IR → XR conversion',
        body:
            'Do not force a 1:1 rule. The OXTELLAR XR label specifically warns that a higher XR dose may be required after conversion from immediate-release oxcarbazepine; titrate from the product-specific regimen and monitor seizure control/tolerability.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Empty-stomach XR lock',
        body:
            'OXTELLAR XR is once daily on an empty stomach: ≥1 hour before or ≥2 hours after meals. Food can increase peak exposure and adverse effects.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Do not crush/stop abruptly',
        body:
            'Swallow whole; do not cut, chew or crush. Abrupt antiseizure withdrawal can precipitate serious seizures.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'دواء للسيطرة على partial-onset seizures.',
      howToUseAr:
          'خذ حبة XR كاملة مرة يوميًا. لا تقطعها أو تسحقها أو تمضغها.',
      timingAr:
          'على معدة فارغة: قبل الطعام بساعة على الأقل أو بعده بساعتين على الأقل.',
      importantAr:
          'لا توقف الدواء فجأة. أخبر الصيدلي إذا تستخدم موانع حمل هرمونية لأن فعاليتها قد تتأثر.',
      commonActionableAr:
          'قد يحدث دوار أو نعاس أو عدم توازن. نقص الصوديوم قد يسبب غثيانًا، تعبًا، ارتباكًا أو زيادة النوبات.',
      missedDoseAr:
          'لا تضاعف الجرعة. إذا فاتتك جرعة، اتبع خطة الصرع الخاصة بك أو تواصل مع الصيدلي/الطبيب.',
      seekHelpAr:
          'اطلب المساعدة عند طفح شديد، تورم الوجه/صعوبة تنفس، ارتباك شديد أو زيادة واضحة في النوبات.',
      teachBackAr:
          'متى ستأخذ XR بالنسبة للطعام؟ وهل يجوز تقسيم الحبة أو إيقافها فجأة؟',
    ),
  ),
  Medication(
    id: 'carbidopa-levodopa-rytary',
    familyId: 'cns',
    name: 'Carbidopa / Levodopa Extended-Release (RYTARY)',
    subtitle: 'Parkinson · formulation-specific · high-fat meal delays onset',
    tags: ['Parkinson', 'Levodopa', 'RYTARY', 'Extended release', 'Food timing'],
    aliases: ['RYTARY', 'Carbidopa levodopa ER capsules'],
    sourceLabel:
        'DailyMed · RYTARY carbidopa/levodopa extended-release capsules · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Extended-release carbidopa/levodopa capsules for Parkinson disease and related parkinsonism.',
      foodTiming:
          'May be taken with or without food, but a high-fat/high-calorie meal may delay levodopa absorption by about 2 hours. The label notes considering the first dose 1–2 hours before eating.',
      duration:
          'Chronic therapy with individualized dosing; avoid sudden discontinuation or rapid dose reduction.',
      formulationHandling:
          'Do not chew, divide or crush. If swallowing is difficult, open the capsule and sprinkle all contents on 1–2 tablespoons applesauce; consume immediately and do not store.',
      releaseConversion:
          'RYTARY is not 1:1 with immediate-release carbidopa/levodopa. Convert by current total daily levodopa: IR 400–549 mg/day → RYTARY 855 mg levodopa/day (23.75/95 ×3 capsules TID); 550–749 → 1,140 mg/day (23.75/95 ×4 TID); 750–949 → 1,305 mg/day (36.25/145 ×3 TID); 950–1,249 → 1,755 mg/day (48.75/195 ×3 TID); ≥1,250 → 2,340 mg/day (48.75/195 ×4 TID) OR 2,205 mg/day (61.25/245 ×3 TID). Patients also taking a COMT inhibitor may need a higher initial RYTARY levodopa dose.',
      monitoring:
          'Motor response, dyskinesia, hallucinations, orthostasis, sudden sleep episodes and impulse-control symptoms.',
      interactions:
          'Nonselective MAO inhibitors are contraindicated within 2 weeks. Iron salts can reduce levodopa absorption; high-protein meals may also affect response in some patients.',
      commonMistakes:
          'Assuming RYTARY is mg-for-mg interchangeable with immediate-release carbidopa/levodopa, taking with a heavy breakfast then reporting delayed onset, crushing capsules, or abruptly stopping.',
      specialPopulations:
          'Conversion from other carbidopa/levodopa products uses a product-specific table; doses are not interchangeable.',
    ),
    sections: [
      MedicationSection(
        title: 'IR → XR conversion',
        body:
            'Use the label conversion table, not milligram matching. Calculate the current total daily IR levodopa first, then choose the corresponding RYTARY starting regimen; doses are subsequently individualized. Concomitant COMT inhibitor therapy can increase the initial RYTARY requirement.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'RYTARY is not interchangeable',
        body:
            'RYTARY doses are not interchangeable with other carbidopa/levodopa products. Conversion must use product-specific instructions.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Food + sprinkle technique',
        body:
            'Food is allowed, but a high-fat/high-calorie meal may delay onset ~2 hours. If needed, open and sprinkle all capsule contents on 1–2 tablespoons applesauce and take immediately.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يعوض dopamine عبر levodopa لتحسين أعراض Parkinson مثل البطء والتيبس والحركة.',
      howToUseAr:
          'لا تمضغ أو تسحق أو تقسم الكبسولة. إذا تعذر البلع افتحها وانثر كل المحتوى على 1–2 ملعقة طعام applesauce وتناوله فورًا دون حفظه.',
      timingAr:
          'يمكن مع الطعام أو بدونه، لكن الوجبة عالية الدهون والسعرات قد تؤخر بدء المفعول حوالي ساعتين؛ أحيانًا تُفضّل الجرعة الأولى قبل الأكل بـ1–2 ساعة حسب الخطة.',
      importantAr:
          'RYTARY ليست مساوية mg-for-mg لـcarbidopa/levodopa العادي. لا توقفها فجأة.',
      commonActionableAr:
          'قد يحدث غثيان أو دوخة أو dyskinesia. أخبر الطبيب عن hallucinations أو رغبات اندفاعية جديدة مثل القمار أو الإنفاق.',
      missedDoseAr:
          'لا تضاعف جرعة فائتة؛ لأن جدول RYTARY فردي، اتبع خطة الطبيب أو اتصل بالصيدلي.',
      seekHelpAr:
          'اطلب المساعدة عند نوم مفاجئ خطير، hallucinations شديدة، حركات لا إرادية شديدة أو تدهور حاد بعد إيقاف/خفض مفاجئ.',
      teachBackAr:
          'هل RYTARY تعادل جرعة levodopa العادية mg-for-mg؟ وماذا تفعل إذا لم تستطع بلع الكبسولة؟',
    ),
  ),
  Medication(
    id: 'rivastigmine-transdermal',
    familyId: 'cns',
    name: 'Rivastigmine Transdermal System',
    subtitle: 'Alzheimer/Parkinson dementia · one patch every 24 h · rotate sites',
    tags: ['Alzheimer', 'Parkinson dementia', 'Rivastigmine', 'Patch', 'Device'],
    aliases: ['EXELON PATCH', 'Rivastigmine patch'],
    hasVisualGuide: true,
    sourceLabel:
        'DailyMed · Rivastigmine transdermal system / EXELON PATCH · current labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily transdermal cholinesterase inhibitor for Alzheimer disease and Parkinson disease dementia in labeled populations.',
      foodTiming:
          'No meal relationship. Replace the patch every 24 hours at a consistent time of day.',
      duration:
          'Chronic treatment while benefit outweighs risk.',
      formulationHandling:
          'Use one patch at a time. Remove the old patch first. Apply to clean, dry, hairless intact skin on upper/lower back; if inaccessible, upper arm or chest. Rotate location and do not reuse the exact same spot for at least 14 days.',
      monitoring:
          'Weight, nausea/vomiting, bradycardia/syncope, skin reactions and adherence/patch duplication.',
      interactions:
          'Additive bradycardia with beta-blockers and additive cholinergic effects may matter clinically.',
      commonMistakes:
          'Leaving the old patch on, wearing two patches, applying over lotion, reusing the same exact spot too soon, or restarting the prior high strength after a long interruption.',
      specialPopulations:
          'If treatment is interrupted for more than 3 days, restart at 4.6 mg/24 h and re-titrate. Low body weight and hepatic impairment may require lower maintenance exposure.',
    ),
    sections: [
      MedicationSection(
        title: 'One-patch rule',
        body:
            'Remove yesterday’s patch before applying today’s patch. Only one patch should be worn at a time; duplicate patches can cause serious toxicity.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Interruption >3 days',
        body:
            'If therapy is interrupted for more than 3 days, do not simply resume the previous strength; restart 4.6 mg/24 h and re-titrate.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يستخدم لتحسين الأعراض المعرفية في Alzheimer disease وبعض حالات Parkinson dementia.',
      howToUseAr:
          'انزع patch القديمة أولًا. ضع patch واحدة فقط على جلد نظيف وجاف وسليم وقليل الشعر في الظهر العلوي/السفلي، أو أعلى الذراع/الصدر إذا لزم. اضغط جيدًا.',
      timingAr:
          'بدلها كل 24 ساعة في وقت ثابت تقريبًا؛ الطعام لا علاقة له بالpatch.',
      importantAr:
          'غيّر موضع اللصق يوميًا ولا تضعها على نفس النقطة بالضبط قبل مرور 14 يومًا. إذا توقفت أكثر من 3 أيام لا ترجع لنفس القوة من نفسك.',
      commonActionableAr:
          'قد تسبب غثيانًا أو قلة شهية أو دوخة، وقد تهيج الجلد. راقب الوزن خصوصًا عند كبار السن.',
      missedDoseAr:
          'إذا نسيت patch أو سقطت، ضع patch جديدة فورًا ثم ارجع لوقت التغيير المعتاد في اليوم التالي. لا تضع اثنتين.',
      seekHelpAr:
          'اطلب المساعدة عند إغماء/بطء نبض شديد، قيء شديد مستمر، أو تفاعل جلدي ينتشر خارج حدود patch.',
      teachBackAr:
          'أرني أين ستضع patch. ماذا تفعل بالقديمة؟ كم patch مسموح في الوقت نفسه؟ وماذا لو توقفت 4 أيام؟',
    ),
  ),
  Medication(
    id: 'galantamine-er',
    familyId: 'cns',
    name: 'Galantamine Extended-Release Capsules',
    subtitle: 'Alzheimer · morning with food · hydration · restart after interruption',
    tags: ['Alzheimer', 'Galantamine', 'Extended release', 'Morning', 'With food'],
    aliases: ['RAZADYNE ER', 'Galantamine ER'],
    sourceLabel:
        'DailyMed · Galantamine extended-release capsules · current labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily extended-release cholinesterase inhibitor for mild-to-moderate Alzheimer dementia.',
      foodTiming:
          'Administer once daily in the morning, preferably with food. Ensure adequate fluid intake.',
      duration:
          'Chronic therapy while benefit and tolerability persist; titration steps are separated by at least 4 weeks.',
      formulationHandling:
          'Use the exact extended-release capsule. The reviewed label does not provide a routine alternate sprinkle/crush method; do not improvise opening or crushing.',
      monitoring:
          'Weight, nausea/vomiting, hydration, bradycardia/syncope and GI bleeding risk when relevant.',
      interactions:
          'Anticholinergic drugs may oppose effect; other cholinergic/bradycardic medicines can increase adverse effects.',
      commonMistakes:
          'Taking ER at night, taking fasting despite GI intolerance, poor fluid intake, or restarting the previous high dose after several missed days.',
      specialPopulations:
          'Moderate renal/hepatic impairment limits maximum dose; severe impairment may preclude use.',
    ),
    sections: [
      MedicationSection(
        title: 'Morning-with-food lock',
        body:
            'Galantamine ER is once daily in the morning, preferably with food, with adequate fluids.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Interruption lock',
        body:
            'If treatment has been interrupted for more than 3 days, restart at the lowest dose and re-titrate rather than resuming the prior dose.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يستخدم لتحسين الأعراض المعرفية في mild-to-moderate Alzheimer disease.',
      howToUseAr:
          'خذ كبسولة ER حسب القوة الموصوفة مرة يوميًا. لا تفتحها أو تسحقها من نفسك لأن طريقة بديلة لم تُثبت في الملصق الذي راجعناه.',
      timingAr:
          'مرة واحدة صباحًا ويفضل مع الطعام، واشرب سوائل كافية خلال اليوم.',
      importantAr:
          'إذا انقطع العلاج أكثر من 3 أيام لا ترجع مباشرة لنفس الجرعة؛ تحتاج عادة البدء من أقل جرعة وإعادة الزيادة تدريجيًا.',
      commonActionableAr:
          'قد يحدث غثيان أو نقص شهية أو دوخة؛ الطعام والسوائل يساعدان على التحمل.',
      missedDoseAr:
          'إذا كان الانقطاع أكثر من 3 أيام اتصل بالطبيب قبل العودة. لا تضاعف جرعتين.',
      seekHelpAr:
          'راجع عند إغماء/بطء نبض واضح، قيء مستمر أو براز أسود/نزف هضمي.',
      teachBackAr:
          'متى ستأخذ ER؟ وماذا تفعل إذا لم تأخذها 4 أيام؟',
    ),
  ),
  Medication(
    id: 'cladribine-mavenclad',
    familyId: 'cns',
    name: 'Cladribine Tablets (MAVENCLAD)',
    subtitle: 'Relapsing MS · treatment cycles · cytotoxic handling · separate oral drugs 3 h',
    tags: ['Multiple sclerosis', 'MS', 'Cladribine', 'MAVENCLAD', 'High risk'],
    aliases: ['MAVENCLAD 10 mg'],
    sourceLabel:
        'DailyMed · MAVENCLAD cladribine tablets · revised May 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Oral cytotoxic immune-reconstitution treatment for selected adults with relapsing forms of MS; two yearly treatment courses, each split into two treatment cycles.',
      foodTiming:
          'May be taken with or without food. Separate from all other oral medicines by at least 3 hours during the 4–5 day treatment cycles.',
      duration:
          'Highly regimen-specific: two yearly treatment courses, each divided into two cycles about a month apart; not a continuous daily medication.',
      formulationHandling:
          'Swallow whole with water immediately after removing from blister. Handle with dry hands, wash hands thoroughly afterward, minimize skin contact and keep in original package until dose time.',
      monitoring:
          'Pregnancy testing, CBC/lymphocytes, infection screening, liver tests and cancer screening before/during courses as directed.',
      interactions:
          'Separate other oral medicines by ≥3 hours. Live vaccines, immunosuppressants and infection-risk therapies require specialist review.',
      commonMistakes:
          'Treating it as a daily chronic tablet, taking oral medicines at the same time, handling tablets with wet hands, or doubling a missed day.',
      specialPopulations:
          'Contraindicated in pregnancy and several infection/malignancy settings. Contraception requirements differ for females and males and extend beyond the dosing days.',
    ),
    sections: [
      MedicationSection(
        title: 'Cycle + 3-hour separation lock',
        body:
            'MAVENCLAD is given in short 4–5 day treatment cycles, not continuously. Separate any other oral medicine by at least 3 hours.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Cytotoxic handling + missed dose',
        body:
            'Handle with dry hands, swallow immediately from the blister, wash hands afterward. If an entire day is missed, take it the next day and extend the cycle; never double.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'دواء عالي الخطورة لبعض حالات relapsing multiple sclerosis، ويُعطى على دورات قصيرة وليس يوميًا طوال السنة.',
      howToUseAr:
          'يداك يجب أن تكونا جافتين. أخرج الحبة من blister وقت الجرعة فقط، ابتلعها كاملة بالماء فورًا، واغسل يديك جيدًا بعدها.',
      timingAr:
          'يمكن مع الطعام أو بدونه، لكن افصل أي دواء فموي آخر 3 ساعات على الأقل عن MAVENCLAD خلال أيام العلاج.',
      importantAr:
          'هذا علاج cytotoxic وله متطلبات فحوصات وعدوى وحمل وموانع حمل؛ لا تبدأ أي دورة بدون تأكيد فريق MS.',
      commonActionableAr:
          'قد ينخفض عدد lymphocytes ويزداد خطر العدوى. أبلغ الطبيب عن حرارة أو علامات عدوى.',
      missedDoseAr:
          'إذا تذكرت في نفس اليوم خذها عند التذكر. إذا انتهى اليوم، خذ الجرعة في اليوم التالي ومدد الدورة يومًا إضافيًا؛ لا تأخذ جرعتين معًا.',
      seekHelpAr:
          'اطلب التقييم عند عدوى شديدة، أعراض كبدية مثل اصفرار/بول غامق، أو أعراض عصبية جديدة متفاقمة.',
      teachBackAr:
          'كم ساعة ستفصل الأدوية الفموية الأخرى؟ وكيف تتعامل مع الحبة؟ وماذا تفعل إذا فات يوم كامل؟',
    ),
  ),
  Medication(
    id: 'diroximel-fumarate-vumerity',
    familyId: 'cns',
    name: 'Diroximel Fumarate (VUMERITY)',
    subtitle: 'Relapsing MS · DR capsules · food limits · no alcohol with dose',
    tags: ['Multiple sclerosis', 'MS', 'VUMERITY', 'Delayed release', 'Food limits'],
    aliases: ['VUMERITY 231 mg', 'Diroximel fumarate'],
    sourceLabel:
        'DailyMed · VUMERITY diroximel fumarate delayed-release capsules · current labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Delayed-release oral fumarate for relapsing forms of multiple sclerosis in adults.',
      foodTiming:
          'May be taken with or without food. If taken with food, avoid high-fat/high-calorie meals or snacks; keep to ≤700 calories and ≤30 g fat. Avoid alcohol at the time of the dose.',
      duration:
          'Chronic disease-modifying therapy while effective and safe.',
      formulationHandling:
          'Swallow capsules whole and intact. Do not crush, chew or sprinkle capsule contents on food.',
      monitoring:
          'CBC/lymphocytes before treatment, at 6 months, then every 6–12 months as indicated; liver tests and infection/PML vigilance.',
      interactions:
          'Do not use together with dimethyl fumarate. Alcohol should not be co-administered with the dose.',
      commonMistakes:
          'Opening the delayed-release capsule, taking it with a very high-fat meal, drinking alcohol with the dose, or ignoring persistent lymphopenia/infection monitoring.',
      specialPopulations:
          'Not recommended in moderate/severe renal impairment. Serious infections and liver injury require treatment review.',
    ),
    sections: [
      MedicationSection(
        title: 'Food-quality lock',
        body:
            'VUMERITY may be taken with or without food. If food is used, keep the meal/snack ≤700 calories and ≤30 g fat; avoid alcohol with the dose.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Delayed-release handling',
        body:
            'Swallow capsules whole and intact; do not crush, chew or sprinkle on food.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'دواء disease-modifying لبعض حالات relapsing multiple sclerosis.',
      howToUseAr:
          'ابتلع الكبسولات كاملة. لا تفتحها. لا تسحقها أو تمضغها أو تنثر محتواها على الطعام.',
      timingAr:
          'يمكن مع الطعام أو بدونه. إذا أخذتها مع الطعام فليكن ≤700 سعرة و≤30 g دهون، وتجنب الكحول وقت الجرعة.',
      importantAr:
          'يحتاج CBC/lymphocytes وفحوصات كبد حسب الخطة. لا تجمعه مع dimethyl fumarate.',
      commonActionableAr:
          'flushing وألم البطن/الإسهال/الغثيان شائعة خصوصًا بالبداية؛ الطعام المناسب قد يقلل flushing.',
      missedDoseAr:
          'لا تضاعف الجرعة الفائتة؛ ارجع للجدول المعتاد أو لخطة فريق MS.',
      seekHelpAr:
          'اطلب التقييم عند عدوى شديدة، ضعف/تغير رؤية أو ارتباك عصبي جديد متفاقم، اصفرار، أو ألم/نزف هضمي شديد.',
      teachBackAr:
          'إذا أخذتها مع الطعام، ما الحد التقريبي للسعرات والدهون؟ وهل يجوز فتح الكبسولة؟ وماذا عن الكحول؟',
    ),
  ),
];
