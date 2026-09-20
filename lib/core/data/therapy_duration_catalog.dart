enum TherapyDurationKind {
  chronic,
  shortCourse,
  shortSelfCare,
  asNeeded,
  singleUse,
  intermittent,
  individualized,
}

class TherapyDurationGuidance {
  const TherapyDurationGuidance({
    required this.kind,
    this.patientOverrideAr = '',
  });

  final TherapyDurationKind kind;
  final String patientOverrideAr;

  String get patientAr {
    if (patientOverrideAr.trim().isNotEmpty) return patientOverrideAr.trim();

    return switch (kind) {
      TherapyDurationKind.chronic =>
        'غالبًا علاج طويل الأمد/مزمن. استمر عليه كما وصف الطبيب ولا توقفه من نفسك لمجرد أن الأعراض أو الأرقام تحسنت.',
      TherapyDurationKind.shortCourse =>
        'له مدة علاج محددة حسب الوصفة والسبب. أكمل المدة المكتوبة ولا تمدد العلاج أو تعيد استخدامه من نفسك.',
      TherapyDurationKind.shortSelfCare =>
        'يُستخدم لفترة قصيرة للعلاج الذاتي. إذا استمرت الأعراض أو احتجته بشكل متكرر فراجع الطبيب أو الصيدلي بدل الاستمرار تلقائيًا.',
      TherapyDurationKind.asNeeded =>
        'يُستخدم عند الحاجة ضمن الحد والخطة الموصوفة، وليس له كورس ثابت يومي إلا إذا أعطاك الطبيب تعليمات مختلفة.',
      TherapyDurationKind.singleUse =>
        'عادةً جرعة أو استخدام لمرة واحدة لهذا الحدث. لا تكرر الجرعة من نفسك إلا حسب تعليمات المنتج أو الطبيب.',
      TherapyDurationKind.intermittent =>
        'يُستخدم خلال فترة الأعراض/التعرض أو على فترات حسب الخطة. مدة كل فترة تعتمد على السيطرة على الأعراض.',
      TherapyDurationKind.individualized =>
        'قد تكون المدة قصيرة أو تمتد لأشهر/سنوات حسب الحالة والاستجابة. اتبع المدة التي حددها الطبيب ولا توقف أو تمدد العلاج من نفسك.',
    };
  }
}

