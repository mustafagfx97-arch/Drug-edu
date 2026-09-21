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
    id: 'magnesium-oxide',
    group: 'Minerals',
    name: 'Magnesium Oxide',
    subtitle: 'Magnesium salt · lower bioavailability / more GI effect',
    formulation: 'Tablets, capsules and powder products; label reports elemental magnesium, not total salt weight',
    howToTakeEn:
        'Take according to the exact product. It may be taken with food if GI upset occurs. Do not assume the same elemental magnesium from equal milligrams of different magnesium salts.',
    formulationAlert:
        'Magnesium oxide is generally less bioavailable than more soluble forms such as citrate, chloride, lactate and aspartate. It may also have a stronger laxative effect.',
    sourceLabel: 'NIH ODS Magnesium Health Professional Fact Sheet',
    useBasis: 'Dietary supplementation or product-specific laxative/antacid use',
    monitoringEn:
        'Routine low-dose supplementation in healthy people does not require magnesium levels. Renal impairment, high doses, symptoms of toxicity or therapeutic replacement warrant clinical review and sometimes serum magnesium monitoring.',
    pharmacistSections: [
      MedicationSection(
        title: 'Salt matters',
        body:
            'Counsel by elemental magnesium. NIH ODS notes that citrate, chloride, lactate and aspartate forms tend to be more bioavailable than magnesium oxide or sulfate.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'Interaction separation',
        body:
            'Magnesium can reduce absorption of some medicines, including tetracycline/quinolone antibiotics and bisphosphonates. Use the medicine-specific separation interval rather than one generic rule.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مكمل مغنيسيوم، وقد يُستخدم بعض منتجاته أيضًا كملين أو مضاد حموضة حسب المنتج.',
      howToUseAr: 'خذ الجرعة حسب كمية المغنيسيوم الفعلية المكتوبة على الملصق، وليس وزن Magnesium Oxide كله.',
      timingAr: 'يمكن أخذه مع الطعام إذا أزعج المعدة. افصل عن بعض المضادات الحيوية وأدوية العظام حسب تعليمات الدواء الآخر.',
      commonActionableAr: 'قد يسبب إسهالًا أو مغصًا؛ إذا كان مزعجًا راجع الجرعة أو النوع بدل الاستمرار على جرعة عالية.',
      importantAr: 'لا تعتبر كل أملاح المغنيسيوم متساوية في الامتصاص أو في كمية elemental magnesium.',
      seekHelpAr: 'إذا لديك قصور كلوي فلا تبدأ جرعات عالية من المغنيسيوم من نفسك.',
      teachBackAr: 'أرني كمية elemental magnesium على الملصق، وليس فقط رقم magnesium oxide.',
    ),
  ),
  SupplementProfile(
    id: 'magnesium-citrate',
    group: 'Minerals',
    name: 'Magnesium Citrate',
    subtitle: 'More soluble magnesium salt',
    formulation: 'Capsules, tablets, powders and liquids; supplement and laxative products are not interchangeable',
    howToTakeEn:
        'For supplementation, follow the exact elemental-magnesium amount on the label. It may be taken with food for tolerability. Laxative magnesium-citrate products use very different amounts and must not be counseled as routine supplements.',
    formulationAlert:
        'Magnesium citrate is generally more bioavailable than magnesium oxide, but product intent matters: concentrated laxative solutions are not equivalent to daily supplement capsules.',
    sourceLabel: 'NIH ODS Magnesium Health Professional Fact Sheet',
    useBasis: 'Supplementation when appropriate; laxative products are a separate use',
    monitoringEn:
        'Renal impairment and high-dose use require caution; serum magnesium is not routinely needed for ordinary supplementation but is relevant in clinical replacement/toxicity contexts.',
    pharmacistSections: [
      MedicationSection(
        title: 'Do not merge supplement and laxative products',
        body:
            'The word “citrate” does not define one dose. Check the product purpose, elemental magnesium, total volume and excipients before counseling.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Absorption',
        body:
            'NIH ODS reports that more soluble forms such as magnesium citrate tend to be more bioavailable than magnesium oxide.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يعطي المغنيسيوم كمكمل حسب الحاجة، لكن توجد أيضًا منتجات citrate تُستخدم كملين بجرعات مختلفة تمامًا.',
      howToUseAr: 'تحقق من كمية elemental magnesium في الجرعة ومن نوع المنتج قبل الاستخدام.',
      timingAr: 'يمكن أخذه مع الطعام إذا سبب انزعاجًا. افصل عن الأدوية التي تتأثر بالمغنيسيوم حسب تعليماتها.',
      commonActionableAr: 'قد يرخي البطن أو يسبب إسهالًا.',
      importantAr: 'لا تستخدم محلول magnesium citrate الملين كأنه كبسولة مكمل يومية.',
      seekHelpAr: 'راجع الطبيب قبل الجرعات العالية إذا لديك مرض كلوي.',
      teachBackAr: 'هل المنتج مكمل يومي أم laxative، وكم elemental magnesium يعطي؟',
    ),
  ),
  SupplementProfile(
    id: 'vitamin-d2',
    group: 'Vitamins',
    name: 'Vitamin D2',
    subtitle: 'Ergocalciferol',
    formulation: 'Capsules, tablets and liquid products; prescription/high-dose strengths may differ greatly from daily supplements',
    howToTakeEn:
        'Take with a meal or snack containing some fat to support absorption. Follow the exact prescribed schedule when using high-dose weekly or intermittent products.',
    formulationAlert:
        'D2 and D3 both raise 25-hydroxyvitamin D, but NIH ODS notes that D3 generally raises levels more and maintains them longer. Do not substitute dose schedules without checking the prescription/product.',
    sourceLabel: 'NIH ODS Vitamin D Health Professional Fact Sheet',
    useBasis: 'Supplementation or deficiency treatment depending dose and schedule',
    monitoringEn:
        '25-hydroxyvitamin D testing is useful when treating deficiency or when malabsorption/high-risk conditions are present. Routine low-dose supplementation does not always require testing.',
    pharmacistSections: [
      MedicationSection(
        title: 'D2 is not just another brand of D3',
        body:
            'Both forms work, but D3 tends to produce a larger and more sustained rise in 25(OH)D. Preserve the exact product and schedule when treatment is prescribed.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'High-dose schedule lock',
        body:
            'Weekly or intermittent high-dose vitamin D is treatment, not a generic wellness dose. Verify units (IU vs mcg), frequency and duration.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'Vitamin D2 يعالج أو يمنع نقص فيتامين د حسب الجرعة والجدول.',
      howToUseAr: 'خذه مع وجبة أو سناك فيه بعض الدهون، والتزم بالجدول المكتوب خصوصًا إذا كانت الجرعة أسبوعية أو عالية.',
      timingAr: 'لا تحول الجرعة الأسبوعية إلى يومية أو العكس من نفسك.',
      importantAr: 'D2 وD3 ليسا دائمًا قابلين للتبديل بنفس خطة العلاج؛ تأكد من الاسم والجرعة والوحدة.',
      seekHelpAr: 'لا تجمع جرعات عالية من أكثر من منتج فيتامين د.',
      teachBackAr: 'هل منتجك D2 أم D3، وهل جرعتك يومية أم أسبوعية؟',
    ),
  ),
  SupplementProfile(
    id: 'biotin',
    group: 'Vitamins',
    name: 'Biotin',
    subtitle: 'Vitamin B7 · laboratory-interference risk',
    formulation: 'Standalone hair/skin/nail products and multivitamin/B-complex products; doses are often listed in mcg or mg',
    howToTakeEn:
        'May be taken with or without food. The main counseling issue is not timing with meals but disclosure before laboratory testing.',
    formulationAlert:
        'Hair/skin/nail products may contain doses far above nutritional needs. High biotin intake can cause falsely high or falsely low laboratory results depending on the assay.',
    sourceLabel: 'NIH ODS Biotin Health Professional Fact Sheet + FDA biotin laboratory-test safety communication',
    useBasis: 'Deficiency is uncommon; cosmetic benefit claims have limited evidence',
    monitoringEn:
        'Do not order routine “biotin levels” for cosmetic supplementation. Instead, document the dose and notify the laboratory/clinician before tests that may use biotin-streptavidin technology.',
    pharmacistSections: [
      MedicationSection(
        title: 'Critical lab-test counseling',
        body:
            'Biotin can interfere with thyroid, hormone, vitamin D, cardiac biomarker and other immunoassays. FDA remains particularly concerned about falsely low troponin results. There is no single universal stop interval for every dose/assay—follow the laboratory/test-specific policy.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Hair / nail claims',
        body:
            'Evidence for routine high-dose biotin in people without deficiency is limited. Do not present high-dose “beauty” products as proven therapy.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'Biotin هو فيتامين B7، لكن استخدام الجرعات العالية للشعر والأظافر ليس مثبتًا بشكل قوي عند من لا يعاني نقصًا.',
      howToUseAr: 'يمكن أخذه مع الطعام أو بدونه.',
      timingAr: 'الأهم: أخبر الطبيب والمختبر أنك تستخدم biotin قبل أي تحليل، خصوصًا تحاليل القلب أو الغدة الدرقية.',
      importantAr: 'Biotin قد يعطي نتائج تحاليل خاطئة. لا توقفه لمدة عشوائية من نفسك؛ اسأل المختبر عن المدة المطلوبة حسب التحليل والجرعة.',
      seekHelpAr: 'إذا لديك أعراض طارئة مثل ألم صدر، أخبر الفريق الطبي فورًا عن biotin لأن بعض فحوص troponin قد تتأثر.',
      teachBackAr: 'ما الذي ستخبر به المختبر قبل التحاليل؟',
    ),
  ),
  SupplementProfile(
    id: 'vitamin-b6',
    group: 'Vitamins',
    name: 'Vitamin B6',
    subtitle: 'Pyridoxine · chronic high-dose neuropathy risk',
    formulation: 'Standalone pyridoxine, B-complex and combination products',
    howToTakeEn:
        'May be taken with or without food. Check the total daily B6 exposure from every supplement before adding a standalone product.',
    formulationAlert:
        'Long-term high supplemental doses can cause sensory neuropathy. Upper-limit recommendations differ between authorities, so avoid treating “more B6” as harmless.',
    sourceLabel: 'NIH ODS Vitamin B6 Fact Sheet',
    useBasis: 'Dietary supplementation or specific clinical indication',
    monitoringEn:
        'Routine levels are not needed for ordinary supplementation. New numbness, tingling, burning or gait problems should trigger dose/product review and medical assessment.',
    pharmacistSections: [
      MedicationSection(
        title: 'Neuropathy is the key preventable harm',
        body:
            'Chronic high-dose pyridoxine can cause severe sensory nerve injury. Review B-complex, energy, sleep and magnesium-combination products for hidden B6 duplication.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Do not oversimplify the upper limit',
        body:
            'U.S. and European authorities use different adult upper limits. For counseling, avoid prolonged high-dose self-treatment and focus on total daily exposure plus indication.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'Vitamin B6 يحتاجه الجسم بكميات صغيرة، ويُستخدم كمكمل أو لحالات محددة.',
      howToUseAr: 'خذه حسب الجرعة المحددة، مع الطعام أو بدونه.',
      importantAr: 'راجع كل المكملات التي تستخدمها؛ B6 قد يكون موجودًا في B-complex أو منتجات أخرى وتكراره قد يرفع الجرعة كثيرًا.',
      commonActionableAr: 'الجرعات العالية لفترات طويلة قد تسبب تنميلًا أو وخزًا أو مشاكل بالأعصاب.',
      seekHelpAr: 'إذا ظهر تنميل/حرقان مستمر أو ضعف بالتوازن، أوقف الزيادة غير الموصوفة وراجع الطبيب أو الصيدلي.',
      teachBackAr: 'كم مجموع B6 الذي تحصل عليه من كل منتجاتك يوميًا؟',
    ),
  ),
  SupplementProfile(
    id: 'thiamine-b1',
    group: 'Vitamins',
    name: 'Thiamine (Vitamin B1)',
    subtitle: 'Thiamine hydrochloride / mononitrate · benfotiamine differs',
    formulation: 'Standalone tablets/capsules and B-complex products',
    howToTakeEn:
        'May generally be taken with or without food. The exact dose depends on whether the goal is routine supplementation or treatment of a high-risk deficiency state.',
    formulationAlert:
        'Common supplement forms include thiamine hydrochloride and mononitrate. Benfotiamine is a synthetic derivative and should not automatically be treated as identical to standard thiamine therapy.',
    sourceLabel: 'NIH ODS Thiamin Health Professional Fact Sheet',
    useBasis: 'Risk-based supplementation or treatment of deficiency',
    monitoringEn:
        'Routine supplementation does not need blood monitoring. Suspected Wernicke encephalopathy, severe alcohol-related deficiency, prolonged vomiting or malnutrition is a medical condition where urgent parenteral treatment may be needed rather than an OTC supplement.',
    pharmacistSections: [
      MedicationSection(
        title: 'Recognize medical deficiency',
        body:
            'High-risk thiamine deficiency is not a “vitamin aisle” problem. Neurologic symptoms, alcohol dependence, severe malnutrition or persistent vomiting may require urgent medical assessment and parenteral thiamine.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Medication context',
        body:
            'Long-term furosemide use has been associated with lower thiamine status, and fluorouracil can interfere with thiamine metabolism. Supplement need remains individualized.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'Thiamine أو Vitamin B1 مهم للأعصاب واستخدام الطاقة، ويُستخدم عند وجود نقص أو خطر نقص.',
      howToUseAr: 'يمكن أخذه مع الطعام أو بدونه حسب المنتج.',
      importantAr: 'إذا كان هناك سوء تغذية شديد، قيء مستمر، اعتماد على الكحول أو أعراض عصبية، لا تعتمد على مكمل فموي فقط؛ قد تحتاج علاجًا طبيًا عاجلًا.',
      seekHelpAr: 'ارتباك شديد، مشاكل بالمشي أو حركة العين مع سوء تغذية/كحول تحتاج تقييمًا طبيًا سريعًا.',
      teachBackAr: 'هل تستخدمه كمكمل عادي أم لعلاج خطر نقص حقيقي؟',
    ),
  ),
  SupplementProfile(
    id: 'potassium-supplement',
    group: 'Minerals',
    name: 'Potassium Supplements',
    subtitle: 'High-risk mineral supplement · renal/drug interaction gate',
    formulation: 'Tablets, capsules, powders, liquids and potassium-containing salt substitutes',
    howToTakeEn:
        'Do not start routine potassium supplementation without checking the reason, kidney function and interacting medicines. Administration instructions depend strongly on the exact salt and dosage form.',
    formulationAlert:
        'Extended-release potassium products can have strict swallow/dispersion instructions and must not be generalized. Salt substitutes may also contain substantial potassium.',
    sourceLabel: 'NIH ODS Potassium Health Professional Fact Sheet',
    useBasis: 'Usually laboratory/clinical-risk guided rather than routine wellness supplementation',
    monitoringEn:
        'Serum potassium and renal function are central when replacing potassium or when hyperkalemia risk exists. Monitoring is especially important with ACE inhibitors, ARBs, spironolactone/amiloride and chronic kidney disease.',
    pharmacistSections: [
      MedicationSection(
        title: 'Interaction gate',
        body:
            'ACE inhibitors, ARBs and potassium-sparing diuretics reduce renal potassium excretion and can produce dangerous hyperkalemia. This is not solved by separating the dose in time.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Salt substitutes count',
        body:
            'Patients may not recognize potassium chloride salt substitutes as potassium supplements. Include them in the medication/supplement history.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لتعويض البوتاسيوم عندما توجد حاجة حقيقية، وليس كمكمل روتيني لكل شخص.',
      howToUseAr: 'لا تبدأه قبل مراجعة وظيفة الكلى والأدوية التي تستخدمها، واتبع طريقة نفس المنتج لأن بعض الأنواع ممتدة التحرر.',
      timingAr: 'فصل الوقت لا يمنع ارتفاع البوتاسيوم مع أدوية مثل ACEI/ARB أو spironolactone.',
      importantAr: 'أخبر الصيدلي إذا تستخدم salt substitute؛ كثير منها يحتوي potassium.',
      seekHelpAr: 'إذا لديك مرض كلوي أو تستخدم spironolactone/ACEI/ARB فلا تضف potassium من نفسك.',
      teachBackAr: 'ما الأدوية التي تستخدمها والتي قد ترفع potassium، وهل تستعمل بديل ملح؟',
    ),
  ),
  SupplementProfile(
    id: 'omega-3-epa-dha',
    group: 'Performance & specialty',
    name: 'Omega-3 (EPA / DHA)',
    subtitle: 'Fish-oil / algae-oil supplements',
    formulation: 'Softgels and liquids with variable EPA and DHA content',
    howToTakeEn:
        'Use the EPA + DHA amounts on the Supplement Facts panel, not the total “fish oil” milligrams. Taking with food may improve GI tolerability for some patients.',
    formulationAlert:
        'A 1,000 mg fish-oil capsule does not necessarily contain 1,000 mg EPA+DHA. Prescription omega-3 products and dietary supplements are not interchangeable.',
    sourceLabel: 'NIH ODS Omega-3 Fatty Acids Health Professional Fact Sheet',
    useBasis: 'Dietary supplementation; triglyceride treatment uses prescription/product-specific regimens',
    monitoringEn:
        'High-dose use with anticoagulants warrants medication review; patients on warfarin may need periodic INR monitoring according to their clinical plan.',
    pharmacistSections: [
      MedicationSection(
        title: 'Read EPA + DHA, not “fish oil”',
        body:
            'The front-label oil weight can greatly exceed the actual EPA+DHA dose. Counsel from the Supplement Facts panel.',
        priority: ClinicalPriority.important,
      ),
      MedicationSection(
        title: 'Bleeding interaction context',
        body:
            'High doses can have antiplatelet effects. Most studies have not shown clinically significant bleeding at common studied doses, but anticoagulant users still require review and product-label monitoring.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يوفر أحماض omega-3 مثل EPA وDHA، وقد يُستخدم كمكمل غذائي.',
      howToUseAr: 'اقرأ كمية EPA + DHA نفسها، وليس فقط رقم “fish oil” على واجهة العبوة.',
      timingAr: 'يمكن أخذه مع وجبة إذا سبب تجشؤًا أو انزعاجًا بالمعدة.',
      commonActionableAr: 'قد يسبب طعمًا/تجشؤًا سمكيًا أو انزعاجًا هضميًا.',
      importantAr: 'إذا تستخدم warfarin أو مميع دم آخر، أخبر الصيدلي قبل الجرعات العالية.',
      teachBackAr: 'كم mg من EPA وDHA يعطي منتجك في الجرعة اليومية؟',
    ),
  ),
  SupplementProfile(
    id: 'creatine-monohydrate',
    group: 'Performance & specialty',
    name: 'Creatine Monohydrate',
    subtitle: 'Most studied creatine form for high-intensity performance',
    formulation: 'Powder, capsules and combination sports products',
    howToTakeEn:
        'Creatine monohydrate is the best-studied form. A common maintenance approach in healthy adults is 3–5 g daily; an optional loading protocol used in studies is about 20 g/day divided into four 5 g doses for 5–7 days before maintenance.',
    formulationAlert:
        'More expensive creatine salts/esters have not been proven superior to creatine monohydrate for raising muscle creatine or performance.',
    sourceLabel: 'NIH ODS Exercise and Athletic Performance Health Professional Fact Sheet',
    useBasis: 'Performance supplement for high-intensity/intermittent activity; not required for general health',
    monitoringEn:
        'Healthy adults generally do not need routine laboratory monitoring for ordinary use. Kidney disease, pregnancy, significant comorbidity or use of potentially nephrotoxic medicines warrants clinician review before supplementation.',
    pharmacistSections: [
      MedicationSection(
        title: 'What it actually helps',
        body:
            'Evidence is strongest for strength, power and repeated high-intensity activity, not endurance performance or “fat burning.”',
      ),
      MedicationSection(
        title: 'Expected weight change',
        body:
            'A 1–2 kg increase in body weight can occur, largely from water retention and training-related changes. Explain this before use so it is not mistaken for fat gain.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'قد يساعد على القوة والأداء في التمارين عالية الشدة والمتكررة؛ فائدته أقل لرياضات التحمل.',
      howToUseAr: 'Creatine monohydrate هو الأكثر دراسة. كثير من الناس يستخدمون 3–5 g يوميًا؛ مرحلة التحميل ليست ضرورية للجميع.',
      timingAr: 'الاستمرار اليومي أهم من ساعة محددة خلال اليوم.',
      commonActionableAr: 'قد يزيد الوزن 1–2 kg بسبب احتباس الماء وليس بالضرورة زيادة دهون.',
      importantAr: 'لا تدفع أكثر لمجرد أن المنتج يسمى buffered أو ester؛ لم يثبت أنه أفضل من monohydrate.',
      seekHelpAr: 'إذا لديك مرض كلوي أو حمل أو أمراض مزمنة مهمة، راجع الطبيب/الصيدلي قبل الاستخدام.',
      teachBackAr: 'أي شكل creatine تستخدم، وكم غرام في الجرعة اليومية؟',
    ),
  ),

];
