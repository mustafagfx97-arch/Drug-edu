import '../models/medication.dart';

const expandedMedications14 = <Medication>[
  Medication(
    id: 'teriparatide-forteo',
    familyId: 'bone-health',
    name: 'Teriparatide (FORTEO)',
    subtitle: 'Daily anabolic osteoporosis pen · 28-day refrigerated device',
    tags: ['Osteoporosis', 'Anabolic', 'Injection', 'Pen'],
    aliases: ['Forteo', 'Teriparatide 20 mcg'],
    hasVisualGuide: true,
    sourceLabel:
        'DailyMed · FORTEO teriparatide injection · revised Aug 2026 + current User Manual',
    useProfile: MedicationUseProfile(
      route:
          'Single-patient-use prefilled delivery device intended to deliver 20 mcg subcutaneously once daily into the thigh or abdomen.',
      foodTiming:
          'Not meal-related. Use once daily at a consistent time that supports adherence.',
      duration:
          'Use beyond 2 years during a patient’s lifetime should only be considered when the patient remains at or returns to high fracture risk.',
      formulationHandling:
          'Use a new pen needle for each injection. Inject according to the FORTEO User Manual and hold the black injection button in while slowly counting to 5. Remove and discard the needle after use, recap the device and return it to the refrigerator immediately. Do not transfer medicine from the delivery device into a syringe.',
      monitoring:
          'Fracture risk, calcium/vitamin D adequacy and calcium-related symptoms as clinically appropriate. First doses can cause transient orthostatic symptoms.',
      interactions:
          'Transient serum-calcium increases can increase sensitivity to digoxin toxicity; digoxin users need clinical review rather than simple dose-time separation.',
      commonMistakes:
          'Leaving the device out of the refrigerator, leaving the needle attached, sharing the device, transferring medicine into a syringe, or giving another injection the same day because the device indicator looked uncertain.',
      specialPopulations:
          'Avoid in patients at increased baseline risk of osteosarcoma such as certain skeletal malignancy/radiation or metabolic-bone-disease contexts. Product-specific pen instructions must not be generalized to other teriparatide devices.',
    ),
    sections: [
      MedicationSection(
        title: '28-day refrigerator lock',
        body:
            'Store FORTEO at 2–8°C except during administration, minimize time out of the refrigerator, do not freeze, and discard the device 28 days after first use even if medicine remains.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'First-dose orthostasis + device lock',
        body:
            'For the first few doses, inject where the patient can sit or lie down if dizziness/palpitations occur. Use a new needle each time, count slowly to 5 during injection, remove the needle after use, and never transfer pen contents to a syringe.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'دواء يبني العظم ويُستخدم لبعض مرضى هشاشة العظام ذوي خطر الكسور المرتفع.',
      howToUseAr:
          'حقنة تحت الجلد مرة يوميًا في الفخذ أو البطن. استخدم إبرة جديدة، واضغط زر الحقن حسب قلم FORTEO واستمر ضاغطًا مع العد ببطء إلى 5، ثم انزع الإبرة وتخلص منها وأعد القلم للثلاجة مباشرة.',
      timingAr:
          'مرة واحدة يوميًا. أول عدة جرعات خذها في مكان تستطيع الجلوس أو الاستلقاء فيه إذا شعرت بدوخة أو خفقان.',
      importantAr:
          'لا تنقل الدواء من القلم إلى سرنجة، لا تشارك القلم، ولا تعطِ أكثر من حقنة واحدة في اليوم.',
      commonActionableAr:
          'قد يحدث دوار أو خفقان بعد الجرعات الأولى؛ اجلس أو استلقِ حتى تزول الأعراض، وإذا استمرت أو ساءت اتصل بالطبيب.',
      missedDoseAr:
          'إذا فاتت الجرعة فلا تعطِ أكثر من حقنة واحدة في نفس اليوم؛ استأنف الجدول اليومي حسب خطة الطبيب.',
      storageAr:
          'احفظ القلم دائمًا بالثلاجة 2–8°C، أخرجه فقط وقت الجرعة وأعده مباشرة، ولا تجمده. تخلص من القلم بعد 28 يومًا من أول استخدام حتى لو بقي دواء.',
      seekHelpAr:
          'اطلب مساعدة عند تحسس شديد، دوخة/إغماء لا يتحسن، أو أعراض ارتفاع كالسيوم واضحة.',
      teachBackAr:
          'أين تحفظ قلم FORTEO؟ كم تعد أثناء الحقن؟ وبعد كم يوم من أول استخدام ترمي القلم؟',
    ),
  ),
  Medication(
    id: 'abaloparatide-tymlos',
    familyId: 'bone-health',
    name: 'Abaloparatide (TYMLOS)',
    subtitle: 'Daily anabolic osteoporosis pen · Day-1 priming + 30-day room-temperature use',
    tags: ['Osteoporosis', 'Anabolic', 'Injection', 'Pen'],
    aliases: ['Tymlos', 'Abaloparatide 80 mcg'],
    hasVisualGuide: true,
    sourceLabel:
        'DailyMed · TYMLOS abaloparatide injection · effective Aug 11, 2026 + current IFU',
    useProfile: MedicationUseProfile(
      route:
          'Single-patient-use prefilled pen delivering 80 mcg subcutaneously once daily into the periumbilical abdominal region, avoiding the 2-inch area around the navel.',
      foodTiming:
          'May be used with or without food or drink. Use at approximately the same time each day.',
      duration:
          'Safety and efficacy beyond 2 years have not been evaluated; use for more than 2 years during a patient’s lifetime is not recommended.',
      formulationHandling:
          'Prime each NEW pen on Day 1 only; do not repeat new-pen setup on Days 2–30. Set the dose window to 80, insert straight into the abdomen, press the green injection button until 0 appears and continue holding while counting to 10. Remove the needle after each injection and recap the pen. Do not transfer medicine to a syringe.',
      monitoring:
          'Orthostatic symptoms, serum/urine calcium when clinically indicated and kidney-stone symptoms in at-risk patients.',
      interactions:
          'Hypercalcemia risk is clinically important; review other calcium-raising conditions/therapies rather than relying on timing separation.',
      commonMistakes:
          'Priming every day and wasting medicine, injecting within 2 inches of the navel, failing to hold the button for the full 10-count, storing the opened pen in the refrigerator by habit, or leaving the needle attached.',
      specialPopulations:
          'Avoid in patients at increased baseline risk of osteosarcoma. Hypercalcemia/hypercalciuria/urolithiasis require patient-specific review.',
    ),
    sections: [
      MedicationSection(
        title: 'Day-1 priming only',
        body:
            'Prime each NEW TYMLOS pen only on Day 1. Days 2–30 skip the priming steps. Set 80 → inject into rotating lower-abdominal sites away from the 2-inch navel zone → press to 0 and hold while counting to 10.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Storage changes after first use',
        body:
            'Before first use: refrigerate at 2–8°C. After first use: store at 20–25°C for up to 30 days; do not freeze or expose to heat. Discard after 30 days even if medicine remains.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'دواء يبني العظم لبعض مرضى هشاشة العظام ذوي خطر الكسور المرتفع.',
      howToUseAr:
          'مرة يوميًا تحت جلد أسفل البطن مع تغيير المكان وتجنب مسافة 2 إنش حول السرة. في أول يوم من كل قلم جديد فقط اعمل priming، ثم اضبط النافذة على 80. أثناء الحقن اضغط الزر الأخضر حتى يظهر 0 واستمر ضاغطًا وأنت تعد إلى 10.',
      timingAr:
          'تقريبًا في نفس الوقت كل يوم، مع الطعام أو بدونه. أول عدة جرعات خذها حيث تستطيع الجلوس أو الاستلقاء إذا حدث دوار.',
      importantAr:
          'لا تعمل priming كل يوم، لا تنقل الدواء إلى سرنجة، ولا تستخدم أكثر من حقنة واحدة في اليوم.',
      commonActionableAr:
          'قد يحدث دوار أو خفقان بعد الجرعة؛ اجلس أو استلقِ حتى تزول الأعراض. أخبر الطبيب عن أعراض حصى الكلى أو ارتفاع الكالسيوم.',
      missedDoseAr:
          'إذا نسيت الجرعة في وقتك المعتاد خذها عندما تتذكر في نفس اليوم، لكن لا تستخدم أكثر من حقنة واحدة في اليوم.',
      storageAr:
          'قبل أول استخدام يُحفظ في الثلاجة 2–8°C. بعد أول استخدام يُحفظ بدرجة الغرفة 20–25°C لمدة أقصاها 30 يومًا؛ لا تجمده ولا تعرضه للحرارة، وارمه بعد 30 يومًا حتى لو بقي دواء.',
      seekHelpAr:
          'اطلب مساعدة عند تحسس شديد أو دوخة/خفقان شديد لا يتحسن، وراجع عند ألم خاصرة/دم بالبول أو أعراض ارتفاع الكالسيوم.',
      teachBackAr:
          'كم مرة تعمل priming للقلم؟ كم تعد أثناء الحقن؟ وأين تحفظ القلم بعد أول استخدام؟',
    ),
  ),
  Medication(
    id: 'romosozumab-evenity',
    familyId: 'bone-health',
    name: 'Romosozumab (EVENITY)',
    subtitle: 'Monthly clinic injection · two syringes = one dose · 12 doses total',
    tags: ['Osteoporosis', 'Sclerostin inhibitor', 'Monthly', 'Clinic injection'],
    aliases: ['Evenity', 'Romosozumab-aqqg'],
    sourceLabel:
        'DailyMed · EVENITY romosozumab-aqqg injection · current Aug 2026 labeling',
    useProfile: MedicationUseProfile(
      route:
          'Healthcare-provider-administered subcutaneous therapy. A full 210 mg monthly dose requires TWO separate 105 mg/1.17 mL prefilled syringes injected one after the other.',
      foodTiming:
          'Not meal-related. Ensure calcium and vitamin D supplementation is adequate during therapy.',
      duration:
          'Limited to 12 monthly doses. If osteoporosis therapy is still needed afterward, an antiresorptive agent should generally be considered.',
      formulationHandling:
          'Remove both syringes, allow them to sit at room temperature for at least 30 minutes before injection, and do not warm by another method. Do not shake. Use two separate injection sites.',
      monitoring:
          'Correct hypocalcemia before treatment; monitor calcium especially in severe renal impairment or dialysis. Review cardiovascular history before initiation.',
      interactions:
          'No routine meal-spacing interaction is central; the major counseling issue is cardiovascular risk assessment and calcium status.',
      commonMistakes:
          'Thinking one syringe is the full dose, continuing past 12 monthly doses, shaking/warming the syringes, or restarting the old calendar after a missed monthly dose instead of resetting from the rescheduled dose.',
      specialPopulations:
          'Do not initiate in patients who had myocardial infarction or stroke within the preceding year. Severe renal impairment/dialysis increases hypocalcemia risk.',
    ),
    sections: [
      MedicationSection(
        title: 'Two syringes = one monthly dose',
        body:
            'The complete 210 mg dose requires two consecutive injections from two 105 mg/1.17 mL syringes. Treatment is limited to 12 monthly doses.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Cardiovascular + missed-dose lock',
        body:
            'Do not initiate if MI or stroke occurred within the preceding year. If a dose is missed, administer as soon as it can be rescheduled, then schedule future monthly doses from that new date.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'علاج شهري لبناء العظم وتقليل الكسور عند بعض النساء بعد سن اليأس ذوات خطر الكسور المرتفع.',
      howToUseAr:
          'يعطى بواسطة مقدم الرعاية الصحية. الجرعة الكاملة ليست سرنجة واحدة؛ تحتاج حقنتين منفصلتين الواحدة بعد الأخرى.',
      timingAr:
          'مرة كل شهر ولمدة 12 جرعة شهرية فقط. إذا فات الموعد تُعطى الجرعة بأقرب موعد ممكن ثم يبدأ حساب الشهر من تاريخ الجرعة الجديدة.',
      importantAr:
          'أخبر الطبيب إذا أصبت بجلطة قلبية أو دماغية، خصوصًا خلال السنة الماضية. يجب تصحيح نقص الكالسيوم وتناول calcium/vitamin D حسب الخطة.',
      commonActionableAr:
          'قد يحدث ألم مفاصل/صداع أو ألم/احمرار مكان الحقن.',
      missedDoseAr:
          'رتب الجرعة بأقرب موعد ممكن؛ بعد إعطائها يكون موعد الشهر التالي محسوبًا من تاريخ الجرعة الجديدة.',
      storageAr:
          'عادةً تُحفظ السرنجات في الثلاجة داخل الكرتون. لا تُجمّد ولا تُرج. بعد إخراجها من الثلاجة تُترك 30 دقيقة على الأقل قبل الحقن ولا تُسخّن بطريقة أخرى.',
      seekHelpAr:
          'اطلب إسعافًا فورًا عند أعراض جلطة قلبية أو دماغية، وراجع عند تشنجات/تنميل أو أعراض نقص كالسيوم واضحة.',
      teachBackAr:
          'كم سرنجة تشكل الجرعة الكاملة؟ كم جرعة شهرية إجمالًا؟ وماذا يحدث للجدول إذا فات موعد شهر؟',
    ),
  ),
  Medication(
    id: 'zoledronic-acid-osteoporosis',
    familyId: 'bone-health',
    name: 'Zoledronic Acid 5 mg/100 mL (Osteoporosis)',
    subtitle: 'IV bisphosphonate · renal/hydration lock · ≥15-minute infusion',
    tags: ['Osteoporosis', 'Bisphosphonate', 'IV infusion', 'Annual'],
    aliases: ['Reclast-type 5 mg/100 mL', 'Zoledronic acid osteoporosis'],
    sourceLabel:
        'DailyMed · Zoledronic Acid Injection 5 mg/100 mL · effective Sep 10, 2026',
    useProfile: MedicationUseProfile(
      route:
          'Ready-to-use 5 mg/100 mL intravenous formulation for osteoporosis/Paget-type labeled use. Osteoporosis treatment regimens use clinician-administered infusions rather than patient self-injection.',
      foodTiming:
          'Not meal-related. Patients should be appropriately hydrated before administration unless another clinical condition limits fluids.',
      duration:
          'Indication-specific. Osteoporosis treatment commonly uses 5 mg once yearly; prevention may use once every 2 years. Optimal total duration is not fixed and should be periodically reassessed.',
      formulationHandling:
          'Infuse intravenously over no less than 15 minutes. Check serum creatinine and calculate creatinine clearance before each dose. This osteoporosis 5 mg/100 mL formulation must not be confused with oncology zoledronic-acid regimens/products.',
      monitoring:
          'Renal function before each dose, calcium/vitamin D adequacy and dental/jaw risk. Correct hypocalcemia before therapy.',
      interactions:
          'Nephrotoxic medicines and dehydration increase renal risk. Calcium/vitamin D adequacy is clinically important.',
      commonMistakes:
          'Giving during dehydration, infusing faster than 15 minutes, ignoring CrCl, confusing osteoporosis and oncology zoledronic-acid regimens, or mistaking the expected short acute-phase reaction for allergy.',
      specialPopulations:
          'Contraindicated when creatinine clearance is below 35 mL/min or with acute renal impairment, and in hypocalcemia.',
    ),
    sections: [
      MedicationSection(
        title: 'Renal + hydration lock',
        body:
            'Before every dose: obtain serum creatinine and calculate Cockcroft-Gault CrCl using actual body weight. Do not give if CrCl <35 mL/min or acute renal impairment is present. Correct dehydration first.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Infusion + acute-phase reaction',
        body:
            '5 mg/100 mL must infuse over at least 15 minutes. Fever, flu-like symptoms, myalgia, arthralgia and headache commonly occur within the first 3 days and usually improve over several days; acetaminophen after infusion can reduce these symptoms when appropriate.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'دواء وريدي لهشاشة العظام يقلل خطر الكسور ويُعطى على فترات طويلة حسب الاستطباب.',
      howToUseAr:
          'يعطى في العيادة/المستشفى كتسريب وريدي، وليس حقنة منزلية. التسريب يجب ألا يكون أسرع من 15 دقيقة.',
      timingAr:
          'لعلاج هشاشة العظام يكون غالبًا مرة سنويًا، بينما الوقاية قد تكون كل سنتين؛ اتبع خطة الطبيب لنفس الاستطباب.',
      importantAr:
          'قبل الجرعة يجب فحص وظائف الكلى والتأكد من عدم وجود جفاف أو نقص كالسيوم. أخبر الفريق عن مشاكل الأسنان/الفك والإجراءات السنية المخطط لها.',
      commonActionableAr:
          'بعد الجرعة الأولى قد تظهر حرارة أو آلام عضلات/مفاصل أو أعراض تشبه الإنفلونزا خلال أول 3 أيام؛ غالبًا تتحسن خلال أيام، ويمكن أن يساعد paracetamol إذا كان مناسبًا لك.',
      missedDoseAr:
          'إذا فات موعد التسريب اتصل بالعيادة لإعادة الجدولة؛ لا توجد جرعة منزلية لتعويضها.',
      seekHelpAr:
          'راجع عند قلة بول/جفاف شديد، تشنجات أو تنميل شديد، ألم فك مستمر أو جرح فم لا يلتئم، أو ألم جديد مستمر بالفخذ/الأربية.',
      teachBackAr:
          'ما الفحوص المهمة قبل التسريب؟ وما أقل مدة للتسريب؟ وما الأعراض المتوقعة أول أيام بعد الجرعة؟',
    ),
  ),
];
