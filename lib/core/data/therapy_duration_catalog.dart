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
  'amoxicillin-pediatric-suspension':
      TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'cefdinir-pediatric-suspension':
      TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'simethicone-infant-drops':
      TherapyDurationGuidance(kind: TherapyDurationKind.shortSelfCare),
  'ibandronate-monthly': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr:
        'علاج طويل الأمد لهشاشة العظام مع إعادة تقييم دورية للحاجة للاستمرار. لا تحدد لنفسك موعد إيقاف أو drug holiday من دون الطبيب.',
  ),
  'medroxyprogesterone-im-contraception': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr:
        'يُعاد عادة كل 13 أسبوعًا. الملصق الحالي لا يوصي باستخدامه كوسيلة طويلة الأمد لأكثر من سنتين إلا إذا كانت البدائل غير مناسبة بسبب تأثيره على كثافة العظم.',
  ),
  'estradiol-transdermal-patch': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr:
        'مدة العلاج تُراجع دوريًا حسب سبب الاستخدام والأعراض والمخاطر؛ لا تمدد العلاج أو توقفه من نفسك.',
  ),
  'bismuth-subsalicylate':
      TherapyDurationGuidance(kind: TherapyDurationKind.shortSelfCare),
  'dorzolamide-ophthalmic':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'olopatadine-ophthalmic-otc':
      TherapyDurationGuidance(kind: TherapyDurationKind.intermittent),
  'prednisolone-acetate-ophthalmic':
      TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'ofloxacin-otic':
      TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'etanercept': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'secukinumab': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),

  'semaglutide-oral-tablets':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'epipen-auto-injector': TherapyDurationGuidance(
    kind: TherapyDurationKind.asNeeded,
    patientOverrideAr:
        'دواء إسعاف يُحمل ويُستبدل قبل انتهاء الصلاحية أو بعد الاستخدام؛ لا يُستخدم كعلاج يومي.',
  ),
  'naloxone-narcan-nasal': TherapyDurationGuidance(
    kind: TherapyDurationKind.asNeeded,
    patientOverrideAr:
        'دواء إنقاذ للطوارئ عند الاشتباه بجرعة أفيونية زائدة؛ احتفظ بجرعات غير منتهية الصلاحية واستبدل الجهاز بعد الاستخدام.',
  ),
  'baqsimi-glucagon-nasal': TherapyDurationGuidance(
    kind: TherapyDurationKind.asNeeded,
    patientOverrideAr:
        'دواء إنقاذ لهبوط السكر الشديد؛ احتفظ بجهاز غير منتهي الصلاحية واستبدله فور استخدامه.',
  ),
  'dulaglutide-trulicity':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),


  'nayzilam-midazolam-nasal': TherapyDurationGuidance(
    kind: TherapyDurationKind.asNeeded,
    patientOverrideAr:
        'دواء إنقاذ متقطع لنوبات seizure cluster حسب الخطة، وليس علاجًا يوميًا.',
  ),
  'valtoco-diazepam-nasal': TherapyDurationGuidance(
    kind: TherapyDurationKind.asNeeded,
    patientOverrideAr:
        'دواء إنقاذ متقطع لنوبات seizure cluster؛ لا يُستخدم كجرعة يومية ثابتة.',
  ),
  'diastat-acudial-diazepam-rectal': TherapyDurationGuidance(
    kind: TherapyDurationKind.asNeeded,
    patientOverrideAr:
        'دواء إنقاذ متقطع لنوبات seizure cluster ويعطى فقط وفق خطة الطبيب بواسطة caregiver مدرَّب.',
  ),
  'gvoke-hypopen-glucagon': TherapyDurationGuidance(
    kind: TherapyDurationKind.asNeeded,
    patientOverrideAr:
        'دواء إنقاذ لهبوط السكر الشديد؛ احتفظ بجهاز غير منتهي الصلاحية واستبدله بعد الاستخدام.',
  ),
  'neffy-epinephrine-nasal': TherapyDurationGuidance(
    kind: TherapyDurationKind.asNeeded,
    patientOverrideAr:
        'دواء إنقاذ للحساسية الشديدة/anaphylaxis؛ احتفظ بجهازين صالحين واستبدل الجهاز بعد الاستخدام أو انتهاء الصلاحية.',
  ),


  'insulin-degludec-tresiba':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'humulin-n-nph':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'humulin-r-u100':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'humulin-70-30':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'humulin-r-u500':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),


  'sumatriptan-tablets': TherapyDurationGuidance(
    kind: TherapyDurationKind.asNeeded,
    patientOverrideAr:
        'لعلاج نوبة الشقيقة الحادة عند الحاجة؛ إذا أصبحت تحتاج علاجًا حادًا بشكل متكرر فراجع خطة الوقاية بدل تكرار الجرعات تلقائيًا.',
  ),
  'rizatriptan-odt': TherapyDurationGuidance(
    kind: TherapyDurationKind.asNeeded,
    patientOverrideAr:
        'لعلاج النوبة الحادة عند الحاجة، وليس علاجًا يوميًا للوقاية.',
  ),
  'rimegepant-nurtec-odt': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr:
        'تختلف المدة حسب الاستطباب: عند الحاجة للنوبة الحادة، أو علاج وقائي مجدول كل يومين إذا وصف لهذا الغرض.',
  ),
  'ubrogepant-ubrelvy': TherapyDurationGuidance(
    kind: TherapyDurationKind.asNeeded,
    patientOverrideAr:
        'لعلاج نوبة الشقيقة الحادة عند الحاجة، وليس جدول وقاية يوميًا.',
  ),
  'zavegepant-zavzpret-nasal': TherapyDurationGuidance(
    kind: TherapyDurationKind.asNeeded,
    patientOverrideAr:
        'بخاخ لعلاج النوبة الحادة عند الحاجة؛ ليس علاج وقاية مجدولًا.',
  ),


  'aspirin-81-antiplatelet-dr': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr:
        'قد يكون علاجًا طويل الأمد للوقاية الثانوية، لكن لا تبدأ أو توقف aspirin اليومي من نفسك لأن الفائدة مقابل النزف تعتمد على سبب الاستخدام.',
  ),
  'ticagrelor-brilinta': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr:
        'المدة تعتمد على الاستطباب: قد تكون طويلة في أمراض الشرايين/بعد MI، بينما مسار acute ischemic stroke/TIA الحالي يصل حتى 30 يومًا. لا توقفه مبكرًا بعد دعامة.',
  ),
  'prasugrel': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr:
        'تُحدد المدة حسب ACS/PCI والدعامة؛ لا توقف prasugrel مبكرًا من نفسك.',
  ),
  'aspirin-er-dipyridamole':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'cilostazol': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr:
        'قد يحتاج التحسن 2–4 أسابيع وحتى 12 أسبوعًا. إذا لم تتحسن الأعراض بعد 3 أشهر فالملصق الحالي يوصي بإيقاف العلاج ومراجعة الخطة.',
  ),


  'mesalamine-lialda': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr:
        'قد يستخدم للتحريض ثم للمحافظة على الهدأة؛ جرعة ومدة induction تختلف عن maintenance ولا تُنقل من مرحلة لأخرى تلقائيًا.',
  ),
  'mesalamine-apriso':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'mesalamine-pentasa':
      TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'mesalamine-canasa-suppository': TherapyDurationGuidance(
    kind: TherapyDurationKind.shortCourse,
    patientOverrideAr:
        'المدة المعتادة حسب الملصق 3–6 أسابيع؛ لا تمدد العلاج تلقائيًا دون مراجعة الاستجابة.',
  ),
  'mesalamine-rowasa-enema': TherapyDurationGuidance(
    kind: TherapyDurationKind.shortCourse,
    patientOverrideAr:
        'المدة المعتادة 3–6 أسابيع حسب الأعراض ونتائج المتابعة؛ لا تحولها إلى علاج دائم دون خطة.',
  ),


  'patiromer-veltassa': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr:
        'قد يكون العلاج لفترة تصحيح أو يستمر للمحافظة على البوتاسيوم حسب السبب والتحاليل؛ لا توقفه أو تمدده من نفسك.',
  ),
  'sodium-zirconium-cyclosilicate-lokelma': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr:
        'قد يستخدم لفترة تصحيح قصيرة أو كعلاج maintenance حسب البوتاسيوم؛ مرضى الغسيل لهم جدول خاص في أيام غير الغسيل.',
  ),
  'sevelamer-carbonate-renvela-tablet':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'sevelamer-carbonate-renvela-powder':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'sucroferric-oxyhydroxide-velphoro':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),


  'amoxicillin-clavulanate-augmentin-es600-suspension':
      TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'azithromycin-suspension-200mg5ml':
      TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'cephalexin-suspension-250mg5ml':
      TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'trimethoprim-sulfamethoxazole-suspension-200-40mg5ml':
      TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'nitrofurantoin-suspension-25mg5ml':
      TherapyDurationGuidance(kind: TherapyDurationKind.individualized),


  'potassium-chloride-klor-con-m':
      TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'potassium-chloride-er-capsule-sprinkle':
      TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'potassium-chloride-oral-solution':
      TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'calcium-acetate-667mg-capsule':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'lanthanum-carbonate-fosrenol-chewable':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),


  'teriparatide-forteo': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr:
        'غالبًا علاج بنّاء للعظم لمدة محددة؛ استخدام FORTEO لأكثر من سنتين خلال العمر يُنظر فيه فقط إذا بقي أو عاد خطر الكسور مرتفعًا.',
  ),
  'abaloparatide-tymlos': TherapyDurationGuidance(
    kind: TherapyDurationKind.shortCourse,
    patientOverrideAr:
        'استخدام TYMLOS لأكثر من سنتين خلال العمر غير موصى به حسب الملصق الحالي.',
  ),
  'romosozumab-evenity': TherapyDurationGuidance(
    kind: TherapyDurationKind.shortCourse,
    patientOverrideAr:
        'EVENITY محدد بـ12 جرعة شهرية فقط، ثم تُراجع الحاجة لعلاج antiresorptive لاحق.',
  ),
  'zoledronic-acid-osteoporosis': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr:
        'المدة الكلية تعتمد على خطر الكسور والاستطباب؛ العلاج قد يكون سنويًا مع إعادة تقييم دورية للحاجة للاستمرار.',
  ),


  'calcium-carbonate-antacid-500mg-chewable':
      TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'magnesium-hydroxide-milk-of-magnesia-2400mg30ml':
      TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'glycerin-adult-suppository-2g':
      TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'meclizine-25mg-motion-sickness-otc':
      TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),


  'permethrin-5-cream-scabies':
      TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'clotrimazole-1-cream-otc':
      TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'adapalene-0-1-gel-otc':
      TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'mupirocin-2-ointment-impetigo':
      TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),


  'drospirenone-slynd-4mg':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'medroxyprogesterone-depo-provera-ci-150mg-im':
      TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'etonogestrel-ethinyl-estradiol-vaginal-ring':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'norelgestromin-ethinyl-estradiol-patch':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),


  'glipizide-ir': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'insulin-aspart-novolog':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'isosorbide-mononitrate-er':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'clonidine-transdermal':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'esomeprazole-dr-capsule':
      TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'fosfomycin-tromethamine-sachet':
      TherapyDurationGuidance(kind: TherapyDurationKind.singleUse),
  'levofloxacin-oral':
      TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'topiramate-tablets':
      TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'aripiprazole-tablets':
      TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'olanzapine-tablets':
      TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'tranexamic-acid-hmb-650mg': TherapyDurationGuidance(
    kind: TherapyDurationKind.shortCourse,
    patientOverrideAr:
        'يستخدم فقط خلال الدورة الشهرية ولمدة لا تتجاوز 5 أيام في كل دورة حسب الملصق؛ ليس علاجًا يوميًا بين الدورات.',
  ),
  'micronized-progesterone-oral':
      TherapyDurationGuidance(kind: TherapyDurationKind.individualized),

  'canagliflozin-invokana': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'ertugliflozin-steglatro': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'acarbose': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'repaglinide': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'nateglinide': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'glyburide': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'saxagliptin': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'insulin-aspart-fiasp': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'insulin-glulisine-apidra': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'etonogestrel-implant-nexplanon': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'وسيلة طويلة المفعول: NEXPLANON معتمد حاليًا لمنع الحمل حتى 5 سنوات، ويمكن إزالته قبل ذلك عند الرغبة/الحاجة.',
  ),
  'levonorgestrel-ius-mirena': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'MIRENA: منع الحمل حتى 8 سنوات، لكن علاج غزارة الدورة حتى 5 سنوات؛ مدة الاستخدام تعتمد على الاستطباب.',
  ),
  'copper-iud-paragard': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'PARAGARD يمنع الحمل حتى 10 سنوات ويُزال قبل/عند نهاية هذه المدة أو أبكر عند الحاجة.',
  ),
  'testosterone-gel-1-62': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'desmopressin-nocdurna': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'cabergoline-hyperprolactinemia': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'enalapril': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'telmisartan': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'nebivolol': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'candesartan': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),


  'alogliptin': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'insulin-human-regular-humulin-r': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'insulin-nph-humulin-n': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'ramipril': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'irbesartan': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'atenolol': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'clonidine-oral': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'doxazosin': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'hydrocortisone-adrenal-replacement': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'إذا كان adrenal insufficiency دائمًا فغالبًا hydrocortisone replacement علاج مدى الحياة، مع stress-dose plan أثناء المرض/الجراحة.',
  ),
  'fludrocortisone-adrenal-replacement': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'غالبًا علاج طويل الأمد/مدى الحياة عند نقص aldosterone الدائم، مع متابعة الضغط والـelectrolytes.',
  ),
  'estradiol-patch-twice-weekly': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'estradiol-vagifem': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'progesterone-endometrin': TherapyDurationGuidance(
    kind: TherapyDurationKind.shortCourse,
    patientOverrideAr: 'جزء من بروتوكول ART؛ ملصق ENDOMETRIN يسمح بالاستمرار حتى 10 أسابيع إجمالًا حسب خطة مركز الخصوبة.',
  ),
  'drospirenone-pop-slynd': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'xulane-contraceptive-patch': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'annovera-vaginal-ring': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'حلقة ANNOVERA واحدة قابلة لإعادة الاستخدام حتى 13 دورة (حوالي سنة) مع نمط 21 يومًا داخل + 7 أيام خارج.',
  ),
  'liothyronine-cytomel': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'medroxyprogesterone-oral': TherapyDurationGuidance(
    kind: TherapyDurationKind.shortCourse,
    patientOverrideAr: 'لـsecondary amenorrhea أو بعض abnormal uterine bleeding يكون الكورس الفموي غالبًا 5–10 أيام حسب الاستطباب ويوم الدورة؛ لا تمددي الكورس من نفسك.',
  ),
  'hydralazine-oral': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'labetalol-oral': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),


  'insulin-lispro-humalog': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'insulin-lispro-lyumjev': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'insulin-glargine-toujeo': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'insulin-glargine-basaglar': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'semaglutide-rybelsus': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'semaglutide-ozempic': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'exenatide-byetta': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'exenatide-bydureon-bcise': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'verelan-pm': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'eplerenone': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'amiloride': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'methyldopa': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'bromocriptine-hyperprolactinemia': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'levothyroxine-tirosint-sol': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'depo-provera-ci': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'كل 13 أسبوعًا ما دامت الوسيلة مناسبة؛ الاستخدام لأكثر من سنتين يحتاج مراجعة فائدة/خطر إذا كانت البدائل مناسبة.',
  ),
  'nuvaring': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),

  'clarithromycin-er': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'cefuroxime-axetil-tablets': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'cefpodoxime-tablets': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'cefdinir-capsules': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'levofloxacin-oral-solution': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'linezolid-oral': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'metronidazole-er': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'rifaximin-xifaxan': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'المدة تعتمد على الاستطباب: travelers diarrhea عادة 3 أيام، IBS-D 14 يومًا مع إمكان retreatment محدود، وHE قد يكون علاجًا مزمنًا للوقاية من الانتكاس.',
  ),
  'pantoprazole-dr-granules': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'budesonide-uceris': TherapyDurationGuidance(
    kind: TherapyDurationKind.shortCourse,
    patientOverrideAr: 'UCERIS للـulcerative colitis هو induction course يصل عادةً إلى 8 أسابيع حسب الملصق؛ لا تمدده من نفسك.',
  ),
  'linaclotide-linzess': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'lubiprostone': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'doxylamine-pyridoxine-dr': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'aprepitant': TherapyDurationGuidance(
    kind: TherapyDurationKind.shortCourse,
    patientOverrideAr: 'مدة قصيرة مرتبطة بدورة chemotherapy أو جرعة/خطة perioperative؛ ليست antiemetic مزمنة عامة.',
  ),

  'azithromycin-zmax': TherapyDurationGuidance(kind: TherapyDurationKind.singleUse),
  'penicillin-v': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'dicloxacillin': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'tetracycline-capsules': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'fosfomycin-tromethamine': TherapyDurationGuidance(kind: TherapyDurationKind.singleUse),
  'rifampin': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'المدة تعتمد على الاستطباب؛ في TB يكون ضمن regimen متعدد الأدوية وقد يستمر أشهرًا، بينما بعض prophylaxis courses أقصر.',
  ),
  'lansoprazole-odt': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'dexlansoprazole-dr': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'cholestyramine': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'plecanatide-trulance': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'prucalopride-motegrity': TherapyDurationGuidance(kind: TherapyDurationKind.chronic),
  'meclizine-motion-sickness': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'prochlorperazine-severe-nausea': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),

  'minocycline-capsules': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'moxifloxacin-tablets': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),
  'fidaxomicin-tablets': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse, patientOverrideAr: 'للـadult C. difficile في current tablet label: 200 mg مرتين يوميًا لمدة 10 أيام.'),
  'vancomycin-oral-capsules': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse, patientOverrideAr: 'للـadult C. difficile في current capsule label: 125 mg أربع مرات يوميًا لمدة 10 أيام؛ الاستطبابات الأخرى تختلف.'),
  'rabeprazole-dr-tablets': TherapyDurationGuidance(kind: TherapyDurationKind.individualized),
  'scopolamine-transdermal': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse, patientOverrideAr: 'Motion sickness: patch واحدة حتى 3 أيام؛ PONV له توقيت إزالة مختلف.'),
  'granisetron-oral-tablets': TherapyDurationGuidance(kind: TherapyDurationKind.shortCourse),

  'amoxicillin-clavulanate-xr': TherapyDurationGuidance(
    kind: TherapyDurationKind.shortCourse,
    patientOverrideAr: 'AUGMENTIN XR: مدة الكورس حسب الاستطباب؛ في الملصق الحالي acute bacterial sinusitis = 10 أيام وcommunity-acquired pneumonia = 7–10 أيام.',
  ),
  'sulfasalazine-dr': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'قد يكون علاجًا طويل الأمد للـUC أو RA، لكن جرعة induction/maintenance والمدة تختلف حسب الاستطباب والاستجابة والمتابعة.',
  ),
  'dicyclomine-oral': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'الفعالية والتحمل يجب أن يُعاد تقييمهما؛ الملصق الحالي ينص على إيقاف العلاج إذا لم تتحقق الفائدة أو لم تُحتمل الجرعة المطلوبة بعد نحو أسبوعين.',
  ),
  'hyoscyamine-sl': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'قد يكون مجدولًا أو عند الحاجة حسب الاستطباب؛ لا تحول استخدامًا PRN إلى علاج يومي مستمر من نفسك.',
  ),
  'promethazine-oral-tablets': TherapyDurationGuidance(
    kind: TherapyDurationKind.shortCourse,
    patientOverrideAr: 'غالبًا استخدام قصير أو عند الحاجة حسب السبب مثل nausea أو motion sickness؛ ليس علاجًا مزمنًا يوميًا عامًا.',
  ),


  'erythromycin-erytab-dr': TherapyDurationGuidance(
    kind: TherapyDurationKind.shortCourse,
    patientOverrideAr: 'كورس مضاد حيوي محدد حسب نوع العدوى والجرعة؛ أكمل المدة التي حددها الطبيب ولا تعيد استخدامه من نفسك.',
  ),
  'doxycycline-doryx-mpc': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'المدة تختلف حسب الاستطباب: بعض العدوى 7–10 أيام، بينما malaria prophylaxis أو anthrax exposure قد تحتاج أسابيع؛ اتبع regimen المنتج نفسه.',
  ),
  'tenapanor-ibsrela': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'قد يُستمر عليه للـIBS-C إذا كان فعالًا ومحتملًا، مع إيقافه ومراجعة الطبيب إذا حدث إسهال شديد.',
  ),
  'eluxadoline-viberzi': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'قد يكون علاجًا مستمرًا للـIBS-D عند مريض مختار، لكن يُوقف عند severe constipation أو أعراض pancreatitis/sphincter-of-Oddi.',
  ),
  'netupitant-palonosetron-akynzeo-oral': TherapyDurationGuidance(
    kind: TherapyDurationKind.singleUse,
    patientOverrideAr: 'عادة كبسولة واحدة قبل كل chemotherapy cycle حسب الخطة؛ ليست دواءً يوميًا تستمر عليه بين الدورات.',
  ),


  'cefuroxime-axetil-suspension': TherapyDurationGuidance(
    kind: TherapyDurationKind.shortCourse,
    patientOverrideAr: 'كورس قصير حسب نوع العدوى؛ كثير من الاستطبابات الموثقة للمعلق 10 أيام، لكن اتبع المدة المكتوبة للوصفة.',
  ),
  'cefpodoxime-suspension': TherapyDurationGuidance(
    kind: TherapyDurationKind.shortCourse,
    patientOverrideAr: 'مدة العلاج تختلف حسب الاستطباب؛ قد تتراوح من جرعة واحدة إلى 5–14 يومًا حسب العدوى.',
  ),
  'clarithromycin-suspension': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'غالبًا كورس قصير للعدوى المعتادة، لكن mycobacterial regimens استثناء وقد تكون طويلة جدًا؛ لا تعمم مدة واحدة.',
  ),
  'budesonide-dr-capsules-crohns': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'Active Crohn عند البالغ: 9 mg صباحًا حتى 8 أسابيع؛ maintenance: 6 mg صباحًا حتى 3 أشهر ثم taper/إيقاف حسب الخطة.',
  ),
  'granisetron-sancuso-patch': TherapyDurationGuidance(
    kind: TherapyDurationKind.singleUse,
    patientOverrideAr: 'Patch واحدة لكل chemotherapy course حسب الخطة؛ تُلبس خلال العلاج وحتى ≥24 ساعة بعده، وبحد أقصى 7 أيام.',
  ),


  'trazodone-ir-tablets': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'غالبًا علاج يمتد لأشهر أو أكثر إذا كان فعالًا؛ لا توقفه فجأة بعد الاستخدام المنتظم بل حسب خطة taper.',
  ),
  'lurasidone-tablets': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'غالبًا علاج طويل الأمد للـschizophrenia أو bipolar depression، مع مراجعة الاستجابة والآثار الجانبية دوريًا.',
  ),
  'ziprasidone-capsules': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'غالبًا علاج طويل الأمد عند الاستجابة؛ مدة الاستمرار تعتمد على schizophrenia/bipolar maintenance وخطة الطبيب.',
  ),
  'quetiapine-xr': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'غالبًا علاج مستمر للـschizophrenia/bipolar أو adjunctive depression حسب الاستطباب؛ لا توقفه فجأة.',
  ),
  'oxcarbazepine-oxtellar-xr': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'دواء صرع مزمن عادةً؛ لا يوقف فجأة لأن ذلك قد يسبب تدهور النوبات أو status epilepticus.',
  ),
  'carbidopa-levodopa-rytary': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'علاج مزمن لـParkinson مع تعديل الجرعات حسب الأعراض وwearing-off/dyskinesia؛ لا توقفه فجأة.',
  ),
  'rivastigmine-transdermal': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'علاج مزمن ما دامت الفائدة موجودة والتحمل مناسبًا؛ الانقطاع >3 أيام يحتاج restart بجرعة 4.6 mg/24 h وإعادة titration.',
  ),
  'galantamine-er': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'علاج مزمن لأعراض Alzheimer إذا بقي مفيدًا ومحتملًا؛ الزيادة بين الجرعات تكون بفواصل لا تقل عن 4 أسابيع.',
  ),
  'cladribine-mavenclad': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'ليس علاجًا يوميًا مستمرًا: مجموع العلاج موزع على دورتين سنويتين، وكل سنة فيها treatment cycles قصيرة محددة حسب الوزن والخطة.',
  ),
  'diroximel-fumarate-vumerity': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'دواء disease-modifying مزمن للـMS ما دام فعالًا وآمنًا، مع CBC/lymphocytes وفحوصات الكبد حسب المتابعة.',
  ),


  'vilazodone-tablets': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'غالبًا علاج يمتد لأشهر أو أكثر إذا كان فعالًا؛ يحتاج titration عند البدء وtaper عند الإيقاف.',
  ),
  'asenapine-sublingual': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'غالبًا علاج طويل الأمد للـschizophrenia أو bipolar I حسب الاستجابة والمتابعة.',
  ),
  'phenytoin-extended-capsules': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'دواء صرع مزمن عادةً؛ لا يوقف فجأة، وأي تبديل formulation يحتاج متابعة مستوى/جرعة.',
  ),
  'pramipexole-er': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'علاج مزمن لـParkinson؛ الزيادة والتقليل تدريجيان، والانقطاع المهم قد يحتاج re-titration.',
  ),
  'opicapone-ongentys': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'علاج مساعد مزمن مع levodopa/carbidopa إذا كان يقلل off episodes ويظل محتملًا.',
  ),
  'donepezil-odt': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'علاج عرضي مزمن لـAlzheimer ما دامت الفائدة موجودة والتحمل مناسبًا.',
  ),
  'memantine-xr': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'علاج عرضي مزمن لـmoderate-to-severe Alzheimer؛ الانقطاع عدة أيام قد يحتاج إعادة titration.',
  ),
  'dimethyl-fumarate-dr': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'دواء disease-modifying مزمن للـMS مع CBC/lymphocytes وفحوصات كبد ومراجعة العدوى.',
  ),
  'teriflunomide-tablets': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'دواء disease-modifying مزمن للـMS؛ يبقى في الجسم مدة طويلة بعد الإيقاف وقد يحتاج accelerated elimination عند الضرورة.',
  ),
  'fingolimod-capsules': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'دواء disease-modifying مزمن للـMS؛ بعض الانقطاعات تستلزم إعادة first-dose cardiac monitoring قبل الاستئناف.',
  ),


  'paroxetine-paxil-cr': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'غالبًا علاج يمتد لأشهر أو أكثر إذا كان فعالًا؛ PMDD قد يكون continuous أو luteal-phase-only حسب الخطة، والإيقاف تدريجي.',
  ),
  'desvenlafaxine-er': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'غالبًا علاج طويل الأمد للاكتئاب عند الاستجابة؛ الإيقاف تدريجي لتقليل discontinuation symptoms.',
  ),
  'lumateperone-caplyta': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'غالبًا علاج مستمر للـschizophrenia/bipolar depression أو adjunctive MDD حسب الاستجابة والمتابعة.',
  ),
  'selegiline-zelapar-odt': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'علاج مساعد مزمن لـParkinson عند الاستفادة والتحمل؛ لا تُرفع الجرعة خارج الخطة بسبب تداخلات MAO-B/MAO.',
  ),
  'entacapone-tablets': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'علاج مساعد مزمن مرتبط بكل جرعة levodopa/carbidopa ما دام يقلل wearing-off ويظل محتملًا.',
  ),
  'ropinirole-er': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'علاج مزمن لـParkinson؛ الزيادة والتقليل تدريجيان، والانقطاع المهم قد يتطلب re-titration.',
  ),
  'siponimod-mayzent': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'دواء disease-modifying مزمن للـMS؛ الانقطاع المهم يعيدك إلى titration حسب القاعدة وليس مباشرة للـmaintenance.',
  ),
  'ozanimod-zeposia': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'دواء disease-modifying مزمن؛ يبدأ ب7-day titration وأي missed dose خلال أول 14 يومًا يحتاج restart titration.',
  ),
  'ofatumumab-kesimpta': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'علاج disease-modifying مزمن: Weeks 0,1,2 ثم monthly من Week 4 إذا استمر العلاج آمنًا وفعالًا.',
  ),


  'sumatriptan-nasal-spray': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'PRN فقط لنوبة migraine؛ لا يستخدم يوميًا للوقاية، وكثرة أيام الاستخدام تستلزم مراجعة medication-overuse headache.',
  ),
  'sumatriptan-injection-autoinjector': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'PRN فقط لنوبة migraine أو cluster headache؛ ليس علاجًا وقائيًا يوميًا.',
  ),
  'zolmitriptan-nasal-spray': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'PRN لنوبة migraine فقط؛ كثرة أيام العلاج الحاد تحتاج مراجعة خطة الوقاية وmedication-overuse.',
  ),
  'eletriptan-tablets': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'PRN لنوبة migraine؛ لا يستخدم كوقاية يومية.',
  ),
  'lasmiditan-reyvow': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'جرعة PRN للنوبة الحادة فقط، وبحد أقصى جرعة واحدة خلال 24 ساعة.',
  ),
  'atogepant-qulipta': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'علاج وقائي يومي مزمن ما دام يقلل migraine days ويظل محتملًا.',
  ),
  'erenumab-aimovig': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'وقاية شهرية مزمنة مع تقييم الفعالية والتحمل دوريًا.',
  ),
  'fremanezumab-ajovy': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'وقاية مزمنة بنظام monthly أو quarterly ثابت حسب الخطة.',
  ),
  'galcanezumab-emgality': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'للـmigraine وقاية شهرية مزمنة؛ للـepisodic cluster يُعطى شهريًا فقط خلال cluster period.',
  ),
  'dihydroergotamine-trudhesa': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'PRN للنوبة الحادة فقط؛ لا يستخدم chronic daily، والحد الأقصى 2 doses/24 h و3 doses/7 days.',
  ),


  'naratriptan-tablets': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'PRN لنوبة migraine فقط؛ ليست وقاية يومية، وكثرة الاستخدام الحاد تستلزم مراجعة medication-overuse headache.',
  ),
  'frovatriptan-tablets': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'PRN لنوبة migraine الحادة فقط؛ ليست preventive therapy.',
  ),
  'almotriptan-tablets': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'PRN لنوبة migraine فقط؛ لا يستخدم للوقاية اليومية.',
  ),
  'sumatriptan-naproxen-tablets': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'PRN للنوبة الحادة فقط؛ لا يستخدم كوقاية، ويُستخدم بأقل جرعة/أقصر مدة مناسبة بسبب مكون NSAID.',
  ),
  'dihydroergotamine-brekiya': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'PRN لنوبة migraine أو cluster headache؛ حدوده 3 doses/24 h و6 doses/7 days، وليس chronic daily treatment.',
  ),
  'dihydroergotamine-nasal-legacy': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'PRN لنوبة migraine؛ لا يستخدم chronic daily، وتعليماته تختلف عن TRUDHESA.',
  ),
  'acetaminophen-otc-500mg': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'استخدام OTC قصير المدى للصداع/الألم؛ لا تستخدم للألم أكثر من 10 أيام دون مراجعة طبية.',
  ),
  'ibuprofen-otc-200mg': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'استخدام OTC قصير المدى؛ إذا استمر الألم >10 أيام أو ساء فراجع الطبيب بدل الاستمرار المتكرر.',
  ),
  'naproxen-sodium-otc-220mg': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'استخدام OTC قصير المدى؛ استمرار الصداع/الألم >10 أيام يستلزم تقييمًا بدل الاستمرار.',
  ),
  'acetaminophen-aspirin-caffeine-migraine': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'PRN لنوبة migraine فقط؛ persistent/worsening أو frequent headaches تحتاج تقييمًا بدل تكرار المنتج.',
  ),
  'bupropion-xl': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'غالبًا علاج يمتد لأشهر أو أكثر للاكتئاب؛ الاستخدام الموسمي يتبع خطة المريض وتاريخ النوبات الموسمية.',
  ),
  'venlafaxine-xr': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'غالبًا علاج يمتد لأشهر أو أكثر عند الاستجابة؛ الإيقاف تدريجي لتقليل discontinuation symptoms.',
  ),
  'lamotrigine-xr': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'علاج صرع مزمن عادةً؛ الانقطاع المهم قد يحتاج re-titration ولا يوقف فجأة.',
  ),
  'divalproex-er': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'قد يكون علاجًا مزمنًا للصرع/bipolar أو للوقاية من migraine حسب الحالة؛ المدة تعتمد على الفائدة والمخاطر والمتابعة.',
  ),

  'carbamazepine-xr-tablets': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'غالبًا علاج مزمن للصرع/الاستطباب العصبي؛ لا يوقف فجأة والتحويل بين الصيغ يحتاج متابعة.',
  ),
  'levetiracetam-xr': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'علاج صرع مزمن عادةً؛ لا يوقف فجأة، وXR يحتاج renal-dose review ومتابعة السيطرة على النوبات.',
  ),
  'topiramate-qudexy-xr': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'غالبًا علاج مزمن للصرع أو وقاية migraine؛ لا يوقف فجأة وتراجع الفائدة والتحمل دوريًا.',
  ),
  'topiramate-trokendi-xr': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'غالبًا علاج مزمن للصرع أو وقاية migraine؛ لا يوقف فجأة وتراجع الفائدة والتحمل دوريًا.',
  ),
  'metformin-er-tablets': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'غالبًا علاج مزمن للسكري النوع الثاني ما دام فعالًا والتحمل ووظيفة الكلى مناسبين.',
  ),
  'glipizide-er': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'غالبًا علاج مزمن للسكري النوع الثاني مع مراجعة A1c وخطر hypoglycemia دوريًا.',
  ),
  'gliclazide-mr-30mg': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'غالبًا علاج مزمن للسكري النوع الثاني مع مراقبة glucose/A1c وخطر هبوط السكر.',
  ),

  'pregabalin-lyrica-cr': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'غالبًا علاج مزمن لألم الأعصاب عندما يكون فعالًا؛ الإيقاف تدريجيًا خلال أسبوع على الأقل.',
  ),
  'gabapentin-gralise': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'لعلاج PHN حسب الاستجابة؛ عند الإيقاف أو الاستبدال خفّض تدريجيًا خلال أسبوع على الأقل.',
  ),
  'gabapentin-enacarbil-horizant': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'قد يكون علاجًا مزمنًا للـRLS أو PHN حسب الاستجابة والتحمل؛ لا يوقف فجأة.',
  ),
  'lacosamide-motpoly-xr': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'علاج صرع مزمن عادةً؛ لا يوقف فجأة ويحتاج متابعة السيطرة على النوبات.',
  ),
  'sitagliptin-metformin-janumet-xr': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'علاج مزمن للسكري النوع الثاني ما دام فعالًا ووظيفة الكلى تسمح.',
  ),
  'linagliptin-metformin-jentadueto-xr': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'علاج مزمن للسكري النوع الثاني مع متابعة A1c ووظيفة الكلى والتحمل.',
  ),
  'saxagliptin-metformin-kombiglyze-xr': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'علاج مزمن للسكري النوع الثاني مع متابعة glucose/A1c ووظيفة الكلى وأعراض heart failure عند المعرضين.',
  ),

  'metoprolol-succinate-er': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'غالبًا علاج قلبي مزمن؛ لا يوقف فجأة والتحويل من IR إلى ER يتبعه تقييم النبض/الضغط والاستطباب.',
  ),
  'verapamil-er-tablets': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'غالبًا علاج مزمن عند استخدامه للضغط/القلب؛ راجع الاستجابة والنبض ولا تبدل بين ER products من نفسك.',
  ),
  'propranolol-er-capsules': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'قد يكون مزمنًا حسب الاستطباب؛ لا يوقف فجأة والتحويل من النوع العادي إلى ER يحتاج إعادة تقييم الجرعة.',
  ),
  'tolterodine-la': TherapyDurationGuidance(
    kind: TherapyDurationKind.chronic,
    patientOverrideAr: 'عادةً يستمر ما دام يحسن أعراض المثانة وتبقى الأعراض المضادة للكولين مقبولة.',
  ),

  'amphetamine-mixed-salts-adderall-xr': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'قد يكون علاج ADHD طويل الأمد مع إعادة تقييم دورية للفائدة، الشهية/الوزن، النوم، القلب وخطر misuse.',
  ),
  'dexmethylphenidate-focalin-xr': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'قد يكون علاج ADHD طويل الأمد مع إعادة تقييم دورية للفائدة والآثار الجانبية والحاجة للاستمرار.',
  ),
  'methylphenidate-concerta-er': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'قد يكون علاج ADHD طويل الأمد مع مراجعة الاستجابة والنمو/الوزن والنوم والضغط/النبض دوريًا.',
  ),

  'guanfacine-intuniv-er': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'قد يكون علاج ADHD طويل الأمد؛ عند الإيقاف يجب taper لتجنب rebound hypertension.',
  ),
  'clonidine-er-adhd': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'قد يكون علاج ADHD طويل الأمد؛ لا يوقف فجأة ويُخفض تدريجيًا لتجنب rebound hypertension.',
  ),
  'amantadine-gocovri': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'غالبًا علاج مزمن/فردي في باركنسون؛ لا يوقف فجأة وتراجع الاستجابة والهلوسة/السقوط دوريًا.',
  ),
  'amantadine-osmolex-er': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'غالبًا علاج مزمن/فردي لباركنسون أو EPS؛ لا يوقف فجأة والجدول يعتمد على renal function.',
  ),
  'tramadol-er': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'علاج opioid طويل الأمد فقط عند استمرار الفائدة فوق المخاطر؛ يراجع دوريًا ولا يوقف فجأة بعد حدوث dependence.',
  ),

  'tapentadol-er': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'علاج opioid طويل الأمد فقط إذا استمرت الفائدة فوق المخاطر؛ يراجع دوريًا ويُخفض تدريجيًا عند الإيقاف إذا وُجد dependence.',
  ),
  'theophylline-er-once-daily': TherapyDurationGuidance(
    kind: TherapyDurationKind.individualized,
    patientOverrideAr: 'قد يكون علاجًا مزمنًا في حالات مختارة؛ الاستمرار يعتمد على الفائدة، serum level، التداخلات وعلامات السمية.',
  ),
  'mesalamine-dr-800mg': TherapyDurationGuidance(
    kind: TherapyDurationKind.shortCourse,
    patientOverrideAr: 'المنتج DR 800 mg المراجع له كورس 6 أسابيع لعلاج moderately active ulcerative colitis؛ لا تعمم هذه المدة على كل منتجات mesalamine.',
  ),


};

TherapyDurationGuidance? therapyDurationFor(String medicationId) {
  return medicationTherapyDurations[medicationId];
}