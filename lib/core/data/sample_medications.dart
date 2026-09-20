import '../models/medication.dart';

const sampleMedications = <Medication>[
  Medication(
    name: 'Caffeine Citrate',
    subtitle: 'Neonatal respiratory stimulant',
    tags: ['NICU', 'IV', 'High-alert units'],
    hasIvPreparation: true,
    hasCalculator: true,
    sections: [
      MedicationSection(
        title: 'Clinical pharmacist notes',
        body:
            'Structured medication content will live here after source verification. The production database will separate formulation, preparation authority, source version, and safety locks.',
      ),
      MedicationSection(
        title: 'Preparation profile',
        body:
            'IV preparation is shown in the dedicated IV Preparation module to keep counseling pages concise.',
        priority: ClinicalPriority.reference,
      ),
    ],
    patientCounselingAr:
        'هذا القسم مخصص فقط للكلام الذي يحتاج المريض أو ولي الأمر إلى معرفته، ويظهر بالعربية وباتجاه كتابة من اليمين إلى اليسار.',
  ),
  Medication(
    name: 'Vancomycin',
    subtitle: 'Antibacterial',
    tags: ['Antimicrobial', 'IV', 'Monitoring'],
    hasIvPreparation: true,
    hasCalculator: true,
    sections: [
      MedicationSection(
        title: 'Clinical pharmacist notes',
        body:
            'Professional notes, monitoring, administration constraints, and formulation-specific details appear here without overloading the patient-facing section.',
      ),
    ],
    patientCounselingAr:
        'شرح المريض يبقى مختصرًا وعمليًا: لماذا يستخدم الدواء، ما الذي يجب مراقبته، ومتى يجب طلب المساعدة.',
  ),
  Medication(
    name: 'Apixaban',
    subtitle: 'Oral anticoagulant',
    tags: ['Counseling', 'Bleeding risk', 'Oral'],
    sections: [
      MedicationSection(
        title: 'Clinical pharmacist notes',
        body:
            'This sample demonstrates a non-IV counseling record. Production content will be evidence-checked and patient-specific.',
      ),
    ],
    patientCounselingAr:
        'يُعرض للمريض فقط ما يغير طريقة استخدامه للدواء أو ما يجب أن ينتبه له، من دون سرد طويل لكل الأعراض الجانبية.',
  ),
];
