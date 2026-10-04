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
    instructionAr: 'Nitrofurantoin monohydrate/macrocrystals يؤخذ مع الطعام (عمليًا غالبًا مع الفطور والعشاء) لتحسين التحمل والامتصاص.',
    source: 'DailyMed · Nitrofurantoin monohydrate/macrocrystals · 2026',
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
    instructionAr: 'مرة يوميًا صباحًا تقريبًا، مع الطعام أو بدونه. قبل عملية أو صيام مطول: يُوقف 3 أيام على الأقل إن أمكن ويُستأنف بعد الاستقرار وعودة الأكل والشرب.',
    source: 'DailyMed JARDIANCE · Sep 2026',
  ),
  'semaglutide-injection': MedicationTimingRule(
    anchor: 'weekly',
    instructionAr: 'مرة أسبوعيًا في نفس اليوم من كل أسبوع.',
    source: 'MedlinePlus Semaglutide',
  ),
  'methotrexate-rheumatology': MedicationTimingRule(
    anchor: 'weekly',
    instructionAr:
        'هذا السجل خاص بالاستخدام غير الأورامي للروماتيزم/الجلدية: يوم واحد محدد في الأسبوع—not يوميًا. لا تطبق قاعدة الأسبوعي على بروتوكولات الأورام.',
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
    instructionAr: 'مرة يوميًا ويمكن مع الطعام أو بدونه. قبل عملية أو صيام مطول: يُوقف 3 أيام على الأقل إن أمكن ويُستأنف بعد الاستقرار وعودة الأكل والشرب حسب الخطة.',
    source: 'DailyMed Dapagliflozin · Sep 2026',
  ),
  'insulin-lispro': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'HUMALOG/ADMELOG تحت الجلد: خلال 15 دقيقة قبل الوجبة أو مباشرة بعدها. لا يستخدم Auto إذا لم تكن الوجبة والجرعة محددتين.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed HUMALOG Jan 2026 + ADMELOG May 2025',
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
    instructionAr: 'Ciprofloxacin tablet يمكن مع الطعام أو بدونه، لكن لا تأخذه مع الحليب/اللبن أو calcium-fortified juice وحدها. افصل Mg/Al antacids وsucralfate والحديد والزنك والكالسيوم ساعتين قبل أو 6 ساعات بعد.',
    autoScheduleSafe: false,
    source: 'DailyMed · Ciprofloxacin tablets · 2026',
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
    instructionAr: 'Pantoprazole DR tablets تُبتلع كاملة ويمكن مع الطعام أو بدونه. الـgranules مختلفة: تؤخذ نحو 30 دقيقة قبل الوجبة وبـapple juice/applesauce فقط.',
    autoScheduleSafe: false,
    source: 'DailyMed · Pantoprazole tablets / granules · 2026',
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
    instructionAr: 'Ondansetron لا يملك قاعدة طعام عامة؛ التوقيت يعتمد على السبب. إذا كان ODT: بيدين جافتين peel back foil ولا تدفع الحبة عبره، وضعها على اللسان لتذوب.',
    requiresMealChoice: false,
    autoScheduleSafe: false,
    source: 'DailyMed · Ondansetron ODT · 2025-2026',
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
    source: 'DailyMed XALATAN',
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
    instructionAr: 'Clindamycin capsules يمكن مع الطعام أو بدونه، لكن تُبتلع مع كوب ماء كامل 200–250 mL وعدم الاستلقاء لمدة 30 دقيقة لتقليل تهيج المريء.',
    requiresMealChoice: false,
    autoScheduleSafe: true,
    source: 'DailyMed · Clindamycin hydrochloride capsules · Sep 2026',
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
    source: 'DailyMed Nitroglycerin SL · Aug 2026',
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
    instructionAr: 'Clarithromycin immediate-release يمكن مع الطعام أو بدونه، بينما ER يجب مع الطعام ويُبتلع كاملًا. إذا لم يتحدد formulation فلا تستخدم Auto.',
    autoScheduleSafe: false,
    source: 'DailyMed · Clarithromycin IR/ER',
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


  'permethrin-5-cream-scabies': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'Permethrin 5% للجرب يحتاج تطبيقًا كاملًا وcontact time من 8–14 ساعة قبل الغسل؛ لا يستخدم Auto كتوقيت جرعة يومية متكررة.',
    autoScheduleSafe: false,
    source: 'DailyMed · Permethrin Cream 5% · Mar 2026',
  ),
  'clotrimazole-1-cream-otc': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'Clotrimazole 1% cream مرتان يوميًا صباحًا ومساءً؛ مدة العلاج تعتمد على الموقع: 4 أسابيع للقدم الرياضي/ringworm و2 أسبوع لـjock itch.',
    autoScheduleSafe: false,
    source: 'DailyMed · Clotrimazole 1% Cream · Aug 2026',
  ),
  'adapalene-0-1-gel-otc': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'Adapalene 0.1% يُستخدم مرة واحدة يوميًا على كامل المنطقة المعرضة للحبوب؛ الزيادة عن مرة يوميًا تزيد التهيج ولا تسرع النتيجة.',
    autoScheduleSafe: false,
    source: 'DailyMed · Adapalene Gel USP 0.1% · Jul 2026',
  ),
  'mupirocin-2-ointment-impetigo': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'Mupirocin 2% skin ointment يوضع 3 مرات يوميًا للمدة الموصوفة؛ إذا لا يوجد تحسن خلال 3–5 أيام يحتاج إعادة تقييم.',
    autoScheduleSafe: false,
    source: 'DailyMed · Mupirocin Ointment USP 2% · Jul 2026',
  ),


  'drospirenone-slynd-4mg': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'SLYND حبة يوميًا: 24 active ثم 4 inert. نسيان حبتين active أو أكثر يحتاج backup غير هرموني 7 أيام؛ لا يعتمد Auto جدولًا عاديًا للحبة المنسية.',
    autoScheduleSafe: false,
    source: 'DailyMed · SLYND drospirenone · Aug 2026',
  ),
  'medroxyprogesterone-depo-provera-ci-150mg-im': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'Depo-Provera CI 150 mg IM موعده كل 13 أسبوعًا. إذا تجاوز الفاصل 13 أسبوعًا يجب استبعاد الحمل قبل الجرعة التالية؛ لا يستخدم Auto لتعويض موعد متأخر.',
    autoScheduleSafe: false,
    source: 'DailyMed · Medroxyprogesterone Acetate 150 mg/mL IM · Aug 2026',
  ),
  'etonogestrel-ethinyl-estradiol-vaginal-ring': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'الحلقة المهبلية: 3 أسابيع داخل المهبل ثم أسبوع واحد فقط بدون حلقة. خروجها >3 ساعات أو تمديد ring-free interval يحتاج قواعد backup خاصة.',
    autoScheduleSafe: false,
    source: 'DailyMed · Etonogestrel/EE Vaginal Ring · Sep 2026',
  ),
  'norelgestromin-ethinyl-estradiol-patch': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'لاصقة norelgestromin/EE: لصقة أسبوعية لثلاثة أسابيع ثم أسبوع رابع بدون لصقة. الانفصال >1 يوم أو التأخر ≥48 ساعة قد يبدأ دورة جديدة مع backup 7 أيام.',
    autoScheduleSafe: false,
    source: 'DailyMed · Norelgestromin/EE Transdermal System · Apr 2026',
  ),


  'glipizide-ir': MedicationTimingRule(
    anchor: 'before-meal',
    instructionAr:
        'Glipizide العادي يؤخذ تقريبًا قبل الوجبة بـ30 دقيقة. لا تستخدم نفس القاعدة للنوع ER.',
    requiresMealChoice: true,
    source: 'DailyMed · Glipizide IR · Feb 2026',
  ),
  'glipizide-er': MedicationTimingRule(
    anchor: 'breakfast',
    instructionAr:
        'Glipizide ER مرة يوميًا مع الفطور أو أول وجبة رئيسية في اليوم؛ ابتلع الحبة كاملة.',
    source: 'DailyMed · Glipizide ER · Aug 2026',
  ),
  'insulin-aspart-novolog': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr:
        'NOVOLOG-type insulin aspart تحت الجلد خلال 5–10 دقائق قبل الوجبة. يجب أن تكون الوجبة جاهزة؛ بعض منتجات aspart الأسرع لها توقيت مختلف.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · NOVOLOG insulin aspart',
  ),
  'isosorbide-mononitrate-er': MedicationTimingRule(
    anchor: 'morning',
    instructionAr:
        'الجرعة اليومية من isosorbide mononitrate ER تؤخذ صباحًا عند الاستيقاظ حسب الملصق.',
    source: 'DailyMed · Isosorbide Mononitrate ER · Mar 2025',
  ),
  'clonidine-transdermal': MedicationTimingRule(
    anchor: 'weekly',
    instructionAr:
        'لاصقة clonidine تُستبدل كل 7 أيام في نفس يوم الأسبوع تقريبًا وعلى موضع جلدي جديد.',
    autoScheduleSafe: false,
    source: 'DailyMed · Clonidine Transdermal System · Mar 2026',
  ),
  'esomeprazole-dr-capsule': MedicationTimingRule(
    anchor: 'before-meal',
    instructionAr:
        'Esomeprazole delayed-release capsule قبل الطعام بساعة على الأقل. عدد الجرعات والوجبات المستهدفة يعتمد على الاستطباب.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · Esomeprazole Magnesium DR capsules',
  ),
  'fosfomycin-tromethamine-sachet': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'Fosfomycin 3 g sachet لالتهاب المثانة غير المعقد: جرعة واحدة فقط، تذاب بالماء وتشرب فورًا؛ ليست جرعة يومية متكررة.',
    autoScheduleSafe: false,
    source: 'DailyMed · Fosfomycin Tromethamine granules · 2026',
  ),
  'levofloxacin-oral': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'يمكن مع الطعام أو بدونه؛ افصل ساعتين على الأقل قبل/بعد مضادات الحموضة Mg/Al وsucralfate والحديد والزنك.',
    source: 'DailyMed · Levofloxacin tablets',
  ),
  'topiramate-tablets': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'يمكن مع الطعام أو بدونه وفي أوقات ثابتة؛ حافظ على سوائل كافية ولا توقفه فجأة.',
    source: 'DailyMed · Topiramate tablets · 2026',
  ),
  'aripiprazole-tablets': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'Aripiprazole tablets مرة يوميًا مع الطعام أو بدونه؛ اختر وقتًا ثابتًا حسب التحمل والخطة.',
    source: 'DailyMed · Aripiprazole tablets · Aug 2026',
  ),
  'olanzapine-tablets': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'Olanzapine tablet مرة يوميًا مع الطعام أو بدونه؛ توقيت اليوم يحدد حسب الخطة والتحمل وليس الطعام.',
    source: 'DailyMed · ZYPREXA · Jan 2026',
  ),
  'tranexamic-acid-hmb-650mg': MedicationTimingRule(
    anchor: 'any',
    instructionAr:
        'لـheavy menstrual bleeding يبدأ فقط بعد بدء الدورة ولمدة أقصاها 5 أيام في الدورة؛ لا ينشئ Auto جدولًا مستمرًا طوال الشهر.',
    autoScheduleSafe: false,
    source: 'DailyMed · Tranexamic Acid 650 mg tablets · 2026',
  ),
  'micronized-progesterone-oral': MedicationTimingRule(
    anchor: 'bedtime',
    instructionAr:
        'Progesterone micronized oral capsule يؤخذ كجرعة يومية عند النوم في الأيام المحددة بالخطة بسبب الدوخة/النعاس.',
    autoScheduleSafe: false,
    source: 'DailyMed · PROMETRIUM/progesterone capsules · Jan 2026',
  ),

  'canagliflozin-invokana': MedicationTimingRule(
    anchor: 'before-breakfast',
    instructionAr: 'INVOKANA لتحسين السكر يؤخذ مرة يوميًا قبل أول وجبة؛ أوقفه 3 أيام على الأقل قبل الجراحة/الصيام الطويل إذا أمكن وفق الخطة.',
    source: 'DailyMed · INVOKANA · Jun 2026',
  ),
  'ertugliflozin-steglatro': MedicationTimingRule(
    anchor: 'morning',
    instructionAr: 'STEGLATRO مرة يوميًا صباحًا مع الطعام أو بدونه؛ قبل الجراحة/الصيام الطويل يحتاج hold لمدة 4 أيام على الأقل إذا أمكن.',
    source: 'DailyMed · STEGLATRO · Jun 2026',
  ),
  'acarbose': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'خذ acarbose مع أول لقمة من كل وجبة رئيسية؛ إذا لم توجد وجبة فلا توجد جرعة مرتبطة بها.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · Acarbose tablets',
  ),
  'repaglinide': MedicationTimingRule(
    anchor: 'before-meal',
    instructionAr: 'خذ repaglinide خلال 30 دقيقة قبل الوجبة؛ إذا تخطيت الوجبة فتخطَّ الجرعة.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · Repaglinide tablets',
  ),
  'nateglinide': MedicationTimingRule(
    anchor: 'before-meal',
    instructionAr: 'خذ nateglinide قبل الوجبة بـ1–30 دقيقة؛ إذا لم تأكل الوجبة فلا تأخذ الجرعة.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · Nateglinide · Feb 2025',
  ),
  'glyburide': MedicationTimingRule(
    anchor: 'breakfast',
    instructionAr: 'Glyburide يؤخذ مع الفطور أو أول وجبة رئيسية حسب الوصفة؛ لا تأخذه ثم تتجاوز الوجبة.',
    source: 'DailyMed · Glyburide tablets',
  ),
  'saxagliptin': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Saxagliptin مرة يوميًا مع الطعام أو بدونه؛ ثبّت وقتًا مناسبًا.',
    source: 'DailyMed · Saxagliptin · Jan 2026',
  ),
  'insulin-aspart-fiasp': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'FIASP يُحقن عند بدء الوجبة أو خلال 20 دقيقة بعد بدء الأكل؛ لا تستخدم توقيت NOVOLOG تلقائيًا.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · FIASP insulin aspart',
  ),
  'insulin-glulisine-apidra': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'APIDRA تحت الجلد خلال 15 دقيقة قبل الوجبة أو خلال 20 دقيقة بعد بدء الأكل.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · APIDRA · May 2025',
  ),
  'etonogestrel-implant-nexplanon': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'NEXPLANON لا يملك جرعة يومية؛ الموافقة الأمريكية الحالية تسمح بمنع الحمل حتى 5 سنوات من الإدخال.',
    autoScheduleSafe: false,
    source: 'FDA/Organon · NEXPLANON duration update · Jan 2026',
  ),
  'levonorgestrel-ius-mirena': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'MIRENA: لمنع الحمل حتى 8 سنوات، ولعلاج غزارة الدورة حتى 5 سنوات؛ احفظ تاريخ الإدخال حسب الاستطباب.',
    autoScheduleSafe: false,
    source: 'Bayer official MIRENA Prescribing Information',
  ),
  'copper-iud-paragard': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'PARAGARD لا يملك جرعة يومية؛ يُزال بحد أقصى 10 سنوات من تاريخ الإدخال.',
    autoScheduleSafe: false,
    source: 'DailyMed · PARAGARD · Jun 2024',
  ),
  'testosterone-gel-1-62': MedicationTimingRule(
    anchor: 'morning',
    instructionAr: 'Testosterone gel 1.62% يُستخدم صباحًا على الكتفين/أعلى الذراعين فقط؛ لا تُعمم تعليمات gel 1% عليه.',
    autoScheduleSafe: false,
    source: 'DailyMed · Testosterone Gel 1.62% · Feb 2026',
  ),
  'desmopressin-nocdurna': MedicationTimingRule(
    anchor: 'bedtime',
    instructionAr: 'NOCDURNA تحت اللسان بدون ماء قبل النوم بساعة؛ قلل السوائل من ساعة قبل الجرعة حتى 8 ساعات بعدها.',
    autoScheduleSafe: false,
    source: 'DailyMed · NOCDURNA',
  ),
  'cabergoline-hyperprolactinemia': MedicationTimingRule(
    anchor: 'weekly',
    instructionAr: 'Cabergoline للـhyperprolactinemia عادة يومان محددان بالأسبوع حسب الوصفة—not يوميًا.',
    autoScheduleSafe: false,
    source: 'DailyMed · Cabergoline · Jun 2026',
  ),
  'enalapril': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Enalapril يؤخذ في وقت ثابت مع الطعام أو بدونه؛ راقب potassium/الكلى ولا يستخدم بالحمل.',
    source: 'DailyMed · Enalapril · Jul 2026',
  ),
  'telmisartan': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Telmisartan مرة يوميًا في وقت ثابت مع الطعام أو بدونه؛ راقب potassium/الكلى ولا يستخدم بالحمل.',
    source: 'DailyMed · Telmisartan · May 2026',
  ),
  'nebivolol': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Nebivolol مرة يوميًا مع الطعام أو بدونه؛ لا توقف beta blocker فجأة.',
    source: 'DailyMed · Nebivolol · Jun 2026',
  ),
  'candesartan': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Candesartan يمكن مع الطعام أو بدونه؛ الجرعة/titration تختلف بين الضغط وفشل القلب.',
    source: 'DailyMed · Candesartan · 2026',
  ),


  'alogliptin': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Alogliptin مرة يوميًا مع الطعام أو بدونه؛ الجرعة تعتمد على وظيفة الكلى.',
    source: 'DailyMed · Alogliptin tablets',
  ),
  'insulin-human-regular-humulin-r': MedicationTimingRule(
    anchor: 'before-meal',
    instructionAr: 'HUMULIN R U-100 تحت الجلد يُحقن تقريبًا قبل الوجبة بـ30 دقيقة.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · HUMULIN R U-100',
  ),
  'insulin-nph-humulin-n': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'HUMULIN N توقيته يعتمد على خطة الإنسولين والوجبات؛ لا تفترض أنه دائمًا قبل النوم.',
    autoScheduleSafe: false,
    source: 'DailyMed · HUMULIN N',
  ),
  'ramipril': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Ramipril يؤخذ في مواعيد ثابتة حسب الوصفة؛ الطعام ليس العامل الأساسي.',
    source: 'DailyMed · Ramipril · Aug 2026',
  ),
  'irbesartan': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Irbesartan مرة يوميًا مع الطعام أو بدونه وفي وقت ثابت تقريبًا.',
    source: 'DailyMed · Irbesartan',
  ),
  'atenolol': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Atenolol في وقت ثابت حسب الوصفة؛ لا توقفه فجأة.',
    source: 'DailyMed · Atenolol · 2026',
  ),
  'clonidine-oral': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Clonidine tablets تُؤخذ في المواعيد المكتوبة بدقة؛ لا توقفها فجأة ولا تعاملها كلصقة أسبوعية.',
    autoScheduleSafe: false,
    source: 'DailyMed · Clonidine tablets · 2026',
  ),
  'doxazosin': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Doxazosin IR مرة يوميًا صباحًا أو مساءً؛ بعد انقطاع عدة أيام قد يلزم الرجوع لجرعة البداية.',
    autoScheduleSafe: false,
    source: 'DailyMed · Doxazosin · Sep 2026',
  ),
  'hydrocortisone-adrenal-replacement': MedicationTimingRule(
    anchor: 'morning',
    instructionAr: 'Adrenal replacement: أكبر جرعة hydrocortisone عند الاستيقاظ عادةً ثم جرعات أصغر لاحقًا حسب خطة الغدد؛ المرض يحتاج sick-day plan.',
    autoScheduleSafe: false,
    source: 'Endocrine Society · Primary Adrenal Insufficiency guideline',
  ),
  'fludrocortisone-adrenal-replacement': MedicationTimingRule(
    anchor: 'morning',
    instructionAr: 'Fludrocortisone replacement عادة مرة يوميًا في وقت ثابت؛ راقب الضغط والتورم وpotassium حسب الخطة.',
    source: 'DailyMed + Endocrine Society adrenal insufficiency guideline',
  ),
  'estradiol-patch-twice-weekly': MedicationTimingRule(
    anchor: 'weekly',
    instructionAr: 'Estradiol patch twice-weekly تُغيّر مرتين بالأسبوع كل 3–4 أيام تقريبًا؛ لا تعاملها كلصقة أسبوعية.',
    autoScheduleSafe: false,
    source: 'DailyMed · Estradiol transdermal system twice-weekly',
  ),
  'estradiol-vagifem': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'VAGIFEM: يوميًا لمدة أسبوعين ثم مرتين أسبوعيًا؛ هذا جدول ذو مرحلتين.',
    autoScheduleSafe: false,
    source: 'DailyMed · VAGIFEM',
  ),
  'progesterone-endometrin': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'ENDOMETRIN ضمن ART: مهبليًا مرتين أو ثلاث مرات يوميًا حسب بروتوكول مركز الخصوبة؛ لا auto-schedule.',
    autoScheduleSafe: false,
    source: 'DailyMed · ENDOMETRIN · Jul 2026',
  ),
  'drospirenone-pop-slynd': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'SLYND: حبة كل 24 ساعة تقريبًا؛ 24 active ثم 4 inert، وقواعد missed pills خاصة بالمنتج.',
    autoScheduleSafe: false,
    source: 'DailyMed · SLYND + CDC U.S. SPR 2024',
  ),
  'xulane-contraceptive-patch': MedicationTimingRule(
    anchor: 'weekly',
    instructionAr: 'XULANE: لصقة جديدة أسبوعيًا لمدة 3 أسابيع ثم أسبوع رابع بدون لصقة.',
    autoScheduleSafe: false,
    source: 'DailyMed · XULANE',
  ),
  'annovera-vaginal-ring': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'ANNOVERA: 21 يومًا داخل المهبل ثم 7 أيام خارج؛ نفس الحلقة تُعاد حتى 13 دورة.',
    autoScheduleSafe: false,
    source: 'DailyMed · ANNOVERA · Sep 2026',
  ),
  'liothyronine-cytomel': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'CYTOMEL مرة يوميًا وبنفس ظروف الاستخدام تقريبًا؛ افصل bile-acid sequestrants/ion-exchange resins 4 ساعات حسب الملصق.',
    source: 'DailyMed · CYTOMEL · May 2026',
  ),
  'medroxyprogesterone-oral': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Medroxyprogesterone tablets غالبًا كورس 5–10 أيام؛ بداية الكورس تعتمد على الاستطباب ويوم الدورة، لذلك لا auto-schedule دون معرفة الخطة.',
    autoScheduleSafe: false,
    source: 'DailyMed · Medroxyprogesterone acetate tablets · Jun 2026',
  ),
  'hydralazine-oral': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Hydralazine قد يحتاج عدة جرعات يوميًا؛ خذه بنفس العلاقة مع الطعام كل مرة لأن الطعام يرفع مستواه.',
    autoScheduleSafe: false,
    source: 'DailyMed · Hydralazine hydrochloride tablets',
  ),
  'labetalol-oral': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Labetalol oral غالبًا جرعات متعددة/مرتين يوميًا حسب الوصفة؛ خذه بنفس العلاقة مع الطعام كل مرة.',
    autoScheduleSafe: false,
    source: 'DailyMed · Labetalol hydrochloride tablets · Mar 2026',
  ),


  'insulin-lispro-humalog': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'HUMALOG يُحقن خلال 15 دقيقة قبل الوجبة أو مباشرة بعد تناولها.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · HUMALOG insulin lispro',
  ),
  'insulin-lispro-lyumjev': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'LYUMJEV يُحقن عند بدء الوجبة أو خلال 20 دقيقة بعد بدء الأكل.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · LYUMJEV insulin lispro-aabc',
  ),
  'insulin-glargine-toujeo': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'TOUJEO U-300 مرة يوميًا في نفس الوقت كل يوم؛ لا يرتبط بوجبة.',
    source: 'DailyMed · TOUJEO U-300',
  ),
  'insulin-glargine-basaglar': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'BASAGLAR مرة يوميًا في نفس الوقت كل يوم؛ لا يرتبط بوجبة.',
    source: 'DailyMed · BASAGLAR',
  ),
  'semaglutide-rybelsus': MedicationTimingRule(
    anchor: 'empty-stomach',
    instructionAr: 'RYBELSUS صباحًا على معدة فارغة مع ماء عادي فقط ≤4 oz، ثم انتظر 30 دقيقة قبل الطعام/الشراب/الأدوية الفموية.',
    autoScheduleSafe: false,
    source: 'DailyMed · RYBELSUS · 2026',
  ),
  'semaglutide-ozempic': MedicationTimingRule(
    anchor: 'weekly',
    instructionAr: 'OZEMPIC مرة أسبوعيًا في نفس اليوم؛ missed dose تؤخذ خلال 5 أيام فقط، وتغيير اليوم يتطلب ≥48 ساعة بين الجرعتين.',
    autoScheduleSafe: false,
    source: 'DailyMed · OZEMPIC',
  ),
  'exenatide-byetta': MedicationTimingRule(
    anchor: 'before-meal',
    instructionAr: 'BYETTA خلال 60 دقيقة قبل وجبتين رئيسيتين متباعدتين نحو 6 ساعات أو أكثر؛ لا تؤخذ بعد الوجبة.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · BYETTA',
  ),
  'exenatide-bydureon-bcise': MedicationTimingRule(
    anchor: 'weekly',
    instructionAr: 'BYDUREON BCISE مرة كل 7 أيام؛ missed dose فقط إذا بقي ≥3 أيام للجرعة التالية.',
    autoScheduleSafe: false,
    source: 'DailyMed · BYDUREON BCISE',
  ),
  'verelan-pm': MedicationTimingRule(
    anchor: 'bedtime',
    instructionAr: 'VERELAN PM مرة يوميًا عند النوم؛ لا تنقل توقيت verapamil ER آخر إليه.',
    autoScheduleSafe: false,
    source: 'DailyMed · VERELAN PM',
  ),
  'eplerenone': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Eplerenone حسب الوصفة مرة أو مرتين يوميًا؛ التوقيت أقل أهمية من potassium/renal monitoring.',
    autoScheduleSafe: false,
    source: 'DailyMed · Eplerenone · 2026',
  ),
  'amiloride': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'Amiloride يُؤخذ مع الطعام، ولا تُضاف مكملات potassium من نفسك.',
    source: 'DailyMed · Amiloride hydrochloride',
  ),
  'methyldopa': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Methyldopa حسب عدد الجرعات المكتوب؛ قد يسبب نعاسًا خاصة بالبداية/بعد زيادة الجرعة.',
    autoScheduleSafe: false,
    source: 'DailyMed · Methyldopa',
  ),
  'bromocriptine-hyperprolactinemia': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'Bromocriptine للـhyperprolactinemia يؤخذ مع الطعام؛ titration والجرعة حسب خطة الغدد.',
    autoScheduleSafe: false,
    source: 'DailyMed · Bromocriptine mesylate · Jul 2026',
  ),
  'levothyroxine-tirosint-sol': MedicationTimingRule(
    anchor: 'before-breakfast',
    instructionAr: 'TIROSINT-SOL على معدة فارغة قبل الفطور بـ15 دقيقة؛ افصل calcium/iron 4 ساعات على الأقل.',
    autoScheduleSafe: false,
    source: 'DailyMed · TIROSINT-SOL · 2026',
  ),
  'depo-provera-ci': MedicationTimingRule(
    anchor: 'weekly',
    instructionAr: 'DEPO-PROVERA CI حقنة IM كل 13 أسبوعًا؛ احفظ تاريخ الحقنة التالية بدقة.',
    autoScheduleSafe: false,
    source: 'DailyMed · DEPO-PROVERA CI',
  ),
  'nuvaring': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'NuvaRing: 3 أسابيع داخل المهبل ثم أسبوع واحد بدون حلقة؛ الخروج >3 ساعات يحتاج قواعد backup حسب الأسبوع.',
    autoScheduleSafe: false,
    source: 'DailyMed · NuvaRing',
  ),

  'clarithromycin-er': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'Clarithromycin ER يؤخذ مع الطعام ويُبتلع كاملًا؛ لا تُعمم تعليمات IR عليه.',
    autoScheduleSafe: false,
    source: 'DailyMed · Clarithromycin ER',
  ),
  'cefuroxime-axetil-tablets': MedicationTimingRule(
    anchor: 'after-selected-meal',
    instructionAr: 'Cefuroxime axetil tablet يفضّل بعد الطعام لأن الامتصاص أفضل؛ tablet وsuspension غير متبادلين mg-for-mg.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · Cefuroxime axetil tablets',
  ),
  'cefpodoxime-tablets': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'Cefpodoxime proxetil tablets تؤخذ مع الطعام لتحسين الامتصاص.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · Cefpodoxime proxetil tablets',
  ),
  'cefdinir-capsules': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Cefdinir يمكن مع الطعام أو بدونه؛ افصل iron وMg/Al antacids ساعتين قبل أو بعد الجرعة.',
    autoScheduleSafe: false,
    source: 'DailyMed · Cefdinir capsules',
  ),
  'levofloxacin-oral-solution': MedicationTimingRule(
    anchor: 'empty-stomach',
    instructionAr: 'Levofloxacin oral solution قبل الطعام بساعة أو بعده بساعتين؛ افصل Mg/Al antacids وsucralfate والحديد والزنك ساعتين قبل أو بعد.',
    autoScheduleSafe: false,
    source: 'DailyMed · Levofloxacin oral solution',
  ),
  'linezolid-oral': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Linezolid يمكن مع الطعام أو بدونه؛ الأهم مراجعة serotonergic drugs وتجنب كميات كبيرة من الأطعمة العالية بالـtyramine.',
    autoScheduleSafe: false,
    source: 'DailyMed · Linezolid tablets · 2026',
  ),
  'metronidazole-er': MedicationTimingRule(
    anchor: 'empty-stomach',
    instructionAr: 'Metronidazole ER 750 mg قبل الطعام بساعة على الأقل أو بعده بساعتين، ويُبتلع كاملًا.',
    autoScheduleSafe: false,
    source: 'DailyMed · Metronidazole ER',
  ),
  'rifaximin-xifaxan': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Rifaximin يمكن مع الطعام أو بدونه، لكن الجرعة/المدة تعتمد تمامًا على الاستطباب: TD أو HE أو IBS-D.',
    autoScheduleSafe: false,
    source: 'DailyMed · XIFAXAN',
  ),
  'pantoprazole-dr-granules': MedicationTimingRule(
    anchor: 'before-meal',
    instructionAr: 'Pantoprazole granules نحو 30 دقيقة قبل الوجبة، وتُحضّر فقط بـapple juice أو applesauce حسب IFU.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · Pantoprazole DR granules',
  ),
  'budesonide-uceris': MedicationTimingRule(
    anchor: 'morning',
    instructionAr: 'UCERIS 9 mg مرة صباحًا مع الطعام أو بدونه، تُبتلع كاملة، وعادة كورس induction حتى 8 أسابيع.',
    autoScheduleSafe: false,
    source: 'DailyMed · UCERIS',
  ),
  'linaclotide-linzess': MedicationTimingRule(
    anchor: 'before-meal',
    instructionAr: 'LINZESS على معدة فارغة قبل الوجبة بـ30 دقيقة على الأقل وفي وقت ثابت يوميًا.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · LINZESS · May 2026',
  ),
  'lubiprostone': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'Lubiprostone يُؤخذ مع الطعام والماء ويُبتلع كاملًا.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · Lubiprostone · 2026',
  ),
  'doxylamine-pyridoxine-dr': MedicationTimingRule(
    anchor: 'empty-stomach',
    instructionAr: 'Doxylamine/pyridoxine DR على معدة فارغة مع الماء، علاج مجدول يوميًا وليس PRN فقط، والحبة تُبتلع كاملة.',
    autoScheduleSafe: false,
    source: 'DailyMed · Doxylamine/Pyridoxine DR',
  ),
  'aprepitant': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Aprepitant يمكن مع الطعام أو بدونه لكن جدوله يعتمد على CINV/PONV regimen؛ لا يُعامل كـPRN عام.',
    autoScheduleSafe: false,
    source: 'DailyMed · Aprepitant capsules · Jan 2026',
  ),

  'azithromycin-zmax': MedicationTimingRule(
    anchor: 'empty-stomach',
    instructionAr: 'ZMAX جرعة واحدة على معدة فارغة: قبل الطعام بساعة أو بعده بساعتين؛ بعد التحضير تُستخدم خلال 12 ساعة ولا تُبرّد.',
    autoScheduleSafe: false,
    source: 'DailyMed · ZMAX',
  ),
  'penicillin-v': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Penicillin V يمكن مع الطعام، لكن الامتصاص أعلى قليلًا على معدة فارغة؛ الأفضل بعيدًا عن الوجبة إذا كان ذلك عمليًا.',
    autoScheduleSafe: false,
    source: 'DailyMed · Penicillin V potassium',
  ),
  'dicloxacillin': MedicationTimingRule(
    anchor: 'empty-stomach',
    instructionAr: 'Dicloxacillin قبل الطعام بساعة أو بعده بساعتين، مع 120 mL ماء على الأقل، ولا يؤخذ مستلقيًا أو مباشرة قبل النوم.',
    autoScheduleSafe: false,
    source: 'DailyMed · Dicloxacillin',
  ),
  'tetracycline-capsules': MedicationTimingRule(
    anchor: 'empty-stomach',
    instructionAr: 'Tetracycline يُفضّل بعيدًا عن الطعام؛ food/dairy والمعادن والـantacids تقلل الامتصاص، ويؤخذ مع ماء كافٍ.',
    autoScheduleSafe: false,
    source: 'DailyMed · Tetracycline HCl capsules · 2026',
  ),
  'fosfomycin-tromethamine': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Fosfomycin sachet جرعة واحدة، مع الطعام أو بدونه؛ يُذاب كامل الكيس في 3–4 oz ماء غير ساخن ويُشرب فورًا.',
    autoScheduleSafe: false,
    source: 'DailyMed · Fosfomycin tromethamine · 2025',
  ),
  'rifampin': MedicationTimingRule(
    anchor: 'empty-stomach',
    instructionAr: 'Rifampin قبل الطعام بساعة أو بعده بساعتين مع كوب ماء كامل؛ راجع كل الأدوية بسبب التداخلات القوية.',
    autoScheduleSafe: false,
    source: 'DailyMed · Rifampin capsules',
  ),
  'lansoprazole-odt': MedicationTimingRule(
    anchor: 'before-meal',
    instructionAr: 'Lansoprazole ODT قبل الوجبات؛ لا تمضغ microgranules، وافصله عن sucralfate 30 دقيقة على الأقل.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · Lansoprazole ODT',
  ),
  'dexlansoprazole-dr': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Dexlansoprazole DR يمكن مع الطعام أو بدونه؛ لا يحتاج meal anchor مثل بعض PPIs الأخرى.',
    source: 'DailyMed · Dexlansoprazole DR · Dec 2025',
  ),
  'cholestyramine': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Cholestyramine لا يؤخذ جافًا؛ اخلطه بـ2–6 oz سائل غير غازي، وافصل باقي الأدوية ساعة قبله أو 4–6 ساعات بعده.',
    autoScheduleSafe: false,
    source: 'DailyMed · Cholestyramine · Jun 2026',
  ),
  'plecanatide-trulance': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'TRULANCE مرة يوميًا مع الطعام أو بدونه؛ missed dose تُتجاوز ولا تُضاعف.',
    source: 'DailyMed · TRULANCE',
  ),
  'prucalopride-motegrity': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'MOTEGRITY مرة يوميًا مع الطعام أو بدونه؛ severe renal impairment يحتاج جرعة أقل.',
    source: 'DailyMed · MOTEGRITY · Jul 2025',
  ),
  'meclizine-motion-sickness': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Meclizine للـmotion sickness يُؤخذ قبل بدء السفر بساعة؛ product-specific chew/swallow instructions مهمة.',
    autoScheduleSafe: false,
    source: 'DailyMed · Meclizine motion-sickness labeling · 2026',
  ),
  'prochlorperazine-severe-nausea': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Prochlorperazine للغثيان الشديد لا يملك meal anchor مهم؛ اتبع الفاصل الموصوف وراقب النعاس/EPS.',
    autoScheduleSafe: false,
    source: 'DailyMed · Prochlorperazine tablets · 2026',
  ),

  'minocycline-capsules': MedicationTimingRule(anchor: 'any', instructionAr: 'Minocycline IR capsules يمكن مع الطعام أو بدونه؛ افصل mineral antacids ومكملات الحديد/الكالسيوم/المغنيسيوم.', autoScheduleSafe: false, source: 'DailyMed · Minocycline capsules'),
  'moxifloxacin-tablets': MedicationTimingRule(anchor: 'any', instructionAr: 'Moxifloxacin يمكن مع الطعام أو بدونه؛ افصل Mg/Al/iron/zinc/sucralfate: 4 ساعات قبل أو 8 ساعات بعد.', autoScheduleSafe: false, source: 'DailyMed · Moxifloxacin tablets'),
  'fidaxomicin-tablets': MedicationTimingRule(anchor: 'any', instructionAr: 'Fidaxomicin tablets يمكن مع الطعام أو بدونه؛ للبالغين current label 200 mg مرتين يوميًا 10 أيام لـC. difficile.', autoScheduleSafe: false, source: 'DailyMed · Fidaxomicin tablets · 2026'),
  'vancomycin-oral-capsules': MedicationTimingRule(anchor: 'any', instructionAr: 'Oral vancomycin لا يحتاج meal anchor؛ وزّع الجرعات حسب وصفة C. difficile/enterocolitis ولا تخلطه مع IV indication.', autoScheduleSafe: false, source: 'DailyMed · Vancomycin oral capsules · 2026'),
  'rabeprazole-dr-tablets': MedicationTimingRule(anchor: 'prescription-specific', instructionAr: 'Rabeprazole يعتمد على الاستطباب: duodenal ulcer بعد الوجبة، H. pylori مع الطعام، ومعظم الاستطبابات الأخرى food-flexible.', autoScheduleSafe: false, source: 'DailyMed · Rabeprazole DR · 2026'),
  'scopolamine-transdermal': MedicationTimingRule(anchor: 'prescription-specific', instructionAr: 'Motion sickness: patch خلف الأذن قبل الحاجة بـ4 ساعات على الأقل وتبقى حتى 3 أيام؛ PONV له جدول مختلف.', autoScheduleSafe: false, source: 'DailyMed · Scopolamine transdermal IFU'),
  'granisetron-oral-tablets': MedicationTimingRule(anchor: 'prescription-specific', instructionAr: 'Granisetron مرتبط بالchemotherapy/radiation وليس الطعام؛ adult chemotherapy dose تبدأ حتى ساعة قبل العلاج.', autoScheduleSafe: false, source: 'DailyMed · Granisetron tablets'),

  'amoxicillin-clavulanate-xr': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'AUGMENTIN XR في بداية الوجبة؛ تجنب الوجبة عالية الدهون، ولا تبدله mg-for-mg مع Augmentin العادي.',
    autoScheduleSafe: false,
    source: 'DailyMed · Amoxicillin/clavulanate extended-release · revised Dec 2025',
  ),
  'sulfasalazine-dr': MedicationTimingRule(
    anchor: 'after-meal',
    instructionAr: 'Sulfasalazine DR بجرعات مقسمة بالتساوي، ويفضل بعد الوجبات؛ ابتلع الحبة كاملة.',
    autoScheduleSafe: false,
    source: 'DailyMed · Sulfasalazine delayed-release tablets',
  ),
  'dicyclomine-oral': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'Dicyclomine: الملصق الحالي لا يثبت meal anchor؛ اتبع جدول الوصفة وتجنب أخذ antacid في نفس الوقت.',
    autoScheduleSafe: false,
    source: 'DailyMed · Dicyclomine capsules/tablets · revised Aug 2026',
  ),
  'hyoscyamine-sl': MedicationTimingRule(
    anchor: 'before-meal',
    instructionAr: 'Hyoscyamine SL 0.125 mg: قبل الوجبة بـ30–60 دقيقة وعند النوم حسب الوصفة؛ لا تعمم ذلك على ER.',
    autoScheduleSafe: false,
    source: 'DailyMed · Hyoscyamine sulfate sublingual 0.125 mg',
  ),
  'promethazine-oral-tablets': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'Promethazine oral: التوقيت حسب الاستطباب؛ للـmotion sickness تؤخذ أول جرعة للبالغ قبل السفر بـ30–60 دقيقة.',
    autoScheduleSafe: false,
    source: 'DailyMed · Promethazine hydrochloride tablets',
  ),

  'erythromycin-erytab-dr': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'ERY-TAB يمكن دون ارتباط صارم بالطعام، لكن للحصول على أفضل مستويات: قبل الوجبة بـ30 دقيقة على الأقل ويفضل ساعتين.',
    autoScheduleSafe: false,
    source: 'DailyMed · ERY-TAB delayed-release tablets',
  ),
  'doxycycline-doryx-mpc': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'DORYX MPC: يمكن مع الطعام أو الحليب إذا أزعج المعدة، لكن افصل Al/Ca/Mg antacids والحديد وbismuth؛ لا تستبدله mg-for-mg.',
    autoScheduleSafe: false,
    source: 'DailyMed · DORYX MPC · updated Feb 2026',
  ),
  'tenapanor-ibsrela': MedicationTimingRule(
    anchor: 'before-selected-meals',
    instructionAr: 'IBSRELA: مباشرة قبل الفطور/أول وجبة ومباشرة قبل العشاء؛ الجرعة المنسية تُتجاوز ولا تُضاعف.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · IBSRELA tenapanor',
  ),
  'eluxadoline-viberzi': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'VIBERZI: مرتين يوميًا مع الطعام؛ لا تستخدمه إذا لم تكن لديك مرارة.',
    autoScheduleSafe: false,
    source: 'DailyMed · VIBERZI eluxadoline',
  ),
  'netupitant-palonosetron-akynzeo-oral': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'AKYNZEO oral: كبسولة واحدة قبل chemotherapy بحوالي ساعة، مع أو بدون الطعام؛ ليست PRN يومية عامة.',
    autoScheduleSafe: false,
    source: 'DailyMed · AKYNZEO capsules · current 2026 label',
  ),

  'cefuroxime-axetil-suspension': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'Cefuroxime suspension: مع الطعام، رجّ العبوة قبل كل جرعة، ولا تبدله mg-for-mg مع tablets.',
    autoScheduleSafe: false,
    source: 'DailyMed · Cefuroxime axetil oral suspension',
  ),
  'cefpodoxime-suspension': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Cefpodoxime suspension يمكن مع الطعام أو بدونه؛ لا تطبق عليه قاعدة tablet التي يتحسن امتصاصها مع الطعام.',
    autoScheduleSafe: false,
    source: 'DailyMed · Cefpodoxime proxetil oral suspension',
  ),
  'clarithromycin-suspension': MedicationTimingRule(
    anchor: 'any',
    instructionAr: 'Clarithromycin suspension يمكن مع الطعام أو بدونه ويمكن مع الحليب؛ لا تُبرّد بعد التحضير.',
    autoScheduleSafe: false,
    source: 'DailyMed · Clarithromycin oral suspension',
  ),
  'budesonide-dr-capsules-crohns': MedicationTimingRule(
    anchor: 'morning',
    instructionAr: 'Budesonide DR capsules للـCrohn: مرة صباحًا؛ الملصق لا يفرض meal anchor، وتجنب grapefruit juice.',
    autoScheduleSafe: false,
    source: 'DailyMed · Budesonide delayed-release capsules · 2026',
  ),
  'granisetron-sancuso-patch': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'SANCUSO: ضع patch قبل chemotherapy بـ24–48 ساعة، واتركها حتى ≥24 ساعة بعد انتهاء العلاج؛ لا تقصها.',
    autoScheduleSafe: false,
    source: 'DailyMed · SANCUSO granisetron transdermal system',
  ),

  'trazodone-ir-tablets': MedicationTimingRule(
    anchor: 'after-meal',
    instructionAr: 'Trazodone IR: بعد الوجبة أو snack خفيف بقليل؛ وقت اليوم/تقسيم الجرعات حسب الخطة بسبب النعاس.',
    autoScheduleSafe: false,
    source: 'DailyMed · Trazodone hydrochloride tablets · current 2026 labeling',
  ),
  'lurasidone-tablets': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'Lurasidone: مع طعام يحتوي ≥350 kcal؛ snack صغير جدًا لا يكفي.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · Lurasidone hydrochloride tablets · current 2026 labeling',
  ),
  'ziprasidone-capsules': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'Ziprasidone capsules: كل جرعة مع الطعام؛ لا تفتح أو تسحق أو تمضغ.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · Ziprasidone hydrochloride capsules · current 2026 labeling',
  ),
  'quetiapine-xr': MedicationTimingRule(
    anchor: 'evening',
    instructionAr: 'Quetiapine XR: مرة يوميًا ويفضل مساءً، بدون طعام أو مع وجبة خفيفة ~300 kcal؛ ابتلعها كاملة.',
    autoScheduleSafe: false,
    source: 'DailyMed · SEROQUEL XR / quetiapine XR',
  ),
  'oxcarbazepine-oxtellar-xr': MedicationTimingRule(
    anchor: 'empty-stomach',
    instructionAr: 'OXTELLAR XR: مرة يوميًا على معدة فارغة، ≥1 ساعة قبل الطعام أو ≥2 ساعات بعده؛ whole tablet.',
    autoScheduleSafe: false,
    source: 'DailyMed · OXTELLAR XR',
  ),
  'carbidopa-levodopa-rytary': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'RYTARY: يمكن مع/بدون الطعام لكن high-fat/high-calorie meal قد تؤخر المفعول ~2 ساعة؛ أول جرعة قد تُؤخذ 1–2 ساعة قبل الأكل حسب الخطة.',
    autoScheduleSafe: false,
    source: 'DailyMed · RYTARY · current 2026 labeling',
  ),
  'rivastigmine-transdermal': MedicationTimingRule(
    anchor: 'same-time-daily',
    instructionAr: 'Rivastigmine patch: patch واحدة كل 24 ساعة في وقت ثابت تقريبًا؛ انزع القديمة أولًا وغيّر الموقع.',
    autoScheduleSafe: false,
    source: 'DailyMed · Rivastigmine transdermal system',
  ),
  'galantamine-er': MedicationTimingRule(
    anchor: 'morning-with-meal',
    instructionAr: 'Galantamine ER: مرة صباحًا ويفضل مع الطعام مع سوائل كافية؛ الانقطاع >3 أيام يحتاج restart/titration.',
    autoScheduleSafe: false,
    source: 'DailyMed · Galantamine extended-release capsules',
  ),
  'cladribine-mavenclad': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'MAVENCLAD: خلال treatment cycle المحددة؛ مع/بدون الطعام لكن افصل كل دواء فموي آخر ≥3 ساعات.',
    autoScheduleSafe: false,
    source: 'DailyMed · MAVENCLAD · revised May 2026',
  ),
  'diroximel-fumarate-vumerity': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'VUMERITY: BID؛ مع/بدون الطعام. إذا مع الطعام ≤700 kcal و≤30 g fat، وتجنب الكحول وقت الجرعة.',
    autoScheduleSafe: false,
    source: 'DailyMed · VUMERITY',
  ),

  'vilazodone-tablets': MedicationTimingRule(
    anchor: 'with-meal',
    instructionAr: 'Vilazodone: مرة يوميًا مع الطعام؛ لا تعتبر الطعام اختياريًا.',
    requiresMealChoice: true,
    autoScheduleSafe: false,
    source: 'DailyMed · Vilazodone hydrochloride tablets',
  ),
  'asenapine-sublingual': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'Asenapine SL: تحت اللسان حتى تذوب، ثم لا أكل ولا شرب 10 دقائق؛ لا تُبتلع أو تُمضغ.',
    autoScheduleSafe: false,
    source: 'DailyMed · SAPHRIS / asenapine sublingual tablets',
  ),
  'phenytoin-extended-capsules': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'Phenytoin extended capsules: لا يوجد meal anchor عام مثبت؛ حافظ على نفس formulation والروتين ولا تبدل suspension/chewable mg-for-mg.',
    autoScheduleSafe: false,
    source: 'DailyMed · Extended phenytoin sodium capsules · 2026',
  ),
  'pramipexole-er': MedicationTimingRule(
    anchor: 'same-time-daily',
    instructionAr: 'Pramipexole ER: مرة يوميًا في وقت ثابت، مع الطعام أو بدونه؛ whole tablet.',
    autoScheduleSafe: false,
    source: 'DailyMed · Pramipexole ER',
  ),
  'opicapone-ongentys': MedicationTimingRule(
    anchor: 'bedtime-empty-stomach',
    instructionAr: 'ONGENTYS: عند النوم؛ لا طعام ساعة قبل الجرعة ولا ساعة على الأقل بعدها.',
    autoScheduleSafe: false,
    source: 'DailyMed · ONGENTYS opicapone',
  ),
  'donepezil-odt': MedicationTimingRule(
    anchor: 'bedtime',
    instructionAr: 'Donepezil ODT: مساءً قبل النوم مباشرة، مع أو بدون الطعام؛ تذوب على اللسان ثم ماء.',
    autoScheduleSafe: false,
    source: 'DailyMed · ARICEPT ODT',
  ),
  'memantine-xr': MedicationTimingRule(
    anchor: 'same-time-daily',
    instructionAr: 'Memantine XR: مرة يوميًا مع/بدون الطعام؛ إذا فُتحت تنثر كل المحتويات على applesauce ولا تُقسّم.',
    autoScheduleSafe: false,
    source: 'DailyMed · Memantine XR capsules',
  ),
  'dimethyl-fumarate-dr': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'Dimethyl fumarate DR: BID مع/بدون الطعام؛ الطعام قد يقلل flushing، والكبسولة تُبتلع كاملة.',
    autoScheduleSafe: false,
    source: 'DailyMed · Dimethyl fumarate delayed-release capsules',
  ),
  'teriflunomide-tablets': MedicationTimingRule(
    anchor: 'same-time-daily',
    instructionAr: 'Teriflunomide: مرة يوميًا مع/بدون الطعام؛ المتابعة والحمل/الكبد أهم من meal anchor.',
    autoScheduleSafe: false,
    source: 'DailyMed · Teriflunomide tablets · revised Aug 2026',
  ),
  'fingolimod-capsules': MedicationTimingRule(
    anchor: 'same-time-daily',
    instructionAr: 'Fingolimod: مرة يوميًا مع/بدون الطعام؛ الجرعة الأولى وبعض حالات restart تحتاج مراقبة قلبية ≥6 ساعات.',
    autoScheduleSafe: false,
    source: 'DailyMed · Fingolimod capsules · 2025-2026',
  ),

  'paroxetine-paxil-cr': MedicationTimingRule(
    anchor: 'morning',
    instructionAr: 'PAXIL CR: مرة صباحًا، مع أو بدون الطعام؛ ابتلعها كاملة ولا تسحقها.',
    autoScheduleSafe: false,
    source: 'DailyMed · PAXIL CR · effective Sep 2026',
  ),
  'desvenlafaxine-er': MedicationTimingRule(
    anchor: 'same-time-daily',
    instructionAr: 'Desvenlafaxine ER: مرة يوميًا في وقت متقارب، مع/بدون الطعام؛ whole tablet.',
    autoScheduleSafe: false,
    source: 'DailyMed · Desvenlafaxine ER · 2026',
  ),
  'lumateperone-caplyta': MedicationTimingRule(
    anchor: 'same-time-daily',
    instructionAr: 'CAPLYTA: مرة يوميًا مع/بدون الطعام؛ الجرعة المعتادة لا تحتاج titration.',
    autoScheduleSafe: false,
    source: 'DailyMed · CAPLYTA · 2026',
  ),
  'selegiline-zelapar-odt': MedicationTimingRule(
    anchor: 'before-breakfast',
    instructionAr: 'ZELAPAR: صباحًا قبل الفطور، بدون سائل؛ لا أكل/شرب 5 دقائق قبل و5 دقائق بعد.',
    autoScheduleSafe: false,
    source: 'DailyMed · ZELAPAR · 2026',
  ),
  'entacapone-tablets': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'Entacapone 200 mg: مع كل جرعة levodopa/carbidopa، حتى 8 مرات/يوم؛ مع/بدون الطعام.',
    autoScheduleSafe: false,
    source: 'DailyMed · Entacapone tablets',
  ),
  'ropinirole-er': MedicationTimingRule(
    anchor: 'same-time-daily',
    instructionAr: 'Ropinirole ER: مرة يوميًا مع/بدون الطعام؛ whole tablet؛ الانقطاع المهم قد يحتاج re-titration.',
    autoScheduleSafe: false,
    source: 'DailyMed · Ropinirole ER · revised May 2026',
  ),
  'amantadine-gocovri': MedicationTimingRule(
    anchor: 'bedtime',
    instructionAr: 'GOCOVRI: مرة عند النوم، مع/بدون الطعام؛ تجنب الكحول؛ غير interchangeable مع amantadine الآخر.',
    autoScheduleSafe: false,
    source: 'DailyMed · GOCOVRI · revised Feb 2026',
  ),
  'siponimod-mayzent': MedicationTimingRule(
    anchor: 'same-time-daily',
    instructionAr: 'MAYZENT: مرة يوميًا مع/بدون الطعام بعد CYP2C9-guided titration؛ missed titration أو ≥4 maintenance doses = restart Day 1.',
    autoScheduleSafe: false,
    source: 'DailyMed · MAYZENT',
  ),
  'ozanimod-zeposia': MedicationTimingRule(
    anchor: 'same-time-daily',
    instructionAr: 'ZEPOSIA: مرة يوميًا مع/بدون الطعام بعد 7-day starter titration؛ missed dose خلال أول 14 يومًا = restart titration.',
    autoScheduleSafe: false,
    source: 'DailyMed · ZEPOSIA · 2026',
  ),
  'ofatumumab-kesimpta': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'KESIMPTA: Week 0,1,2 ثم لا جرعة Week 3، ثم monthly من Week 4؛ لا meal anchor.',
    autoScheduleSafe: false,
    source: 'DailyMed · KESIMPTA · revised Apr 2026',
  ),

  'sumatriptan-nasal-spray': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'Sumatriptan nasal: مع بداية النوبة؛ repeat بعد ≥2 h فقط، max 40 mg/24 h؛ لا meal anchor.',
    autoScheduleSafe: false,
    source: 'DailyMed · Sumatriptan nasal spray · current 2026 labeling',
  ),
  'sumatriptan-injection-autoinjector': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'Sumatriptan SC: مع migraine/cluster attack؛ repeat 6 mg بعد ≥1 h فقط، max 12 mg/24 h.',
    autoScheduleSafe: false,
    source: 'DailyMed · Sumatriptan injection · updated 2026',
  ),
  'zolmitriptan-nasal-spray': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'Zolmitriptan nasal: مع النوبة؛ repeat بعد ≥2 h فقط، max 10 mg/24 h.',
    autoScheduleSafe: false,
    source: 'DailyMed · Zolmitriptan nasal spray',
  ),
  'eletriptan-tablets': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'Eletriptan: 20–40 mg مع النوبة؛ repeat بعد ≥2 h، max 80 mg/24 h؛ راجع CYP3A4 72-hour lock.',
    autoScheduleSafe: false,
    source: 'DailyMed · Eletriptan tablets · revised May 2026',
  ),
  'lasmiditan-reyvow': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'REYVOW: جرعة واحدة فقط/24 h عند النوبة، مع/بدون الطعام؛ لا قيادة ≥8 ساعات بعد الجرعة.',
    autoScheduleSafe: false,
    source: 'DailyMed · REYVOW lasmiditan',
  ),
  'atogepant-qulipta': MedicationTimingRule(
    anchor: 'same-time-daily',
    instructionAr: 'QULIPTA: مرة يوميًا للوقاية، مع/بدون الطعام؛ ليست rescue PRN.',
    autoScheduleSafe: false,
    source: 'DailyMed · QULIPTA atogepant',
  ),
  'erenumab-aimovig': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'AIMOVIG: SC مرة كل شهر؛ 70 أو 140 mg حسب الوصفة؛ لا meal anchor.',
    autoScheduleSafe: false,
    source: 'DailyMed · AIMOVIG erenumab-aooe',
  ),
  'fremanezumab-ajovy': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'AJOVY: 225 mg monthly أو 675 mg كل 3 أشهر (3 injections)؛ لا تخلط الجدولين.',
    autoScheduleSafe: false,
    source: 'DailyMed · AJOVY fremanezumab-vfrm · Jun 2026',
  ),
  'galcanezumab-emgality': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'EMGALITY: migraine regimen ≠ episodic cluster regimen؛ الجدول يعتمد على indication.',
    autoScheduleSafe: false,
    source: 'DailyMed · EMGALITY galcanezumab-gnlm · Jun 2026',
  ),
  'dihydroergotamine-trudhesa': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'TRUDHESA: عند migraine attack؛ prime 4 pumps ثم spray بكل nostril؛ repeat بعد ≥1 h، max 2 doses/24 h و3/7 days.',
    autoScheduleSafe: false,
    source: 'DailyMed · TRUDHESA · effective Sep 2026',
  ),

  'naratriptan-tablets': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'Naratriptan: مع migraine attack؛ repeat بعد ≥4 h فقط، max 5 mg/24 h عادةً.',
    autoScheduleSafe: false,
    source: 'DailyMed · Naratriptan tablets · Jun 2026',
  ),
  'frovatriptan-tablets': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'Frovatriptan 2.5 mg: مع النوبة؛ second dose فقط إذا عاد الصداع بعد initial relief وبعد ≥2 h؛ max 7.5 mg/24 h.',
    autoScheduleSafe: false,
    source: 'DailyMed · Frovatriptan succinate tablets · Jan 2026',
  ),
  'almotriptan-tablets': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'Almotriptan: 6.25–12.5 mg مع النوبة؛ repeat بعد ≥2 h إذا عاد الصداع؛ max 25 mg/24 h عادةً.',
    autoScheduleSafe: false,
    source: 'DailyMed · Almotriptan tablets · Dec 2025',
  ),
  'sumatriptan-naproxen-tablets': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'Sumatriptan/naproxen 85/500: مع/بدون الطعام؛ whole tablet؛ adult repeat بعد ≥2 h، max 2 tablets/24 h.',
    autoScheduleSafe: false,
    source: 'DailyMed · Sumatriptan/naproxen 85/500 mg',
  ),
  'dihydroergotamine-brekiya': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'BREKIYA: 1 mg SC مع migraine/cluster attack؛ repeat كل ≥1 h، max 3 doses/24 h و6/7 days.',
    autoScheduleSafe: false,
    source: 'DailyMed · BREKIYA autoinjector',
  ),
  'dihydroergotamine-nasal-legacy': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'Legacy DHE nasal: prime 4؛ spray بكل nostril ثم repeat كلاهما بعد 15 min؛ total 2 mg/attack.',
    autoScheduleSafe: false,
    source: 'DailyMed · Dihydroergotamine nasal spray 4 mg/mL',
  ),
  'acetaminophen-otc-500mg': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'Acetaminophen OTC 500 mg: PRN headache؛ common label 1000 mg q6h، max 3000 mg/24 h؛ with/without food.',
    autoScheduleSafe: false,
    source: 'DailyMed · Acetaminophen 500 mg OTC',
  ),
  'ibuprofen-otc-200mg': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'Ibuprofen OTC 200 mg: q4–6h PRN؛ max 1200 mg/24 h OTC؛ food/milk only if stomach upset.',
    autoScheduleSafe: false,
    source: 'DailyMed · Ibuprofen 200 mg OTC · 2026',
  ),
  'naproxen-sodium-otc-220mg': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'Naproxen sodium OTC 220 mg: q8–12h PRN؛ first dose may be 2 tablets؛ max 660 mg/24 h؛ full glass water.',
    autoScheduleSafe: false,
    source: 'DailyMed · Naproxen sodium 220 mg OTC · 2026',
  ),
  'acetaminophen-aspirin-caffeine-migraine': MedicationTimingRule(
    anchor: 'prescription-specific',
    instructionAr: 'Migraine relief 250/250/65: adults 2 caplets once with water؛ max 2 caplets/24 h unless doctor directs otherwise.',
    autoScheduleSafe: false,
    source: 'DailyMed · Excedrin Migraine / equivalent · 2026',
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