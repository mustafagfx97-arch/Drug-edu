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

  'carvedilol': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr:
        'خذ carvedilol العادي مع الطعام وفي نفس الأوقات يوميًا لتقليل الدوخة وتذبذب الامتصاص.',
    source: 'Current carvedilol labeling',
  ),
  'dapagliflozin': MedicationTimingRule(
    anchor: 'morning',
    instructionAr:
        'مرة يوميًا في وقت ثابت؛ الصباح عملي لتقليل الإزعاج من زيادة التبول، مع الطعام أو بدونه.',
    source: 'Current dapagliflozin labeling',
  ),
  'dulaglutide': MedicationTimingRule(
    anchor: 'weekly',
    instructionAr:
        'حقنة مرة أسبوعيًا في نفس اليوم من كل أسبوع، بغض النظر عن الوجبات.',
    source: 'Current dulaglutide labeling',
  ),
  'tirzepatide': MedicationTimingRule(
    anchor: 'weekly',
    instructionAr:
        'حقنة مرة أسبوعيًا في نفس اليوم من كل أسبوع، بغض النظر عن الوجبات.',
    source: 'Current tirzepatide labeling',
  ),
  'glipizide': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'توقيت glipizide يختلف بين IR وER؛ اختر توقيت الوصفة يدويًا بعد تحديد formulation.',
    autoScheduleSafe: false,
    source: 'Current glipizide labeling',
  ),
  'insulin-lispro': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'إنسولين سريع مرتبط بتوقيت الوجبة؛ استخدم التوقيت الموصوف حسب المنتج ولا تعتمد Auto timing.',
    autoScheduleSafe: false,
    source: 'Insulin lispro product IFU',
  ),
  'insulin-aspart': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'إنسولين سريع مرتبط بتوقيت الوجبة؛ النافذة تختلف حسب المنتج، لذلك اختر وقت الوصفة يدويًا.',
    autoScheduleSafe: false,
    source: 'Insulin aspart product IFU',
  ),
  'insulin-nph': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'توقيت NPH يعتمد على خطة الإنسولين والوجبات/النوم؛ لا يستخدم Auto timing من دون الخطة الموصوفة.',
    autoScheduleSafe: false,
    source: 'NPH insulin product labeling',
  ),
  'amoxicillin-clavulanate-oral': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr:
        'مع بداية الوجبة أو مع الطعام حسب المنتج لتحسين التحمل وامتصاص clavulanate.',
    source: 'Current amoxicillin/clavulanate labeling',
  ),
  'cefuroxime-axetil': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'الحبوب والشراب ليست لهما نفس تعليمات الطعام؛ اختر توقيت الوصفة بعد تحديد formulation.',
    autoScheduleSafe: false,
    source: 'Current cefuroxime axetil labeling',
  ),
  'clarithromycin': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'IR وER لهما تعليمات مختلفة؛ ER يؤخذ مع الطعام عادةً. حدد formulation قبل الجدولة.',
    autoScheduleSafe: false,
    source: 'Current clarithromycin labeling',
  ),
  'levofloxacin-oral': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'تعليمات الطعام تختلف بين tablet وoral solution، ويجب فصل المعادن/مضادات الحموضة؛ اختر التوقيت بعد تحديد formulation.',
    autoScheduleSafe: false,
    source: 'Current levofloxacin labeling',
  ),
  'ciprofloxacin-oral': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'خذه مع الماء وافصل الحديد/الكالسيوم/المغنيسيوم/الزنك ومضادات الحموضة حسب الفاصل الموصى به.',
    source: 'Current ciprofloxacin labeling',
  ),
  'venlafaxine-xr': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr:
        'Venlafaxine XR مرة يوميًا مع الطعام وفي نفس الوقت تقريبًا.',
    source: 'Current venlafaxine XR labeling',
  ),
  'isosorbide-mononitrate-er': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'توقيت ER يجب أن يحافظ على nitrate-low interval؛ استخدم وقت الوصفة يدويًا ولا تعتمد Auto timing.',
    autoScheduleSafe: false,
    source: 'Current isosorbide mononitrate ER labeling',
  ),
  'metoclopramide-oral': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'قد يُعطى قبل الوجبات وفي أوقات مختلفة حسب الاستطباب؛ اختر جدول الوصفة يدويًا.',
    autoScheduleSafe: false,
    source: 'Current metoclopramide labeling',
  ),
  'sucralfate': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'غالبًا على معدة فارغة ويحتاج فصل أدوية أخرى؛ جدول الجرعات متعدد ومعقد لذلك اختر توقيت الوصفة يدويًا.',
    autoScheduleSafe: false,
    source: 'Current sucralfate labeling',
  ),
  'acarbose': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'مع أول لقمة من الوجبة الموصوفة؛ اختر الوجبة/التوقيت يدويًا بدل Auto timing.',
    autoScheduleSafe: false,
    source: 'Current acarbose labeling',
  ),
  'pantoprazole-oral': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'التوقيت يختلف حسب formulation والاستطباب؛ استخدم توقيت الوصفة بدل Auto إذا كانت العلاقة بالطعام مهمة.',
    autoScheduleSafe: false,
    source: 'Current pantoprazole labeling',
  ),
  'omeprazole': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'معظم delayed-release regimens تؤخذ قبل وجبة، لكن formulation والاستطباب يحددان التفاصيل؛ اختر وقت الوصفة يدويًا.',
    autoScheduleSafe: false,
    source: 'Current omeprazole labeling',
  ),
  'potassium-oral': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr:
        'مع أو بعد الطعام ومع كوب كامل من الماء حسب نوع المنتج؛ لا تمضغ ER products.',
    source: 'MedlinePlus Potassium',
  ),
  'magnesium-oxide': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'افصل باقي الأدوية عن Magnesium Oxide ساعتين على الأقل، وقد تحتاج بعض الأدوية فاصلًا أطول.',
    source: 'MedlinePlus Magnesium Oxide',
  ),
  'omega-3-fish-oil': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr:
        'يمكن أخذه مع وجبة لتحسين التحمل وتقليل التجشؤ/انزعاج المعدة.',
    source: 'NIH ODS Omega-3',
  ),
};
