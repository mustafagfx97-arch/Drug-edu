import '../models/medication.dart';

const expandedMedications33 = <Medication>[
  Medication(
    id: 'lamotrigine-xr',
    familyId: 'cns',
    name: 'Lamotrigine Extended-Release (XR)',
    subtitle: 'Epilepsy age ≥13 · once daily · direct same-total-daily-dose conversion',
    tags: ['Epilepsy', 'Lamotrigine', 'XR', 'Extended release', 'Titration'],
    aliases: ['LAMICTAL XR', 'Lamotrigine ER', 'Lamotrigine XR'],
    sourceLabel:
        'DailyMed · Lamotrigine extended-release tablets · updated Aug 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily extended-release lamotrigine for labeled seizure indications in patients age 13 years and older. Do not automatically transfer the bipolar indication of immediate-release lamotrigine to this XR record.',
      foodTiming:
          'Take once daily with or without food.',
      duration:
          'Usually chronic antiseizure therapy. Discontinuation is gradual; a significant interruption may require re-titration.',
      formulationHandling:
          'Swallow XR tablets whole. Do not chew, crush or divide.',
      releaseConversion:
          'Patients may be converted directly from immediate-release lamotrigine to XR. The initial XR dose should match the total daily IR lamotrigine dose. After conversion, monitor seizure control closely, especially with drugs that induce lamotrigine glucuronidation, because the XR dose may need adjustment.',
      monitoring:
          'Seizure control, serious rash, mood/suicidality and interaction-related changes in lamotrigine exposure.',
      interactions:
          'Valproate markedly raises lamotrigine exposure; enzyme-inducing antiseizure drugs can lower exposure; starting or stopping estrogen-containing products commonly requires maintenance-dose review.',
      commonMistakes:
          'Restarting the old full dose after several missed days, crushing XR, assuming XR is automatically labeled for bipolar disorder, or switching to XR without monitoring seizure control.',
      specialPopulations:
          'The XR label is for seizure indications age 13 years and older. Pregnancy and hormonal-contraceptive changes can alter lamotrigine exposure and require review.',
    ),
    sections: [
      MedicationSection(
        title: 'IR → XR conversion lock',
        body:
            'Direct conversion uses the same total daily lamotrigine dose as the initial XR dose. Closely monitor seizure control after conversion, especially in patients receiving enzyme-inducing medicines; later dose adjustment may be required.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'XR indication + rash lock',
        body:
            'This XR record follows the labeled seizure indications for age ≥13; do not assume the immediate-release bipolar indication is automatically interchangeable. A new rash requires prompt medical assessment and dosing must respect slow-titration rules.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'صيغة XR مرة يوميًا لعلاج أنواع محددة من الصرع من عمر 13 سنة فأكثر حسب الوصفة.',
      howToUseAr:
          'خذ حبة XR مرة يوميًا وابتلعها كاملة. لا تمضغها ولا تسحقها ولا تقسّمها.',
      timingAr:
          'مرة يوميًا، مع الطعام أو بدونه، وفي وقت ثابت تقريبًا.',
      importantAr:
          'إذا كنت تتحول من lamotrigine العادي إلى XR فجرعة البداية للـXR تساوي عادة مجموع جرعتك اليومية من النوع العادي، لكن يجب متابعة النوبات بعد التحويل وقد تحتاج الجرعة تعديلًا، خصوصًا مع بعض أدوية الصرع المحفزة للإنزيمات.',
      commonActionableAr:
          'قد يحدث دوار أو عدم توازن أو صداع. لا تسرّع رفع الجرعة.',
      missedDoseAr:
          'لا تضاعف الجرعة. إذا انقطعت عدة أيام لا ترجع تلقائيًا إلى الجرعة القديمة؛ قد تحتاج إعادة titration.',
      seekHelpAr:
          'عند أي طفح جديد، خاصة مع فقاعات أو تقرحات بالفم أو حرارة، تواصل طبيًا فورًا. اطلب المساعدة أيضًا عند زيادة واضحة في النوبات.',
      teachBackAr:
          'عند التحويل من العادي إلى XR، هل نضاعف مجموع الجرعة اليومية؟ وماذا تفعل إذا انقطعت عن lamotrigine عدة أيام؟',
    ),
  ),
  Medication(
    id: 'divalproex-er',
    familyId: 'cns',
    name: 'Divalproex Sodium Extended-Release (ER)',
    subtitle: 'Once daily · DR→ER epilepsy conversion requires 8–20% higher ER dose',
    tags: ['Epilepsy', 'Bipolar', 'Migraine prevention', 'Valproate', 'ER', 'High risk'],
    aliases: ['Depakote ER-type', 'Divalproex ER'],
    sourceLabel:
        'DailyMed · Divalproex sodium extended-release tablets · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily extended-release divalproex used for acute manic/mixed episodes, labeled seizure disorders and migraine prophylaxis.',
      foodTiming:
          'No universal meal anchor is required by the reviewed label; take consistently according to the prescribed plan.',
      duration:
          'Often chronic for epilepsy/bipolar disorder and preventive migraine therapy when effective; indication and risk profile determine duration.',
      formulationHandling:
          'Swallow ER tablets whole. Do not crush or chew.',
      releaseConversion:
          'For adults and patients age ≥10 years with epilepsy switching from divalproex delayed-release (DR) to ER, use ER once daily at 8–20% higher than the total daily DR dose. Label table examples: DR 500–625 mg/day → ER 750 mg/day; 750–875 → 1,000; 1,000–1,125 → 1,250; 1,250–1,375 → 1,500; 1,500–1,625 → 1,750; 1,750 → 2,000; 1,875–2,000 → 2,250; 2,125–2,250 → 2,500; 2,375 → 2,750; 2,500–2,750 → 3,000; 2,875 → 3,250; 3,000–3,125 → 3,500 mg/day. This table is a labeled epilepsy conversion and should not be generalized blindly to every indication.',
      monitoring:
          'Clinical response, valproate concentration when clinically indicated, liver tests, platelets/CBC, pancreatitis symptoms, weight and pregnancy risk.',
      interactions:
          'Important interactions include lamotrigine, enzyme-inducing antiseizure medicines, anticoagulant/antiplatelet therapy and other CNS depressants. Review the full medication list.',
      commonMistakes:
          'Converting DR to ER 1:1, crushing ER, using migraine-prevention doses as rescue therapy, stopping abruptly in epilepsy or overlooking pregnancy risk.',
      specialPopulations:
          'Valproate has major fetal risk. For migraine prophylaxis it is contraindicated in pregnancy and in women of childbearing potential not using effective contraception; epilepsy/bipolar use in pregnancy requires a stringent benefit-risk assessment.',
    ),
    sections: [
      MedicationSection(
        title: 'DR → ER conversion lock',
        body:
            'For labeled epilepsy conversion age ≥10, ER is not 1:1: use a once-daily ER total that is 8–20% higher than the total daily DR dose and select the available ER strength using the label table. Do not generalize this table to unrelated indications without prescriber review.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Pregnancy / migraine lock',
        body:
            'For migraine prevention, divalproex ER is contraindicated during pregnancy and in women of childbearing potential who are not using effective contraception. Valproate fetal risk also materially affects epilepsy/bipolar treatment decisions.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يُستخدم لبعض أنواع الصرع وbipolar mania وللوقاية من migraine حسب الحالة؛ ليس دواء إسعاف لنوبة migraine.',
      howToUseAr:
          'خذ ER مرة يوميًا حسب الوصفة وابتلع الحبة كاملة. لا تسحقها ولا تمضغها.',
      timingAr:
          'مرة واحدة يوميًا في وقت ثابت تقريبًا حسب الخطة. الطعام ليس شرطًا عامًا في الملصق الذي تمت مراجعته.',
      importantAr:
          'إذا كنت تتحول من divalproex delayed-release إلى ER لعلاج الصرع فلا يكون التحويل 1:1 عادة؛ جرعة ER اليومية تكون أعلى بنحو 8–20% حسب جدول المنتج. لا تحسبها أو تبدلها من نفسك.',
      commonActionableAr:
          'قد يحدث غثيان أو نعاس أو رجفة أو زيادة وزن؛ إذا أثرت على الالتزام ناقش تعديل الخطة بدل الإيقاف المفاجئ.',
      missedDoseAr:
          'لا تضاعف الجرعة الفائتة، ولا توقف الدواء فجأة إذا كان للصرع.',
      seekHelpAr:
          'اطلب تقييمًا عاجلًا عند ألم بطن شديد مستمر مع قيء، اصفرار الجلد/العينين، كدمات أو نزف غير معتاد، أو زيادة النوبات.',
      teachBackAr:
          'هل التحويل من DR إلى ER في الصرع يكون نفس عدد الـmg؟ وهل divalproex ER مناسب للوقاية من migraine أثناء الحمل؟',
    ),
  ),
];
