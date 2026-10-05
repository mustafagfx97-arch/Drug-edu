import '../models/medication.dart';

const expandedMedications37 = <Medication>[
  Medication(
    id: 'tramadol-er-tablets',
    familyId: 'pain',
    name: 'Tramadol Extended-Release Tablets',
    subtitle: 'ER opioid · once daily · IR total rounded down to lower 100 mg',
    tags: ['Tramadol', 'Extended release', 'Opioid', 'Chronic pain', 'Controlled substance'],
    aliases: ['Tramadol ER', 'Tramadol XR'],
    sourceLabel:
        'DailyMed · Tramadol hydrochloride extended-release tablets · updated Jun 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily extended-release tramadol for severe and persistent pain that requires an opioid and cannot be adequately treated with alternatives; not for as-needed use.',
      foodTiming:
          'Take once daily at approximately the same time each day. Use the exact product instructions consistently.',
      duration:
          'Use the lowest effective dose for the shortest duration consistent with treatment goals; periodically reassess the ongoing need for opioid therapy.',
      formulationHandling:
          'Swallow ER tablets whole with liquid. Do not cut, break, chew, crush or dissolve because uncontrolled release can cause fatal overdose.',
      releaseConversion:
          'For patients currently taking tramadol immediate-release products, calculate the total tramadol dose taken over 24 hours and start tramadol ER once daily at the next lower 100-mg increment. Example: IR 250 mg/day → ER 200 mg once daily; IR 300 mg/day → ER 300 mg once daily. Because ER strengths are limited, some patients on IR cannot be converted appropriately. Do not exceed 300 mg/day, and do not use other tramadol products concurrently.',
      monitoring:
          'Pain relief, sedation, respiratory depression, constipation, misuse/addiction risk, serotonin toxicity, seizures and withdrawal symptoms after conversion or dose changes.',
      interactions:
          'Benzodiazepines, alcohol, gabapentinoids and other CNS depressants increase respiratory/sedation risk. Serotonergic drugs increase serotonin-syndrome risk. CYP2D6/CYP3A4 interactions can alter tramadol/M1 exposure; carbamazepine can reduce effect and concomitant use is not recommended in current labeling.',
      commonMistakes:
          'Using ER as-needed, keeping IR tramadol alongside ER without an explicit plan, rounding the IR total upward instead of downward, crushing ER or stopping abruptly after regular use.',
      specialPopulations:
          'Seizure history, respiratory disease, substance-use risk, older age, renal/hepatic impairment, pregnancy and breastfeeding require individualized review.',
    ),
    sections: [
      MedicationSection(
        title: 'IR → ER conversion',
        body:
            'Add the full 24-hour IR tramadol dose, then round DOWN to the next lower 100-mg ER dose once daily. Example: 250 mg/day IR → 200 mg ER once daily. Maximum ER dose is 300 mg/day. Some IR regimens cannot be converted safely because the ER strengths are not flexible enough.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'ER overdose-prevention lock',
        body:
            'Swallow whole. Cutting, crushing, chewing or dissolving ER can release a potentially fatal dose. Do not combine with other tramadol products unless the prescriber has explicitly directed the regimen.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'Tramadol ER مسكن ممتد للآلام الشديدة والمستمرة التي تحتاج opioid ولا تكفي معها الخيارات الأخرى؛ ليس دواءً عند اللزوم.',
      howToUseAr:
          'خذ ER مرة واحدة يوميًا في وقت ثابت تقريبًا وابتلع الحبة كاملة مع سائل. لا تكسرها أو تسحقها أو تمضغها أو تذيبها.',
      timingAr:
          'مرة واحدة يوميًا، وليس PRN.',
      importantAr:
          'عند التحويل من tramadol العادي نجمع كل ما أخذته خلال 24 ساعة ثم نقرّب الجرعة نزولًا لأقرب 100 mg: مثال 250 mg/day من العادي → 200 mg ER مرة يوميًا. الحد الأقصى للـER هو 300 mg/day، ولا تجمع معه tramadol آخر من نفسك.',
      commonActionableAr:
          'قد يسبب غثيانًا أو إمساكًا أو دوخة أو نعاسًا. تجنب الكحول ولا تقد السيارة حتى تعرف تأثيره عليك.',
      missedDoseAr:
          'لا تضاعف الجرعة ولا تأخذ جرعتين متقاربتين. ارجع إلى الجرعة اليومية التالية حسب خطة الوصفة.',
      seekHelpAr:
          'اطلب إسعافًا عند بطء أو صعوبة التنفس، صعوبة شديدة في الاستيقاظ، تشنج، أو أعراض serotonin syndrome مثل حرارة مع هيجان/رجفة/تصلب شديد.',
      teachBackAr:
          'إذا كان مجموع tramadol العادي 250 mg خلال اليوم، إلى كم mg من ER يبدأ التحويل؟ وهل يجوز سحق ER أو أخذها عند اللزوم؟',
    ),
  ),
];
