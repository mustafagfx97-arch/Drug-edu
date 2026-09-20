import '../../../core/models/medication.dart';
import '../domain/supplement_profile.dart';

const supplementProfiles = <SupplementProfile>[
  SupplementProfile(
    id: 'vitamin-d3',
    group: 'Vitamins',
    name: 'Vitamin D3',
    subtitle: 'Cholecalciferol',
    formulation: 'Tablets, capsules, oral drops and liquid products',
    howToTakeEn:
        'Take with a meal or snack that contains some fat. Dietary fat improves vitamin D absorption, although some absorption still occurs without fat.',
    formulationAlert:
        'Strengths vary widely. Verify whether the label uses IU or mcg and confirm drops-per-dose before counseling.',
    sourceLabel: 'NIH ODS Vitamin D Fact Sheets',
    pharmacistSections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Separate routine supplementation from treatment of deficiency. Verify the exact product strength and unit before calculating or counseling. Vitamin D is fat soluble, and concurrent dietary fat enhances absorption.',
      ),
      MedicationSection(
        title: 'Practical administration',
        body:
            'A meal or snack containing some fat is preferred. Milk is not required. If the patient chooses milk, the important point is the overall meal/snack context rather than milk itself.',
      ),
      MedicationSection(
        title: 'Common mistake',
        body:
            'Assuming all drop products contain the same amount per drop. Pediatric and concentrated products can differ substantially.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد على الوقاية من نقص فيتامين د أو علاجه حسب الجرعة الموصوفة.',
      howToUseAr:
          'خذ الجرعة مع وجبة أو سناك يحتوي قليلًا من الدهون ليساعد الجسم على امتصاصه بشكل أفضل.',
      timingAr:
          'يمكن أخذه في الوقت الذي يناسبك، والأفضل ربطه بوجبة ثابتة حتى لا تنسى الجرعة.',
      importantAr:
          'الحليب ليس شرطًا. الأهم أن تؤخذ الجرعة مع وجبة أو سناك مناسب، وتأكد من تركيز المنتج قبل الاستعمال.',
      seekHelpAr:
          'لا تستخدم جرعات عالية لفترة طويلة من نفسك، خصوصًا إذا كنت تستخدم منتجات أخرى تحتوي على فيتامين د.',
      teachBackAr: 'أرني تركيز المنتج وقل لي كم قطرة أو حبة ستأخذ في كل مرة.',
    ),
  ),
  SupplementProfile(
    id: 'oral-iron-salts',
    group: 'Minerals',
    name: 'Oral Iron Salts',
    subtitle: 'Ferrous sulfate / ferrous fumarate / ferrous gluconate',
    formulation: 'Tablets, capsules, liquids and drops',
    howToTakeEn:
        'Iron is best absorbed on an empty stomach. If it causes stomach upset, it may be taken with a small amount of food. Keep milk, calcium and antacids away from the iron dose.',
    formulationAlert:
        'Counsel by elemental iron, not total salt weight. Modified-release and specialty iron products may have different instructions.',
    sourceLabel: 'NIH ODS Iron Fact Sheet + MedlinePlus iron guidance',
    pharmacistSections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Confirm elemental iron per dose, indication, formulation, expected duration and interacting medicines. Standard oral iron salts are best absorbed on an empty stomach, but tolerability may require administration with a small amount of food.',
      ),
      MedicationSection(
        title: 'Food & separation',
        body:
            'Milk, calcium and antacids should not be taken at the same time; MedlinePlus advises at least a 2-hour separation. Vitamin C can improve nonheme iron absorption.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'Common mistake',
        body:
            'Confusing milligrams of the iron salt with milligrams of elemental iron, or combining multiple iron-containing products.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لعلاج أو الوقاية من نقص الحديد حسب حالتك.',
      howToUseAr:
          'الأفضل أخذه على معدة فارغة. إذا أزعج معدتك، خذه مع كمية صغيرة من الطعام.',
      timingAr:
          'لا تأخذه في نفس الوقت مع الحليب أو الكالسيوم أو مضادات الحموضة؛ اترك بينها وبين الحديد ساعتين على الأقل.',
      commonActionableAr:
          'قد يسبب إمساكًا أو انزعاجًا في المعدة. لا توقفه مباشرة من نفسك إذا حدث ذلك، بل اسأل الصيدلي عن طريقة تخفيف المشكلة.',
      importantAr:
          'لا تضف مكمل حديد آخر من نفسك. بعض المنتجات تختلف كثيرًا في كمية الحديد الفعلية.',
      missedDoseAr:
          'خذ الجرعة عندما تتذكر إذا لم يقترب موعد التالية. لا تضاعف الجرعة.',
    ),
  ),
  SupplementProfile(
    id: 'calcium-carbonate',
    group: 'Minerals',
    name: 'Calcium Carbonate',
    subtitle: 'Calcium supplement',
    formulation: 'Tablets, chewables and combination products',
    howToTakeEn:
        'Take with food. Calcium carbonate is absorbed better when taken with a meal.',
    formulationAlert:
        'Do not apply this instruction to calcium citrate. Check elemental calcium on the label.',
    sourceLabel: 'NIH ODS Calcium Fact Sheets',
    pharmacistSections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Calcium carbonate is acid-dependent and should be taken with food. Verify elemental calcium rather than total calcium carbonate weight.',
      ),
      MedicationSection(
        title: 'Dose splitting',
        body:
            'Calcium absorption is best at doses of 500 mg elemental calcium or less at one time. Larger daily amounts are generally better divided.',
      ),
      MedicationSection(
        title: 'Formulation distinction',
        body:
            'Do not merge carbonate and citrate counseling. Calcium citrate can be taken with or without food.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لتعويض أو دعم احتياج الجسم من الكالسيوم حسب حالتك.',
      howToUseAr: 'خذ كالسيوم كاربونات مع وجبة.',
      timingAr:
          'إذا كانت جرعتك اليومية كبيرة، قد تحتاج تقسيمها بدل أخذها كلها مرة واحدة حسب تعليمات الطبيب أو الصيدلي.',
      importantAr:
          'تأكد أن المنتج هو Calcium Carbonate؛ نوع Calcium Citrate له تعليمات مختلفة.',
    ),
  ),
  SupplementProfile(
    id: 'calcium-citrate',
    group: 'Minerals',
    name: 'Calcium Citrate',
    subtitle: 'Calcium supplement',
    formulation: 'Tablets, capsules and combination products',
    howToTakeEn:
        'May be taken with or without food. It is less dependent on stomach acid than calcium carbonate.',
    formulationAlert:
        'Verify elemental calcium per tablet/capsule. Product strength varies.',
    sourceLabel: 'NIH ODS Calcium Fact Sheets',
    pharmacistSections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Calcium citrate can be taken with or without food and is less dependent on gastric acid for absorption than calcium carbonate.',
      ),
      MedicationSection(
        title: 'Dose splitting',
        body:
            'As with other calcium supplements, absorption is best when individual elemental-calcium doses are about 500 mg or less.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لتعويض أو دعم احتياج الجسم من الكالسيوم حسب حالتك.',
      howToUseAr: 'يمكن أخذ Calcium Citrate مع الطعام أو بدونه.',
      importantAr:
          'لا تعتمد على عدد الحبات فقط؛ تأكد من كمية الكالسيوم الفعلية المكتوبة على المنتج.',
    ),
  ),
  SupplementProfile(
    id: 'magnesium-gluconate',
    group: 'Minerals',
    name: 'Magnesium Gluconate',
    subtitle: 'Magnesium supplement',
    formulation: 'Tablets and oral liquid',
    howToTakeEn:
        'Take with meals to reduce stomach upset. This instruction is specific to magnesium gluconate; other magnesium salts can have different directions.',
    formulationAlert:
        'Magnesium salts are not interchangeable by total milligram strength. Verify elemental magnesium and the exact salt.',
    sourceLabel: 'MedlinePlus Magnesium Gluconate + NIH ODS Magnesium',
    pharmacistSections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'For magnesium gluconate, MedlinePlus recommends administration with meals to reduce adverse effects. High supplemental magnesium commonly causes diarrhea, nausea or abdominal cramping.',
      ),
      MedicationSection(
        title: 'Formulation distinction',
        body:
            'Magnesium oxide, citrate, gluconate and other salts differ in elemental magnesium, tolerability and sometimes use. Keep instructions salt-specific.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Interaction check',
        body:
            'Magnesium can interfere with absorption of some medicines, including certain antibiotics and bisphosphonates. The exact separation interval should follow the interacting drug/product guidance.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لتعويض نقص المغنيسيوم أو حسب الغرض الذي وصفه الطبيب.',
      howToUseAr: 'إذا كان المنتج Magnesium Gluconate فخذه مع الوجبات.',
      commonActionableAr:
          'قد يسبب إسهالًا أو مغصًا، خصوصًا مع الجرعات الأعلى.',
      importantAr:
          'لا تطبق نفس التعليمات على كل أنواع المغنيسيوم؛ تحقق من نوع الملح المكتوب على العبوة.',
    ),
  ),
  SupplementProfile(
    id: 'zinc',
    group: 'Minerals',
    name: 'Zinc',
    subtitle: 'Elemental zinc supplement',
    formulation: 'Zinc sulfate, acetate, gluconate and other products',
    howToTakeEn:
        'Follow the exact product directions. If the patient uses a quinolone or tetracycline antibiotic, separate the antibiotic from zinc: at least 2 hours before or 4–6 hours after zinc.',
    formulationAlert:
        'The Supplement Facts panel reports elemental zinc, not the weight of the zinc salt.',
    sourceLabel: 'NIH ODS Zinc Fact Sheets',
    pharmacistSections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Counsel using elemental zinc. Zinc sulfate, acetate, gluconate and other salts are labeled by elemental zinc on the Supplement Facts panel.',
      ),
      MedicationSection(
        title: 'Important interaction',
        body:
            'Quinolone and tetracycline antibiotics interact with zinc. NIH ODS advises taking the antibiotic at least 2 hours before, or 4–6 hours after, zinc.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Mineral interaction',
        body:
            'Taking 25 mg elemental iron or more at the same time can reduce zinc absorption.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لتعويض نقص الزنك أو حسب الحاجة الموصوفة لك.',
      howToUseAr: 'خذ الجرعة حسب المنتج، وانتبه إلى كمية الزنك الفعلية المكتوبة على الملصق.',
      importantAr:
          'إذا كنت تستخدم بعض المضادات الحيوية فقد تحتاج فصلها عن الزنك؛ أخبر الصيدلي عن أدويتك.',
      seekHelpAr:
          'لا تستخدم جرعات عالية لفترة طويلة من نفسك لأن الإفراط في الزنك قد يسبب مشاكل ونقص معادن أخرى.',
    ),
  ),
  SupplementProfile(
    id: 'vitamin-b12',
    group: 'Vitamins',
    name: 'Vitamin B12',
    subtitle: 'Cyanocobalamin / methylcobalamin',
    formulation: 'Tablets, lozenges, sublingual products and prescription forms',
    howToTakeEn:
        'Standard oral supplements do not require a special fatty meal. Follow the exact product directions, especially for lozenges, sublingual products or prescription formulations.',
    formulationAlert:
        'Route matters. Oral, sublingual, nasal and injectable B12 are not administered the same way.',
    sourceLabel: 'NIH ODS Vitamin B12 Fact Sheets',
    pharmacistSections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Identify why B12 is being used and whether malabsorption, pernicious anemia, gastric surgery, metformin or acid-suppressive therapy is relevant. Route selection may matter more than timing with food.',
      ),
      MedicationSection(
        title: 'Formulation distinction',
        body:
            'Oral and sublingual products are not the same as prescription nasal or injectable products. Follow formulation-specific directions.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم للوقاية من نقص فيتامين ب12 أو علاجه حسب السبب.',
      howToUseAr:
          'اتبع طريقة المنتج المكتوبة لك؛ الحبوب العادية لا تحتاج وجبة دهنية خاصة.',
      importantAr:
          'إذا كان لديك فقر دم خبيث أو مشكلة امتصاص أو عملية في المعدة، فقد تختلف طريقة العلاج عن المكملات العادية.',
    ),
  ),
  SupplementProfile(
    id: 'folic-acid',
    group: 'Vitamins',
    name: 'Folic Acid',
    subtitle: 'Vitamin B9 supplement',
    formulation: 'Tablets and multivitamin/prenatal combinations',
    howToTakeEn:
        'Take according to the prescribed or labeled schedule. A special fatty meal is not required.',
    formulationAlert:
        'Distinguish folic acid amount from total folate expressed as mcg DFE on labels.',
    sourceLabel: 'NIH ODS Folate Fact Sheets',
    pharmacistSections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Differentiate folic acid from food folate and label units in mcg DFE. Confirm whether the patient is using a prenatal or multivitamin that already contains folic acid.',
      ),
      MedicationSection(
        title: 'Duplication check',
        body:
            'Combination products can easily lead to duplicate folic acid intake. Review the entire supplement list rather than the single product only.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لتغطية احتياج الجسم من حمض الفوليك، وتزداد أهميته في بعض مراحل الحياة مثل ما قبل الحمل وبدايته.',
      howToUseAr: 'خذ الجرعة المكتوبة لك في وقت ثابت كل يوم.',
      importantAr:
          'إذا كنت تستخدم فيتامين حمل أو ملتي فيتامين، تحقق هل يحتوي أصلًا على حمض الفوليك قبل إضافة منتج آخر.',
    ),
  ),
];
