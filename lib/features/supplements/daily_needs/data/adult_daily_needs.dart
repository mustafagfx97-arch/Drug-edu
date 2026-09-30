import '../domain/daily_needs_models.dart';

bool supportsAdultLifeStage(AdultDailyNeedInput input) {
  final reproductiveAge =
      input.ageBand == AdultAgeBand.age19to30 ||
      input.ageBand == AdultAgeBand.age31to50;
  return input.sex == PatientSex.female && reproductiveAge;
}

List<DailyNeedItem> adultDailyNeeds(AdultDailyNeedInput input) {
  final stageSupported = supportsAdultLifeStage(input);
  final pregnant =
      stageSupported && input.lifeStage == AdultLifeStage.pregnant;
  final lactating =
      stageSupported && input.lifeStage == AdultLifeStage.lactating;

  final vitaminA = pregnant
      ? 770.0
      : lactating
          ? 1300.0
          : input.sex == PatientSex.male
              ? 900.0
              : 700.0;

  final vitaminCBase = pregnant
      ? 85.0
      : lactating
          ? 120.0
          : input.sex == PatientSex.male
              ? 90.0
              : 75.0;
  final vitaminC = vitaminCBase + (input.smoker ? 35.0 : 0.0);

  final vitaminD =
      input.ageBand == AdultAgeBand.age71plus ? 800.0 : 600.0;

  final calcium = switch (input.ageBand) {
    AdultAgeBand.age19to30 => 1000.0,
    AdultAgeBand.age31to50 => 1000.0,
    AdultAgeBand.age51to70 =>
      input.sex == PatientSex.female ? 1200.0 : 1000.0,
    AdultAgeBand.age71plus => 1200.0,
  };

  final iron = pregnant
      ? 27.0
      : lactating
          ? 9.0
          : input.sex == PatientSex.male
              ? 8.0
              : (input.ageBand == AdultAgeBand.age19to30 ||
                      input.ageBand == AdultAgeBand.age31to50)
                  ? 18.0
                  : 8.0;

  final magnesium = pregnant
      ? input.ageBand == AdultAgeBand.age19to30
          ? 350.0
          : 360.0
      : lactating
          ? input.ageBand == AdultAgeBand.age19to30
              ? 310.0
              : 320.0
          : input.sex == PatientSex.male
              ? input.ageBand == AdultAgeBand.age19to30
                  ? 400.0
                  : 420.0
              : input.ageBand == AdultAgeBand.age19to30
                  ? 310.0
                  : 320.0;

  final zinc = pregnant
      ? 11.0
      : lactating
          ? 12.0
          : input.sex == PatientSex.male
              ? 11.0
              : 8.0;

  final vitaminB12 = pregnant
      ? 2.6
      : lactating
          ? 2.8
          : 2.4;

  final folate = pregnant
      ? 600.0
      : lactating
          ? 500.0
          : 400.0;

  final iodine = pregnant
      ? 220.0
      : lactating
          ? 290.0
          : 150.0;

  final selenium = pregnant
      ? 60.0
      : lactating
          ? 70.0
          : 55.0;

  final copper = pregnant
      ? 1000.0
      : lactating
          ? 1300.0
          : 900.0;

  final vitaminK =
      input.sex == PatientSex.male && !pregnant && !lactating ? 120.0 : 90.0;

  return [
    DailyNeedItem(
      id: 'vitamin-a',
      nameEn: 'Vitamin A',
      nameAr: 'فيتامين A',
      amount: vitaminA,
      unit: 'mcg RAE/day',
      referenceType: 'RDA',
      upperLimit: '3,000 mcg RAE/day',
      upperLimitScope: 'Preformed vitamin A only (retinol/retinyl esters).',
      foodFirstAr:
          'يُحسب الاحتياج من الطعام والمكمل معًا. الخضار الملونة والورقية تعطي provitamin A، بينما المنتجات الحيوانية قد تعطي preformed vitamin A.',
      supplementRuleAr:
          'لا تُحوّل الـRDA تلقائيًا إلى جرعة مكمل. الحذر أعلى مع preformed vitamin A، خصوصًا عند الحمل أو احتمال الحمل.',
      labRuleAr:
          'لا يوجد فحص روتيني للشخص السليم لمجرد استخدام مكمل. التقييم المخبري يكون عند الاشتباه بنقص/سوء امتصاص أو متابعة متخصصة.',
      sourceLabel: 'NIH ODS · Vitamin A and Carotenoids',
    ),
    DailyNeedItem(
      id: 'vitamin-c',
      nameEn: 'Vitamin C',
      nameAr: 'فيتامين C',
      amount: vitaminC,
      unit: 'mg/day',
      referenceType: 'RDA',
      upperLimit: '2,000 mg/day',
      upperLimitScope: 'Total intake from food + supplements for adults.',
      foodFirstAr:
          'الفواكه والخضار عادةً قادرة على تغطية الاحتياج اليومي. المدخنون يحتاجون 35 mg/day إضافية فوق القيمة الأساسية.',
      supplementRuleAr:
          'الجرعات العالية ليست مطلوبة لمجرد الوقاية العامة. استخدم المكمل لسد فجوة غذائية أو لسبب سريري واضح.',
      labRuleAr:
          'قياس vitamin C ليس فحص wellness روتينيًا؛ يُستخدم في حالات مختارة عندما يكون النقص السريري محتملًا.',
      sourceLabel: 'NIH ODS · Vitamin C',
    ),
    DailyNeedItem(
      id: 'vitamin-d',
      nameEn: 'Vitamin D',
      nameAr: 'فيتامين D',
      amount: vitaminD,
      unit: 'IU/day',
      referenceType: 'RDA',
      upperLimit: '4,000 IU/day (100 mcg/day)',
      upperLimitScope: 'Total daily intake for adults.',
      foodFirstAr:
          'هذه قيمة الاحتياج اليومي المرجعي وليست جرعة علاج نقص. الغذاء والتعرّض للشمس والسياق السريري يؤثرون في الخطة.',
      supplementRuleAr:
          'للشخص السليم لا تعني RDA أن عليه أخذ 600 أو 800 IU كحبّة إذا كان مدخوله كافيًا؛ المكمل يغطّي الفجوة أو الاستطباب.',
      labRuleAr:
          'لا يُنصح بفحص 25-OH-D روتينيًا للبالغ السليم لمجرد الرغبة بالمكمل؛ الفحص يصبح موجّهًا حسب الحالة السريرية.',
      sourceLabel: 'NIH ODS · Vitamin D + Endocrine Society 2024',
    ),
    DailyNeedItem(
      id: 'calcium',
      nameEn: 'Calcium',
      nameAr: 'الكالسيوم',
      amount: calcium,
      unit: 'mg/day',
      referenceType: 'RDA',
      upperLimit: input.ageBand == AdultAgeBand.age19to30 ||
              input.ageBand == AdultAgeBand.age31to50
          ? '2,500 mg/day'
          : '2,000 mg/day',
      upperLimitScope: 'Total intake from food + supplements.',
      foodFirstAr:
          'احسب الكالسيوم من الغذاء أولًا؛ الحليب/اللبن/الجبن وبعض الأغذية المدعّمة والأسماك مع العظام قد تغطي جزءًا كبيرًا من الهدف.',
      supplementRuleAr:
          'المكمل يكمّل الفجوة بين الغذاء والهدف اليومي، وليس بالضرورة أن يساوي كامل الـRDA.',
      labRuleAr:
          'Serum calcium لا يقيس كفاية تناول الكالسيوم الغذائي بسبب التنظيم المحكم؛ اطلبه عند سؤال سريري مثل اضطراب الكالسيوم/الكلى/جارات الدرق.',
      sourceLabel: 'NIH ODS · Calcium',
    ),
    DailyNeedItem(
      id: 'iron',
      nameEn: 'Iron',
      nameAr: 'الحديد',
      amount: iron,
      unit: 'mg/day',
      referenceType: 'RDA',
      upperLimit: '45 mg/day',
      upperLimitScope:
          'Total intake in healthy adults; therapeutic iron can exceed this under clinical supervision.',
      foodFirstAr:
          'الحديد الغذائي يختلف في الامتصاص؛ heme iron يُمتص أفضل من nonheme iron، وvitamin C يساعد امتصاص nonheme iron.',
      supplementRuleAr:
          'لا تستخدم جرعة علاجية من الحديد لمجرد أن الـRDA مرتفعة. الوقاية والعلاج والنقص المثبت ثلاث خطط مختلفة.',
      labRuleAr:
          'عند الاشتباه بالنقص استخدم تقييمًا موجّهًا مثل CBC وferritin وما يلزم حسب السبب؛ ferritin قد يرتفع مع الالتهاب.',
      sourceLabel: 'NIH ODS · Iron',
    ),
    DailyNeedItem(
      id: 'magnesium',
      nameEn: 'Magnesium',
      nameAr: 'المغنيسيوم',
      amount: magnesium,
      unit: 'mg/day',
      referenceType: 'RDA',
      upperLimit: '350 mg/day',
      upperLimitScope:
          'Supplemental magnesium only; magnesium naturally present in food is not included in this UL.',
      foodFirstAr:
          'المكسرات والبذور والبقول والحبوب الكاملة والخضار الورقية مصادر غذائية مهمة؛ الـRDA يشمل الطعام + المكمل.',
      supplementRuleAr:
          'لا تقارن أملاح المغنيسيوم بوزن الملح فقط؛ عند استخدام مكمل نحتاج لاحقًا حساب elemental magnesium والهدف السريري.',
      labRuleAr:
          'Serum magnesium هو الاختبار الأكثر استخدامًا لكنه لا يعكس مخزون الجسم بدقة؛ اربطه بالسياق السريري ووظيفة الكلى.',
      sourceLabel: 'NIH ODS · Magnesium',
    ),
    DailyNeedItem(
      id: 'zinc',
      nameEn: 'Zinc',
      nameAr: 'الزنك',
      amount: zinc,
      unit: 'mg/day',
      referenceType: 'RDA',
      upperLimit: '40 mg/day',
      upperLimitScope: 'Total intake from food + supplements for adults.',
      foodFirstAr:
          'اللحوم والمأكولات البحرية ومنتجات الألبان والحبوب المدعّمة مصادر جيدة؛ الأنظمة النباتية قد تحتاج انتباهًا للامتصاص.',
      supplementRuleAr:
          'الاستخدام المزمن بجرعات عالية قد يسبب copper deficiency؛ لا تجمع عدة منتجات زنك من دون حساب الإجمالي.',
      labRuleAr:
          'Serum/plasma zinc قد يساعد عند وجود خطر حقيقي لكنه يتأثر بالعمر والوقت والمرض والالتهاب ولا يطابق المدخول دائمًا.',
      sourceLabel: 'NIH ODS · Zinc',
    ),
    DailyNeedItem(
      id: 'vitamin-b12',
      nameEn: 'Vitamin B12',
      nameAr: 'فيتامين B12',
      amount: vitaminB12,
      unit: 'mcg/day',
      referenceType: 'RDA',
      upperLimit: 'No UL established',
      upperLimitScope:
          'No tolerable upper intake level has been established for vitamin B12.',
      foodFirstAr:
          'المصادر الطبيعية الأساسية حيوانية؛ النباتي الصارم يحتاج مصدرًا موثوقًا من غذاء مدعّم أو مكمل.',
      supplementRuleAr:
          'الاحتياج الغذائي الصغير لا يعني أن جرعة علاج النقص ستكون صغيرة؛ علاج سوء الامتصاص أو النقص المثبت مسار مختلف.',
      labRuleAr:
          'ابدأ serum/plasma B12 عند الاشتباه؛ إذا كانت النتيجة 150–399 pg/mL يمكن أن يساعد MMA في تأكيد النقص مع مراعاة القصور الكلوي.',
      sourceLabel: 'NIH ODS · Vitamin B12',
    ),
    DailyNeedItem(
      id: 'folate',
      nameEn: 'Folate',
      nameAr: 'الفولات',
      amount: folate,
      unit: 'mcg DFE/day',
      referenceType: 'RDA',
      upperLimit: '1,000 mcg/day',
      upperLimitScope:
          'Synthetic folic acid from supplements/fortified foods; natural food folate is not included in this UL.',
      foodFirstAr:
          'الهدف اليومي يُعبّر عنه بـDFE لأن امتصاص folic acid يختلف عن food folate.',
      supplementRuleAr:
          'الوقاية من neural-tube defects تستخدم folic acid بجرعة وقائية محددة؛ لا تخلط بين 400 mcg folic acid و400 mcg DFE.',
      labRuleAr:
          'لا تطيل high-dose folic acid عند macrocytosis أو أعراض عصبية دون تقييم B12 عند الحاجة.',
      sourceLabel: 'NIH ODS · Folate',
    ),
    DailyNeedItem(
      id: 'iodine',
      nameEn: 'Iodine',
      nameAr: 'اليود',
      amount: iodine,
      unit: 'mcg/day',
      referenceType: 'RDA',
      upperLimit: '1,100 mcg/day',
      upperLimitScope: 'Total intake from food + supplements for adults.',
      foodFirstAr:
          'الملح الميودن ومنتجات البحر ومنتجات الألبان قد تكون مصادر مهمة؛ محتوى kelp/seaweed قد يكون متغيرًا جدًا.',
      supplementRuleAr:
          'لا تستخدم جرعات kelp/iodine العالية كروتين؛ كل من النقص والزيادة قد يسبب اضطرابًا درقيًا.',
      labRuleAr:
          'Spot urinary iodine مفيد لتقييم السكان لكنه غير مناسب لتشخيص نقص اليود لشخص واحد؛ تقييم الغدة الدرقية يعتمد على السؤال السريري.',
      sourceLabel: 'NIH ODS · Iodine',
    ),
    DailyNeedItem(
      id: 'selenium',
      nameEn: 'Selenium',
      nameAr: 'السيلينيوم',
      amount: selenium,
      unit: 'mcg/day',
      referenceType: 'RDA',
      upperLimit: '400 mcg/day',
      upperLimitScope: 'Total intake from food + supplements for adults.',
      foodFirstAr:
          'عادةً يمكن تغطية الاحتياج من الغذاء؛ محتوى السيلينيوم في بعض الأغذية يعتمد على التربة والمصدر.',
      supplementRuleAr:
          'لا تستخدم high-dose selenium للشعر/المناعة كروتين؛ هامش الأمان أضيق مما يعتقد كثير من المرضى.',
      labRuleAr:
          'الاختبار ليس wellness routine؛ serum/plasma selenium يُستخدم في تقييم موجّه للنقص أو السمية مع مراعاة تأثير الالتهاب.',
      sourceLabel: 'NIH ODS · Selenium',
    ),
    DailyNeedItem(
      id: 'copper',
      nameEn: 'Copper',
      nameAr: 'النحاس',
      amount: copper,
      unit: 'mcg/day',
      referenceType: 'RDA',
      upperLimit: '10,000 mcg/day (10 mg/day)',
      upperLimitScope: 'Total intake from food + supplements for adults.',
      foodFirstAr:
          'المكسرات والبذور والأحشاء والمأكولات البحرية والحبوب الكاملة قد توفر النحاس غذائيًا.',
      supplementRuleAr:
          'لا تضف النحاس تلقائيًا إلا عند وجود سبب؛ وتذكّر أن الاستخدام المزمن للزنك بجرعات عالية قد يدفع نحو نقص النحاس.',
      labRuleAr:
          'تقييم النحاس مخبريًا ليس فحصًا عامًا روتينيًا؛ يُطلب عند اشتباه سريري أو اضطراب امتصاص/تعرض أو ضمن تقييم متخصص.',
      sourceLabel: 'NIH ODS · Copper',
    ),
    DailyNeedItem(
      id: 'vitamin-k',
      nameEn: 'Vitamin K',
      nameAr: 'فيتامين K',
      amount: vitaminK,
      unit: 'mcg/day',
      referenceType: 'AI',
      upperLimit: 'No UL established',
      upperLimitScope:
          'No UL established because available data are insufficient to define one.',
      foodFirstAr:
          'الخضار الورقية مصدر مهم لـK1؛ الهدف هو كفاية غذائية مستمرة وليس مطاردة رقم يومي بحبة.',
      supplementRuleAr:
          'مع warfarin يكون ثبات المدخول أهم من منع vitamin K تمامًا؛ لا تبدأ أو توقف مكملًا فجأة دون خطة anticoagulation.',
      labRuleAr:
          'لا يوجد vitamin K level روتيني لمعظم الناس؛ مع warfarin تكون متابعة INR هي الأداة العملية عند تغيّر المدخول.',
      sourceLabel: 'NIH ODS · Vitamin K',
    ),
  ];
}

