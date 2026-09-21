import '../models/medication.dart';

const expandedMedications7 = <Medication>[
  Medication(
    id: 'insulin-degludec-tresiba',
    familyId: 'diabetes-endocrine',
    name: 'Insulin Degludec (TRESIBA)',
    subtitle: 'Ultra-long-acting basal insulin · U-100 / U-200 FlexTouch',
    tags: ['Diabetes', 'Basal insulin', 'FlexTouch', 'U-100', 'U-200', 'High alert'],
    aliases: ['Tresiba', 'Insulin degludec'],
    hasVisualGuide: true,
    useProfile: MedicationUseProfile(
      route:
          'Subcutaneous basal insulin. TRESIBA U-100 is available as FlexTouch and vial; U-200 is FlexTouch only.',
      foodTiming:
          'Not meal-linked. Adults inject once daily at any time of day. Pediatric patients use once daily at the same time every day.',
      duration:
          'Chronic basal insulin therapy when clinically indicated.',
      formulationHandling:
          'FlexTouch U-100 dials 1-unit increments up to 80 units per injection. FlexTouch U-200 dials 2-unit increments up to 160 units per injection. The dose window shows actual insulin units; DO NOT perform dose conversion. Prime the FlexTouch with 2 units before each injection and keep the needle in the skin after the counter returns to 0 while slowly counting to 6.',
      monitoring:
          'Glucose/CGM, hypoglycemia frequency, injection sites, changes in food/activity/illness, and insulin-regimen changes.',
      interactions:
          'Other glucose-lowering medicines and changes in meals, exercise, alcohol, renal/hepatic function or illness can change hypoglycemia risk.',
      commonMistakes:
          'Confusing U-100 and U-200, converting the displayed dose, withdrawing insulin from a U-200 pen with a syringe, skipping priming, removing the needle before the 6-count, or storing a pen with the needle attached.',
      specialPopulations:
          'For an adult missed dose, current labeling allows the daily dose during waking hours once remembered, provided at least 8 hours separate consecutive injections. Pediatric patients with a missed dose should contact the healthcare provider and monitor glucose more frequently until the next scheduled dose.',
    ),
    sourceLabel:
        'DailyMed · TRESIBA (insulin degludec) U-100/U-200 FlexTouch and U-100 vial · current U.S. label/IFU',
    sections: [
      MedicationSection(
        title: 'Concentration lock',
        body:
            'U-100 and U-200 FlexTouch pens both display the actual number of insulin units. Never convert the dose. U-100 delivers 1-unit increments up to 80 units; U-200 delivers 2-unit increments up to 160 units.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'FlexTouch technique',
        body:
            'New needle → prime 2 units → dial the prescribed units → inject → keep the button depressed after the dose counter returns to 0 and slowly count to 6 before removing the needle.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'إنسولين قاعدي طويل جدًا يساعد على ضبط السكر بين الوجبات وخلال اليوم والليل.',
      howToUseAr:
          'تأكد قبل كل جرعة هل قلمك U-100 أو U-200. ركّب إبرة جديدة، اعمل prime بمقدار 2 units، اضبط عدد الوحدات الموصوف نفسه بدون أي تحويل، وبعد أن يعود العداد إلى 0 اترك الإبرة داخل الجلد وعد ببطء إلى 6.',
      timingAr:
          'للبالغين يُستخدم مرة يوميًا ويمكن أن يكون في أي وقت من اليوم حسب الخطة. للأطفال يُستخدم مرة يوميًا في نفس الوقت كل يوم.',
      importantAr:
          'لا تسحب الإنسولين من قلم U-200 بسرنجة، ولا تحوّل الجرعة بين U-100 وU-200؛ رقم الوحدات الظاهر على القلم هو الجرعة الفعلية.',
      commonActionableAr:
          'هبوط السكر هو أهم مشكلة. تعرّف على الرجفة والتعرق والجوع والدوخة واحمل مصدر سكر سريع حسب خطتك.',
      missedDoseAr:
          'للبالغ: إذا نسيت الجرعة يمكن أخذها خلال ساعات الاستيقاظ عند التذكر مع التأكد من وجود 8 ساعات على الأقل بين جرعتين. للطفل: تواصل مع الفريق المعالج بدل تعويض الجرعة من نفسك.',
      storageAr:
          'قبل الاستخدام يُحفظ عادة في الثلاجة 2–8°C. القلم أو الفيال الجاري استخدامه يمكن حفظه مبردًا أو بدرجة حرارة الغرفة حتى 30°C ويُتلف بعد 56 يومًا. لا تجمّده.',
      seekHelpAr:
          'اطلب مساعدة عاجلة عند هبوط شديد مع فقدان وعي أو تشنج، أو عند ارتفاع شديد مستمر للسكر مع أعراض مرض حاد.',
      teachBackAr:
          'إذا كان قلمك U-200 وجرعتك 40 units، ماذا ستضبط على العداد؟ وكم ثانية ستبقي الإبرة بعد رجوع العداد إلى 0؟',
    ),
  ),
  Medication(
    id: 'humulin-n-nph',
    familyId: 'diabetes-endocrine',
    name: 'HUMULIN N (NPH Insulin)',
    subtitle: 'U-100 intermediate-acting cloudy insulin · vial / KwikPen',
    tags: ['Diabetes', 'NPH', 'Cloudy insulin', 'KwikPen', 'U-100', 'High alert'],
    aliases: ['Humulin N', 'NPH insulin', 'Insulin isophane human'],
    hasVisualGuide: true,
    useProfile: MedicationUseProfile(
      route:
          'Subcutaneous intermediate-acting insulin isophane human, U-100, supplied as vial and KwikPen.',
      foodTiming:
          'Timing and frequency depend on the insulin regimen and meal pattern; do not auto-schedule without the prescribed plan.',
      duration:
          'Chronic insulin therapy when clinically indicated.',
      formulationHandling:
          'HUMULIN N is a suspension. Before every dose, gently roll the vial or pen 10 times and invert it 10 times until uniformly white and cloudy. Do not shake vigorously. For KwikPen, mix before attaching the needle, prime with 2 units before each injection, and hold the dose knob in while slowly counting to 5 before removing the needle.',
      monitoring:
          'Glucose/CGM, hypoglycemia, injection sites, meal pattern and whether the suspension is mixed uniformly before dosing.',
      interactions:
          'Meal timing, exercise, alcohol, illness and other glucose-lowering medicines can substantially change hypoglycemia risk.',
      commonMistakes:
          'Using the insulin without resuspending it, shaking hard, accepting a clear/lumpy appearance, attaching the pen needle before mixing, skipping the 2-unit prime, removing the needle before the 5-count, or confusing NPH with clear regular insulin.',
      specialPopulations:
          'Patients with visual/dexterity limitations may need caregiver assistance. Current labeling supports adult and pediatric patients with diabetes mellitus.',
    ),
    sourceLabel:
        'DailyMed · HUMULIN N (insulin isophane human) U-100 vial / KwikPen · updated Dec 2025; IFU revised Nov 2025',
    sections: [
      MedicationSection(
        title: 'Cloudy-insulin preparation lock',
        body:
            'Roll gently 10 times and invert 10 times before every dose. It should look uniformly white and cloudy. Do not use it if clear, lumpy, particulate or not uniformly mixed.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'KwikPen lock',
        body:
            'Mix before attaching the needle. Prime with 2 units before each injection. After pressing the dose button, keep it depressed and slowly count to 5 before removing the needle.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'إنسولين متوسط المفعول يُستخدم ضمن خطة السكري لتغطية الاحتياج القاعدي خلال جزء من اليوم أو الليل.',
      howToUseAr:
          'قبل كل جرعة لف القلم أو الفيال بلطف بين اليدين 10 مرات ثم اقلبه للأعلى والأسفل 10 مرات حتى يصبح أبيض وعكرًا بشكل متجانس. إذا كان KwikPen، امزجه قبل تركيب الإبرة، ثم اعمل prime بـ2 units.',
      timingAr:
          'وقت الجرعة وعدد المرات يعتمدان على خطتك والوجبات؛ لا تغيّر التوقيت من نفسك لأن NPH قد يسبب هبوط السكر في أوقات مختلفة.',
      importantAr:
          'هذا الإنسولين يجب أن يكون عكرًا بعد الخلط. لا تستخدمه إذا بقي صافيًا أو فيه كتل أو جسيمات.',
      commonActionableAr:
          'هبوط السكر قد يسبب رجفة أو تعرقًا أو جوعًا أو دوخة. افحص السكر وعالج الهبوط حسب الخطة.',
      missedDoseAr:
          'لا تضاعف جرعة NPH لتعويض جرعة منسية. اتبع خطة missed-dose الخاصة بك أو تواصل مع الفريق المعالج لأن القرار يعتمد على وقت الجرعة والوجبات والسكر الحالي.',
      storageAr:
          'قلم HUMULIN N الجاري استخدامه يحفظ بدرجة حرارة الغرفة حتى 30°C ويُتلف بعد 14 يومًا ولا يعاد للثلاجة. الفيال المفتوح يمكن حفظه مبردًا أو بدرجة الغرفة ويُتلف بعد 31 يومًا.',
      seekHelpAr:
          'اطلب مساعدة عاجلة عند هبوط شديد مع فقدان الوعي أو تشنج، أو إذا لم تستطع الأكل مع استمرار الجرعات المعتادة دون خطة مرض.',
      teachBackAr:
          'أرني كيف ستخلط NPH قبل الجرعة: كم مرة roll وكم مرة invert؟ وما الشكل الصحيح للسائل قبل الحقن؟',
    ),
  ),
  Medication(
    id: 'humulin-r-u100',
    familyId: 'diabetes-endocrine',
    name: 'HUMULIN R U-100 (Regular Insulin)',
    subtitle: 'U-100 short-acting human insulin · vial',
    tags: ['Diabetes', 'Regular insulin', 'U-100', 'Mealtime', 'Vial', 'High alert'],
    aliases: ['Humulin R', 'Regular insulin', 'Regular human insulin U-100'],
    hasVisualGuide: true,
    useProfile: MedicationUseProfile(
      route:
          'Subcutaneous short-acting human insulin U-100 from a vial for outpatient use; IV use is a separate medically supervised pathway.',
      foodTiming:
          'For subcutaneous use, inject approximately 30 minutes before a meal.',
      duration:
          'Chronic insulin therapy when clinically indicated.',
      formulationHandling:
          'Use only if clear and colorless. For vial administration, use a U-100 insulin syringe. Do not confuse U-100 with HUMULIN R U-500. If a clinician has specifically prescribed mixing with HUMULIN N, follow the exact taught mixing procedure; do not improvise mixing with other insulins.',
      monitoring:
          'Glucose/CGM, meal timing, hypoglycemia, injection sites and correct U-100 syringe selection.',
      interactions:
          'Skipped/delayed meals, exercise, alcohol, acute illness and other glucose-lowering medicines alter hypoglycemia risk.',
      commonMistakes:
          'Injecting then delaying/skipping the meal, using the wrong syringe, confusing U-100 with U-500, using cloudy/discolored regular insulin, or changing a prescribed mixing regimen independently.',
      specialPopulations:
          'Current labeling supports adults and pediatric patients with diabetes mellitus. Dose selection and IV use remain medical decisions.',
    ),
    sourceLabel:
        'DailyMed · HUMULIN R (insulin human) U-100 vial · current listed U.S. label; subcutaneous dose approximately 30 min before meals',
    sections: [
      MedicationSection(
        title: 'U-100 / meal lock',
        body:
            'HUMULIN R U-100 is clear regular insulin. Use a U-100 insulin syringe for vial dosing and inject the prescribed subcutaneous dose approximately 30 minutes before the meal.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Concentration confusion',
        body:
            'HUMULIN R U-100 and HUMULIN R U-500 are not interchangeable concentration presentations. Always verify the label and syringe/device before drawing or injecting.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'إنسولين بشري قصير المفعول لتغطية ارتفاع السكر حول الوجبات حسب الخطة.',
      howToUseAr:
          'تأكد أن الفيال مكتوب عليه U-100 وأن الإنسولين صافي وعديم اللون. استخدم U-100 insulin syringe فقط للجرعة الموصوفة وبدّل مكان الحقن.',
      timingAr:
          'HUMULIN R U-100 تحت الجلد يُعطى عادة قبل الوجبة بحوالي 30 دقيقة؛ لا تحقن ثم تؤخر أو تلغي الوجبة بدون خطة واضحة.',
      importantAr:
          'لا تخلطه مع U-500 ولا تستخدم سرنجة خاطئة. إذا كانت لديك خطة محددة لخلطه مع NPH فاتبع الطريقة التي علّمك إياها الصيدلي/الطبيب فقط.',
      commonActionableAr:
          'راقب هبوط السكر خصوصًا إذا تأخرت الوجبة أو زاد النشاط البدني.',
      missedDoseAr:
          'لا تعطِ جرعة تعويضية تلقائيًا إذا فات موعد regular insulin؛ القرار يعتمد على الوجبة والسكر الحالي وخطتك التصحيحية.',
      storageAr:
          'الفيال المفتوح يمكن حفظه في الثلاجة أو بدرجة حرارة الغرفة حتى 30°C ويُتلف بعد 31 يومًا. لا تجمّده واحمه من الحرارة والضوء.',
      seekHelpAr:
          'اطلب مساعدة عاجلة عند هبوط شديد أو عند إعطاء تركيز/جرعة خاطئة من الإنسولين.',
      teachBackAr:
          'ما التركيز المكتوب على الفيال؟ أي نوع سرنجة ستستخدم؟ وكم قبل الوجبة ستأخذ الجرعة الموصوفة؟',
    ),
  ),
  Medication(
    id: 'humulin-70-30',
    familyId: 'diabetes-endocrine',
    name: 'HUMULIN 70/30',
    subtitle: 'Fixed premix: 70% NPH + 30% regular human insulin · U-100',
    tags: ['Diabetes', 'Premixed insulin', 'NPH', 'Regular insulin', 'U-100', 'High alert'],
    aliases: ['Humulin 70/30', 'Human insulin 70/30'],
    hasVisualGuide: true,
    useProfile: MedicationUseProfile(
      route:
          'Subcutaneous fixed-ratio U-100 premix containing 70% insulin isophane human (NPH) and 30% regular human insulin; vial and KwikPen.',
      foodTiming:
          'Inject approximately 30–45 minutes before a meal according to the prescribed regimen.',
      duration:
          'Chronic insulin therapy when clinically indicated.',
      formulationHandling:
          'This is a white, cloudy suspension. Before each dose, gently roll 10 times and invert 10 times until uniformly mixed. KwikPen: mix before needle attachment, prime with 2 units before each injection, then hold the dose knob in and slowly count to 5 before removing the needle. Do not mix HUMULIN 70/30 with other insulins or diluents.',
      monitoring:
          'Glucose/CGM, hypoglycemia, meal consistency, injection sites and whether the premix is uniformly resuspended.',
      interactions:
          'Meal timing/content, exercise, alcohol, illness and other glucose-lowering medicines change hypoglycemia risk.',
      commonMistakes:
          'Treating it like clear insulin, skipping resuspension, injecting too close to or after a delayed meal, trying to independently change the 70/30 components, or mixing it with another insulin.',
      specialPopulations:
          'The 70:30 ratio is fixed, so basal and prandial components cannot be adjusted independently. Current U.S. labeling is for adults with diabetes mellitus.',
    ),
    sourceLabel:
        'DailyMed · HUMULIN 70/30 U-100 vial / KwikPen · updated Jun 2026',
    sections: [
      MedicationSection(
        title: 'Fixed-ratio lock',
        body:
            '70% NPH + 30% regular insulin is a fixed premix. The basal and meal components cannot be adjusted separately. Do not mix with another insulin or diluent.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Preparation + meal lock',
        body:
            'Roll 10 times + invert 10 times until uniformly white/cloudy. KwikPen prime = 2 units and hold = slow count to 5. Give the prescribed dose about 30–45 minutes before the planned meal.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'إنسولين مخلوط جاهز يحتوي 70% NPH و30% regular لتغطية جزء قاعدي وجزء مرتبط بالوجبة.',
      howToUseAr:
          'قبل كل جرعة لف القلم/الفيال بلطف 10 مرات ثم اقلبه 10 مرات حتى يصبح أبيض وعكرًا بشكل متجانس. في KwikPen اعمل prime بـ2 units، وبعد الحقن أبقِ الزر مضغوطًا وعد ببطء إلى 5.',
      timingAr:
          'يُحقن عادة قبل الوجبة بحوالي 30–45 دقيقة حسب الخطة، لذلك لا تحقن ثم تؤخر الوجبة.',
      importantAr:
          'النسبة 70/30 ثابتة؛ لا يمكنك زيادة جزء الوجبة وحده أو الجزء القاعدي وحده. لا تخلطه مع إنسولين آخر.',
      commonActionableAr:
          'عدم انتظام الوجبات يزيد خطر هبوط السكر. احمل مصدر سكر سريع واتبع خطة علاج الهبوط.',
      missedDoseAr:
          'لا تعوض الجرعة تلقائيًا ولا تأخذ جرعتين معًا. افحص السكر واتبع خطة missed-dose لأن القرار يعتمد على موعد الوجبة والجرعة التالية.',
      storageAr:
          'KwikPen الجاري استخدامه يحفظ بدرجة حرارة الغرفة حتى 30°C ويُتلف بعد 10 أيام ولا يعاد للثلاجة. الفيال المفتوح يُتلف بعد 31 يومًا.',
      seekHelpAr:
          'اطلب مساعدة عاجلة عند هبوط شديد، أو إذا أُخذت الجرعة ثم تعذر تناول الوجبة ولم تكن لديك خطة واضحة.',
      teachBackAr:
          'كم مرة ستعمل roll وinvert؟ ومتى بالنسبة للوجبة ستأخذ الجرعة؟ وهل يمكن تغيير نسبة 70/30 أو خلطها مع إنسولين آخر؟',
    ),
  ),
  Medication(
    id: 'humulin-r-u500',
    familyId: 'diabetes-endocrine',
    name: 'HUMULIN R U-500',
    subtitle: 'Highly concentrated regular human insulin · 500 units/mL',
    tags: ['Diabetes', 'Concentrated insulin', 'U-500', 'KwikPen', 'High alert'],
    aliases: ['Humulin R U-500', 'U-500 insulin'],
    hasVisualGuide: true,
    useProfile: MedicationUseProfile(
      route:
          'Highly concentrated subcutaneous regular human insulin containing 500 units/mL, five times the concentration of U-100. Current labeling is for patients who require more than 200 units of insulin per day.',
      foodTiming:
          'Usually injected two or three times daily approximately 30 minutes before meals, exactly as prescribed.',
      duration:
          'Chronic insulin therapy in patients requiring highly concentrated insulin.',
      formulationHandling:
          'KwikPen: dose window shows actual insulin units; no conversion is required. It dials in 5-unit increments, up to 300 units per injection; prime with 5 units before each injection and hold the dose knob in while slowly counting to 5 before removing the needle. NEVER transfer insulin from the U-500 KwikPen into a syringe. If using the U-500 vial presentation, use ONLY a dedicated U-500 insulin syringe and no dose conversion; never use a U-100, tuberculin or allergy syringe.',
      monitoring:
          'Frequent glucose/CGM review during initiation or regimen changes, hypoglycemia, injection sites, exact concentration/device verification and meal timing.',
      interactions:
          'Meal timing, activity, illness, alcohol and other glucose-lowering drugs may substantially change hypoglycemia risk.',
      commonMistakes:
          'Confusing U-500 with U-100, counting pen clicks instead of reading the dose window, converting the prescribed units, transferring pen insulin into a syringe, using a U-100 syringe with a U-500 vial, mixing/diluting U-500, or delaying/skipping a meal after dosing.',
      specialPopulations:
          'Because severe dosing errors can be life-threatening, new starts, conversions and dose changes require close clinician/pharmacist supervision and return-demonstration.',
    ),
    sourceLabel:
        'DailyMed · HUMULIN R U-500 (insulin human) 500 units/mL · U.S. prescribing information revised Jul 2026; vial and KwikPen IFU',
    sections: [
      MedicationSection(
        title: 'Five-times-concentrated lock',
        body:
            'U-500 contains 500 units/mL — five times the insulin concentration of U-100. Always verify “U-500” before every injection. Do not dilute or mix it with another insulin.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Device/syringe lock',
        body:
            'KwikPen: dial the prescribed insulin units directly, no conversion, no click-counting, never withdraw with a syringe. Vial: use ONLY a dedicated U-500 insulin syringe; never use a U-100/tuberculin/allergy syringe.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'إنسولين شديد التركيز للمرضى الذين يحتاجون كميات إنسولين كبيرة؛ يحتوي 500 units في كل mL.',
      howToUseAr:
          'تحقق من كلمة U-500 قبل كل جرعة. إذا تستخدم KwikPen اضبط عدد الوحدات الموصوف مباشرة من نافذة الجرعة بدون أي تحويل ولا تعدّ الـclicks؛ اعمل prime بـ5 units ثم بعد الحقن عد ببطء إلى 5 قبل إخراج الإبرة. لا تسحب الإنسولين من القلم بسرنجة.',
      timingAr:
          'يُعطى عادة مرتين أو ثلاث مرات يوميًا قبل الوجبة بحوالي 30 دقيقة، حسب الوصفة فقط.',
      importantAr:
          'U-500 أقوى تركيزًا بخمس مرات من U-100. إذا كان لديك فيال U-500 استخدم فقط U-500 insulin syringe المخصصة؛ استخدام U-100 syringe قد يؤدي إلى جرعة زائدة خطرة جدًا.',
      commonActionableAr:
          'هبوط السكر قد يكون شديدًا وممتدًا. احمل مصدر سكر سريع وخطة glucagon إذا وُصفت لك، وتأكد أن العائلة تعرف التركيز الذي تستخدمه.',
      missedDoseAr:
          'لا تضاعف أو تحسب جرعة تعويضية من نفسك. افحص السكر واتبع خطة الفريق المعالج لأن U-500 عالي التركيز وجدوله مرتبط بالوجبات.',
      storageAr:
          'KwikPen الجاري استخدامه يحفظ بدرجة حرارة الغرفة حتى 30°C ويُتلف بعد 28 يومًا ولا يعاد للثلاجة. الفيال المفتوح يمكن حفظه مبردًا أو بدرجة الغرفة حتى 30°C ويُتلف بعد 40 يومًا.',
      seekHelpAr:
          'إذا أخذت تركيزًا أو جرعة خاطئة، أو ظهر هبوط شديد/متكرر، اطلب المساعدة فورًا واذكر بوضوح أنك تستخدم HUMULIN R U-500.',
      teachBackAr:
          'ما الفرق بين U-500 وU-100؟ هل تحتاج لتحويل الجرعة على KwikPen؟ وإذا كان لديك فيال U-500، أي سرنجة فقط مسموحة؟',
    ),
  ),
];
