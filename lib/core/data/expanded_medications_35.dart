import '../models/medication.dart';

const expandedMedications35 = <Medication>[
  Medication(
    id: 'pregabalin-lyrica-cr',
    familyId: 'cns',
    name: 'Pregabalin Extended-Release (LYRICA CR)',
    subtitle: 'DPN/PHN pain · evening meal · explicit IR pregabalin conversion table',
    tags: ['Pregabalin', 'LYRICA CR', 'Neuropathic pain', 'Extended release', 'Conversion table'],
    aliases: ['LYRICA CR', 'Pregabalin CR'],
    sourceLabel:
        'DailyMed · LYRICA CR pregabalin extended-release tablets · revised Mar 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily pregabalin CR for diabetic peripheral neuropathic pain and postherpetic neuralgia. Efficacy has not been established for fibromyalgia or as adjunctive therapy for partial-onset seizures.',
      foodTiming:
          'Take once daily after an evening meal. Missed-dose instructions are meal-specific.',
      duration:
          'Usually chronic for neuropathic pain while benefit outweighs adverse effects; taper over at least 1 week when discontinuing.',
      formulationHandling:
          'Swallow CR tablets whole. Do not split, crush or chew.',
      releaseConversion:
          'On the switch day, take the morning dose of immediate-release LYRICA as prescribed, then start LYRICA CR after the evening meal. Official conversion table: IR total 75 mg/day → CR 82.5 mg once daily; 150 → 165 mg; 225 → 247.5 mg; 300 → 330 mg; 450 → 495 mg; 600 → 660 mg. This conversion table applies to labeled pain indications; LYRICA CR efficacy for adjunctive seizure treatment has not been established.',
      monitoring:
          'Pain control, dizziness/somnolence, edema/weight gain, respiratory depression risk with CNS depressants, renal function and mood/suicidality.',
      interactions:
          'Opioids and other CNS depressants increase sedation/respiratory risk. Thiazolidinediones can increase edema/weight gain.',
      commonMistakes:
          'Using the IR milligram number unchanged instead of the conversion table, taking CR without an evening meal, crushing CR, or assuming CR is an approved substitute for pregabalin used for epilepsy.',
      specialPopulations:
          'LYRICA CR is not recommended when CrCl is below 30 mL/min or in hemodialysis patients.',
    ),
    sections: [
      MedicationSection(
        title: 'IR pregabalin → LYRICA CR conversion',
        body:
            'Use the label table, not 1:1 milligram matching: 75→82.5, 150→165, 225→247.5, 300→330, 450→495, and 600→660 mg once daily. Take the usual IR morning dose on the switch day, then begin CR after the evening meal.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Epilepsy indication lock',
        body:
            'Do not use the CR conversion table as justification to replace pregabalin being used for epilepsy. Current LYRICA CR labeling states that efficacy as adjunctive therapy for partial-onset seizures has not been established.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'LYRICA CR صيغة ممتدة المفعول لآلام الأعصاب المرتبطة بالسكري أو بعد الحزام الناري حسب الوصفة؛ ليست صيغة مثبتة لعلاج الصرع كمساعد.',
      howToUseAr:
          'خذها مرة يوميًا بعد وجبة المساء وابتلع الحبة كاملة. لا تقسمها أو تسحقها أو تمضغها.',
      timingAr:
          'بعد وجبة المساء مرة واحدة يوميًا.',
      importantAr:
          'التحويل من pregabalin العادي ليس mg مقابل mg: مثلًا 150 mg/day من العادي → 165 mg CR، و300 mg/day → 330 mg CR. في يوم التحويل تؤخذ جرعة الصباح العادية ثم تبدأ CR بعد وجبة المساء حسب خطة الطبيب.',
      commonActionableAr:
          'قد تسبب دوخة أو نعاسًا أو تورمًا بالساقين وزيادة وزن؛ اعرف تأثيرها عليك قبل القيادة.',
      missedDoseAr:
          'إذا نسيت جرعة ما بعد العشاء فتعليمات التعويض مرتبطة بالوجبات؛ لا تضاعف الجرعة واتبع خطة المنتج/الصيدلي.',
      seekHelpAr:
          'اطلب المساعدة عند بطء أو صعوبة التنفس، تورم الوجه/اللسان، أفكار إيذاء النفس أو نعاس شديد غير معتاد.',
      teachBackAr:
          'هل 150 mg/day من pregabalin العادي تتحول إلى 150 mg CR أم 165 mg CR؟ وهل CR مثبتة كبديل لعلاج الصرع؟',
    ),
  ),
  Medication(
    id: 'gabapentin-gralise',
    familyId: 'cns',
    name: 'Gabapentin Extended-Release (GRALISE)',
    subtitle: 'PHN only · evening meal · not substitutable with other gabapentin products',
    tags: ['Gabapentin', 'GRALISE', 'PHN', 'Extended release', 'Not interchangeable'],
    aliases: ['GRALISE'],
    sourceLabel:
        'DailyMed · GRALISE gabapentin tablets · updated Jun 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily gastroretentive gabapentin product indicated for postherpetic neuralgia; safety and effectiveness in epilepsy have not been studied.',
      foodTiming:
          'Take once daily with the evening meal.',
      duration:
          'Usually chronic/individualized for PHN; taper gradually over at least 1 week when reducing, discontinuing or substituting.',
      formulationHandling:
          'Swallow tablets whole. Do not split, crush or chew.',
      releaseConversion:
          'GRALISE is not substitutable with immediate-release gabapentin, HORIZANT or other gabapentin products because pharmacokinetic profiles differ. Do not create a milligram-for-milligram IR→GRALISE conversion. The labeled regimen is product-specific titration to 1800 mg once daily with the evening meal for PHN.',
      monitoring:
          'Pain response, dizziness, sedation/falls, respiratory depression with CNS depressants, renal function and mood/suicidality.',
      interactions:
          'Separate from aluminum/magnesium antacids by at least 2 hours. Opioids and other CNS depressants can increase respiratory/sedation risk.',
      commonMistakes:
          'Replacing ordinary gabapentin with the same milligram amount of GRALISE, using GRALISE for epilepsy because gabapentin IR has an epilepsy indication, or taking it without the evening meal.',
      specialPopulations:
          'Do not use in CrCl below 30 mL/min or in hemodialysis patients.',
    ),
    sections: [
      MedicationSection(
        title: 'No IR → GRALISE auto-conversion',
        body:
            'GRALISE is explicitly not substitutable with other gabapentin products. Use its own titration and indication-specific regimen rather than copying the total daily IR gabapentin dose.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Epilepsy indication lock',
        body:
            'GRALISE is labeled for postherpetic neuralgia; its safety and effectiveness in epilepsy have not been studied.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'GRALISE نوع ممتد من gabapentin مخصص لآلام الأعصاب بعد الحزام الناري.',
      howToUseAr:
          'خذه مرة يوميًا مع وجبة المساء وابتلع الحبة كاملة. لا تقسمها أو تسحقها أو تمضغها.',
      timingAr:
          'مرة واحدة يوميًا مع وجبة المساء.',
      importantAr:
          'لا تبدّل gabapentin العادي إلى GRALISE بنفس عدد الـmg؛ المنتج ليس interchangeable مع gabapentin العادي أو HORIZANT، وفعاليته للصرع لم تُدرس.',
      commonActionableAr:
          'قد يسبب دوخة أو نعاسًا؛ انتبه للقيادة والسقوط، خصوصًا مع المهدئات أو opioids.',
      missedDoseAr:
          'لا تضاعف الجرعة. ارجع إلى جدول اليوم التالي حسب تعليمات الوصفة.',
      seekHelpAr:
          'اطلب المساعدة عند صعوبة أو بطء التنفس، نعاس شديد جدًا أو أفكار إيذاء النفس.',
      teachBackAr:
          'هل يمكنك استبدال 1800 mg/day من gabapentin العادي بـ1800 mg GRALISE من نفسك؟',
    ),
  ),
  Medication(
    id: 'gabapentin-enacarbil-horizant',
    familyId: 'cns',
    name: 'Gabapentin Enacarbil Extended-Release (HORIZANT)',
    subtitle: 'RLS/PHN · with food · not substitutable with gabapentin',
    tags: ['Gabapentin enacarbil', 'HORIZANT', 'RLS', 'PHN', 'Extended release'],
    aliases: ['HORIZANT'],
    sourceLabel:
        'DailyMed · HORIZANT gabapentin enacarbil extended-release tablets · revised Apr 2025',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Gabapentin enacarbil prodrug for moderate-to-severe primary restless legs syndrome and postherpetic neuralgia in adults; not studied as epilepsy treatment.',
      foodTiming:
          'Take with food. RLS: 600 mg once daily at about 5 PM. PHN: product-specific regimen begins 600 mg each morning for 3 days then 600 mg twice daily from day 4 in patients with appropriate renal function.',
      duration:
          'Usually chronic/individualized by indication; taper according to the product regimen rather than abrupt cessation.',
      formulationHandling:
          'Swallow tablets whole. Do not cut, crush or chew.',
      releaseConversion:
          'HORIZANT is not substitutable with gabapentin IR, GRALISE or other gabapentin products. The same milligram dose produces different gabapentin plasma concentrations, so there is no valid universal mg-for-mg conversion. HORIZANT also uses gabapentin enacarbil, a prodrug, and its regimen depends on indication.',
      monitoring:
          'RLS/PHN response, dizziness/somnolence, driving impairment, renal function, respiratory depression risk and mood/suicidality.',
      interactions:
          'CNS depressants can increase sedation/respiratory risk. Take with food because exposure is formulation-dependent.',
      commonMistakes:
          'Treating HORIZANT as ordinary gabapentin, copying a gabapentin mg dose, taking RLS and PHN schedules as interchangeable, or using it for epilepsy.',
      specialPopulations:
          'Renal dosing is indication-specific. Current labeling states that safety and effectiveness in epilepsy have not been studied.',
    ),
    sections: [
      MedicationSection(
        title: 'No gabapentin → HORIZANT conversion',
        body:
            'Do not calculate HORIZANT from a gabapentin total daily dose. HORIZANT is a gabapentin-enacarbil prodrug and the same numeric dose produces different gabapentin exposure.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Indication timing lock',
        body:
            'RLS and PHN schedules differ materially. For RLS, 600 mg is taken once daily at about 5 PM; PHN uses a separate product-specific regimen.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'HORIZANT دواء يتحول في الجسم إلى gabapentin ويستخدم للـRLS أو ألم الأعصاب بعد الحزام الناري، وليس كبديل مباشر لعلاج الصرع.',
      howToUseAr:
          'ابتلع الحبة كاملة مع الطعام. لا تقطعها أو تسحقها أو تمضغها.',
      timingAr:
          'التوقيت يعتمد على السبب: للـRLS عادة 600 mg حوالي الساعة 5 مساءً؛ للـPHN يوجد جدول مختلف.',
      importantAr:
          'لا تحسب جرعة HORIZANT من جرعة gabapentin العادي؛ نفس رقم الـmg لا يعطي نفس التعرض، والمنتجان ليسا interchangeable.',
      commonActionableAr:
          'قد يسبب نعاسًا أو دوخة؛ لا تقد السيارة حتى تعرف تأثيره عليك.',
      missedDoseAr:
          'لا تعوض بجرعتين؛ اتبع تعليمات الاستطباب لأن missed-dose rules تختلف بين RLS وPHN.',
      seekHelpAr:
          'اطلب المساعدة عند صعوبة التنفس، نعاس شديد أو أفكار إيذاء النفس.',
      teachBackAr:
          'إذا كنت تأخذ 600 mg gabapentin عادي، هل يعني ذلك أن 600 mg HORIZANT هي الجرعة المكافئة تلقائيًا؟',
    ),
  ),
  Medication(
    id: 'lacosamide-motpoly-xr',
    familyId: 'cns',
    name: 'Lacosamide Extended-Release (MOTPOLY XR)',
    subtitle: 'Epilepsy · once daily · relative-bioavailability bridge, no label switch table',
    tags: ['Epilepsy', 'Lacosamide', 'MOTPOLY XR', 'Extended release', 'Controlled substance'],
    aliases: ['MOTPOLY XR', 'Lacosamide XR'],
    sourceLabel:
        'DailyMed · MOTPOLY XR lacosamide extended-release capsules · updated Jul 2025',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily lacosamide XR for partial-onset seizures and as adjunctive therapy for primary generalized tonic-clonic seizures in adults and pediatric patients weighing at least 50 kg.',
      foodTiming:
          'May be taken with or without food.',
      duration:
          'Usually chronic antiseizure therapy; taper gradually when discontinuing.',
      formulationHandling:
          'Swallow capsules whole with liquid. Do not open, chew or crush.',
      releaseConversion:
          'The reviewed MOTPOLY XR label bases efficacy on relative bioavailability compared with immediate-release lacosamide, but it does not provide a labeled IR→XR conversion table or an explicit automatic same-total-daily-dose switch instruction. Therefore do not auto-convert by matching milligrams; select the labeled once-daily regimen according to indication, current dose, renal/hepatic status and seizure control.',
      monitoring:
          'Seizure control, dizziness/ataxia, PR-interval/conduction risk, syncope, renal/hepatic function, mood/suicidality and misuse risk.',
      interactions:
          'Review other drugs that slow cardiac conduction and strong CYP3A4/CYP2C9 inhibitors in renal/hepatic impairment. Enzyme-inducing antiseizure drugs may modestly lower lacosamide concentrations.',
      commonMistakes:
          'Assuming relative bioavailability equals a formal 1:1 conversion instruction, opening the XR capsule, or ignoring PR-conduction risk.',
      specialPopulations:
          'Maximum dose is reduced in severe renal impairment and mild-to-moderate hepatic impairment; avoid use in severe hepatic impairment per current labeling.',
    ),
    sections: [
      MedicationSection(
        title: 'IR → MOTPOLY XR conversion lock',
        body:
            'The label supports efficacy through relative-bioavailability bridging to IR lacosamide, but does not publish a direct conversion table. Treat the switch as prescriber-defined rather than an automatic milligram copy.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Cardiac conduction lock',
        body:
            'Lacosamide can prolong PR interval. Review conduction disease and other PR-prolonging medicines; ECG monitoring may be clinically appropriate in higher-risk patients.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'MOTPOLY XR صيغة lacosamide ممتدة مرة يوميًا لعلاج أنواع محددة من الصرع حسب العمر والوزن.',
      howToUseAr:
          'ابتلع الكبسولة كاملة مع الماء. لا تفتحها أو تمضغها أو تسحقها.',
      timingAr:
          'مرة واحدة يوميًا، مع الطعام أو بدونه.',
      importantAr:
          'لا تحول lacosamide العادي إلى MOTPOLY XR من نفسك بمجرد جمع الـmg؛ الملصق يعتمد على بيانات التعرض الدوائي لكنه لا يعطي جدول تحويل مباشر ثابت.',
      commonActionableAr:
          'قد يحدث دوار أو عدم توازن؛ انتبه للقيادة والسقوط.',
      missedDoseAr:
          'لا تضاعف الجرعة. اتبع خطة الطبيب لأن الانقطاع قد يزيد خطر النوبات.',
      seekHelpAr:
          'اطلب المساعدة عند إغماء، خفقان شديد مع دوار، طفح شديد أو زيادة النوبات.',
      teachBackAr:
          'هل وجود نفس المادة الفعالة يعني أن جرعة IR تتحول تلقائيًا لنفس mg من MOTPOLY XR؟',
    ),
  ),
  Medication(
    id: 'sitagliptin-metformin-janumet-xr',
    familyId: 'diabetes-endocrine',
    name: 'Sitagliptin/Metformin Extended-Release (JANUMET XR)',
    subtitle: 'Type 2 diabetes · once daily with meal · preserve both components daily dose',
    tags: ['Type 2 diabetes', 'Sitagliptin', 'Metformin', 'JANUMET XR', 'Extended release'],
    aliases: ['JANUMET XR'],
    sourceLabel:
        'DailyMed · JANUMET XR sitagliptin/metformin ER · revised Aug 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily fixed-dose sitagliptin plus metformin ER for adults with type 2 diabetes.',
      foodTiming:
          'Take once daily with a meal. If two tablets are required, take them together.',
      duration:
          'Usually chronic while effective, tolerated and renal function remains appropriate.',
      formulationHandling:
          'Swallow tablets whole. Do not split, crush or chew.',
      releaseConversion:
          'When changing between JANUMET immediate-release and JANUMET XR, maintain the same total daily dose of both sitagliptin and metformin. Patients taking metformin IR 850 mg twice daily or 1000 mg twice daily who require sitagliptin 100 mg/day can start two JANUMET XR 50 mg/1000 mg tablets together once daily. Maximum recommended daily total is sitagliptin 100 mg plus metformin ER 2000 mg.',
      monitoring:
          'A1c/glucose, renal function/eGFR, GI tolerance, pancreatitis symptoms, vitamin B12 with long-term metformin when indicated and contrast-procedure considerations.',
      interactions:
          'Review iodinated contrast procedures, heavy alcohol use and renal-function affecting medicines; insulin/sulfonylurea combinations can increase hypoglycemia risk.',
      commonMistakes:
          'Keeping the old twice-daily JANUMET schedule after switching to XR, taking two XR tablets separately, crushing XR or ignoring renal limits.',
      specialPopulations:
          'Contraindicated below eGFR 30 mL/min/1.73 m²; initiation is not recommended at eGFR 30–45 in current labeling.',
    ),
    sections: [
      MedicationSection(
        title: 'JANUMET → JANUMET XR conversion',
        body:
            'Keep the same total daily sitagliptin and metformin doses when changing between IR JANUMET and JANUMET XR. Example: patients on metformin IR 1000 mg BID who need sitagliptin 100 mg/day use two 50/1000 XR tablets together once daily.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'قرص مركب من sitagliptin + metformin XR للسكري النوع الثاني.',
      howToUseAr:
          'خذ JANUMET XR مرة يوميًا مع وجبة. إذا كانت الجرعة تحتاج حبتين فخذهما معًا، وابتلع الحبوب كاملة.',
      timingAr:
          'مرة واحدة يوميًا مع وجبة.',
      importantAr:
          'عند التحويل من JANUMET العادي إلى XR نحافظ على نفس مجموع الجرعة اليومية من sitagliptin وmetformin، لكن يصبح الجدول XR مرة واحدة. مثال شائع: حبتان 50/1000 XR معًا مرة يوميًا عند الحاجة إلى 100/2000 mg/day.',
      commonActionableAr:
          'قد يحدث غثيان أو إسهال بسبب metformin خصوصًا في البداية.',
      missedDoseAr:
          'لا تضاعف الجرعة التالية. ارجع للجدول المعتاد مع وجبته.',
      seekHelpAr:
          'اطلب تقييمًا عند ألم بطن شديد مستمر قد يدل على pancreatitis، أو مرض حاد مع جفاف/ضعف شديد خاصة مع مشاكل الكلى.',
      teachBackAr:
          'إذا تحولت من JANUMET العادي إلى XR، هل نحافظ على مجموع جرعتي الدواء أم نضاعفهما؟',
    ),
  ),
  Medication(
    id: 'linagliptin-metformin-jentadueto-xr',
    familyId: 'diabetes-endocrine',
    name: 'Linagliptin/Metformin Extended-Release (JENTADUETO XR)',
    subtitle: 'Type 2 diabetes · once daily with meal · 5 mg linagliptin + similar metformin total',
    tags: ['Type 2 diabetes', 'Linagliptin', 'Metformin', 'JENTADUETO XR', 'Extended release'],
    aliases: ['JENTADUETO XR'],
    sourceLabel:
        'DailyMed · JENTADUETO XR linagliptin/metformin ER · effective Aug 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily fixed-dose linagliptin plus metformin ER for adults with type 2 diabetes.',
      foodTiming:
          'Take once daily with a meal.',
      duration:
          'Usually chronic while effective, tolerated and renal function remains appropriate.',
      formulationHandling:
          'Swallow tablets whole. Do not split, crush, dissolve or chew.',
      releaseConversion:
          'For patients already treated with linagliptin plus metformin or JENTADUETO immediate-release, switch to JENTADUETO XR once daily providing linagliptin 5 mg total daily plus a similar total daily metformin dose. Patients already on metformin alone also start with linagliptin 5 mg/day plus a similar metformin total, subject to available strengths, renal status and tolerability. Maximum daily totals are linagliptin 5 mg and metformin 2000 mg.',
      monitoring:
          'A1c/glucose, renal function/eGFR, GI tolerance, pancreatitis symptoms and vitamin B12 when clinically indicated.',
      interactions:
          'Strong P-gp/CYP3A4 inducers can reduce linagliptin exposure. Review contrast procedures and medicines affecting renal function because of metformin.',
      commonMistakes:
          'Continuing twice-daily JENTADUETO after starting XR, crushing XR, or selecting a combination strength without preserving the intended component totals.',
      specialPopulations:
          'Renal restrictions are driven substantially by metformin; confirm current eGFR before conversion.',
    ),
    sections: [
      MedicationSection(
        title: 'JENTADUETO → JENTADUETO XR conversion',
        body:
            'Switch to once-daily XR with linagliptin 5 mg total daily and a similar total daily metformin dose. Choose the available XR strength(s) that best reproduce the intended components rather than simply matching tablet count.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'دواء مركب من linagliptin + metformin XR للسكري النوع الثاني.',
      howToUseAr:
          'خذ الجرعة مرة واحدة يوميًا مع وجبة وابتلع الحبة كاملة. لا تسحقها أو تذيبها أو تمضغها.',
      timingAr:
          'مرة واحدة يوميًا مع وجبة.',
      importantAr:
          'عند التحويل من JENTADUETO العادي إلى XR يكون الهدف 5 mg linagliptin يوميًا مع مجموع metformin قريب من جرعتك اليومية السابقة، حسب القوة المتوفرة ووظيفة الكلى.',
      commonActionableAr:
          'قد يسبب metformin غثيانًا أو إسهالًا خصوصًا عند البداية أو زيادة الجرعة.',
      missedDoseAr:
          'لا تضاعف الجرعة التالية؛ ارجع إلى الجرعة اليومية المعتادة.',
      seekHelpAr:
          'اطلب تقييمًا عند ألم بطن شديد مستمر، جفاف شديد أو أعراض تحسس/فقاعات جلدية غير معتادة.',
      teachBackAr:
          'عند الانتقال إلى XR، ما مجموع linagliptin اليومي المطلوب عادةً: 5 mg أم 10 mg؟',
    ),
  ),
  Medication(
    id: 'saxagliptin-metformin-kombiglyze-xr',
    familyId: 'diabetes-endocrine',
    name: 'Saxagliptin/Metformin Extended-Release (KOMBIGLYZE XR)',
    subtitle: 'Type 2 diabetes · evening meal · metformin IR switch needs glycemic follow-up',
    tags: ['Type 2 diabetes', 'Saxagliptin', 'Metformin', 'KOMBIGLYZE XR', 'Extended release'],
    aliases: ['KOMBIGLYZE XR'],
    sourceLabel:
        'DailyMed · KOMBIGLYZE XR saxagliptin/metformin ER · current labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Once-daily fixed-dose saxagliptin plus metformin ER for adults with type 2 diabetes.',
      foodTiming:
          'Take once daily with the evening meal.',
      duration:
          'Usually chronic while effective, tolerated and clinically appropriate.',
      formulationHandling:
          'Swallow XR tablets whole. Do not crush, cut or chew.',
      releaseConversion:
          'Individualize KOMBIGLYZE XR from the current regimen and available strengths. In patients already treated with metformin, the starting XR regimen should provide the metformin dose already being taken or the nearest therapeutically appropriate dose. After switching from metformin immediate-release to KOMBIGLYZE XR, closely monitor glycemic control and adjust as needed. This is not a universal one-tablet-for-one-tablet conversion because the saxagliptin component and available fixed-dose strengths must also fit the patient.',
      monitoring:
          'A1c/glucose, renal function, GI tolerance, pancreatitis symptoms and heart-failure symptoms in susceptible patients.',
      interactions:
          'Strong CYP3A4/5 inhibitors can alter saxagliptin exposure and may require a lower saxagliptin component; review contrast procedures and renal-risk medicines because of metformin.',
      commonMistakes:
          'Converting tablet count rather than component doses, skipping post-switch glucose monitoring, crushing XR, or taking it away from the evening meal.',
      specialPopulations:
          'Renal function determines whether the metformin-containing product is appropriate and may alter the usable fixed-dose combinations.',
    ),
    sections: [
      MedicationSection(
        title: 'Metformin IR → KOMBIGLYZE XR conversion',
        body:
            'Start from the metformin total already being taken or the nearest therapeutically appropriate metformin dose, fit the saxagliptin component to the intended regimen, and closely monitor glucose after the IR→XR switch.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'دواء مركب من saxagliptin + metformin XR للسكري النوع الثاني.',
      howToUseAr:
          'خذ الحبة مرة يوميًا مع وجبة المساء وابتلعها كاملة. لا تسحقها أو تقطعها أو تمضغها.',
      timingAr:
          'مرة واحدة يوميًا مع وجبة المساء.',
      importantAr:
          'عند التحويل من metformin العادي إلى KOMBIGLYZE XR لا ننقل عدد الحبوب فقط؛ نختار قوة تعطي metformin قريبًا من مجموع جرعتك السابقة وتناسب جرعة saxagliptin، ثم نراقب السكر بعد التحويل.',
      commonActionableAr:
          'قد يحدث غثيان أو إسهال، وقد يهبط السكر أكثر إذا جُمع مع insulin أو sulfonylurea.',
      missedDoseAr:
          'لا تضاعف الجرعة التالية؛ ارجع إلى جرعة المساء المعتادة.',
      seekHelpAr:
          'اطلب تقييمًا عند ضيق نفس/تورم سريع قد يدل على heart failure، ألم بطن شديد مستمر أو مرض حاد مع جفاف.',
      teachBackAr:
          'هل التحويل إلى KOMBIGLYZE XR يعتمد على عدد الحبوب القديمة أم على جرعات المكونات ومراقبة السكر؟',
    ),
  ),
];
