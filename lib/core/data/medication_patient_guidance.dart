import '../models/medication.dart';

class MedicationPatientGuidancePatch {
  const MedicationPatientGuidancePatch({
    this.importantAr = '',
    this.missedDoseAr = '',
    this.seekHelpAr = '',
    this.teachBackAr = '',
    this.storageAr = '',
    this.sourceLabel = '',
  });

  final String importantAr;
  final String missedDoseAr;
  final String seekHelpAr;
  final String teachBackAr;
  final String storageAr;
  final String sourceLabel;
}

const _genericMissedDoseAr =
    'خذ الجرعة عند التذكر إذا لم يقترب موعد الجرعة التالية. إذا اقترب موعدها فتجاوز الجرعة المنسية وخذ التالية في وقتها. لا تضاعف الجرعة.';

const _genericMissedDoseIds = <String>{
  'omeprazole',
  'cetirizine',
  'lisinopril',
  'fexofenadine',
  'upadacitinib',
  'tofacitinib',
  'polyethylene-glycol-3350',
  'lactulose',
  'atorvastatin',
  'metoprolol',
  'spironolactone',
  'empagliflozin',
  'levothyroxine',
  'sertraline',
  'gabapentin',
  'nitrofurantoin',
  'clindamycin-oral',
  'furosemide',
  'hydrochlorothiazide',
  'clopidogrel',
  'valproic-acid',
  'finasteride',
  'timolol-ophthalmic',
  'ciprofloxacin-ophthalmic',
  'ciprofloxacin-otic',
  'diltiazem-er',
  'methimazole',
  'fluticasone-hfa',
  'fluticasone-salmeterol-dpi',
  'ciprofloxacin-oral',
  'fluconazole-oral',
  'cefuroxime-axetil',
  'carbamazepine',
  'lamotrigine',
  'pregabalin',
  'fluoxetine',
  'escitalopram',
  'duloxetine',
  'amitriptyline',
  'quetiapine',
  'pantoprazole',
  'metoclopramide',
  'allopurinol',
  'loratadine',
  'tacrolimus-topical',
  'hydroxychloroquine',
  'mirabegron',
};

