import '../domain/patient_card_data.dart';

const patientCardTemplates = <PatientCardData>[
  PatientCardData(
    id: 'inhaler-basic',
    templateName: 'Inhaler Card',
    medicationName: 'Your inhaler',
    subtitle: 'Technique reminder',
    category: 'Device',
    instructionsAr:
        'استخدم البخاخ بالطريقة التي شرحها لك الصيدلي. اتبع خطوات الجهاز المحددة، ولا تغيّر عدد البخات أو مواعيدها إلا حسب الوصفة. إذا كان جهازك يحتاج مضمضة بعد الاستخدام فستظهر هذه المعلومة في بطاقة الدواء الخاصة بك.',
  ),
  PatientCardData(
    id: 'antibiotic-course',
    templateName: 'Antibiotic Course Card',
    medicationName: 'Your antibiotic',
    subtitle: 'Course reminder',
    category: 'Medication',
    instructionsAr:
        'خذ الدواء حسب الجرعة والمواعيد المكتوبة لك. لا تضاعف الجرعة إذا نسيت جرعة إلا إذا كانت تعليمات دوائك تقول غير ذلك. تواصل مع الصيدلي أو الطبيب إذا ظهرت مشكلة تمنعك من إكمال العلاج.',
  ),
  PatientCardData(
    id: 'tablet-capsule',
    templateName: 'Tablet / Capsule Card',
    medicationName: 'Your medicine',
    subtitle: 'Simple medicine instructions',
    category: 'Medication',
    instructionsAr:
        'استخدم الدواء حسب الجرعة والوقت المكتوبين لك. لا تسحق أو تفتح الحبة إلا إذا كانت بطاقة الدواء تسمح بذلك. احتفظ بالدواء بالطريقة الموضحة في التعليمات الخاصة به.',
  ),
];
