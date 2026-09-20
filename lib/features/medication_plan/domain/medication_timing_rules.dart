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
};