const medicationPatientGuidancePatches =
    <String, MedicationPatientGuidancePatch>{

  'omeprazole': MedicationPatientGuidancePatch(
    seekHelpAr:
        'راجع الطبيب عند صعوبة أو ألم في البلع، قيء دموي، براز أسود، نقص وزن غير مقصود أو ألم صدر بدل الاستمرار على علاج الحموضة من نفسك.',
    sourceLabel: 'DailyMed / MedlinePlus · omeprazole delayed-release',
  ),
  'fexofenadine': MedicationPatientGuidancePatch(
    seekHelpAr:
        'اطلب إسعافًا عند تورم الوجه أو اللسان أو الحلق أو صعوبة التنفس؛ هذه علامات تحسس شديد وليست سببًا لأخذ جرعات إضافية.',
    sourceLabel: 'DailyMed / MedlinePlus · fexofenadine',
  ),
  'salbutamol-mdi': MedicationPatientGuidancePatch(
    missedDoseAr:
        'إذا كان البخاخ عند الحاجة فلا توجد جرعة منسية. إذا كان لديك جدول ثابت خاص فاتبع الخطة ولا تضاعف عدد البخات لتعويض جرعة فاتت.',
    sourceLabel: 'FDA / exact albuterol-salbutamol inhaler IFU',
  ),
  'paracetamol': MedicationPatientGuidancePatch(
    missedDoseAr:
        'إذا كنت تستخدمه عند الحاجة فلا توجد جرعة منسية. إذا كان مجدولًا فتجاوز الجرعة إذا اقترب موعد التالية ولا تضاعف، واحسب إجمالي paracetamol/acetaminophen من كل المنتجات.',
    sourceLabel: 'DailyMed OTC acetaminophen labeling',
  ),
  'ibuprofen': MedicationPatientGuidancePatch(
    missedDoseAr:
        'إذا كان عند الحاجة فلا توجد جرعة منسية. إذا كان بوصفة مجدولة فتجاوز الجرعة إذا اقترب موعد التالية ولا تضاعف ولا تضف NSAID آخر.',
    sourceLabel: 'DailyMed / MedlinePlus · ibuprofen',
  ),
  'loperamide': MedicationPatientGuidancePatch(
    missedDoseAr:
        'غالبًا يُستخدم حسب نوبات الإسهال وليس كدواء ثابت، لذلك لا تعوض “جرعة منسية”. التزم بالحد الأقصى وتعليمات المنتج ولا تأخذ جرعات إضافية لتسريع توقف الإسهال.',
    sourceLabel: 'FDA / DailyMed · loperamide',
  ),
  'ondansetron-oral': MedicationPatientGuidancePatch(
    missedDoseAr:
        'إذا كان الدواء عند الحاجة فلا توجد جرعة منسية. إذا كان ضمن جدول ثابت للعلاج الكيماوي/بعد العملية، اتبع الجدول الموصوف ولا تضاعف جرعة متأخرة.',
    sourceLabel: 'FDA / DailyMed · ondansetron',
  ),
  'levonorgestrel-ec': MedicationPatientGuidancePatch(
    missedDoseAr:
        'هذه جرعة طارئة لمرة واحدة وليست علاجًا يوميًا؛ خذها بأسرع ما يمكن ضمن نافذة المنتج. إذا تقيأت خلال ساعتين من الجرعة فاتصل بصيدلي/طبيب لمعرفة هل تحتاج إعادة الجرعة.',
    sourceLabel: 'DailyMed OTC levonorgestrel emergency contraception · 2025-2026',
  ),
  'paracetamol-pediatric-liquid': MedicationPatientGuidancePatch(
    missedDoseAr:
        'إذا كان للحمى/الألم عند الحاجة فلا توجد جرعة منسية. لا تعوض بجرعتين، ولا تعط جرعة جديدة قبل اكتمال الفاصل المكتوب لنفس التركيز.',
    sourceLabel: 'DailyMed pediatric acetaminophen OTC labeling',
  ),
  'nitroglycerin-sublingual': MedicationPatientGuidancePatch(
    missedDoseAr:
        'هذا دواء إسعافي للذبحة وليس له جرعة يومية منسية. استخدمه عند ألم الصدر حسب خطة الطبيب، واطلب الإسعاف إذا استمر الألم وفق خطة الطوارئ.',
    sourceLabel: 'FDA / DailyMed · nitroglycerin sublingual',
  ),
  'naproxen': MedicationPatientGuidancePatch(
    missedDoseAr:
        'إذا كان عند الحاجة فلا توجد جرعة منسية. إذا كان مجدولًا فتجاوز الجرعة إذا اقترب موعد التالية ولا تضاعف ولا تجمع NSAID آخر.',
    sourceLabel: 'DailyMed / MedlinePlus · naproxen',
  ),
  'bisacodyl-tablets': MedicationPatientGuidancePatch(
    missedDoseAr:
        'إذا نسيت جرعة الإمساك فلا تضاعفها؛ خذ الجرعة التالية عند الحاجة حسب تعليمات المنتج. لا تستخدمه يوميًا لفترة طويلة من نفسك.',
    sourceLabel: 'DailyMed OTC · bisacodyl delayed-release',
  ),
  'senna': MedicationPatientGuidancePatch(
    missedDoseAr:
        'إذا نسيت جرعة فلا تضاعفها؛ استخدم الجرعة التالية عند الحاجة حسب المنتج لأن الهدف علاج الإمساك لا الحفاظ على مستوى دواء ثابت.',
    seekHelpAr:
        'لا تستمر بالعلاج الذاتي إذا ظهر ألم بطن شديد، قيء، انتفاخ واضح/عدم خروج غازات أو دم في البراز.',
    sourceLabel: 'DailyMed OTC · senna/sennosides',
  ),
  'hydrocortisone-topical': MedicationPatientGuidancePatch(
    missedDoseAr:
        'ضع طبقة رقيقة عند التذكر إذا لم يقترب موعد الدهان التالي. لا تضع طبقة مضاعفة أو كمية أكبر لتعويض ما فات.',
    sourceLabel: 'DailyMed topical hydrocortisone labeling',
  ),
  'famotidine': MedicationPatientGuidancePatch(
    missedDoseAr:
        'إذا كانت الجرعة مجدولة خذها عند التذكر إذا لم يقترب موعد التالية؛ وإلا تجاوزها ولا تضاعف. أما الاستخدام الوقائي قبل وجبة محفزة فاتبع توقيت نفس المنتج.',
    sourceLabel: 'DailyMed / MedlinePlus · famotidine',
  ),
  'celecoxib': MedicationPatientGuidancePatch(
    missedDoseAr:
        'إذا كانت الجرعة مجدولة خذها عند التذكر إذا لم يقترب موعد التالية، وإلا تجاوزها. لا تضاعف ولا تستخدم NSAID إضافيًا لتعويض الألم.',
    sourceLabel: 'FDA / DailyMed · celecoxib',
  ),
  'diclofenac-oral': MedicationPatientGuidancePatch(
    missedDoseAr:
        'إذا كان بوصفة مجدولة خذ الجرعة عند التذكر إذا لم يقترب موعد التالية، وإلا تجاوزها ولا تضاعف. انتبه أن IR وDR وER ليست نفس الجدول.',
    sourceLabel: 'FDA / DailyMed · diclofenac oral',
  ),
  'sildenafil-ed': MedicationPatientGuidancePatch(
    missedDoseAr:
        'عند استخدامه لضعف الانتصاب هو دواء عند الحاجة، لذلك لا توجد جرعة منسية. لا تأخذ جرعة إضافية لمجرد أن فرصة سابقة فاتتك.',
    sourceLabel: 'DailyMed · sildenafil for erectile dysfunction',
  ),

  'metformin': MedicationPatientGuidancePatch(
    seekHelpAr:
        'أوقف الدواء واطلب تقييمًا إذا مرضت بشدة مع جفاف/قيء مستمر أو ظهرت صعوبة تنفس، ضعف شديد أو نعاس غير معتاد، خصوصًا مع تدهور وظائف الكلى.',
    sourceLabel: 'DailyMed / MedlinePlus · metformin',
  ),
  'levetiracetam': MedicationPatientGuidancePatch(
    missedDoseAr:
        'خذ الجرعة عند التذكر إذا لم يقترب موعد التالية، ولا تضاعف. إذا فاتتك عدة جرعات أو حدثت نوبة تواصل مع الفريق المعالج لأن إيقاف علاج الصرع فجأة قد يسبب نوبات.',
    seekHelpAr:
        'اطلب مساعدة عاجلة عند أفكار إيذاء النفس، تغير سلوكي شديد وخطير، أو طفح شديد مع تورم/صعوبة تنفس.',
    sourceLabel: 'DailyMed Medication Guide · levetiracetam',
  ),
  'cetirizine': MedicationPatientGuidancePatch(
    importantAr:
        'تحقق من أدوية الزكام/الحساسية الأخرى حتى لا تكرر مضاد الهيستامين، وتجنب القيادة إذا سبب لك نعاسًا.',
    seekHelpAr:
        'إذا استمرت صعوبة التنفس أو تورم الوجه/اللسان رغم علاج الحساسية فهذه حالة طارئة وليست سببًا لأخذ جرعات إضافية.',
    sourceLabel: 'DailyMed / MedlinePlus · cetirizine',
  ),
  'glimepiride': MedicationPatientGuidancePatch(
    missedDoseAr:
        'لأن الجرعة مرتبطة بأول وجبة رئيسية، لا تعوض الجرعة بعد تجاوز الوجبة بجرعة إضافية على معدة فارغة. لا تضاعف؛ اتبع خطة السكري أو اسأل الصيدلي إذا لم تكن متأكدًا.',
    seekHelpAr:
        'اطلب مساعدة عاجلة عند هبوط سكر شديد مع فقدان وعي أو تشنج، واستخدم glucagon إذا كان موصوفًا وتعرفون طريقته.',
    sourceLabel: 'DailyMed / MedlinePlus · glimepiride',
  ),
  'insulin-glargine': MedicationPatientGuidancePatch(
    missedDoseAr:
        'لا تضاعف جرعة الإنسولين القاعدي ولا تحقن جرعتين متقاربتين لتعويض الجرعة المنسية. افحص السكر واتبع خطة الجرعة المنسية الخاصة بمنتجك/فريق السكري لأن التصرف يختلف حسب الوقت والتركيز.',
    seekHelpAr:
        'اطلب مساعدة عاجلة عند هبوط شديد مع فقدان وعي/تشنج أو عند ارتفاع شديد للسكر مع قيء أو كيتونات/تنفس غير طبيعي.',
    sourceLabel:
        'FDA prescribing information / IFU · exact insulin glargine product',
  ),
  'budesonide-formoterol': MedicationPatientGuidancePatch(
    missedDoseAr:
        'إذا كان البخاخ موصوفًا كصيانة ثابتة فلا تأخذ بخات إضافية لتعويض الجرعة إلا حسب خطة الطبيب. وإذا كان ضمن MART/SMART فاتبع خطة نفس المنتج والاستطباب.',
    seekHelpAr:
        'اطلب مساعدة عند ضيق نفس شديد لا يتحسن بخطة الإسعاف، أو إذا أصبح التنفس أسوأ مباشرة بعد البخة.',
    sourceLabel:
        'FDA / product IFU · exact budesonide-formoterol inhaler',
  ),
  'montelukast': MedicationPatientGuidancePatch(
    missedDoseAr:
        'إذا نسيت جرعة فتجاوزها وخذ الجرعة التالية في وقتها المعتاد. لا تأخذ جرعتين معًا.',
    sourceLabel: 'FDA Medication Guide / DailyMed · montelukast',
  ),
  'warfarin': MedicationPatientGuidancePatch(
    missedDoseAr:
        'إذا نسيت الجرعة في وقتها، خذها عندما تتذكر في نفس اليوم. إذا لم تتذكر إلا في اليوم التالي فلا تضاعف الجرعة؛ سجل الجرعة المنسية واتبع تعليمات متابعة INR.',
    sourceLabel: 'DailyMed · warfarin sodium · missed-dose labeling',
  ),
  'rivaroxaban': MedicationPatientGuidancePatch(
    missedDoseAr:
        'تعليمات الجرعة المنسية تعتمد على نظامك: 15 mg مرتين يوميًا أثناء علاج الجلطة له قاعدة مختلفة عن 10/15/20 mg مرة يوميًا و2.5 mg مرتين يوميًا. لا تستخدم قاعدة عامة؛ اتبع جرعتك المكتوبة أو اتصل بالصيدلي.',
    sourceLabel: 'DailyMed · rivaroxaban · regimen-specific missed dose',
  ),
  'methotrexate-rheumatology': MedicationPatientGuidancePatch(
    missedDoseAr:
        'لا تعوض الجرعة الأسبوعية بجرعات يومية ولا تأخذ جرعتين معًا. إذا فات يوم methotrexate الأسبوعي تواصل مع الصيدلي/الفريق المعالج لتحديد متى تؤخذ الجرعة التالية.',
    sourceLabel:
        'FDA / DailyMed methotrexate · weekly low-dose safety counseling',
  ),
  'dupilumab': MedicationPatientGuidancePatch(
    missedDoseAr:
        'إذا كانت الجرعة أسبوعية: أعطها عند التذكر وابدأ جدولًا أسبوعيًا جديدًا من ذلك التاريخ. إذا كانت كل أسبوعين أو كل 4 أسابيع: إذا تذكرت خلال 7 أيام أعط الجرعة ثم عد للجدول الأصلي؛ إذا مر أكثر من 7 أيام أعطها وابدأ جدولًا جديدًا من ذلك التاريخ.',
    seekHelpAr:
        'اطلب تقييمًا عند تحسس شديد، تورم/صعوبة تنفس، أو ألم/احمرار شديد بالعين أو تغير في الرؤية.',
    sourceLabel: 'DailyMed DUPIXENT · 2026 missed-dose labeling',
  ),
  'tamsulosin': MedicationPatientGuidancePatch(
    missedDoseAr:
        'إذا نسيت جرعة فتجاوزها إذا اقترب موعد التالية ولا تضاعف. إذا انقطعت عن tamsulosin عدة أيام، اتصل بالطبيب/الصيدلي قبل الرجوع للجرعة لأن الدوخة وهبوط الضغط قد يعودان عند إعادة البدء.',
    sourceLabel: 'DailyMed / MedlinePlus · tamsulosin',
  ),
  'lactulose': MedicationPatientGuidancePatch(
    importantAr:
        'هدف العلاج يختلف: في الإمساك نبحث عن تحسن منتظم، أما في الاعتلال الدماغي الكبدي فقد يحدد الطبيب عدد مرات براز مستهدفة. لا تنقل هدف حالة إلى أخرى.',
    seekHelpAr:
        'تواصل مع الطبيب عند إسهال شديد أو مستمر، دوخة/جفاف، تشنجات عضلية أو تشوش لأن فقد السوائل والإلكتروليتات قد يصبح مهمًا.',
    sourceLabel: 'DailyMed / MedlinePlus · lactulose',
  ),
  'latanoprost': MedicationPatientGuidancePatch(
    missedDoseAr:
        'إذا نسيت الجرعة فتجاوزها واستمر بالجرعة التالية في وقتها الطبيعي. لا تستخدم جرعتين ولا تزيدها عن مرة يوميًا.',
    seekHelpAr:
        'اطلب نصيحة طبيب العين عند إصابة/عدوى بالعين أو ألم واحمرار شديد أو تغير مهم في الرؤية.',
    sourceLabel: 'DailyMed · latanoprost ophthalmic',
  ),
  'semaglutide-injection': MedicationPatientGuidancePatch(
    missedDoseAr:
        'لا تطبق قاعدة واحدة على كل semaglutide: في OZEMPIC يمكن إعطاء الجرعة خلال 5 أيام من الجرعة الفائتة، بينما WEGOVY injection تستخدم قاعدة 48 ساعة بالنسبة للجرعة التالية وقد تحتاج إعادة تصعيد بعد عدة جرعات فائتة. تحقق من اسم منتجك قبل التصرف.',
    sourceLabel: 'DailyMed · OZEMPIC and WEGOVY current labeling',
  ),
  'spironolactone': MedicationPatientGuidancePatch(
    seekHelpAr:
        'اطلب تقييمًا عند ضعف شديد، خفقان/اضطراب نبض، إغماء أو قلة بول واضحة لأنها قد ترافق اضطراب البوتاسيوم أو وظائف الكلى.',
    sourceLabel: 'DailyMed / MedlinePlus · spironolactone',
  ),
  'gabapentin': MedicationPatientGuidancePatch(
    seekHelpAr:
        'اطلب مساعدة عند نعاس شديد جدًا أو بطء/صعوبة تنفس خصوصًا مع opioids أو المهدئات، أو عند أفكار إيذاء النفس.',
    sourceLabel: 'FDA / DailyMed · gabapentin',
  ),
  'doxycycline': MedicationPatientGuidancePatch(
    seekHelpAr:
        'راجع الطبيب عند ألم/صعوبة واضحة في البلع أو ألم خلف الصدر، أو صداع شديد جديد مع تشوش/تغير الرؤية.',
    sourceLabel: 'DailyMed / MedlinePlus · doxycycline',
  ),
  'hydrochlorothiazide': MedicationPatientGuidancePatch(
    seekHelpAr:
        'اطلب تقييمًا عند دوخة/إغماء شديد، تشوش أو ضعف شديد مع جفاف، أو ألم مفاجئ بالعين مع تشوش الرؤية.',
    sourceLabel: 'DailyMed / MedlinePlus · hydrochlorothiazide',
  ),
  'tiotropium-capsule-inhalation': MedicationPatientGuidancePatch(
    missedDoseAr:
        'إذا نسيت الجرعة فلا تستخدم جرعتين لتعويضها ولا تكرر الكبسولة أكثر من الموصوف خلال اليوم. عد إلى جدولك واتبع IFU الخاص بالجهاز.',
    seekHelpAr:
        'اطلب تقييمًا عند ألم بالعين مع هالات/تشوش رؤية، عدم القدرة على التبول، أو إذا أصبح التنفس أسوأ مباشرة بعد الاستنشاق.',
    sourceLabel: 'FDA HandiHaler prescribing information / IFU',
  ),
  'acyclovir-oral': MedicationPatientGuidancePatch(
    seekHelpAr:
        'اطلب تقييمًا عند قلة بول واضحة، ارتباك/رجفة شديدة أو نعاس غير معتاد، خصوصًا إذا كان لديك ضعف كلوي أو جفاف.',
    sourceLabel: 'DailyMed / MedlinePlus · acyclovir',
  ),
  'metronidazole-oral': MedicationPatientGuidancePatch(
    seekHelpAr:
        'راجع الطبيب عند تنميل/حرق مستمر بالأطراف، تشنج، ارتباك شديد، أو طفح شديد مع تقرحات/تورم.',
    sourceLabel: 'FDA / DailyMed · metronidazole',
  ),
  'combined-oral-contraceptive': MedicationPatientGuidancePatch(
    missedDoseAr:
        'لا تستخدم قاعدة واحدة لكل الحبوب المنسية. إذا تأخرت/نسيت حبة فعالة، اتبع مخطط missed pills الخاص بالعبوة/إرشادات منع الحمل؛ القاعدة تختلف إذا كانت حبة واحدة مقابل حبتين أو أكثر ومكانها في الشريط، وقد تحتاج وسيلة حاجزية أو emergency contraception.',
    sourceLabel: 'CDC U.S. Selected Practice Recommendations 2024',
  ),
  'norethindrone-pop': MedicationPatientGuidancePatch(
    missedDoseAr:
        'في norethindrone POP تُعد الحبة فائتة إذا تأخرت أكثر من 3 ساعات: خذ حبة فورًا واستمر يوميًا في نفس الوقت، واستخدم وسيلة حاجزية/امتنع عن الجماع حتى أخذ الحبوب في وقتها لمدة يومين متتاليين؛ قد يلزم تقييم emergency contraception حسب ما حدث.',
    seekHelpAr:
        'إذا حدث اختبار حمل إيجابي مع ألم شديد في أسفل البطن أو نزف غير معتاد فاطلب تقييمًا سريعًا لاستبعاد الحمل خارج الرحم.',
    sourceLabel: 'CDC U.S. Selected Practice Recommendations 2024',
  ),
  'finasteride': MedicationPatientGuidancePatch(
    seekHelpAr:
        'راجع الطبيب إذا ظهرت كتلة أو ألم مستمر بالثدي أو إفرازات من الحلمة، أو تغيرات مزاجية شديدة.',
    sourceLabel: 'FDA / DailyMed · finasteride',
  ),
  'timolol-ophthalmic': MedicationPatientGuidancePatch(
    seekHelpAr:
        'اطلب تقييمًا عند صفير/ضيق نفس، إغماء أو بطء شديد بالنبض مع أعراض؛ قطرات العين قد تُمتص وتؤثر على القلب والرئة.',
    sourceLabel: 'FDA / DailyMed · timolol ophthalmic',
  ),
  'ciprofloxacin-otic': MedicationPatientGuidancePatch(
    seekHelpAr:
        'راجع الطبيب عند طفح/تورم أو تحسس شديد، أو إذا ازداد الألم/الإفراز أو لم يبدأ التحسن حسب المدة المتوقعة.',
    sourceLabel: 'DailyMed · ciprofloxacin otic',
  ),
  'sucralfate': MedicationPatientGuidancePatch(
    seekHelpAr:
        'راجع الطبيب عند قيء دموي، براز أسود، ألم شديد مستمر أو صعوبة بلع بدل الاكتفاء بمواصلة دواء القرحة.',
    sourceLabel: 'DailyMed · sucralfate',
  ),
  'pancrelipase': MedicationPatientGuidancePatch(
    seekHelpAr:
        'راجع الطبيب عند ألم بطن شديد أو انتفاخ/إمساك شديد مستمر، أو تهيج واضح بالفم بسبب بقاء الحبيبات.',
    sourceLabel: 'FDA / DailyMed · pancrelipase product labeling',
  ),
  'loratadine': MedicationPatientGuidancePatch(
    seekHelpAr:
        'إذا استمرت صعوبة التنفس أو تورم الوجه/اللسان رغم علاج الحساسية فاطلب إسعافًا ولا تعتمد على جرعات إضافية من مضاد الهيستامين.',
    sourceLabel: 'DailyMed / MedlinePlus · loratadine',
  ),
  'escitalopram': MedicationPatientGuidancePatch(
    importantAr:
        'الفائدة تظهر تدريجيًا خلال أسابيع. لا توقف العلاج فجأة بعد الاستخدام المنتظم؛ اطلب خطة تخفيف إذا تقرر الإيقاف.',
    sourceLabel: 'FDA Medication Guide / DailyMed · escitalopram',
  ),
  'insulin-lispro': MedicationPatientGuidancePatch(
    missedDoseAr:
        'لأنه إنسولين وجبات، لا تعوض الجرعة بعد تأخر/تجاوز الوجبة بجرعة كاملة عشوائيًا ولا تكدس جرعتين. افحص السكر واتبع correction/missed-meal plan الخاص بك أو اتصل بفريق السكري.',
    sourceLabel: 'FDA product IFU · insulin lispro',
  ),
  'prednisone': MedicationPatientGuidancePatch(
    missedDoseAr:
        'التصرف يعتمد على جرعتك ومدتها وجدول التخفيف. لا تضاعف جرعة أو تغيّر taper من نفسك؛ إذا كان العلاج طويلًا/جرعات متعددة فاتصل بالصيدلي عند الجرعة المنسية.',
    sourceLabel: 'DailyMed / MedlinePlus · prednisone',
  ),
  'ipratropium-hfa': MedicationPatientGuidancePatch(
    missedDoseAr:
        'إذا كان البخاخ مجدولًا فاتبع الجرعة التالية حسب الخطة ولا تستخدم بخات إضافية لتعويض المنسية؛ إذا كان عند الحاجة فلا توجد جرعة منسية.',
    sourceLabel: 'FDA Atrovent HFA IFU',
  ),
  'colchicine': MedicationPatientGuidancePatch(
    missedDoseAr:
        'التصرف يختلف بين علاج النوبة والوقاية. لا تعوض الجرعة بجرعات إضافية لأن هامش الأمان محدود؛ اتبع نظامك المكتوب أو اتصل بالصيدلي.',
    sourceLabel: 'DailyMed · colchicine',
  ),
  'dabigatran': MedicationPatientGuidancePatch(
    missedDoseAr:
        'خذ الجرعة المنسية عند التذكر إذا كان موعد الجرعة التالية بعد أكثر من 6 ساعات. إذا بقي أقل من 6 ساعات فتجاوز الجرعة المنسية. لا تضاعف الجرعة.',
    sourceLabel: 'FDA / DailyMed · dabigatran',
  ),
  'enoxaparin': MedicationPatientGuidancePatch(
    missedDoseAr:
        'لا تحقن جرعتين معًا لتعويض جرعة منسية. إذا تذكرت متأخرًا أو كان موعد التالية قريبًا فاتصل بالطبيب/الصيدلي لأن التصرف يعتمد على سبب استخدام المميع ونظام الجرعات.',
    sourceLabel: 'FDA / DailyMed · enoxaparin',
  ),
  'adalimumab': MedicationPatientGuidancePatch(
    missedDoseAr:
        'إذا فاتت الحقنة فاتبع تعليمات نفس منتج adalimumab وجدولك (بما فيه loading إن وجد). لا تضاعف حقنتين أو تغيّر يوم الجدول دون خطة من الفريق المعالج.',
    sourceLabel: 'FDA prescribing information / exact adalimumab IFU',
  ),
};

