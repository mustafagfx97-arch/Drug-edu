import '../domain/supplement_decision_models.dart';

const supplementDecisionPrompts = <SupplementDecisionPrompt>[
  SupplementDecisionPrompt(
    flag: SupplementDecisionFlag.healthyWellnessOnly,
    titleAr: 'أنا بصحة جيدة وأبحث عن مكمل عام فقط',
    titleEn: 'Healthy / wellness only',
    detailAr:
        'لا توجد أعراض واضحة، ولا نقص مثبت، ولا حالة خاصة تفرض مكملًا محددًا.',
  ),
  SupplementDecisionPrompt(
    flag: SupplementDecisionFlag.planningOrCouldBecomePregnant,
    titleAr: 'يوجد احتمال حمل أو تخطيط للحمل',
    titleEn: 'Planning or could become pregnant',
    detailAr:
        'هذا يغيّر قرار حمض الفوليك وبعض مكونات الـ prenatal ويحتاج تجنب التكرار والجرعات العالية غير الضرورية.',
  ),
  SupplementDecisionPrompt(
    flag: SupplementDecisionFlag.breastfedOrPartiallyBreastfedInfant,
    titleAr: 'رضيع يعتمد كليًا أو جزئيًا على حليب الأم',
    titleEn: 'Breastfed / partially breastfed infant',
    detailAr:
        'يحتاج مسارًا خاصًا لفيتامين D مع التحقق من تركيز القطرات وعدم نسخ عدد القطرات بين المنتجات.',
  ),
  SupplementDecisionPrompt(
    flag: SupplementDecisionFlag.strictVegan,
    titleAr: 'نظام نباتي صارم (Vegan)',
    titleEn: 'Strict vegan diet',
    detailAr:
        'فيتامين B12 يحتاج مصدرًا موثوقًا من غذاء مدعّم أو مكمل، مع تقييم موجّه إذا وُجدت أعراض أو عوامل خطر.',
  ),
  SupplementDecisionPrompt(
    flag: SupplementDecisionFlag.age75Plus,
    titleAr: 'العمر 75 سنة أو أكثر',
    titleEn: 'Age 75 years or older',
    detailAr:
        'العمر يغيّر بعض قرارات الوقاية، ومنها توصيات حديثة تخص فيتامين D.',
  ),
  SupplementDecisionPrompt(
    flag: SupplementDecisionFlag.knownDeficiency,
    titleAr: 'يوجد نقص مثبت بتحليل أو تشخيص',
    titleEn: 'Known deficiency',
    detailAr:
        'العلاج هنا ليس “wellness supplement”: نحتاج جرعة علاجية، سبب النقص، مدة، ومتابعة مناسبة.',
  ),
  SupplementDecisionPrompt(
    flag: SupplementDecisionFlag.symptomsOrDeficiencyRisk,
    titleAr: 'توجد أعراض أو عوامل تجعل النقص محتملًا',
    titleEn: 'Symptoms or deficiency risk',
    detailAr:
        'مثل فقر الدم، أعراض عصبية، تغذية محدودة، نزف، أو تاريخ يجعل الفحص الموجّه منطقيًا.',
  ),
  SupplementDecisionPrompt(
    flag: SupplementDecisionFlag.malabsorptionOrBariatricSurgery,
    titleAr: 'سوء امتصاص أو جراحة سمنة/معدة/أمعاء',
    titleEn: 'Malabsorption / bariatric surgery',
    detailAr:
        'الاحتياجات والتحاليل تختلف حسب السبب ونوع العملية، لذلك لا يُستخدم جدول واحد للجميع.',
  ),
  SupplementDecisionPrompt(
    flag: SupplementDecisionFlag.kidneyDisease,
    titleAr: 'مرض كلوي أو مشكلة في وظائف الكلى',
    titleEn: 'Kidney disease',
    detailAr:
        'المغنيسيوم والبوتاسيوم وبعض المعادن قد تتراكم أو تصبح خطرة؛ يلزم ربط القرار بوظيفة الكلى والتحاليل والأدوية.',
  ),
  SupplementDecisionPrompt(
    flag: SupplementDecisionFlag.prescriptionMedicines,
    titleAr: 'يستخدم أدوية بوصفة طبية',
    titleEn: 'Uses prescription medicines',
    detailAr:
        'نراجع التداخلات والفصل الزمني ومخاطر النزف والبوتاسيوم وامتصاص الأدوية قبل اختيار المكمل.',
  ),
  SupplementDecisionPrompt(
    flag: SupplementDecisionFlag.multipleSupplements,
    titleAr: 'يستخدم أكثر من مكمل أو multivitamin',
    titleEn: 'Uses multiple supplements',
    detailAr:
        'يجب جمع الجرعات الفعلية لكل مكوّن لكشف التكرار وتجاوز الحدود العليا والتداخلات المخفية.',
  ),
];

