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
    useBasis: 'Routine supplementation or deficiency treatment',
    monitoringEn: '25-hydroxyvitamin D testing is useful when evaluating suspected deficiency, malabsorption or higher-risk treatment; routine supplementation does not automatically require a level.',
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
    useBasis: 'Risk-based or laboratory-guided',
    monitoringEn: 'For treatment of suspected/confirmed deficiency, laboratory follow-up and cause assessment are usually relevant; do not treat elemental-iron dosing as a generic wellness supplement.',
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

  SupplementProfile(
    id: 'vitamin-c',
    group: 'Vitamins',
    name: 'Vitamin C',
    subtitle: 'Ascorbic acid',
    formulation: 'Tablets, capsules, chewables, gummies and liquid drops',
    howToTakeEn:
        'No fatty meal is required. Take according to the product directions; if a high dose causes GI upset, reassess the dose/product rather than assuming more is better.',
    formulationAlert:
        'Some products contain sodium ascorbate or other mineral ascorbates. Check the full ingredient and sodium/mineral content when clinically relevant.',
    sourceLabel: 'NIH ODS Vitamin C + MedlinePlus Ascorbic Acid',
    pharmacistSections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Ascorbic acid is the most common form and has bioavailability comparable with vitamin C from foods. High supplemental doses can cause diarrhea, nausea and abdominal cramping.',
      ),
      MedicationSection(
        title: 'Iron counseling',
        body:
            'Vitamin C enhances nonheme iron absorption, so it can be useful when counseling selected patients taking oral iron.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لتعويض نقص فيتامين C أو حسب الحاجة.',
      howToUseAr:
          'خذه حسب الجرعة المكتوبة على المنتج أو وصف الطبيب. لا يحتاج إلى وجبة دهنية خاصة.',
      commonActionableAr:
          'الجرعات العالية قد تسبب إسهالًا أو مغصًا أو غثيانًا.',
      importantAr:
          'لا تستخدم جرعات كبيرة لفترات طويلة من نفسك لمجرد أنه فيتامين.',
    ),
  ),
  SupplementProfile(
    id: 'vitamin-a',
    group: 'Vitamins',
    name: 'Vitamin A',
    subtitle: 'Retinol / retinyl esters / beta-carotene products',
    formulation: 'Stand-alone products and multivitamin combinations',
    howToTakeEn:
        'Follow the exact product directions. Do not add high-dose preformed vitamin A without a clear indication, especially in pregnancy or when another multivitamin already contains vitamin A.',
    formulationAlert:
        'Distinguish preformed vitamin A from beta-carotene. Toxicity limits apply to preformed vitamin A, and the pregnancy risk is especially important.',
    sourceLabel: 'NIH ODS Vitamin A and Carotenoids',
    pharmacistSections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Vitamin A is fat soluble and excess preformed vitamin A can accumulate. Review total intake from stand-alone products, cod-liver products and multivitamins.',
      ),
      MedicationSection(
        title: 'Pregnancy safety',
        body:
            'High intake of preformed vitamin A can cause congenital birth defects. Avoid casual high-dose supplementation during pregnancy and verify the form on the label.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم فقط عند الحاجة أو ضمن منتج يحتوي على فيتامينات متعددة.',
      howToUseAr: 'اتبع جرعة المنتج ولا تضف منتج فيتامين A آخر من نفسك.',
      importantAr:
          'إذا كنتِ حاملًا أو تخططين للحمل، لا تستخدمي جرعات عالية من فيتامين A من نفسك.',
    ),
  ),
  SupplementProfile(
    id: 'vitamin-e',
    group: 'Vitamins',
    name: 'Vitamin E',
    subtitle: 'Alpha-tocopherol',
    formulation: 'Capsules, softgels and oral liquid',
    howToTakeEn:
        'Take exactly as directed on the product or by the prescriber. A special fatty meal is not required by general MedlinePlus guidance.',
    formulationAlert:
        'High-dose vitamin E can increase bleeding risk, especially with anticoagulant or antiplatelet therapy.',
    sourceLabel: 'NIH ODS Vitamin E + MedlinePlus Vitamin E',
    pharmacistSections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Most people obtain adequate vitamin E from food. Review indication before recommending stand-alone high-dose supplementation.',
      ),
      MedicationSection(
        title: 'Bleeding interaction',
        body:
            'High-dose vitamin E can inhibit platelet aggregation and antagonize vitamin K-dependent clotting, increasing bleeding risk with anticoagulant or antiplatelet medicines.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'قد يُستخدم لتعويض نقص فيتامين E في حالات محددة.',
      howToUseAr: 'خذ الجرعة حسب المنتج أو وصف الطبيب، ولا ترفع الجرعة من نفسك.',
      importantAr:
          'إذا كنت تستخدم مميعات الدم أو أدوية تزيد النزف، أخبر الطبيب أو الصيدلي قبل استخدام جرعات عالية من فيتامين E.',
    ),
  ),
  SupplementProfile(
    id: 'vitamin-k',
    group: 'Vitamins',
    name: 'Vitamin K',
    subtitle: 'Vitamin K1 / K2 products',
    formulation: 'Stand-alone and combination supplements',
    howToTakeEn:
        'Take according to the exact product directions. If the patient uses warfarin or another vitamin K antagonist, do not start, stop or substantially change vitamin K supplementation without coordinated anticoagulation advice.',
    formulationAlert:
        'Warfarin interaction is the key counseling issue; consistency of vitamin K exposure matters more than arbitrary avoidance.',
    sourceLabel: 'NIH ODS Vitamin K Fact Sheet',
    pharmacistSections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Vitamin K1 and K2 products differ. Review the reason for use and the complete anticoagulation history before recommending supplementation.',
      ),
      MedicationSection(
        title: 'Warfarin',
        body:
            'Vitamin K can seriously interact with warfarin and similar vitamin K antagonists. Coordinate any meaningful change in supplement use or dietary vitamin K exposure.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم في حالات محددة حسب الحاجة.',
      howToUseAr: 'خذ المنتج حسب التعليمات ولا تغيّر الجرعة من نفسك.',
      importantAr:
          'إذا كنت تستخدم وارفارين أو مميع دم مشابه، لا تبدأ أو توقف فيتامين K من نفسك.',
    ),
  ),
  SupplementProfile(
    id: 'iodine',
    group: 'Minerals',
    name: 'Iodine',
    subtitle: 'Iodide / iodine supplement',
    formulation: 'Potassium iodide, sodium iodide, kelp and multivitamin products',
    howToTakeEn:
        'Take only the intended labeled amount. Review thyroid disease, prenatal/multivitamin duplication and potassium-related medicines before using stand-alone iodine.',
    formulationAlert:
        'Kelp products and stand-alone iodine can add to iodine already present in multivitamins or prenatal products.',
    sourceLabel: 'NIH ODS Iodine Fact Sheet',
    pharmacistSections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Check the indication and total iodine exposure. Excess iodine can cause thyroid dysfunction in susceptible patients.',
      ),
      MedicationSection(
        title: 'Medication interactions',
        body:
            'Potassium iodide can interact with ACE inhibitors and potassium-sparing diuretics by increasing hyperkalemia risk. High-dose iodine also interacts with antithyroid therapy.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لتغطية احتياج اليود في حالات معينة أو ضمن بعض المكملات.',
      howToUseAr: 'خذ الكمية المكتوبة لك ولا تجمع أكثر من منتج يحتوي على اليود من نفسك.',
      importantAr:
          'إذا كان لديك مرض في الغدة الدرقية أو تستخدم أدوية لها، أخبر الطبيب أو الصيدلي قبل استخدام مكمل يود منفصل.',
    ),
  ),
  SupplementProfile(
    id: 'selenium',
    group: 'Minerals',
    name: 'Selenium',
    subtitle: 'Trace-mineral supplement',
    formulation: 'Stand-alone and multivitamin/mineral products',
    howToTakeEn:
        'Take only the intended labeled amount. There is no reason to stack multiple selenium-containing products when the dietary/supplement need is already covered.',
    formulationAlert:
        'Selenium is a trace nutrient; more is not better. Check the total daily intake from all combination products.',
    sourceLabel: 'NIH ODS Selenium Fact Sheet',
    pharmacistSections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Selenium is readily absorbed and excess intake can become toxic. Review the indication and duplicate exposure from multivitamin/mineral products.',
      ),
      MedicationSection(
        title: 'Avoid unnecessary high doses',
        body:
            'Routine high-dose use without a specific indication is not appropriate. Keep counseling focused on total intake and duplication.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم عند الحاجة لتعويض السيلينيوم.',
      howToUseAr: 'خذ الجرعة المكتوبة فقط، ولا تجمع أكثر من مكمل يحتوي على السيلينيوم.',
      importantAr: 'زيادة الجرعة لا تعني فائدة أكبر وقد تسبب ضررًا.',
    ),
  ),
  SupplementProfile(
    id: 'pediatric-vitamin-d',
    group: 'Pediatric supplements',
    name: 'Infant Vitamin D',
    subtitle: 'Pediatric vitamin D drops',
    formulation: 'Infant oral drops; concentrations vary by product',
    howToTakeEn:
        'Use the exact dropper/device for the selected product and verify IU per drop or per mL. Give the prescribed/recommended amount consistently; do not transfer a drop count from another brand.',
    formulationAlert:
        'CDC 2026: breastfed and partially breastfed infants who consume less than 32 oz of formula per day need an additional vitamin D source; product concentration must be checked carefully.',
    sourceLabel: 'CDC Infant Vitamin D 2026 + NIH ODS Vitamin D',
    useBasis: 'Routine guideline-based supplementation',
    monitoringEn: 'Routine infant supplementation does not usually require a vitamin D level; testing becomes relevant when deficiency, malabsorption or other clinical risk is suspected.',
    isPediatric: true,
    pharmacistSections: [
      MedicationSection(
        title: 'Routine vs test-guided',
        body:
            'This is commonly routine supplementation rather than a lab-driven treatment decision in breastfed infants. CDC and AAP guidance recommends 400 IU/day beginning shortly after birth for breastfed and partially breastfed infants who do not receive enough formula.',
      ),
      MedicationSection(
        title: 'Administration safety',
        body:
            'The major practical risk is concentration error. Verify IU per drop versus IU per mL and demonstrate the exact measuring device to the caregiver.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد على نمو عظام الطفل ويقي من نقص فيتامين د.',
      howToUseAr:
          'استخدم القطارة أو الأداة الخاصة بنفس المنتج، وأعطِ فقط العدد أو الحجم المكتوب لك.',
      importantAr:
          'لا تستخدم عدد القطرات من عبوة قديمة أو من ماركة أخرى؛ تركيز القطرات قد يختلف.',
      teachBackAr: 'أرني على العبوة كم وحدة في القطرة أو في كل mL، ثم أرني الجرعة التي ستعطيها.',
    ),
  ),
  SupplementProfile(
    id: 'pediatric-iron',
    group: 'Pediatric supplements',
    name: 'Infant / Pediatric Iron',
    subtitle: 'Oral iron drops or liquid',
    formulation: 'Pediatric drops and liquids; elemental iron concentration varies',
    howToTakeEn:
        'Base counseling on elemental iron and the exact liquid concentration. Feeding pattern, gestational age, iron-fortified formula and complementary foods determine whether routine supplementation is needed.',
    formulationAlert:
        'Do not copy a mL dose between products. Verify mg elemental iron per mL every time.',
    sourceLabel: 'CDC Iron 2026 + AAP Clinical Report 2026',
    useBasis: 'Feeding-pattern and risk-based; sometimes laboratory-guided',
    monitoringEn: 'Iron need depends on feeding, gestational age and diet. Current pediatric guidance also supports screening for anemia/iron deficiency at risk-appropriate ages.',
    isPediatric: true,
    pharmacistSections: [
      MedicationSection(
        title: 'Who needs it?',
        body:
            'CDC notes that iron needs differ by feeding pattern. Iron-fortified formula usually covers needs in formula-fed infants before complementary foods. Breastfed infants may require supplementation; current AAP 2026 guidance recommends 1 mg/kg/day by 4 months for exclusively breastfed term infants.',
      ),
      MedicationSection(
        title: 'Testing & risk',
        body:
            'Prematurity, low iron stores, diet and later screening influence management. CDC notes anemia screening around 12 months and emphasizes individualized discussion for infants at higher risk.',
      ),
      MedicationSection(
        title: 'Administration safety',
        body:
            'Counsel by elemental iron concentration and demonstrate the oral syringe/dropper. Keep iron products out of reach of children because overdose can be dangerous.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد على الوقاية من نقص الحديد أو علاجه إذا كان الطفل يحتاجه.',
      howToUseAr:
          'استخدم السرنجة أو القطارة المخصصة، وأعطِ الحجم المكتوب لك فقط.',
      importantAr:
          'لا تنقل نفس عدد القطرات أو mL إلى منتج آخر؛ تركيز الحديد قد يختلف بين العبوات.',
      seekHelpAr:
          'احفظ الحديد بعيدًا تمامًا عن متناول الأطفال، وإذا أخذ الطفل كمية إضافية بالخطأ اطلب المساعدة فورًا.',
      teachBackAr: 'أرني تركيز الحديد على العبوة، ثم أرني الحجم الذي ستعطيه للطفل.',
    ),
  ),
  SupplementProfile(
    id: 'multivitamin-mineral',
    group: 'Combination products',
    name: 'Multivitamin / Multimineral',
    subtitle: 'Combination supplement',
    formulation: 'Tablets, capsules, gummies and liquids',
    howToTakeEn:
        'Take according to the exact product directions. Review the full ingredient panel rather than counseling it as one generic product.',
    formulationAlert:
        'Combination products can duplicate vitamin D, vitamin A, iron, calcium, zinc or folic acid already taken separately.',
    sourceLabel: 'Ingredient-level NIH ODS fact sheets',
    pharmacistSections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Treat the product as a list of ingredients, not as a single harmless supplement. Check duplication, high-dose ingredients, iron content, fat-soluble vitamins and interactions.',
      ),
      MedicationSection(
        title: 'Common mistake',
        body:
            'Adding stand-alone vitamin D, iron, zinc or folic acid without checking what the multivitamin already contains.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يجمع عدة فيتامينات أو معادن في منتج واحد.',
      howToUseAr: 'خذه حسب تعليمات نفس المنتج.',
      importantAr:
          'قبل إضافة أي فيتامين أو معدن آخر، تأكد أنه غير موجود أصلًا في هذا المنتج حتى لا تكرر الجرعة.',
    ),
  ),
  SupplementProfile(
    id: 'prenatal-combination',
    group: 'Combination products',
    name: 'Prenatal Multivitamin',
    subtitle: 'Pregnancy-focused combination supplement',
    formulation: 'Combination tablets, capsules or gummies',
    howToTakeEn:
        'Take consistently according to the selected product and prenatal plan. Review iron, folic acid, iodine, vitamin D and preformed vitamin A content rather than assuming all prenatal products are equivalent.',
    formulationAlert:
        'Prenatal products vary. Some gummies may omit iron; iodine and vitamin A forms also differ.',
    sourceLabel: 'NIH ODS folate, iodine, iron, vitamin D and vitamin A fact sheets',
    pharmacistSections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Review the actual label. Focus on folic acid/folate, iron, iodine, vitamin D and vitamin A form. Do not assume a prenatal product covers every nutrient at the desired amount.',
      ),
      MedicationSection(
        title: 'Pregnancy safety',
        body:
            'Avoid stacking high-dose preformed vitamin A and review all additional supplements used during pregnancy.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يوفر مجموعة من الفيتامينات والمعادن المهمة قبل الحمل وخلاله حسب المنتج.',
      howToUseAr: 'خذيه يوميًا حسب تعليمات المنتج أو الطبيب.',
      importantAr:
          'لا تضيفي فيتامينات أخرى من نفسك قبل التأكد مما يحتويه فيتامين الحمل، خصوصًا الحديد وفيتامين A والفوليك واليود.',
    ),
  ),
  SupplementProfile(
    id: 'growth-amino-acid-blends',
    group: 'Growth / amino-acid products',
    name: 'Growth / Amino-acid Blends',
    subtitle: 'Products marketed for height or growth support',
    formulation: 'Powders, syrups, gummies and mixed amino-acid products',
    howToTakeEn:
        'Do not assign a generic administration rule. Review the exact ingredients, age, nutrition status and reason for use before counseling.',
    formulationAlert:
        'Marketing terms such as growth, GH support or height booster are not a substitute for evidence. Keep these products separate from essential nutrient replacement.',
    sourceLabel: 'Product-specific evidence review required before production verification',
    pharmacistSections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'First identify the actual ingredients and amounts. Assess whether the child has a nutritional deficiency, poor intake or a medical growth problem that requires evaluation rather than a supplement.',
      ),
      MedicationSection(
        title: 'Counseling position',
        body:
            'Do not present amino-acid or “growth booster” combinations as established growth-hormone therapy. Avoid implying predictable height gain without evidence.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'هذه المنتجات تُسوّق للنمو، لكن فائدتها تعتمد على مكوناتها وحالة الطفل الغذائية.',
      howToUseAr:
          'لا تبدأ المنتج قبل معرفة مكوناته وسبب استخدامه، خصوصًا للأطفال.',
      importantAr:
          'إذا كان الطفل قصير القامة أو نموه بطيئًا، المكمل لا يغني عن تقييم الطبيب لمعرفة السبب.',
    ),
  ),
  SupplementProfile(
    id: 'high-risk-weight-loss-supplements',
    group: 'Safety review',
    name: 'Weight-loss / High-risk Supplements',
    subtitle: 'Safety-first review',
    formulation: 'Variable multi-ingredient products',
    howToTakeEn:
        'No administration recommendation should be generated until the exact ingredients, regulatory status and safety profile are reviewed.',
    formulationAlert:
        'This category is intentionally safety-gated. Products with unclear, stimulant, withdrawn or undeclared ingredients must not be treated like routine supplements.',
    sourceLabel: 'Product-specific regulatory and safety verification required',
    pharmacistSections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Identify every active ingredient and check current regulatory warnings before counseling. Do not recommend a product based only on the marketing name or claimed natural origin.',
      ),
      MedicationSection(
        title: 'Safety gate',
        body:
            'The app should block a routine “how to take” card when the product has not passed ingredient and safety review.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'هذه المنتجات تحتاج مراجعة دقيقة قبل الاستخدام لأن مكوناتها تختلف كثيرًا.',
      howToUseAr:
          'لا تبدأ المنتج قبل أن يراجع الصيدلي مكوناته وسلامته.',
      importantAr:
          'كون المنتج مكتوبًا عليه طبيعي لا يعني أنه آمن أو مناسب لك.',
    ),
  ),
  SupplementProfile(
    id: 'magnesium-citrate',
    group: 'Minerals',
    name: 'Magnesium Citrate',
    subtitle: 'Magnesium supplement — citrate salt',
    formulation:
        'Tablets, capsules, powders and liquids; some products are laxatives rather than daily supplements',
    howToTakeEn:
        'Follow the exact product and intended use. For routine supplementation, counsel by elemental magnesium and use food if it improves GI tolerance. Do not transfer laxative-product directions to a daily supplement.',
    formulationAlert:
        'Magnesium citrate is relatively well absorbed, but total “magnesium citrate” milligrams are not the same as elemental magnesium. Laxative liquids can contain very different amounts and directions.',
    sourceLabel: 'NIH ODS Magnesium Fact Sheet · current',
    useBasis: 'Dietary supplementation or deficiency treatment; indication-specific',
    monitoringEn:
        'Routine low-dose use does not automatically require a magnesium level. Renal function and serum magnesium become more important with suspected deficiency/toxicity, kidney impairment or substantial/prolonged dosing.',
    pharmacistSections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Read the Supplement Facts panel for elemental magnesium. NIH ODS notes citrate is among the more readily absorbed forms. Keep supplement use separate from magnesium-citrate laxative dosing.',
      ),
      MedicationSection(
        title: 'Interactions',
        body:
            'Magnesium can reduce absorption of selected antibiotics and bisphosphonates and can interfere with levothyroxine absorption. Use the interacting medicine’s exact separation rule rather than a single generic interval.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'Renal / GI safety',
        body:
            'Diarrhea is a common dose-limiting effect. Significant kidney impairment increases the risk of magnesium accumulation and should trigger clinical review before substantial supplementation.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لتعويض المغنيسيوم أو كمكمل حسب الحاجة.',
      howToUseAr:
          'اتبع نفس المنتج واقرأ كمية elemental magnesium، وليس وزن Magnesium Citrate فقط. إذا أزعج المعدة يمكن أخذه مع الطعام حسب المنتج.',
      timingAr:
          'إذا كنت تستخدم أدوية أخرى مثل بعض المضادات الحيوية أو أدوية الغدة/العظام فقد تحتاج فصل الجرعات؛ أخبر الصيدلي بكل أدويتك.',
      commonActionableAr:
          'قد يسبب إسهالًا أو مغصًا، خصوصًا مع الجرعات الأعلى.',
      importantAr:
          'لا تستخدم تعليمات منتج magnesium citrate الملين كأنها نفس تعليمات مكمل المغنيسيوم اليومي.',
      seekHelpAr:
          'إذا لديك مرض كلوي أو ظهرت خمول شديد أو ضعف غير معتاد أثناء جرعات كبيرة، راجع الطبيب.',
      teachBackAr:
          'أرني كم mg من elemental magnesium في الجرعة، وهل منتجك مكمل أم laxative؟',
    ),
  ),
  SupplementProfile(
    id: 'magnesium-oxide',
    group: 'Minerals',
    name: 'Magnesium Oxide',
    subtitle: 'Magnesium supplement — oxide salt',
    formulation:
        'Tablets/capsules; also appears in antacid and laxative products',
    howToTakeEn:
        'Counsel by elemental magnesium and the intended indication. Food may improve GI tolerance. Do not use antacid/laxative directions as the default supplement schedule.',
    formulationAlert:
        'Magnesium oxide contains substantial elemental magnesium by weight but is less bioavailable than several more soluble forms; product milligrams cannot be compared directly across salts.',
    sourceLabel: 'NIH ODS Magnesium Fact Sheet · current',
    useBasis: 'Supplementation or product-specific GI use',
    monitoringEn:
        'Routine low-dose supplementation does not automatically require testing. Check renal context and consider serum magnesium when deficiency or toxicity is clinically suspected.',
    pharmacistSections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Do not choose the product from salt weight alone. NIH ODS notes more soluble forms such as citrate, lactate, chloride and aspartate tend to be more bioavailable than oxide.',
      ),
      MedicationSection(
        title: 'Common mistake',
        body:
            'Comparing “500 mg magnesium oxide” with “500 mg magnesium citrate” as if they provided the same elemental dose and absorption.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Interactions / safety',
        body:
            'Magnesium can impair absorption of selected antibiotics, bisphosphonates and levothyroxine. GI adverse effects are common, and kidney impairment raises accumulation risk.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم كمصدر للمغنيسيوم، وبعض المنتجات تُستخدم لأغراض هضمية أيضًا.',
      howToUseAr:
          'تأكد من كمية elemental magnesium على المنتج؛ رقم Magnesium Oxide الكلي لا يخبرك وحده بجرعة المغنيسيوم الفعلية.',
      timingAr:
          'إذا أزعج المعدة يمكن أخذه مع الطعام حسب المنتج، وقد يحتاج فصلًا عن بعض الأدوية.',
      commonActionableAr: 'قد يسبب إسهالًا أو انزعاجًا في المعدة.',
      importantAr:
          'لا تبدّل بين أملاح المغنيسيوم بنفس عدد الـmg من نفسك؛ الامتصاص والكمية الفعلية يختلفان.',
      seekHelpAr:
          'إذا لديك قصور كلوي فلا تستخدم جرعات كبيرة من المغنيسيوم من نفسك.',
      teachBackAr:
          'قل لي كم elemental magnesium في الحبة، وما سبب استخدامك لهذا المنتج تحديدًا؟',
    ),
  ),
  SupplementProfile(
    id: 'potassium-supplements',
    group: 'Minerals',
    name: 'Potassium Supplements / Salt Substitutes',
    subtitle: 'Potassium-containing supplements and salt substitutes',
    formulation:
        'OTC dietary supplements, prescription potassium salts and potassium-containing salt substitutes',
    howToTakeEn:
        'Do not create one generic dose or timing rule. First identify the exact product, potassium amount, indication, kidney function and potassium-raising medicines. Prescription potassium should follow the prescribed product instructions.',
    formulationAlert:
        'Food potassium, OTC supplements, prescription potassium chloride/citrate and salt substitutes are not interchangeable. Some salt substitutes can provide clinically important potassium.',
    sourceLabel: 'NIH ODS Potassium Fact Sheet · current',
    useBasis: 'Laboratory/clinical indication or diet-specific plan — not routine self-treatment',
    monitoringEn:
        'Serum potassium and renal function are central when potassium is being replaced therapeutically or when hyperkalemia risk exists. Monitoring frequency depends on the clinical plan and interacting medicines.',
    pharmacistSections: [
      MedicationSection(
        title: 'Critical medication screen',
        body:
            'ACE inhibitors, ARBs, ARNIs, potassium-sparing diuretics such as spironolactone/eplerenone, kidney disease and several other conditions can raise potassium. Ask specifically about salt substitutes.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Do not infer need from symptoms',
        body:
            'Cramps, fatigue or “low energy” are not sufficient reasons to start potassium. Establish whether supplementation is actually indicated and safe.',
      ),
      MedicationSection(
        title: 'Product distinction',
        body:
            'Prescription potassium formulations can have specific food, dilution and swallow-whole instructions. Those instructions must come from the exact product label, not from this general supplement profile.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يُستخدم فقط عندما تكون هناك حاجة واضحة للبوتاسيوم أو حسب خطة الطبيب/التغذية.',
      howToUseAr:
          'لا تبدأ مكمل بوتاسيوم أو بديل ملح يحتوي بوتاسيوم قبل مراجعة أدويتك ووظائف الكلى، واتبع نفس المنتج إذا كان موصوفًا لك.',
      timingAr:
          'طريقة الاستخدام تختلف حسب نوع المنتج؛ لا توجد جرعة أو ساعة واحدة تناسب كل مكملات البوتاسيوم.',
      importantAr:
          'أدوية الضغط/القلب مثل بعض ACEI/ARB وspironolactone قد ترفع البوتاسيوم، وبدائل الملح قد تحتوي كمية مهمة منه.',
      seekHelpAr:
          'اطلب مراجعة طبية عند ضعف شديد أو خفقان غير معتاد، خصوصًا إذا لديك مرض كلوي أو تستخدم أدوية ترفع البوتاسيوم.',
      teachBackAr:
          'أرني اسم المنتج وكمية potassium فيه، واذكر لي أدوية الضغط/القلب والكلى التي تستخدمها.',
    ),
  ),
  SupplementProfile(
    id: 'omega-3',
    group: 'Other supplements',
    name: 'Omega-3 / Fish Oil',
    subtitle: 'EPA / DHA dietary supplements',
    formulation:
        'Fish-oil, krill-oil, algal DHA/EPA capsules or liquids; prescription omega-3 products are separate medicines',
    howToTakeEn:
        'Take according to the exact product; taking with a meal often improves tolerance. Compare products by actual EPA + DHA per serving, not by total “fish oil” milligrams.',
    formulationAlert:
        '“Fish oil 1000 mg” does not mean 1000 mg EPA+DHA. Prescription omega-3 products used for lipid disorders are not interchangeable with dietary supplements.',
    sourceLabel: 'NIH ODS Omega-3 Fatty Acids Fact Sheet · current',
    useBasis: 'Dietary intake support or clinician-directed indication',
    monitoringEn:
        'Routine omega-3 blood testing is not required for general supplement use. If being used for severe hypertriglyceridemia, lipid monitoring belongs to the clinician-directed treatment plan.',
    pharmacistSections: [
      MedicationSection(
        title: 'Pharmacist essentials',
        body:
            'Verify EPA and DHA separately. Distinguish dietary supplementation from prescription-strength treatment for hypertriglyceridemia.',
      ),
      MedicationSection(
        title: 'Bleeding / rhythm review',
        body:
            'High-dose omega-3 can have antiplatelet effects. Review anticoagulants/antiplatelets. Trials using 4 g/day in cardiovascular-risk populations reported a small increase in atrial fibrillation.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'Tolerability',
        body:
            'Fishy taste, reflux, nausea and GI discomfort are common and may improve with meals or a different product.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يوفر أحماض أوميغا-3 مثل EPA وDHA؛ فائدته تعتمد على سبب الاستخدام والجرعة الفعلية.',
      howToUseAr:
          'خذ المنتج حسب الملصق، وغالبًا مع وجبة لتقليل الطعم أو الانزعاج. اقرأ كمية EPA + DHA وليس فقط رقم fish oil.',
      timingAr:
          'يمكن ربطه بوجبة ثابتة؛ التوقيت أقل أهمية من معرفة الجرعة الفعلية ومراجعة أدوية النزف.',
      commonActionableAr:
          'قد يسبب طعمًا سمكيًا أو حرقة أو انزعاجًا بالمعدة.',
      importantAr:
          'إذا كنت تستخدم مميع دم أو جرعة عالية من omega-3، أخبر الصيدلي/الطبيب. مكملات fish oil ليست بديلًا تلقائيًا للمنتجات الوصفية.',
      seekHelpAr:
          'راجع الطبيب عند نزف غير معتاد أو خفقان/عدم انتظام جديد، خاصة مع الجرعات العالية أو مرض قلبي.',
      teachBackAr:
          'أرني كم mg من EPA وكم mg من DHA في الجرعة اليومية، وليس فقط كم mg fish oil.',
    ),
  ),
  SupplementProfile(
    id: 'biotin',
    group: 'Vitamins',
    name: 'Biotin',
    subtitle: 'Vitamin B7 / hair-nail products',
    formulation:
        'Stand-alone tablets/capsules/gummies and high-dose hair/skin/nail combinations',
    howToTakeEn:
        'Take according to the exact product if there is a clear reason to use it. No special meal is required. The key counseling point is to disclose biotin use before laboratory testing.',
    formulationAlert:
        'Hair/nail products may contain biotin doses far above nutritional requirements. The main practical risk is interference with certain laboratory assays.',
    sourceLabel: 'FDA Biotin Laboratory-Test Safety Communication + NIH ODS Biotin',
    useBasis: 'Deficiency is uncommon; use should have a clear rationale',
    monitoringEn:
        'Routine biotin testing is rarely useful. Before blood tests, the laboratory/clinician should know the dose and timing because assay interference is method-specific; do not invent a universal stop interval.',
    pharmacistSections: [
      MedicationSection(
        title: 'Laboratory interference',
        body:
            'FDA continues to warn that biotin can significantly interfere with certain lab assays and produce incorrect results. Some troponin assays are a clinically important example.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'No universal washout',
        body:
            'Do not tell every patient to stop biotin for the same number of hours. Needed interruption depends on dose, assay and laboratory/platform instructions.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Evidence check',
        body:
            'Deficiency is uncommon. High-dose “hair/nails” marketing should not be treated as proof that the patient needs pharmacologic biotin.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'البيوتين فيتامين B7، لكن نقصه غير شائع والجرعات العالية الموجودة في منتجات الشعر ليست ضرورية لكل شخص.',
      howToUseAr:
          'إذا كنت تستخدمه فاتبع المنتج، ولا يحتاج وجبة خاصة. الأهم أن تخبر المختبر والطبيب أنك تستخدم biotin قبل التحاليل.',
      timingAr:
          'لا توجد قاعدة واحدة لإيقافه قبل كل تحليل؛ المدة تعتمد على الجرعة ونوع التحليل والمختبر.',
      importantAr:
          'Biotin قد يعطي نتائج خاطئة في بعض التحاليل. لا تنسَ ذكره حتى لو كنت تعتبره مجرد فيتامين.',
      seekHelpAr:
          'إذا طُلب منك تحليل مهم مثل تحاليل القلب أو الهرمونات، أخبر الفريق الطبي عن biotin قبل سحب العينة.',
      teachBackAr:
          'إذا ذهبت لعمل تحليل، ماذا ستخبر المختبر عن biotin الذي تستخدمه؟',
    ),
  ),
  SupplementProfile(
    id: 'vitamin-b6',
    group: 'Vitamins',
    name: 'Vitamin B6',
    subtitle: 'Pyridoxine / pyridoxal-5-phosphate products',
    formulation:
        'Stand-alone B6, B-complex, multivitamins and combination products',
    howToTakeEn:
        'No special meal is required for routine supplementation. First add up vitamin B6 from every product because high-dose B-complex and combination products can create unintended chronic exposure.',
    formulationAlert:
        'B6 may be hidden in B-complex, magnesium, “energy” and neuropathy products. Chronic high supplemental intake can cause sensory neuropathy.',
    sourceLabel: 'NIH ODS Vitamin B6 Fact Sheet · current',
    useBasis: 'Routine nutritional intake or indication-specific therapy',
    monitoringEn:
        'Routine levels are not needed for typical low-dose use. Consider targeted evaluation when deficiency or toxicity/neuropathy is suspected.',
    pharmacistSections: [
      MedicationSection(
        title: 'Neuropathy safety',
        body:
            'Long-term high supplemental B6 can cause severe sensory neuropathy. The U.S. adult UL is 100 mg/day, while some authorities use lower limits; do not treat chronic high-dose B6 as harmless.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Duplication check',
        body:
            'Add B6 from all supplements. A patient may unknowingly combine a multivitamin, B-complex and magnesium/energy product that all contain pyridoxine.',
      ),
      MedicationSection(
        title: 'Patient-specific use',
        body:
            'Higher therapeutic doses can be appropriate for selected indications under clinician supervision; this is different from unsupervised chronic supplementation.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'فيتامين B6 مهم للجسم، لكن معظم الناس لا يحتاجون جرعات عالية مزمنة.',
      howToUseAr:
          'اتبع الجرعة المقصودة، واجمع كمية B6 من كل منتجاتك مثل B-complex والملتي فيتامين ومنتجات الطاقة.',
      timingAr:
          'لا يحتاج وجبة خاصة عادةً؛ الأهم عدم تكرار الجرعة من أكثر من منتج.',
      importantAr:
          'الجرعات العالية لفترة طويلة قد تسبب تنميلًا أو أذية أعصاب بدل أن تعالجها.',
      seekHelpAr:
          'إذا ظهر تنميل أو وخز أو عدم توازن جديد وأنت تستخدم جرعة مرتفعة من B6، أوقف التقييم الذاتي وراجع الطبيب/الصيدلي.',
      teachBackAr:
          'اجمع لي كمية B6 من كل مكمل تستخدمه، وهل أي منها يعطي جرعة عالية يوميًا؟',
    ),
  ),

];
