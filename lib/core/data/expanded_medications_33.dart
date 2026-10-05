import '../models/medication.dart';

const expandedMedications33 = <Medication>[
  Medication(
    id: 'bupropion-xl',
    familyId: 'cns',
    name: 'Bupropion Extended-Release (XL)',
    subtitle: 'MDD/SAD · morning · same total daily dose when switching from IR/SR',
    tags: ['Depression', 'Bupropion', 'XL', 'Extended release', 'Morning'],
    aliases: ['Bupropion XL', 'Wellbutrin XL-type'],
    sourceLabel:
        'DailyMed · Bupropion hydrochloride extended-release tablets (XL) · revised Jan 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily extended-release bupropion for major depressive disorder and prevention of seasonal major depressive episodes in labeled patients.',
      foodTiming:
          'Take in the morning, with or without food. Avoid moving the dose late in the day when insomnia is a problem.',
      duration:
          'Usually months or longer for MDD when effective; seasonal use is individualized to the patient history and season.',
      formulationHandling:
          'Swallow XL tablets whole. Do not crush, divide or chew because altering release can increase peak exposure and seizure risk.',
      releaseConversion:
          'When switching from bupropion immediate-release tablets or sustained-release (SR) tablets to XL, use the same total daily bupropion dose when possible, then give XL once daily according to the prescribed strength. Do not add overlapping IR/SR/XL bupropion products.',
      monitoring:
          'Mood and suicidality early or after dose changes, blood pressure, insomnia/agitation and seizure-risk factors.',
      interactions:
          'MAO inhibitors are contraindicated. Avoid duplicate bupropion products; abrupt alcohol, benzodiazepine, barbiturate or antiseizure-drug withdrawal can increase seizure risk.',
      commonMistakes:
          'Taking XL late at night, crushing/splitting it, taking an extra tablet after a missed dose, or accidentally combining multiple bupropion-containing products.',
      specialPopulations:
          'Dose/frequency limits change with hepatic or renal impairment. Contraindicated in seizure disorder and in current/prior bulimia or anorexia nervosa.',
    ),
    sections: [
      MedicationSection(
        title: 'IR/SR → XL conversion lock',
        body:
            'Current labeling directs the same total daily bupropion dose when possible when switching from IR or SR to XL. The schedule changes to once-daily XL; do not overlap formulations unless a prescriber explicitly designs a transition.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Seizure + missed-dose lock',
        body:
            'Seizure risk is dose-related. If a dose is missed, skip it and take the next dose at the regular time rather than adding an extra tablet.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'مضاد اكتئاب يُستخدم لعلاج depression، وقد يُستخدم للوقاية من النوبات الموسمية حسب الوصفة.',
      howToUseAr:
          'خذ حبة XL صباحًا وابتلعها كاملة. لا تكسرها ولا تسحقها ولا تمضغها.',
      timingAr:
          'مرة واحدة يوميًا صباحًا، مع الطعام أو بدونه. إذا سبب أرقًا فالتزم بالتوقيت الصباحي.',
      importantAr:
          'إذا كنت تتحول من النوع العادي أو SR إلى XL فلا تجمع الأنواع من نفسك؛ التحويل غالبًا يحافظ على نفس مجموع الجرعة اليومية عندما تسمح القوة المتوفرة، لكن الجدول يصبح XL مرة يوميًا.',
      commonActionableAr:
          'قد يحدث أرق أو جفاف فم أو قلق/تنبيه في البداية؛ أخذه صباحًا يساعد إذا كان الأرق مشكلة.',
      missedDoseAr:
          'إذا نسيت جرعة XL فتجاوزها وخذ التالية في موعدها. لا تأخذ جرعة إضافية لأن زيادة الجرعة ترفع خطر التشنجات.',
      seekHelpAr:
          'اطلب المساعدة عند seizure، أفكار انتحارية جديدة أو متفاقمة، تفاعل تحسسي شديد أو ارتفاع ضغط شديد مع أعراض.',
      teachBackAr:
          'إذا كنت تأخذ bupropion العادي أو SR ثم تحولت إلى XL، هل ستجمع المنتجين؟ وماذا تفعل إذا نسيت جرعة XL؟',
    ),
  ),
  Medication(
    id: 'venlafaxine-xr',
    familyId: 'cns',
    name: 'Venlafaxine Extended-Release (XR) Capsules',
    subtitle: 'MDD/anxiety · once daily with food · nearest equivalent IR daily dose',
    tags: ['Depression', 'Anxiety', 'SNRI', 'Venlafaxine', 'XR', 'With food'],
    aliases: ['Effexor XR-type', 'Venlafaxine ER', 'Venlafaxine XR'],
    sourceLabel:
        'DailyMed · Venlafaxine hydrochloride extended-release capsules · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily extended-release SNRI for major depressive disorder, generalized anxiety disorder, social anxiety disorder and panic disorder in adults.',
      foodTiming:
          'Take as a single dose with food, either morning or evening, at approximately the same time each day.',
      duration:
          'Usually months or longer when effective; discontinuation should be gradual and individualized.',
      formulationHandling:
          'Swallow the capsule whole with fluid. For the verified capsule formulation, it may be opened and the entire contents sprinkled on a spoonful of applesauce, swallowed immediately without chewing, then followed by a glass of water. Do not divide the pellet dose.',
      releaseConversion:
          'A patient receiving therapeutic immediate-release venlafaxine may switch to XR at the nearest equivalent total mg/day. Label example: IR 37.5 mg twice daily (75 mg/day) → XR 75 mg once daily. Individual dose adjustment may be necessary.',
      monitoring:
          'Blood pressure, mood/suicidality, serotonin toxicity, sodium in susceptible patients and discontinuation symptoms.',
      interactions:
          'MAO inhibitors are contraindicated. Review other serotonergic medicines, bleeding-risk medicines and CYP-interacting therapy when clinically relevant.',
      commonMistakes:
          'Taking XR without food, stopping suddenly, chewing the pellets, splitting the capsule contents into partial doses or assuming every IR schedule maps to an exact available XR strength.',
      specialPopulations:
          'Renal/hepatic impairment can require lower total doses. Use extra care with falls, hyponatremia risk and uncontrolled hypertension.',
    ),
    sections: [
      MedicationSection(
        title: 'IR → XR conversion lock',
        body:
            'Switch at the nearest equivalent total daily venlafaxine dose, not by keeping the same dosing frequency. Example from labeling: IR 37.5 mg twice daily → XR 75 mg once daily; adjust clinically afterward if needed.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Food + capsule handling',
        body:
            'XR capsules are once daily with food. If swallowing is difficult, the verified capsule may be opened and all pellets placed on one spoonful of applesauce, swallowed immediately without chewing, then followed by water.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'SNRI لعلاج depression وبعض اضطرابات القلق والهلع حسب التشخيص.',
      howToUseAr:
          'خذ XR مرة يوميًا مع الطعام. ابتلع الكبسولة كاملة، أو إذا كانت نفس الكبسولة المسموح فتحها فضع كل محتواها على ملعقة applesauce وابتلعها فورًا دون مضغ ثم اشرب كوب ماء.',
      timingAr:
          'مرة واحدة يوميًا مع الطعام، صباحًا أو مساءً، وفي وقت متقارب كل يوم.',
      importantAr:
          'عند التحويل من venlafaxine العادي إلى XR نستخدم أقرب مجموع جرعة يومية مكافئ؛ مثال: 37.5 mg مرتين يوميًا من العادي → 75 mg XR مرة يوميًا. لا توقفه فجأة.',
      commonActionableAr:
          'قد يحدث غثيان أو تعرق أو أرق/نعاس أو آثار جنسية. أخذه مع الطعام مهم للـXR.',
      missedDoseAr:
          'لا تضاعف الجرعة. إذا اقترب موعد التالية تجاوز الفائتة، وإذا تكرر النسيان أو حدثت أعراض withdrawal تواصل مع الصيدلي/الطبيب.',
      seekHelpAr:
          'اطلب المساعدة عند أفكار انتحارية جديدة/متفاقمة، أعراض serotonin syndrome، ارتفاع ضغط شديد، seizure أو ارتباك شديد قد يدل على نقص الصوديوم.',
      teachBackAr:
          'إذا كنت تأخذ 37.5 mg من النوع العادي مرتين يوميًا، ما مثال جرعة XR المكافئة؟ وهل XR تؤخذ مع الطعام؟',
    ),
  ),
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