const supplementLabRules = <SupplementLabRule>[
  SupplementLabRule(
    titleAr: 'لا تبدأ بـ “فحص كل الفيتامينات”',
    titleEn: 'Do not order a generic vitamin panel',
    bodyAr:
        'التحاليل تُختار حسب السؤال السريري. الشخص السليم بلا أعراض لا يحتاج تلقائيًا باقة واسعة من تحاليل الفيتامينات قبل تناول أي مكمل.',
    clinicalNoteEn:
        'Use symptom-, diet-, disease-, medication- and life-stage driven testing rather than broad low-yield screening.',
    sourceLabel: 'NIH Office of Dietary Supplements',
  ),
  SupplementLabRule(
    titleAr: 'Vitamin D: الفحص ليس روتينيًا للأصحاء',
    titleEn: 'Vitamin D testing is targeted',
    bodyAr:
        'في البالغين الأصحاء، لا يُطلب 25-OH vitamin D بشكل روتيني فقط لأن الشخص يريد مكملًا. يصبح الفحص منطقيًا عند وجود سبب سريري مستقل مثل اضطراب الكالسيوم أو سياق علاجي/مرضي مناسب.',
    clinicalNoteEn:
        'The 2024 Endocrine Society guideline suggests against routine 25(OH)D screening in healthy adults.',
    sourceLabel: 'Endocrine Society Vitamin D Guideline, 2024',
  ),
  SupplementLabRule(
    titleAr: 'عند الاشتباه بالنقص: اختبر ما سيغيّر القرار',
    titleEn: 'When deficiency is plausible, test to answer a question',
    bodyAr:
        'مثال عملي: الاشتباه بنقص الحديد يوجّه إلى CBC و ferritin وما يلزم حسب السبب؛ الاشتباه بنقص B12 يوجّه إلى تقييم B12 مع اختبارات إضافية عند الحاجة. لا نعطي علاجًا طويلًا بلا سبب ومتابعة.',
    clinicalNoteEn:
        'Exact laboratory work-up depends on the suspected nutrient, inflammation, symptoms and underlying cause.',
    sourceLabel: 'NIH ODS nutrient fact sheets + condition-specific evaluation',
  ),
];

