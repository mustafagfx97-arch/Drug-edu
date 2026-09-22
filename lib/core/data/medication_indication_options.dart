import '../models/medication.dart';
import 'medication_patient_guidance_en.dart';

class MedicationIndicationOption {
  const MedicationIndicationOption({
    required this.id,
    required this.labelAr,
    required this.labelEn,
    required this.purposeAr,
    required this.purposeEn,
    required this.source,
    this.offLabel = false,
    this.howToUseAr = '',
    this.howToUseEn = '',
    this.timingAr = '',
    this.timingEn = '',
    this.durationAr = '',
    this.durationEn = '',
    this.importantAr = '',
    this.importantEn = '',
    this.commonActionableAr = '',
    this.commonActionableEn = '',
    this.seekHelpAr = '',
    this.seekHelpEn = '',
  });

  final String id;
  final String labelAr;
  final String labelEn;
  final String purposeAr;
  final String purposeEn;
  final String source;
  final bool offLabel;
  final String howToUseAr;
  final String howToUseEn;
  final String timingAr;
  final String timingEn;
  final String durationAr;
  final String durationEn;
  final String importantAr;
  final String importantEn;
  final String commonActionableAr;
  final String commonActionableEn;
  final String seekHelpAr;
  final String seekHelpEn;
}

