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
];