List<SupplementDecisionAction> evaluateSupplementDecision(
  Set<SupplementDecisionFlag> flags,
) {
  final actions = <SupplementDecisionAction>[
    const SupplementDecisionAction(
      id: 'food-first',
      tier: SupplementDecisionTier.foundation,
      titleAr: 'ابدأ بالسؤال: هل يوجد سبب حقيقي للمكمل؟',
      titleEn: 'Food first, supplement for a defined gap',
      patientActionAr:
          'المكمل لا يعوّض غذاءً متنوعًا ولا علاجًا موصوفًا. حدّد الهدف أولًا: وقاية موصى بها، نقص مثبت، خطر واضح، أو حاجة مرتبطة بمرحلة عمرية/حمل/حمية.',
      clinicalNoteEn:
          'NIH ODS emphasizes food first when possible and warns against using supplements as substitutes for medicines or a healthful diet.',
      sourceLabel: 'NIH Office of Dietary Supplements',
    ),
  ];

  if (flags.isEmpty ||
      flags.contains(SupplementDecisionFlag.healthyWellnessOnly)) {
    actions.add(
      const SupplementDecisionAction(
        id: 'healthy-no-panel',
        tier: SupplementDecisionTier.testFirst,
        titleAr: 'لا يوجد “تحليل مكملات” روتيني للشخص السليم',
        titleEn: 'No automatic broad lab panel',
        patientActionAr:
            'إذا كنت بصحة جيدة ولا توجد أعراض أو عوامل خطر، لا تبدأ سلسلة تحاليل واسعة ولا جرعات عالية لمجرد “الاحتياط”. راجع الغذاء والاحتياج الفعلي أولًا.',
        clinicalNoteEn:
            'Avoid indiscriminate micronutrient panels in asymptomatic low-risk adults. Testing should be driven by a clinical question.',
        sourceLabel: 'NIH ODS + Endocrine Society 2024 (vitamin D)',
      ),
    );
  }

  if (flags.contains(
    SupplementDecisionFlag.planningOrCouldBecomePregnant,
  )) {
    actions.add(
      const SupplementDecisionAction(
        id: 'folic-acid-preconception',
        tier: SupplementDecisionTier.preventive,
        titleAr: 'حمض الفوليك: استثناء وقائي واضح',
        titleEn: 'Folic acid is a clear preventive recommendation',
        patientActionAr:
            'إذا كان الحمل مخططًا أو ممكنًا: استخدمي يوميًا مكملًا يحتوي 400–800 mcg من folic acid، ويفضل البدء قبل الحمل بشهر على الأقل والاستمرار خلال أول 2–3 أشهر. الحالات عالية الخطورة تحتاج خطة مختلفة من الطبيب.',
        clinicalNoteEn:
            'USPSTF Grade A: 0.4–0.8 mg folic acid daily for persons planning or capable of pregnancy; higher-risk situations are outside the routine pathway.',
        sourceLabel: 'USPSTF Folic Acid Recommendation, 2023',
      ),
    );
  }

  if (flags.contains(
    SupplementDecisionFlag.breastfedOrPartiallyBreastfedInfant,
  )) {
    actions.add(
      const SupplementDecisionAction(
        id: 'infant-vitamin-d',
        tier: SupplementDecisionTier.preventive,
        titleAr: 'الرضيع: Vitamin D 400 IU يوميًا',
        titleEn: 'Breastfed infants need vitamin D',
        patientActionAr:
            'للرضيع الذي يعتمد كليًا أو جزئيًا على حليب الأم: 400 IU من vitamin D يوميًا بدءًا من الأيام الأولى للحياة. افحص تركيز المنتج بوحدة IU لكل قطرة أو mL قبل إعطاء الجرعة.',
        clinicalNoteEn:
            'CDC 2026: breastfed and partially breastfed infants consuming <32 oz formula/day need an additional vitamin D source; 400 IU/day is recommended.',
        sourceLabel: 'CDC Vitamin D and Breastfeeding, 2026',
      ),
    );
  }

  if (flags.contains(SupplementDecisionFlag.strictVegan)) {
    actions.add(
      const SupplementDecisionAction(
        id: 'vegan-b12',
        tier: SupplementDecisionTier.preventive,
        titleAr: 'النظام النباتي الصارم: تأكد من مصدر B12',
        titleEn: 'Strict vegan diets need a reliable B12 source',
        patientActionAr:
            'لا تعتمد على الأغذية النباتية غير المدعّمة لتوفير B12. استخدم غذاءً مدعّمًا بكمية موثوقة أو مكملًا مناسبًا، واطلب تقييمًا إذا ظهرت أعراض أو كانت هناك عوامل امتصاص سيئة.',
        clinicalNoteEn:
            'NIH ODS notes that vitamin B12 occurs naturally in animal foods; vegans need fortified foods or supplements as a reliable source.',
        sourceLabel: 'NIH ODS Vitamin B12',
      ),
    );
  }

  if (flags.contains(SupplementDecisionFlag.age75Plus)) {
    actions.add(
      const SupplementDecisionAction(
        id: 'age-75-vitamin-d',
        tier: SupplementDecisionTier.preventive,
        titleAr: 'عمر 75+: Vitamin D يحتاج مسارًا مختلفًا',
        titleEn: 'Age 75+: vitamin D guidance differs',
        patientActionAr:
            'توجد توصية حديثة تفضّل إعطاء vitamin D بشكل تجريبي/وقائي لدى من هم 75 سنة فأكثر، مع تفضيل جرعات يومية منخفضة بدل الجرعات الكبيرة المتباعدة؛ ولا يلزم فحص 25-OH-D روتينيًا لمجرد بدء هذا المسار.',
        clinicalNoteEn:
            'Endocrine Society 2024 suggests empiric vitamin D in adults ≥75 years and suggests against routine 25(OH)D testing.',
        sourceLabel: 'Endocrine Society Vitamin D Guideline, 2024',
      ),
    );
  }

  if (flags.contains(SupplementDecisionFlag.knownDeficiency)) {
    actions.add(
      const SupplementDecisionAction(
        id: 'known-deficiency-treatment',
        tier: SupplementDecisionTier.clinicianReview,
        titleAr: 'النقص المثبت يحتاج علاجًا ومتابعة، لا “جرعة Wellness”',
        titleEn: 'Treat confirmed deficiency as treatment',
        patientActionAr:
            'اعرف سبب النقص، الجرعة العلاجية، المدة، وما التحليل أو العلامة التي ستثبت الاستجابة. لا تستمر على جرعة علاجية إلى ما لا نهاية من دون مراجعة.',
        clinicalNoteEn:
            'Therapeutic replacement should be nutrient- and cause-specific and include a follow-up endpoint.',
        sourceLabel: 'Nutrient-specific NIH ODS / clinical guidance',
      ),
    );
  }

  if (flags.contains(SupplementDecisionFlag.symptomsOrDeficiencyRisk)) {
    actions.add(
      const SupplementDecisionAction(
        id: 'targeted-labs',
        tier: SupplementDecisionTier.testFirst,
        titleAr: 'الأعراض أو عوامل الخطر = تحاليل موجّهة',
        titleEn: 'Symptoms/risk should drive targeted testing',
        patientActionAr:
            'بدل اختيار مكمل عشوائي، حدّد النقص المحتمل واختبر ما سيغيّر القرار. فقر الدم، الخدر، ضعف الامتصاص أو النزف لا تُعالج تلقائيًا بعلبة multivitamin.',
        clinicalNoteEn:
            'Use a problem-oriented work-up. A supplement should not delay evaluation of an important underlying cause.',
        sourceLabel: 'NIH ODS + condition-specific evaluation',
      ),
    );
  }

  if (flags.contains(
    SupplementDecisionFlag.malabsorptionOrBariatricSurgery,
  )) {
    actions.add(
      const SupplementDecisionAction(
        id: 'malabsorption-bariatric',
        tier: SupplementDecisionTier.clinicianReview,
        titleAr: 'سوء الامتصاص/جراحة السمنة: لا تستخدم جدولًا عامًا',
        titleEn: 'Malabsorption and bariatric surgery need protocol-based care',
        patientActionAr:
            'نوع العملية أو سبب سوء الامتصاص يحدد ما يحتاجه المريض من مكملات وتحاليل ومتابعة. استخدم بروتوكول الحالة بدل اقتراح مكمل واحد للجميع.',
        clinicalNoteEn:
            'Requirements differ substantially by anatomy, procedure, disease and time since surgery; detailed pathways will live in the condition-specific module.',
        sourceLabel: 'Procedure/disease-specific guideline pathway',
      ),
    );
  }

  if (flags.contains(SupplementDecisionFlag.kidneyDisease)) {
    actions.add(
      const SupplementDecisionAction(
        id: 'kidney-mineral-lock',
        tier: SupplementDecisionTier.clinicianReview,
        titleAr: 'مرض الكلى: لا تبدأ المعادن عشوائيًا',
        titleEn: 'Kidney disease changes mineral safety',
        patientActionAr:
            'لا تبدأ potassium أو magnesium أو جرعات عالية من المعادن من نفسك. راجع وظائف الكلى، الإلكتروليتات، الأدوية، والسبب قبل اختيار الجرعة.',
        clinicalNoteEn:
            'Reduced renal clearance can materially change potassium and magnesium safety; CKD mineral-bone disease also changes calcium/phosphate decisions.',
        sourceLabel: 'Nutrient-specific guidance + kidney disease pathway',
      ),
    );
  }

  if (flags.contains(SupplementDecisionFlag.prescriptionMedicines)) {
    actions.add(
      const SupplementDecisionAction(
        id: 'medication-interaction-review',
        tier: SupplementDecisionTier.productSafety,
        titleAr: 'الأدوية أولًا: راجع التداخلات قبل شراء المكمل',
        titleEn: 'Medication interaction review',
        patientActionAr:
            'أدخل قائمة الأدوية كاملة قبل اختيار المكمل. بعض المعادن تقلل امتصاص أدوية مهمة، وبعض المكملات تزيد النزف أو البوتاسيوم أو تؤثر في التحاليل.',
        clinicalNoteEn:
            'The final app will perform ingredient-level checks rather than treating a multivitamin as one ingredient.',
        sourceLabel: 'NIH ODS + product-specific medicine labeling',
      ),
    );
  }

  if (flags.contains(SupplementDecisionFlag.multipleSupplements)) {
    actions.add(
      const SupplementDecisionAction(
        id: 'duplicate-intake-review',
        tier: SupplementDecisionTier.productSafety,
        titleAr: 'اجمع الجرعات من كل المنتجات قبل الحكم',
        titleEn: 'Check total intake and duplication',
        patientActionAr:
            'صوّر أو أدخل Supplement Facts لكل منتج. نجمع vitamin D، iron، zinc، magnesium، vitamin A وغيرها عبر كل المنتجات قبل تحديد إن كانت الجرعة مناسبة.',
        clinicalNoteEn:
            'Duplicate ingredients are a major practical source of unnecessary exposure. Compare total intake with age/life-stage requirements and ULs when applicable.',
        sourceLabel: 'NIH ODS Dietary Reference Intakes / UL framework',
      ),
    );
  }

  return actions;
}