const medicationIndicationOptions =
    <String, List<MedicationIndicationOption>>{
  'spironolactone': [
    MedicationIndicationOption(
      id: 'heart-failure',
      labelAr: 'فشل القلب',
      labelEn: 'Heart failure',
      purposeAr:
          'يُستخدم ضمن علاج فشل القلب للمساعدة على تقليل احتباس السوائل وتقليل مخاطر مرتبطة بالمرض عند المرضى المناسبين.',
      purposeEn:
          'Used as part of heart-failure treatment to reduce fluid retention and improve important heart-failure outcomes in appropriate patients.',
      importantAr:
          'راقب البوتاسيوم ووظائف الكلى حسب خطة الطبيب، ولا تستخدم مكملات البوتاسيوم أو بدائل الملح الغنية بالبوتاسيوم من نفسك.',
      importantEn:
          'Potassium and kidney function need monitoring according to the clinical plan. Do not add potassium supplements or potassium-rich salt substitutes on your own.',
      source:
          'DailyMed · Spironolactone tablets · heart failure indication · updated 2026',
    ),
    MedicationIndicationOption(
      id: 'hypertension',
      labelAr: 'ارتفاع ضغط الدم',
      labelEn: 'Hypertension',
      purposeAr:
          'يُستخدم كعلاج إضافي لخفض ضغط الدم عندما يراه الطبيب مناسبًا.',
      purposeEn:
          'Used as add-on treatment to lower blood pressure when appropriate.',
      importantAr:
          'تابع الضغط والبوتاسيوم ووظائف الكلى حسب الخطة. الدواء ليس علاجًا إسعافيًا لارتفاع الضغط المفاجئ.',
      importantEn:
          'Follow blood pressure, potassium and kidney-function monitoring. It is not an emergency treatment for a sudden blood-pressure spike.',
      source:
          'DailyMed · Spironolactone tablets · hypertension indication · updated 2026',
    ),
    MedicationIndicationOption(
      id: 'edema',
      labelAr: 'احتباس السوائل / الوذمة',
      labelEn: 'Edema / fluid retention',
      purposeAr:
          'يساعد على تقليل تجمع السوائل في حالات محددة مثل بعض حالات تليف الكبد أو المتلازمة النفروزية عندما يصفه الطبيب لهذا السبب.',
      purposeEn:
          'Helps reduce fluid retention in selected conditions such as cirrhotic edema or nephrotic syndrome when prescribed for that purpose.',
      commonActionableAr:
          'قد يزيد التبول ويسبب دوخة؛ راقب الوزن والتورم حسب الخطة ولا تغيّر السوائل أو الملح بصورة شديدة من نفسك.',
      commonActionableEn:
          'It can increase urination and cause dizziness. Follow the prescribed weight, swelling, salt and fluid plan rather than changing intake abruptly on your own.',
      source:
          'DailyMed · Spironolactone tablets · edema indication · updated 2026',
    ),
    MedicationIndicationOption(
      id: 'primary-hyperaldosteronism',
      labelAr: 'فرط الألدوستيرون الأولي',
      labelEn: 'Primary hyperaldosteronism',
      purposeAr:
          'يُستخدم لتقليل تأثير الألدوستيرون في فرط الألدوستيرون الأولي، إما قبل الجراحة أو كعلاج مستمر في حالات محددة.',
      purposeEn:
          'Used to block aldosterone in primary hyperaldosteronism, either before surgery or as longer-term treatment in selected patients.',
      source:
          'DailyMed · Spironolactone tablets · primary hyperaldosteronism indication · updated 2026',
    ),
    MedicationIndicationOption(
      id: 'hormonal-acne-hirsutism',
      labelAr: 'استخدام هرموني: حب الشباب / الشعرانية',
      labelEn: 'Hormonal use: acne / hirsutism',
      purposeAr:
          'يُستخدم أحيانًا لدى النساء لعلاج حب الشباب الهرموني أو الشعرانية بسبب تأثيره المضاد للأندروجين. هذا استخدام خارج النشرة الدوائية الأمريكية.',
      purposeEn:
          'Sometimes used in women for hormonal acne or hirsutism because of its antiandrogen effect. This is an off-label U.S. use.',
      importantAr:
          'إذا كان الحمل ممكنًا فيجب مناقشة منع الحمل مع الطبيب؛ spironolactone لا يُستخدم أثناء الحمل. قد تحدث اضطرابات بالدورة أو ألم بالثدي، وتبقى مراجعة البوتاسيوم/الكلى مهمة حسب عوامل الخطورة.',
      importantEn:
          'If pregnancy is possible, discuss effective contraception with the prescriber; spironolactone should not be used during pregnancy. Menstrual changes or breast tenderness can occur, and potassium/kidney monitoring is individualized by risk.',
      durationAr:
          'التحسن في حب الشباب أو الشعرانية يحتاج وقتًا، والعلاج غالبًا يستمر لأشهر إذا كان فعالًا وتحت متابعة الطبيب.',
      durationEn:
          'Hormonal acne or hirsutism improvement takes time; treatment is often continued for months when effective and medically appropriate.',
      offLabel: true,
      source:
          'AAD acne guideline 2024 + Endocrine Society hirsutism guideline; off-label spironolactone use',
    ),
  ],
  'empagliflozin': [
    MedicationIndicationOption(
      id: 'type-2-diabetes',
      labelAr: 'السكري النوع الثاني',
      labelEn: 'Type 2 diabetes',
      purposeAr: 'يساعد على خفض سكر الدم في السكري النوع الثاني.',
      purposeEn: 'Helps improve glucose control in type 2 diabetes.',
      source: 'DailyMed · JARDIANCE / empagliflozin · current labeling',
    ),
    MedicationIndicationOption(
      id: 'heart-failure',
      labelAr: 'فشل القلب',
      labelEn: 'Heart failure',
      purposeAr:
          'يُستخدم لتقليل مخاطر مهمة مرتبطة بفشل القلب حتى عند بعض المرضى غير المصابين بالسكري.',
      purposeEn:
          'Used to reduce important heart-failure risks, including in selected patients without diabetes.',
      source: 'DailyMed · JARDIANCE / empagliflozin · heart failure indication',
    ),
    MedicationIndicationOption(
      id: 'chronic-kidney-disease',
      labelAr: 'مرض الكلى المزمن',
      labelEn: 'Chronic kidney disease',
      purposeAr:
          'يُستخدم لدى مرضى محددين بمرض الكلى المزمن لتقليل تدهور المرض ومخاطر قلبية/كلوية مرتبطة به.',
      purposeEn:
          'Used in selected chronic-kidney-disease patients to reduce progression and related cardiovascular/kidney outcomes.',
      source: 'DailyMed · JARDIANCE / empagliflozin · CKD indication',
    ),
  ],
  'dapagliflozin': [
    MedicationIndicationOption(
      id: 'type-2-diabetes',
      labelAr: 'السكري النوع الثاني',
      labelEn: 'Type 2 diabetes',
      purposeAr: 'يساعد على خفض سكر الدم في السكري النوع الثاني.',
      purposeEn: 'Helps improve glucose control in type 2 diabetes.',
      source: 'DailyMed · FARXIGA / dapagliflozin · updated 2026',
    ),
    MedicationIndicationOption(
      id: 'heart-failure',
      labelAr: 'فشل القلب',
      labelEn: 'Heart failure',
      purposeAr:
          'يُستخدم لتقليل الوفاة القلبية الوعائية ودخول المستشفى أو الزيارة العاجلة المرتبطة بفشل القلب لدى المرضى المناسبين.',
      purposeEn:
          'Used to reduce cardiovascular death, heart-failure hospitalization and urgent heart-failure visits in appropriate adults.',
      source: 'DailyMed · FARXIGA / dapagliflozin · updated 2026',
    ),
    MedicationIndicationOption(
      id: 'chronic-kidney-disease',
      labelAr: 'مرض الكلى المزمن',
      labelEn: 'Chronic kidney disease',
      purposeAr:
          'يُستخدم لدى بعض مرضى الكلى المزمن لتقليل تدهور eGFR والفشل الكلوي ومخاطر قلبية مرتبطة به.',
      purposeEn:
          'Used in chronic kidney disease at risk of progression to reduce sustained eGFR decline, kidney failure and related cardiovascular outcomes.',
      source: 'DailyMed · FARXIGA / dapagliflozin · updated 2026',
    ),
  ],
  'montelukast': [
    MedicationIndicationOption(
      id: 'asthma',
      labelAr: 'السيطرة المزمنة على الربو',
      labelEn: 'Chronic asthma control',
      purposeAr:
          'يساعد على الوقاية والسيطرة المزمنة على أعراض الربو؛ ليس بخاخ إسعاف للنوبة المفاجئة.',
      purposeEn:
          'Helps prevent and chronically control asthma symptoms; it is not a rescue treatment for a sudden attack.',
      timingAr: 'للربو يُستخدم عادة مرة يوميًا مساءً حسب الجرعة/العمر الموصوفين.',
      timingEn:
          'For asthma it is generally taken once daily in the evening according to the prescribed age/formulation.',
      source: 'DailyMed · Montelukast · asthma indication',
    ),
    MedicationIndicationOption(
      id: 'exercise-induced-bronchoconstriction',
      labelAr: 'تضيق القصبات مع الرياضة',
      labelEn: 'Exercise-induced bronchoconstriction',
      purposeAr: 'يُستخدم للوقاية من تضيق القصبات المحرَّض بالرياضة عند المرضى المناسبين.',
      purposeEn:
          'Used to prevent exercise-induced bronchoconstriction in appropriate patients.',
      timingAr:
          'الجرعة المخصصة لهذا الاستعمال تؤخذ قبل الرياضة بساعتين على الأقل حسب المنتج والعمر، ولا تضف جرعة إذا كنت تستخدمه يوميًا للربو إلا حسب وصف الطبيب.',
      timingEn:
          'For this use, the dose is taken at least 2 hours before exercise according to age/product; do not add an extra dose when already using daily montelukast unless specifically directed.',
      source: 'DailyMed · Montelukast · EIB indication',
    ),
    MedicationIndicationOption(
      id: 'allergic-rhinitis',
      labelAr: 'حساسية الأنف',
      labelEn: 'Allergic rhinitis',
      purposeAr:
          'يخفف أعراض حساسية الأنف في حالات مختارة عندما لا تكون البدائل المناسبة كافية أو محتملة.',
      purposeEn:
          'Relieves allergic-rhinitis symptoms in selected patients when suitable alternatives are inadequate or not tolerated.',
      importantAr:
          'بسبب تحذير الأعراض النفسية/السلوكية، يُحجز استعمال montelukast لحساسية الأنف لمن لم يستجبوا أو لم يتحملوا البدائل المناسبة.',
      importantEn:
          'Because of the neuropsychiatric warning, montelukast for allergic rhinitis is reserved for patients with inadequate response or intolerance to suitable alternatives.',
      source: 'DailyMed · Montelukast · allergic rhinitis limitation of use',
    ),
  ],
  'gabapentin': [
    MedicationIndicationOption(
      id: 'postherpetic-neuralgia',
      labelAr: 'ألم الأعصاب بعد الحزام الناري',
      labelEn: 'Postherpetic neuralgia',
      purposeAr: 'يخفف ألم الأعصاب المستمر بعد الحزام الناري عند البالغين.',
      purposeEn: 'Treats postherpetic neuralgia in adults.',
      source: 'DailyMed · Gabapentin capsules · updated Aug 2026',
    ),
    MedicationIndicationOption(
      id: 'partial-seizures',
      labelAr: 'الصرع / النوبات الجزئية',
      labelEn: 'Partial-onset seizures',
      purposeAr:
          'يُستخدم كعلاج مساعد للسيطرة على النوبات الجزئية حسب خطة طبيب الأعصاب.',
      purposeEn:
          'Used as adjunctive therapy for partial-onset seizures according to the epilepsy plan.',
      importantAr: 'لا توقف gabapentin فجأة من نفسك، خصوصًا عند استخدامه للصرع.',
      importantEn:
          'Do not abruptly stop gabapentin on your own, especially when it is being used for seizures.',
      source: 'DailyMed · Gabapentin capsules · updated Aug 2026',
    ),
  ],
  'pregabalin': [
    MedicationIndicationOption(
      id: 'diabetic-neuropathy',
      labelAr: 'ألم الأعصاب السكري',
      labelEn: 'Diabetic neuropathic pain',
      purposeAr: 'يخفف ألم الأعصاب المرتبط بالاعتلال العصبي السكري.',
      purposeEn: 'Treats neuropathic pain associated with diabetic peripheral neuropathy.',
      source: 'DailyMed · Pregabalin capsules · updated Jun 2026',
    ),
    MedicationIndicationOption(
      id: 'postherpetic-neuralgia',
      labelAr: 'ألم الأعصاب بعد الحزام الناري',
      labelEn: 'Postherpetic neuralgia',
      purposeAr: 'يخفف ألم الأعصاب بعد الحزام الناري.',
      purposeEn: 'Treats postherpetic neuralgia.',
      source: 'DailyMed · Pregabalin capsules · updated Jun 2026',
    ),
    MedicationIndicationOption(
      id: 'fibromyalgia',
      labelAr: 'الفيبروميالغيا',
      labelEn: 'Fibromyalgia',
      purposeAr: 'يُستخدم لتخفيف أعراض الألم المرتبطة بالفيبروميالغيا عند المرضى المناسبين.',
      purposeEn: 'Used to manage fibromyalgia in appropriate patients.',
      source: 'DailyMed · Pregabalin capsules · updated Jun 2026',
    ),
    MedicationIndicationOption(
      id: 'partial-seizures',
      labelAr: 'النوبات الجزئية',
      labelEn: 'Partial-onset seizures',
      purposeAr: 'يُستخدم كعلاج مساعد للنوبات الجزئية.',
      purposeEn: 'Used as adjunctive treatment for partial-onset seizures.',
      source: 'DailyMed · Pregabalin capsules · updated Jun 2026',
    ),
    MedicationIndicationOption(
      id: 'spinal-cord-neuropathic-pain',
      labelAr: 'ألم عصبي بسبب إصابة الحبل الشوكي',
      labelEn: 'Spinal-cord-injury neuropathic pain',
      purposeAr: 'يخفف الألم العصبي المرتبط بإصابة الحبل الشوكي.',
      purposeEn: 'Treats neuropathic pain associated with spinal cord injury.',
      source: 'DailyMed · Pregabalin capsules · updated Jun 2026',
    ),
  ],
  'duloxetine': [
    MedicationIndicationOption(
      id: 'depression',
      labelAr: 'الاكتئاب',
      labelEn: 'Major depressive disorder',
      purposeAr: 'يُستخدم لعلاج الاكتئاب.',
      purposeEn: 'Treats major depressive disorder.',
      source: 'DailyMed · Duloxetine delayed-release capsules · updated Jun 2026',
    ),
    MedicationIndicationOption(
      id: 'generalized-anxiety',
      labelAr: 'القلق العام',
      labelEn: 'Generalized anxiety disorder',
      purposeAr: 'يُستخدم لعلاج اضطراب القلق العام.',
      purposeEn: 'Treats generalized anxiety disorder.',
      source: 'DailyMed · Duloxetine delayed-release capsules · updated Jun 2026',
    ),
    MedicationIndicationOption(
      id: 'diabetic-neuropathic-pain',
      labelAr: 'ألم الأعصاب السكري',
      labelEn: 'Diabetic neuropathic pain',
      purposeAr: 'يخفف ألم الأعصاب المرتبط بالسكري.',
      purposeEn: 'Treats diabetic peripheral neuropathic pain.',
      source: 'DailyMed · Duloxetine delayed-release capsules · updated Jun 2026',
    ),
    MedicationIndicationOption(
      id: 'fibromyalgia',
      labelAr: 'الفيبروميالغيا',
      labelEn: 'Fibromyalgia',
      purposeAr: 'يُستخدم لعلاج الألم المرتبط بالفيبروميالغيا.',
      purposeEn: 'Treats fibromyalgia.',
      source: 'DailyMed · Duloxetine delayed-release capsules · updated Jun 2026',
    ),
    MedicationIndicationOption(
      id: 'chronic-musculoskeletal-pain',
      labelAr: 'ألم عضلي هيكلي مزمن',
      labelEn: 'Chronic musculoskeletal pain',
      purposeAr: 'يُستخدم لعلاج بعض أنواع الألم العضلي الهيكلي المزمن.',
      purposeEn: 'Treats selected chronic musculoskeletal pain.',
      source: 'DailyMed · Duloxetine delayed-release capsules · updated Jun 2026',
    ),
  ],
  'lamotrigine': [
    MedicationIndicationOption(
      id: 'epilepsy',
      labelAr: 'الصرع',
      labelEn: 'Epilepsy',
      purposeAr: 'يُستخدم للسيطرة على أنواع محددة من نوبات الصرع.',
      purposeEn: 'Used for selected seizure types in epilepsy.',
      importantAr:
          'الزيادة التدريجية للجرعة مهمة لتقليل خطر الطفح الخطير؛ إذا توقفت عدة أيام لا ترجع لنفس الجرعة من نفسك.',
      importantEn:
          'Slow titration is important because of serious-rash risk. After several missed days, do not restart the previous full dose without advice.',
      source: 'DailyMed · Lamotrigine tablets · updated May 2026',
    ),
    MedicationIndicationOption(
      id: 'bipolar-maintenance',
      labelAr: 'المحافظة في الاضطراب ثنائي القطب',
      labelEn: 'Bipolar I maintenance',
      purposeAr:
          'يُستخدم للمحافظة في الاضطراب ثنائي القطب وتأخير عودة نوبات المزاج بعد علاج النوبة الحادة؛ ليس علاجًا مثبتًا للنوبة الهوسية الحادة.',
      purposeEn:
          'Used for maintenance treatment of bipolar I disorder to delay recurrence of mood episodes after acute treatment; it is not established as acute mania treatment.',
      source: 'DailyMed · Lamotrigine tablets · updated May 2026',
    ),
  ],
  'carvedilol': [
    MedicationIndicationOption(
      id: 'heart-failure',
      labelAr: 'فشل القلب',
      labelEn: 'Heart failure',
      purposeAr: 'يُستخدم ضمن علاج فشل القلب لتحسين النتائج وتقليل دخول المستشفى.',
      purposeEn:
          'Used as part of chronic heart-failure treatment to improve outcomes and reduce hospitalization risk.',
      source: 'DailyMed · Carvedilol tablets · updated Jan 2026',
    ),
    MedicationIndicationOption(
      id: 'post-mi-lv-dysfunction',
      labelAr: 'ضعف البطين بعد جلطة القلب',
      labelEn: 'LV dysfunction after myocardial infarction',
      purposeAr:
          'يُستخدم بعد احتشاء القلب لدى مرضى محددين لديهم ضعف في وظيفة البطين لتقليل الوفيات القلبية الوعائية.',
      purposeEn:
          'Used after myocardial infarction in clinically stable patients with left-ventricular dysfunction to reduce cardiovascular mortality.',
      source: 'DailyMed · Carvedilol tablets · updated Jan 2026',
    ),
    MedicationIndicationOption(
      id: 'hypertension',
      labelAr: 'ارتفاع ضغط الدم',
      labelEn: 'Hypertension',
      purposeAr: 'يُستخدم لخفض ضغط الدم.',
      purposeEn: 'Used to lower blood pressure.',
      source: 'DailyMed · Carvedilol tablets · updated Jan 2026',
    ),
  ],
  'valproic-acid': [
    MedicationIndicationOption(
      id: 'epilepsy',
      labelAr: 'الصرع',
      labelEn: 'Epilepsy',
      purposeAr: 'يُستخدم لعلاج أنواع محددة من نوبات الصرع.',
      purposeEn: 'Used to treat selected seizure disorders.',
      source: 'DailyMed · Valproate/divalproex labeling',
    ),
    MedicationIndicationOption(
      id: 'bipolar-mania',
      labelAr: 'الهوس في الاضطراب ثنائي القطب',
      labelEn: 'Bipolar mania',
      purposeAr: 'يُستخدم لعلاج نوبات الهوس المرتبطة بالاضطراب ثنائي القطب.',
      purposeEn: 'Used to treat manic episodes associated with bipolar disorder.',
      source: 'DailyMed · Divalproex sodium labeling',
    ),
    MedicationIndicationOption(
      id: 'migraine-prevention',
      labelAr: 'الوقاية من الشقيقة',
      labelEn: 'Migraine prevention',
      purposeAr:
          'يُستخدم للوقاية من نوبات الشقيقة، وليس لإيقاف الصداع الحاد بعد أن يبدأ.',
      purposeEn:
          'Used to prevent migraine attacks; it does not stop an acute migraine after it starts.',
      importantAr:
          'استخدام valproate للوقاية من الشقيقة ممنوع أثناء الحمل، ويحتاج تقييمًا دقيقًا إذا كان الحمل ممكنًا.',
      importantEn:
          'Valproate for migraine prevention is contraindicated in pregnancy and requires careful pregnancy-prevention counseling when pregnancy is possible.',
      source: 'DailyMed · Valproate/divalproex migraine prophylaxis labeling',
    ),
  ],
  'finasteride': [
    MedicationIndicationOption(
      id: 'bph',
      labelAr: 'تضخم البروستات الحميد',
      labelEn: 'Benign prostatic hyperplasia',
      purposeAr:
          'يقلل حجم البروستات تدريجيًا ويحسن أعراض التبول المرتبطة بتضخم البروستات الحميد.',
      purposeEn:
          'Gradually reduces prostate size and improves urinary symptoms from benign prostatic hyperplasia.',
      importantAr:
          'هذا الاستعمال عادة بمنتج 5 mg؛ أخبر الطبيب أنك تستخدم finasteride عند تفسير فحص PSA.',
      importantEn:
          'This indication generally uses the 5 mg product. Clinicians interpreting PSA must know you take finasteride.',
      source: 'DailyMed · Finasteride 5 mg · BPH indication',
    ),
    MedicationIndicationOption(
      id: 'male-pattern-hair-loss',
      labelAr: 'تساقط الشعر الذكوري',
      labelEn: 'Male pattern hair loss',
      purposeAr:
          'يُستخدم لتقليل تقدم تساقط الشعر الذكوري وزيادة نمو الشعر لدى الرجال المناسبين.',
      purposeEn:
          'Used to slow male pattern hair loss and improve hair growth in appropriate men.',
      importantAr:
          'هذا الاستعمال يكون عادة بمنتج 1 mg. الحوامل يجب ألا يلمسن أقراص finasteride المكسورة أو المسحوقة.',
      importantEn:
          'This indication generally uses the 1 mg product. Pregnant people should not handle crushed or broken finasteride tablets.',
      source: 'DailyMed · Finasteride 1 mg · androgenetic alopecia indication',
    ),
  ],
  'rimegepant-nurtec-odt': [
    MedicationIndicationOption(
      id: 'acute-migraine',
      labelAr: 'علاج نوبة الشقيقة الحادة',
      labelEn: 'Acute migraine treatment',
      purposeAr:
          'يُستخدم لإيقاف نوبة الشقيقة عند حدوثها، وليس كجرعة وقاية في هذا الاستعمال.',
      purposeEn:
          'Used to treat a migraine attack when it occurs; this selection is the acute-treatment schedule, not preventive dosing.',
      timingAr:
          '75 mg عند الحاجة للنوبة، وبحد أقصى 75 mg خلال 24 ساعة. سلامة استخدام أكثر من 18 جرعة خلال 30 يومًا غير مثبتة.',
      timingEn:
          '75 mg as needed for an attack, with a maximum of 75 mg in 24 hours. Safety of more than 18 doses in 30 days has not been established.',
      durationAr:
          'استخدام متقطع للنوبات الحادة؛ إذا أصبحت النوبات كثيرة فراجع خطة الوقاية.',
      durationEn:
          'Intermittent acute treatment; frequent attacks should trigger review of the preventive plan.',
      importantAr:
          'لا تأخذ جرعة ثانية في نفس 24 ساعة. راجع التداخلات لأن بعض مثبطات CYP3A/P-gp تفرض الانتظار 48 ساعة قبل جرعة أخرى.',
      importantEn:
          'Do not take a second dose in the same 24 hours. Interaction review is important because some CYP3A/P-gp inhibitors require a 48-hour interval before another dose.',
      source:
          'DailyMed · NURTEC ODT · acute migraine treatment · revised Mar 2026',
    ),
    MedicationIndicationOption(
      id: 'episodic-migraine-prevention',
      labelAr: 'الوقاية من الشقيقة العرضية',
      labelEn: 'Episodic migraine prevention',
      purposeAr:
          'يُستخدم كعلاج وقائي لتقليل نوبات الشقيقة العرضية لدى البالغين.',
      purposeEn:
          'Used as preventive treatment to reduce episodic migraine attacks in adults.',
      timingAr:
          '75 mg كل يومين حسب الوصفة؛ هذا جدول وقائي وليس جرعة عند كل صداع.',
      timingEn:
          '75 mg every other day according to the prescription; this is a preventive schedule rather than an as-needed attack dose.',
      durationAr:
          'علاج وقائي مستمر طالما كان فعالًا ومتحملًا وتحت متابعة الطبيب.',
      durationEn:
          'Ongoing preventive treatment while effective, tolerated and clinically appropriate.',
      importantAr:
          'حافظ على جدول كل يومين ولا تضاعف الجرعة عند النسيان. راجع الأدوية الجديدة بسبب تداخلات CYP3A/P-gp.',
      importantEn:
          'Keep the every-other-day schedule and do not double after a missed dose. Review new medicines because of CYP3A/P-gp interactions.',
      source:
          'DailyMed · NURTEC ODT · episodic migraine prevention · revised Mar 2026',
    ),
  ],

  'ticagrelor-brilinta': [
    MedicationIndicationOption(
      id: 'acs-or-history-mi',
      labelAr: 'ACS / جلطة قلبية سابقة',
      labelEn: 'ACS / prior myocardial infarction',
      purposeAr:
          'يُستخدم لتقليل أحداث الخثار بعد ACS أو لدى مرضى مختارين لديهم تاريخ MI، وغالبًا يكون ضمن خطة تشمل PCI/دعامة أو وقاية ثانوية.',
      purposeEn:
          'Used to reduce thrombotic events after ACS or in selected patients with prior myocardial infarction, often within a PCI/stent or secondary-prevention plan.',
      timingAr:
          'الملصق الحالي يستخدم 90 mg مرتين يوميًا خلال السنة الأولى بعد ACS ثم 60 mg مرتين يوميًا بعد السنة الأولى؛ لا يغيّر التطبيق القوة تلقائيًا.',
      timingEn:
          'Current labeling uses 90 mg twice daily during the first year after ACS, then 60 mg twice daily after one year; the app must not switch strengths automatically.',
      durationAr:
          'المدة يحددها طبيب القلب حسب ACS/MI/PCI وخطر النزف والخثار.',
      durationEn:
          'Duration is cardiology-directed according to ACS/MI/PCI and evolving bleeding versus thrombotic risk.',
      importantAr:
          'غالبًا يكون aspirin 75–100 mg يوميًا جزءًا من الخطة، لكن بعض مرضى PCI قد يُحوّلون إلى ticagrelor وحده حسب قرار الطبيب.',
      importantEn:
          'Aspirin 75–100 mg/day is generally part of the regimen, although selected post-PCI patients may transition to ticagrelor monotherapy under clinician direction.',
      source:
          'DailyMed · BRILINTA · ACS/history of MI · current 2026 labeling',
    ),
    MedicationIndicationOption(
      id: 'cad-no-prior-mi-stroke',
      labelAr: 'CAD بدون MI أو stroke سابق',
      labelEn: 'CAD without prior MI or stroke',
      purposeAr:
          'يُستخدم لدى بعض مرضى coronary artery disease عاليي الخطورة الذين لم يسبق لهم MI أو stroke لتقليل أول MI أو stroke.',
      purposeEn:
          'Used in selected high-risk coronary artery disease patients without prior MI or stroke to reduce a first MI or stroke.',
      timingAr:
          'الملصق الحالي يستخدم 60 mg مرتين يوميًا، وعادة مع aspirin 75–100 mg يوميًا ما لم يضع الطبيب خطة مختلفة.',
      timingEn:
          'Current labeling uses 60 mg twice daily, generally with aspirin 75–100 mg/day unless the clinician intentionally chooses another strategy.',
      durationAr:
          'علاج وقائي طويل نسبيًا لدى المرضى المختارين ويُعاد تقييمه حسب النزف والفائدة.',
      durationEn:
          'Usually longer-term preventive therapy in selected patients with periodic reassessment of bleeding risk and benefit.',
      source:
          'DailyMed · BRILINTA · CAD without prior MI/stroke · current 2026 labeling',
    ),
    MedicationIndicationOption(
      id: 'acute-ischemic-stroke-tia',
      labelAr: 'Acute ischemic stroke / TIA',
      labelEn: 'Acute ischemic stroke / TIA',
      purposeAr:
          'يُستخدم لمدة قصيرة لدى مرضى مختارين بعد acute ischemic stroke أو high-risk TIA لتقليل خطر stroke لاحق.',
      purposeEn:
          'Used short term in selected patients after acute ischemic stroke or high-risk TIA to reduce subsequent stroke risk.',
      timingAr:
          'الملصق الحالي يبدأ loading dose 180 mg ثم 90 mg مرتين يوميًا حتى 30 يومًا، مع aspirin loading ثم 75–100 mg يوميًا؛ هذا مسار طبي محدد وليس جدولًا يختاره المريض.',
      timingEn:
          'Current labeling uses a 180 mg loading dose followed by 90 mg twice daily for up to 30 days, with an aspirin loading dose then 75–100 mg/day; this is a clinician-selected acute-care pathway.',
      durationAr:
          'حتى 30 يومًا حسب المسار الحالي، وليست خطة طويلة المدى تلقائيًا.',
      durationEn:
          'Up to 30 days under the current labeled pathway; it is not automatically a long-term ticagrelor regimen.',
      importantAr:
          'هذه الخطة لا تنطبق على كل stroke/TIA؛ شدة الحالة والعلاجات الأخرى تحدد الأهلية.',
      importantEn:
          'This pathway does not apply to every stroke/TIA patient; stroke severity and other acute treatments determine suitability.',
      source:
          'DailyMed · BRILINTA · acute ischemic stroke/TIA · current 2026 labeling',
    ),
  ],

};

