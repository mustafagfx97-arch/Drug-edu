import '../models/medication.dart';

const sampleMedications = <Medication>[
  Medication(
    id: 'losartan',
    familyId: 'cardiovascular',
    name: 'Losartan',
    subtitle: 'ARB antihypertensive',
    tags: ['Blood pressure', 'Oral', 'Chronic'],
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
    id: 'vitamin-d3',
    familyId: 'supplements',
    name: 'Vitamin D3',
    subtitle: 'Cholecalciferol',
    tags: ['Supplement', 'Vitamin', 'Oral'],
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Distinguish routine supplementation from treatment of deficiency. Confirm strength because drops, capsules and high-dose products vary substantially.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم للوقاية من نقص فيتامين د أو علاجه حسب الجرعة الموصوفة.',
      howToUseAr: 'تأكد من قوة المنتج والجرعة قبل الاستخدام لأن التركيز يختلف كثيرًا بين المنتجات.',
      importantAr: 'لا تستخدم جرعات عالية لفترة طويلة من نفسك.',
    ),
  ),
];
