import '../models/medication.dart';

const expandedMedications39 = <Medication>[
  Medication(
    id: 'tapentadol-nucynta-er',
    familyId: 'cns',
    name: 'Tapentadol Extended-Release (NUCYNTA ER)',
    subtitle: 'Long-term severe pain · IR total daily dose split into two ER doses',
    tags: ['Pain', 'Tapentadol', 'NUCYNTA ER', 'Opioid', 'Extended release'],
    aliases: ['NUCYNTA ER', 'Tapentadol ER'],
    sourceLabel:
        'DailyMed · NUCYNTA ER tapentadol extended-release tablets · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Extended-release tapentadol for pain severe enough to require daily, around-the-clock, long-term opioid treatment when alternatives are inadequate.',
      foodTiming:
          'Take approximately every 12 hours according to the prescription; may be taken with or without food.',
      duration:
          'Individualized long-term opioid therapy only while benefits outweigh risks; reassess pain, function and safety regularly.',
      formulationHandling:
          'Swallow ER tablets whole, one tablet at a time, with enough water for complete swallowing. Do not split, break, chew, crush or dissolve because rapid release can cause a potentially fatal dose.',
      releaseConversion:
          'Tapentadol IR → NUCYNTA ER: calculate the equivalent total daily tapentadol IR dose and divide it into two equal ER doses separated by approximately 12 hours. Example: tapentadol IR 50 mg four times daily = 200 mg/day → NUCYNTA ER 100 mg every 12 hours. Conversion may increase the risk of excessive sedation and respiratory depression. Safety lock: although labeled tapentadol IR may reach 600 mg/day, NUCYNTA ER must not exceed 500 mg/day; if the prior IR total is above 500 mg/day, do not carry the same total forward automatically. Discontinue other tapentadol and tramadol products when starting and while taking NUCYNTA ER. For opioid-naive or opioid-non-tolerant patients, the reviewed label starts NUCYNTA ER at 50 mg every 12 hours; higher starting doses can cause fatal respiratory depression. Other opioids → NUCYNTA ER: there is no established clinical-trial conversion ratio; do not invent an equianalgesic automatic switch.',
      monitoring:
          'Pain/function, sedation, respiratory rate, constipation, misuse risk, blood pressure, renal/hepatic function and concurrent CNS depressants.',
      interactions:
          'Alcohol, benzodiazepines and other CNS depressants increase overdose risk. MAO inhibitors are contraindicated within the labeled interval; review serotonergic medicines.',
      commonMistakes:
          'Keeping other tapentadol/tramadol products after starting ER, carrying an IR total above the 500-mg/day ER maximum into ER, dividing the daily dose incorrectly, crushing ER or applying an opioid-equivalence table as an automatic conversion from another opioid.',
      specialPopulations:
          'Moderate hepatic impairment: the reviewed label starts 50 mg no more frequently than every 24 hours and limits total daily dose to 100 mg/day. Severe hepatic impairment is not recommended. Severe renal impairment is not recommended. Opioid-naive/non-tolerant patients should not start above 50 mg every 12 hours.',
    ),
    sections: [
      MedicationSection(
        title: 'Tapentadol IR → ER conversion',
        body:
            'Use the same total daily tapentadol amount, divided into two equal NUCYNTA ER doses about 12 hours apart. Example: IR 50 mg QID = 200 mg/day → ER 100 mg q12h.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'ER maximum / opioid-tolerance lock',
        body:
            'NUCYNTA ER maximum is 500 mg/day even though IR labeling may allow up to 600 mg/day. Do not carry an IR total above 500 mg/day directly into ER. Opioid-naive/non-tolerant patients start at 50 mg q12h in the reviewed label.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Other opioid conversion lock',
        body:
            'No established clinical-trial conversion ratio exists from other opioids to NUCYNTA ER. Do not auto-convert using a generic opioid-equivalence ratio.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'صيغة ممتدة من tapentadol للألم الشديد الذي يحتاج علاج opioid مستمر طويل المفعول.',
      howToUseAr:
          'خذ ER تقريبًا كل 12 ساعة حسب الوصفة وابتلع الحبة كاملة مع ماء كافٍ. لا تكسرها أو تقسمها أو تسحقها أو تمضغها.',
      timingAr:
          'عادةً جرعتان متساويتان يفصل بينهما نحو 12 ساعة.',
      importantAr:
          'عند التحويل من tapentadol العادي نجمع جرعة 24 ساعة ثم نقسمها إلى جرعتين ER متساويتين: 50 mg أربع مرات = 200 mg/day → 100 mg ER كل 12 ساعة. لكن الحد الأقصى لـNUCYNTA ER هو 500 mg/day؛ إذا كان مجموع IR أعلى فلا تحمله تلقائيًا إلى ER. لا تطبق هذه القاعدة على opioid آخر، ولا تستمر على tapentadol/tramadol آخر من نفسك بعد بدء ER.',
      commonActionableAr:
          'قد يسبب نعاسًا أو دوخة أو غثيانًا أو إمساكًا؛ تجنب الكحول والمهدئات غير الموصوفة.',
      missedDoseAr:
          'لا تضاعف ER ولا تضف جرعات IR من نفسك لتعويض جرعة فائتة.',
      seekHelpAr:
          'اطلب إسعافًا عند بطء/صعوبة التنفس أو نعاس شديد لا يمكن إيقاظك منه.',
      teachBackAr:
          'إذا كان tapentadol العادي 50 mg أربع مرات يوميًا، ما جرعة ER حسب قاعدة التحويل؟ وهل تطبق القاعدة نفسها على morphine أو opioid آخر؟',
    ),
  ),
  Medication(
    id: 'morphine-sulfate-er-tablets',
    familyId: 'cns',
    name: 'Morphine Sulfate Extended-Release Tablets',
    subtitle: 'Long-term severe pain · oral morphine 24-hour requirement split q12h or q8h',
    tags: ['Pain', 'Morphine', 'Opioid', 'Extended release', 'High alert'],
    aliases: ['Morphine ER', 'Morphine sulfate controlled release'],
    sourceLabel:
        'DailyMed · Morphine sulfate extended-release tablets · current 2026 labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Extended-release oral morphine for severe persistent pain requiring daily, around-the-clock, long-term opioid treatment when alternatives are inadequate.',
      foodTiming:
          'Use on a fixed schedule according to the exact ER product. Food instructions and dosage-form handling must follow the dispensed product.',
      duration:
          'Individualized long-term opioid therapy with regular reassessment; taper gradually rather than abruptly after physical dependence develops.',
      formulationHandling:
          'Swallow ER tablets whole. Crushing, chewing or dissolving can release a potentially fatal morphine dose.',
      releaseConversion:
          'Other oral morphine formulations → reviewed morphine sulfate ER tablets: determine the patient’s total 24-hour oral morphine requirement, then give one-half of that daily requirement every 12 hours OR one-third every 8 hours. Example: total oral morphine 60 mg/day → ER 30 mg q12h or 20 mg q8h when an appropriate strength/product permits. High-dose tolerance lock: morphine sulfate ER 100-mg and 200-mg tablets, any single dose greater than 60 mg, or a total daily dose greater than 120 mg are only for patients in whom tolerance to an opioid of comparable potency has been established. Conversion from parenteral morphine or a different opioid is not a simple 1:1 rule; current labeling emphasizes that no clinical-trial conversion ratio is established for other opioids and that underestimation with rescue medication is safer than overestimation.',
      monitoring:
          'Pain/function, sedation, respiratory rate, constipation, misuse risk, renal/hepatic function and concurrent CNS depressants.',
      interactions:
          'Alcohol, benzodiazepines and other CNS depressants markedly increase respiratory-depression risk. Review serotonergic/CNS-active medicines and CYP/P-gp interactions when relevant to the exact product.',
      commonMistakes:
          'Confusing oral morphine conversion with conversion from another opioid, overestimating the 24-hour requirement, crushing ER or continuing unplanned around-the-clock IR opioid doses.',
      specialPopulations:
          'Renal/hepatic impairment, older/frail patients, pulmonary disease and opioid-naive patients have higher toxicity risk and require conservative clinician-directed dosing. In the reviewed current label, high-dose ER use (100- or 200-mg tablets, single dose >60 mg, or total >120 mg/day) requires established opioid tolerance; one labeled definition is at least 60 mg oral morphine/day or an equianalgesic opioid dose for 1 week or longer.',
    ),
    sections: [
      MedicationSection(
        title: 'Oral morphine → ER conversion',
        body:
            'Use the established 24-hour oral morphine requirement: one-half q12h or one-third q8h as ER tablets, then titrate with close observation.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Opioid-tolerance / high-dose lock',
        body:
            '100- and 200-mg tablets, a single ER dose >60 mg, or a total ER dose >120 mg/day are only for patients with established tolerance to an opioid of comparable potency. Do not expose an opioid-naive/non-tolerant patient to those doses.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Different opioid lock',
        body:
            'Do not apply the oral-morphine rule to another opioid. There is no single established clinical-trial conversion ratio from other opioids to morphine ER; conservative individualized conversion is required.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'Morphine ممتد المفعول للألم الشديد المستمر عندما تكون هناك حاجة إلى opioid طويل المفعول يوميًا.',
      howToUseAr:
          'ابتلع حبة ER كاملة. لا تسحقها أو تمضغها أو تذيبها لأن ذلك قد يطلق جرعة كبيرة بسرعة ويسبب overdose قاتل.',
      timingAr:
          'حسب المنتج والخطة قد تكون كل 12 ساعة أو كل 8 ساعات؛ لا تغير الجدول من نفسك.',
      importantAr:
          'إذا كان التحويل من morphine فموي آخر نحسب مجموع 24 ساعة: نصف المجموع كل 12 ساعة أو ثلثه كل 8 ساعات حسب الخطة. مثال 60 mg/day → 30 mg كل 12 ساعة أو 20 mg كل 8 ساعات إذا كان المنتج/التركيز مناسبًا. لا تطبق هذه القاعدة على opioid آخر. جرعات ER العالية (single dose >60 mg أو total >120 mg/day، وكذلك 100/200 mg tablets) تتطلب opioid tolerance مثبتة.',
      commonActionableAr:
          'النعاس والإمساك والغثيان شائعة ومهمة عمليًا؛ تجنب الكحول والمهدئات غير الموصوفة.',
      missedDoseAr:
          'لا تضاعف الجرعة ولا تعوض بجرعات opioid إضافية من نفسك.',
      seekHelpAr:
          'اطلب إسعافًا فورًا عند بطء أو صعوبة التنفس أو نعاس شديد لا يمكن إيقاظك منه.',
      teachBackAr:
          'إذا كان مجموع morphine الفموي 60 mg/day، كيف يقسم عند التحويل إلى ER q12h؟ وهل تستخدم هذه القاعدة للتحويل من oxycodone؟',
    ),
  ),
  Medication(
    id: 'mesalamine-delayed-release-800mg',
    familyId: 'gastrointestinal',
    name: 'Mesalamine Delayed-Release 800 mg Tablets',
    subtitle: 'Ulcerative colitis · release-system specific · not substitutable by tablet count',
    tags: ['Ulcerative colitis', 'Mesalamine', 'Delayed release', '5-ASA'],
    aliases: ['Mesalamine DR 800 mg'],
    sourceLabel:
        'DailyMed · Mesalamine delayed-release tablets 800 mg · updated Jul 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Delayed-release mesalamine 800-mg tablets for moderately active ulcerative colitis in adults according to the reviewed label.',
      foodTiming:
          'Take on an empty stomach: at least 1 hour before and 2 hours after a meal. Drink adequate fluids.',
      duration:
          'For the reviewed 800-mg label, treatment is 1600 mg three times daily for 6 weeks; do not generalize this duration/regimen to other mesalamine products or maintenance indications.',
      formulationHandling:
          'Swallow tablets whole. Do not cut, break or chew.',
      releaseConversion:
          'Mesalamine oral products are release-system specific and must not be auto-converted by total milligrams or tablet count. The reviewed 800-mg delayed-release label explicitly states: do not substitute one 800-mg delayed-release tablet for two 400-mg delayed-release oral products. Therefore there is no universal IR/DR/ER mg-for-mg conversion rule across mesalamine brands; verify the exact product, indication, site of release, dose and food instructions.',
      monitoring:
          'Renal function before treatment and periodically, clinical response, hydration, symptoms of mesalamine intolerance/nephrotoxicity, and unusual severe/recurrent headache or visual symptoms suggesting intracranial hypertension.',
      interactions:
          'Review nephrotoxic medicines and other agents that may increase renal risk. Product-specific pH/release considerations matter.',
      commonMistakes:
          'Replacing one mesalamine product with another based only on equal milligrams, substituting one 800-mg tablet for two 400-mg products, crushing delayed-release tablets or copying food instructions between brands.',
      specialPopulations:
          'Renal impairment requires careful risk assessment and monitoring; older patients may have greater renal vulnerability.',
    ),
    sections: [
      MedicationSection(
        title: 'No universal mesalamine conversion',
        body:
            'Do not auto-convert mesalamine products by milligrams. Release location and formulation differ, and the reviewed 800-mg label specifically forbids substituting one 800-mg tablet for two 400-mg delayed-release products.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'Mesalamine delayed-release 800 mg لعلاج التهاب القولون التقرحي حسب المنتج والخطة.',
      howToUseAr:
          'ابتلع الحبة كاملة ولا تكسرها أو تسحقها أو تمضغها. المنتج المراجع يؤخذ على معدة فارغة: قبل الطعام بساعة على الأقل أو بعده بساعتين، مع سوائل كافية.',
      timingAr:
          'المنتج 800 mg المراجع له جدول خاص؛ لا تنقل توقيت أو جرعة براند mesalamine آخر إليه.',
      importantAr:
          'لا تعتبر منتجات mesalamine متساوية بالـmg. الملصق نفسه يمنع استبدال حبة delayed-release 800 mg بحبتين من منتج delayed-release 400 mg؛ يجب مطابقة اسم المنتج والتركيز ونظام الإطلاق.',
      commonActionableAr:
          'قد يحدث صداع أو ألم بطن/غثيان؛ اشرب سوائل كافية ما لم تكن لديك تعليمات لتحديد السوائل.',
      missedDoseAr:
          'لا تضاعف الجرعة التالية؛ اتبع جدول نفس المنتج.',
      seekHelpAr:
          'إذا ظهر صداع غير معتاد أو شديد/متكرر مع تشوش أو ازدواج بالرؤية فأوقف الدواء واطلب تقييمًا طبيًا فورًا حسب الملصق المحدث. وراجع الطبيب أيضًا عند نقص البول، تورم، ألم صدر جديد، طفح شديد أو تدهور واضح في أعراض القولون.',
      teachBackAr:
          'هل يمكنك استبدال mesalamine 800 mg بحبتين 400 mg فقط لأن مجموع الـmg متساوٍ؟',
    ),
  ),
];
