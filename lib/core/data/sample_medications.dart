import '../models/medication.dart';
import 'expanded_medications.dart';
import 'expanded_medications_2.dart';
import 'expanded_medications_3.dart';
import 'expanded_medications_4.dart';
import 'expanded_medications_5.dart';
import 'expanded_medications_6.dart';
import 'expanded_medications_7.dart';
import 'expanded_medications_8.dart';
import 'expanded_medications_9.dart';
import 'expanded_medications_10.dart';

const sampleMedications = <Medication>[
  Medication(
    id: 'losartan',
    familyId: 'cardiovascular',
    name: 'Losartan',
    subtitle: 'ARB antihypertensive',
    tags: ['Blood pressure', 'Oral', 'Chronic'],
    sourceLabel: 'MedlinePlus Drug Information · Losartan',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Verify indication, renal function, potassium, pregnancy status and interacting potassium-raising therapy. Clarify the prescribed frequency and reinforce adherence for chronic use.',
      ),
      MedicationSection(
        title: 'Administration & monitoring',
        body:
            'May be taken with or without food. Monitor blood pressure, renal function and potassium when clinically indicated.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم للمساعدة على خفض ضغط الدم وحماية القلب والكلى في بعض الحالات.',
      howToUseAr: 'خذ الجرعة كما وصفها الطبيب وفي نفس الوقت تقريبًا كل يوم.',
      timingAr: 'يمكن أخذه مع الطعام أو بدونه.',
      importantAr: 'لا تستخدم بدائل الملح أو مكملات البوتاسيوم من نفسك.',
      missedDoseAr: 'خذ الجرعة عندما تتذكر إذا لم يقترب موعد الجرعة التالية. لا تضاعف الجرعة.',
      seekHelpAr: 'راجع الطبيب إذا حدث دوار شديد أو إغماء، أو إذا أصبحتِ حاملًا.',
      teachBackAr: 'متى ستأخذ الجرعة؟ وما الذي ستتجنبه دون استشارة؟',
    ),
  ),
  Medication(
    id: 'metformin',
    familyId: 'diabetes-endocrine',
    name: 'Metformin',
    subtitle: 'Biguanide',
    tags: ['Diabetes', 'Oral', 'Chronic'],
    sourceLabel: 'MedlinePlus Drug Information · Metformin + DailyMed metformin formulation labeling',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Confirm immediate-release versus extended-release formulation, renal function, GI tolerance and whether tablets may be split or crushed for the exact product.',
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Usually taken with meals to reduce GI intolerance. Extended-release products require formulation-specific handling.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد على خفض سكر الدم.',
      howToUseAr: 'خذ الدواء حسب الجرعة المكتوبة لك.',
      timingAr: 'خذه مع الطعام لتقليل انزعاج المعدة، إلا إذا كانت تعليمات منتجك مختلفة.',
      commonActionableAr: 'قد يسبب غثيانًا أو إسهالًا في البداية. أخذه مع الطعام يساعد غالبًا.',
      importantAr: 'لا تسحق أو تكسر الحبوب ممتدة المفعول إلا إذا سمحت تعليمات المنتج بذلك.',
      missedDoseAr: 'إذا نسيت الجرعة فتجاوزها إذا اقترب موعد التالية، ولا تضاعف الجرعة.',
    ),
  ),
  Medication(
    id: 'salbutamol-mdi',
    familyId: 'respiratory',
    name: 'Salbutamol MDI',
    subtitle: 'Short-acting bronchodilator inhaler',
    tags: ['Asthma', 'Inhaler', 'Device'],
    sourceLabel: 'DailyMed · Albuterol sulfate inhalation aerosol · updated May 2026',
    hasVisualGuide: true,
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Assess inhaler technique, spacer need, priming instructions for the exact product, symptom frequency and over-reliance on reliever therapy.',
      ),
      MedicationSection(
        title: 'Technique',
        body:
            'Demonstrate product-specific MDI preparation, slow inhalation coordinated with actuation, breath-hold and spacer technique when applicable.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يفتح الشعب الهوائية بسرعة عند ضيق النفس أو الصفير.',
      howToUseAr: 'أخرج الهواء أولًا، ثم ابدأ شهيقًا بطيئًا واضغط بخة واحدة مع استمرار الشهيق. استخدم السبيسر إذا طُلب منك.',
      importantAr: 'طريقة التحضير قد تختلف حسب نوع البخاخ، لذلك اتبع خطوات جهازك.',
      seekHelpAr: 'إذا احتجت بخاخ الإسعاف أكثر من المعتاد أو لم يتحسن النفس، تواصل مع الطبيب.',
      teachBackAr: 'أرني كيف ستستخدم البخاخ من البداية إلى النهاية.',
    ),
  ),
  Medication(
    id: 'amoxicillin',
    familyId: 'antiinfective',
    name: 'Amoxicillin',
    subtitle: 'Penicillin antibiotic',
    tags: ['Antibiotic', 'Oral', 'Course'],
    sourceLabel: 'MedlinePlus Drug Information · Amoxicillin + product-specific DailyMed labeling',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Confirm allergy history, formulation, dose schedule, renal considerations, intended duration and reconstituted-suspension storage for the exact product.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد حيوي لعلاج عدوى بكتيرية.',
      howToUseAr: 'خذ الجرعة في المواعيد المكتوبة لك وأكمل المدة التي حددها الطبيب.',
      timingAr: 'يمكن أخذه مع الطعام أو بدونه. إذا أزعج المعدة فخذه مع الطعام.',
      importantAr: 'لا توقف العلاج من نفسك لمجرد أنك شعرت بتحسن.',
      missedDoseAr: 'خذ الجرعة عندما تتذكر إذا لم يقترب موعد التالية. لا تضاعف الجرعة.',
      seekHelpAr: 'اطلب مساعدة عاجلة إذا ظهر تورم في الوجه أو صعوبة في التنفس أو طفح شديد.',
    ),
  ),
  Medication(
    id: 'levetiracetam',
    familyId: 'cns',
    name: 'Levetiracetam',
    subtitle: 'Antiseizure medicine',
    tags: ['Seizure', 'Oral', 'IV'],
    sourceLabel: 'MedlinePlus Drug Information · Levetiracetam + DailyMed prescribing information',
    hasIvPreparation: true,
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Confirm formulation, renal function, adherence and transition between oral and IV therapy when relevant. Avoid abrupt interruption unless directed by the prescriber.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد على منع نوبات الصرع.',
      howToUseAr: 'خذه بانتظام في الأوقات المحددة ولا توقفه فجأة من نفسك.',
      commonActionableAr: 'قد يسبب نعاسًا أو دوخة عند بعض الأشخاص، خاصة في بداية العلاج.',
      importantAr: 'إذا لاحظت تغيرًا واضحًا وغير معتاد في المزاج أو السلوك، أخبر الطبيب.',
      missedDoseAr: 'خذ الجرعة عندما تتذكر إذا لم يقترب موعد التالية. لا تضاعف الجرعة.',
    ),
  ),
  Medication(
    id: 'omeprazole',
    familyId: 'gastrointestinal',
    name: 'Omeprazole',
    subtitle: 'Proton-pump inhibitor',
    tags: ['Acid suppression', 'Oral'],
    sourceLabel: 'MedlinePlus Drug Information · Omeprazole + product-specific DailyMed labeling',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Confirm indication, intended duration, dosage form and whether the specific formulation can be opened or dispersed. Long-term therapy should remain indication-driven.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يقلل حموضة المعدة ويستخدم لعلاج الحموضة أو القرحة في بعض الحالات.',
      howToUseAr: 'خذ الدواء بالطريقة والمدة المكتوبة لك.',
      timingAr: 'غالبًا يؤخذ قبل الطعام، لكن اتبع تعليمات منتجك ووصفة الطبيب.',
      importantAr: 'لا تطل مدة الاستخدام من نفسك إذا كان العلاج مؤقتًا.',
    ),
  ),
  Medication(
    id: 'paracetamol',
    familyId: 'pain-inflammation',
    name: 'Paracetamol',
    subtitle: 'Analgesic / antipyretic',
    tags: ['Pain', 'Fever', 'OTC'],
    sourceLabel: 'DailyMed · Acetaminophen Drug Facts · updated Aug 2026 + MedlinePlus Acetaminophen',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Check total daily exposure from all combination products, age/weight appropriateness, liver risk and duplicate OTC products.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يخفف الألم والحرارة.',
      howToUseAr: 'استخدم الجرعة المكتوبة لك ولا تكررها أكثر من المسموح.',
      importantAr: 'انتبه من أدوية الزكام أو الألم الأخرى؛ قد تحتوي أيضًا على باراسيتامول.',
      seekHelpAr: 'إذا أخذت كمية أكبر من الموصوفة، اطلب المساعدة الطبية حتى لو كنت تشعر أنك بخير.',
    ),
  ),
  Medication(
    id: 'apixaban',
    familyId: 'anticoagulation',
    name: 'Apixaban',
    subtitle: 'Direct oral anticoagulant',
    tags: ['Anticoagulant', 'Bleeding risk', 'Oral'],
    sourceLabel: 'FDA / DailyMed ELIQUIS (apixaban) prescribing information + MedlinePlus Apixaban',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Verify indication-specific dose, renal/hepatic considerations, interacting medicines, adherence, bleeding risk and planned procedures.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يقلل تكوّن الجلطات.',
      howToUseAr: 'خذه بانتظام حسب الوصفة ولا توقفه من نفسك.',
      importantAr: 'أخبر الطبيب أو طبيب الأسنان أنك تستخدم مميعًا للدم قبل أي إجراء أو عملية.',
      missedDoseAr: 'اتبع تعليمات الجرعة المنسية الخاصة بوصفة أبيكسابان ولا تضاعف الجرعات.',
      seekHelpAr: 'اطلب المساعدة إذا حدث نزف شديد أو مستمر، أو ظهر دم في البول أو البراز، أو تعرضت لضربة قوية على الرأس.',
    ),
  ),
  Medication(
    id: 'cetirizine',
    familyId: 'allergy-dermatology',
    name: 'Cetirizine',
    subtitle: 'Second-generation antihistamine',
    tags: ['Allergy', 'Oral', 'OTC'],
    sourceLabel: 'MedlinePlus Drug Information · Cetirizine',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Confirm indication, renal considerations when relevant and additive sedation with other medicines or alcohol.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يخفف أعراض الحساسية مثل العطاس والحكة وسيلان الأنف.',
      howToUseAr: 'خذ الجرعة المكتوبة لك.',
      commonActionableAr: 'قد يسبب نعاسًا عند بعض الأشخاص. اعرف تأثيره عليك قبل القيادة.',
    ),
  ),

  Medication(
    id: 'amlodipine',
    familyId: 'cardiovascular',
    name: 'Amlodipine',
    subtitle: 'Calcium-channel blocker',
    tags: ['Blood pressure', 'Angina', 'Oral', 'Chronic'],
    sourceLabel: 'MedlinePlus Drug Information · Amlodipine',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Common once-daily antihypertensive. Verify edema, dizziness, liver disease, adherence and whether the patient expects it to treat an acute chest-pain episode; it is not an acute-relief medicine.',
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'May be taken with or without food, at about the same time every day. Liquid formulations require an appropriate measuring device; suspension products require product-specific storage and shaking instructions.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لخفض ضغط الدم، وقد يُستخدم لبعض أنواع ألم الصدر المزمن.',
      howToUseAr: 'خذ الجرعة مرة يوميًا حسب الوصفة وفي وقت ثابت تقريبًا.',
      timingAr: 'يمكن أخذه مع الطعام أو بدونه.',
      commonActionableAr: 'قد يحدث تورم في القدمين أو الكاحلين أو دوخة عند بعض الأشخاص.',
      importantAr: 'هذا الدواء لا يعالج نوبة ألم الصدر المفاجئة.',
      missedDoseAr: 'إذا تذكرت الجرعة وكان موعد التالية قريبًا، اترك الجرعة المنسية ولا تضاعف الجرعات.',
      seekHelpAr: 'اطلب المساعدة إذا حدث إغماء أو أصبح ألم الصدر أشد أو أكثر تكرارًا.',
    ),
  ),
  Medication(
    id: 'lisinopril',
    familyId: 'cardiovascular',
    name: 'Lisinopril',
    subtitle: 'ACE inhibitor',
    tags: ['Blood pressure', 'Heart failure', 'Oral', 'Chronic'],
    sourceLabel: 'MedlinePlus Drug Information · Lisinopril',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Verify renal function, potassium, pregnancy status, volume depletion and interacting potassium-raising therapy. Counsel about cough, dizziness and angioedema red flags.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Usually taken once daily at around the same time. Food does not need to be used routinely to improve absorption.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لخفض ضغط الدم، وقد يُستخدم لحماية القلب في بعض الحالات.',
      howToUseAr: 'خذ الجرعة حسب الوصفة وفي نفس الوقت تقريبًا كل يوم.',
      importantAr: 'لا تستخدم مكملات البوتاسيوم أو بدائل الملح الغنية بالبوتاسيوم من نفسك.',
      commonActionableAr: 'قد يسبب سعالًا جافًا أو دوخة عند بعض الأشخاص.',
      seekHelpAr: 'اطلب مساعدة عاجلة إذا ظهر تورم في الوجه أو الشفتين أو اللسان أو صعوبة في التنفس. إذا حدث حمل أوقفي استخدامه وراجعي الطبيب فورًا.',
    ),
  ),
  Medication(
    id: 'glimepiride',
    familyId: 'diabetes-endocrine',
    name: 'Glimepiride',
    subtitle: 'Sulfonylurea',
    tags: ['Diabetes', 'Oral', 'Hypoglycemia'],
    sourceLabel: 'MedlinePlus Drug Information · Glimepiride',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Hypoglycemia counseling is essential. Review renal/hepatic function, meal pattern, older age, alcohol use, glucose monitoring and medicines that can alter glycemic control.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Usually taken once daily with breakfast or the first main meal of the day, at around the same time each day.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد على خفض سكر الدم في السكري من النوع الثاني.',
      howToUseAr: 'خذ الجرعة مع الفطور أو أول وجبة رئيسية في اليوم حسب وصفتك.',
      importantAr: 'لا تتناول الجرعة ثم تتجاوز الوجبة؛ انتبه لأعراض هبوط السكر.',
      commonActionableAr: 'إذا شعرت برجفة أو تعرق أو جوع شديد أو دوخة، افحص السكر وتعامل مع الهبوط حسب الخطة التي أعطيت لك.',
      missedDoseAr: 'خذ الجرعة عندما تتذكر إذا لم يقترب موعد التالية، ولا تضاعف الجرعة.',
    ),
  ),
  Medication(
    id: 'insulin-glargine',
    familyId: 'diabetes-endocrine',
    name: 'Insulin Glargine',
    subtitle: 'Long-acting basal insulin',
    tags: ['Diabetes', 'Injection', 'Pen', 'High alert'],
    hasVisualGuide: true,
    sourceLabel: 'MedlinePlus Drug Information · Insulin Glargine',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Confirm exact insulin glargine product/concentration and device. Teach hypoglycemia recognition, injection-site rotation, storage, pen technique and never sharing pens or needles.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Typically injected subcutaneously once daily at the same time. Do not dilute or mix insulin glargine with another insulin unless an exact product label explicitly says otherwise; standard glargine products should not be mixed.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يوفر إنسولين طويل المفعول للمساعدة على ضبط سكر الدم طوال اليوم.',
      howToUseAr: 'استخدم الجرعة في نفس الوقت كل يوم وبالطريقة التي شرحها لك الصيدلي.',
      importantAr: 'تأكد دائمًا من اسم الإنسولين وتركيزه قبل الحقن. لا تشارك القلم أو الإبرة مع أي شخص.',
      commonActionableAr: 'أهم مشكلة هي هبوط السكر؛ تعرّف على أعراضه واحمل معك مصدرًا سريعًا للسكر حسب خطتك.',
      storageAr: 'الحفظ يختلف قبل وبعد بدء استخدام القلم أو العبوة؛ اتبع تعليمات منتجك بالضبط.',
      teachBackAr: 'أرني كيف تتأكد من اسم الإنسولين، تركب الإبرة، تختار موضع الحقن، وتتخلص من الإبرة.',
    ),
  ),
  Medication(
    id: 'budesonide-formoterol',
    familyId: 'respiratory',
    name: 'Budesonide / Formoterol Inhaler',
    subtitle: 'ICS / LABA combination inhaler',
    tags: ['Asthma', 'COPD', 'Inhaler', 'Device'],
    hasVisualGuide: true,
    sourceLabel: 'MedlinePlus Drug Information · Budesonide and Formoterol Oral Inhalation',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Technique and regimen are product-specific. Confirm exact inhaler, prescribed maintenance/rescue plan, dose counter, priming, spacer compatibility and whether the patient is overusing reliever therapy.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'After each dose',
        body:
            'Because the combination contains an inhaled corticosteroid, instruct the patient to rinse the mouth with water and spit it out after inhalation.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد على السيطرة على الربو أو مرض الانسداد الرئوي حسب حالتك.',
      howToUseAr: 'استخدم البخاخ بالطريقة الخاصة بجهازك وبعدد البخات المكتوب لك.',
      importantAr: 'بعد الجرعة تمضمض بالماء وابصقه ولا تبتلعه. لا تغيّر خطة بخاخ الإسعاف من نفسك لأن طريقة استخدام هذا الدواء قد تختلف حسب الخطة التي وصفها الطبيب.',
      teachBackAr: 'أرني طريقة استخدام البخاخ كاملة، ثم قل لي ماذا تفعل بعد الجرعة.',
    ),
  ),
  Medication(
    id: 'montelukast',
    familyId: 'respiratory',
    name: 'Montelukast',
    subtitle: 'Leukotriene receptor antagonist',
    tags: ['Asthma', 'Allergy', 'Oral'],
    sourceLabel: 'MedlinePlus Drug Information · Montelukast',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Not an acute rescue treatment. Neuropsychiatric counseling is essential because serious mood, sleep and behavior changes are a boxed-warning concern.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم للسيطرة على الربو أو بعض أعراض الحساسية حسب وصف الطبيب.',
      howToUseAr: 'خذه بالوقت والجرعة المكتوبين لك، ولا تستخدمه بدل بخاخ الإسعاف عند ضيق النفس المفاجئ.',
      importantAr: 'راقب أي تغير واضح في المزاج أو النوم أو السلوك.',
      seekHelpAr: 'اتصل بالطبيب فورًا إذا ظهرت أفكار بإيذاء النفس أو تغيرات نفسية أو سلوكية شديدة وغير معتادة.',
    ),
  ),
  Medication(
    id: 'ibuprofen',
    familyId: 'pain-inflammation',
    name: 'Ibuprofen',
    subtitle: 'NSAID analgesic / antipyretic',
    tags: ['Pain', 'Fever', 'NSAID', 'OTC'],
    sourceLabel: 'MedlinePlus Drug Information + DailyMed OTC labeling · Ibuprofen',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Check age/weight, renal disease, ulcer/GI bleeding history, anticoagulants, pregnancy, cardiovascular risk and duplicate NSAID use. Use the lowest effective dose for the shortest appropriate duration.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Food or milk may reduce stomach upset. Liquid pediatric products require concentration-specific measurement with an appropriate device.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يخفف الألم والالتهاب والحرارة.',
      howToUseAr: 'خذ الجرعة حسب العبوة أو الوصفة، ويفضل مع الطعام إذا أزعج المعدة.',
      importantAr: 'لا تجمعه من نفسك مع مسكنات أخرى من نفس العائلة مثل naproxen أو diclofenac.',
      seekHelpAr: 'أوقفه واطلب المساعدة إذا ظهر قيء دموي أو براز أسود أو ألم معدة شديد أو ضيق نفس.',
    ),
  ),
  Medication(
    id: 'warfarin',
    familyId: 'anticoagulation',
    name: 'Warfarin',
    subtitle: 'Vitamin K antagonist anticoagulant',
    tags: ['Anticoagulant', 'INR', 'Bleeding risk'],
    sourceLabel: 'MedlinePlus Drug Information · Warfarin',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'INR-guided therapy with major food/drug interaction potential. Review adherence, bleeding, new medicines/antibiotics, alcohol, falls, procedures and vitamin K intake.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Take once daily at about the same time, with or without food. The goal is consistent vitamin K intake rather than avoiding vitamin K completely.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يقلل قدرة الدم على تكوين الجلطات.',
      howToUseAr: 'خذ الجرعة في نفس الوقت تقريبًا كل يوم واتبع نتيجة فحص INR وتعديلات الطبيب بدقة.',
      importantAr: 'حافظ على كمية الخضار الغنية بفيتامين K بشكل ثابت نسبيًا ولا تغيّرها فجأة. أخبر الصيدلي قبل بدء أي دواء أو مكمل جديد.',
      seekHelpAr: 'اطلب المساعدة إذا حدث نزف شديد أو مستمر، دم في البول أو البراز، قيء دموي، أو إصابة قوية خصوصًا في الرأس.',
    ),
  ),
  Medication(
    id: 'rivaroxaban',
    familyId: 'anticoagulation',
    name: 'Rivaroxaban',
    subtitle: 'Factor Xa inhibitor',
    tags: ['Anticoagulant', 'Oral', 'Bleeding risk'],
    sourceLabel: 'MedlinePlus Drug Information · Rivaroxaban',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Verify indication-specific dose, renal/hepatic function, interacting medicines, adherence and procedure planning. Food instructions differ by tablet strength and indication, so do not generalize.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لعلاج أو منع بعض أنواع الجلطات.',
      howToUseAr: 'خذ الجرعة تمامًا كما كُتبت لك وفي نفس الوقت تقريبًا كل يوم.',
      timingAr: 'بعض جرعات rivaroxaban يجب أن تؤخذ مع الطعام وبعضها لا يشترط ذلك؛ اتبع تعليمات قوتك ووصفة الطبيب.',
      importantAr: 'لا توقف الدواء من نفسك لأن التوقف قد يزيد خطر الجلطات.',
      seekHelpAr: 'اطلب المساعدة عند نزف شديد أو مستمر، دم في البول أو البراز، أو بعد ضربة قوية على الرأس.',
    ),
  ),
  Medication(
    id: 'fexofenadine',
    familyId: 'allergy-dermatology',
    name: 'Fexofenadine',
    subtitle: 'Second-generation antihistamine',
    tags: ['Allergy', 'Hives', 'Oral', 'OTC'],
    sourceLabel: 'MedlinePlus Drug Information · Fexofenadine',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'A relatively non-sedating antihistamine. Fruit juices can reduce absorption; review antacid timing and product-specific age/strength.',
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Take with water. Avoid taking the dose with apple, orange or grapefruit juice.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يخفف أعراض الحساسية والحكة والشرى.',
      howToUseAr: 'خذ الجرعة مع الماء.',
      importantAr: 'لا تأخذه مع عصير التفاح أو البرتقال أو الجريب فروت لأن ذلك قد يقلل امتصاصه.',
    ),
  ),
  Medication(
    id: 'methotrexate-rheumatology',
    familyId: 'rheumatology-immunology',
    name: 'Methotrexate',
    subtitle: 'Conventional DMARD',
    tags: ['Rheumatology', 'Weekly', 'High alert'],
    sourceLabel: 'DailyMed + MedlinePlus Drug Information · Methotrexate',
    sections: [
      MedicationSection(
        title: 'Critical schedule',
        body:
            'For many non-oncology inflammatory indications, oral methotrexate is taken once weekly, not daily. Daily administration errors have caused fatal toxicity.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Review pregnancy status, CBC, liver and renal monitoring, interacting medicines, infection, mouth ulcers and pulmonary symptoms. Folic acid co-therapy is common but should follow the prescribed plan.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يقلل نشاط الالتهاب في أمراض مثل الروماتويد والصدفية حسب حالتك.',
      howToUseAr: 'إذا وُصف لك للالتهاب أو الروماتيزم فعادة يؤخذ في يوم محدد من الأسبوع؛ اتبع اليوم المكتوب لك بدقة.',
      importantAr: 'لا تأخذه يوميًا إلا إذا كانت لديك خطة علاج مختلفة ومؤكدة من الطبيب. لا تستخدمه أثناء الحمل.',
      seekHelpAr: 'تواصل مع الطبيب إذا ظهرت حرارة أو التهاب شديد، تقرحات فم كثيرة، ضيق نفس جديد، أو نزف وكدمات غير معتادة.',
      teachBackAr: 'ما هو يوم الميثوتركسيت عندك؟ وكم مرة في الأسبوع ستأخذه؟',
    ),
  ),
  Medication(
    id: 'upadacitinib',
    familyId: 'rheumatology-immunology',
    name: 'Upadacitinib',
    subtitle: 'JAK inhibitor',
    tags: ['JAK inhibitor', 'Extended release', 'Immunomodulator'],
    sourceLabel: 'MedlinePlus Drug Information · Upadacitinib',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Review infection/TB screening, vaccination status, CBC/lipids/liver tests as appropriate, thrombotic/cardiovascular risk, malignancy risk and interacting medicines.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Extended-release tablets are taken with or without food and must be swallowed whole; do not split, chew or crush.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يقلل نشاط جهاز المناعة لعلاج بعض الأمراض الالتهابية.',
      howToUseAr: 'خذ القرص ممتد المفعول كاملًا مع الطعام أو بدونه، ولا تسحقه أو تكسره أو تمضغه.',
      importantAr: 'أخبر الطبيب إذا ظهرت عدوى أو حرارة، ولا تبدأ لقاحًا أو دواءً جديدًا دون مراجعة عند الحاجة.',
      seekHelpAr: 'اطلب المساعدة إذا ظهر ألم صدر أو ضيق نفس مفاجئ أو تورم مؤلم في ساق واحدة، أو علامات عدوى شديدة.',
    ),
  ),
  Medication(
    id: 'tofacitinib',
    familyId: 'rheumatology-immunology',
    name: 'Tofacitinib',
    subtitle: 'JAK inhibitor',
    tags: ['JAK inhibitor', 'Immunomodulator', 'Oral'],
    sourceLabel: 'DailyMed + MedlinePlus Drug Information · Tofacitinib',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Serious infection, malignancy, major cardiovascular event and thrombosis warnings require risk assessment and monitoring. Distinguish immediate-release, extended-release and oral-solution formulations.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Immediate-release tablets/oral solution are generally used twice daily and extended-release tablets once daily, with or without food, according to the prescribed formulation.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يقلل نشاط جهاز المناعة لعلاج بعض الأمراض الالتهابية.',
      howToUseAr: 'استخدم فقط الشكل والجرعة المكتوبين لك؛ الأقراص العادية والممتدة المفعول ليست نفس الشيء.',
      importantAr: 'لا توقف أو تغيّر الجرعة من نفسك، وأخبر الطبيب عن أي عدوى أو حرارة مستمرة.',
      seekHelpAr: 'اطلب المساعدة عند ضيق نفس مفاجئ، ألم صدر، تورم مؤلم في الساق، أو عدوى شديدة.',
    ),
  ),
  Medication(
    id: 'dupilumab',
    familyId: 'allergy-dermatology',
    name: 'Dupilumab',
    subtitle: 'Monoclonal antibody injection',
    tags: ['Biologic', 'Injection', 'Dermatology', 'Asthma'],
    sourceLabel: 'MedlinePlus Drug Information · Dupilumab',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Confirm indication-specific schedule and device. Teach refrigerator handling, warming to room temperature per product instructions, no shaking, site rotation, one-time use and sharps disposal.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لبعض حالات الحساسية والالتهاب مثل الإكزيما والربو حسب وصف الطبيب.',
      howToUseAr: 'استخدم القلم أو السرنجة بالطريقة التي تم تدريبك عليها وغيّر موضع الحقن كل مرة.',
      importantAr: 'لا ترجّ القلم أو السرنجة ولا تسخنه بالميكروويف أو الماء الساخن. اتركه يصل لحرارة الغرفة بالطريقة المحددة للمنتج.',
      storageAr: 'يحفظ في الثلاجة حسب تعليمات المنتج ولا يُجمّد.',
      teachBackAr: 'أرني أين ستحقن، وكيف تترك الدواء يصل لحرارة الغرفة، وأين ستتخلص من القلم أو السرنجة.',
    ),
  ),
  Medication(
    id: 'tamsulosin',
    familyId: 'urology',
    name: 'Tamsulosin',
    subtitle: 'Alpha-1 blocker',
    tags: ['BPH', 'Urinary symptoms', 'Oral'],
    sourceLabel: 'MedlinePlus Drug Information · Tamsulosin',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Take once daily about 30 minutes after the same meal each day. Swallow capsules whole; do not split, chew, crush or open.',
      ),
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Counsel about orthostatic dizziness/fainting, interaction review and notifying the ophthalmic surgeon before cataract or glaucoma surgery.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد على تحسين تدفق البول عند تضخم البروستات.',
      howToUseAr: 'خذ الجرعة مرة يوميًا بعد 30 دقيقة من نفس الوجبة كل يوم.',
      importantAr: 'ابتلع الكبسولة كاملة ولا تفتحها أو تسحقها.',
      commonActionableAr: 'قد يسبب دوخة عند الوقوف، خاصة في البداية؛ انهض ببطء.',
      seekHelpAr: 'إذا حدث إغماء متكرر أو دوخة شديدة، راجع الطبيب.',
    ),
  ),
  Medication(
    id: 'polyethylene-glycol-3350',
    familyId: 'gastrointestinal',
    name: 'Polyethylene Glycol 3350',
    subtitle: 'Osmotic laxative',
    tags: ['Constipation', 'OTC', 'Powder'],
    sourceLabel: 'MedlinePlus Drug Information · Polyethylene Glycol 3350',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Dissolve the measured product dose in the volume of liquid specified by the product; MedlinePlus describes 8 oz (240 mL) for standard PEG 3350 products. Effect may take 2–4 days.',
      ),
      MedicationSection(
        title: 'Referral limits',
        body:
            'For occasional constipation, avoid prolonged unsupervised use. Evaluate alarm symptoms such as suspected bowel obstruction, severe pain, vomiting or persistent constipation.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد على تليين البراز وعلاج الإمساك.',
      howToUseAr: 'أذب الجرعة المقاسة بالكامل في كمية السائل المكتوبة على المنتج واشربها.',
      importantAr: 'قد يحتاج من يومين إلى أربعة أيام ليظهر مفعوله، فلا تكرر الجرعة أكثر من التعليمات.',
      seekHelpAr: 'راجع الطبيب إذا كان لديك ألم بطن شديد أو قيء أو انتفاخ شديد أو استمر الإمساك.',
    ),
  ),
  Medication(
    id: 'lactulose',
    familyId: 'gastrointestinal',
    name: 'Lactulose',
    subtitle: 'Osmotic laxative',
    tags: ['Constipation', 'Oral liquid'],
    sourceLabel: 'MedlinePlus Drug Information · Lactulose',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Confirm indication because constipation and hepatic encephalopathy use different titration goals. Review diabetes, excessive diarrhea, dehydration and interacting laxatives.',
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Measure liquid doses with an appropriate measuring device and follow the prescribed frequency; do not use a household spoon.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لعلاج الإمساك، وقد يُستخدم لحالات معينة مرتبطة بأمراض الكبد.',
      howToUseAr: 'قِس الجرعة بأداة قياس دوائية وليس بملعقة منزلية.',
      commonActionableAr: 'قد يسبب غازات أو مغصًا أو إسهالًا. إذا أصبح الإسهال شديدًا أو مستمرًا راجع الطبيب.',
    ),
  ),
  Medication(
    id: 'loperamide',
    familyId: 'otc',
    name: 'Loperamide',
    subtitle: 'Antidiarrheal',
    tags: ['Diarrhea', 'OTC', 'Short course'],
    sourceLabel: 'MedlinePlus Drug Information · Loperamide',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Use for appropriate acute diarrhea only. Avoid excess dosing because serious cardiac arrhythmias and death have occurred with overdose/misuse. Do not use in children under 2 years.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Referral limits',
        body:
            'Assess fever, blood/mucus in stool, severe abdominal pain/distension, dehydration, recent antibiotics and duration before recommending OTC use.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يقلل عدد مرات الإسهال في بعض حالات الإسهال الحاد.',
      howToUseAr: 'استخدم فقط الجرعة المكتوبة على العبوة أو الوصفة ولا تتجاوز الحد اليومي.',
      importantAr: 'لا تستخدم جرعات أعلى أو مدة أطول من التعليمات؛ الجرعات الزائدة قد تسبب اضطرابًا خطيرًا في ضربات القلب.',
      seekHelpAr: 'راجع الطبيب إذا كان الإسهال مصحوبًا بدم أو حرارة مرتفعة أو ألم شديد، أو إذا لم يتحسن خلال المدة المحددة على المنتج.',
    ),
  ),
  Medication(
    id: 'ondansetron-oral',
    familyId: 'gastrointestinal',
    name: 'Ondansetron Oral',
    subtitle: '5-HT3 antagonist antiemetic',
    tags: ['Nausea', 'Vomiting', 'Tablet', 'ODT'],
    sourceLabel: 'MedlinePlus Drug Information · Ondansetron',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Confirm formulation and QT-risk context. The orally disintegrating tablet has a specific blister-opening technique; film products have different handling.',
      ),
      MedicationSection(
        title: 'ODT technique',
        body:
            'With dry hands, peel back the foil rather than pushing the tablet through it, place the ODT on top of the tongue and allow it to dissolve.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لمنع أو تقليل الغثيان والقيء حسب السبب.',
      howToUseAr: 'إذا كان النوع يذوب بالفم، افتح الشريط بيدين جافتين وانزع ورق الألمنيوم ثم ضع الحبة على اللسان لتذوب.',
      importantAr: 'لا تتعامل مع كل أشكال ondansetron بنفس الطريقة؛ الحبة العادية والحبة الذائبة والفيلم تختلف.',
      seekHelpAr: 'أخبر الطبيب إذا حدث خفقان شديد أو إغماء، خاصة إذا لديك مشكلة سابقة في نظم القلب.',
    ),
  ),

  Medication(
    id: 'levonorgestrel-ec',
    familyId: 'womens-health',
    name: 'Levonorgestrel Emergency Contraception',
    subtitle: 'Emergency progestin contraception',
    tags: ['Emergency contraception', 'Oral', 'Women’s health'],
    sourceLabel: 'MedlinePlus Drug Information · Levonorgestrel',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Confirm timing since unprotected intercourse, vomiting after the dose, interacting enzyme-inducing medicines, body-weight/BMI considerations where relevant, ongoing contraception plan and need for STI counseling.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'Role',
        body:
            'This is emergency/backup contraception and is not intended to replace a regular contraceptive method. It does not protect against sexually transmitted infections.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لتقليل احتمال الحمل بعد جماع غير محمي أو فشل وسيلة منع الحمل.',
      howToUseAr: 'خذي الجرعة حسب المنتج وفي أسرع وقت ممكن ضمن المدة المسموحة له.',
      importantAr: 'هذا الدواء ليس وسيلة منع حمل يومية ولا يحمي من الأمراض المنقولة جنسيًا.',
      seekHelpAr: 'إذا تأخرت الدورة بشكل واضح أو ظهرت أعراض حمل، اعملي فحص حمل وراجعي الطبيب أو الصيدلي.',
    ),
  ),
  Medication(
    id: 'latanoprost',
    familyId: 'eye-ear',
    name: 'Latanoprost Eye Drops',
    subtitle: 'Prostaglandin-analog glaucoma therapy',
    tags: ['Eye drops', 'Glaucoma', 'Device technique'],
    hasVisualGuide: true,
    sourceLabel: 'MedlinePlus Drug Information · Latanoprost Ophthalmic',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Usually one drop in the affected eye(s) once daily in the evening. Separate other eye drops by at least 5 minutes. Contact lenses should be removed before dosing and can generally be reinserted after the interval specified by the product.',
      ),
      MedicationSection(
        title: 'Technique',
        body:
            'Avoid touching the dropper tip to the eye or other surfaces. Demonstrate lower-lid pocket technique and product-specific storage after opening.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لخفض ضغط العين في الجلوكوما أو ارتفاع ضغط العين.',
      howToUseAr: 'ضع قطرة واحدة في العين المصابة مساءً حسب الوصفة، ولا تجعل فوهة العبوة تلمس العين.',
      timingAr: 'إذا كنت تستخدم قطرات أخرى للعين، اترك بينها وبين latanoprost خمس دقائق على الأقل.',
      importantAr: 'قد يغيّر لون القزحية أو يزيد طول وكثافة الرموش تدريجيًا.',
      teachBackAr: 'أرني كيف ستضع القطرة من دون أن تلمس الفوهة العين أو الرموش.',
    ),
  ),
  Medication(
    id: 'paracetamol-pediatric-liquid',
    familyId: 'pediatrics',
    name: 'Paracetamol Pediatric Liquid',
    subtitle: 'Pediatric analgesic / antipyretic liquid',
    tags: ['Pediatric', 'Liquid', 'Pain', 'Fever'],
    sourceLabel: 'MedlinePlus Drug Information · Acetaminophen',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Dose by the child’s weight and the exact product concentration. Verify the concentration on every bottle and use the supplied oral syringe/cup; do not transfer a volume from a different formulation.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Duplicate-ingredient check',
        body:
            'Acetaminophen/paracetamol is present in many cough/cold combination products. Check all labels to prevent accidental duplicate dosing.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لتخفيف الألم وخفض الحرارة عند الطفل.',
      howToUseAr: 'استخدم فقط الحجم المكتوب لطفلك حسب وزنه وتركيز هذه العبوة، واستعمل السرنجة أو أداة القياس المرفقة.',
      importantAr: 'لا تستخدم نفس عدد mL من عبوة مختلفة قبل التأكد من التركيز، ولا تجمعه مع دواء زكام يحتوي أيضًا على باراسيتامول.',
      seekHelpAr: 'إذا أخذ الطفل كمية أكبر من الموصوفة، اطلب المساعدة الطبية حتى لو لم تظهر أعراض.',
      teachBackAr: 'أرني تركيز العبوة، ثم أرني الحجم الذي ستقيسه بالسرنجة.',
    ),
  ),

  Medication(
    id: 'atorvastatin',
    familyId: 'cardiovascular',
    name: 'Atorvastatin',
    subtitle: 'Statin lipid-lowering therapy',
    tags: ['Cholesterol', 'Cardiovascular prevention', 'Oral'],
    sourceLabel: 'MedlinePlus Drug Information · Atorvastatin',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Confirm indication, liver history, interacting medicines and muscle-symptom risk. The tablet can be taken once daily with or without food; the oral suspension has different fasting instructions.',
      ),
      MedicationSection(
        title: 'Formulation distinction',
        body:
            'Do not apply tablet counseling to the suspension. MedlinePlus advises tablets with or without food, while the suspension is taken on an empty stomach.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يخفض الكوليسترول ويساعد على تقليل خطر الجلطات القلبية والدماغية عند من يحتاجه.',
      howToUseAr: 'إذا كان دواؤك أقراص atorvastatin فخذه مرة يوميًا في وقت ثابت تقريبًا، مع الطعام أو بدونه.',
      importantAr: 'إذا كان المنتج شرابًا أو معلقًا فلا تطبق نفس تعليمات الأقراص؛ اتبع تعليمات المنتج.',
      seekHelpAr: 'راجع الطبيب إذا ظهر ألم أو ضعف عضلي شديد وغير معتاد، خصوصًا إذا ترافق مع تعب شديد أو بول غامق.',
    ),
  ),
  Medication(
    id: 'metoprolol',
    familyId: 'cardiovascular',
    name: 'Metoprolol',
    subtitle: 'Beta-blocker',
    tags: ['Blood pressure', 'Heart rate', 'Heart failure', 'Oral'],
    sourceLabel: 'MedlinePlus Drug Information · Metoprolol',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Distinguish immediate-release from extended-release products. Review heart rate, blood pressure, asthma/COPD history, diabetes and abrupt-withdrawal risk.',
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Regular tablets are taken with meals or immediately after meals. Extended-release products are generally once daily; use the exact product instructions.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لخفض ضغط الدم أو إبطاء ضربات القلب أو دعم علاج القلب حسب حالتك.',
      howToUseAr: 'خذ الدواء في نفس الوقت تقريبًا كل يوم، وإذا كان النوع العادي فخذه مع الوجبة أو بعدها مباشرة حسب الوصفة.',
      importantAr: 'لا توقف metoprolol فجأة من نفسك.',
      commonActionableAr: 'قد يسبب دوخة أو تعبًا أو بطء النبض عند بعض الأشخاص.',
      seekHelpAr: 'راجع الطبيب إذا حدث إغماء أو بطء شديد في النبض أو ضيق نفس جديد.',
    ),
  ),
  Medication(
    id: 'spironolactone',
    familyId: 'cardiovascular',
    name: 'Spironolactone',
    subtitle: 'Mineralocorticoid receptor antagonist',
    tags: ['Heart failure', 'Edema', 'Blood pressure', 'Potassium'],
    sourceLabel: 'MedlinePlus Drug Information · Spironolactone',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Monitor potassium and renal function when indicated. Review ACEI/ARB use, potassium supplements, salt substitutes and product formulation because tablet and suspension are not automatically interchangeable.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Take once or twice daily as prescribed. For suspension, MedlinePlus advises being consistent: always take it with food or always without food.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد الجسم على التخلص من السوائل الزائدة ويُستخدم في بعض حالات القلب والضغط.',
      howToUseAr: 'خذ الجرعة في نفس الأوقات تقريبًا كل يوم.',
      importantAr: 'لا تستخدم مكملات البوتاسيوم أو بدائل الملح الغنية بالبوتاسيوم من نفسك.',
      commonActionableAr: 'قد يزيد التبول وقد يسبب دوخة؛ انهض ببطء واشرب السوائل حسب تعليمات طبيبك.',
    ),
  ),
  Medication(
    id: 'empagliflozin',
    familyId: 'diabetes-endocrine',
    name: 'Empagliflozin',
    subtitle: 'SGLT2 inhibitor',
    tags: ['Diabetes', 'Heart failure', 'Kidney protection', 'Oral'],
    sourceLabel: 'MedlinePlus Drug Information · Empagliflozin',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Review renal function, volume status, genital/urinary infection history, ketoacidosis risk, ketogenic diet, sick-day plan and planned surgery. MedlinePlus notes withholding before surgery may be required.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Usually taken once daily in the morning with or without food, at around the same time every day.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد على خفض السكر، وقد يفيد القلب أو الكلى في بعض الحالات.',
      howToUseAr: 'خذه مرة يوميًا صباحًا تقريبًا، مع الطعام أو بدونه.',
      importantAr: 'اهتم بشرب السوائل حسب تعليمات الطبيب، وأخبر الفريق الطبي أنك تستخدمه قبل أي عملية.',
      commonActionableAr: 'قد يزيد التبول وقد تحدث التهابات فطرية أو بولية عند بعض الأشخاص.',
      seekHelpAr: 'أوقفه واطلب المساعدة إذا ظهر غثيان أو قيء أو ألم بطن مع تعب شديد أو صعوبة تنفس حتى لو لم يكن السكر مرتفعًا جدًا.',
    ),
  ),
  Medication(
    id: 'levothyroxine',
    familyId: 'diabetes-endocrine',
    name: 'Levothyroxine',
    subtitle: 'Thyroid hormone replacement',
    tags: ['Hypothyroidism', 'Oral', 'Chronic'],
    sourceLabel: 'MedlinePlus Drug Information · Levothyroxine',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Consistency is critical. Review formulation/brand changes, calcium/iron separation, interacting medicines, TSH monitoring and incorrect use for weight loss.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Usually taken once daily on an empty stomach 30–60 minutes before breakfast. Calcium carbonate and ferrous sulfate should be separated by at least 4 hours.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يعوض هرمون الغدة الدرقية عندما يكون ناقصًا.',
      howToUseAr: 'خذه على معدة فارغة قبل الفطور بـ30 إلى 60 دقيقة، وحافظ على نفس الطريقة يوميًا.',
      importantAr: 'افصل الكالسيوم والحديد عن levothyroxine أربع ساعات على الأقل.',
      timingAr: 'الانتظام مهم جدًا؛ لا تغيّر وقت وطريقة أخذه باستمرار.',
      seekHelpAr: 'راجع الطبيب إذا ظهر خفقان شديد أو رجفة أو ألم صدر أو تعرق زائد بعد تعديل الجرعة.',
    ),
  ),
  Medication(
    id: 'sertraline',
    familyId: 'cns',
    name: 'Sertraline',
    subtitle: 'SSRI antidepressant',
    tags: ['Depression', 'Anxiety', 'OCD', 'Oral'],
    sourceLabel: 'MedlinePlus Drug Information · Sertraline',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Set expectations that benefit may take several weeks. Review suicidality risk in younger patients, serotonin interactions, withdrawal risk, adherence and formulation-specific liquid dilution.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Taken once daily in the morning or evening at about the same time. Do not stop abruptly; tapering is generally required.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم للاكتئاب أو القلق وبعض الاضطرابات الأخرى حسب حالتك.',
      howToUseAr: 'خذه مرة يوميًا في وقت ثابت، صباحًا أو مساءً حسب ما يناسبك ووصفة الطبيب.',
      importantAr: 'لا توقفه فجأة من نفسك؛ قد تحتاج الجرعة إلى تقليل تدريجي.',
      commonActionableAr: 'قد يحتاج عدة أسابيع حتى يظهر التحسن الكامل.',
      seekHelpAr: 'اطلب مساعدة فورًا إذا ظهرت أفكار بإيذاء النفس أو تدهور شديد ومفاجئ في المزاج أو السلوك.',
    ),
  ),
  Medication(
    id: 'gabapentin',
    familyId: 'cns',
    name: 'Gabapentin',
    subtitle: 'Antiseizure / neuropathic pain medicine',
    tags: ['Neuropathic pain', 'Seizure', 'Oral'],
    sourceLabel: 'MedlinePlus Drug Information · Gabapentin',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Distinguish immediate-release from extended-release products; they are not interchangeable. Review renal function, sedation/falls, respiratory depressant co-medications and gradual discontinuation.',
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Immediate-release capsules/tablets/solution may be taken with or without food; extended-release Horizant has different food/timing instructions and must be swallowed whole.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لبعض أنواع آلام الأعصاب أو للمساعدة في السيطرة على نوبات الصرع.',
      howToUseAr: 'خذ النوع الذي وُصف لك بالضبط؛ الأنواع ممتدة المفعول ليست بديلًا مباشرًا عن الأقراص أو الكبسولات العادية.',
      commonActionableAr: 'قد يسبب نعاسًا أو دوخة؛ اعرف تأثيره عليك قبل القيادة.',
      importantAr: 'لا توقفه فجأة من نفسك، خصوصًا إذا كنت تستخدمه للصرع.',
    ),
  ),
  Medication(
    id: 'doxycycline',
    familyId: 'antiinfective',
    name: 'Doxycycline',
    subtitle: 'Tetracycline antibiotic',
    tags: ['Antibiotic', 'Oral', 'Food/mineral interaction'],
    sourceLabel: 'MedlinePlus Drug Information · Doxycycline',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Take with a full glass of water. Food or milk may be used if the stomach is upset, but mineral interactions still matter. Antacids/calcium/magnesium should be separated and iron requires a wider separation interval.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'Formulation distinction',
        body:
            'Delayed-release tablets and specialty doxycycline products have product-specific handling and are not automatically interchangeable.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد حيوي لعلاج بعض الالتهابات، وقد يُستخدم لأسباب أخرى حسب الوصفة.',
      howToUseAr: 'خذ الجرعة مع كوب ماء كامل. إذا أزعج المعدة يمكن أخذه مع الطعام حسب تعليمات منتجك.',
      importantAr: 'افصل مضادات الحموضة والكالسيوم والمغنيسيوم والحديد عن الجرعة حسب تعليمات الصيدلي لأنها قد تقلل امتصاصه.',
      commonActionableAr: 'قد يجعل الجلد أكثر حساسية للشمس؛ استخدم حماية مناسبة من الشمس.',
      missedDoseAr: 'خذ الجرعة عندما تتذكر إذا لم يقترب موعد التالية، ولا تضاعف الجرعة.',
    ),
  ),
  Medication(
    id: 'nitrofurantoin',
    familyId: 'antiinfective',
    name: 'Nitrofurantoin',
    subtitle: 'Urinary antibiotic',
    tags: ['UTI', 'Antibiotic', 'Oral'],
    sourceLabel: 'MedlinePlus Drug Information · Nitrofurantoin',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Take with food and at the prescribed evenly spaced times. Shake liquid formulations well and measure with an appropriate dosing device.',
      ),
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Confirm renal function, pregnancy timing, G6PD status/risk when relevant, duration and whether symptoms fit lower UTI rather than systemic infection.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد حيوي يُستخدم لبعض التهابات المسالك البولية.',
      howToUseAr: 'خذ الجرعة مع الطعام وفي المواعيد المكتوبة لك، وأكمل مدة العلاج.',
      importantAr: 'إذا كان الدواء سائلًا فرجّه جيدًا واستعمل أداة قياس دوائية.',
      seekHelpAr: 'راجع الطبيب إذا لم تتحسن الأعراض، أو ظهرت حرارة شديدة أو ألم في الخاصرة، أو ضيق نفس أو اصفرار في الجلد أو العينين.',
    ),
  ),
  Medication(
    id: 'clindamycin-oral',
    familyId: 'antiinfective',
    name: 'Clindamycin Oral',
    subtitle: 'Lincosamide antibiotic',
    tags: ['Antibiotic', 'Oral', 'C. difficile risk'],
    sourceLabel: 'MedlinePlus Drug Information · Clindamycin',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'C. difficile-associated diarrhea is a key counseling issue and may occur during treatment or months afterward. Review allergy, indication, duration and interacting medicines.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Swallow capsules whole with a full glass of water and remain upright for at least 30 minutes to reduce throat irritation.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد حيوي لعلاج بعض الالتهابات البكتيرية.',
      howToUseAr: 'ابتلع الكبسولة كاملة مع كوب ماء كامل، ولا تستلقِ مباشرة بعدها لمدة 30 دقيقة.',
      importantAr: 'أكمل مدة العلاج كما وُصفت لك.',
      seekHelpAr: 'تواصل مع الطبيب إذا ظهر إسهال مائي شديد أو دموي أو مغص مع حرارة أثناء العلاج أو حتى بعد انتهائه بفترة.',
    ),
  ),

  Medication(
    id: 'furosemide',
    familyId: 'cardiovascular',
    name: 'Furosemide',
    subtitle: 'Loop diuretic',
    tags: ['Diuretic', 'Edema', 'Heart failure', 'Blood pressure'],
    sourceLabel: 'MedlinePlus Drug Information · Furosemide',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Review renal function, electrolytes, volume status, blood pressure, gout risk and interacting medicines. Dosing frequency varies by indication and may be daily, twice daily or on selected days for edema.',
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Take at the prescribed time(s) consistently. Because the medicine increases urination, timing should fit the patient’s daily routine while following the prescribed schedule.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد الجسم على التخلص من السوائل الزائدة، وقد يُستخدم للضغط أو فشل القلب.',
      howToUseAr: 'خذ الجرعة في الأوقات المكتوبة لك وحافظ على نفس الجدول قدر الإمكان.',
      commonActionableAr: 'سيزيد التبول غالبًا وقد يسبب دوخة عند الوقوف؛ انهض ببطء.',
      importantAr: 'لا تغيّر كمية الملح أو البوتاسيوم أو السوائل بشكل كبير من نفسك إذا كانت لديك تعليمات خاصة من الطبيب.',
      seekHelpAr: 'راجع الطبيب إذا حدث دوار شديد أو إغماء أو عطش شديد مع قلة البول أو تشنجات وضعف غير معتاد.',
    ),
  ),
  Medication(
    id: 'hydrochlorothiazide',
    familyId: 'cardiovascular',
    name: 'Hydrochlorothiazide',
    subtitle: 'Thiazide diuretic',
    tags: ['Blood pressure', 'Diuretic', 'Edema'],
    sourceLabel: 'MedlinePlus Drug Information · Hydrochlorothiazide',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Review blood pressure, sodium/potassium, renal function, uric acid/gout, glucose and interacting medicines. For edema, the prescribed schedule may be intermittent rather than daily.',
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Usually taken once or twice daily according to the indication. Keep the schedule consistent and counsel about increased urination and orthostatic symptoms.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لخفض ضغط الدم أو تقليل احتباس السوائل.',
      howToUseAr: 'خذ الجرعة في الوقت المكتوب لك، ولا تضاعف الجرعة إذا نسيتها.',
      commonActionableAr: 'قد يزيد التبول ويسبب دوخة عند الوقوف؛ انهض ببطء.',
      importantAr: 'إذا كنت تستخدمه للضغط فاستمر عليه حتى لو كنت تشعر أنك بخير، ولا توقفه من نفسك.',
    ),
  ),
  Medication(
    id: 'clopidogrel',
    familyId: 'anticoagulation',
    name: 'Clopidogrel',
    subtitle: 'Antiplatelet medicine',
    tags: ['Antiplatelet', 'Stent', 'Stroke prevention', 'Bleeding'],
    sourceLabel: 'MedlinePlus Drug Information · Clopidogrel',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Confirm indication, stent history, bleeding risk, adherence and interacting medicines including omeprazole/esomeprazole and NSAIDs. Premature interruption after stenting can be dangerous.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Take once daily at about the same time, with or without food.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يمنع الصفائح من تكوين الجلطات ويساعد على حماية القلب أو الدماغ حسب حالتك.',
      howToUseAr: 'خذ حبة واحدة يوميًا في نفس الوقت تقريبًا، مع الطعام أو بدونه.',
      importantAr: 'لا توقفه من نفسك، خصوصًا إذا لديك دعامة في القلب. أخبر الطبيب أو طبيب الأسنان أنك تستخدمه قبل أي إجراء.',
      commonActionableAr: 'قد تنزف أو تظهر الكدمات بسهولة أكثر من المعتاد.',
      seekHelpAr: 'اطلب المساعدة إذا كان النزف شديدًا أو لا يتوقف، أو ظهر براز أسود أو دم في البول أو القيء.',
    ),
  ),
  Medication(
    id: 'nitroglycerin-sublingual',
    familyId: 'cardiovascular',
    name: 'Nitroglycerin Sublingual',
    subtitle: 'Rapid-relief nitrate for angina',
    tags: ['Angina', 'Sublingual', 'Emergency use'],
    sourceLabel: 'MedlinePlus Drug Information · Nitroglycerin Sublingual',
    sections: [
      MedicationSection(
        title: 'Critical technique',
        body:
            'For an angina episode, have the patient sit down and place the tablet under the tongue or between cheek and gum; do not chew, crush or swallow. The emergency plan and repeat-dose timing must match the prescription.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Confirm nitrate-free interval for other nitrate products and screen for phosphodiesterase-5 inhibitor use because the combination can cause profound hypotension.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يخفف ألم الصدر الناتج عن الذبحة بسرعة.',
      howToUseAr: 'عند بداية ألم الصدر اجلس، وضع الحبة تحت اللسان واتركها تذوب. لا تمضغها ولا تبلعها مباشرة.',
      importantAr: 'اتبع خطة الطوارئ التي أعطاها لك الطبيب لعدد الجرعات والفاصل بينها. إذا لم يتحسن ألم الصدر أو أصبح أشد، اطلب المساعدة الطارئة.',
      seekHelpAr: 'ألم الصدر الذي لا يتحسن حسب خطة nitroglycerin يحتاج تقييمًا طارئًا.',
      teachBackAr: 'أرني أين ستضع الحبة، وماذا ستفعل إذا لم يتحسن ألم الصدر.',
    ),
  ),
  Medication(
    id: 'semaglutide-injection',
    familyId: 'diabetes-endocrine',
    name: 'Semaglutide Injection',
    subtitle: 'Once-weekly GLP-1 receptor agonist',
    tags: ['Diabetes', 'Weight management', 'Weekly injection', 'Pen'],
    hasVisualGuide: true,
    sourceLabel: 'MedlinePlus Drug Information · Semaglutide Injection',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Inject subcutaneously once weekly on the same day each week, at any time of day. Rotate injection sites. Never share pens or needles, and follow the exact device IFU because semaglutide products have different pen systems and indications.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Review product/indication, titration stage, GI tolerance, gallbladder/pancreatitis history, diabetic retinopathy context, pregnancy plans and contraindication related to medullary thyroid carcinoma/MEN2 history.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم مرة أسبوعيًا للسكري أو لإنقاص الوزن في حالات محددة حسب المنتج والوصفة.',
      howToUseAr: 'استخدم الحقنة في نفس اليوم من كل أسبوع وبدّل موضع الحقن بين البطن أو الفخذ أو أعلى الذراع حسب تعليمات القلم.',
      importantAr: 'لا تشارك القلم أو الإبرة مع أي شخص، وتأكد من اسم المنتج والجرعة قبل كل حقنة.',
      commonActionableAr: 'الغثيان أو الشبع السريع شائعان خاصة عند زيادة الجرعة؛ تناول وجبات أصغر إذا ساعد ذلك.',
      seekHelpAr: 'اطلب المساعدة إذا ظهر ألم بطن شديد ومستمر قد يمتد إلى الظهر أو قيء مستمر.',
      teachBackAr: 'ما هو يوم الحقنة عندك؟ وأين ستغير موضع الحقن في الجرعة القادمة؟',
    ),
  ),
  Medication(
    id: 'sitagliptin',
    familyId: 'diabetes-endocrine',
    name: 'Sitagliptin',
    subtitle: 'DPP-4 inhibitor',
    tags: ['Diabetes', 'Oral', 'Once daily'],
    sourceLabel: 'MedlinePlus Drug Information · Sitagliptin',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Take once daily at around the same time, with or without food. Oral solution should be measured with an oral syringe or dosing cup rather than a household spoon.',
      ),
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Renal dose adjustment may be required. Review pancreatitis history, heart failure risk and concurrent glucose-lowering therapy.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد على خفض سكر الدم في السكري من النوع الثاني.',
      howToUseAr: 'خذه مرة واحدة يوميًا في نفس الوقت تقريبًا، مع الطعام أو بدونه.',
      importantAr: 'إذا كان الدواء محلولًا فاستعمل سرنجة فموية أو كوب قياس دوائي، وليس ملعقة منزلية.',
      missedDoseAr: 'خذ الجرعة عندما تتذكر إذا لم يقترب موعد التالية. لا تضاعف الجرعة.',
      seekHelpAr: 'راجع الطبيب إذا ظهر ألم شديد ومستمر أعلى البطن مع غثيان أو قيء.',
    ),
  ),
  Medication(
    id: 'tiotropium-capsule-inhalation',
    familyId: 'respiratory',
    name: 'Tiotropium Inhalation Capsule',
    subtitle: 'Long-acting anticholinergic · capsule inhalation device',
    tags: ['COPD', 'Inhaler', 'DPI capsule', 'Maintenance'],
    hasVisualGuide: true,
    sourceLabel: 'MedlinePlus Drug Information · Tiotropium Oral Inhalation',
    sections: [
      MedicationSection(
        title: 'Critical device distinction',
        body:
            'The capsule is for inhalation through the designated device and must not be swallowed. It is maintenance therapy, not a rescue treatment for sudden breathlessness.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Technique',
        body:
            'Use only the inhaler supplied for the capsule product. Product setup, piercing and inhalation steps must follow the exact device instructions.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد على إبقاء الشعب الهوائية مفتوحة وتقليل أعراض الانسداد الرئوي المزمن.',
      howToUseAr: 'ضع الكبسولة في جهاز الاستنشاق المخصص لها واستنشق محتواها بالطريقة التي تعلمتها.',
      importantAr: 'لا تبلع الكبسولة، ولا تستخدم هذا الدواء لعلاج ضيق النفس المفاجئ.',
      teachBackAr: 'أرني أين تضع الكبسولة وكيف تستنشقها، وقل لي أي بخاخ تستخدم عند ضيق النفس المفاجئ.',
    ),
  ),
  Medication(
    id: 'azithromycin',
    familyId: 'antiinfective',
    name: 'Azithromycin',
    subtitle: 'Macrolide antibiotic',
    tags: ['Antibiotic', 'Oral', 'Short course'],
    hasIvPreparation: true,
    sourceLabel: 'MedlinePlus Drug Information · Azithromycin',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Tablets and standard suspension are generally taken once daily with or without food. Shake liquid well and measure with an oral syringe, dosing spoon or measuring cup.',
      ),
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Review QT-risk medicines/conditions, liver disease and the exact formulation. The 1-gram single-dose packet has a specific water-mixing method and should not be counseled like standard suspension.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد حيوي لعلاج بعض الالتهابات البكتيرية.',
      howToUseAr: 'خذ الجرعة في نفس الوقت تقريبًا كل يوم وأكمل المدة المكتوبة لك. يمكن أخذه مع الطعام أو بدونه.',
      importantAr: 'إذا كان الدواء سائلًا فرجّه جيدًا واستعمل أداة قياس دوائية. لا تعالج نزلات البرد والإنفلونزا بالمضاد الحيوي.',
      missedDoseAr: 'خذ الجرعة عندما تتذكر إذا لم يقترب موعد التالية، ولا تضاعف الجرعة.',
      seekHelpAr: 'إذا تقيأت خلال ساعة من الجرعة، تواصل مع الطبيب أو الصيدلي قبل إعادة الجرعة.',
    ),
  ),
  Medication(
    id: 'acyclovir-oral',
    familyId: 'antiinfective',
    name: 'Acyclovir Oral',
    subtitle: 'Antiviral medicine',
    tags: ['Antiviral', 'Herpes', 'Oral'],
    sourceLabel: 'MedlinePlus Drug Information · Acyclovir',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'May be taken with or without food at evenly spaced times according to the prescribed regimen. Encourage adequate fluid intake unless the patient has a fluid restriction.',
      ),
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Review renal function, dehydration risk and indication-specific duration. Starting treatment promptly after symptom onset can matter for episodic herpes therapy.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد فيروسات يُستخدم لبعض عدوى الهربس والحزام الناري وغيرها حسب الوصفة.',
      howToUseAr: 'خذ الجرعات في أوقات متباعدة بشكل منتظم، مع الطعام أو بدونه.',
      importantAr: 'اشرب سوائل كافية أثناء العلاج ما لم يكن الطبيب قد طلب منك تحديد السوائل.',
      missedDoseAr: 'خذ الجرعة عندما تتذكر ثم أكمل باقي جرعات اليوم بشكل متباعد. لا تضاعف الجرعة.',
    ),
  ),
  Medication(
    id: 'metronidazole-oral',
    familyId: 'antiinfective',
    name: 'Metronidazole Oral',
    subtitle: 'Nitroimidazole antimicrobial',
    tags: ['Antibiotic', 'Oral', 'Alcohol interaction'],
    sourceLabel: 'MedlinePlus Drug Information · Metronidazole',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Regimen varies widely by infection and may be a one-time dose or multiple daily doses. Shake suspension well and measure with a medication device.',
      ),
      MedicationSection(
        title: 'Alcohol / propylene glycol',
        body:
            'MedlinePlus advises avoiding alcohol and products containing propylene glycol during treatment and for at least 3 days after the final dose.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لعلاج بعض الالتهابات البكتيرية والطفيليات حسب التشخيص.',
      howToUseAr: 'خذ الجرعات تمامًا حسب الجدول المكتوب لك وأكمل العلاج.',
      importantAr: 'تجنب الكحول والمنتجات التي تحتوي على propylene glycol أثناء العلاج ولمدة 3 أيام على الأقل بعد آخر جرعة.',
      commonActionableAr: 'قد تشعر بطعم معدني أو غثيان أو انزعاج في المعدة.',
      missedDoseAr: 'خذ الجرعة عندما تتذكر إذا لم يقترب موعد التالية، ولا تضاعف الجرعة.',
    ),
  ),
  Medication(
    id: 'valproic-acid',
    familyId: 'cns',
    name: 'Valproic Acid / Valproate',
    subtitle: 'Antiseizure and mood-stabilizing medicine',
    tags: ['Seizure', 'Bipolar', 'Migraine prevention', 'High alert'],
    sourceLabel: 'MedlinePlus Drug Information · Valproic Acid',
    sections: [
      MedicationSection(
        title: 'Formulation distinction',
        body:
            'Syrup, capsules, delayed-release tablets, extended-release tablets and sprinkle capsules have different handling. Extended-release tablets are once daily; do not crush delayed/extended-release products.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration & monitoring',
        body:
            'Take with food to reduce stomach upset and at consistent times. Review pregnancy, liver disease, pancreatitis risk, platelets/CBC, liver tests and product-specific dosing.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لعلاج أنواع من الصرع، وقد يُستخدم لاضطراب ثنائي القطب أو لمنع الشقيقة.',
      howToUseAr: 'خذه مع الطعام وفي نفس الأوقات تقريبًا كل يوم. لا تسحق الأقراص ممتدة أو متأخرة المفعول.',
      importantAr: 'لا توقفه فجأة من نفسك. إذا كنتِ حاملًا أو تخططين للحمل يجب مناقشة العلاج مع الطبيب بسرعة.',
      seekHelpAr: 'اطلب المساعدة إذا ظهر ألم شديد ومستمر في البطن مع قيء، اصفرار الجلد أو العينين، أو كدمات ونزف غير معتاد.',
    ),
  ),

  Medication(
    id: 'combined-oral-contraceptive',
    familyId: 'womens-health',
    name: 'Combined Oral Contraceptive',
    subtitle: 'Estrogen / progestin birth-control pill',
    tags: ['Contraception', 'Daily', 'Women’s health'],
    sourceLabel: 'MedlinePlus Drug Information · Combined Oral Contraceptives',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Identify the exact product and pack because active/placebo schedules and missed-pill instructions differ. Review smoking, age, migraine with aura, VTE risk, postpartum status and interacting enzyme-inducing medicines.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Take one tablet daily according to the pack, at around the same time each day. Missed-pill actions must follow the exact product instructions rather than a generic rule.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لمنع الحمل، وقد يُستخدم لأسباب أخرى حسب وصف الطبيب.',
      howToUseAr: 'خذي حبة واحدة يوميًا حسب ترتيب العبوة وفي نفس الوقت تقريبًا كل يوم.',
      importantAr: 'إذا نسيتِ حبة أو أكثر، اتبعي تعليمات نفس العبوة لأن طريقة التصرف تختلف حسب عدد الحبات ومكانها في الشريط.',
      seekHelpAr: 'اطلبي المساعدة إذا ظهر ألم أو تورم شديد في ساق واحدة، ضيق نفس مفاجئ، ألم صدر، أو صداع شديد جديد مع أعراض عصبية.',
    ),
  ),
  Medication(
    id: 'norethindrone-pop',
    familyId: 'womens-health',
    name: 'Norethindrone Progestin-Only Pill',
    subtitle: 'Progestin-only oral contraceptive',
    tags: ['Contraception', 'Daily', 'Timing sensitive'],
    sourceLabel: 'MedlinePlus Drug Information · Progestin-Only Norethindrone Oral Contraceptives',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Take one tablet every day at the same time. Timing and missed-pill rules are particularly important for progestin-only pills and should follow the exact product labeling.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لمنع الحمل من دون هرمون الإستروجين.',
      howToUseAr: 'خذي حبة كل يوم في نفس الوقت بدقة، ولا تتركي أيامًا بين الشرائط إلا إذا كانت تعليمات منتجك تقول ذلك.',
      importantAr: 'إذا تأخرتِ عن الجرعة أو نسيتها، اتبعي تعليمات نفس المنتج واستخدمي وسيلة إضافية إذا طُلب ذلك.',
    ),
  ),
  Medication(
    id: 'finasteride',
    familyId: 'urology',
    name: 'Finasteride',
    subtitle: '5-alpha-reductase inhibitor',
    tags: ['BPH', 'Hair loss', 'Oral'],
    sourceLabel: 'MedlinePlus Drug Information · Finasteride',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Take once daily at around the same time, with or without food. Benefit for BPH or hair loss takes time and continues only while therapy is maintained.',
      ),
      MedicationSection(
        title: 'Pregnancy handling warning',
        body:
            'Women who are or may become pregnant should not handle broken or crushed finasteride tablets because fetal exposure can be harmful.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لتضخم البروستات، وقد يُستخدم لتساقط الشعر عند الرجال حسب الجرعة.',
      howToUseAr: 'خذ الحبة مرة يوميًا في وقت ثابت تقريبًا، مع الطعام أو بدونه.',
      importantAr: 'النساء الحوامل أو من قد يحملن يجب ألا يلمسن الحبوب المكسورة أو المسحوقة.',
      commonActionableAr: 'قد يؤثر على الرغبة أو الأداء الجنسي عند بعض الرجال.',
    ),
  ),
  Medication(
    id: 'timolol-ophthalmic',
    familyId: 'eye-ear',
    name: 'Timolol Eye Drops',
    subtitle: 'Ophthalmic beta-blocker',
    tags: ['Glaucoma', 'Eye drops', 'Technique'],
    hasVisualGuide: true,
    sourceLabel: 'MedlinePlus Drug Information · Timolol Ophthalmic',
    sections: [
      MedicationSection(
        title: 'Technique',
        body:
            'After instilling one drop, close the eye gently for 2–3 minutes and press the tear duct to reduce systemic absorption. Do not touch the dropper tip.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Review asthma/COPD, bradycardia, heart block, heart failure and other beta-blockers. Soft contact lenses should be removed before dosing and generally reinserted after the product-specified interval.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لخفض ضغط العين في الجلوكوما أو ارتفاع ضغط العين.',
      howToUseAr: 'ضع القطرة في جيب الجفن السفلي من دون أن تلمس الفوهة العين، ثم أغلق عينك واضغط بلطف قرب زاوية العين الداخلية.',
      importantAr: 'إذا كنت تستخدم قطرات أخرى للعين، اترك الفاصل الذي حدده الصيدلي بينها.',
      teachBackAr: 'أرني كيف ستضع القطرة ثم أين ستضغط بإصبعك بعد الجرعة.',
    ),
  ),
  Medication(
    id: 'ciprofloxacin-ophthalmic',
    familyId: 'eye-ear',
    name: 'Ciprofloxacin Eye Drops / Ointment',
    subtitle: 'Ophthalmic fluoroquinolone antibiotic',
    tags: ['Eye infection', 'Antibiotic', 'Eye drops'],
    hasVisualGuide: true,
    sourceLabel: 'MedlinePlus Drug Information · Ciprofloxacin Ophthalmic',
    sections: [
      MedicationSection(
        title: 'Formulation distinction',
        body:
            'Solution and ointment have different dosing schedules. Use the exact prescribed formulation and avoid contaminating the tip.',
      ),
      MedicationSection(
        title: 'Contact lenses',
        body:
            'Patients with bacterial conjunctivitis should not wear contact lenses while symptoms persist or while applying the ophthalmic antibiotic.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد حيوي لعلاج بعض التهابات العين البكتيرية.',
      howToUseAr: 'ضع الدواء في العين بالطريقة التي شرحها لك الصيدلي، ولا تجعل فوهة العبوة تلمس العين أو الرموش.',
      importantAr: 'لا تلبس العدسات اللاصقة أثناء وجود التهاب بكتيري أو أثناء استخدام العلاج حتى يسمح لك الطبيب أو الصيدلي.',
      seekHelpAr: 'راجع الطبيب إذا لم تتحسن العين أو أصبح الألم أو الاحمرار أسوأ.',
    ),
  ),
  Medication(
    id: 'ciprofloxacin-otic',
    familyId: 'eye-ear',
    name: 'Ciprofloxacin Ear Drops',
    subtitle: 'Otic fluoroquinolone antibiotic',
    tags: ['Ear infection', 'Antibiotic', 'Ear drops'],
    hasVisualGuide: true,
    sourceLabel: 'MedlinePlus Drug Information · Ciprofloxacin Otic',
    sections: [
      MedicationSection(
        title: 'Technique',
        body:
            'For single-use ciprofloxacin otic solution, warm the container in the hand for at least 1 minute, instill with the affected ear upward, and remain in position for at least 60 seconds. Product formulations differ.',
      ),
      MedicationSection(
        title: 'Formulation distinction',
        body:
            'Some ciprofloxacin otic suspensions are administered by a clinician as a single dose, while outpatient solution products are self-administered. Do not interchange instructions.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد حيوي لعلاج بعض التهابات الأذن.',
      howToUseAr: 'دفّئ العبوة بين يديك إذا كانت تعليمات منتجك تسمح بذلك، واجعل الأذن المصابة للأعلى أثناء وضع القطرات.',
      importantAr: 'هذا الدواء للأذن فقط وليس للعين، واتبع تعليمات نفس المنتج لأن بعض الأنواع تختلف في طريقة الاستخدام.',
      teachBackAr: 'أرني وضعية الرأس وكم ستبقى والأذن للأعلى بعد وضع الجرعة.',
    ),
  ),
  Medication(
    id: 'naproxen',
    familyId: 'pain-inflammation',
    name: 'Naproxen',
    subtitle: 'NSAID analgesic / anti-inflammatory',
    tags: ['Pain', 'Inflammation', 'NSAID', 'OTC'],
    sourceLabel: 'MedlinePlus Drug Information · Naproxen',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Review GI bleeding/ulcer history, cardiovascular risk, renal disease, anticoagulants, pregnancy and duplicate NSAID therapy. Different immediate, delayed and extended-release products are not interchangeable.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Nonprescription naproxen is generally taken with a full glass of water and may be taken with food or milk to reduce nausea. Prescription schedules vary by formulation and indication.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يخفف الألم والالتهاب والحرارة.',
      howToUseAr: 'خذ الجرعة حسب نوع المنتج والوصفة، ويمكن أخذه مع الطعام أو الحليب إذا أزعج المعدة.',
      importantAr: 'لا تجمعه من نفسك مع ibuprofen أو diclofenac أو مسكنات أخرى من نفس عائلة NSAIDs.',
      seekHelpAr: 'اطلب المساعدة إذا ظهر براز أسود أو قيء دموي أو ألم صدر أو ضيق نفس.',
    ),
  ),
  Medication(
    id: 'bisacodyl-tablets',
    familyId: 'otc',
    name: 'Bisacodyl Tablets',
    subtitle: 'Stimulant laxative',
    tags: ['Constipation', 'OTC', 'Short term'],
    sourceLabel: 'MedlinePlus Drug Information · Bisacodyl',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Usually taken in the evening when a bowel movement is desired the next day. Swallow tablets whole. Keep at least a 1-hour interval from dairy products and antacids.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'Duration',
        body:
            'Short-term use only unless medically directed; MedlinePlus advises not using longer than 1 week without speaking to a clinician.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لفترة قصيرة لعلاج الإمساك.',
      howToUseAr: 'ابتلع الحبة كاملة مع الماء، ولا تسحقها أو تمضغها.',
      timingAr: 'لا تأخذها خلال ساعة من الحليب أو منتجات الألبان أو مضادات الحموضة.',
      importantAr: 'لا تستخدمها أكثر من أسبوع من نفسك إذا استمر الإمساك.',
      seekHelpAr: 'راجع الطبيب إذا كان لديك ألم بطن شديد أو قيء أو نزف من المستقيم.',
    ),
  ),
  Medication(
    id: 'senna',
    familyId: 'otc',
    name: 'Senna',
    subtitle: 'Stimulant laxative',
    tags: ['Constipation', 'OTC', 'Short term'],
    sourceLabel: 'MedlinePlus Drug Information · Senna',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'May be taken once or twice daily; when taken at bedtime, a bowel movement commonly occurs the next day. Short-term use is preferred.',
      ),
      MedicationSection(
        title: 'Duration',
        body:
            'Do not continue longer than 1 week without medical advice. Persistent constipation requires assessment rather than escalating stimulant laxatives indefinitely.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لفترة قصيرة لعلاج الإمساك.',
      howToUseAr: 'خذ الجرعة حسب العبوة أو الوصفة؛ أخذه قبل النوم قد يساعد على حدوث التبرز في اليوم التالي.',
      commonActionableAr: 'قد يسبب مغصًا أو تقلصات في البطن.',
      importantAr: 'إذا استمر الإمساك أكثر من أسبوع أو احتجت المسهل باستمرار، راجع الطبيب أو الصيدلي.',
    ),
  ),
  Medication(
    id: 'hydrocortisone-topical',
    familyId: 'allergy-dermatology',
    name: 'Hydrocortisone Topical',
    subtitle: 'Low-potency topical corticosteroid',
    tags: ['Skin', 'Itching', 'Topical', 'OTC'],
    sourceLabel: 'MedlinePlus Drug Information · Hydrocortisone Topical',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Apply a small amount as a thin even film to the affected skin at the frequency directed by the product/prescription. Avoid eyes and mouth and do not occlude unless instructed.',
      ),
      MedicationSection(
        title: 'OTC referral limit',
        body:
            'For nonprescription hydrocortisone, MedlinePlus advises stopping and contacting a clinician if the condition does not improve within 7 days.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يخفف الحكة والاحمرار والالتهاب في بعض مشاكل الجلد.',
      howToUseAr: 'ضع طبقة رقيقة فقط على المكان المصاب وافركها بلطف حسب عدد المرات المكتوب.',
      importantAr: 'لا تضعه داخل العين أو الفم ولا تغطِ المنطقة بضماد محكم إلا إذا طلب الطبيب ذلك.',
      seekHelpAr: 'إذا كان المنتج بدون وصفة ولم يتحسن الجلد خلال 7 أيام، توقف وراجع الطبيب أو الصيدلي.',
    ),
  ),
  ...expandedMedications,
  ...expandedMedications2,
  ...expandedMedications3,
  ...expandedMedications4,
  ...expandedMedications5,
  ...expandedMedications6,
  ...expandedMedications7,
  ...expandedMedications8,
  ...expandedMedications9,
  ...expandedMedications10,
];
