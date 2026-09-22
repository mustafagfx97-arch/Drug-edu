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
  'losartan': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'في وقت ثابت يوميًا؛ يمكن مع الطعام أو بدونه.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed / MedlinePlus Losartan',
  ),
  'salbutamol-mdi': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'غالبًا بخاخ إسعاف عند الحاجة. إذا كانت الوصفة بجرعات ثابتة فاختر توقيتها يدويًا ولا تعتمد Auto.',
    requiresMealChoice: false,
    autoScheduleSafe: false,
    source: 'FDA / device IFU Albuterol HFA',
  ),
  'amoxicillin': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'يمكن مع الطعام أو بدونه؛ ثبّت الفواصل حسب التكرار الموصوف وأكمل الكورس.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Amoxicillin',
  ),
  'levetiracetam': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'في أوقات ثابتة ويمكن مع الطعام أو بدونه؛ انتبه لاختلاف IR وXR.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Levetiracetam',
  ),
  'omeprazole': MedicationTimingRule(
    anchor: 'before-meal',
    instructionAr: 'غالبًا قبل الوجبة؛ كثير من الأنظمة تؤخذ 30–60 دقيقة قبل الطعام. إذا كانت الوصفة أكثر من مرة أو formulation مختلفًا اختر التوقيت المكتوب في الوصفة.',
    requiresMealChoice: false,
    autoScheduleSafe: false,
    source: 'DailyMed Omeprazole',
  ),
  'paracetamol': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'مع الطعام أو بدونه، حسب الحاجة/التكرار الموصوف مع مراعاة الحد اليومي من جميع المنتجات.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Acetaminophen',
  ),
  'apixaban': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'في أوقات ثابتة ويمكن مع الطعام أو بدونه؛ لا توقفه أو تغيّر توقيته قبل إجراء دون خطة.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'FDA / DailyMed Apixaban',
  ),
  'cetirizine': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'يمكن مع الطعام أو بدونه. إذا سبب نعاسًا يمكن مناقشة تنظيمه مساءً.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Cetirizine',
  ),
  'amlodipine': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'مرة يوميًا غالبًا وفي وقت ثابت؛ يمكن مع الطعام أو بدونه.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Amlodipine',
  ),
  'lisinopril': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'في وقت ثابت يوميًا؛ يمكن مع الطعام أو بدونه.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Lisinopril',
  ),
  'insulin-glargine': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'إنسولين قاعدي: اربطه بالوقت الذي وصفه الطبيب لنفس المنتج. لا ينشئ التطبيق وقتًا تلقائيًا عند اختلاف الخطة/المنتج.',
    requiresMealChoice: false,
    autoScheduleSafe: false,
    source: 'FDA product IFU Insulin Glargine',
  ),
  'budesonide-formoterol': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'جرعات الصيانة في أوقات ثابتة حسب الوصفة. استخدامه كمسكن/MART يعتمد على المنتج والخطة ولا يُفترض تلقائيًا.',
    requiresMealChoice: false,
    autoScheduleSafe: false,
    source: 'FDA / product IFU Budesonide-Formoterol',
  ),
  'montelukast': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'التوقيت يعتمد على الاستطباب؛ للربو كثيرًا ما تكون الجرعة مساءً، بينما تعليمات الحساسية/الجهد تختلف. اختر توقيت الوصفة.',
    requiresMealChoice: false,
    autoScheduleSafe: false,
    source: 'FDA / DailyMed Montelukast',
  ),
  'ibuprofen': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'يمكن مع الطعام أو الحليب إذا أزعج المعدة؛ استخدم أقل مدة/جرعة مناسبة ولا تجمع NSAID آخر.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Ibuprofen',
  ),
  'warfarin': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'مرة يوميًا في وقت ثابت. المهم الثبات والمتابعة مع INR؛ لا تغيّر الجرعات حسب الجدول من نفسك.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Warfarin',
  ),
  'upadacitinib': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'مرة يوميًا مع الطعام أو بدونه؛ ابتلع ER كاملة.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'FDA / DailyMed Upadacitinib',
  ),
  'tofacitinib': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'IR وXR لهما جداول مختلفة؛ إذا كان الشكل غير محدد اختر التوقيت يدويًا بدل Auto.',
    requiresMealChoice: false,
    autoScheduleSafe: false,
    source: 'FDA / DailyMed Tofacitinib',
  ),
  'dupilumab': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'حقنة حسب الجدول الخاص بالاستطباب/العمر؛ إذا لم تكن الجرعة أسبوعية فلا يحول التطبيق التكرار من نفسه.',
    requiresMealChoice: false,
    autoScheduleSafe: false,
    source: 'FDA / DUPIXENT IFU',
  ),
  'polyethylene-glycol-3350': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'يمكن في وقت يناسب المريض بعد إذابة الجرعة بالكامل؛ ليس مرتبطًا بوجبة.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed PEG 3350',
  ),
  'lactulose': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'في أوقات ثابتة حسب الوصفة؛ يمكن مع الطعام أو بدونه. في الاعتلال الدماغي يُعدّل حسب هدف البراز الطبي.',
    requiresMealChoice: false,
    autoScheduleSafe: false,
    source: 'DailyMed Lactulose',
  ),
  'loperamide': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'غالبًا عند الحاجة ضمن الحد المسموح وليس له وقت ثابت؛ إذا وُصف بجدول خاص فاتبع الوصفة.',
    requiresMealChoice: false,
    autoScheduleSafe: false,
    source: 'FDA / DailyMed Loperamide',
  ),
  'ondansetron-oral': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'التوقيت يعتمد على سبب الاستخدام (غثيان/علاج كيماوي/عملية)؛ اختر توقيت الوصفة إذا كان محددًا.',
    requiresMealChoice: false,
    autoScheduleSafe: false,
    source: 'FDA / DailyMed Ondansetron',
  ),
  'levonorgestrel-ec': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'خذها بأسرع ما يمكن ضمن نافذة المنتج بعد الجماع غير المحمي؛ ليست جرعة يومية مجدولة.',
    requiresMealChoice: false,
    autoScheduleSafe: false,
    source: 'FDA emergency contraception labeling',
  ),
  'latanoprost': MedicationTimingRule(
    anchor: 'bedtime',
    instructionAr: 'عادة نقطة مرة يوميًا مساءً؛ لا تستخدم أكثر من مرة يوميًا.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Latanoprost',
  ),
  'paracetamol-pediatric-liquid': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'حسب الحاجة والفاصل الموصوف وبالتركيز الصحيح؛ لا ينشئ التطبيق جرعة طفل.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Pediatric Acetaminophen',
  ),
  'atorvastatin': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'مرة يوميًا في وقت ثابت؛ يمكن مع الطعام أو بدونه وفي أي وقت من اليوم.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Atorvastatin',
  ),
  'spironolactone': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'خذها بطريقة ثابتة بالنسبة للطعام لأن الطعام قد يغيّر الامتصاص؛ التزم بنفس الروتين يوميًا.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Spironolactone',
  ),
  'sertraline': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'مرة يوميًا غالبًا؛ مع الطعام أو بدونه وفي وقت ثابت يناسب النوم/التحمل.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Sertraline',
  ),
  'gabapentin': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'IR وER/prodrug ليست نفس الجدول أو تعليمات الطعام؛ إذا لم يتحدد formulation اختر توقيت الوصفة يدويًا.',
    requiresMealChoice: false,
    autoScheduleSafe: false,
    source: 'FDA / DailyMed Gabapentin',
  ),
  'clindamycin-oral': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'في أوقات متباعدة حسب الوصفة، مع كوب ماء كامل؛ الطعام اختياري.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Clindamycin',
  ),
  'clopidogrel': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'مرة يوميًا في وقت ثابت؛ يمكن مع الطعام أو بدونه.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Clopidogrel',
  ),
  'nitroglycerin-sublingual': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'دواء إسعافي عند ألم الذبحة وليس له وقت ثابت؛ استخدم خطة الألم الموصوفة واطلب المساعدة عند استمرار الألم.',
    requiresMealChoice: false,
    autoScheduleSafe: false,
    source: 'FDA / DailyMed Nitroglycerin SL',
  ),
  'sitagliptin': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'مرة يوميًا مع الطعام أو بدونه.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Sitagliptin',
  ),
  'tiotropium-capsule-inhalation': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'مرة يوميًا غالبًا وفي نفس الوقت؛ الكبسولة للاستنشاق فقط وليست للبلع.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'FDA HandiHaler IFU',
  ),
  'azithromycin': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'IR يمكن عادة مع الطعام أو بدونه؛ extended-release suspension لها تعليمات معدة فارغة. إذا لم يتحدد المنتج لا تستخدم Auto.',
    requiresMealChoice: false,
    autoScheduleSafe: false,
    source: 'FDA / DailyMed Azithromycin',
  ),
  'acyclovir-oral': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'في أوقات متباعدة حسب الوصفة مع ترطيب مناسب إن لم يوجد تقييد سوائل؛ الطعام اختياري.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Acyclovir',
  ),
  'metronidazole-oral': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'IR وER تختلف في علاقتها بالطعام؛ إذا كان الشكل غير محدد اختر توقيت الوصفة يدويًا.',
    requiresMealChoice: false,
    autoScheduleSafe: false,
    source: 'FDA / DailyMed Metronidazole',
  ),
  'combined-oral-contraceptive': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'حبة يوميًا في وقت ثابت واتبع ترتيب العبوة بالضبط؛ قواعد الحبوب المنسية تعتمد على المنتج.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'CDC SPR + product labeling',
  ),
  'norethindrone-pop': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'نفس الوقت كل يوم مهم جدًا؛ norethindrone POP لها نافذة تأخر أضيق من بعض POP الأخرى.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'CDC SPR + norethindrone labeling',
  ),
  'finasteride': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'مرة يوميًا في وقت ثابت؛ مع الطعام أو بدونه.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Finasteride',
  ),
  'timolol-ophthalmic': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'قطرة حسب عدد المرات الموصوف؛ ثبّت الأوقات واستخدم ضغط القناة الدمعية لتقليل الامتصاص الجهازي.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Timolol Ophthalmic',
  ),
  'ciprofloxacin-ophthalmic': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'وزّع القطرات حسب التكرار الموصوف؛ جداول drops وointment تختلف ولا تُفترض تلقائيًا.',
    requiresMealChoice: false,
    autoScheduleSafe: false,
    source: 'DailyMed Ciprofloxacin Ophthalmic',
  ),
  'ciprofloxacin-otic': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'استخدم القطرات في أوقات ثابتة حسب المنتج؛ single-agent وcombination ليست نفس التعليمات.',
    requiresMealChoice: false,
    autoScheduleSafe: false,
    source: 'DailyMed Ciprofloxacin Otic',
  ),
  'naproxen': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'حسب التكرار الموصوف؛ يمكن مع الطعام إذا أزعج المعدة ولا تجمع NSAID آخر.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Naproxen',
  ),
  'senna': MedicationTimingRule(
    anchor: 'bedtime',
    instructionAr: 'غالبًا مساءً/قبل النوم لأن المفعول يحتاج عدة ساعات؛ لا تكرر جرعات إضافية بسرعة.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Senna',
  ),
  'hydrocortisone-topical': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'ضع طبقة رقيقة حسب عدد المرات المكتوب؛ لا يحدد التطبيق أوقاتًا صارمة للدهان الموضعي.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Hydrocortisone Topical',
  ),
  'ipratropium-hfa': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'قد يكون مجدولًا أو حسب الحاجة وفق COPD/الخطة؛ إذا لم يكن النظام واضحًا اختر توقيت الوصفة.',
    requiresMealChoice: false,
    autoScheduleSafe: false,
    source: 'FDA Atrovent HFA IFU',
  ),
  'fluticasone-hfa': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'بخاخ وقائي في أوقات ثابتة حسب الوصفة؛ ليس مرتبطًا بالطعام.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'FDA Fluticasone inhaler IFU',
  ),
  'fluticasone-salmeterol-dpi': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'بخاخ وقائي في أوقات ثابتة حسب الوصفة؛ لا يُستخدم كنفس طريقة بخاخ الإسعاف.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'FDA Fluticasone/Salmeterol DPI IFU',
  ),
  'fluconazole-oral': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'يمكن مع الطعام أو بدونه؛ عدد الجرعات والمدة يختلفان كثيرًا حسب نوع العدوى.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Fluconazole',
  ),
  'cefuroxime-axetil': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'تعليمات الطعام تختلف حسب الشكل؛ كثير من الأقراص تُعطى بعد الطعام لتحسين الامتصاص. تحقق من منتجك.',
    requiresMealChoice: false,
    autoScheduleSafe: false,
    source: 'DailyMed Cefuroxime Axetil',
  ),
  'fluoxetine': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'مرة يوميًا غالبًا وفي وقت ثابت؛ يمكن مع الطعام أو بدونه.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Fluoxetine',
  ),
  'escitalopram': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'مرة يوميًا وفي وقت ثابت؛ مع الطعام أو بدونه.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Escitalopram',
  ),
  'duloxetine': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'مرة يوميًا أو حسب الوصفة؛ يمكن غالبًا مع الطعام أو بدونه، وابتلع delayed-release حسب المنتج.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Duloxetine',
  ),
  'amitriptyline': MedicationTimingRule(
    anchor: 'bedtime',
    instructionAr: 'إذا كانت جرعة واحدة يوميًا فغالبًا تنظم ليلًا بسبب النعاس؛ اتبع الوصفة إذا كانت الجرعات مقسمة.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Amitriptyline',
  ),
  'quetiapine': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'IR وXR تختلف في التوقيت والطعام؛ اختر توقيت الوصفة ولا تعتمد Auto إذا لم يتحدد المنتج.',
    requiresMealChoice: false,
    autoScheduleSafe: false,
    source: 'FDA / DailyMed Quetiapine',
  ),
  'famotidine': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'التوقيت يعتمد على الاستطباب ويمكن مع الطعام أو بدونه؛ جرعات الوقاية من الحموضة قد ترتبط بوجبة محفزة.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Famotidine',
  ),
  'celecoxib': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'التوقيت والطعام يعتمدان على الجرعة/المنتج؛ استخدم الجدول الموصوف ولا تجمع NSAID آخر.',
    requiresMealChoice: false,
    autoScheduleSafe: false,
    source: 'DailyMed Celecoxib',
  ),
  'diclofenac-oral': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'IR/DR/ER ليست نفس التوقيت أو التعامل؛ اختر توقيت الوصفة ولا تعتمد Auto دون معرفة المنتج.',
    requiresMealChoice: false,
    autoScheduleSafe: false,
    source: 'FDA / DailyMed Diclofenac',
  ),
  'colchicine': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'جدول النوبة والوقاية مختلفان؛ استخدم النظام الموصوف ولا يحول التطبيق بينهما.',
    requiresMealChoice: false,
    autoScheduleSafe: false,
    source: 'DailyMed Colchicine',
  ),
  'enoxaparin': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'حقن تحت الجلد في أوقات ثابتة حسب q24h/q12h الموصوف؛ الطعام غير مهم.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'FDA Enoxaparin IFU',
  ),
  'loratadine': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'مرة يوميًا غالبًا ويمكن مع الطعام أو بدونه.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed Loratadine',
  ),
  'tacrolimus-topical': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'ضع طبقة رقيقة حسب عدد المرات الموصوف؛ لا تربطه بوجبة.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'FDA Tacrolimus Ointment',
  ),
  'adalimumab': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'الجدول يختلف حسب الاستطباب والمنتج (أسبوعي/كل أسبوعين/تحميل). لا تعتمد Auto إلا إذا أدخلت تكرار الوصفة بدقة.',
    requiresMealChoice: false,
    autoScheduleSafe: false,
    source: 'FDA Adalimumab IFU',
  ),
  'valsartan': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'في وقت ثابت يوميًا؛ يمكن مع الطعام أو بدونه.',
    source: 'DailyMed / MedlinePlus Valsartan',
  ),
  'bisoprolol': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'مرة يوميًا غالبًا وفي وقت ثابت؛ يمكن مع الطعام أو بدونه.',
    source: 'DailyMed / MedlinePlus Bisoprolol',
  ),
  'nifedipine-er': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'تعليمات الطعام تختلف بين منتجات nifedipine ER؛ استخدم وقت وتعليمات المنتج المصروف لك.',
    autoScheduleSafe: false,
    source: 'Product-specific DailyMed Nifedipine ER',
  ),
  'rosuvastatin': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'مرة يوميًا في وقت ثابت؛ يمكن مع الطعام أو بدونه وفي أي وقت من اليوم.',
    source: 'FDA / DailyMed Rosuvastatin',
  ),
  'ezetimibe': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'مرة يوميًا مع الطعام أو بدونه؛ إذا استخدمت bile-acid sequestrant يحتاج فصلًا زمنيًا.',
    source: 'FDA / DailyMed Ezetimibe',
  ),
  'pioglitazone': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'مرة يوميًا وفي وقت ثابت؛ يمكن مع الطعام أو بدونه.',
    source: 'FDA / DailyMed Pioglitazone',
  ),
  'linagliptin': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'مرة يوميًا مع الطعام أو بدونه.',
    source: 'FDA / DailyMed Linagliptin',
  ),
  'tirzepatide-mounjaro': MedicationTimingRule(
    anchor: 'weekly',
    instructionAr: 'حقنة مرة أسبوعيًا في نفس اليوم تقريبًا، في أي وقت ومع الطعام أو بدونه.',
    source: 'DailyMed MOUNJARO · revised 2026',
  ),
  'amoxicillin-clavulanate': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'خذ الجرعة في بداية الوجبة وفي الفواصل المكتوبة بالوصفة.',
    source: 'DailyMed Amoxicillin-Clavulanate / AUGMENTIN',
  ),
  'cephalexin': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'في أوقات متباعدة حسب الوصفة؛ يمكن مع الطعام أو بدونه.',
    source: 'DailyMed / MedlinePlus Cephalexin',
  ),
  'trimethoprim-sulfamethoxazole': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'في أوقات متباعدة حسب الوصفة، مع سوائل مناسبة إذا لم يكن لديك تقييد سوائل.',
    source: 'FDA / DailyMed TMP-SMX',
  ),
  'clarithromycin-oral': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'النوع العادي وER يختلفان: ER يؤخذ مع الطعام ويُبتلع كاملًا؛ إذا لم يتحدد المنتج فلا تستخدم توقيتًا تلقائيًا.',
    autoScheduleSafe: false,
    source: 'DailyMed Clarithromycin IR/ER',
  ),
  'venlafaxine-xr': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'مرة يوميًا مع الطعام وفي نفس الوقت تقريبًا صباحًا أو مساءً.',
    source: 'DailyMed Venlafaxine Extended-Release',
  ),
  'bupropion-xl': MedicationTimingRule(
    anchor: 'morning',
    instructionAr: 'مرة يوميًا صباحًا غالبًا؛ يمكن مع الطعام أو بدونه ولا تسحق XL.',
    source: 'DailyMed Bupropion XL Medication Guide',
  ),
  'mirtazapine': MedicationTimingRule(
    anchor: 'bedtime',
    instructionAr: 'غالبًا مساءً/قبل النوم بسبب النعاس؛ يمكن مع الطعام أو بدونه.',
    source: 'FDA / DailyMed Mirtazapine',
  ),
  'lithium': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'التوقيت وعدد الجرعات يختلفان حسب IR/ER والخطة؛ حافظ على نمط ثابت للملح والسوائل ولا تعتمد توقيتًا تلقائيًا دون معرفة المنتج.',
    autoScheduleSafe: false,
    source: 'DailyMed Lithium Carbonate',
  ),
  'risperidone': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'في أوقات ثابتة حسب عدد الجرعات الموصوف؛ يمكن مع الطعام أو بدونه.',
    source: 'FDA / DailyMed Risperidone',
  ),
  'oxybutynin-er': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'مرة يوميًا تقريبًا في نفس الوقت؛ يمكن مع الطعام أو بدونه وابتلع ER كاملة.',
    source: 'DailyMed Oxybutynin ER',
  ),
  'solifenacin': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'مرة يوميًا وفي وقت ثابت؛ يمكن مع الطعام أو بدونه.',
    source: 'FDA / DailyMed Solifenacin',
  ),
  'tadalafil': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'التوقيت يعتمد على النظام: عند الحاجة لضعف الانتصاب أو مرة يوميًا لـED/BPH؛ لا تفترض نظامًا تلقائيًا.',
    autoScheduleSafe: false,
    source: 'DailyMed Tadalafil',
  ),
  'risedronate': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'تعليمات الطعام متعاكسة حسب المنتج: immediate-release قبل الفطور على معدة فارغة، وAtelvia delayed-release بعد الفطور مباشرة؛ يجب معرفة المنتج أولًا.',
    autoScheduleSafe: false,
    source: 'DailyMed ACTONEL / ATELVIA',
  ),
  'denosumab-prolia': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'حقنة عيادية كل 6 أشهر عادةً؛ ليست جرعة يومية يمكن للمخطط تحديد ساعة ثابتة لها.',
    autoScheduleSafe: false,
    source: 'DailyMed PROLIA · revised 2026',
  ),
  'ulipristal-ec': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'جرعة طارئة لمرة واحدة تؤخذ بأسرع ما يمكن خلال 120 ساعة؛ ليست دواءً يوميًا مجدولًا.',
    autoScheduleSafe: false,
    source: 'DailyMed ELLA · updated 2026',
  ),
  'psyllium': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'اخلطه مع كوب كامل من السائل واشربه فورًا؛ كثير من المنتجات توصي بفصل الأدوية الفموية الموصوفة ساعتين على الأقل.',
    source: 'DailyMed OTC Psyllium',
  ),
  'brimonidine-ophthalmic': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'استخدم القطرات في الأوقات المكتوبة وافصلها عن قطرات العين الأخرى 5 دقائق على الأقل.',
    source: 'DailyMed Brimonidine Ophthalmic',
  ),
  'ibuprofen-pediatric-liquid': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'للحمى/الألم غالبًا حسب الحاجة والفاصل المكتوب لنفس التركيز؛ لا يحدد المخطط جرعة الطفل.',
    source: 'DailyMed Pediatric Ibuprofen OTC',
  ),
  'albuterol-nebulizer-0083': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'غالبًا عند الحاجة حسب خطة الربو/COPD؛ إذا كان مجدولًا فاتبع التكرار الموصوف ولا تستخدم Auto لتخمين جرعة الإسعاف.',
    autoScheduleSafe: false,
    source: 'DailyMed Albuterol Inhalation Solution 0.083%',
  ),
  'albuterol-nebulizer-concentrate-05': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'غالبًا عند الحاجة/حسب الوصفة؛ التركيز 0.5% يحتاج تحضيرًا حسب الجرعة الموصوفة قبل الجلسة، لذلك لا يُجدول تلقائيًا كمنتج جاهز.',
    autoScheduleSafe: false,
    source: 'DailyMed Albuterol Inhalation Solution 0.5%',
  ),
  'ipratropium-nebulizer': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'وزّع الجلسات حسب التكرار الموصوف وفي أوقات ثابتة إذا كان العلاج مجدولًا.',
    source: 'DailyMed Ipratropium Bromide Inhalation Solution 0.02%',
  ),
  'ipratropium-albuterol-nebulizer': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'استخدم الجلسات في الأوقات والتكرار المكتوب لخطة COPD؛ الأمبولة تحتوي الدواءين معًا.',
    source: 'DailyMed Ipratropium/Albuterol Inhalation Solution · 2026',
  ),
  'budesonide-nebulizer': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'دواء controller يُستخدم يوميًا حسب التكرار الموصوف؛ ليس جرعة إسعاف عند ضيق النفس الحاد.',
    source: 'DailyMed PULMICORT RESPULES',
  ),
  'tiotropium-respimat': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'جرعة صيانة مرة يوميًا في نفس الوقت تقريبًا؛ ليست بخاخ إسعاف.',
    source: 'DailyMed SPIRIVA RESPIMAT · 2026',
  ),
  'fluticasone-nasal': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'استخدمه بانتظام حسب المنتج/العمر، وغالبًا مرة يوميًا خلال فترة الأعراض.',
    source: 'DailyMed Fluticasone Propionate Nasal Spray · 2026',
  ),
  'mometasone-nasal': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'استخدمه بانتظام حسب المنتج/العمر، وغالبًا مرة يوميًا.',
    source: 'DailyMed Mometasone Furoate Nasal Spray · 2026',
  ),
  'azelastine-nasal': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'عدد المرات يعتمد على المنتج والعمر؛ اختر التكرار المكتوب ولا تفترض أن OTC وRx لهما نفس النظام.',
    autoScheduleSafe: false,
    source: 'DailyMed Azelastine Nasal Spray · 2026',
  ),
  'oxymetazoline-nasal': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'عند الحاجة حسب ملصق المنتج فقط ولمدة لا تتجاوز 3 أيام متتالية.',
    autoScheduleSafe: false,
    source: 'DailyMed OTC Oxymetazoline 0.05% · 2026',
  ),
  'amoxicillin-pediatric-suspension': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'اتبع الفاصل المكتوب في الوصفة؛ قد يكون كل 8 أو 12 ساعة حسب النظام، ويمكن مع الطعام أو بدونه.',
    source: 'DailyMed Amoxicillin Oral Suspension',
  ),
  'cefdinir-pediatric-suspension': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'اتبع عدد المرات المكتوب، وافصل مكمل الحديد أو antacid المحتوي magnesium/aluminum ساعتين على الأقل.',
    source: 'DailyMed Cefdinir Oral Suspension',
  ),
  'simethicone-infant-drops': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'عند الحاجة حسب تعليمات نفس المنتج، وغالبًا بعد الرضعات وقبل النوم؛ لا تفترض أن كل المنتجات لها نفس التركيز.',
    autoScheduleSafe: false,
    source: 'DailyMed OTC Simethicone Infant Drops · 2026',
  ),
  'ibandronate-monthly': MedicationTimingRule(
    anchor: 'before-breakfast',
    instructionAr: 'صباحًا بعد صيام الليل مع ماء عادي فقط، ثم انتظر 60 دقيقة قبل الطعام أو أي دواء/مكمل آخر وابقَ جالسًا أو واقفًا.',
    autoScheduleSafe: false,
    source: 'DailyMed Ibandronate Sodium 150 mg · 2026',
  ),
  'medroxyprogesterone-im-contraception': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'الموعد الروتيني كل 13 أسبوعًا. CDC يسمح بإعادة الحقن حتى 15 أسبوعًا من الجرعة السابقة دون حماية إضافية؛ بعد ذلك يحتاج تقييم الحمل وخطة حماية مؤقتة.',
    autoScheduleSafe: false,
    source: 'DailyMed Medroxyprogesterone Acetate IM 150 mg/mL · 2026; CDC U.S. SPR 2024',
  ),
  'estradiol-transdermal-patch': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'جدول تغيير اللاصقة يعتمد على المنتج: بعض الأنواع أسبوعية وبعضها مرتان أسبوعيًا، لذلك اتبع اسم المنتج وجدوله.',
    autoScheduleSafe: false,
    source: 'DailyMed Estradiol Transdermal System',
  ),
  'bismuth-subsalicylate': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'عند الحاجة فقط وضمن عدد الجرعات والحد اليومي المكتوب على نفس المنتج.',
    autoScheduleSafe: false,
    source: 'DailyMed OTC Bismuth Subsalicylate · 2026',
  ),
  'dorzolamide-ophthalmic': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'استخدم القطرات في الأوقات المكتوبة، وافصل عن قطرات العين الأخرى 5 دقائق على الأقل وفق الملصق الحالي.',
    source: 'DailyMed Dorzolamide Ophthalmic · revised 2026',
  ),
  'olopatadine-ophthalmic-otc': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'استخدمها حسب قوة المنتج وعدد المرات المكتوب، وانزع العدسات قبل الجرعة وانتظر 10 دقائق على الأقل قبل إعادتها.',
    autoScheduleSafe: false,
    source: 'DailyMed OTC Olopatadine Ophthalmic · 2026',
  ),
  'prednisolone-acetate-ophthalmic': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'رج العبوة جيدًا قبل كل جرعة واتبع عدد المرات وخطة التخفيف التي وصفها طبيب العيون.',
    autoScheduleSafe: false,
    source: 'DailyMed Prednisolone Acetate Ophthalmic Suspension 1%',
  ),
  'ofloxacin-otic': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'استخدم عدد القطرات والفاصل ومدة الكورس الخاصة بتشخيص الأذن؛ الجداول تختلف بين otitis externa والأنبوب/ثقب الطبلة.',
    autoScheduleSafe: false,
    source: 'DailyMed Ofloxacin Otic 0.3%',
  ),
  'etanercept': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'جدول الحقن يعتمد على الاستطباب والعمر/الوزن؛ التزم بيوم الجرعة المكتوب ولا تنقل جدول مريض آخر.',
    autoScheduleSafe: false,
    source: 'DailyMed ENBREL · 2026',
  ),
  'secukinumab': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'جدول التحميل والصيانة يعتمد على الاستطباب والمنتج؛ اتبع الخطة المكتوبة ولا تفترض فاصلًا موحدًا لكل المرضى.',
    autoScheduleSafe: false,
    source: 'DailyMed COSENTYX · revised 2026',
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
  'vitamin-b12': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'لا يحتاج وجبة خاصة عادةً؛ اتبع شكل المنتج وتعليماته لأن lozenge/sublingual والوصفات قد تختلف.',
    source: 'NIH ODS Vitamin B12',
  ),
  'folic-acid': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'يمكن تنظيمه في وقت ثابت حسب الوصفة أو المنتج؛ لا يحتاج وجبة دهنية خاصة.',
    source: 'NIH ODS Folate',
  ),
  'vitamin-c': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'يمكن في وقت يناسبك حسب المنتج؛ إذا أزعج المعدة يمكن ربطه بالطعام بدل زيادة الجرعة.',
    source: 'NIH ODS Vitamin C / MedlinePlus Ascorbic Acid',
  ),
  'vitamin-a': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'اتبع المنتج والجرعة المقصودة؛ لا يضع التطبيق جرعات عالية تلقائيًا ولا يكرر vitamin A الموجود في multivitamin.',
    source: 'NIH ODS Vitamin A',
  ),
  'vitamin-e': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'اتبع تعليمات المنتج أو الوصفة؛ لا يحتاج التطبيق إلى فرض وقت وجبة موحد لكل منتج.',
    source: 'NIH ODS Vitamin E / MedlinePlus',
  ),
  'vitamin-k': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'اتبع المنتج. مع warfarin لا تغيّر مكمل vitamin K أو كميته من نفسك؛ المشكلة ليست توقيتًا فقط.',
    source: 'NIH ODS Vitamin K',
  ),
  'iodine': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'استخدم الكمية المقصودة حسب المنتج، وراجع تكراره داخل prenatal/multivitamin وأمراض الغدة الدرقية.',
    source: 'NIH ODS Iodine',
  ),
  'selenium': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'يمكن تنظيمه حسب المنتج؛ لا تجمع عدة منتجات تحتوي selenium دون حاجة واضحة.',
    source: 'NIH ODS Selenium',
  ),
  'pediatric-vitamin-d': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'أعط الجرعة باستمرار في وقت يناسب مقدم الرعاية، لكن تحقّق من IU لكل قطرة أو mL لنفس المنتج.',
    source: 'CDC Infant Vitamin D / NIH ODS Vitamin D',
  ),
  'pediatric-iron': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'توقيت حديد الرضع/الأطفال يعتمد على التركيز ونمط التغذية والخطة؛ اختر التوقيت الموصوف ولا تعتمد Auto.',
    autoScheduleSafe: false,
    source: 'CDC Iron / pediatric iron guidance',
  ),
  'multivitamin-mineral': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'راجع مكونات المنتج أولًا؛ وجود iron/calcium/magnesium قد يفرض فصلًا عن أدوية أخرى، لذلك اختر التوقيت يدويًا.',
    autoScheduleSafe: false,
    source: 'Ingredient-level NIH ODS guidance',
  ),
  'prenatal-combination': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'التوقيت يعتمد على مكونات prenatal وتحمل المعدة؛ بسبب الحديد/الكالسيوم المحتملين اختر التوقيت يدويًا وراجع الفصل عن الأدوية.',
    autoScheduleSafe: false,
    source: 'NIH ODS prenatal nutrient guidance',
  ),
  'magnesium-citrate': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr:
        'يمكن ربطه بوجبة لتقليل انزعاج المعدة، لكن افصل عن الأدوية التي يتداخل امتصاصها مع المغنيسيوم.',
    autoScheduleSafe: false,
    source: 'NIH ODS Magnesium',
  ),
  'magnesium-oxide': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr:
        'يمكن ربطه بوجبة لتحسين التحمل، لكن لا تنقل نفس التوقيت تلقائيًا إذا كان المنتج antacid/laxative أو توجد أدوية تتداخل معه.',
    autoScheduleSafe: false,
    source: 'NIH ODS Magnesium',
  ),
  'potassium-supplements': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'لا يضع التطبيق توقيتًا تلقائيًا للبوتاسيوم؛ الطريقة تعتمد على نفس المنتج والحاجة ووظائف الكلى والأدوية التي ترفع K⁺.',
    autoScheduleSafe: false,
    source: 'NIH ODS Potassium',
  ),
  'omega-3': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr:
        'يمكن ربطه بوجبة لتقليل الطعم أو انزعاج المعدة. راجع جرعة EPA+DHA وأدوية النزف قبل تثبيت الخطة.',
    source: 'NIH ODS Omega-3 Fatty Acids',
  ),
  'biotin': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'يمكن أخذه في وقت ثابت حسب المنتج، لكن يجب إبلاغ المختبر/الطبيب قبل التحاليل لأن إيقافه يعتمد على نوع التحليل والجرعة.',
    autoScheduleSafe: false,
    source: 'FDA Biotin safety communication / NIH ODS Biotin',
  ),
  'vitamin-b6': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'يمكن في وقت ثابت، لكن اجمع B6 من كل المكملات ولا تجعل الجرعات العالية المزمنة تلقائية.',
    source: 'NIH ODS Vitamin B6',
  ),
  'calcium': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'التوقيت يعتمد على الملح: calcium carbonate مع الطعام، وcalcium citrate يمكن مع الطعام أو بدونه. افصل عن الأدوية المتداخلة حسب تعليماتها.',
    autoScheduleSafe: false,
    source: 'NIH ODS Calcium',
  ),
  'magnesium': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'يمكن ربطه بالطعام إذا سبب انزعاجًا؛ الملح والهدف (مكمل أم laxative/antacid) يغيران التعليمات، لذلك لا يُجدول تلقائيًا دون تحديد المنتج.',
    autoScheduleSafe: false,
    source: 'NIH ODS Magnesium',
  ),
  'copper': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'يمكن في وقت ثابت حسب المنتج؛ راجع جرعات الزنك العالية لأنها قد تقلل امتصاص النحاس.',
    source: 'NIH ODS Copper',
  ),
  'chromium': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'لا يحتاج توقيتًا خاصًا عادةً؛ لا تغيّر أدوية السكري أو توقيتها بسبب chromium من نفسك.',
    autoScheduleSafe: false,
    source: 'NIH ODS Chromium',
  ),
  'manganese': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'إذا كان ضمن multivitamin/mineral خذه حسب تعليمات المنتج؛ لا توجد حاجة روتينية لجرعة منفردة عالية.',
    source: 'NIH ODS Manganese',
  ),
  'phosphorus': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'إذا كان phosphate علاجيًا فاتبع وصفة الملح المحدد؛ لا يحول التطبيق بين sodium وpotassium phosphate تلقائيًا.',
    autoScheduleSafe: false,
    source: 'NIH ODS Phosphorus + product labeling',
  ),
  'vitamin-b1-thiamin': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'يمكن مع الطعام أو بدونه في الجرعات الغذائية المعتادة؛ علاج النقص الشديد له خطة طبية منفصلة.',
    source: 'NIH ODS Thiamin',
  ),
  'vitamin-b2-riboflavin': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'يمكن مع الطعام أو بدونه حسب المنتج.',
    source: 'NIH ODS Riboflavin',
  ),
  'vitamin-b3-niacin': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'التوقيت يعتمد على الشكل والجرعة؛ nicotinic acid العلاجي عالي الجرعة يحتاج خطة خاصة ولا يُجدول كمكمل اعتيادي.',
    autoScheduleSafe: false,
    source: 'NIH ODS Niacin',
  ),
  'vitamin-b5-pantothenic-acid': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'يمكن في وقت ثابت حسب المنتج ومع الطعام إذا أزعج المعدة.',
    source: 'NIH ODS Pantothenic Acid',
  ),
  'choline': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'يمكن مع الطعام أو بدونه؛ اربطه بوجبة ثابتة إذا كان ذلك يساعد على الالتزام.',
    source: 'NIH ODS Choline',
  ),
  'creatine-monohydrate': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'الانتظام اليومي أهم من ساعة محددة؛ يمكن ربطه بوجبة أو وقت التدريب، ولا يلزم loading للوصول إلى التشبع مع الاستمرار.',
    source: 'Evidence-based sports nutrition consensus',
  ),
  'melatonin': MedicationTimingRule(
    anchor: 'bedtime',
    instructionAr: 'التوقيت يعتمد على الهدف (أرق أم تعديل الساعة البيولوجية)؛ لا يفترض التطبيق أن كل استعمال يعني نفس وقت النوم.',
    autoScheduleSafe: false,
    source: 'NCCIH Melatonin',
  ),
  'probiotics': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'اتبع تعليمات السلالة/المنتج المحدد؛ لا توجد قاعدة توقيت واحدة لكل probiotics.',
    autoScheduleSafe: false,
    source: 'NCCIH Probiotics + product-specific evidence',
  ),
  'coenzyme-q10': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'يفضل مع وجبة تحتوي بعض الدهون لتحسين الامتصاص.',
    source: 'NCCIH Coenzyme Q10',
  ),
  'molybdenum': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'لا يحتاج توقيتًا خاصًا عادةً؛ غالبًا يكون ضمن multivitamin/mineral ولا توجد حاجة روتينية لمكمل منفرد.',
    source: 'NIH ODS Molybdenum',
  ),

  'semaglutide-oral-tablets': MedicationTimingRule(
    anchor: 'before-breakfast',
    instructionAr:
        'صباحًا على معدة فارغة مع ماء عادي فقط بحد أقصى 120 mL، ثم انتظر 30 دقيقة على الأقل قبل الطعام أو أي شراب/دواء فموي آخر.',
    autoScheduleSafe: false,
    source: 'DailyMed · RYBELSUS / OZEMPIC tablets · 2026',
  ),
  'epipen-auto-injector': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'للطوارئ فقط: استخدمه فور أعراض anaphylaxis حسب خطة الطوارئ ثم اطلب الإسعاف؛ لا يوجد موعد يومي.',
    autoScheduleSafe: false,
    source: 'DailyMed · EPIPEN / EPIPEN Jr IFU',
  ),
  'naloxone-narcan-nasal': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'للطوارئ فقط: أعط الجرعة فور الاشتباه بالـopioid overdose، اتصل بالطوارئ، وكرر بجهاز جديد كل 2–3 دقائق عند الحاجة.',
    autoScheduleSafe: false,
    source: 'DailyMed · NARCAN 4 mg OTC Drug Facts · Aug 2026',
  ),
  'baqsimi-glucagon-nasal': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'للطوارئ عند severe hypoglycemia فقط؛ اتصل بالطوارئ بعد الجرعة ويمكن تكرار جرعة من جهاز جديد بعد 15 دقيقة إذا لم تحدث استجابة.',
    autoScheduleSafe: false,
    source: 'DailyMed · BAQSIMI 3 mg IFU',
  ),
  'dulaglutide-trulicity': MedicationTimingRule(
    anchor: 'weekly',
    instructionAr:
        'مرة أسبوعيًا في نفس اليوم تقريبًا، في أي وقت ومع الطعام أو بدونه؛ يجب أن تفصل 72 ساعة على الأقل بين جرعتين.',
    autoScheduleSafe: false,
    source: 'DailyMed · TRULICITY · 2026',
  ),


  'nayzilam-midazolam-nasal': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'إنقاذ seizure cluster فقط؛ الجرعة الثانية إن كانت مسموحة تكون بعد 10 دقائق بجهاز جديد في فتحة الأنف الأخرى.',
    autoScheduleSafe: false,
    source: 'DailyMed · NAYZILAM IFU',
  ),
  'valtoco-diazepam-nasal': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'إنقاذ seizure cluster فقط؛ الجرعة الثانية إن كانت موصوفة تكون بعد 4 ساعات على الأقل وبعبوة جديدة.',
    autoScheduleSafe: false,
    source: 'DailyMed · VALTOCO · effective Jun 2026',
  ),
  'diastat-acudial-diazepam-rectal': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'إنقاذ seizure cluster فقط؛ الجرعة الثانية ليست تلقائية، وإذا وصفها الطبيب فتكون عادة بعد 4–12 ساعة.',
    autoScheduleSafe: false,
    source: 'DailyMed · DIASTAT / DIASTAT AcuDial caregiver IFU',
  ),
  'gvoke-hypopen-glucagon': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'لـsevere hypoglycemia فقط؛ اتصل بالمساعدة الطبية بعد الحقن ويمكن استخدام جهاز جديد بعد 15 دقيقة إذا لم تحدث استجابة.',
    autoScheduleSafe: false,
    source: 'DailyMed · GVOKE HypoPen IFU',
  ),
  'neffy-epinephrine-nasal': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'لـanaphylaxis فقط؛ إذا لم تتحسن الأعراض أو ساءت، جهاز جديد في نفس فتحة الأنف ابتداءً من 5 دقائق بعد الأولى.',
    autoScheduleSafe: false,
    source: 'DailyMed · neffy · revised Mar 2026',
  ),


  'insulin-degludec-tresiba': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'إنسولين قاعدي مرة يوميًا؛ للبالغ يمكن في أي وقت من اليوم حسب الخطة، وللطفل في نفس الوقت يوميًا. لا ينشئ التطبيق وقتًا أو جرعة تعويضية تلقائيًا.',
    autoScheduleSafe: false,
    source: 'DailyMed · TRESIBA U-100/U-200',
  ),
  'humulin-n-nph': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'وقت NPH وعدد الجرعات يعتمدان على خطة الإنسولين والوجبات؛ لا تستخدم Auto دون معرفة الجدول الموصوف.',
    autoScheduleSafe: false,
    source: 'DailyMed · HUMULIN N',
  ),
  'humulin-r-u100': MedicationTimingRule(
    anchor: 'before-meal',
    instructionAr:
        'HUMULIN R U-100 تحت الجلد يُعطى عادة قبل الوجبة بحوالي 30 دقيقة؛ اختر الوجبة والجرعة من الوصفة ولا ينشئ التطبيق dose correction.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · HUMULIN R U-100',
  ),
  'humulin-70-30': MedicationTimingRule(
    anchor: 'before-meal',
    instructionAr:
        'HUMULIN 70/30 يُعطى عادة قبل الوجبة بحوالي 30–45 دقيقة؛ يحتاج اختيار الوجبة والجدول الموصوف ولا يُفترض تلقائيًا.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · HUMULIN 70/30 · Jun 2026',
  ),
  'humulin-r-u500': MedicationTimingRule(
    anchor: 'before-meal',
    instructionAr:
        'U-500 عالي التركيز ويُعطى عادة مرتين أو ثلاثًا يوميًا قبل الوجبة بنحو 30 دقيقة حسب الوصفة؛ لا ينشئ التطبيق الجرعة أو التحويل أو الجدول.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · HUMULIN R U-500 · Jul 2026',
  ),


  'sumatriptan-tablets': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'لعلاج النوبة الحادة فقط؛ إذا كانت الجرعة الثانية ضمن الوصفة فلا تكون قبل ساعتين، ولا ينشئ التطبيق تكرارًا تلقائيًا.',
    autoScheduleSafe: false,
    source: 'DailyMed · Sumatriptan tablets · Aug 2026',
  ),
  'rizatriptan-odt': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'لعلاج النوبة الحادة؛ للبالغ يمكن تكرار الجرعة بعد ساعتين على الأقل إذا كانت موصوفة، أما الأطفال 6–17 سنة فلا يفترض التطبيق جرعة ثانية خلال 24 ساعة.',
    autoScheduleSafe: false,
    source: 'DailyMed · Rizatriptan ODT · Aug 2026',
  ),
  'rimegepant-nurtec-odt': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'يجب تحديد الاستطباب أولًا: للنوبة الحادة عند الحاجة بحد أقصى 75 mg/24 h، أو للوقاية 75 mg كل يومين؛ لا يستخدم Auto دون اختيار الاستطباب.',
    autoScheduleSafe: false,
    source: 'DailyMed · NURTEC ODT · Mar 2026',
  ),
  'ubrogepant-ubrelvy': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'لعلاج النوبة الحادة؛ الجرعة الثانية إن كانت مسموحة تكون بعد ساعتين على الأقل، لكن التداخلات قد تمنعها لذلك لا ينشئ التطبيق repeat تلقائيًا.',
    autoScheduleSafe: false,
    source: 'DailyMed · UBRELVY',
  ),
  'zavegepant-zavzpret-nasal': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'للنوبة الحادة فقط: جهاز واحد = بخة 10 mg واحدة في فتحة واحدة، ولا أكثر من جرعة واحدة خلال 24 ساعة.',
    autoScheduleSafe: false,
    source: 'DailyMed · ZAVZPRET IFU · Aug 2025',
  ),


  'aspirin-81-antiplatelet-dr': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'إذا كان aspirin 81 mg جزءًا من خطة antiplatelet يومية فخذه في وقت ثابت حسب الوصفة؛ لا ينشئ التطبيق قرار بدء أو إيقاف aspirin للوقاية.',
    autoScheduleSafe: false,
    source: 'DailyMed · Aspirin Low Dose 81 mg DR · Jul 2026',
  ),
  'ticagrelor-brilinta': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'BRILINTA يُؤخذ مرتين يوميًا لكن القوة والمدة تعتمد على الاستطباب؛ لا يستخدم Auto دون معرفة المسار والـstrength الموصوفين.',
    autoScheduleSafe: false,
    source: 'DailyMed · BRILINTA · 2026',
  ),
  'prasugrel': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'مرة يوميًا حسب خطة ACS/PCI والدعامة؛ لا ينشئ التطبيق loading dose أو مدة العلاج.',
    autoScheduleSafe: false,
    source: 'DailyMed · Prasugrel / EFFIENT',
  ),
  'aspirin-er-dipyridamole': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'كبسولة صباحًا وكبسولة مساءً، مع الطعام أو بدونه؛ لا تستبدلها بمكونات منفصلة.',
    autoScheduleSafe: true,
    source: 'DailyMed · Aspirin 25 mg / ER Dipyridamole 200 mg · Jun 2026',
  ),
  'cilostazol': MedicationTimingRule(
    anchor: 'before-meal',
    instructionAr:
        'مرتين يوميًا: قبل الإفطار والعشاء بـ30 دقيقة على الأقل أو بعد كل منهما بساعتين.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · Cilostazol',
  ),


  'mesalamine-lialda': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr:
        'LIALDA مرة يوميًا مع الطعام؛ لا تستخدم Auto إذا كان المنتج mesalamine مختلفًا.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · LIALDA · Mar 2026',
  ),
  'mesalamine-apriso': MedicationTimingRule(
    anchor: 'morning',
    instructionAr:
        'APRISO مرة يوميًا صباحًا مع الطعام أو بدونه، وتجنب antacids معه.',
    autoScheduleSafe: true,
    source: 'DailyMed · APRISO · Aug 2026',
  ),
  'mesalamine-pentasa': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'PENTASA له جدول متعدد الجرعات حسب الوصفة؛ لا يحوله التطبيق إلى once daily اعتمادًا على منتجات mesalamine أخرى.',
    autoScheduleSafe: false,
    source: 'DailyMed · PENTASA',
  ),
  'mesalamine-canasa-suppository': MedicationTimingRule(
    anchor: 'bedtime',
    instructionAr:
        'تحميلة CANASA مرة يوميًا عند النوم، مع محاولة الاحتفاظ بها 1–3 ساعات أو أكثر.',
    autoScheduleSafe: true,
    source: 'DailyMed · CANASA',
  ),
  'mesalamine-rowasa-enema': MedicationTimingRule(
    anchor: 'bedtime',
    instructionAr:
        'ROWASA مرة يوميًا ويفضل عند النوم؛ ابقَ في الوضعية 30 دقيقة على الأقل وحاول الاحتفاظ بها طوال الليل.',
    autoScheduleSafe: true,
    source: 'DailyMed · ROWASA · Aug 2026',
  ),


  'patiromer-veltassa': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'VELTASSA يحتاج عادةً فصل الأدوية الفموية الأخرى 3 ساعات على الأقل قبل أو بعد الجرعة، إلا إذا كان الدواء من الاستثناءات المثبتة في الملصق؛ لذلك لا يستخدم Auto دون مراجعة قائمة الأدوية.',
    autoScheduleSafe: false,
    source: 'DailyMed · VELTASSA · Jan 2025',
  ),
  'sodium-zirconium-cyclosilicate-lokelma': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'LOKELMA يحتاج بصورة عامة فصل الأدوية الفموية الأخرى ساعتين قبل أو بعد الجرعة؛ جدول التصحيح/maintenance والغسيل يختلف، لذلك لا يستخدم Auto.',
    autoScheduleSafe: false,
    source: 'DailyMed · LOKELMA · May 2023',
  ),
  'sevelamer-carbonate-renvela-tablet': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr:
        'RENVELA tablet يؤخذ مع الوجبات. بعض الأدوية تحتاج فواصل خاصة مثل ciprofloxacin وmycophenolate؛ لا يستخدم Auto قبل مراجعة التداخلات.',
    autoScheduleSafe: false,
    source: 'DailyMed · RENVELA · Mar 2023',
  ),
  'sevelamer-carbonate-renvela-powder': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr:
        'RENVELA powder يؤخذ مع الوجبة بعد تحضيره بالماء حسب قوة الـpacket، وبعض الأدوية تحتاج فواصل خاصة؛ لا يستخدم Auto.',
    autoScheduleSafe: false,
    source: 'DailyMed · RENVELA · Mar 2023',
  ),
  'sucroferric-oxyhydroxide-velphoro': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr:
        'VELPHORO يؤخذ مع الوجبات ويجب مضغه/سحقه. levothyroxine قبل الجرعة بـ4 ساعات على الأقل، وبعض الأدوية الأخرى قبلها بساعة؛ لا يستخدم Auto دون مراجعة.',
    autoScheduleSafe: false,
    source: 'DailyMed · VELPHORO · Mar 2026',
  ),


  'amoxicillin-clavulanate-augmentin-es600-suspension': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr:
        'AUGMENTIN ES-600 يُعطى في بداية الوجبة. لا يستخدم Auto إذا كانت عبوة amoxicillin/clavulanate بتركيز/نسبة مختلفة.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · AUGMENTIN ES-600 · Jul 2026',
  ),
  'azithromycin-suspension-200mg5ml': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'Azithromycin suspension 200 mg/5 mL يمكن مع الطعام أو بدونه؛ تجنب إعطاء antacid يحتوي aluminum/magnesium في نفس الوقت.',
    autoScheduleSafe: false,
    source: 'DailyMed · Azithromycin oral suspension · Aug 2026',
  ),
  'cephalexin-suspension-250mg5ml': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'Cephalexin suspension يُعطى حسب الفاصل المكتوب في الوصفة؛ لا يختار التطبيق الجرعة أو المدة تلقائيًا.',
    autoScheduleSafe: false,
    source: 'DailyMed · Cephalexin oral suspension · 2025-2026',
  ),
  'trimethoprim-sulfamethoxazole-suspension-200-40mg5ml':
      MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'TMP-SMX suspension يُعطى حسب الجدول الموصوف مع سوائل كافية إن لم توجد موانع؛ لا يستخدم Auto لأن العلاج والوقاية والتداخلات تختلف.',
    autoScheduleSafe: false,
    source: 'DailyMed · Sulfamethoxazole/Trimethoprim suspension · Mar 2025',
  ),
  'nitrofurantoin-suspension-25mg5ml': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr:
        'Nitrofurantoin suspension 25 mg/5 mL يُعطى مع الطعام. لا يستخدم Auto لاختيار جرعة/مدة أو عند اشتباه pyelonephritis.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · Nitrofurantoin oral suspension · 2024-2026',
  ),


  'potassium-chloride-klor-con-m': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr:
        'KLOR-CON M يؤخذ مع الوجبة وكوب كامل من الماء. تعليمات التقسيم/التفريق بالماء خاصة بهذا المنتج ولا تُعمم على potassium ER آخر.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · KLOR-CON M',
  ),
  'potassium-chloride-er-capsule-sprinkle': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr:
        'Potassium chloride ER capsule يؤخذ مع الوجبة وكوب كامل من السائل. عند فتح الكبسولة لا تُمضغ microcapsules ولا تُخلط بطعام ساخن.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · Potassium Chloride ER Capsules · Apr 2024',
  ),
  'potassium-chloride-oral-solution': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr:
        'Potassium chloride oral solution يجب تخفيفه أولًا في 4 أونصات ماء بارد على الأقل ثم أخذه مع الوجبة أو بعدها مباشرة؛ لا يستخدم Auto قبل تأكيد التركيز والجرعة.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · Potassium Chloride Oral Solution',
  ),
  'calcium-acetate-667mg-capsule': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr:
        'Calcium acetate يؤخذ مع كل وجبة لربط الفوسفات. الأدوية الفموية المهمة قد تحتاج قبلها بساعة أو بعدها بثلاث ساعات حسب الخطة.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · Calcium Acetate 667 mg',
  ),
  'lanthanum-carbonate-fosrenol-chewable': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr:
        'FOSRENOL chewable يؤخذ مع الوجبة أو بعدها مباشرة ويجب مضغه/سحقه بالكامل. Quinolone قبلها بساعة أو بعدها 4 ساعات، وlevothyroxine قبل/بعدها بساعتين.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · FOSRENOL · Dec 2024',
  ),


  'teriparatide-forteo': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'FORTEO حقنة تحت الجلد مرة يوميًا؛ لا يحتاج ربطًا بالطعام. أول عدة جرعات تُعطى حيث يمكن الجلوس/الاستلقاء إذا حدث دوار، والحفظ بالثلاجة جزء أساسي من الخطة.',
    autoScheduleSafe: false,
    source: 'DailyMed · FORTEO · Aug 2026',
  ),
  'abaloparatide-tymlos': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'TYMLOS مرة يوميًا تقريبًا في نفس الوقت، مع الطعام أو بدونه؛ بعد أول استخدام يتغير الحفظ إلى درجة الغرفة لمدة 30 يومًا.',
    autoScheduleSafe: false,
    source: 'DailyMed · TYMLOS · Aug 2026',
  ),
  'romosozumab-evenity': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'EVENITY جرعة عيادية شهرية من حقنتين متتاليتين، لمدة 12 شهرًا فقط؛ إذا فات الموعد يُعاد بناء الجدول من تاريخ الجرعة الجديدة.',
    autoScheduleSafe: false,
    source: 'DailyMed · EVENITY · Aug 2026',
  ),
  'zoledronic-acid-osteoporosis': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'Zoledronic acid 5 mg/100 mL للـosteoporosis تسريب عيادي طويل الفاصل؛ لا يحدد Auto موعدًا قبل تأكيد الاستطباب، وظائف الكلى، الترطيب والكالسيوم.',
    autoScheduleSafe: false,
    source: 'DailyMed · Zoledronic Acid Injection 5 mg/100 mL · Sep 2026',
  ),


  'calcium-carbonate-antacid-500mg-chewable': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'Calcium carbonate antacid يُستخدم عند الحاجة حسب نفس قوة المنتج. قد يحتاج فصلًا عن بعض الأدوية الفموية؛ لا يعتمد Auto على فاصل موحد لكل الأدوية.',
    autoScheduleSafe: false,
    source: 'DailyMed · Calcium Carbonate 500 mg Chewable · Apr 2026',
  ),
  'magnesium-hydroxide-milk-of-magnesia-2400mg30ml': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'Milk of Magnesia له تعليمات مختلفة للحموضة والإمساك. للملين يُرج جيدًا ويؤخذ مع كوب 8 oz من السوائل؛ لا يستخدم Auto قبل تحديد الغرض.',
    autoScheduleSafe: false,
    source: 'DailyMed · Milk of Magnesia 2400 mg/30 mL · 2026',
  ),
  'glycerin-adult-suppository-2g': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'Glycerin adult suppository للاستخدام الشرجي عند الحاجة؛ احتفظ بها 15 دقيقة إن أمكن، ولا تتجاوز تحميلة واحدة يوميًا لنفس المنتج.',
    autoScheduleSafe: false,
    source: 'DailyMed · Adult Glycerin Suppository 2 g · 2026',
  ),
  'meclizine-25mg-motion-sickness-otc': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'Meclizine 25 mg لدوار الحركة: الجرعة الأولى قبل النشاط بـ30–60 دقيقة؛ قد يسبب نعاسًا، ولا يستخدم Auto لتكرار جرعات إضافية في اليوم.',
    autoScheduleSafe: false,
    source: 'DailyMed · Meclizine HCl 25 mg Motion Sickness · Aug 2026',
  ),

};


