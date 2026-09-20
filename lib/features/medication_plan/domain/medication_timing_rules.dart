class MedicationTimingRule {
  const MedicationTimingRule({
    this.anchor = 'any',
    this.instructionAr = '',
    this.requiresMealChoice = false,
    this.autoScheduleSafe = true,
    this.source = '',
  });

  final String anchor;
  final String instructionAr;
  final bool requiresMealChoice;
  final bool autoScheduleSafe;
  final String source;
}

const medicationTimingRules = <String, MedicationTimingRule>{
  'levothyroxine': MedicationTimingRule(
    anchor: 'before-breakfast',
    instructionAr:
        'على معدة فارغة قبل الفطور بـ30–60 دقيقة. افصل الحديد والكالسيوم 4 ساعات على الأقل.',
    source: 'MedlinePlus Levothyroxine',
  ),
  'glimepiride': MedicationTimingRule(
    anchor: 'breakfast',
    instructionAr: 'مع الفطور أو أول وجبة رئيسية في اليوم.',
    source: 'MedlinePlus Glimepiride',
  ),
  'metformin': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr:
        'مع الوجبات. إذا كان المنتج ممتد المفعول مرة يوميًا فغالبًا مع وجبة المساء حسب الوصفة.',
    source: 'MedlinePlus Metformin',
  ),
  'tamsulosin': MedicationTimingRule(
    anchor: 'after-selected-meal',
    instructionAr: 'بعد نفس الوجبة كل يوم بـ30 دقيقة.',
    requiresMealChoice: true,
    source: 'MedlinePlus Tamsulosin',
  ),
  'rivaroxaban': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'تعليمات الطعام تختلف حسب القوة والاستطباب؛ استخدم التوقيت المكتوب في الوصفة.',
    autoScheduleSafe: false,
    source: 'MedlinePlus Rivaroxaban',
  ),
  'fexofenadine': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'مع الماء. تجنب عصير التفاح والبرتقال والجريب فروت وقت الجرعة.',
    source: 'MedlinePlus Fexofenadine',
  ),
  'bisacodyl-tablets': MedicationTimingRule(
    anchor: 'bedtime',
    instructionAr:
        'غالبًا مساءً. افصل ساعة على الأقل عن الحليب/الألبان ومضادات الحموضة.',
    source: 'MedlinePlus Bisacodyl',
  ),
  'nitrofurantoin': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'مع الطعام وفي مواعيد متباعدة حسب الوصفة.',
    source: 'MedlinePlus Nitrofurantoin',
  ),
  'valproic-acid': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'مع الطعام لتقليل انزعاج المعدة وفي أوقات ثابتة.',
    source: 'MedlinePlus Valproic Acid',
  ),
  'metoprolol': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr:
        'النوع العادي يؤخذ مع الوجبة أو بعدها مباشرة؛ اتبع نوع المنتج الموصوف.',
    source: 'MedlinePlus Metoprolol',
  ),
  'doxycycline': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'مع كوب ماء كامل. يحتاج فصلًا عن بعض المعادن/مضادات الحموضة حسب المنتج.',
    source: 'MedlinePlus Doxycycline',
  ),
  'furosemide': MedicationTimingRule(
    anchor: 'morning',
    instructionAr:
        'يفضل تنظيم الجرعة مبكرًا بما يتوافق مع الوصفة لتقليل الاستيقاظ ليلًا للتبول.',
    source: 'Practical counseling rule',
  ),
  'hydrochlorothiazide': MedicationTimingRule(
    anchor: 'morning',
    instructionAr:
        'يفضل تنظيم الجرعة مبكرًا بما يتوافق مع الوصفة لتقليل التبول ليلًا.',
    source: 'Practical counseling rule',
  ),
  'empagliflozin': MedicationTimingRule(
    anchor: 'morning',
    instructionAr: 'مرة يوميًا صباحًا تقريبًا، مع الطعام أو بدونه.',
    source: 'MedlinePlus Empagliflozin',
  ),
  'semaglutide-injection': MedicationTimingRule(
    anchor: 'weekly',
    instructionAr: 'مرة أسبوعيًا في نفس اليوم من كل أسبوع.',
    source: 'MedlinePlus Semaglutide',
  ),
  'methotrexate-rheumatology': MedicationTimingRule(
    anchor: 'weekly',
    instructionAr:
        'للروماتيزم/الالتهاب: يوم واحد محدد في الأسبوع حسب الوصفة، وليس يوميًا.',
    source: 'DailyMed / MedlinePlus Methotrexate',
  ),
  'carvedilol': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'النوع العادي يؤخذ مع الطعام لتقليل هبوط الضغط والدوخة.',
    source: 'DailyMed Carvedilol',
  ),
  'sacubitril-valsartan': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'يمكن مع الطعام أو بدونه. الأهم الالتزام بالمرات المكتوبة وعدم جمعه مع ACE inhibitor.',
    source: 'FDA / DailyMed Sacubitril-Valsartan',
  ),
  'digoxin': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'في وقت ثابت يوميًا مع الطعام أو بدونه؛ ثبّت الطريقة قدر الإمكان.',
    source: 'DailyMed Digoxin',
  ),
  'amiodarone-oral': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'خذ الجرعة بطريقة ثابتة بالنسبة للطعام كل يوم لتقليل تغير الامتصاص.',
    source: 'DailyMed Amiodarone',
  ),
  'diltiazem-er': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'تعليمات الطعام تختلف حسب منتج ER؛ اختر توقيت الوصفة ولا تعتمد Auto.',
    autoScheduleSafe: false,
    source: 'Product-specific DailyMed Diltiazem ER',
  ),
  'dapagliflozin': MedicationTimingRule(
    anchor: 'morning',
    instructionAr: 'مرة يوميًا ويمكن مع الطعام أو بدونه؛ تنظيمها صباحًا يقلل نسيان الجرعة لدى كثير من المرضى.',
    source: 'FDA / DailyMed Dapagliflozin',
  ),
  'insulin-lispro': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'إنسولين وجبات؛ اختر الوجبة/الأوقات حسب الوصفة ولا تستخدم Auto إذا لم تكن علاقة الجرعة بالطعام محددة.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'FDA product IFU Insulin Lispro',
  ),
  'prednisone': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'التوقيت والوجبات وعدد الجرعات يعتمد على الخطة؛ لا ينشئ التطبيق جدولًا تلقائيًا دون مراجعة الوصفة.',
    autoScheduleSafe: false,
    source: 'DailyMed / MedlinePlus Prednisone',
  ),
  'methimazole': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'خذ الجرعات في أوقات ثابتة ويمكن مع الطعام أو بدونه؛ ثبّت الطريقة إذا أزعج المعدة.',
    source: 'DailyMed Methimazole',
  ),
  'ciprofloxacin-oral': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'يحتاج فصلًا عن مضادات الحموضة والحديد والزنك والكالسيوم حسب ملصق المنتج.',
    source: 'FDA Medication Guide Ciprofloxacin',
  ),
  'carbamazepine': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'في أوقات ثابتة حسب النوع العادي أو الممتد؛ لا تغيّر formulation دون مراجعة.',
    source: 'FDA Medication Guide Carbamazepine',
  ),
  'lamotrigine': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'في وقت ثابت ويمكن مع الطعام أو بدونه؛ لا تعاود الجرعة القديمة تلقائيًا بعد انقطاع عدة أيام.',
    source: 'DailyMed Medication Guide Lamotrigine',
  ),
  'pregabalin': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'تعليمات IR وER تختلف؛ اختر توقيت الوصفة إذا كان المنتج ممتد المفعول.',
    autoScheduleSafe: false,
    source: 'FDA / DailyMed Pregabalin',
  ),
  'pantoprazole': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'الحبوب المتأخرة التحرر تختلف عن الحبيبات في تعليمات الطعام؛ اتبع نوع المنتج.',
    autoScheduleSafe: false,
    source: 'DailyMed Pantoprazole',
  ),
  'metoclopramide': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'غالبًا يرتبط بالوجبات حسب الاستطباب؛ استخدم توقيت الوصفة بدل Auto.',
    autoScheduleSafe: false,
    source: 'DailyMed Metoclopramide',
  ),
  'sucralfate': MedicationTimingRule(
    anchor: 'empty-stomach',
    instructionAr: 'على معدة فارغة، مع فصل الأدوية المتداخلة حسب كل دواء.',
    source: 'DailyMed Sucralfate',
  ),
  'pancrelipase': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'أثناء الوجبة أو السناك؛ لا يُؤخذ بعيدًا عن الطعام.',
    source: 'FDA / DailyMed Pancrelipase IFU',
  ),
  'allopurinol': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'يمكن بعد الطعام لتقليل انزعاج المعدة؛ استمر يوميًا حسب خطة خفض اليوريك.',
    source: 'DailyMed Allopurinol',
  ),
  'hydroxychloroquine': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'مع الطعام أو الحليب لتقليل انزعاج المعدة.',
    source: 'DailyMed Hydroxychloroquine',
  ),
  'dabigatran': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'في أوقات ثابتة؛ ابتلع الكبسولة كاملة ولا تفتحها أو تمضغها.',
    source: 'FDA Medication Guide Dabigatran',
  ),
  'mirabegron': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'في وقت ثابت يوميًا؛ ابتلع الحبة ممتدة المفعول كاملة.',
    source: 'DailyMed Mirabegron',
  ),
  'alendronate': MedicationTimingRule(
    anchor: 'before-breakfast',
    instructionAr: 'عند الاستيقاظ مع ماء عادي فقط، قبل الطعام/الدواء 30 دقيقة على الأقل، والبقاء جالسًا أو واقفًا.',
    source: 'FDA / DailyMed Alendronate',
  ),
  'sildenafil-ed': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'دواء عند الحاجة وليس له جدول يومي تلقائي؛ استخدمه حسب وصفة ضعف الانتصاب.',
    autoScheduleSafe: false,
    source: 'DailyMed Sildenafil ED',
  ),
  'oral-iron-salts': MedicationTimingRule(
    anchor: 'empty-stomach',
    instructionAr:
        'الأفضل على معدة فارغة. افصل عن الحليب/الكالسيوم/مضادات الحموضة ساعتين على الأقل.',
    source: 'NIH ODS / MedlinePlus Iron',
  ),
  'calcium-carbonate': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'مع وجبة.',
    source: 'NIH ODS Calcium',
  ),
  'calcium-citrate': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'يمكن مع الطعام أو بدونه.',
    source: 'NIH ODS Calcium',
  ),
  'magnesium-gluconate': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'مع الوجبات لتقليل انزعاج المعدة.',
    source: 'MedlinePlus Magnesium Gluconate',
  ),
  'vitamin-d3': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr:
        'مع وجبة أو سناك يحتوي بعض الدهون لتحسين الامتصاص.',
    source: 'NIH ODS Vitamin D',
  ),
  'zinc': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'إذا استُخدم مع tetracycline/quinolone antibiotic يحتاج فصلًا زمنيًا.',
    source: 'NIH ODS Zinc',
  ),
};
