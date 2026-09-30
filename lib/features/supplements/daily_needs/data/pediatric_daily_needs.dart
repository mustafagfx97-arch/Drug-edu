import '../domain/daily_needs_models.dart';

bool isInfantBand(PediatricAgeBand band) {
  return band == PediatricAgeBand.birthTo6Months ||
      band == PediatricAgeBand.age7To12Months;
}

bool supportsTeenLifeStage(PediatricDailyNeedInput input) {
  return input.ageBand == PediatricAgeBand.age14To18Years &&
      input.sex == PatientSex.female;
}

String _ulByAge(
  PediatricAgeBand ageBand, {
  required String infant0to6,
  required String infant7to12,
  required String age1to3,
  required String age4to8,
  required String age9to13,
  required String age14to18,
}) {
  return switch (ageBand) {
    PediatricAgeBand.birthTo6Months => infant0to6,
    PediatricAgeBand.age7To12Months => infant7to12,
    PediatricAgeBand.age1To3Years => age1to3,
    PediatricAgeBand.age4To8Years => age4to8,
    PediatricAgeBand.age9To13Years => age9to13,
    PediatricAgeBand.age14To18Years => age14to18,
  };
}

List<DailyNeedItem> pediatricDailyNeeds(PediatricDailyNeedInput input) {
  final teenLifeStage = supportsTeenLifeStage(input);
  final pregnant =
      teenLifeStage && input.lifeStage == PediatricLifeStage.pregnant;
  final lactating =
      teenLifeStage && input.lifeStage == PediatricLifeStage.lactating;

  double valueByAge({
    required double infant0to6,
    required double infant7to12,
    required double age1to3,
    required double age4to8,
    required double age9to13,
    required double male14to18,
    required double female14to18,
    double? pregnant14to18,
    double? lactating14to18,
  }) {
    return switch (input.ageBand) {
      PediatricAgeBand.birthTo6Months => infant0to6,
      PediatricAgeBand.age7To12Months => infant7to12,
      PediatricAgeBand.age1To3Years => age1to3,
      PediatricAgeBand.age4To8Years => age4to8,
      PediatricAgeBand.age9To13Years => age9to13,
      PediatricAgeBand.age14To18Years => pregnant && pregnant14to18 != null
          ? pregnant14to18
          : lactating && lactating14to18 != null
              ? lactating14to18
              : input.sex == PatientSex.male
                  ? male14to18
                  : female14to18,
    };
  }

  final vitaminA = valueByAge(
    infant0to6: 400,
    infant7to12: 500,
    age1to3: 300,
    age4to8: 400,
    age9to13: 600,
    male14to18: 900,
    female14to18: 700,
    pregnant14to18: 750,
    lactating14to18: 1200,
  );
  final vitaminC = valueByAge(
    infant0to6: 40,
    infant7to12: 50,
    age1to3: 15,
    age4to8: 25,
    age9to13: 45,
    male14to18: 75,
    female14to18: 65,
    pregnant14to18: 80,
    lactating14to18: 115,
  );
  final vitaminD = valueByAge(
    infant0to6: 400,
    infant7to12: 400,
    age1to3: 600,
    age4to8: 600,
    age9to13: 600,
    male14to18: 600,
    female14to18: 600,
    pregnant14to18: 600,
    lactating14to18: 600,
  );
  final calcium = valueByAge(
    infant0to6: 200,
    infant7to12: 260,
    age1to3: 700,
    age4to8: 1000,
    age9to13: 1300,
    male14to18: 1300,
    female14to18: 1300,
    pregnant14to18: 1300,
    lactating14to18: 1300,
  );
  final iron = valueByAge(
    infant0to6: 0.27,
    infant7to12: 11,
    age1to3: 7,
    age4to8: 10,
    age9to13: 8,
    male14to18: 11,
    female14to18: 15,
    pregnant14to18: 27,
    lactating14to18: 10,
  );
  final magnesium = valueByAge(
    infant0to6: 30,
    infant7to12: 75,
    age1to3: 80,
    age4to8: 130,
    age9to13: 240,
    male14to18: 410,
    female14to18: 360,
    pregnant14to18: 400,
    lactating14to18: 360,
  );
  final zinc = valueByAge(
    infant0to6: 2,
    infant7to12: 3,
    age1to3: 3,
    age4to8: 5,
    age9to13: 8,
    male14to18: 11,
    female14to18: 9,
    pregnant14to18: 12,
    lactating14to18: 13,
  );
  final b12 = valueByAge(
    infant0to6: 0.4,
    infant7to12: 0.5,
    age1to3: 0.9,
    age4to8: 1.2,
    age9to13: 1.8,
    male14to18: 2.4,
    female14to18: 2.4,
    pregnant14to18: 2.6,
    lactating14to18: 2.8,
  );
  final folate = valueByAge(
    infant0to6: 65,
    infant7to12: 80,
    age1to3: 150,
    age4to8: 200,
    age9to13: 300,
    male14to18: 400,
    female14to18: 400,
    pregnant14to18: 600,
    lactating14to18: 500,
  );
  final iodine = valueByAge(
    infant0to6: 110,
    infant7to12: 130,
    age1to3: 90,
    age4to8: 90,
    age9to13: 120,
    male14to18: 150,
    female14to18: 150,
    pregnant14to18: 220,
    lactating14to18: 290,
  );
  final selenium = valueByAge(
    infant0to6: 15,
    infant7to12: 20,
    age1to3: 20,
    age4to8: 30,
    age9to13: 40,
    male14to18: 55,
    female14to18: 55,
    pregnant14to18: 60,
    lactating14to18: 70,
  );

  final infantAi = isInfantBand(input.ageBand);

  return [
    DailyNeedItem(
      id: 'vitamin-a',
      nameEn: 'Vitamin A',
      nameAr: 'فيتامين A',
      amount: vitaminA,
      unit: 'mcg RAE/day',
      referenceType: infantAi ? 'AI' : 'RDA',
      upperLimit: _ulByAge(
        input.ageBand,
        infant0to6: '600 mcg RAE/day',
        infant7to12: '600 mcg RAE/day',
        age1to3: '600 mcg RAE/day',
        age4to8: '900 mcg RAE/day',
        age9to13: '1,700 mcg RAE/day',
        age14to18: '2,800 mcg RAE/day',
      ),
      upperLimitScope: 'Preformed vitamin A only.',
      foodFirstAr:
          'الهدف اليومي يشمل الغذاء. لا تعامل beta-carotene وpreformed retinol كأنهما الشيء نفسه عند تقييم السمية.',
      supplementRuleAr:
          'لا تعطِ vitamin A عالي الجرعة روتينيًا. الطفل الذي يأكل غذاءً متنوعًا لا يحتاج تلقائيًا مكمل vitamin A منفصل.',
      labRuleAr:
          'الفحص ليس routine wellness test؛ يُستخدم عند سوء امتصاص أو اشتباه سريري/تغذوي حقيقي.',
      sourceLabel: 'NIH ODS · Vitamin A and Carotenoids',
    ),
    DailyNeedItem(
      id: 'vitamin-c',
      nameEn: 'Vitamin C',
      nameAr: 'فيتامين C',
      amount: vitaminC,
      unit: 'mg/day',
      referenceType: infantAi ? 'AI' : 'RDA',
      upperLimit: _ulByAge(
        input.ageBand,
        infant0to6: 'No UL established',
        infant7to12: 'No UL established',
        age1to3: '400 mg/day',
        age4to8: '650 mg/day',
        age9to13: '1,200 mg/day',
        age14to18: '1,800 mg/day',
      ),
      upperLimitScope: 'Total intake; infant ULs are not established.',
      foodFirstAr:
          'الفواكه والخضار هي المصدر العملي الأول. الجرعات العالية ليست ضرورية للمناعة عند طفل سليم يتناول غذاءً كافيًا.',
      supplementRuleAr:
          'استخدم المكمل فقط لسد فجوة غذائية واضحة أو لسبب سريري؛ لا تستخدم megadose لمجرد “تقوية المناعة”.',
      labRuleAr:
          'Vitamin C level ليس فحصًا روتينيًا للأطفال؛ يُطلب في سياقات نقص شديد أو تغذية محدودة جدًا.',
      sourceLabel: 'NIH ODS · Vitamin C',
    ),
    DailyNeedItem(
      id: 'vitamin-d',
      nameEn: 'Vitamin D',
      nameAr: 'فيتامين D',
      amount: vitaminD,
      unit: 'IU/day',
      referenceType: infantAi ? 'AI' : 'RDA',
      upperLimit: _ulByAge(
        input.ageBand,
        infant0to6: '1,000 IU/day',
        infant7to12: '1,500 IU/day',
        age1to3: '2,500 IU/day',
        age4to8: '3,000 IU/day',
        age9to13: '4,000 IU/day',
        age14to18: '4,000 IU/day',
      ),
      upperLimitScope: 'Total daily intake for generally healthy children.',
      foodFirstAr:
          'Vitamin D حالة خاصة لأن الغذاء وحده قد لا يغطي الاحتياج، وقرار المكمل في الرضع يعتمد على نمط التغذية.',
      supplementRuleAr:
          'للرضع: استخدم قاعدة 400 IU/day حسب breast milk/formula intake الموضحة أعلى الصفحة. للأطفال الأكبر اتبع الوقاية أو الاستطباب السريري ولا تستخدم جرعة علاج نقص كجرعة يومية عامة.',
      labRuleAr:
          'لا تجعل فحص 25-OH-D شرطًا لكل طفل سليم قبل جرعة وقائية؛ الفحص يكون موجّهًا حسب الخطر/المرض.',
      sourceLabel: 'NIH ODS · Vitamin D + CDC 2026',
    ),
    DailyNeedItem(
      id: 'calcium',
      nameEn: 'Calcium',
      nameAr: 'الكالسيوم',
      amount: calcium,
      unit: 'mg/day',
      referenceType: infantAi ? 'AI' : 'RDA',
      upperLimit: _ulByAge(
        input.ageBand,
        infant0to6: '1,000 mg/day',
        infant7to12: '1,500 mg/day',
        age1to3: '2,500 mg/day',
        age4to8: '2,500 mg/day',
        age9to13: '3,000 mg/day',
        age14to18: '3,000 mg/day',
      ),
      upperLimitScope: 'Total intake from food + supplements.',
      foodFirstAr:
          'منتجات الألبان والأطعمة المدعمة والأسماك مع العظام وبعض الخضار تساعد على بلوغ الهدف، خصوصًا خلال نمو العظام السريع.',
      supplementRuleAr:
          'المكمل يغطي الفجوة فقط؛ لا تعطِ 1,300 mg supplement لمراهق لمجرد أن RDA = 1,300 mg/day.',
      labRuleAr:
          'Serum calcium لا يقيس كفاية الكالسيوم الغذائي؛ يُطلب عند مشكلة سريرية في calcium/PTH/kidney/bone metabolism.',
      sourceLabel: 'NIH ODS · Calcium',
    ),
    DailyNeedItem(
      id: 'iron',
      nameEn: 'Iron',
      nameAr: 'الحديد',
      amount: iron,
      unit: 'mg/day',
      referenceType: input.ageBand == PediatricAgeBand.birthTo6Months
          ? 'AI'
          : 'RDA',
      upperLimit: _ulByAge(
        input.ageBand,
        infant0to6: '40 mg/day',
        infant7to12: '40 mg/day',
        age1to3: '40 mg/day',
        age4to8: '40 mg/day',
        age9to13: '40 mg/day',
        age14to18: '45 mg/day',
      ),
      upperLimitScope:
          'Healthy-population UL; therapeutic iron may exceed it under clinician supervision.',
      foodFirstAr:
          'بعد نحو 6 أشهر يحتاج الرضيع إلى مصدر حديد خارج حليب الأم: أغذية غنية/مدعمة بالحديد أو مكمل عند الحاجة.',
      supplementRuleAr:
          'لا تحوّل RDA إلى iron drops تلقائيًا. طريقة التغذية، prematurity، التحاليل والأغذية المدعمة تغيّر القرار.',
      labRuleAr:
          'التقييم عند الاشتباه يشمل CBC وferritin وما يلزم حسب السبب؛ CDC يشير إلى فحص anemia حول عمر 12 شهرًا.',
      sourceLabel: 'NIH ODS · Iron + CDC Infant/Toddler Iron 2026',
    ),
    DailyNeedItem(
      id: 'magnesium',
      nameEn: 'Magnesium',
      nameAr: 'المغنيسيوم',
      amount: magnesium,
      unit: 'mg/day',
      referenceType: infantAi ? 'AI' : 'RDA',
      upperLimit: _ulByAge(
        input.ageBand,
        infant0to6: 'No supplemental UL established',
        infant7to12: 'No supplemental UL established',
        age1to3: '65 mg/day',
        age4to8: '110 mg/day',
        age9to13: '350 mg/day',
        age14to18: '350 mg/day',
      ),
      upperLimitScope:
          'Supplement/medication magnesium only; food magnesium is excluded.',
      foodFirstAr:
          'المكسرات والبذور والبقول والحبوب الكاملة والخضار الورقية مصادر مهمة عندما يكون العمر يسمح بها بشكل آمن.',
      supplementRuleAr:
          'لا تستخدم magnesium gummies أو powders كروتين بلا سبب، وانتبه لوظيفة الكلى وelemental magnesium.',
      labRuleAr:
          'Serum magnesium قد يساعد عند خطر حقيقي لكنه لا يعكس مخزون الجسم كاملًا.',
      sourceLabel: 'NIH ODS · Magnesium',
    ),
    DailyNeedItem(
      id: 'zinc',
      nameEn: 'Zinc',
      nameAr: 'الزنك',
      amount: zinc,
      unit: 'mg/day',
      referenceType:
          input.ageBand == PediatricAgeBand.birthTo6Months ? 'AI' : 'RDA',
      upperLimit: _ulByAge(
        input.ageBand,
        infant0to6: '4 mg/day',
        infant7to12: '5 mg/day',
        age1to3: '7 mg/day',
        age4to8: '12 mg/day',
        age9to13: '23 mg/day',
        age14to18: '34 mg/day',
      ),
      upperLimitScope: 'Total intake from food + supplements.',
      foodFirstAr:
          'اللحوم والمأكولات البحرية والبيض ومنتجات الألبان والبقول والحبوب المدعمة مصادر عملية.',
      supplementRuleAr:
          'تجنب chronic high-dose zinc لأنه قد يسبب copper deficiency؛ اجمع الزنك من كل gummies/multivitamins.',
      labRuleAr:
          'Serum/plasma zinc ليس فحصًا روتينيًا ويتأثر بالالتهاب والوقت وعوامل أخرى.',
      sourceLabel: 'NIH ODS · Zinc',
    ),
    DailyNeedItem(
      id: 'vitamin-b12',
      nameEn: 'Vitamin B12',
      nameAr: 'فيتامين B12',
      amount: b12,
      unit: 'mcg/day',
      referenceType: infantAi ? 'AI' : 'RDA',
      upperLimit: 'No UL established',
      upperLimitScope: 'No tolerable upper intake level established.',
      foodFirstAr:
          'B12 يوجد طبيعيًا في الأغذية الحيوانية؛ الطفل vegan يحتاج مصدرًا موثوقًا من غذاء مدعم أو مكمل.',
      supplementRuleAr:
          'الرضيع breastfed من أم vegan/vegetarian يحتاج تقييمًا خاصًا لخطر B12 ولا يكفي الاعتماد على هذا الجدول العام.',
      labRuleAr:
          'عند الاشتباه يُستخدم serum B12 وقد يلزم MMA في الحالات الحدودية، مع تفسيره حسب السياق.',
      sourceLabel: 'NIH ODS · Vitamin B12 + CDC maternal diet',
    ),
    DailyNeedItem(
      id: 'folate',
      nameEn: 'Folate',
      nameAr: 'الفولات',
      amount: folate,
      unit: 'mcg DFE/day',
      referenceType: infantAi ? 'AI' : 'RDA',
      upperLimit: _ulByAge(
        input.ageBand,
        infant0to6: 'No UL established',
        infant7to12: 'No UL established',
        age1to3: '300 mcg/day',
        age4to8: '400 mcg/day',
        age9to13: '600 mcg/day',
        age14to18: '800 mcg/day',
      ),
      upperLimitScope:
          'Synthetic folic acid from supplements/fortified foods; infant ULs are not established.',
      foodFirstAr:
          'الخضار الورقية والبقول والأطعمة المدعمة مصادر مهمة، والهدف معبّر عنه بـDFE.',
      supplementRuleAr:
          'لا تعطِ folic acid عالي الجرعة روتينيًا، وخصوصًا إذا كان هناك anemia أو أعراض عصبية تحتاج تقييم B12.',
      labRuleAr:
          'لا يحتاج الطفل السليم folate testing روتينيًا؛ الفحص يكون عند anemia أو سوء تغذية/امتصاص مناسب.',
      sourceLabel: 'NIH ODS · Folate',
    ),
    DailyNeedItem(
      id: 'iodine',
      nameEn: 'Iodine',
      nameAr: 'اليود',
      amount: iodine,
      unit: 'mcg/day',
      referenceType: infantAi ? 'AI' : 'RDA',
      upperLimit: _ulByAge(
        input.ageBand,
        infant0to6: 'No UL established',
        infant7to12: 'No UL established',
        age1to3: '200 mcg/day',
        age4to8: '300 mcg/day',
        age9to13: '600 mcg/day',
        age14to18: '900 mcg/day',
      ),
      upperLimitScope:
          'Total intake; formula and food should be the only iodine sources for infants unless medically directed.',
      foodFirstAr:
          'الملح الميودن والألبان والمأكولات البحرية قد تكون مصادر، لكن seaweed/kelp قد يعطي كميات غير متوقعة.',
      supplementRuleAr:
          'لا تستخدم iodine/kelp عالي الجرعة للطفل كروتين؛ النقص والزيادة كلاهما قد يؤذي الغدة الدرقية.',
      labRuleAr:
          'Spot urinary iodine لا يشخّص نقص فرد واحد بصورة موثوقة؛ قيّم السياق الغذائي والدرقي.',
      sourceLabel: 'NIH ODS · Iodine',
    ),
    DailyNeedItem(
      id: 'selenium',
      nameEn: 'Selenium',
      nameAr: 'السيلينيوم',
      amount: selenium,
      unit: 'mcg/day',
      referenceType: infantAi ? 'AI' : 'RDA',
      upperLimit: _ulByAge(
        input.ageBand,
        infant0to6: '45 mcg/day',
        infant7to12: '60 mcg/day',
        age1to3: '90 mcg/day',
        age4to8: '150 mcg/day',
        age9to13: '280 mcg/day',
        age14to18: '400 mcg/day',
      ),
      upperLimitScope: 'Total intake from food + supplements.',
      foodFirstAr:
          'غالبًا يمكن تغطية الحاجة من الطعام؛ لا يحتاج الطفل السليم selenium منفصلًا لمجرد “المناعة”.',
      supplementRuleAr:
          'الـhigh-dose selenium غير مناسب كروتين؛ راجع كل multivitamin لتجنب التكرار.',
      labRuleAr:
          'الاختبار ليس routine wellness test ويُستخدم عند اشتباه سريري محدد.',
      sourceLabel: 'NIH ODS · Selenium',
    ),
  ];
}

