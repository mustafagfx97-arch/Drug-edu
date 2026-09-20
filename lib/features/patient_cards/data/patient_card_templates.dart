import '../domain/patient_card_data.dart';

const patientCardTemplates = <PatientCardData>[
  PatientCardData(
    id: 'inhaler-basic',
    templateName: 'Inhaler Card',
    medicationName: 'Inhaler',
    subtitleAr: 'تذكير سريع بطريقة الاستخدام',
    category: 'Device',
    howToUseAr:
        'استخدم البخاخ بالطريقة التي شرحها لك الصيدلي، واتبع خطوات جهازك لأن طريقة التحضير تختلف بين الأنواع.',
    importantAr:
        'لا تغيّر عدد البخات من نفسك. إذا كان البخاخ يحتوي على كورتيزون فتمضمض بعد الاستخدام إذا كانت تعليمات دوائك تطلب ذلك.',
    seekHelpAr:
        'اطلب المساعدة إذا أصبح التنفس أسوأ أو لم تتحسن الأعراض رغم استخدام بخاخ الإسعاف كما وُصف لك.',
  ),
  PatientCardData(
    id: 'antibiotic-course',
    templateName: 'Antibiotic Course Card',
    medicationName: 'Antibiotic',
    subtitleAr: 'تعليمات مختصرة للعلاج',
    category: 'Medication',
    howToUseAr:
        'خذ الجرعة المكتوبة لك وفي المواعيد المحددة.',
    importantAr:
        'أكمل مدة العلاج كما وُصفت لك، ولا توقفه من نفسك لمجرد أنك شعرت بتحسن.',
    missedDoseAr:
        'خذ الجرعة عندما تتذكر إذا لم يقترب موعد الجرعة التالية. لا تضاعف الجرعة.',
    seekHelpAr:
        'اطلب مساعدة عاجلة إذا ظهر تورم في الوجه أو صعوبة في التنفس أو طفح شديد.',
  ),
  PatientCardData(
    id: 'tablet-capsule',
    templateName: 'Tablet / Capsule Card',
    medicationName: 'Medicine',
    subtitleAr: 'تعليمات استخدام مختصرة',
    category: 'Medication',
    howToUseAr:
        'خذ الدواء بالجرعة والطريقة المكتوبة لك.',
    timingAr:
        'استخدمه في الوقت المحدد، ومع الطعام أو بدونه حسب تعليمات هذا الدواء.',
    importantAr:
        'لا تسحق الحبة ولا تفتح الكبسولة إلا إذا كانت تعليمات الدواء تسمح بذلك.',
  ),
];