const medicationTherapyDurations = <String, TherapyDurationGuidance>{
  'losartan': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'metformin': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'salbutamol-mdi': TherapyDurationGuidance(
    kind: TherapyDurationKind.asNeeded,
    patientOverrideAr:
        'غالبًا يُستخدم كبخاخ إسعاف عند الحاجة حسب الخطة. إذا أصبحت تحتاجه أكثر من المعتاد فهذه علامة تستدعي مراجعة السيطرة على الربو/COPD، وليس فقط زيادة البخات.',
  ),
  'amoxicillin': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'levetiracetam': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'omeprazole': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'paracetamol': TherapyDurationGuidance(kind: TherapyDurationKind.shortSelfCare),
  'apixaban': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'cetirizine': TherapyDurationGuidance(kind: TherapyDurationKind.intermittent),
  'amlodipine': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'lisinopril': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'glimepiride': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'insulin-glargine': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'budesonide-formoterol': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'montelukast': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'ibuprofen': TherapyDurationGuidance(kind: TherapyDurationKind.shortSelfCare),
  'warfarin': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'rivaroxaban': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'fexofenadine': TherapyDurationGuidance(kind: TherapyDurationKind.intermittent),
  'methotrexate-rheumatology': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'upadacitinib': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'tofacitinib': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'dupilumab': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'tamsulosin': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'polyethylene-glycol-3350': TherapyDurationGuidance(
    kind: TherapyDurationKind.shortSelfCare,
    patientOverrideAr:
        'للعلاج الذاتي يُستخدم عادة لفترة قصيرة. بعض مرضى الإمساك المزمن يستخدمونه مدة أطول تحت متابعة الطبيب، لذلك لا تجعل مدة OTC هي قاعدة لكل المرضى.',
  ),
  'lactulose': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'loperamide': TherapyDurationGuidance(kind: TherapyDurationKind.shortSelfCare),
  'ondansetron-oral': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'levonorgestrel-ec': TherapyDurationGuidance(kind: TherapyDurationKind.singleUse),
  'latanoprost': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'paracetamol-pediatric-liquid': TherapyDurationGuidance(kind: TherapyDurationKind.shortSelfCare),
  'atorvastatin': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'metoprolol': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'spironolactone': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'empagliflozin': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'levothyroxine': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr:
        'في قصور الغدة الدرقية الدائم يكون العلاج غالبًا مدى الحياة. لا توقفه عندما تتحسن التحاليل؛ التحسن غالبًا يعني أن الجرعة تعمل.',
  ),
  'sertraline': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'gabapentin': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'doxycycline': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'nitrofurantoin': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'clindamycin-oral': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'furosemide': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'hydrochlorothiazide': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'clopidogrel': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr:
        'المدة تعتمد على سبب الاستخدام وقد تكون طويلة. بعد تركيب دعامة قلبية خصوصًا لا توقفه أو تختصر المدة من نفسك لأن توقيت الإيقاف جزء من خطة طبيب القلب.',
  ),
  'nitroglycerin-sublingual': TherapyDurationGuidance(kind: TherapyDurationKind.asNeeded),
  'semaglutide-injection': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'sitagliptin': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'tiotropium-capsule-inhalation': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'azithromycin': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'acyclovir-oral': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'metronidazole-oral': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'valproic-acid': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'combined-oral-contraceptive': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'norethindrone-pop': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'finasteride': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'timolol-ophthalmic': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'ciprofloxacin-ophthalmic': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'ciprofloxacin-otic': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'naproxen': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'bisacodyl-tablets': TherapyDurationGuidance(kind: TherapyDurationKind.shortSelfCare),
  'senna': TherapyDurationGuidance(kind: TherapyDurationKind.shortSelfCare),
  'hydrocortisone-topical': TherapyDurationGuidance(kind: TherapyDurationKind.shortSelfCare),
  'carvedilol': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'sacubitril-valsartan': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'digoxin': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'amiodarone-oral': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'diltiazem-er': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'dapagliflozin': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'insulin-lispro': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'prednisone': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr:
        'قد يكون كورسًا قصيرًا أو علاجًا أطول حسب المرض. لا تخترع جدول تقليل للجرعة بنفسك، ولا توقف العلاج الطويل فجأة؛ اتبع جدول الطبيب إن وُجد.',
  ),
  'methimazole': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr:
        'غالبًا يستمر لأشهر أو أكثر وتُعدّل المدة والجرعة حسب تحاليل الغدة وخطة العلاج. لا تعتبر تحسن الأعراض وحده سببًا للإيقاف.',
  ),
  'ipratropium-hfa': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'fluticasone-hfa': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'fluticasone-salmeterol-dpi': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'ciprofloxacin-oral': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'fluconazole-oral': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr:
        'المدة تختلف كثيرًا حسب نوع الفطريات: قد تكون جرعة واحدة في بعض الحالات أو أيامًا/أسابيع في حالات أخرى. اتبع نفس الوصفة ولا تنقل مدة حالة إلى حالة أخرى.',
  ),
  'cefuroxime-axetil': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'carbamazepine': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'lamotrigine': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'pregabalin': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'fluoxetine': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'escitalopram': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'duloxetine': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'amitriptyline': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'quetiapine': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'pantoprazole': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'famotidine': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'metoclopramide': TherapyDurationGuidance(
    kind: TherapyDurationKind.shortCourse,
    patientOverrideAr:
        'يُفضّل أقصر مدة فعالة، وبعض الاستطبابات لها حد واضح للمدة بسبب خطر الحركات اللاإرادية. لا تمدده من نفسك إذا انتهت الوصفة.',
  ),
  'sucralfate': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'pancrelipase': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'celecoxib': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'diclofenac-oral': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'colchicine': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr:
        'قد يُستخدم فترة قصيرة للنوبة أو مدة أطول للوقاية حسب الخطة. لا تكرر نظام علاج النوبة أو تمدده من وصفة قديمة.',
  ),
  'allopurinol': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'dabigatran': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'enoxaparin': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'loratadine': TherapyDurationGuidance(kind: TherapyDurationKind.intermittent),
  'tacrolimus-topical': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'hydroxychloroquine': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'adalimumab': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'sildenafil-ed': TherapyDurationGuidance(kind: TherapyDurationKind.asNeeded),
  'mirabegron': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'alendronate': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr:
        'علاج طويل الأمد لكنه يحتاج إعادة تقييم دورية لخطر الكسور والحاجة للاستمرار؛ لا تحدد لنفسك موعد “drug holiday” من دون مراجعة الطبيب.',
  ),
  'valsartan': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'bisoprolol': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'nifedipine-er': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'rosuvastatin': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'ezetimibe': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'pioglitazone': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'linagliptin': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'tirzepatide-mounjaro': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr:
        'عادةً علاج طويل الأمد ما دام مفيدًا ومحتملًا. لا تسرّع رفع الجرعة أو توقفه لمجرد تغير الشهية/الوزن دون مراجعة الخطة.',
  ),
  'amoxicillin-clavulanate':
      TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'cephalexin': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'trimethoprim-sulfamethoxazole': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr:
        'قد يكون كورسًا محددًا لعلاج عدوى أو نظام وقاية أطول في حالات خاصة؛ اتبع السبب والمدة المكتوبة في وصفتك ولا تنقل مدة حالة إلى أخرى.',
  ),
  'clarithromycin-oral':
      TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'venlafaxine-xr':
      TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'bupropion-xl':
      TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'mirtazapine':
      TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'lithium': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'risperidone':
      TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'oxybutynin-er': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'solifenacin': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'tadalafil': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr:
        'قد يكون عند الحاجة لضعف الانتصاب أو يوميًا لـED/BPH؛ مدة الاستخدام وجدوله يعتمدان على النظام الموصوف ولا يجوز خلط النظامين.',
  ),
  'risedronate': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr:
        'علاج طويل الأمد لهشاشة العظام مع إعادة تقييم دورية للحاجة للاستمرار؛ لا توقفه أو تحدد فترة راحة دوائية من نفسك.',
  ),
  'denosumab-prolia': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr:
        'علاج طويل الأمد يُعاد كل 6 أشهر عادةً. لا توقف Prolia أو تؤخر الجرعات دون خطة انتقالية لأن خطر كسور الفقرات قد يرتفع بعد الانقطاع.',
  ),
  'ulipristal-ec':
      TherapyDurationGuidance(kind: TherapyDurationKind.singleUse),
  'psyllium':
      TherapyDurationGuidance(kind: TherapyDurationKind.shortSelfCare),
  'brimonidine-ophthalmic':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'ibuprofen-pediatric-liquid':
      TherapyDurationGuidance(kind: TherapyDurationKind.shortSelfCare),
  'albuterol-nebulizer-0083':
      TherapyDurationGuidance(kind: TherapyDurationKind.asNeeded),
  'albuterol-nebulizer-concentrate-05':
      TherapyDurationGuidance(kind: TherapyDurationKind.asNeeded),
  'ipratropium-nebulizer':
      TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'ipratropium-albuterol-nebulizer':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'budesonide-nebulizer':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'tiotropium-respimat':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'fluticasone-nasal':
      TherapyDurationGuidance(kind: TherapyDurationKind.intermittent),
  'mometasone-nasal':
      TherapyDurationGuidance(kind: TherapyDurationKind.intermittent),
  'azelastine-nasal':
      TherapyDurationGuidance(kind: TherapyDurationKind.intermittent),
  'oxymetazoline-nasal': TherapyDurationGuidance(
    kind: TherapyDurationKind.shortSelfCare,
    patientOverrideAr:
        'للاستخدام الذاتي القصير فقط: لا تستخدم oxymetazoline أكثر من 3 أيام متتالية لأن الاحتقان قد يعود أو يزداد مع الاستخدام المطول.',
  ),
};

TherapyDurationGuidance? therapyDurationFor(String medicationId) {
  return medicationTherapyDurations[medicationId];
}