const labNavigatorItems = <LabNavigatorItem>[
  LabNavigatorItem(
    id: 'vitamin-d',
    titleEn: 'Vitamin D',
    titleAr: 'فيتامين D',
    whenToTestAr:
        'لا تفحص كل شخص سليم يريد مكملًا. فكّر بالفحص عند وجود سؤال سريري مستقل مثل اضطراب العظام/الكالسيوم، سوء امتصاص، مرض كلوي/كبدي مختار، أو علاج نقص يحتاج متابعة.',
    whatToOrderAr:
        'عندما يكون الفحص مبررًا: 25-hydroxyvitamin D هو الاختبار المستخدم لتقييم الحالة؛ لا تستخدم 1,25-dihydroxyvitamin D كفحص روتيني لنقص vitamin D.',
    interpretationAr:
        'لا تجعل رقمًا واحدًا يولّد جرعة علاجية تلقائيًا؛ السياق والهدف العلاجي ونوع المريض مهمون.',
    sourceLabel: 'Endocrine Society 2024 + NIH ODS Vitamin D',
  ),
  LabNavigatorItem(
    id: 'iron',
    titleEn: 'Iron',
    titleAr: 'الحديد',
    whenToTestAr:
        'اختبر عند anemia أو أعراض/عوامل خطر مثل نزف، حيض غزير، حمل، تبرع متكرر، غذاء محدود أو سوء امتصاص.',
    whatToOrderAr:
        'CBC + ferritin غالبًا نقطة بداية عملية، مع transferrin saturation/iron studies واختبارات السبب حسب الحالة.',
    interpretationAr:
        'Ferritin هو مؤشر مهم للمخزون لكنه قد يرتفع مع الالتهاب؛ hemoglobin وحده لا يستبعد مرحلة مبكرة من نقص الحديد.',
    sourceLabel: 'NIH ODS · Iron',
  ),
  LabNavigatorItem(
    id: 'vitamin-b12',
    titleEn: 'Vitamin B12',
    titleAr: 'فيتامين B12',
    whenToTestAr:
        'اختبر عند macrocytosis/anemia، أعراض عصبية، vegan diet مع خطر، metformin/acid suppression طويل الأمد، pernicious anemia risk أو جراحة/مرض يؤثر في الامتصاص.',
    whatToOrderAr:
        'Serum/plasma B12؛ إذا كانت B12 بين 150–399 pg/mL فـMMA يمكن أن يساعد في تأكيد النقص.',
    interpretationAr:
        'MMA يرتفع أيضًا مع القصور الكلوي ويزداد مع العمر، لذلك لا تفسره خارج السياق.',
    sourceLabel: 'NIH ODS · Vitamin B12',
  ),
  LabNavigatorItem(
    id: 'calcium',
    titleEn: 'Calcium',
    titleAr: 'الكالسيوم',
    whenToTestAr:
        'لا تطلب serum calcium لمعرفة هل المريض يأكل كالسيوم كافيًا. اطلبه عند سؤال عن hypo/hypercalcemia، parathyroid disease، kidney disease أو أعراض مناسبة.',
    whatToOrderAr:
        'Total calcium مع albumin أو ionized calcium حسب السياق؛ وقد يلزم PTH/vitamin D/phosphate/renal function تبعًا للسؤال.',
    interpretationAr:
        'Serum calcium منظم بإحكام ولا يعكس المدخول الغذائي أو مخزون العظم بشكل مباشر.',
    sourceLabel: 'NIH ODS · Calcium',
  ),
  LabNavigatorItem(
    id: 'magnesium',
    titleEn: 'Magnesium',
    titleAr: 'المغنيسيوم',
    whenToTestAr:
        'اختبر عند arrhythmia، تشنجات/ضعف مع عوامل خطر، diarrhea مزمنة، أدوية تسبب خسارة Mg، alcohol use disorder، أو خطر تراكم مع قصور كلوي.',
    whatToOrderAr:
        'Serum magnesium هو الأكثر استخدامًا، مع electrolytes وrenal function حسب الحالة.',
    interpretationAr:
        'القيمة الطبيعية لا تستبعد انخفاض total-body magnesium لأن أقل من 1% من المغنيسيوم يوجد في المصل.',
    sourceLabel: 'NIH ODS · Magnesium',
  ),
  LabNavigatorItem(
    id: 'zinc',
    titleEn: 'Zinc',
    titleAr: 'الزنك',
    whenToTestAr:
        'لا تفحص zinc روتينيًا. استخدمه عندما توجد عوامل خطر أو علامات متوافقة مثل سوء امتصاص، تغذية شديدة التقييد، فقدان تذوق/شم أو poor wound healing ضمن سياق مناسب.',
    whatToOrderAr:
        'Serum/plasma zinc عندما يكون السؤال السريري مبررًا.',
    interpretationAr:
        'يتأثر بالوقت من اليوم والعمر والجنس والعدوى والالتهاب وفقدان الوزن، ولا يطابق المدخول الغذائي دائمًا.',
    sourceLabel: 'NIH ODS · Zinc',
  ),
  LabNavigatorItem(
    id: 'iodine',
    titleEn: 'Iodine',
    titleAr: 'اليود',
    whenToTestAr:
        'لا تستخدم فحص iodine عشوائيًا عند شخص واحد كفحص wellness؛ قيّم النظام الغذائي، الملح الميودن، المكملات، الحمل والسياق الدرقي.',
    whatToOrderAr:
        'Spot urinary iodine مناسب أكثر للمراقبة السكانية وليس لتشخيص نقص شخص واحد؛ الاختبارات الدرقية تُختار حسب المشكلة السريرية.',
    interpretationAr:
        'عينة بول واحدة تتغير بشدة مع المدخول القريب، لذلك لا تُفسّر كتشخيص فردي للنقص.',
    sourceLabel: 'NIH ODS · Iodine',
  ),
];