List<MedicationIndicationOption> indicationOptionsFor(String medicationId) {
  final options = medicationIndicationOptions[medicationId] ?? const [];
  return options.where((option) => option.id.trim().isNotEmpty).toList(growable: false);
}

MedicationIndicationOption? indicationOptionFor(
  String medicationId,
  String? indicationId,
) {
  if (indicationId == null) return null;
  for (final option in indicationOptionsFor(medicationId)) {
    if (option.id == indicationId) return option;
  }
  return null;
}

PatientCounselingData applyIndicationToArabic(
  PatientCounselingData base,
  MedicationIndicationOption? option,
) {
  if (option == null) return base;
  return PatientCounselingData(
    purposeAr: option.purposeAr,
    howToUseAr:
        option.howToUseAr.trim().isEmpty ? base.howToUseAr : option.howToUseAr,
    timingAr: option.timingAr.trim().isEmpty ? base.timingAr : option.timingAr,
    importantAr: option.importantAr.trim().isEmpty
        ? base.importantAr
        : option.importantAr,
    commonActionableAr: option.commonActionableAr.trim().isEmpty
        ? base.commonActionableAr
        : option.commonActionableAr,
    missedDoseAr: base.missedDoseAr,
    storageAr: base.storageAr,
    seekHelpAr:
        option.seekHelpAr.trim().isEmpty ? base.seekHelpAr : option.seekHelpAr,
    teachBackAr: base.teachBackAr,
  );
}

EnglishPatientCounseling applyIndicationToEnglish(
  EnglishPatientCounseling base,
  MedicationIndicationOption? option,
) {
  if (option == null) return base;
  return EnglishPatientCounseling(
    purpose: option.purposeEn,
    howToUse:
        option.howToUseEn.trim().isEmpty ? base.howToUse : option.howToUseEn,
    timing: option.timingEn.trim().isEmpty ? base.timing : option.timingEn,
    duration:
        option.durationEn.trim().isEmpty ? base.duration : option.durationEn,
    important: option.importantEn.trim().isEmpty
        ? base.important
        : option.importantEn,
    commonActionable: option.commonActionableEn.trim().isEmpty
        ? base.commonActionable
        : option.commonActionableEn,
    missedDose: base.missedDose,
    storage: base.storage,
    seekHelp:
        option.seekHelpEn.trim().isEmpty ? base.seekHelp : option.seekHelpEn,
    teachBack: base.teachBack,
  );
}