String _pick(String original, String fallback) {
  return original.trim().isNotEmpty ? original : fallback.trim();
}

PatientCounselingData resolvedPatientCounseling(
  Medication medication, {
  String timingFallbackAr = '',
}) {
  final base = medication.patient;
  final patch = medicationPatientGuidancePatches[medication.id];

  var missedDose = base.missedDoseAr.trim();
  if (missedDose.isEmpty) {
    missedDose = patch?.missedDoseAr.trim() ?? '';
  }
  if (missedDose.isEmpty && _genericMissedDoseIds.contains(medication.id)) {
    missedDose = _genericMissedDoseAr;
  }

  var teachBack = base.teachBackAr.trim();
  if (teachBack.isEmpty) {
    teachBack = patch?.teachBackAr.trim() ?? '';
  }
  if (teachBack.isEmpty) {
    if (missedDose.isNotEmpty) {
      teachBack =
          'قل لي متى وكيف ستستخدم هذا الدواء، وماذا ستفعل إذا نسيت الجرعة.';
    } else {
      teachBack =
          'اشرح لي بطريقتك كيف ستستخدم هذا الدواء وما أهم تنبيه ستتذكره.';
    }
  }

  return PatientCounselingData(
    purposeAr: base.purposeAr,
    howToUseAr: base.howToUseAr,
    timingAr: _pick(base.timingAr, timingFallbackAr),
    importantAr: _pick(base.importantAr, patch?.importantAr ?? ''),
    commonActionableAr: base.commonActionableAr,
    missedDoseAr: missedDose,
    storageAr: _pick(base.storageAr, patch?.storageAr ?? ''),
    seekHelpAr: _pick(base.seekHelpAr, patch?.seekHelpAr ?? ''),
    teachBackAr: teachBack,
  );
}
