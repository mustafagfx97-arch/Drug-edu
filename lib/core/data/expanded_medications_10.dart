import '../models/medication.dart';

const expandedMedications10 = <Medication>[
  Medication(
    id: 'mesalamine-lialda',
    familyId: 'gastrointestinal',
    name: 'Mesalamine (LIALDA)',
    subtitle: '1.2 g delayed-release tablet · once-daily UC induction/maintenance',
    tags: ['Ulcerative colitis', 'Mesalamine', 'Delayed release', 'LIALDA'],
    aliases: ['Lialda', 'Mesalamine 1.2 g'],
    useProfile: MedicationUseProfile(
      route:
          'Oral delayed-release mesalamine 1.2 g tablets for induction and maintenance of remission in ulcerative colitis.',
      foodTiming:
          'Take once daily with food. Drink adequate fluids during treatment.',
      duration:
          'Induction and maintenance schedules differ; maintenance may be long term while clinically appropriate.',
      formulationHandling:
          'Swallow tablets whole. Do not split or crush. Do not substitute other mesalamine formulations by milligram-for-milligram assumption because release characteristics and labeled schedules differ.',
      monitoring:
          'Renal function before treatment and periodically; response, hydration, kidney-stone symptoms, and mesalamine intolerance syndrome.',
      interactions:
          'Nephrotoxic agents such as NSAIDs can increase renal risk. Azathioprine/6-mercaptopurine can increase blood-dyscrasia risk.',
      commonMistakes:
          'Taking it fasting, splitting/crushing the delayed-release tablet, or switching to another mesalamine product without checking formulation and schedule.',
      specialPopulations:
          'Current labeling includes adults and pediatric patients weighing at least 24 kg who can swallow tablets whole; pediatric dose selection remains weight- and phase-specific.',
    ),
    sourceLabel:
        'DailyMed · LIALDA mesalamine delayed-release tablets · updated Mar 2026',
    sections: [
      MedicationSection(
        title: 'Food + formulation lock',
        body:
            'LIALDA 1.2 g delayed-release tablets are taken once daily with food and swallowed whole. Do not split or crush.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Not interchangeable',
        body:
            'Mesalamine products differ in release technology, indication and schedule. Do not substitute APRISO/PENTASA/other delayed-release products solely by matching total milligrams.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يُستخدم لعلاج ulcerative colitis وللمحافظة على الهدأة حسب الخطة.',
      howToUseAr:
          'ابتلع حبة LIALDA كاملة ولا تقسّمها أو تسحقها. خذها مع الطعام واشرب سوائل كافية.',
      timingAr:
          'تُؤخذ مرة يوميًا حسب الجرعة الموصوفة، مع الطعام.',
      importantAr:
          'لا تبدّلها مع mesalamine آخر من نفسك حتى لو كان مجموع الـmg متشابهًا؛ طريقة التحرر والجدول قد تختلف.',
      commonActionableAr:
          'قد يحدث صداع أو ألم بطن. إذا زاد الإسهال/ألم البطن فجأة مع حرارة أو صداع بعد بدء الدواء تواصل مع الطبيب لاحتمال عدم تحمل mesalamine.',
      missedDoseAr:
          'خذ الجرعة عند التذكر إذا لم يقترب موعد التالية؛ لا تضاعف.',
      storageAr:
          'احفظه بدرجة حرارة الغرفة وفي العبوة الأصلية بعيدًا عن الرطوبة.',
      seekHelpAr:
          'اطلب تقييمًا عند قلة البول/تورم واضح، ألم شديد بالخاصرة أو دم بالبول، أو تحسس شديد.',
      teachBackAr:
          'هل LIALDA تؤخذ مع الطعام أم بدونه؟ وهل تستطيع تقسيم الحبة أو تبديلها بمنتج mesalamine آخر بنفس عدد الـmg؟',
    ),
  ),
  Medication(
    id: 'mesalamine-apriso',
    familyId: 'gastrointestinal',
    name: 'Mesalamine (APRISO)',
    subtitle: '0.375 g extended-release capsule · morning maintenance regimen',
    tags: ['Ulcerative colitis', 'Mesalamine', 'Extended release', 'APRISO'],
    aliases: ['Apriso', 'Mesalamine ER 0.375 g'],
    useProfile: MedicationUseProfile(
      route:
          'Oral extended-release mesalamine capsules for maintenance of remission of ulcerative colitis in adults.',
      foodTiming:
          'Take once daily in the morning without regard to meals. Drink adequate fluids.',
      duration:
          'Maintenance therapy; typically continued while remission-maintenance benefit remains appropriate.',
      formulationHandling:
          'Swallow capsules whole. Do not cut, break, crush or chew. Avoid co-administration with antacids.',
      monitoring:
          'Renal function before treatment and periodically as clinically appropriate; hydration, kidney-stone symptoms and disease control.',
      interactions:
          'Avoid antacids with APRISO because altered gastric pH can affect release. Nephrotoxic drugs and thiopurines require additional review.',
      commonMistakes:
          'Opening/crushing the capsule, taking antacids with the dose, or using APRISO for induction as though it were interchangeable with LIALDA/PENTASA.',
      specialPopulations:
          'Current U.S. labeling is adult maintenance of remission; do not infer pediatric or induction dosing from other mesalamine products.',
    ),
    sourceLabel:
        'DailyMed · APRISO mesalamine extended-release capsules · updated Aug 2026',
    sections: [
      MedicationSection(
        title: 'Morning maintenance lock',
        body:
            'APRISO is labeled for maintenance of remission in adults. Current labeled regimen is once daily in the morning; this is not the same role or schedule as all other oral mesalamine products.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Capsule + antacid lock',
        body:
            'Swallow whole; do not cut, break, crush or chew. Avoid co-administration with antacids.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يُستخدم للمحافظة على هدوء ulcerative colitis عند البالغين.',
      howToUseAr:
          'ابتلع الكبسولات كاملة صباحًا. لا تفتحها أو تسحقها أو تمضغها، واشرب سوائل كافية.',
      timingAr:
          'مرة يوميًا صباحًا ويمكن مع الطعام أو بدونه.',
      importantAr:
          'تجنب antacids مع APRISO، ولا تبدله بمنتج mesalamine آخر من نفسك لأن طريقة التحرر والاستعمال مختلفان.',
      commonActionableAr:
          'قد يحدث صداع أو ألم بطن أو إسهال خفيف.',
      missedDoseAr:
          'خذ الجرعة عند التذكر إذا لم يقترب موعد جرعة اليوم التالي؛ لا تضاعف.',
      storageAr:
          'احفظه بدرجة حرارة الغرفة وبعيدًا عن الرطوبة.',
      seekHelpAr:
          'راجع الطبيب عند تدهور واضح في أعراض القولون، قلة البول/تورم، ألم خاصرة أو تحسس شديد.',
      teachBackAr:
          'متى تأخذ APRISO؟ وهل يمكن فتح الكبسولة أو أخذ antacid معها؟',
    ),
  ),
  Medication(
    id: 'mesalamine-pentasa',
    familyId: 'gastrointestinal',
    name: 'Mesalamine (PENTASA)',
    subtitle: '250/500 mg extended-release capsule · may be opened onto applesauce/yogurt',
    tags: ['Ulcerative colitis', 'Mesalamine', 'Extended release', 'PENTASA'],
    aliases: ['Pentasa'],
    useProfile: MedicationUseProfile(
      route:
          'Oral extended-release capsules for induction of remission and treatment of mildly to moderately active ulcerative colitis in adults.',
      foodTiming:
          'Use on the prescribed four-times-daily schedule; drink adequate fluids.',
      duration:
          'Induction/active-treatment course is clinician-directed and differs from maintenance-only mesalamine products.',
      formulationHandling:
          'Swallow capsules whole without crushing or chewing. Alternatively, the capsule may be opened and the entire contents sprinkled onto applesauce or yogurt and consumed immediately. Do not crush or chew the beads.',
      monitoring:
          'Renal function before treatment and periodically; disease response, hydration, nephrolithiasis symptoms and blood counts in higher-risk patients using thiopurines.',
      interactions:
          'Nephrotoxic drugs increase renal risk; azathioprine/6-mercaptopurine increase risk of blood dyscrasias.',
      commonMistakes:
          'Crushing the beads after opening, saving a sprinkled mixture for later, or assuming PENTASA has the same once-daily schedule as LIALDA/APRISO.',
      specialPopulations:
          'Current branded U.S. labeling is for adults; do not extrapolate pediatric regimens from other mesalamine products.',
    ),
    sourceLabel:
        'DailyMed · PENTASA mesalamine extended-release capsules · current label',
    sections: [
      MedicationSection(
        title: 'Open-capsule exception',
        body:
            'PENTASA may be opened and the entire capsule contents sprinkled on applesauce or yogurt, then consumed immediately. The beads must not be crushed or chewed.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Schedule lock',
        body:
            'Current branded labeling uses 1 g four times daily. Do not convert this to once-daily dosing merely because other mesalamine products are once daily.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يُستخدم لعلاج ulcerative colitis النشط الخفيف إلى المتوسط عند البالغين.',
      howToUseAr:
          'يمكن ابتلاع الكبسولة كاملة. إذا كان البلع صعبًا يمكن فتحها ورش كل الحبيبات على applesauce أو yogurt ثم أكلها فورًا؛ لا تسحق أو تمضغ الحبيبات.',
      timingAr:
          'اتبع عدد الجرعات الموصوف بدقة؛ PENTASA ليست تلقائيًا مرة يوميًا مثل بعض منتجات mesalamine الأخرى.',
      importantAr:
          'اشرب سوائل كافية، ولا تحفظ خليط الحبيبات مع الطعام لوقت لاحق.',
      commonActionableAr:
          'قد يحدث ألم بطن أو غثيان أو صداع.',
      missedDoseAr:
          'لا تضاعف الجرعات؛ إذا فاتت جرعة اتبع جدولك المعتاد أو تعليمات الطبيب حسب قرب الجرعة التالية.',
      storageAr:
          'يحفظ بدرجة حرارة الغرفة وبعيدًا عن الرطوبة.',
      seekHelpAr:
          'تواصل عند ألم خاصرة/دم بالبول، انخفاض البول أو تورم، أو تدهور شديد مفاجئ بأعراض القولون.',
      teachBackAr:
          'إذا فتحت PENTASA، على ماذا يمكن رش الحبيبات؟ وهل يجوز سحقها أو حفظ الخليط لوقت لاحق؟',
    ),
  ),
  Medication(
    id: 'mesalamine-canasa-suppository',
    familyId: 'gastrointestinal',
    name: 'Mesalamine (CANASA) Suppository',
    subtitle: '1000 mg rectal suppository · ulcerative proctitis',
    tags: ['Ulcerative proctitis', 'Mesalamine', 'Rectal', 'Suppository'],
    aliases: ['Canasa'],
    hasVisualGuide: true,
    useProfile: MedicationUseProfile(
      route:
          'Rectal mesalamine 1000 mg suppository for mildly to moderately active ulcerative proctitis in adults.',
      foodTiming:
          'Use once daily at bedtime; food is not relevant.',
      duration:
          'Typical labeled course is 3 to 6 weeks. Safety/effectiveness beyond 6 weeks has not been established in the current label.',
      formulationHandling:
          'Do not cut or break. Empty the rectum if possible before use, unwrap with minimal handling, insert completely pointed end first, and retain for 1 to 3 hours or longer if possible.',
      monitoring:
          'Clinical response, renal function, hydration, local irritation and mesalamine intolerance.',
      interactions:
          'Nephrotoxic drugs and thiopurines require review similarly to oral mesalamine.',
      commonMistakes:
          'Cutting the suppository, inserting only partially, excessive handling until it melts, or using two suppositories together after a missed dose.',
      specialPopulations:
          'Current labeling is for adults. The suppository can stain direct-contact surfaces.',
    ),
    sourceLabel:
        'DailyMed · CANASA mesalamine suppository 1000 mg · current label',
    sections: [
      MedicationSection(
        title: 'Rectal technique lock',
        body:
            'Use at bedtime. Do not cut or break. Insert completely, pointed end first, and retain for 1–3 hours or longer if possible.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Course + missed dose',
        body:
            'Typical course is 3–6 weeks. If a dose is missed, use when remembered unless near the next dose; never use two suppositories at the same time.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'تحميلة mesalamine لعلاج ulcerative proctitis.',
      howToUseAr:
          'يفضل إفراغ المستقيم أولًا. افتح الغلاف مع أقل لمس ممكن، وأدخل التحميلة كاملة بالطرف المدبب أولًا. لا تقطعها أو تكسرها.',
      timingAr:
          'مرة يوميًا عند النوم، وحاول الاحتفاظ بها 1–3 ساعات أو أطول إن أمكن.',
      importantAr:
          'قد تلطخ الأسطح أو الملابس. لا تستخدم تحميلتين معًا لتعويض جرعة منسية.',
      commonActionableAr:
          'قد يحدث انزعاج موضعي بسيط أو رغبة بالتبرز في البداية.',
      missedDoseAr:
          'استخدمها عند التذكر إلا إذا اقترب موعد التالية؛ لا تستخدم تحميلتين في نفس الوقت.',
      storageAr:
          'احفظها تحت 25°C ويمكن تبريدها، وبعيدًا عن الحرارة والضوء والرطوبة.',
      seekHelpAr:
          'راجع الطبيب عند نزف شديد جديد، ألم شديد، تدهور واضح بالأعراض، أو تحسس شديد.',
      teachBackAr:
          'أي طرف يدخل أولًا؟ وهل يجوز قطع التحميلة؟ وكم ساعة تحاول الاحتفاظ بها؟',
    ),
  ),
  Medication(
    id: 'mesalamine-rowasa-enema',
    familyId: 'gastrointestinal',
    name: 'Mesalamine (ROWASA) Rectal Suspension',
    subtitle: '4 g/60 mL enema · bedtime distal UC therapy',
    tags: ['Distal ulcerative colitis', 'Mesalamine', 'Rectal enema', 'ROWASA'],
    aliases: ['Rowasa', 'Mesalamine rectal suspension'],
    hasVisualGuide: true,
    useProfile: MedicationUseProfile(
      route:
          'Rectal suspension enema 4 g/60 mL for active mild to moderate distal ulcerative colitis, proctosigmoiditis or proctitis in adults.',
      foodTiming:
          'Use once daily, preferably at bedtime; food is not relevant.',
      duration:
          'Typical labeled course is 3 to 6 weeks depending on symptoms and endoscopic findings.',
      formulationHandling:
          'Shake bottle well. Remove protective sheath. Lie on left side with lower leg extended and right leg flexed, or use knee-chest position. Insert tip gently toward the umbilicus, squeeze steadily, remain in position at least 30 minutes, and aim to retain overnight (approximately 8 hours).',
      monitoring:
          'Renal function, hydration, disease response, local tolerance and hypersensitivity.',
      interactions:
          'Nephrotoxic drugs and thiopurines require review. Standard ROWASA contains potassium metabisulfite; sulfite sensitivity matters.',
      commonMistakes:
          'Not shaking the suspension, incorrect body position, forcing the applicator, standing immediately after dosing, or discarding treatment after slight expected darkening without checking the product instructions.',
      specialPopulations:
          'Current labeling is for adults. Standard ROWASA contains sulfite; sfROWASA is a separate sulfite-free formulation and should not be assumed identical for allergy counseling.',
    ),
    sourceLabel:
        'DailyMed · ROWASA mesalamine rectal suspension 4 g/60 mL · updated Aug 2026',
    sections: [
      MedicationSection(
        title: 'Enema technique lock',
        body:
            'Shake → left-side or knee-chest position → insert gently toward umbilicus → squeeze steadily → remain positioned at least 30 minutes → aim to retain overnight.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Sulfite formulation lock',
        body:
            'Standard ROWASA contains potassium metabisulfite. sfROWASA is a distinct sulfite-free product; do not collapse the two when counseling a sulfite-sensitive patient.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'حقنة شرجية mesalamine لعلاج التهاب القولون البعيد/proctosigmoiditis أو proctitis.',
      howToUseAr:
          'رج العبوة جيدًا. استلقِ على الجانب الأيسر مع ثني الرجل اليمنى للأمام أو استخدم وضعية knee-chest، أدخل الطرف بلطف باتجاه السرة، واضغط العبوة بثبات.',
      timingAr:
          'مرة يوميًا ويفضل قبل النوم. ابقَ في الوضعية 30 دقيقة على الأقل وحاول الاحتفاظ بالدواء طوال الليل (نحو 8 ساعات).',
      importantAr:
          'ROWASA الاعتيادي يحتوي sulfite؛ إذا لديك حساسية sulfite أخبر الصيدلي لأن sfROWASA منتج مختلف خالٍ من sulfite.',
      commonActionableAr:
          'قد يحدث انزعاج شرجي أو رغبة بالتبرز في البداية.',
      missedDoseAr:
          'لا تضاعف. استخدم الجرعة التالية حسب الجدول إذا اقترب موعدها.',
      storageAr:
          'يحفظ بدرجة 20–25°C. بعد فتح غلاف مجموعة العبوات استخدمها حسب التعليمات؛ تخلص من العبوة إذا أصبح المحتوى بنيًا غامقًا.',
      seekHelpAr:
          'اطلب مساعدة عند صفير/ضيق نفس أو تحسس، نزف شديد، ألم بطني شديد أو تدهور واضح.',
      teachBackAr:
          'هل ترج العبوة أولًا؟ ما الوضعية الصحيحة؟ وكم دقيقة تبقى في الوضعية وكم تحاول الاحتفاظ بالدواء؟',
    ),
  ),
];
