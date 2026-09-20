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

  Medication(
    id: 'valsartan',
    familyId: 'cardiovascular',
    name: 'Valsartan',
    subtitle: 'ARB antihypertensive / heart-failure therapy',
    tags: ['Blood pressure', 'Heart failure', 'Post-MI', 'Oral'],
    sourceLabel: 'MedlinePlus Drug Information · Valsartan',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Verify indication, renal function, potassium, pregnancy status and concomitant RAAS/potassium-raising therapy. Hypertension and heart-failure schedules are not always identical.',
      ),
      MedicationSection(
        title: 'Administration & duration',
        body:
            'May be taken with or without food at consistent times. Usually chronic/long-term when used for hypertension or heart failure; duration after MI is indication-driven.',
      ),
      MedicationSection(
        title: 'Monitoring & safety',
        body:
            'Monitor blood pressure, renal function and potassium after initiation/titration when clinically indicated. Avoid during pregnancy.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لخفض ضغط الدم أو لعلاج بعض حالات فشل القلب وحماية القلب حسب حالتك.',
      howToUseAr: 'خذ الجرعة في نفس الوقت تقريبًا كل يوم، مع الطعام أو بدونه.',
      importantAr: 'لا تستخدم مكملات البوتاسيوم أو بدائل الملح الغنية بالبوتاسيوم من نفسك.',
      missedDoseAr: 'خذ الجرعة عندما تتذكر إذا لم يقترب موعد التالية، ولا تضاعف الجرعة.',
      seekHelpAr: 'إذا حدث حمل أو دوخة شديدة أو إغماء، تواصل مع الطبيب.',
    ),
  ),
  Medication(
    id: 'sacubitril-valsartan',
    familyId: 'cardiovascular',
    name: 'Sacubitril / Valsartan',
    subtitle: 'ARNI heart-failure therapy',
    tags: ['Heart failure', 'ARNI', 'Oral', 'Chronic'],
    sourceLabel: 'MedlinePlus Drug Information · Valsartan and Sacubitril',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Confirm heart-failure indication, blood pressure, renal function, potassium and prior ACE-inhibitor exposure. A washout interval is required when switching from an ACE inhibitor.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration / formulation',
        body:
            'Usually taken twice daily with or without food. Sprinkle capsules and pharmacist-prepared suspension have formulation-specific handling; do not crush oral pellets.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Monitor blood pressure, renal function, potassium and angioedema symptoms. Therapy is generally chronic if tolerated and clinically beneficial.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لعلاج بعض أنواع فشل القلب وتقليل الحاجة لدخول المستشفى.',
      howToUseAr: 'خذ الجرعة مرتين يوميًا حسب الوصفة، مع الطعام أو بدونه.',
      importantAr: 'لا تبدأ ACE inhibitor مثل lisinopril أو enalapril معه من نفسك، ولا تستخدم مكملات البوتاسيوم دون مراجعة.',
      seekHelpAr: 'اطلب المساعدة إذا ظهر تورم في الوجه أو الشفتين أو اللسان، أو إذا حدث حمل.',
    ),
  ),
  Medication(
    id: 'carvedilol',
    familyId: 'cardiovascular',
    name: 'Carvedilol',
    subtitle: 'Beta-blocker / alpha-blocker',
    tags: ['Heart failure', 'Blood pressure', 'Post-MI', 'Oral'],
    sourceLabel: 'MedlinePlus Drug Information · Carvedilol',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Immediate-release tablets are generally taken with food to reduce orthostatic effects. Extended-release products have different once-daily handling; verify formulation.',
      ),
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Review heart rate, blood pressure, heart-failure status, asthma/COPD, diabetes and adherence. Titrate gradually; do not stop abruptly.',
      ),
      MedicationSection(
        title: 'Monitoring & counseling',
        body:
            'Monitor pulse/BP, dizziness, weight/heart-failure symptoms and glucose awareness in diabetes. Usually chronic therapy when used for HFrEF.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم للضغط أو فشل القلب أو بعد بعض مشاكل القلب حسب حالتك.',
      howToUseAr: 'إذا كان النوع العادي فخذه مع الطعام وفي نفس الأوقات يوميًا.',
      importantAr: 'لا توقفه فجأة من نفسك.',
      commonActionableAr: 'قد يسبب دوخة أو بطء النبض؛ انهض ببطء خاصة في البداية.',
      seekHelpAr: 'راجع الطبيب إذا حدث إغماء أو بطء شديد في النبض أو زاد ضيق النفس والتورم.',
    ),
  ),
  Medication(
    id: 'digoxin-oral',
    familyId: 'cardiovascular',
    name: 'Digoxin Oral',
    subtitle: 'Cardiac glycoside',
    tags: ['Heart failure', 'Atrial fibrillation', 'Narrow therapeutic index'],
    sourceLabel: 'MedlinePlus Drug Information · Digoxin',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Narrow therapeutic index. Verify indication, renal function, age/weight, potassium/magnesium, interacting medicines and formulation. Dose changes should be conservative.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration & monitoring',
        body:
            'Take at the same time each day. Monitor renal function, electrolytes, heart rate/rhythm and serum concentration when clinically indicated; level interpretation depends on timing after dose.',
      ),
      MedicationSection(
        title: 'Toxicity clues',
        body:
            'New nausea/vomiting, anorexia, confusion, unusual visual symptoms or arrhythmia/bradycardia should trigger toxicity assessment.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد القلب في بعض حالات فشل القلب أو اضطراب النبض.',
      howToUseAr: 'خذ الجرعة في نفس الوقت كل يوم ولا تغيّرها من نفسك.',
      importantAr: 'لا تضاعف الجرعة إذا نسيتها، وأخبر الصيدلي عن أي دواء جديد لأن التداخلات مهمة.',
      seekHelpAr: 'راجع الطبيب إذا ظهر غثيان شديد جديد أو تشوش أو بطء واضح في النبض أو اضطراب بالرؤية.',
    ),
  ),
  Medication(
    id: 'rosuvastatin',
    familyId: 'cardiovascular',
    name: 'Rosuvastatin',
    subtitle: 'Statin lipid-lowering therapy',
    tags: ['Cholesterol', 'Cardiovascular prevention', 'Oral'],
    sourceLabel: 'MedlinePlus Drug Information · Rosuvastatin',
    sections: [
      MedicationSection(
        title: 'Administration & duration',
        body:
            'Once daily with or without food, at any consistent time. Usually long-term for lipid lowering and cardiovascular risk reduction.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Assess lipid response/adherence. Liver enzymes and CK are checked when clinically indicated rather than routinely in every asymptomatic patient.',
      ),
      MedicationSection(
        title: 'Interactions / patient-specific',
        body:
            'Review cyclosporine, selected antivirals, gemfibrozil and antacids. Renal impairment and Asian ancestry may influence starting-dose selection.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يخفض الكوليسترول ويساعد على تقليل خطر الجلطات عند من يحتاجه.',
      howToUseAr: 'خذ الجرعة مرة يوميًا في وقت ثابت تقريبًا، مع الطعام أو بدونه.',
      importantAr: 'استمر عليه حتى إذا تحسنت التحاليل ما لم يغيّر الطبيب الخطة.',
      seekHelpAr: 'راجع الطبيب إذا ظهر ألم أو ضعف عضلي شديد وغير معتاد، خاصة مع بول غامق أو تعب شديد.',
    ),
  ),
  Medication(
    id: 'diltiazem-er',
    familyId: 'cardiovascular',
    name: 'Diltiazem Extended Release',
    subtitle: 'Non-dihydropyridine calcium-channel blocker',
    tags: ['Rate control', 'Angina', 'Blood pressure', 'Extended release'],
    sourceLabel: 'MedlinePlus Drug Information · Diltiazem',
    sections: [
      MedicationSection(
        title: 'Formulation distinction',
        body:
            'Multiple ER products are not automatically interchangeable and may have different food/opening instructions. Verify exact brand/formulation before counseling.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Heart rate, blood pressure, dizziness, edema and conduction symptoms; extra caution with beta-blockers or other rate-slowing drugs.',
      ),
      MedicationSection(
        title: 'Duration',
        body:
            'Usually chronic when used for hypertension, angina or rate control. Do not crush ER products unless exact product labeling explicitly allows a specific opening/sprinkling method.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم للضغط أو الذبحة أو لتنظيم سرعة النبض حسب حالتك.',
      howToUseAr: 'خذ نفس نوع الكبسولة أو الحبة المكتوب لك وفي نفس الوقت يوميًا.',
      importantAr: 'لا تسحق أو تفتح النوع ممتد المفعول إلا إذا قال الصيدلي إن منتجك يسمح بذلك.',
      commonActionableAr: 'قد يسبب دوخة أو بطء النبض أو تورم القدمين.',
    ),
  ),
  Medication(
    id: 'dapagliflozin',
    familyId: 'diabetes-endocrine',
    name: 'Dapagliflozin',
    subtitle: 'SGLT2 inhibitor',
    tags: ['Diabetes', 'Heart failure', 'CKD', 'Oral'],
    sourceLabel: 'MedlinePlus Drug Information · Dapagliflozin',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Review indication, renal function, volume status, genital/urinary infection history, ketoacidosis risk, diet/fasting and planned surgery.',
      ),
      MedicationSection(
        title: 'Administration & duration',
        body:
            'Once daily with or without food. Usually chronic for diabetes, CKD or heart failure while beneficial and tolerated.',
      ),
      MedicationSection(
        title: 'Sick-day / procedure counseling',
        body:
            'Temporary interruption may be needed for surgery, prolonged fasting, severe acute illness or dehydration according to current protocol to reduce ketoacidosis risk.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد على خفض السكر وقد يفيد القلب أو الكلى حسب حالتك.',
      howToUseAr: 'خذه مرة يوميًا في نفس الوقت تقريبًا، مع الطعام أو بدونه.',
      commonActionableAr: 'قد يزيد التبول وقد تحدث التهابات فطرية أو بولية.',
      importantAr: 'أخبر الفريق الطبي أنك تستخدمه قبل العمليات أو إذا كنت لا تستطيع الأكل أو الشرب بسبب المرض.',
      seekHelpAr: 'اطلب المساعدة إذا ظهر غثيان أو قيء أو ألم بطن مع تنفس سريع أو تعب شديد.',
    ),
  ),
  Medication(
    id: 'dulaglutide',
    familyId: 'diabetes-endocrine',
    name: 'Dulaglutide',
    subtitle: 'Weekly GLP-1 receptor agonist',
    tags: ['Diabetes', 'Weekly injection', 'Pen'],
    hasVisualGuide: true,
    sourceLabel: 'MedlinePlus Drug Information · Dulaglutide Injection',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Subcutaneous once weekly on the same day; rotate sites. Device is single-dose and product-specific—demonstrate activation and disposal.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'A1c/glucose, GI tolerance, weight, pancreatitis/gallbladder symptoms and hypoglycemia when combined with insulin or sulfonylurea.',
      ),
      MedicationSection(
        title: 'Patient-specific',
        body:
            'Review severe GI disease, prior pancreatitis context, pregnancy and personal/family history relevant to boxed thyroid-tumor warning.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد على ضبط السكر ويُستخدم مرة واحدة أسبوعيًا.',
      howToUseAr: 'اختر يومًا ثابتًا كل أسبوع وغيّر موضع الحقن بين الجرعات.',
      commonActionableAr: 'قد يسبب غثيانًا أو شبعًا سريعًا؛ الوجبات الأصغر قد تساعد.',
      importantAr: 'لا تشارك جهاز الحقن مع أي شخص.',
      seekHelpAr: 'اطلب المساعدة إذا ظهر ألم بطن شديد ومستمر أو قيء مستمر.',
      teachBackAr: 'ما هو يوم الحقنة عندك؟ وأرني كيف ستستخدم القلم وتتخلص منه.',
    ),
  ),
  Medication(
    id: 'tirzepatide',
    familyId: 'diabetes-endocrine',
    name: 'Tirzepatide',
    subtitle: 'Weekly GIP / GLP-1 receptor agonist',
    tags: ['Diabetes', 'Weight management', 'Weekly injection'],
    hasVisualGuide: true,
    sourceLabel: 'FDA/MedlinePlus patient information · Tirzepatide',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Once weekly subcutaneous injection. Dose escalation is gradual and product/indication-specific; do not accelerate titration.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Glucose/A1c or weight depending on indication, GI tolerance, gallbladder/pancreatitis symptoms and hypoglycemia with insulin/sulfonylurea.',
      ),
      MedicationSection(
        title: 'Important interaction',
        body:
            'Delayed gastric emptying can affect oral medicines. Product labeling contains specific advice for oral hormonal contraceptives during initiation/dose escalation.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم للسكري أو لإنقاص الوزن في حالات محددة حسب المنتج.',
      howToUseAr: 'احقن الجرعة مرة أسبوعيًا في نفس اليوم وبدّل موضع الحقن.',
      importantAr: 'لا ترفع الجرعة أسرع من الخطة المكتوبة لك.',
      commonActionableAr: 'الغثيان أو الشبع السريع شائعان عند البداية أو زيادة الجرعة.',
      seekHelpAr: 'راجع الطبيب عند ألم بطن شديد ومستمر أو قيء شديد.',
    ),
  ),
  Medication(
    id: 'glipizide',
    familyId: 'diabetes-endocrine',
    name: 'Glipizide',
    subtitle: 'Sulfonylurea',
    tags: ['Diabetes', 'Hypoglycemia', 'Oral'],
    sourceLabel: 'MedlinePlus Drug Information · Glipizide',
    sections: [
      MedicationSection(
        title: 'Formulation distinction',
        body:
            'Immediate-release and extended-release products have different timing. IR is usually before meals; ER is commonly with breakfast. Do not interchange counseling.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Glucose/A1c, hypoglycemia, meal pattern and renal/hepatic function when relevant.',
      ),
      MedicationSection(
        title: 'Clinical pearl',
        body:
            'Irregular eating, frailty and renal/hepatic impairment increase hypoglycemia risk; the medication plan must match the patient’s real meal pattern.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد على خفض سكر الدم.',
      howToUseAr: 'طريقة التوقيت تختلف بين الحبة العادية والممتدة المفعول؛ اتبع نوعك بالضبط.',
      importantAr: 'لا تأخذ الجرعة ثم تتجاوز الوجبة إذا كان منتجك مرتبطًا بالطعام.',
      seekHelpAr: 'إذا ظهرت أعراض هبوط السكر بشكل متكرر، راجع الطبيب أو الصيدلي.',
    ),
  ),
  Medication(
    id: 'pioglitazone',
    familyId: 'diabetes-endocrine',
    name: 'Pioglitazone',
    subtitle: 'Thiazolidinedione',
    tags: ['Diabetes', 'Oral', 'Fluid retention'],
    sourceLabel: 'MedlinePlus Drug Information · Pioglitazone',
    sections: [
      MedicationSection(
        title: 'Administration & duration',
        body:
            'Usually once daily with or without food and used chronically if effective. Glucose-lowering effect is gradual rather than immediate.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Weight/edema, heart-failure symptoms, A1c and liver status when clinically indicated; fracture risk matters in selected patients.',
      ),
      MedicationSection(
        title: 'High-value safety',
        body:
            'Can cause fluid retention and worsen heart failure. Review dyspnea, rapid weight gain and edema before initiation/titration.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد على خفض السكر ويحتاج وقتًا حتى يظهر تأثيره الكامل.',
      howToUseAr: 'خذه مرة يوميًا مع الطعام أو بدونه.',
      commonActionableAr: 'قد يسبب زيادة وزن أو تورمًا بسبب احتباس السوائل.',
      seekHelpAr: 'راجع الطبيب إذا ظهر ضيق نفس جديد أو تورم واضح أو زيادة وزن سريعة.',
    ),
  ),
  Medication(
    id: 'insulin-lispro',
    familyId: 'diabetes-endocrine',
    name: 'Insulin Lispro',
    subtitle: 'Rapid-acting mealtime insulin',
    tags: ['Insulin', 'Mealtime', 'Injection', 'High alert'],
    hasVisualGuide: true,
    sourceLabel: 'MedlinePlus Drug Information · Insulin Lispro Injection',
    sections: [
      MedicationSection(
        title: 'Critical administration',
        body:
            'Timing relative to meals is product-specific but generally very close to meal intake. Confirm exact lispro product/concentration and whether the patient is actually ready to eat.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Formulation / device',
        body:
            'U-100 and U-200 products and pens are not interchangeable by volume. Do not withdraw U-200 from a pen into a syringe.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Glucose/CGM, hypoglycemia, carb intake, injection technique, lipohypertrophy and storage.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'إنسولين سريع المفعول لتغطية الوجبات وتصحيح السكر حسب الخطة.',
      howToUseAr: 'استخدمه في الوقت المحدد بالنسبة للوجبة، ولا تحقنه ثم تؤخر الأكل من دون خطة واضحة.',
      importantAr: 'تأكد من اسم الإنسولين وتركيزه قبل كل حقنة.',
      seekHelpAr: 'عالج هبوط السكر حسب خطتك، واطلب المساعدة إذا كان شديدًا أو لم تستطع الأكل.',
      teachBackAr: 'متى ستحقنه بالنسبة للوجبة؟ وكيف تتأكد من نوع وتركيز الإنسولين؟',
    ),
  ),
  Medication(
    id: 'fluticasone-inhaled',
    familyId: 'respiratory',
    name: 'Fluticasone Inhaled',
    subtitle: 'Inhaled corticosteroid',
    tags: ['Asthma', 'Controller', 'Inhaler', 'ICS'],
    hasVisualGuide: true,
    sourceLabel: 'MedlinePlus Drug Information · Fluticasone Oral Inhalation',
    sections: [
      MedicationSection(
        title: 'Device distinction',
        body:
            'Fluticasone exists as aerosol and multiple dry-powder devices. Inhalation speed, priming, cleaning, dose counter and spacer use differ by product.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Use consistently once or twice daily according to product; not for acute attacks. Rinse mouth with water and spit after dosing.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Asthma control, exacerbations, adherence, technique, oral candidiasis/dysphonia and growth in children when clinically relevant.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'بخاخ وقائي يقلل التهاب الشعب الهوائية ويساعد على منع أعراض الربو.',
      howToUseAr: 'استخدمه يوميًا حتى عندما تكون بخير، بالطريقة الخاصة بجهازك.',
      importantAr: 'ليس بخاخ إسعاف للنوبة المفاجئة. تمضمض بالماء وابصقه بعد الجرعة.',
      teachBackAr: 'أرني طريقة استخدام جهازك، ثم قل لي ماذا تفعل بعد الجرعة.',
    ),
  ),
  Medication(
    id: 'fluticasone-salmeterol',
    familyId: 'respiratory',
    name: 'Fluticasone / Salmeterol',
    subtitle: 'ICS / LABA combination inhaler',
    tags: ['Asthma', 'COPD', 'Controller', 'Inhaler'],
    hasVisualGuide: true,
    sourceLabel: 'MedlinePlus Drug Information · Fluticasone and Salmeterol',
    sections: [
      MedicationSection(
        title: 'Device/formulation distinction',
        body:
            'Diskus, HFA and RespiClick-type products use different techniques and approved age ranges. Do not copy technique between devices.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Generally twice daily about 12 hours apart for many products. Rinse and spit after each dose. Not a rescue inhaler.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Symptoms, exacerbations, rescue use, adherence, device technique, oral candidiasis and duplicate LABA therapy.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يسيطر على الربو أو COPD ويقلل الأعراض مع الاستخدام المنتظم.',
      howToUseAr: 'استخدمه في المواعيد المكتوبة لك وبطريقة جهازك الخاصة.',
      importantAr: 'ليس للإسعاف السريع. تمضمض بالماء وابصقه بعد الجرعة.',
      teachBackAr: 'أرني كيف تستخدم جهازك من البداية للنهاية.',
    ),
  ),
  Medication(
    id: 'ipratropium-inhaled',
    familyId: 'respiratory',
    name: 'Ipratropium Inhaled',
    subtitle: 'Short-acting anticholinergic bronchodilator',
    tags: ['COPD', 'Asthma adjunct', 'Inhaler', 'Nebulizer'],
    hasVisualGuide: true,
    sourceLabel: 'MedlinePlus Drug Information · Ipratropium Oral Inhalation',
    sections: [
      MedicationSection(
        title: 'Formulation/device',
        body:
            'Available by inhaler and nebulizer. Exact technique and dosing schedule differ; nebulizer solution should not be mixed with other drugs unless compatibility is established.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Symptom relief, dry mouth, urinary retention and eye symptoms in glaucoma-risk patients.',
      ),
      MedicationSection(
        title: 'Common error',
        body:
            'Nebulized mist or aerosol contacting the eyes may worsen narrow-angle glaucoma symptoms in susceptible patients.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يفتح الشعب الهوائية ويُستخدم كثيرًا في COPD وأحيانًا مع علاجات أخرى للربو.',
      howToUseAr: 'استخدم البخاخ أو النيبولايزر بالطريقة الخاصة بالمنتج.',
      importantAr: 'تجنب وصول الرذاذ إلى العينين، وأخبر الطبيب إذا ظهر ألم عين أو تشوش شديد بالرؤية.',
    ),
  ),
  Medication(
    id: 'budesonide-nebulizer',
    familyId: 'respiratory',
    name: 'Budesonide Nebulizer',
    subtitle: 'Nebulized inhaled corticosteroid',
    tags: ['Asthma', 'Nebulizer', 'ICS', 'Pediatric'],
    hasVisualGuide: true,
    sourceLabel: 'MedlinePlus / product labeling · Budesonide Inhalation Suspension',
    sections: [
      MedicationSection(
        title: 'Preparation / technique',
        body:
            'Use the exact unit-dose respule and compatible nebulizer system. Do not mix with another nebulized medicine unless compatibility is specifically established.',
      ),
      MedicationSection(
        title: 'After dose',
        body:
            'Rinse mouth and spit after treatment; if a face mask is used, wash the face to reduce local steroid exposure.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Asthma control, adherence, device cleaning, oral candidiasis, voice changes and growth in children when clinically relevant.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'دواء وقائي للربو يُعطى بالنيبولايزر لتقليل التهاب الشعب الهوائية.',
      howToUseAr: 'ضع محتوى العبوة المخصصة في حجرة الجهاز واستخدم النيبولايزر بالطريقة التي تعلمتها.',
      importantAr: 'بعد الجلسة تمضمض بالماء وابصقه، وإذا استخدمت ماسك اغسل الوجه.',
      teachBackAr: 'أرني كيف تركب الجهاز وتنظفه بعد الجلسة.',
    ),
  ),
  Medication(
    id: 'amoxicillin-clavulanate-oral',
    familyId: 'antiinfective',
    name: 'Amoxicillin / Clavulanate Oral',
    subtitle: 'Penicillin / beta-lactamase inhibitor',
    tags: ['Antibiotic', 'Oral', 'Suspension'],
    sourceLabel: 'MedlinePlus Drug Information · Amoxicillin and Clavulanate',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Take with a meal or snack, ideally at the start of the meal, to improve clavulanate tolerance/absorption.',
      ),
      MedicationSection(
        title: 'Formulation warning',
        body:
            'Different tablet and suspension strengths are not interchangeable based only on amoxicillin mg because clavulanate content differs.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Duration / monitoring',
        body:
            'Course duration is infection-specific. Monitor allergy, GI tolerance, severe diarrhea and liver symptoms in susceptible patients.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد حيوي لعلاج بعض الالتهابات البكتيرية.',
      howToUseAr: 'خذ الجرعة مع بداية الوجبة أو مع الطعام حسب تعليمات منتجك، وأكمل المدة الموصوفة.',
      importantAr: 'لا تبدّل بين تركيزات الشراب من نفسك؛ كمية clavulanate تختلف بين المنتجات.',
      seekHelpAr: 'اطلب المساعدة عند حساسية شديدة أو إسهال شديد ومستمر أو اصفرار الجلد/العينين.',
    ),
  ),
  Medication(
    id: 'cephalexin',
    familyId: 'antiinfective',
    name: 'Cephalexin',
    subtitle: 'First-generation cephalosporin',
    tags: ['Antibiotic', 'Oral', 'Suspension'],
    sourceLabel: 'MedlinePlus Drug Information · Cephalexin',
    sections: [
      MedicationSection(
        title: 'Administration & duration',
        body:
            'May be taken with or without food. Course duration depends on infection and guideline; space doses according to prescribed frequency.',
      ),
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Review beta-lactam allergy history, renal function for adjustment, infection site and local susceptibility where relevant.',
      ),
      MedicationSection(
        title: 'Suspension',
        body:
            'Shake well and measure with an oral syringe/cup. Reconstituted storage and beyond-use instructions should follow the exact manufacturer.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد حيوي لعلاج بعض الالتهابات البكتيرية.',
      howToUseAr: 'خذ الجرعة في مواعيدها وأكمل مدة العلاج، مع الطعام أو بدونه.',
      importantAr: 'إذا كان شرابًا فرج العبوة جيدًا واستعمل أداة قياس دوائية.',
      seekHelpAr: 'اطلب المساعدة عند صعوبة التنفس أو تورم الوجه، أو راجع الطبيب عند إسهال شديد.',
    ),
  ),
  Medication(
    id: 'ciprofloxacin-oral',
    familyId: 'antiinfective',
    name: 'Ciprofloxacin Oral',
    subtitle: 'Fluoroquinolone antibiotic',
    tags: ['Antibiotic', 'Oral', 'Mineral interaction'],
    sourceLabel: 'MedlinePlus Drug Information · Ciprofloxacin',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Take with water at consistent times. Do not take with dairy/calcium-fortified juice alone, and separate from antacids, iron, calcium, magnesium and zinc according to label timing.',
      ),
      MedicationSection(
        title: 'High-value safety',
        body:
            'Fluoroquinolone risks include tendon injury, peripheral neuropathy and CNS effects; reserve use according to indication and current guidance.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Interactions',
        body:
            'Major interaction with tizanidine. Review QT-risk drugs, warfarin, theophylline/caffeine exposure and glucose-lowering therapy when relevant.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد حيوي لعلاج أنواع محددة من الالتهابات.',
      howToUseAr: 'خذه مع الماء وفي أوقات ثابتة، وافصل المعادن ومضادات الحموضة حسب تعليمات الصيدلي.',
      importantAr: 'لا تأخذه مع الحليب أو العصير المدعم بالكالسيوم وحدهما كوجبة للجرعة.',
      seekHelpAr: 'أوقفه وراجع الطبيب عند ألم أو تورم مفاجئ في وتر، تنميل/حرقان جديد بالأطراف، أو أعراض عصبية شديدة.',
    ),
  ),
  Medication(
    id: 'fluconazole-oral',
    familyId: 'antiinfective',
    name: 'Fluconazole Oral',
    subtitle: 'Azole antifungal',
    tags: ['Antifungal', 'Oral', 'Interactions'],
    sourceLabel: 'MedlinePlus Drug Information · Fluconazole',
    sections: [
      MedicationSection(
        title: 'Administration / duration',
        body:
            'With or without food. Regimen ranges from a single dose to prolonged treatment depending on infection and immune status.',
      ),
      MedicationSection(
        title: 'Interactions',
        body:
            'CYP-mediated interactions are clinically important; review warfarin, selected statins, sulfonylureas, phenytoin and QT-risk drugs.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Liver toxicity and QT risk are patient-specific concerns; prolonged/high-dose therapy may require laboratory monitoring.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد فطري لعلاج أنواع مختلفة من العدوى الفطرية.',
      howToUseAr: 'خذ الجرعة حسب الخطة؛ بعض الحالات تحتاج جرعة واحدة وأخرى تحتاج علاجًا أطول.',
      timingAr: 'يمكن أخذه مع الطعام أو بدونه.',
      importantAr: 'أخبر الصيدلي عن جميع أدويتك لأن له تداخلات مهمة.',
      seekHelpAr: 'راجع الطبيب عند اصفرار الجلد/العينين أو طفح شديد أو خفقان وإغماء.',
    ),
  ),
  Medication(
    id: 'valacyclovir',
    familyId: 'antiinfective',
    name: 'Valacyclovir',
    subtitle: 'Antiviral prodrug',
    tags: ['Herpes', 'Shingles', 'Oral'],
    sourceLabel: 'MedlinePlus Drug Information · Valacyclovir',
    sections: [
      MedicationSection(
        title: 'Administration & duration',
        body:
            'With or without food; regimen and duration vary by herpes indication. Early initiation is important for episodic treatment.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Renal function and hydration are important, particularly in older adults, dehydration or renal impairment.',
      ),
      MedicationSection(
        title: 'Clinical pearl',
        body:
            'Suppression, initial genital herpes, recurrent herpes and shingles use different dose schedules—do not copy one regimen to another.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد فيروسات لعلاج أو منع تكرار بعض عدوى الهربس والحزام الناري.',
      howToUseAr: 'خذ الجرعات حسب الحالة وفي أوقات منتظمة، مع الطعام أو بدونه.',
      importantAr: 'اشرب سوائل كافية ما لم يكن لديك تقييد للسوائل.',
      missedDoseAr: 'خذ الجرعة عند التذكر إذا لم يقترب موعد التالية، ولا تضاعف الجرعة.',
    ),
  ),
  Medication(
    id: 'trimethoprim-sulfamethoxazole',
    familyId: 'antiinfective',
    name: 'Trimethoprim / Sulfamethoxazole',
    subtitle: 'Sulfonamide combination antibiotic',
    tags: ['Antibiotic', 'Oral', 'Potassium', 'Interactions'],
    sourceLabel: 'MedlinePlus Drug Information · Co-trimoxazole',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Take with a full glass of water; food may improve GI tolerance. Maintain hydration unless restricted.',
      ),
      MedicationSection(
        title: 'Monitoring / interactions',
        body:
            'Renal function, potassium and CBC may be relevant, especially with prolonged therapy or high-risk patients. Major interaction concerns include warfarin, methotrexate and potassium-raising therapy.',
      ),
      MedicationSection(
        title: 'High-value safety',
        body:
            'Serious rash, cytopenias, hyperkalemia and renal effects are important red flags.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد حيوي لعلاج أنواع معينة من الالتهابات.',
      howToUseAr: 'خذ الجرعة مع كوب ماء كامل وفي المواعيد المكتوبة لك.',
      importantAr: 'أخبر الصيدلي إذا تستخدم warfarin أو methotrexate أو أدوية ترفع البوتاسيوم.',
      seekHelpAr: 'أوقفه واطلب المساعدة إذا ظهر طفح شديد أو تقرحات بالفم أو صعوبة تنفس.',
    ),
  ),
  Medication(
    id: 'lamotrigine',
    familyId: 'cns',
    name: 'Lamotrigine',
    subtitle: 'Antiseizure / mood-stabilizing medicine',
    tags: ['Epilepsy', 'Bipolar', 'Slow titration', 'Rash'],
    sourceLabel: 'MedlinePlus Drug Information · Lamotrigine',
    sections: [
      MedicationSection(
        title: 'Critical titration',
        body:
            'Must be titrated slowly. Starting dose and schedule depend strongly on valproate and enzyme-inducing antiseizure drugs.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Formulation',
        body:
            'Standard tablets, chewable/dispersible and ODT products have different administration options. Do not improvise crushing/opening.',
      ),
      MedicationSection(
        title: 'Rash counseling',
        body:
            'New rash—especially with fever, mucosal lesions or systemic symptoms—requires urgent assessment because severe cutaneous reactions can occur.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم للصرع أو للمساعدة في علاج اضطراب ثنائي القطب.',
      howToUseAr: 'ابدأ وارفع الجرعة فقط حسب الجدول المكتوب؛ لا ترفعها أسرع من الخطة.',
      importantAr: 'إذا توقفت عدة أيام فلا ترجع لنفس الجرعة من نفسك قبل سؤال الطبيب أو الصيدلي.',
      seekHelpAr: 'اطلب تقييمًا سريعًا إذا ظهر طفح جديد، خصوصًا مع حرارة أو تقرحات بالفم.',
    ),
  ),
  Medication(
    id: 'carbamazepine',
    familyId: 'cns',
    name: 'Carbamazepine',
    subtitle: 'Antiseizure / neuralgia medicine',
    tags: ['Epilepsy', 'Trigeminal neuralgia', 'Interactions', 'Monitoring'],
    sourceLabel: 'MedlinePlus Drug Information · Carbamazepine',
    sections: [
      MedicationSection(
        title: 'Formulation distinction',
        body:
            'Immediate-release, XR tablets/capsules and suspension differ in administration. Suspension can interact physically with some liquid medicines; do not mix in the same cup.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'CBC, sodium, liver function and drug level when clinically indicated; monitor rash, dizziness and blood dyscrasia symptoms.',
      ),
      MedicationSection(
        title: 'Interactions',
        body:
            'Potent enzyme inducer with many interactions, including hormonal contraceptives, anticoagulants and multiple antiseizure/psychiatric drugs.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم للصرع أو ألم العصب الثلاثي وبعض الحالات الأخرى.',
      howToUseAr: 'خذ الدواء بانتظام ولا تبدّل بين النوع العادي والممتد المفعول من نفسك.',
      importantAr: 'له تداخلات دوائية كثيرة؛ أخبر الصيدلي قبل إضافة أي دواء أو مانع حمل جديد.',
      seekHelpAr: 'راجع الطبيب عند طفح شديد أو حرارة مع التهاب حلق أو كدمات غير معتادة أو ارتباك شديد.',
    ),
  ),
  Medication(
    id: 'phenytoin-oral',
    familyId: 'cns',
    name: 'Phenytoin Oral',
    subtitle: 'Narrow-therapeutic-index antiseizure medicine',
    tags: ['Epilepsy', 'TDM', 'Feeding tube', 'Interactions'],
    sourceLabel: 'MedlinePlus + ICU/enteral references · Phenytoin',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Nonlinear kinetics and narrow therapeutic range. Interpret levels with timing, albumin and renal function; free level is often more informative in hypoalbuminemia.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Feeding tube',
        body:
            'Enteral nutrition can markedly reduce phenytoin absorption. Tube-feed interruption and level monitoring should follow validated protocol; jejunal administration is problematic.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Formulation / salt',
        body:
            'Suspension, capsules and chewable products may use different salt/base expressions and are not blindly interchangeable.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد على منع نوبات الصرع.',
      howToUseAr: 'خذه في نفس الأوقات وبنفس الشكل الدوائي الذي وصفه الطبيب.',
      importantAr: 'لا تبدّل بين الشراب والكبسولات أو تغير الشركة/المنتج دون مراجعة إذا كنت تحتاج متابعة مستويات.',
      commonActionableAr: 'اهتم بنظافة الأسنان واللثة لأن تضخم اللثة قد يحدث مع الاستخدام الطويل.',
      seekHelpAr: 'راجع الطبيب عند طفح شديد أو عدم اتزان شديد أو كلام متثاقل أو حركات عين غير طبيعية.',
    ),
  ),
  Medication(
    id: 'pregabalin',
    familyId: 'cns',
    name: 'Pregabalin',
    subtitle: 'Neuropathic pain / antiseizure medicine',
    tags: ['Neuropathic pain', 'Seizure adjunct', 'Renal adjustment'],
    sourceLabel: 'MedlinePlus Drug Information · Pregabalin',
    sections: [
      MedicationSection(
        title: 'Administration / duration',
        body:
            'Usually divided two or three times daily depending on product/indication; chronic use should be continued only with meaningful benefit.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Sedation, dizziness, edema, weight gain, falls and respiratory depression when combined with opioids/CNS depressants.',
      ),
      MedicationSection(
        title: 'Renal / stopping',
        body:
            'Dose adjustment is required in renal impairment. Taper rather than abrupt discontinuation.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لبعض آلام الأعصاب وقد يُستخدم مع أدوية الصرع.',
      howToUseAr: 'خذه بانتظام حسب الوصفة ولا توقفه فجأة.',
      commonActionableAr: 'قد يسبب دوخة أو نعاسًا أو تورم القدمين.',
      importantAr: 'اعرف تأثيره عليك قبل القيادة، وخاصة إذا تستخدم مسكنات أفيونية أو مهدئات.',
    ),
  ),
  Medication(
    id: 'duloxetine',
    familyId: 'cns',
    name: 'Duloxetine',
    subtitle: 'SNRI antidepressant / neuropathic pain therapy',
    tags: ['Depression', 'Anxiety', 'Neuropathic pain', 'Delayed release'],
    sourceLabel: 'MedlinePlus Drug Information · Duloxetine',
    sections: [
      MedicationSection(
        title: 'Administration / formulation',
        body:
            'Delayed-release capsules are swallowed whole; do not crush or chew. Take consistently with or without food according to tolerance/product instructions.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Mood/suicidality, blood pressure, nausea, withdrawal symptoms, liver risk and sodium in susceptible patients.',
      ),
      MedicationSection(
        title: 'Interactions',
        body:
            'MAOIs and other serotonergic drugs are key; NSAIDs/anticoagulants can increase bleeding risk.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم للاكتئاب أو القلق أو بعض آلام الأعصاب حسب حالتك.',
      howToUseAr: 'ابتلع الكبسولة كاملة وفي نفس الوقت تقريبًا يوميًا.',
      importantAr: 'لا توقفه فجأة؛ قد تحتاج الجرعة إلى تقليل تدريجي.',
      seekHelpAr: 'اطلب المساعدة إذا ظهرت أفكار بإيذاء النفس أو أعراض شديدة غير معتادة.',
    ),
  ),
  Medication(
    id: 'escitalopram',
    familyId: 'cns',
    name: 'Escitalopram',
    subtitle: 'SSRI antidepressant',
    tags: ['Depression', 'Anxiety', 'Oral'],
    sourceLabel: 'MedlinePlus Drug Information · Escitalopram',
    sections: [
      MedicationSection(
        title: 'Duration / expectations',
        body:
            'Benefit builds over several weeks. Continue for an adequate maintenance period after response; longer treatment may be needed for recurrent illness.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Mood/suicidality after initiation or dose changes, sexual adverse effects, hyponatremia risk and adherence.',
      ),
      MedicationSection(
        title: 'Stopping / interactions',
        body:
            'Taper rather than abrupt stopping. Review MAOIs, other serotonergic medicines and QT-risk combinations in susceptible patients.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم للاكتئاب أو القلق حسب حالتك.',
      howToUseAr: 'خذه مرة يوميًا في وقت ثابت، مع الطعام أو بدونه.',
      commonActionableAr: 'قد يحتاج عدة أسابيع حتى يظهر التحسن الكامل.',
      importantAr: 'لا توقفه فجأة من نفسك.',
      seekHelpAr: 'اطلب مساعدة إذا ظهرت أفكار بإيذاء النفس أو تدهور شديد ومفاجئ في المزاج.',
    ),
  ),
  Medication(
    id: 'topiramate',
    familyId: 'cns',
    name: 'Topiramate',
    subtitle: 'Antiseizure / migraine-prevention medicine',
    tags: ['Epilepsy', 'Migraine prevention', 'Hydration'],
    sourceLabel: 'MedlinePlus Drug Information · Topiramate',
    sections: [
      MedicationSection(
        title: 'Administration / formulation',
        body:
            'Tablets and sprinkle capsules have different handling. Swallow tablets whole; sprinkle products may be opened only as directed. Maintain hydration.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Cognition/word-finding, weight, bicarbonate/metabolic acidosis risk, kidney stones, eye symptoms and renal function when relevant.',
      ),
      MedicationSection(
        title: 'Patient-specific',
        body:
            'Pregnancy risk is important. Enzyme/contraceptive interactions depend on dose and regimen.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم للصرع أو لمنع نوبات الشقيقة.',
      howToUseAr: 'خذه بانتظام واشرب سوائل كافية ما لم يكن لديك تقييد للسوائل.',
      commonActionableAr: 'قد يسبب بطئًا بالتفكير أو تنميلًا أو فقدان شهية عند بعض الأشخاص.',
      seekHelpAr: 'اطلب تقييمًا عاجلًا إذا ظهر ألم مفاجئ في العين أو تشوش شديد بالرؤية.',
    ),
  ),
  Medication(
    id: 'pantoprazole-oral',
    familyId: 'gastrointestinal',
    name: 'Pantoprazole Oral',
    subtitle: 'Proton-pump inhibitor',
    tags: ['GERD', 'Ulcer', 'Delayed release'],
    sourceLabel: 'MedlinePlus Drug Information · Pantoprazole',
    sections: [
      MedicationSection(
        title: 'Formulation distinction',
        body:
            'Delayed-release tablets are swallowed whole. Granules have specific mixing/administration rules and are not the same as tablets.',
      ),
      MedicationSection(
        title: 'Duration',
        body:
            'Treatment duration is indication-specific; uncomplicated GERD courses and chronic hypersecretory/maintenance indications differ.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Long-term therapy should be periodically reassessed for ongoing indication; monitor magnesium/B12/iron or bone risk only when clinically appropriate.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يقلل حموضة المعدة ويُستخدم للحموضة أو القرحة أو حالات زيادة إفراز الحمض.',
      howToUseAr: 'ابتلع الحبة المتأخرة المفعول كاملة ولا تسحقها.',
      importantAr: 'إذا كان لديك حبيبات/Granules فطريقة استخدامها مختلفة، اتبع تعليمات المنتج.',
      timingAr: 'اتبع توقيت وصفتك؛ بعض الاستطبابات تحتاج توقيتًا قبل الطعام.',
    ),
  ),
  Medication(
    id: 'famotidine',
    familyId: 'gastrointestinal',
    name: 'Famotidine',
    subtitle: 'H2-receptor blocker',
    tags: ['Heartburn', 'GERD', 'Ulcer', 'OTC'],
    sourceLabel: 'MedlinePlus Drug Information · Famotidine',
    sections: [
      MedicationSection(
        title: 'Administration / duration',
        body:
            'With or without food. OTC self-treatment has duration limits; persistent or alarm symptoms require referral.',
      ),
      MedicationSection(
        title: 'Renal adjustment',
        body:
            'Dose/frequency reduction may be required in renal impairment to reduce CNS adverse effects.',
      ),
      MedicationSection(
        title: 'Clinical pearl',
        body:
            'Night-time H2 blocker can be useful in selected patients, but tachyphylaxis can reduce effect with continuous use.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يقلل حمض المعدة ويساعد في الحموضة وبعض حالات القرحة والارتجاع.',
      howToUseAr: 'خذه حسب الجرعة المكتوبة، مع الطعام أو بدونه.',
      importantAr: 'إذا كنت تستخدمه بدون وصفة واستمرت الأعراض أو تكررت كثيرًا، راجع الطبيب أو الصيدلي.',
    ),
  ),
  Medication(
    id: 'sucralfate',
    familyId: 'gastrointestinal',
    name: 'Sucralfate',
    subtitle: 'Mucosal-protective agent',
    tags: ['Ulcer', 'Empty stomach', 'Drug separation'],
    sourceLabel: 'MedlinePlus Drug Information · Sucralfate',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Typically taken on an empty stomach. It can bind many oral medicines; separation timing should be individualized by interacting drug.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Constipation is common; aluminum accumulation is a concern in significant renal impairment.',
      ),
      MedicationSection(
        title: 'Common error',
        body:
            'Giving all morning medications together with sucralfate can markedly reduce absorption of selected drugs.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يغطي سطح القرحة ويساعد على حمايتها أثناء الالتئام.',
      howToUseAr: 'غالبًا يؤخذ على معدة فارغة حسب الوصفة.',
      importantAr: 'لا تأخذ كل أدويتك معه في نفس الوقت؛ بعض الأدوية تحتاج فصلًا عنه.',
      commonActionableAr: 'الإمساك من الأعراض الشائعة.',
    ),
  ),
  Medication(
    id: 'mesalamine',
    familyId: 'gastrointestinal',
    name: 'Mesalamine',
    subtitle: '5-ASA anti-inflammatory therapy',
    tags: ['Ulcerative colitis', 'Delayed release', 'Maintenance'],
    sourceLabel: 'MedlinePlus Drug Information · Mesalamine',
    sections: [
      MedicationSection(
        title: 'Formulation distinction',
        body:
            'Different delayed-/extended-release products target different GI regions and have different food instructions. They are not automatically interchangeable.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Duration',
        body:
            'Used for induction and/or long-term maintenance of ulcerative colitis depending on product and regimen.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Renal function before and during therapy; monitor intolerance syndrome, severe abdominal pain/diarrhea and rare cardiac/pancreatic reactions.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يقلل التهاب القولون التقرحي ويساعد على السيطرة على الأعراض ومنع عودتها.',
      howToUseAr: 'خذ نفس المنتج والشكل الدوائي الموصوف لك؛ الأنواع المختلفة ليست بدائل مباشرة لبعضها.',
      importantAr: 'لا تسحق أو تكسر الأقراص المتأخرة/الممتدة المفعول إلا إذا سمحت تعليمات منتجك.',
      seekHelpAr: 'راجع الطبيب إذا ساء ألم البطن أو الإسهال بشكل واضح بعد بدء الدواء.',
    ),
  ),
  Medication(
    id: 'metoclopramide-oral',
    familyId: 'gastrointestinal',
    name: 'Metoclopramide Oral',
    subtitle: 'Prokinetic / antiemetic',
    tags: ['Nausea', 'Gastroparesis', 'Duration limit'],
    sourceLabel: 'MedlinePlus Drug Information · Metoclopramide',
    sections: [
      MedicationSection(
        title: 'Duration warning',
        body:
            'Avoid prolonged use beyond recommended limits because tardive dyskinesia risk rises with cumulative exposure.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Often scheduled before meals and at bedtime for gastroparesis/GERD regimens, but indication-specific instructions apply.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Akathisia, dystonia, parkinsonism, sedation and tardive movements. Renal dose adjustment may be needed.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم للغثيان أو بطء حركة المعدة في حالات محددة.',
      howToUseAr: 'خذه في الأوقات المكتوبة لك؛ قد يكون قبل الوجبات في بعض الحالات.',
      importantAr: 'لا تطل مدة الاستخدام من نفسك.',
      seekHelpAr: 'أوقفه وراجع الطبيب إذا ظهرت حركات لا إرادية بالوجه أو اللسان أو الجسم، أو تشنجات عضلية شديدة.',
    ),
  ),
  Medication(
    id: 'diclofenac-topical',
    familyId: 'pain-inflammation',
    name: 'Diclofenac Topical',
    subtitle: 'Topical NSAID',
    tags: ['Arthritis pain', 'Topical', 'NSAID', 'OTC'],
    sourceLabel: 'MedlinePlus Drug Information · Diclofenac Topical',
    sections: [
      MedicationSection(
        title: 'Product distinction',
        body:
            'Gel strengths/indications and topical solutions differ in dose, frequency and applicator. Do not treat all topical diclofenac as the same product.',
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Apply only to intact skin and avoid eyes/mucosa. Let treated skin dry before covering as directed; wash hands according to site/product instructions.',
      ),
      MedicationSection(
        title: 'Duration / systemic risk',
        body:
            'OTC arthritis gel is time-limited unless clinician-directed. Systemic NSAID risk is lower than oral but not zero.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يخفف ألم والتهاب بعض المفاصل عند وضعه على الجلد.',
      howToUseAr: 'ضع الكمية المحددة لمنتجك على الجلد السليم فقط.',
      importantAr: 'لا تضعه على جرح أو طفح، ولا تجمعه مع NSAID آخر من نفسك.',
      seekHelpAr: 'راجع الطبيب إذا ظهر طفح شديد أو أعراض نزف معدي أو ألم صدر.',
    ),
  ),
  Medication(
    id: 'celecoxib',
    familyId: 'pain-inflammation',
    name: 'Celecoxib',
    subtitle: 'COX-2 selective NSAID',
    tags: ['Pain', 'Arthritis', 'NSAID'],
    sourceLabel: 'MedlinePlus Drug Information · Celecoxib',
    sections: [
      MedicationSection(
        title: 'Administration / duration',
        body:
            'Use the lowest effective dose for the shortest appropriate duration. Food instructions depend on dose/product context.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'GI bleeding, blood pressure, renal function, edema and cardiovascular risk.',
      ),
      MedicationSection(
        title: 'Interactions',
        body:
            'Anticoagulants/antiplatelets, ACEI/ARB/diuretics, lithium and other NSAIDs require review.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يخفف الألم والالتهاب في حالات مثل التهاب المفاصل.',
      howToUseAr: 'خذ أقل جرعة فعالة حسب الوصفة ولا تجمعه مع NSAIDs أخرى من نفسك.',
      importantAr: 'كونه COX-2 لا يعني أنه خالٍ من مخاطر القلب أو الكلى أو النزف.',
      seekHelpAr: 'اطلب المساعدة عند براز أسود أو قيء دموي أو ألم صدر أو ضيق نفس.',
    ),
  ),
  Medication(
    id: 'dabigatran',
    familyId: 'anticoagulation',
    name: 'Dabigatran',
    subtitle: 'Direct thrombin inhibitor',
    tags: ['Anticoagulant', 'Capsule handling', 'Bleeding risk'],
    sourceLabel: 'MedlinePlus Drug Information · Dabigatran',
    sections: [
      MedicationSection(
        title: 'Critical formulation handling',
        body:
            'Capsules must be swallowed whole and kept in the original bottle/blister as directed; opening/crushing markedly increases bioavailability.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Renal function, bleeding, adherence and peri-procedure planning. Routine INR is not used.',
      ),
      MedicationSection(
        title: 'Duration',
        body:
            'Indication-specific: atrial fibrillation is often long-term; VTE treatment may be finite or extended.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مميع دم يقلل خطر تكوّن الجلطات.',
      howToUseAr: 'ابتلع الكبسولة كاملة ولا تفتحها أو تسحقها أو تمضغها.',
      importantAr: 'احفظها في العبوة الأصلية حسب تعليمات المنتج ولا توقفها من نفسك.',
      seekHelpAr: 'اطلب المساعدة عند نزف شديد أو مستمر أو بعد ضربة قوية على الرأس.',
    ),
  ),
  Medication(
    id: 'enoxaparin',
    familyId: 'anticoagulation',
    name: 'Enoxaparin Injection',
    subtitle: 'Low-molecular-weight heparin',
    tags: ['Anticoagulant', 'Injection', 'Bleeding', 'Renal'],
    hasVisualGuide: true,
    sourceLabel: 'MedlinePlus Drug Information · Enoxaparin Injection',
    sections: [
      MedicationSection(
        title: 'Injection technique',
        body:
            'Subcutaneous abdominal injection; rotate sites and follow syringe-specific instructions. Do not expel the air bubble from prefilled syringes when product instructions say to retain it.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Bleeding, CBC/platelets, renal function; anti-Xa monitoring is reserved for selected situations rather than routine use.',
      ),
      MedicationSection(
        title: 'High-value safety',
        body:
            'Neuraxial/spinal procedures carry serious hematoma risk; timing around epidural/spinal anesthesia must follow protocol.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'حقنة مميعة للدم لمنع أو علاج الجلطات.',
      howToUseAr: 'احقنها تحت الجلد في البطن بالطريقة التي تم تدريبك عليها وبدّل مكان الحقن.',
      importantAr: 'لا تفرك مكان الحقن بعد الجرعة، ولا تتخلص من فقاعة الهواء إذا كانت تعليمات السرنجة تقول إبقاءها.',
      seekHelpAr: 'اطلب المساعدة عند نزف شديد أو ضعف/تنميل جديد بالساقين بعد إجراء في الظهر.',
      teachBackAr: 'أرني أين ستحقن وكيف تتخلص من السرنجة.',
    ),
  ),
  Medication(
    id: 'loratadine',
    familyId: 'allergy-dermatology',
    name: 'Loratadine',
    subtitle: 'Second-generation antihistamine',
    tags: ['Allergy', 'Hives', 'OTC'],
    sourceLabel: 'MedlinePlus Drug Information · Loratadine',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Usually once daily with or without food. ODT/liquid products need formulation-specific handling.',
      ),
      MedicationSection(
        title: 'Patient-specific',
        body:
            'Renal/hepatic impairment may alter dosing interval. Sedation is less common than with first-generation antihistamines but can still occur.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يخفف أعراض الحساسية مثل العطاس والحكة وسيلان الأنف والشرى.',
      howToUseAr: 'خذ الجرعة مرة يوميًا حسب المنتج، مع الطعام أو بدونه.',
      commonActionableAr: 'النعاس أقل شيوعًا من بعض أدوية الحساسية القديمة لكنه قد يحدث.',
    ),
  ),
  Medication(
    id: 'chlorpheniramine',
    familyId: 'allergy-dermatology',
    name: 'Chlorpheniramine',
    subtitle: 'First-generation antihistamine',
    tags: ['Allergy', 'Sedating', 'Anticholinergic', 'OTC'],
    sourceLabel: 'MedlinePlus Drug Information · Chlorpheniramine',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Sedating/anticholinergic. Review age, falls, driving, glaucoma, urinary retention/prostate symptoms and other CNS depressants.',
      ),
      MedicationSection(
        title: 'Duration',
        body:
            'Short-term symptom relief rather than default chronic therapy when less-sedating alternatives are appropriate.',
      ),
      MedicationSection(
        title: 'Common counseling issue',
        body:
            'Alcohol and other sedatives can markedly worsen drowsiness and impairment.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يخفف أعراض الحساسية لكنه من الأنواع التي قد تسبب نعاسًا واضحًا.',
      howToUseAr: 'خذ الجرعة حسب المنتج وتجنب القيادة حتى تعرف تأثيره عليك.',
      importantAr: 'تجنب الكحول والمهدئات غير الضرورية معه.',
      commonActionableAr: 'قد يسبب جفاف الفم والنعاس وصعوبة التبول عند بعض الأشخاص.',
    ),
  ),
  Medication(
    id: 'isotretinoin',
    familyId: 'allergy-dermatology',
    name: 'Isotretinoin',
    subtitle: 'Systemic retinoid for severe acne',
    tags: ['Acne', 'Teratogenic', 'Monitoring', 'Oral'],
    sourceLabel: 'FDA / MedlinePlus Drug Information · Isotretinoin',
    sections: [
      MedicationSection(
        title: 'Critical pregnancy safety',
        body:
            'Highly teratogenic. Pregnancy-prevention, testing and dispensing-program requirements must follow the applicable regulatory program.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Pregnancy testing where relevant, lipids, liver tests and clinically significant mood/visual/musculoskeletal symptoms.',
      ),
      MedicationSection(
        title: 'Administration / interactions',
        body:
            'Take according to the exact product food instructions. Avoid vitamin A supplements and tetracyclines unless specifically managed.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لعلاج حب الشباب الشديد عندما لا تكفي العلاجات الأخرى.',
      howToUseAr: 'خذه بالجرعة والطريقة الخاصة بمنتجك ولا تشاركه مع أي شخص.',
      importantAr: 'يمنع الحمل أثناء العلاج وبالمدة المطلوبة بعده حسب برنامج العلاج. لا تستخدم فيتامين A إضافي من نفسك.',
      seekHelpAr: 'راجع الطبيب عند أعراض شديدة غير معتادة، خصوصًا صداع شديد مع تشوش رؤية أو تغيرات نفسية مهمة.',
    ),
  ),
  Medication(
    id: 'hydroxychloroquine',
    familyId: 'rheumatology-immunology',
    name: 'Hydroxychloroquine',
    subtitle: 'Conventional DMARD',
    tags: ['Rheumatology', 'Lupus', 'Eye monitoring'],
    sourceLabel: 'MedlinePlus Drug Information · Hydroxychloroquine',
    sections: [
      MedicationSection(
        title: 'Administration / duration',
        body:
            'Usually long-term; take with food or milk to reduce GI upset. Therapeutic benefit may take weeks to months.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Baseline and follow-up retinal screening according to ophthalmology/rheumatology guidance; dose should account for body weight and renal risk factors.',
      ),
      MedicationSection(
        title: 'Interactions / safety',
        body:
            'QT-prolonging combinations and hypoglycemia risk may matter. Severe rash, muscle weakness or cardiac symptoms require review.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لعلاج أمراض مثل الروماتويد والذئبة وقد يحتاج وقتًا حتى يظهر مفعوله.',
      howToUseAr: 'خذه مع الطعام أو الحليب لتقليل انزعاج المعدة.',
      importantAr: 'حافظ على مواعيد فحص العين المطلوبة أثناء العلاج الطويل.',
      seekHelpAr: 'راجع الطبيب إذا ظهر تشوش أو تغير جديد في الرؤية أو خفقان/إغماء غير معتاد.',
    ),
  ),
  Medication(
    id: 'sulfasalazine',
    familyId: 'rheumatology-immunology',
    name: 'Sulfasalazine',
    subtitle: 'DMARD / 5-ASA prodrug',
    tags: ['Rheumatoid arthritis', 'IBD', 'Monitoring'],
    sourceLabel: 'MedlinePlus Drug Information · Sulfasalazine',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Take after meals with adequate fluid. Enteric-coated products should be swallowed whole.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'CBC, liver function and renal function according to indication/stability; monitor rash, sore throat/fever and GI intolerance.',
      ),
      MedicationSection(
        title: 'Clinical pearl',
        body:
            'Can reduce folate absorption and may cause reversible oligospermia; counseling is patient-specific.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لبعض أمراض الروماتيزم أو التهاب الأمعاء حسب حالتك.',
      howToUseAr: 'خذه بعد الطعام ومع كمية كافية من الماء.',
      importantAr: 'إذا كان النوع مغلفًا معويًا ابتلعه كاملًا.',
      seekHelpAr: 'راجع الطبيب عند طفح شديد أو حرارة/التهاب حلق أو كدمات غير معتادة.',
    ),
  ),
  Medication(
    id: 'leflunomide',
    familyId: 'rheumatology-immunology',
    name: 'Leflunomide',
    subtitle: 'Conventional DMARD',
    tags: ['Rheumatoid arthritis', 'Teratogenic', 'Monitoring'],
    sourceLabel: 'MedlinePlus Drug Information · Leflunomide',
    sections: [
      MedicationSection(
        title: 'Duration / monitoring',
        body:
            'Long-term DMARD if effective. Monitor liver tests, CBC, blood pressure and infection risk.',
      ),
      MedicationSection(
        title: 'Pregnancy safety',
        body:
            'Teratogenic with very long persistence; accelerated elimination procedure may be required before conception or after serious toxicity.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Interactions',
        body:
            'Other hepatotoxic or immunosuppressive drugs require careful review.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يقلل نشاط التهاب المفاصل الروماتويدي ويُستخدم كعلاج طويل المدى عند الاستجابة.',
      howToUseAr: 'خذه يوميًا حسب الوصفة ولا توقف المتابعة والفحوصات.',
      importantAr: 'يمنع أثناء الحمل وقد يحتاج الجسم إلى خطة خاصة لإزالة الدواء سريعًا إذا لزم.',
      seekHelpAr: 'راجع الطبيب عند اصفرار الجلد/العينين أو عدوى شديدة أو ضيق نفس جديد.',
    ),
  ),
  Medication(
    id: 'adalimumab',
    familyId: 'rheumatology-immunology',
    name: 'Adalimumab',
    subtitle: 'TNF inhibitor biologic',
    tags: ['Biologic', 'Injection', 'Rheumatology', 'IBD'],
    hasVisualGuide: true,
    sourceLabel: 'MedlinePlus Drug Information · Adalimumab Injection',
    sections: [
      MedicationSection(
        title: 'Before / during therapy',
        body:
            'Screen for tuberculosis and serious infection risk before therapy; review hepatitis B history, vaccines and demyelinating/heart-failure context.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Injection / storage',
        body:
            'Subcutaneous device-specific injection. Refrigerate, do not freeze, protect from light and allow warming to room temperature only according to exact product IFU.',
      ),
      MedicationSection(
        title: 'Duration',
        body:
            'Long-term biologic therapy if effective and tolerated; dosing interval and induction schedules differ by indication.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'دواء بيولوجي يقلل الالتهاب في أمراض مناعية مختلفة.',
      howToUseAr: 'استخدم القلم/السرنجة في المواعيد الخاصة بحالتك وبدّل موضع الحقن.',
      importantAr: 'لا تستخدمه إذا لديك عدوى شديدة من دون مراجعة الطبيب، واسأل قبل اللقاحات.',
      storageAr: 'يحفظ في الثلاجة ولا يُجمّد، واتبع تعليمات منتجك إذا خرج من الثلاجة.',
      teachBackAr: 'أرني طريقة الحقن والتخلص من القلم أو السرنجة.',
    ),
  ),
  Medication(
    id: 'solifenacin',
    familyId: 'urology',
    name: 'Solifenacin',
    subtitle: 'Antimuscarinic for overactive bladder',
    tags: ['Overactive bladder', 'Anticholinergic', 'Oral'],
    sourceLabel: 'MedlinePlus Drug Information · Solifenacin',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Once daily with or without food; swallow tablet whole with liquid.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Dry mouth, constipation, urinary retention, cognition in older adults and QT risk in susceptible patients.',
      ),
      MedicationSection(
        title: 'Patient-specific',
        body:
            'Avoid/caution in urinary retention, gastric retention and uncontrolled narrow-angle glaucoma.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يخفف كثرة التبول والحاجة الملحة للتبول في فرط نشاط المثانة.',
      howToUseAr: 'خذ الحبة مرة يوميًا مع الطعام أو بدونه وابتلعها كاملة.',
      commonActionableAr: 'قد يسبب جفاف الفم أو الإمساك.',
      seekHelpAr: 'راجع الطبيب إذا لم تستطع التبول أو ظهر ألم شديد بالعين مع تشوش الرؤية.',
    ),
  ),
  Medication(
    id: 'mirabegron',
    familyId: 'urology',
    name: 'Mirabegron',
    subtitle: 'Beta-3 agonist for overactive bladder',
    tags: ['Overactive bladder', 'Blood pressure', 'Extended release'],
    sourceLabel: 'MedlinePlus Drug Information · Mirabegron',
    sections: [
      MedicationSection(
        title: 'Formulation',
        body:
            'Extended-release tablets should be swallowed whole. Pediatric/granule products have different instructions.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Blood pressure, urinary retention and symptom response.',
      ),
      MedicationSection(
        title: 'Interactions',
        body:
            'CYP2D6 inhibition can increase exposure to selected drugs; digoxin coadministration requires review.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يخفف أعراض فرط نشاط المثانة مثل الإلحاح وكثرة التبول.',
      howToUseAr: 'ابتلع الحبة ممتدة المفعول كاملة في نفس الوقت يوميًا.',
      importantAr: 'قد يرفع ضغط الدم عند بعض الأشخاص؛ التزم بقياساتك إذا طلبها الطبيب.',
      seekHelpAr: 'راجع الطبيب إذا أصبحت غير قادر على التبول.',
    ),
  ),
  Medication(
    id: 'depot-medroxyprogesterone',
    familyId: 'womens-health',
    name: 'Depot Medroxyprogesterone Injection',
    subtitle: 'Long-acting progestin contraception',
    tags: ['Contraception', 'Injection', 'Every 3 months'],
    sourceLabel: 'MedlinePlus Drug Information · Medroxyprogesterone Injection',
    sections: [
      MedicationSection(
        title: 'Schedule',
        body:
            'Long-acting injection given on a strict repeating schedule; late injections require pregnancy assessment and backup-contraception advice per guidance.',
      ),
      MedicationSection(
        title: 'Monitoring / duration',
        body:
            'Bleeding pattern, weight, bone-health risk factors and return-to-fertility expectations should be discussed. Long-term use requires individualized benefit-risk review.',
      ),
      MedicationSection(
        title: 'Clinical pearl',
        body:
            'Amenorrhea is common with continued use and does not by itself indicate pregnancy when injections are on schedule.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'وسيلة منع حمل طويلة المفعول تُعطى بالحقن كل عدة أشهر حسب الجدول.',
      howToUseAr: 'احرصي على موعد الحقنة التالية ولا تؤخريها من دون معرفة خطة التعويض.',
      commonActionableAr: 'قد يحدث نزف غير منتظم في البداية ثم قد تنقطع الدورة مع الوقت.',
      importantAr: 'عودة الخصوبة بعد إيقاف الحقن قد تتأخر عدة أشهر.',
    ),
  ),
  Medication(
    id: 'olopatadine-eye',
    familyId: 'eye-ear',
    name: 'Olopatadine Eye Drops',
    subtitle: 'Antihistamine / mast-cell stabilizer',
    tags: ['Allergic conjunctivitis', 'Eye drops', 'OTC'],
    hasVisualGuide: true,
    sourceLabel: 'MedlinePlus Drug Information · Olopatadine Ophthalmic',
    sections: [
      MedicationSection(
        title: 'Technique',
        body:
            'Avoid touching dropper tip. Remove contact lenses when required by product and wait the labeled interval before reinsertion.',
      ),
      MedicationSection(
        title: 'Duration / referral',
        body:
            'Use for allergic eye symptoms; pain, significant photophobia, purulent discharge or visual loss suggests another diagnosis and needs evaluation.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يخفف حكة واحمرار العين الناتجين عن الحساسية.',
      howToUseAr: 'ضع القطرة من دون أن تلمس فوهة العبوة العين أو الرموش.',
      importantAr: 'إذا تستخدم عدسات لاصقة، اتبع تعليمات المنتج حول إزالتها ووقت إعادتها.',
      seekHelpAr: 'راجع الطبيب إذا ظهر ألم شديد بالعين أو حساسية للضوء أو نقص في النظر.',
    ),
  ),
  Medication(
    id: 'ibuprofen-pediatric-liquid',
    familyId: 'pediatrics',
    name: 'Ibuprofen Pediatric Liquid',
    subtitle: 'Pediatric NSAID liquid',
    tags: ['Pediatric', 'Fever', 'Pain', 'Liquid'],
    sourceLabel: 'MedlinePlus / OTC labeling · Ibuprofen',
    sections: [
      MedicationSection(
        title: 'Pediatric dosing safety',
        body:
            'Dose by weight and exact product concentration. Verify age suitability, hydration and renal/GI risk before use.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Shake suspension well and measure with oral syringe/cup. Give with food/milk if stomach upset occurs.',
      ),
      MedicationSection(
        title: 'Avoid',
        body:
            'Avoid in dehydrated children and do not combine with another NSAID. Infants below product-approved age need clinician guidance.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يخفف الألم والحرارة عند الطفل.',
      howToUseAr: 'رج العبوة جيدًا وقس الجرعة حسب وزن الطفل وتركيز هذه العبوة باستخدام السرنجة الفموية.',
      importantAr: 'لا تعطِ نفس عدد mL من عبوة بتركيز مختلف، ولا تجمعه مع مسكن NSAID آخر.',
      seekHelpAr: 'إذا كان الطفل لا يشرب جيدًا أو يتقيأ باستمرار أو يبدو مصابًا بالجفاف، اسأل الطبيب قبل ibuprofen.',
      teachBackAr: 'أرني وزن الطفل وتركيز العبوة والحجم الذي ستقيسه.',
    ),
  ),
  Medication(
    id: 'oral-rehydration-solution',
    familyId: 'otc',
    name: 'Oral Rehydration Solution',
    subtitle: 'Glucose-electrolyte rehydration solution',
    tags: ['Diarrhea', 'Dehydration', 'Pediatric', 'OTC'],
    sourceLabel: 'WHO/UNICEF oral rehydration principles',
    sections: [
      MedicationSection(
        title: 'Preparation',
        body:
            'Use an approved ORS product and mix with the exact volume of clean water stated on the sachet. Do not make it stronger or weaker.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Give frequent small sips; after vomiting, pause briefly then restart slowly. Continue age-appropriate feeding/breastfeeding unless medically contraindicated.',
      ),
      MedicationSection(
        title: 'Referral',
        body:
            'Severe dehydration, persistent vomiting, lethargy, inability to drink, blood in stool or very young/high-risk patients require medical assessment.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يعوض الماء والأملاح المفقودة مع الإسهال أو القيء.',
      howToUseAr: 'أذب الكيس فقط في كمية الماء المكتوبة عليه بالضبط، ثم أعطِ رشفات صغيرة ومتكررة.',
      importantAr: 'لا تضف سكرًا أو ملحًا إضافيًا ولا تخلط الكيس في كمية ماء أقل أو أكثر من المطلوب.',
      seekHelpAr: 'اطلب المساعدة إذا كان المريض لا يستطيع الشرب أو أصبح خاملًا جدًا أو ظهرت علامات جفاف شديد أو دم بالبراز.',
    ),
  ),
  Medication(
    id: 'psyllium',
    familyId: 'otc',
    name: 'Psyllium',
    subtitle: 'Bulk-forming fiber laxative',
    tags: ['Constipation', 'Fiber', 'OTC'],
    sourceLabel: 'MedlinePlus Drug Information · Psyllium',
    sections: [
      MedicationSection(
        title: 'Critical administration',
        body:
            'Mix each dose with a full amount of liquid and drink promptly. Inadequate fluid can cause choking or obstruction.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Interactions',
        body:
            'May reduce absorption of selected oral medicines; separation timing should follow the interacting drug/product guidance.',
      ),
      MedicationSection(
        title: 'Duration / referral',
        body:
            'Useful for constipation and fiber supplementation, but new persistent change in bowel habit, dysphagia or obstruction symptoms need evaluation.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يزيد حجم وليونة البراز ويساعد على علاج الإمساك.',
      howToUseAr: 'اخلط الجرعة مع كمية كافية من الماء واشربها مباشرة.',
      importantAr: 'لا تأخذه جافًا، واشرب سوائل كافية ما لم يكن لديك تقييد للسوائل.',
      seekHelpAr: 'اطلب المساعدة إذا حدثت صعوبة بالبلع أو التنفس أو ألم وانتفاخ شديد بالبطن.',
    ),
  ),
  Medication(
    id: 'simethicone',
    familyId: 'otc',
    name: 'Simethicone',
    subtitle: 'Antiflatulent',
    tags: ['Gas', 'Bloating', 'OTC'],
    sourceLabel: 'MedlinePlus Drug Information · Simethicone',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Products include chewable tablets, capsules and liquids. Chewables must be chewed thoroughly; liquids require accurate measurement.',
      ),
      MedicationSection(
        title: 'Referral',
        body:
            'Persistent severe abdominal pain, vomiting, distension, weight loss or blood in stool should not be repeatedly self-treated as “gas.”',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد على تخفيف الغازات والانتفاخ.',
      howToUseAr: 'استخدم شكل المنتج بالطريقة الصحيحة؛ امضغ الحبة القابلة للمضغ جيدًا وقس السائل بأداة مناسبة.',
      importantAr: 'إذا كان الانتفاخ أو الألم شديدًا أو مستمرًا، لا تعتمد على الدواء وحده.',
    ),
  ),

  Medication(
    id: 'enalapril',
    familyId: 'cardiovascular',
    name: 'Enalapril',
    subtitle: 'ACE inhibitor',
    tags: ['Blood pressure', 'Heart failure', 'Oral', 'Chronic'],
    sourceLabel: 'MedlinePlus Drug Information · Enalapril',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Verify renal function, potassium, pregnancy status and angioedema history. A 36-hour separation is required from sacubitril/valsartan.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration / duration',
        body:
            'Usually once or twice daily with or without food; chronic therapy for hypertension or heart failure.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Blood pressure, creatinine/eGFR and potassium after initiation/titration and when clinically indicated.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لخفض ضغط الدم أو لعلاج فشل القلب.',
      howToUseAr: 'خذه في نفس الوقت تقريبًا كل يوم، مع الطعام أو بدونه.',
      importantAr: 'لا تستخدم مكملات البوتاسيوم أو بدائل الملح من نفسك، ولا تجمعه مع Entresto دون خطة طبية.',
      seekHelpAr: 'اطلب المساعدة عند تورم الوجه أو اللسان أو صعوبة التنفس، وأخبر الطبيب فورًا إذا حدث حمل.',
    ),
  ),
  Medication(
    id: 'ramipril',
    familyId: 'cardiovascular',
    name: 'Ramipril',
    subtitle: 'ACE inhibitor',
    tags: ['Blood pressure', 'Cardiovascular prevention', 'Oral'],
    sourceLabel: 'MedlinePlus Drug Information · Ramipril',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Used for hypertension and cardiovascular risk reduction. Review renal function, potassium, pregnancy, angioedema and NSAID/potassium use.',
      ),
      MedicationSection(
        title: 'Administration / duration',
        body:
            'Once or twice daily according to regimen; chronic therapy. Capsule contents may have product-specific opening instructions.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Blood pressure, renal function and potassium; cough and angioedema remain key counseling points.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يخفض الضغط وقد يساعد على حماية القلب عند بعض المرضى.',
      howToUseAr: 'خذه يوميًا حسب الوصفة وفي وقت ثابت تقريبًا.',
      commonActionableAr: 'قد يسبب سعالًا جافًا أو دوخة.',
      seekHelpAr: 'اطلب مساعدة عاجلة عند تورم الوجه أو الشفتين أو اللسان.',
    ),
  ),
  Medication(
    id: 'candesartan',
    familyId: 'cardiovascular',
    name: 'Candesartan',
    subtitle: 'ARB antihypertensive / heart-failure therapy',
    tags: ['Blood pressure', 'Heart failure', 'ARB'],
    sourceLabel: 'MedlinePlus Drug Information · Candesartan',
    sections: [
      MedicationSection(
        title: 'Administration / duration',
        body:
            'Once or twice daily depending on indication; with or without food. Usually chronic.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Blood pressure, renal function and potassium after initiation/titration when clinically indicated.',
      ),
      MedicationSection(
        title: 'Safety',
        body:
            'Avoid pregnancy; review NSAIDs, potassium supplements/salt substitutes and other RAAS blockers.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لخفض الضغط أو لعلاج بعض حالات فشل القلب.',
      howToUseAr: 'خذه بانتظام مع الطعام أو بدونه.',
      importantAr: 'لا تستخدم مكملات البوتاسيوم أو بدائل الملح دون مراجعة.',
      seekHelpAr: 'إذا حدث حمل أوقفه واتصل بالطبيب فورًا.',
    ),
  ),
  Medication(
    id: 'bisoprolol',
    familyId: 'cardiovascular',
    name: 'Bisoprolol',
    subtitle: 'Beta-1 selective blocker',
    tags: ['Blood pressure', 'Heart failure', 'Heart rate'],
    sourceLabel: 'MedlinePlus / current bisoprolol labeling',
    sections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Review heart rate, BP, conduction disease, heart-failure status, asthma/COPD and diabetes. Titrate gradually and avoid abrupt withdrawal.',
      ),
      MedicationSection(
        title: 'Administration / duration',
        body:
            'Usually once daily, with or without food. Chronic therapy when indicated.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Pulse, BP, dizziness, fatigue and worsening heart-failure symptoms during titration.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لخفض الضغط أو إبطاء النبض أو علاج بعض حالات فشل القلب.',
      howToUseAr: 'خذه مرة يوميًا في نفس الوقت تقريبًا.',
      importantAr: 'لا توقفه فجأة من نفسك.',
      commonActionableAr: 'قد يسبب تعبًا أو دوخة أو بطء النبض.',
    ),
  ),
  Medication(
    id: 'eplerenone',
    familyId: 'cardiovascular',
    name: 'Eplerenone',
    subtitle: 'Mineralocorticoid receptor antagonist',
    tags: ['Heart failure', 'Blood pressure', 'Potassium'],
    sourceLabel: 'MedlinePlus Drug Information · Eplerenone',
    sections: [
      MedicationSection(
        title: 'Monitoring',
        body:
            'Potassium and renal function are essential after initiation/titration and periodically.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Interactions',
        body:
            'Strong CYP3A inhibitors, potassium supplements/salt substitutes and other potassium-raising drugs can be problematic.',
      ),
      MedicationSection(
        title: 'Administration / duration',
        body:
            'Once or twice daily depending on indication, with or without food; usually chronic.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لبعض حالات فشل القلب أو ارتفاع الضغط.',
      howToUseAr: 'خذه في نفس الوقت يوميًا، مع الطعام أو بدونه.',
      importantAr: 'لا تستخدم مكملات البوتاسيوم أو بدائل الملح الغنية بالبوتاسيوم من نفسك.',
    ),
  ),
  Medication(
    id: 'verapamil-er',
    familyId: 'cardiovascular',
    name: 'Verapamil Extended Release',
    subtitle: 'Non-dihydropyridine calcium-channel blocker',
    tags: ['Rate control', 'Blood pressure', 'Angina', 'ER'],
    sourceLabel: 'MedlinePlus Drug Information · Verapamil',
    sections: [
      MedicationSection(
        title: 'Formulation distinction',
        body:
            'Immediate-release and multiple ER products differ in timing, food instructions and crush/open rules; verify exact product.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Heart rate, blood pressure, constipation, edema and conduction symptoms.',
      ),
      MedicationSection(
        title: 'Interactions',
        body:
            'Beta-blockers, digoxin and CYP3A4 substrates/inhibitors require review.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم للضغط أو الذبحة أو لتنظيم سرعة النبض.',
      howToUseAr: 'خذ نفس نوع المنتج الممتد المفعول الموصوف لك ولا تسحقه من نفسك.',
      commonActionableAr: 'الإمساك والدوخة من الأعراض الشائعة.',
      seekHelpAr: 'راجع الطبيب إذا حدث إغماء أو بطء شديد في النبض.',
    ),
  ),
  Medication(
    id: 'isosorbide-mononitrate-er',
    familyId: 'cardiovascular',
    name: 'Isosorbide Mononitrate ER',
    subtitle: 'Long-acting nitrate',
    tags: ['Angina prevention', 'Extended release', 'Nitrate'],
    sourceLabel: 'MedlinePlus Drug Information · Isosorbide',
    sections: [
      MedicationSection(
        title: 'Purpose / duration',
        body:
            'Prevents angina; does not treat an acute attack. Usually chronic with a nitrate-low interval built into regimen.',
      ),
      MedicationSection(
        title: 'Formulation',
        body:
            'ER tablets have product-specific split instructions and must not be crushed/chewed.',
      ),
      MedicationSection(
        title: 'Interactions',
        body:
            'PDE5 inhibitors and riociguat are contraindicated because of profound hypotension risk.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يمنع ألم الصدر الناتج عن الذبحة لكنه ليس لعلاج النوبة المفاجئة.',
      howToUseAr: 'خذ الجرعة حسب الجدول ولا تسحق الحبة ممتدة المفعول.',
      importantAr: 'لا تستخدم sildenafil أو tadalafil أو أدوية مشابهة معه دون مراجعة الطبيب.',
      commonActionableAr: 'الصداع والدوخة شائعان خاصة في البداية.',
    ),
  ),
  Medication(
    id: 'aspirin-low-dose',
    familyId: 'anticoagulation',
    name: 'Aspirin Low Dose',
    subtitle: 'Antiplatelet therapy',
    tags: ['Antiplatelet', 'Cardiovascular prevention', 'Bleeding'],
    sourceLabel: 'MedlinePlus / antiplatelet guidance · Aspirin',
    sections: [
      MedicationSection(
        title: 'Indication / duration',
        body:
            'Often long-term secondary prevention after cardiovascular/cerebrovascular disease; primary-prevention use must be individualized.',
      ),
      MedicationSection(
        title: 'Formulation',
        body:
            'Enteric-coated and chewable products are not equivalent for rapid onset. Do not crush enteric-coated tablets.',
      ),
      MedicationSection(
        title: 'Safety',
        body:
            'Review GI bleeding history, anticoagulants/NSAIDs, allergy/asthma phenotype and upcoming procedures.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يقلل التصاق الصفائح وقد يُستخدم للوقاية من الجلطات عند من يحتاجه.',
      howToUseAr: 'خذه يوميًا حسب الوصفة ولا توقفه من نفسك بعد جلطة أو دعامة.',
      importantAr: 'لا تضف ibuprofen أو naproxen بشكل منتظم دون مراجعة لأن خطر النزف قد يزيد.',
      seekHelpAr: 'اطلب المساعدة عند نزف شديد أو براز أسود أو قيء دموي.',
    ),
  ),
  Medication(
    id: 'linagliptin',
    familyId: 'diabetes-endocrine',
    name: 'Linagliptin',
    subtitle: 'DPP-4 inhibitor',
    tags: ['Diabetes', 'Once daily', 'Oral'],
    sourceLabel: 'MedlinePlus Drug Information · Linagliptin',
    sections: [
      MedicationSection(
        title: 'Administration / duration',
        body:
            'Once daily with or without food; chronic therapy if effective.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'A1c/glucose, pancreatitis symptoms and heart-failure symptoms in susceptible patients.',
      ),
      MedicationSection(
        title: 'Clinical pearl',
        body:
            'Unlike several DPP-4 inhibitors, routine renal dose adjustment is generally not required.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد على خفض سكر الدم في السكري من النوع الثاني.',
      howToUseAr: 'خذه مرة واحدة يوميًا في نفس الوقت تقريبًا، مع الطعام أو بدونه.',
      seekHelpAr: 'راجع الطبيب إذا ظهر ألم شديد ومستمر أعلى البطن مع قيء.',
    ),
  ),
  Medication(
    id: 'acarbose',
    familyId: 'diabetes-endocrine',
    name: 'Acarbose',
    subtitle: 'Alpha-glucosidase inhibitor',
    tags: ['Diabetes', 'With first bite', 'GI effects'],
    sourceLabel: 'MedlinePlus Drug Information · Acarbose',
    sections: [
      MedicationSection(
        title: 'Critical administration',
        body:
            'Take with the FIRST BITE of each main meal; a dose is not useful if the meal is skipped.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Hypoglycemia counseling',
        body:
            'When hypoglycemia occurs from combination therapy, treat with glucose/dextrose—not sucrose alone—because acarbose slows sucrose breakdown.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Postprandial glucose/A1c and GI tolerance; liver tests may be indicated at higher doses/prolonged use.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يقلل ارتفاع السكر بعد الوجبات.',
      howToUseAr: 'خذ الجرعة مع أول لقمة من كل وجبة رئيسية.',
      importantAr: 'إذا حدث هبوط سكر بسبب أدوية أخرى، استخدم glucose/dextrose حسب خطة الهبوط وليس السكر العادي وحده.',
      commonActionableAr: 'الغازات والانتفاخ شائعان خاصة في البداية.',
    ),
  ),
  Medication(
    id: 'insulin-aspart',
    familyId: 'diabetes-endocrine',
    name: 'Insulin Aspart',
    subtitle: 'Rapid-acting mealtime insulin',
    tags: ['Insulin', 'Mealtime', 'Injection', 'High alert'],
    hasVisualGuide: true,
    sourceLabel: 'MedlinePlus Drug Information · Insulin Aspart',
    sections: [
      MedicationSection(
        title: 'Critical timing',
        body:
            'Rapid-acting insulin is tied closely to meal timing; exact pre-/post-meal window depends on product. Confirm patient is ready to eat.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Device / formulation',
        body:
            'Pens, cartridges, vials and faster-acting formulations are not automatically interchangeable in timing or handling.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Glucose/CGM, hypoglycemia, meal carbohydrate, injection technique, sites and storage.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'إنسولين سريع لتغطية الوجبات وتصحيح السكر.',
      howToUseAr: 'استخدمه في الوقت المحدد بالنسبة للوجبة، وتأكد أنك ستأكل حسب خطتك.',
      importantAr: 'تأكد من اسم الإنسولين وتركيزه قبل كل حقنة.',
      seekHelpAr: 'اتبع خطة علاج هبوط السكر إذا حدث، واطلب المساعدة إذا كان شديدًا.',
    ),
  ),
  Medication(
    id: 'insulin-nph',
    familyId: 'diabetes-endocrine',
    name: 'NPH Insulin',
    subtitle: 'Intermediate-acting cloudy insulin',
    tags: ['Insulin', 'Cloudy', 'Injection', 'High alert'],
    hasVisualGuide: true,
    sourceLabel: 'MedlinePlus / NPH insulin product labeling',
    sections: [
      MedicationSection(
        title: 'Preparation',
        body:
            'NPH is a suspension and should be gently rolled/inverted according to product IFU until uniformly cloudy; do not shake vigorously.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Mixing',
        body:
            'May be mixed with selected short/rapid insulins only under validated instructions; mixing order matters. Do not mix with insulin glargine.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Glucose patterns and hypoglycemia, especially during expected peak activity.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'إنسولين متوسط المفعول للمساعدة على ضبط السكر بين الوجبات وخلال اليوم/الليل.',
      howToUseAr: 'حرّك العبوة بلطف بالطريقة التي تعلمتها حتى يصبح السائل عكرًا بشكل متجانس.',
      importantAr: 'لا ترج العبوة بقوة، ولا تخلطه مع إنسولين آخر إلا إذا لديك تعليمات واضحة.',
      teachBackAr: 'أرني كيف تجهز NPH قبل الحقن وكيف تتأكد من نوع الإنسولين.',
    ),
  ),
  Medication(
    id: 'methimazole',
    familyId: 'diabetes-endocrine',
    name: 'Methimazole',
    subtitle: 'Antithyroid medicine',
    tags: ['Hyperthyroidism', 'Monitoring', 'Agranulocytosis'],
    sourceLabel: 'MedlinePlus Drug Information · Methimazole',
    sections: [
      MedicationSection(
        title: 'Duration',
        body:
            'Often months to years depending on Graves disease strategy; dose is adjusted to thyroid-function response.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Thyroid function; CBC if infection/agranulocytosis symptoms; liver injury symptoms.',
      ),
      MedicationSection(
        title: 'Critical counseling',
        body:
            'Fever or severe sore throat can signal agranulocytosis and requires prompt evaluation rather than simply continuing medication.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يقلل تصنيع هرمونات الغدة الدرقية عند فرط نشاطها.',
      howToUseAr: 'خذه في نفس المواعيد حسب الجرعة وعدّلها فقط حسب التحاليل والطبيب.',
      seekHelpAr: 'إذا ظهرت حرارة أو التهاب حلق شديد، تواصل مع الطبيب بسرعة لفحص الدم. راجع أيضًا عند اصفرار الجلد أو بول غامق.',
    ),
  ),
  Medication(
    id: 'beclomethasone-inhaled',
    familyId: 'respiratory',
    name: 'Beclomethasone Inhaled',
    subtitle: 'Inhaled corticosteroid',
    tags: ['Asthma', 'Controller', 'Inhaler', 'ICS'],
    hasVisualGuide: true,
    sourceLabel: 'MedlinePlus Drug Information · Beclomethasone Oral Inhalation',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Usually inhaled twice daily; exact priming/cleaning/spacer instructions depend on product. Rinse mouth and spit after use.',
      ),
      MedicationSection(
        title: 'Role',
        body:
            'Controller/preventer—not rescue therapy. Benefit requires regular use.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Asthma control, technique, adherence, candidiasis/dysphonia and pediatric growth when relevant.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'بخاخ وقائي يقلل التهاب الشعب الهوائية.',
      howToUseAr: 'استخدمه بانتظام بالطريقة الخاصة بجهازك، حتى عندما تكون بخير.',
      importantAr: 'ليس للإسعاف السريع. تمضمض بالماء وابصقه بعد الجرعة.',
      teachBackAr: 'أرني كيف تستخدم البخاخ من البداية للنهاية.',
    ),
  ),
  Medication(
    id: 'salmeterol-dpi',
    familyId: 'respiratory',
    name: 'Salmeterol DPI',
    subtitle: 'Long-acting beta-agonist',
    tags: ['Asthma adjunct', 'COPD', 'DPI', 'LABA'],
    hasVisualGuide: true,
    sourceLabel: 'MedlinePlus Drug Information · Salmeterol Oral Inhalation',
    sections: [
      MedicationSection(
        title: 'Critical asthma rule',
        body:
            'In asthma, LABA must not be used as monotherapy; it should be used with an inhaled corticosteroid.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Usually twice daily about 12 hours apart. DPI is inhaled through the specific device; no spacer and do not exhale into device.',
      ),
      MedicationSection(
        title: 'Role',
        body:
            'Not for sudden attacks. Avoid duplication with another LABA-containing product.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يفتح الشعب الهوائية لفترة طويلة للسيطرة على الأعراض.',
      howToUseAr: 'استخدمه في مواعيد ثابتة وبطريقة جهاز البودرة.',
      importantAr: 'ليس بخاخ إسعاف. إذا لديك ربو يجب أن يكون ضمن خطة تشمل كورتيزون مستنشق.',
    ),
  ),
  Medication(
    id: 'salbutamol-nebulizer',
    familyId: 'respiratory',
    name: 'Salbutamol Nebulizer',
    subtitle: 'Short-acting bronchodilator solution',
    tags: ['Asthma', 'COPD', 'Nebulizer', 'Reliever'],
    hasVisualGuide: true,
    sourceLabel: 'MedlinePlus Drug Information · Albuterol Oral Inhalation',
    sections: [
      MedicationSection(
        title: 'Preparation / technique',
        body:
            'Use exact prescribed unit dose/concentration in jet nebulizer. Do not mix other nebulized medicines unless compatibility is confirmed.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Symptom relief, heart rate/tremor and frequency of rescue use. Increasing need signals poor control.',
      ),
      MedicationSection(
        title: 'Device care',
        body:
            'Sit upright, breathe calmly/deeply until mist stops, and clean nebulizer according to manufacturer instructions.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يفتح الشعب الهوائية بسرعة عند ضيق النفس والصفير.',
      howToUseAr: 'ضع فقط الجرعة الموصوفة في حجرة النيبولايزر واجلس بشكل مستقيم أثناء الجلسة.',
      importantAr: 'إذا أصبحت تحتاجه أكثر من المعتاد أو لم يتحسن النفس، راجع الطبيب.',
      teachBackAr: 'أرني كيف تحضر الجهاز وكيف تنظفه بعد الجلسة.',
    ),
  ),
  Medication(
    id: 'cefixime',
    familyId: 'antiinfective',
    name: 'Cefixime',
    subtitle: 'Third-generation oral cephalosporin',
    tags: ['Antibiotic', 'Oral', 'Suspension'],
    sourceLabel: 'MedlinePlus Drug Information · Cefixime',
    sections: [
      MedicationSection(
        title: 'Administration / duration',
        body:
            'Once or twice daily depending on regimen; with or without food. Course duration depends on infection.',
      ),
      MedicationSection(
        title: 'Formulation',
        body:
            'Tablet, chewable, capsule and suspension are not always bioequivalent/interchangeable. Verify exact product strength.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Allergy, response, severe diarrhea and renal function for dose adjustment.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد حيوي لعلاج بعض الالتهابات البكتيرية.',
      howToUseAr: 'خذ الجرعة في المواعيد المكتوبة لك وأكمل مدة العلاج.',
      importantAr: 'إذا كان شرابًا أو حبة مضغ فتأكد من نفس التركيز والشكل الذي وصفه الطبيب.',
      seekHelpAr: 'اطلب المساعدة عند حساسية شديدة أو إسهال شديد ومستمر.',
    ),
  ),
  Medication(
    id: 'cefuroxime-axetil',
    familyId: 'antiinfective',
    name: 'Cefuroxime Axetil',
    subtitle: 'Second-generation oral cephalosporin',
    tags: ['Antibiotic', 'Oral', 'Food'],
    sourceLabel: 'MedlinePlus Drug Information · Cefuroxime',
    sections: [
      MedicationSection(
        title: 'Formulation distinction',
        body:
            'Tablets and suspension are not bioequivalent mg-for-mg in all circumstances and have different food instructions; verify exact product.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Tablet absorption is improved with food; suspension instructions should follow exact label.',
      ),
      MedicationSection(
        title: 'Duration / monitoring',
        body:
            'Fixed infection-specific course; monitor allergy, diarrhea and renal function when relevant.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد حيوي لعلاج بعض الالتهابات البكتيرية.',
      howToUseAr: 'إذا كانت حبوبًا خذها مع الطعام حسب التعليمات.',
      importantAr: 'لا تبدّل بين الشراب والحبوب بنفس عدد المليغرامات من نفسك.',
      missedDoseAr: 'خذ الجرعة عند التذكر إذا لم يقترب موعد التالية ولا تضاعفها.',
    ),
  ),
  Medication(
    id: 'clarithromycin',
    familyId: 'antiinfective',
    name: 'Clarithromycin',
    subtitle: 'Macrolide antibiotic',
    tags: ['Antibiotic', 'Interactions', 'QT'],
    sourceLabel: 'MedlinePlus Drug Information · Clarithromycin',
    sections: [
      MedicationSection(
        title: 'Formulation',
        body:
            'Regular tablet/liquid and extended-release tablet have different food and frequency instructions. ER is generally taken with food and must not be crushed.',
      ),
      MedicationSection(
        title: 'Interactions',
        body:
            'Strong CYP3A4 inhibitor with important statin, calcium-channel blocker, colchicine and other interactions; also QT risk.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Duration',
        body:
            'Usually 7–14 days for many infections, but indication-specific; H. pylori regimens are combination therapy.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد حيوي لعلاج بعض الالتهابات وقد يدخل ضمن علاج جرثومة المعدة.',
      howToUseAr: 'اتبع نوع المنتج بالضبط؛ الحبة الممتدة المفعول لها تعليمات مختلفة.',
      importantAr: 'أخبر الصيدلي عن جميع أدويتك لأن clarithromycin له تداخلات كثيرة.',
      seekHelpAr: 'راجع الطبيب عند خفقان/إغماء أو اصفرار الجلد أو طفح شديد.',
    ),
  ),
  Medication(
    id: 'levofloxacin-oral',
    familyId: 'antiinfective',
    name: 'Levofloxacin Oral',
    subtitle: 'Fluoroquinolone antibiotic',
    tags: ['Antibiotic', 'Mineral separation', 'Fluoroquinolone'],
    sourceLabel: 'MedlinePlus Drug Information · Levofloxacin',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Tablet generally with or without food; oral solution may have fasting instructions. Separate polyvalent cations according to label.',
      ),
      MedicationSection(
        title: 'High-value safety',
        body:
            'Serious tendon, neuropathy, CNS and other fluoroquinolone risks make indication selection important.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Renal function for dose adjustment, QT risk, glucose disturbances and new tendon/neurologic symptoms.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد حيوي لعلاج أنواع محددة من الالتهابات.',
      howToUseAr: 'خذ الجرعة في نفس الوقت يوميًا وافصل المعادن ومضادات الحموضة حسب تعليمات الصيدلي.',
      seekHelpAr: 'أوقفه وراجع الطبيب عند ألم مفاجئ بوتر أو تنميل/حرقان جديد أو أعراض عصبية شديدة.',
    ),
  ),
  Medication(
    id: 'oseltamivir',
    familyId: 'antiinfective',
    name: 'Oseltamivir',
    subtitle: 'Influenza antiviral',
    tags: ['Influenza', 'Antiviral', 'Short course'],
    sourceLabel: 'MedlinePlus Drug Information · Oseltamivir',
    sections: [
      MedicationSection(
        title: 'Timing / duration',
        body:
            'Most effective when started early. Treatment is typically a short course; prophylaxis duration differs and depends on exposure/outbreak context.',
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'With or without food; food can reduce nausea. Suspension should be shaken and measured accurately.',
      ),
      MedicationSection(
        title: 'Renal',
        body:
            'Dose adjustment is required in renal impairment.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد فيروسات للإنفلونزا ويعمل أفضل عند البدء مبكرًا.',
      howToUseAr: 'خذه حسب الجدول وأكمل المدة. يمكن أخذه مع الطعام إذا سبب غثيانًا.',
      importantAr: 'لا يعالج نزلات البرد العادية ولا يغني عن لقاح الإنفلونزا.',
    ),
  ),
  Medication(
    id: 'linezolid-oral',
    familyId: 'antiinfective',
    name: 'Linezolid Oral',
    subtitle: 'Oxazolidinone antibiotic',
    tags: ['Antibiotic', 'MAOI activity', 'CBC monitoring'],
    sourceLabel: 'MedlinePlus Drug Information · Linezolid',
    sections: [
      MedicationSection(
        title: 'Interactions',
        body:
            'Reversible MAO inhibition creates important serotonergic/adrenergic interactions. Review SSRIs/SNRIs, tramadol, decongestants and tyramine-heavy intake.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'CBC weekly is often used in prolonged therapy/high-risk patients; monitor neuropathy/visual symptoms and lactic acidosis with longer courses.',
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Tablet/suspension may be taken with or without food; duration depends on infection.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد حيوي قوي لعلاج بعض الالتهابات المقاومة.',
      howToUseAr: 'خذ الجرعة في مواعيدها وأكمل المدة الموصوفة.',
      importantAr: 'أخبر الصيدلي عن أدوية الاكتئاب والبرد والمسكنات قبل استخدامه لأن التداخلات مهمة.',
      seekHelpAr: 'راجع الطبيب عند كدمات/نزف غير معتاد أو تنميل مستمر أو تغير بالرؤية.',
    ),
  ),
  Medication(
    id: 'fluoxetine',
    familyId: 'cns',
    name: 'Fluoxetine',
    subtitle: 'SSRI antidepressant',
    tags: ['Depression', 'OCD', 'Anxiety', 'Long half-life'],
    sourceLabel: 'MedlinePlus Drug Information · Fluoxetine',
    sections: [
      MedicationSection(
        title: 'Duration / expectations',
        body:
            'Benefit develops over weeks; continuation for months after response is common and recurrent illness may require long-term therapy.',
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Often once daily, commonly morning if activating; weekly formulations exist and are not interchangeable.',
      ),
      MedicationSection(
        title: 'Interactions',
        body:
            'Long half-life and CYP2D6 inhibition make MAOI switching and interacting-drug washout especially important.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم للاكتئاب أو الوسواس أو بعض اضطرابات القلق.',
      howToUseAr: 'خذه في وقت ثابت يوميًا؛ إذا سبب أرقًا فقد يناسبك الصباح حسب الخطة.',
      commonActionableAr: 'قد يحتاج عدة أسابيع حتى يظهر التحسن الكامل.',
      seekHelpAr: 'اطلب المساعدة إذا ظهرت أفكار بإيذاء النفس أو تغير شديد ومفاجئ بالسلوك.',
    ),
  ),
  Medication(
    id: 'venlafaxine-xr',
    familyId: 'cns',
    name: 'Venlafaxine XR',
    subtitle: 'SNRI antidepressant',
    tags: ['Depression', 'Anxiety', 'Extended release', 'Withdrawal'],
    sourceLabel: 'MedlinePlus Drug Information · Venlafaxine',
    sections: [
      MedicationSection(
        title: 'Formulation / administration',
        body:
            'XR usually once daily with food at a consistent time. Capsule opening/sprinkle is product-specific; do not crush pellets.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Mood/suicidality, blood pressure, withdrawal symptoms and sodium in susceptible patients.',
      ),
      MedicationSection(
        title: 'Stopping',
        body:
            'Venlafaxine can cause prominent discontinuation symptoms; taper gradually rather than abrupt stopping.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم للاكتئاب أو القلق.',
      howToUseAr: 'خذ XR مرة يوميًا مع الطعام وفي نفس الوقت تقريبًا.',
      importantAr: 'لا توقفه فجأة لأن أعراض الانسحاب قد تكون واضحة.',
      commonActionableAr: 'قد يسبب غثيانًا أو تعرقًا أو ارتفاع ضغط عند بعض الأشخاص.',
    ),
  ),
  Medication(
    id: 'amitriptyline',
    familyId: 'cns',
    name: 'Amitriptyline',
    subtitle: 'Tricyclic antidepressant / pain-modulator',
    tags: ['Neuropathic pain', 'Migraine', 'Depression', 'Sedating'],
    sourceLabel: 'MedlinePlus Drug Information · Amitriptyline',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Often given at night because of sedation, especially when used for pain/migraine; antidepressant schedules may differ.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Sedation, anticholinergic effects, orthostatic hypotension, falls and cardiac/QT risk.',
      ),
      MedicationSection(
        title: 'High-value safety',
        body:
            'Toxic in overdose; use extra caution in suicide risk, older adults and cardiac disease.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم للاكتئاب أو بعض آلام الأعصاب أو منع الصداع حسب الجرعة.',
      howToUseAr: 'غالبًا يؤخذ مساءً إذا كان يسبب نعاسًا، حسب وصفتك.',
      commonActionableAr: 'قد يسبب جفاف الفم والإمساك والنعاس.',
      importantAr: 'لا تقد السيارة حتى تعرف تأثيره عليك.',
    ),
  ),
  Medication(
    id: 'quetiapine',
    familyId: 'cns',
    name: 'Quetiapine',
    subtitle: 'Atypical antipsychotic',
    tags: ['Psychosis', 'Bipolar', 'Sedating', 'Metabolic'],
    sourceLabel: 'MedlinePlus Drug Information · Quetiapine',
    sections: [
      MedicationSection(
        title: 'Formulation distinction',
        body:
            'IR and XR have different frequency and food instructions; XR must be swallowed whole.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Weight/BMI, glucose/A1c, lipids, BP/orthostasis, sedation and movement symptoms.',
      ),
      MedicationSection(
        title: 'Safety',
        body:
            'Elderly patients with dementia-related psychosis have increased mortality risk; not approved for this use.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لبعض اضطرابات المزاج أو الذهان حسب التشخيص.',
      howToUseAr: 'خذ نفس النوع الموصوف لك؛ XR ليس نفس الحبة العادية.',
      commonActionableAr: 'قد يسبب نعاسًا ودوخة وزيادة وزن.',
      importantAr: 'لا توقفه فجأة من نفسك.',
    ),
  ),
  Medication(
    id: 'olanzapine',
    familyId: 'cns',
    name: 'Olanzapine',
    subtitle: 'Atypical antipsychotic',
    tags: ['Psychosis', 'Bipolar', 'Metabolic risk'],
    sourceLabel: 'MedlinePlus Drug Information · Olanzapine',
    sections: [
      MedicationSection(
        title: 'Monitoring',
        body:
            'Weight/BMI, glucose/A1c, lipids, sedation, orthostasis and movement symptoms.',
      ),
      MedicationSection(
        title: 'Formulation',
        body:
            'Tablet, ODT and long-acting injection are different products; ODT handling differs and LAI has specific post-injection monitoring requirements.',
      ),
      MedicationSection(
        title: 'Clinical pearl',
        body:
            'Metabolic adverse effects can be substantial; proactive monitoring and lifestyle counseling should begin early.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لبعض حالات الذهان واضطراب ثنائي القطب.',
      howToUseAr: 'خذه في نفس الوقت يوميًا حسب الوصفة.',
      commonActionableAr: 'قد يزيد الشهية والوزن ويسبب نعاسًا.',
      importantAr: 'التزم بمتابعة الوزن والسكر والدهون إذا طلب الطبيب ذلك.',
    ),
  ),
  Medication(
    id: 'risperidone',
    familyId: 'cns',
    name: 'Risperidone',
    subtitle: 'Atypical antipsychotic',
    tags: ['Psychosis', 'Bipolar', 'Prolactin', 'Movement'],
    sourceLabel: 'MedlinePlus Drug Information · Risperidone',
    sections: [
      MedicationSection(
        title: 'Formulation',
        body:
            'Tablet, ODT, oral solution and long-acting injections have different dosing/administration.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Weight/metabolic parameters, prolactin effects, movement symptoms, sedation and orthostasis.',
      ),
      MedicationSection(
        title: 'Interactions',
        body:
            'CNS depressants and CYP2D6 modifiers can alter adverse effects/exposure.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لبعض حالات الذهان واضطراب المزاج.',
      howToUseAr: 'استخدم نفس الشكل الدوائي الذي وصفه الطبيب وفي نفس الوقت يوميًا.',
      commonActionableAr: 'قد يسبب نعاسًا أو زيادة وزن أو ارتفاع هرمون الحليب.',
      seekHelpAr: 'راجع الطبيب إذا ظهرت حركات لا إرادية جديدة أو تيبس شديد مع حرارة.',
    ),
  ),
  Medication(
    id: 'clonazepam',
    familyId: 'cns',
    name: 'Clonazepam',
    subtitle: 'Benzodiazepine',
    tags: ['Anxiety', 'Seizure', 'Sedating', 'Dependence'],
    sourceLabel: 'MedlinePlus Drug Information · Clonazepam',
    sections: [
      MedicationSection(
        title: 'Duration / dependence',
        body:
            'Use duration depends on indication; long-term therapy can produce dependence/tolerance and should be regularly reviewed.',
      ),
      MedicationSection(
        title: 'Safety',
        body:
            'Combining with opioids, alcohol or other sedatives can cause severe respiratory depression.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Stopping',
        body:
            'Do not stop abruptly after regular use; tapering is required to reduce withdrawal/seizure risk.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم للقلق أو نوبات الصرع في حالات محددة.',
      howToUseAr: 'خذه فقط بالجرعة الموصوفة.',
      importantAr: 'لا تجمعه مع الكحول أو المهدئات/المسكنات القوية دون مراجعة، ولا توقفه فجأة.',
      commonActionableAr: 'قد يسبب نعاسًا وبطء التركيز؛ تجنب القيادة حتى تعرف تأثيره.',
    ),
  ),
  Medication(
    id: 'tramadol',
    familyId: 'pain-inflammation',
    name: 'Tramadol',
    subtitle: 'Opioid analgesic with serotonergic activity',
    tags: ['Pain', 'Opioid', 'Serotonin', 'Seizure risk'],
    sourceLabel: 'MedlinePlus Drug Information · Tramadol',
    sections: [
      MedicationSection(
        title: 'High-value safety',
        body:
            'Opioid respiratory-depression/dependence risk plus serotonin-syndrome and seizure risk. Review antidepressants and other sedatives carefully.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Formulation',
        body:
            'IR and ER products differ; ER tablets/capsules must not be crushed/chewed.',
      ),
      MedicationSection(
        title: 'Duration',
        body:
            'Use shortest appropriate duration for acute pain; chronic use requires explicit ongoing benefit-risk review.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مسكن للألم يُستخدم عندما تكون الخيارات الأبسط غير كافية في بعض الحالات.',
      howToUseAr: 'استخدم أقل جرعة فعالة حسب الوصفة ولا تكررها أكثر من المسموح.',
      importantAr: 'لا تجمعه مع الكحول أو المهدئات، وأخبر الصيدلي عن أدوية الاكتئاب.',
      seekHelpAr: 'اطلب المساعدة عند بطء أو صعوبة التنفس، نعاس شديد جدًا، تشنج، أو هياج مع حرارة ورجفة.',
    ),
  ),
  Medication(
    id: 'meloxicam',
    familyId: 'pain-inflammation',
    name: 'Meloxicam',
    subtitle: 'NSAID',
    tags: ['Pain', 'Arthritis', 'NSAID'],
    sourceLabel: 'MedlinePlus Drug Information · Meloxicam',
    sections: [
      MedicationSection(
        title: 'Administration / duration',
        body:
            'Usually once daily; lowest effective dose for shortest appropriate duration.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'GI bleeding, BP, renal function, edema and cardiovascular symptoms.',
      ),
      MedicationSection(
        title: 'Interactions',
        body:
            'Other NSAIDs, anticoagulants/antiplatelets and ACEI/ARB/diuretic combinations increase risk.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يخفف الألم والالتهاب خاصة في أمراض المفاصل.',
      howToUseAr: 'خذه مرة يوميًا حسب الوصفة ولا تجمعه مع ibuprofen أو naproxen من نفسك.',
      seekHelpAr: 'اطلب المساعدة عند براز أسود أو قيء دموي أو ألم صدر أو قلة بول واضحة.',
    ),
  ),
  Medication(
    id: 'edoxaban',
    familyId: 'anticoagulation',
    name: 'Edoxaban',
    subtitle: 'Factor Xa inhibitor',
    tags: ['Anticoagulant', 'Oral', 'Bleeding'],
    sourceLabel: 'MedlinePlus / FDA Edoxaban labeling',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Usually once daily with or without food. Dose depends on indication, renal function, weight and selected P-gp interactions.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Renal function, bleeding, adherence and peri-procedure plan.',
      ),
      MedicationSection(
        title: 'Clinical pearl',
        body:
            'For atrial fibrillation, very high renal clearance can reduce effectiveness; exact labeling includes a renal-function restriction unique to edoxaban.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مميع دم لتقليل خطر الجلطات في حالات محددة.',
      howToUseAr: 'خذه مرة يوميًا في نفس الوقت تقريبًا، مع الطعام أو بدونه.',
      importantAr: 'لا توقفه من نفسك وأخبر الطبيب قبل أي عملية أو إجراء.',
      seekHelpAr: 'اطلب المساعدة عند نزف شديد أو بعد ضربة قوية على الرأس.',
    ),
  ),
  Medication(
    id: 'tacrolimus-topical',
    familyId: 'allergy-dermatology',
    name: 'Tacrolimus Ointment',
    subtitle: 'Topical calcineurin inhibitor',
    tags: ['Eczema', 'Topical', 'Steroid-sparing'],
    sourceLabel: 'MedlinePlus Drug Information · Tacrolimus Topical',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Apply a thin layer to affected skin only. Avoid occlusive dressings unless directed and wash hands after application unless hands are treated.',
      ),
      MedicationSection(
        title: 'Counseling',
        body:
            'Transient burning/stinging is common early. Minimize unnecessary UV exposure and use sun protection.',
      ),
      MedicationSection(
        title: 'Duration',
        body:
            'Use intermittently/short term or as clinician-directed for chronic eczema control; avoid continuous indiscriminate use on normal skin.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يخفف التهاب الإكزيما من دون كورتيزون موضعي.',
      howToUseAr: 'ضع طبقة رقيقة على المناطق المصابة فقط.',
      commonActionableAr: 'قد تشعر بحرقة أو لسع في الأيام الأولى ثم تخف غالبًا.',
      importantAr: 'تجنب الشمس الزائدة واستخدم حماية مناسبة.',
    ),
  ),
  Medication(
    id: 'clobetasol-topical',
    familyId: 'allergy-dermatology',
    name: 'Clobetasol Topical',
    subtitle: 'Super-potent topical corticosteroid',
    tags: ['Dermatology', 'High potency', 'Short course'],
    sourceLabel: 'MedlinePlus Drug Information · Clobetasol Topical',
    sections: [
      MedicationSection(
        title: 'Potency / duration',
        body:
            'Super-potent steroid for short courses on appropriate body sites. Quantity, body-surface area and duration matter.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Thin layer only; avoid face/groin/axilla unless specifically directed. Do not occlude without instructions.',
      ),
      MedicationSection(
        title: 'Monitoring',
        body:
            'Skin atrophy, striae, infection, tachyphylaxis/misuse and systemic absorption with large areas.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'كورتيزون موضعي قوي لعلاج التهاب جلدي شديد في مناطق محددة.',
      howToUseAr: 'ضع طبقة رقيقة فقط وللمدة المكتوبة.',
      importantAr: 'لا تستخدمه على الوجه أو الثنيات أو لفترة طويلة إلا إذا طلب الطبيب ذلك.',
      seekHelpAr: 'راجع الطبيب إذا ساء الطفح أو ظهرت علامات عدوى.',
    ),
  ),
  Medication(
    id: 'adapalene',
    familyId: 'allergy-dermatology',
    name: 'Adapalene',
    subtitle: 'Topical retinoid for acne',
    tags: ['Acne', 'Topical', 'Retinoid'],
    sourceLabel: 'MedlinePlus Drug Information · Adapalene',
    sections: [
      MedicationSection(
        title: 'Administration',
        body:
            'Apply a thin layer to the entire acne-prone area, typically once daily at night, not only individual spots.',
      ),
      MedicationSection(
        title: 'Expectations',
        body:
            'Dryness/irritation and temporary early worsening can occur; meaningful benefit takes weeks.',
      ),
      MedicationSection(
        title: 'Skin care',
        body:
            'Use gentle cleanser/moisturizer and sun protection. Avoid stacking irritating exfoliants unless planned.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يعالج حب الشباب ويساعد على منع انسداد المسام.',
      howToUseAr: 'ضع طبقة رقيقة مساءً على كامل المنطقة المعرضة للحبوب، وليس على الحبة فقط.',
      commonActionableAr: 'قد يحدث جفاف أو تهيج في البداية؛ استخدم مرطبًا لطيفًا.',
      importantAr: 'استخدم واقي شمس وتجنب المقشرات القوية الزائدة.',
    ),
  ),
  Medication(
    id: 'mupirocin-topical',
    familyId: 'allergy-dermatology',
    name: 'Mupirocin Topical',
    subtitle: 'Topical antibiotic',
    tags: ['Skin infection', 'Topical antibiotic'],
    sourceLabel: 'MedlinePlus Drug Information · Mupirocin Topical',
    sections: [
      MedicationSection(
        title: 'Administration / duration',
        body:
            'Apply small amount to infected skin at prescribed frequency for a short course; do not use indefinitely for nonspecific rashes.',
      ),
      MedicationSection(
        title: 'Formulation',
        body:
            'Topical skin product and intranasal formulations are not interchangeable.',
      ),
      MedicationSection(
        title: 'Referral',
        body:
            'Worsening spreading infection, fever or no improvement should trigger reassessment.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد حيوي موضعي لعلاج بعض التهابات الجلد البكتيرية.',
      howToUseAr: 'ضع كمية صغيرة على المنطقة المصابة حسب المدة المكتوبة.',
      importantAr: 'لا تستخدم نوع الجلد داخل الأنف إلا إذا كان المنتج مخصصًا لذلك.',
      seekHelpAr: 'راجع الطبيب إذا انتشر الاحمرار أو ظهرت حرارة أو لم يتحسن الجلد.',
    ),
  ),
  Medication(
    id: 'etanercept',
    familyId: 'rheumatology-immunology',
    name: 'Etanercept',
    subtitle: 'TNF inhibitor biologic',
    tags: ['Biologic', 'Injection', 'Rheumatology'],
    hasVisualGuide: true,
    sourceLabel: 'MedlinePlus Drug Information · Etanercept Injection',
    sections: [
      MedicationSection(
        title: 'Before therapy',
        body:
            'Screen for TB/serious infection risk, hepatitis B context and vaccine status before treatment.',
      ),
      MedicationSection(
        title: 'Injection / storage',
        body:
            'Subcutaneous device-specific injection; refrigerate, protect from light, do not freeze and follow exact room-temperature allowance.',
      ),
      MedicationSection(
        title: 'Duration',
        body:
            'Long-term biologic if effective; do not use during serious active infection without specialist review.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'دواء بيولوجي يقلل الالتهاب في أمراض مثل الروماتويد والصدفية.',
      howToUseAr: 'استخدم الحقنة حسب جدولك وبدّل موضع الحقن.',
      importantAr: 'أخبر الطبيب عند عدوى أو حرارة، واسأل قبل اللقاحات.',
      storageAr: 'يحفظ بالثلاجة ولا يُجمّد، واتبع تعليمات المنتج إذا بقي خارجها.',
    ),
  ),
  Medication(
    id: 'clotrimazole-vaginal',
    familyId: 'womens-health',
    name: 'Clotrimazole Vaginal',
    subtitle: 'Vaginal azole antifungal',
    tags: ['Vaginal candidiasis', 'OTC', 'Topical'],
    sourceLabel: 'MedlinePlus Drug Information · Clotrimazole Vaginal',
    sections: [
      MedicationSection(
        title: 'Administration / duration',
        body:
            'Cream/tablet regimens vary from single- to multi-day courses. Use at bedtime when product recommends and complete course.',
      ),
      MedicationSection(
        title: 'Referral',
        body:
            'First episode, recurrent infections, pregnancy, fever/pelvic pain or foul-smelling discharge may require assessment rather than repeated OTC treatment.',
      ),
      MedicationSection(
        title: 'Product counseling',
        body:
            'Some vaginal azole formulations can weaken latex condoms/diaphragms temporarily; check product labeling.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يعالج بعض حالات فطريات المهبل.',
      howToUseAr: 'استخدمي الكريم أو التحميلة بالطريقة والمدة الخاصة بمنتجك وغالبًا مساءً.',
      importantAr: 'إذا كانت هذه أول مرة أو تتكرر الحالة كثيرًا، أو لديك حرارة/ألم بالحوض، راجعي الطبيب.',
    ),
  ),
  Medication(
    id: 'artificial-tears',
    familyId: 'eye-ear',
    name: 'Artificial Tears',
    subtitle: 'Lubricating eye drops',
    tags: ['Dry eye', 'Eye drops', 'OTC'],
    sourceLabel: 'Product labeling / dry-eye guidance',
    sections: [
      MedicationSection(
        title: 'Product selection',
        body:
            'Preserved multidose drops are convenient; preservative-free single-use products may be preferable with very frequent dosing or sensitive ocular surface.',
      ),
      MedicationSection(
        title: 'Technique',
        body:
            'Avoid touching dropper tip. Separate from medicated eye drops by an appropriate interval.',
      ),
      MedicationSection(
        title: 'Referral',
        body:
            'Eye pain, marked redness, photophobia or visual loss is not routine dry eye and needs assessment.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'ترطب العين وتخفف الجفاف والحرقة.',
      howToUseAr: 'ضع القطرة من دون لمس فوهة العبوة للعين.',
      importantAr: 'إذا تستخدم قطرات علاجية أخرى اترك فاصلًا بينها.',
      seekHelpAr: 'راجع الطبيب عند ألم شديد أو نقص رؤية أو احمرار شديد مستمر.',
    ),
  ),
  Medication(
    id: 'moxifloxacin-ophthalmic',
    familyId: 'eye-ear',
    name: 'Moxifloxacin Eye Drops',
    subtitle: 'Ophthalmic fluoroquinolone antibiotic',
    tags: ['Eye infection', 'Antibiotic', 'Eye drops'],
    hasVisualGuide: true,
    sourceLabel: 'MedlinePlus / product labeling · Moxifloxacin Ophthalmic',
    sections: [
      MedicationSection(
        title: 'Technique / duration',
        body:
            'Instill prescribed drops without touching tip and complete course. Separate other eye drops.',
      ),
      MedicationSection(
        title: 'Contact lenses',
        body:
            'Do not wear contact lenses during active bacterial conjunctivitis.',
      ),
      MedicationSection(
        title: 'Referral',
        body:
            'Worsening pain, photophobia, visual decline or lack of expected improvement requires ophthalmic evaluation.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد حيوي لبعض التهابات العين البكتيرية.',
      howToUseAr: 'ضع القطرات حسب الجدول ولا تلمس الفوهة للعين أو الرموش.',
      importantAr: 'لا تستخدم العدسات اللاصقة أثناء الالتهاب.',
      seekHelpAr: 'راجع الطبيب إذا زاد الألم أو نقص النظر أو لم تتحسن العين.',
    ),
  ),
  Medication(
    id: 'amoxicillin-pediatric-suspension',
    familyId: 'pediatrics',
    name: 'Amoxicillin Pediatric Suspension',
    subtitle: 'Pediatric penicillin liquid',
    tags: ['Pediatric', 'Antibiotic', 'Suspension', 'Caregiver'],
    sourceLabel: 'MedlinePlus / product labeling · Amoxicillin',
    sections: [
      MedicationSection(
        title: 'Pediatric preparation',
        body:
            'Verify mg/5 mL concentration and prescribed mg dose before converting to mL. Shake well before every dose.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Storage / duration',
        body:
            'Reconstituted storage and beyond-use time depend on manufacturer/product; label the exact discard date.',
      ),
      MedicationSection(
        title: 'Administration',
        body:
            'Use oral syringe for accuracy; may be taken with or without food.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد حيوي لعلاج بعض الالتهابات البكتيرية عند الطفل.',
      howToUseAr: 'رج العبوة جيدًا كل مرة وقس الجرعة بالسرنجة الفموية حسب تركيز هذه العبوة.',
      importantAr: 'لا تستخدم نفس عدد mL من عبوة أخرى قبل التأكد من التركيز.',
      storageAr: 'اتبع تعليمات الحفظ وتاريخ التخلص المكتوب من الصيدلية.',
      teachBackAr: 'أرني تركيز الشراب والحجم الذي ستسحبه بالسرنجة.',
    ),
  ),
  Medication(
    id: 'bismuth-subsalicylate',
    familyId: 'otc',
    name: 'Bismuth Subsalicylate',
    subtitle: 'Antidiarrheal / dyspepsia OTC medicine',
    tags: ['Diarrhea', 'Upset stomach', 'Salicylate', 'OTC'],
    sourceLabel: 'MedlinePlus Drug Information · Bismuth Subsalicylate',
    sections: [
      MedicationSection(
        title: 'Self-care limits',
        body:
            'Short-term use for diarrhea/dyspepsia. Bloody stool, high fever, severe dehydration or prolonged diarrhea requires evaluation.',
      ),
      MedicationSection(
        title: 'Salicylate safety',
        body:
            'Review aspirin/salicylate allergy, anticoagulants and age. Avoid in children/teens recovering from viral illness because of Reye-syndrome risk.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Expected effect',
        body:
            'Can darken tongue and stool harmlessly; distinguish this from tarry GI bleeding by clinical context.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يخفف الإسهال واضطراب المعدة في بعض الحالات.',
      howToUseAr: 'استخدمه لفترة قصيرة فقط حسب العبوة.',
      commonActionableAr: 'قد يصبح اللسان أو البراز داكنًا وهذا قد يكون تأثيرًا طبيعيًا للدواء.',
      importantAr: 'لا يستخدم للأطفال أو المراهقين مع مرض فيروسي، وأخبر الصيدلي إذا تستخدم aspirin أو مميعات الدم.',
    ),
  ),
];