List<PediatricSafetyNote> pediatricSafetyNotes(PediatricDailyNeedInput input) {
  final notes = <PediatricSafetyNote>[];

  if (isInfantBand(input.ageBand)) {
    final needsVitaminD = input.feedingMode == InfantFeedingMode.breastMilk ||
        input.formulaDailyVolume ==
            FormulaDailyVolume.lessThan32OzOrUnknown;

    notes.add(
      PediatricSafetyNote(
        id: 'infant-vitamin-d',
        titleEn: 'Infant vitamin D',
        titleAr: 'Vitamin D للرضيع',
        bodyAr: needsVitaminD
            ? 'هذا الرضيع يحتاج عادةً 400 IU من vitamin D يوميًا بدءًا من الأيام الأولى، لأن حليب الأم وحده لا يغطي الاحتياج، وكذلك الرضيع الذي يتلقى أقل من 32 oz/day من formula.'
            : 'إذا كان الرضيع يحصل على 32 oz/day أو أكثر من infant formula المدعم، لا تُضف vitamin D تلقائيًا؛ راجع المنتج ومدخول الرضيع الفعلي.',
        sourceLabel: 'CDC Vitamin D and Breastfeeding, 2026',
        critical: true,
      ),
    );

    notes.add(
      PediatricSafetyNote(
        id: 'infant-iron',
        titleEn: 'Infant iron',
        titleAr: 'الحديد للرضيع',
        bodyAr: input.ageBand == PediatricAgeBand.birthTo6Months
            ? input.feedingMode == InfantFeedingMode.ironFortifiedFormula
                ? 'Standard iron-fortified infant formula عادةً يغطي الحديد خلال الأشهر الأولى؛ لا تضف iron drops تلقائيًا.'
                : 'حليب الأم يحتوي حديدًا قليلًا. معظم المواليد لديهم مخزون للأشهر الأولى، لكن الحاجة إلى iron drops قبل 6 أشهر تعتمد على gestational age والمخزون وعوامل الخطر؛ ناقشها سريريًا بدل جرعة تلقائية.'
            : 'عند نحو 6 أشهر يحتاج الرضيع إلى مصدر حديد خارج حليب الأم: iron-rich/fortified complementary foods أو مكمل عند الحاجة. Formula المدعم يساهم في المدخول.',
        sourceLabel: 'CDC Infant/Toddler Iron, 2026',
        critical: true,
      ),
    );
  }

  if (input.pretermOrLowBirthWeight) {
    notes.add(
      const PediatricSafetyNote(
        id: 'preterm-lbw-lock',
        titleEn: 'Preterm / low birth weight',
        titleAr: 'خديج أو منخفض الوزن عند الولادة',
        bodyAr:
            'لا تستخدم جدول الطفل السليم لتحديد جرعات iron أو vitamin D أو المعادن. الخدج قد يحتاجون خطة مختلفة حسب الوزن، العمر الحملي، التغذية والتحاليل؛ انتقل إلى مسار NICU/pediatric clinician-directed.',
        sourceLabel: 'CDC Infant/Toddler Iron 2026 + condition-specific neonatal guidance',
        critical: true,
      ),
    );
  }

  if (supportsTeenLifeStage(input) &&
      input.lifeStage != PediatricLifeStage.none) {
    notes.add(
      const PediatricSafetyNote(
        id: 'teen-pregnancy-lactation',
        titleEn: 'Pregnant/lactating teen',
        titleAr: 'مراهقة حامل/مرضع',
        bodyAr:
            'الاحتياجات الغذائية في المراهقة تختلف عن البالغة في بعض العناصر مثل calcium وmagnesium؛ استخدم قيم المراهقات ولا تنسَ مسار prenatal السريري المنفصل.',
        sourceLabel: 'NIH ODS Dietary Reference Intakes',
      ),
    );
  }

  return notes;
}