const medicationPatientTimingOverrides = <String, String>{
  'insulin-lispro':
      'اربط الجرعة بالوجبة تمامًا حسب خطة الإنسولين الخاصة بك؛ لا تحقن ثم تؤخر أو تتجاوز الوجبة من دون خطة واضحة.',
  'prednisone':
      'اتبع وقت الجرعة المكتوب في الوصفة. إذا كانت جرعة واحدة يوميًا فكثيرًا ما تُنظم صباحًا، أما الجرعات المقسمة أو taper فلها جدول خاص.',
  'metoclopramide':
      'قد يُؤخذ قبل الوجبات حسب سبب الاستخدام؛ التزم بالوقت المكتوب في وصفتك ولا تمدد العلاج من نفسك.',
  'sildenafil-ed':
      'يُستخدم عند الحاجة قبل النشاط الجنسي حسب الوصفة، وليس كجرعة يومية ثابتة إلا إذا وصف الطبيب نظامًا مختلفًا.',
  'salbutamol-mdi':
      'يُستخدم غالبًا عند الحاجة حسب خطة الربو/COPD. إذا أصبحت تحتاجه أكثر من المعتاد فراجع السيطرة على المرض بدل زيادة الاستخدام من نفسك.',
  'insulin-glargine':
      'هذا إنسولين قاعدي يُعطى في الوقت المحدد لخطة منتجك، وغالبًا في وقت ثابت يوميًا. لا تربطه بالوجبات مثل الإنسولين السريع.',
  'budesonide-formoterol':
      'استخدم جرعات الصيانة في الأوقات المكتوبة. إذا وصفه الطبيب أيضًا كمسكن ضمن MART/SMART فاتبع نفس خطة البخاخ بدقة.',
  'montelukast':
      'وقت الجرعة يعتمد على سبب الاستخدام والعمر؛ التزم بالوقت المكتوب في الوصفة ولا تستخدمه كدواء إسعاف للنوبة.',
  'tofacitinib':
      'النوع العادي وXR لهما جداول مختلفة؛ اتبع اسم المنتج وعدد المرات المكتوب ولا تبدل بينهما بنفسك.',
  'dupilumab':
      'الحقن قد تكون أسبوعية أو كل أسبوعين أو كل 4 أسابيع حسب الحالة والعمر؛ التزم بيوم وجدول الحقن الموصوف.',
  'gabapentin':
      'النوع العادي والمنتجات ممتدة المفعول ليست نفس طريقة الاستخدام أو علاقة الطعام؛ اتبع اسم المنتج وجدوله.',
  'azithromycin':
      'الحبوب/المعلق العادي يمكن غالبًا أخذهما مع الطعام أو بدونه، بينما بعض المنتجات ممتدة المفعول لها تعليمات معدة فارغة؛ اتبع منتجك.',
  'metronidazole-oral':
      'تعليمات الطعام تختلف بين النوع العادي والممتد المفعول؛ اتبع اسم المنتج والوقت المكتوب في الوصفة.',
  'ciprofloxacin-ophthalmic':
      'استخدم القطرات أو المرهم في المواعيد وعدد المرات المكتوب لمنتجك، ولا تستخدم طريقة المرهم كأنها نفس طريقة القطرات.',
  'ciprofloxacin-otic':
      'استخدم قطرات الأذن في المواعيد وعدد القطرات المكتوب لمنتجك؛ بعض المنتجات مركبة مع steroid ولها تعليمات مختلفة.',
  'ipratropium-hfa':
      'قد يكون البخاخ مجدولًا أو حسب الحاجة حسب خطة COPD/الربو؛ اتبع عدد البخات والمواعيد المكتوبة لجهازك.',
  'cefuroxime-axetil':
      'تعليمات الطعام تختلف حسب الشكل الصيدلاني؛ اتبع منتجك، وكثير من الأقراص تؤخذ بعد الطعام لتحسين الامتصاص.',
  'quetiapine':
      'النوع العادي وXR يختلفان في التوقيت والطعام؛ اتبع اسم المنتج والجدول المكتوب ولا تسحق XR.',
  'diclofenac-oral':
      'النوع العادي والمغلف معويًا والممتد المفعول ليست نفس طريقة الاستخدام؛ اتبع المنتج والجرعات المكتوبة.',
  'colchicine':
      'جدول علاج نوبة النقرس مختلف عن جدول الوقاية؛ استخدم النظام المكتوب لك ولا تكرر جرعات النوبة من وصفة قديمة.',
  'adalimumab':
      'الحقن قد تكون أسبوعية أو كل أسبوعين وقد توجد جرعات تحميل حسب المرض؛ اتبع جدول نفس المنتج والاستطباب.',
  'paracetamol-pediatric-liquid':
      'يُعطى حسب الحاجة للحمى أو الألم مع الالتزام بالفاصل المكتوب على نفس التركيز وعدم إعطاء جرعتين متقاربتين.',
  'hydrocortisone-topical':
      'ضع طبقة رقيقة على المنطقة المصابة حسب عدد المرات المكتوب، ووزّع الدهان على اليوم بما يناسب تعليمات الوصفة.',
  'pediatric-iron':
      'توقيت حديد الطفل يعتمد على التركيز ونمط الرضاعة/الطعام وخطة العلاج؛ اتبع تعليمات طبيب الأطفال أو الصيدلي لنفس المنتج.',
  'multivitamin-mineral':
      'اختر وقتًا ثابتًا يناسبك بعد مراجعة المكونات؛ وجود الحديد أو الكالسيوم أو المغنيسيوم قد يحتاج فصله عن بعض الأدوية.',
  'prenatal-combination':
      'يمكن تنظيم prenatal في وقت ثابت يتحمله المعدة، لكن وجود الحديد/الكالسيوم قد يحتاج فصله عن بعض الأدوية مثل levothyroxine.',
};

String medicationPatientTimingInstruction(String sourceId) {
  final override = medicationPatientTimingOverrides[sourceId];
  if (override != null && override.trim().isNotEmpty) return override.trim();
  return medicationTimingRules[sourceId]?.instructionAr.trim() ?? '';
}
