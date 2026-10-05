import '../models/medication.dart';

const expandedMedications40 = <Medication>[
  Medication(
    id: 'morphine-sulfate-er-tablets',
    familyId: 'cns',
    name: 'Morphine Sulfate Extended-Release Tablets',
    subtitle: 'Severe persistent pain · oral morphine same-daily-dose redistribution · cross-opioid conversion locked',
    tags: ['Pain', 'Morphine', 'Opioid', 'Extended release', 'Controlled substance', 'High alert'],
    aliases: ['Morphine ER', 'Morphine sulfate ER', 'MS Contin-type ER tablets'],
    sourceLabel:
        'DailyMed · Morphine sulfate extended-release tablets · updated Aug 27, 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Extended-release oral morphine for severe and persistent pain requiring an opioid when alternative options are inadequate. It is not a PRN analgesic.',
      foodTiming:
          'No routine meal anchor is required by the reviewed label. Take on the prescribed every-8-hour or every-12-hour ER schedule.',
      duration:
          'Individualized opioid therapy only while benefits outweigh risks; reassess pain, function, adverse effects and continued need regularly. Do not abruptly stop after physical dependence develops.',
      formulationHandling:
          'Swallow tablets intact. Do not cut, break, chew, crush or dissolve because uncontrolled release can cause a potentially fatal morphine overdose.',
      releaseConversion:
          'SAME-SUBSTANCE ORAL MORPHINE: use the same total 24-hour oral morphine requirement, redistributed as one-half every 12 hours or one-third every 8 hours. Example: oral morphine IR total 60 mg/day → morphine ER 30 mg every 12 hours OR 20 mg every 8 hours when an appropriate strength/regimen is prescribed. CROSS-OPIOID: no labeled clinical-trial conversion ratio is established from other opioids to morphine ER; do not auto-convert or build a general equianalgesic calculator. The reviewed label starts morphine ER 15 mg every 8 to 12 hours when converting from other opioids, with conservative reassessment rather than a fixed ratio.',
      monitoring:
          'Pain/function, sedation, respiratory rate, constipation, blood pressure, overdose/misuse risk, adherence and need for an opioid-reversal agent. Reassess closely after conversion or dose increases.',
      interactions:
          'Benzodiazepines, alcohol, gabapentinoids, other opioids and other CNS depressants can cause profound sedation and respiratory depression. MAO inhibitors are contraindicated during use and within the label-defined 14-day window.',
      commonMistakes:
          'Using an equianalgesic table as an automatic cross-opioid conversion, carrying the old IR frequency forward without recalculating the ER schedule, crushing ER tablets, or using high ER doses in a patient without established opioid tolerance.',
      specialPopulations:
          'The 100 mg and 200 mg tablets, any single ER dose greater than 60 mg, or a total ER dose greater than 120 mg/day are only for patients with established tolerance to an opioid of comparable potency. Patients who are not opioid tolerant require the separate low-dose starting regimen and close monitoring.',
    ),
    sections: [
      MedicationSection(
        title: 'Oral morphine → ER conversion',
        body:
            'Within the same drug, keep the 24-hour oral morphine total and redistribute it: 1/2 q12h or 1/3 q8h. Example: 60 mg/day oral morphine → 30 mg q12h or 20 mg q8h when clinically appropriate.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Cross-opioid conversion lock',
        body:
            'No clinical-trial-defined conversion ratio exists from other opioids to morphine ER. Do not auto-convert and do not use the same-substance morphine rule for oxycodone, hydromorphone, fentanyl, methadone or another opioid.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Opioid-tolerance lock',
        body:
            '100/200 mg tablets, a single dose >60 mg, or total ER dose >120 mg/day require established tolerance to an opioid of comparable potency.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'مورفين ممتد المفعول للألم الشديد والمستمر عندما يحتاج المريض opioid منتظم، وليس مسكنًا يؤخذ عند اللزوم.',
      howToUseAr:
          'ابتلع حبة ER كاملة. لا تقطعها أو تكسرها أو تمضغها أو تسحقها أو تذيبها لأن إطلاق الجرعة بسرعة قد يسبب overdose خطيرًا.',
      timingAr:
          'خذه حسب الجدول المكتوب كل 8 أو 12 ساعة. لا تغيّر عدد المرات أو الجرعة من نفسك.',
      importantAr:
          'إذا كان التحويل من morphine فموي عادي، يحسب الطبيب مجموع جرعة 24 ساعة ثم يقسمها لجدول ER. هذه القاعدة لا تصلح للتحويل من opioid آخر. تجنب الكحول وأي مهدئات غير موصوفة، واحفظ الدواء في مكان آمن بعيدًا عن الأطفال والآخرين.',
      commonActionableAr:
          'الإمساك والغثيان والنعاس شائعة؛ اسأل عن خطة منع الإمساك، ولا تقد السيارة حتى تعرف تأثير الدواء عليك.',
      missedDoseAr:
          'إذا فاتت جرعة، خذ الجرعة التالية في وقتها المعتاد. لا تضاعف ولا تضف جرعة إضافية.',
      storageAr:
          'احفظه في مكان آمن ومغلق بعيدًا عن الأطفال والزوار، ولا تشارك الدواء مع أي شخص.',
      seekHelpAr:
          'اتصل بالإسعاف عند بطء أو صعوبة التنفس، ازرقاق، أو نعاس شديد لا يمكن إيقاظ المريض منه.',
      teachBackAr:
          'إذا كنت تستخدم morphine عاديًا، من الذي يحدد تقسيم مجموع جرعة 24 ساعة عند التحويل؟ وهل يجوز تطبيق نفس القاعدة على opioid آخر أو سحق حبة ER؟',
    ),
  ),
];
