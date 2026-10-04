import '../models/medication.dart';

const expandedMedications27 = <Medication>[
  Medication(
    id: 'cefuroxime-axetil-suspension',
    familyId: 'antiinfective',
    name: 'Cefuroxime Axetil Oral Suspension',
    subtitle: 'Suspension · with food · not mg-for-mg interchangeable with tablets',
    tags: ['Antibiotic', 'Cephalosporin', 'Suspension', 'With food'],
    aliases: ['Cefuroxime suspension', 'Cefuroxime axetil suspension'],
    sourceLabel:
        'DailyMed · Cefuroxime axetil for oral suspension · current verified labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Reconstituted oral suspension. Concentrations and bottle sizes vary by product; verify the exact dispensed concentration before converting mg to mL.',
      foodTiming:
          'The verified suspension labeling requires administration with food.',
      duration:
          'Short infection-specific course; common labeled pediatric courses are 10 days, but duration remains indication-specific.',
      formulationHandling:
          'Shake well before every dose and measure with a calibrated oral syringe/device. Oral suspension is not bioequivalent to cefuroxime axetil tablets and must not be substituted milligram-for-milligram. Reconstitution water volume is product/bottle-specific.',
      monitoring:
          'Clinical response, allergy, significant diarrhea and renal function when clinically relevant.',
      interactions:
          'Acid-reducing therapy can lower cefuroxime axetil absorption; review clinically important interacting therapy and renal-dose needs.',
      commonMistakes:
          'Giving the suspension fasting, switching between tablet and suspension by matching milligrams, using a household spoon, forgetting to shake, or using unrefrigerated/expired reconstituted suspension.',
      specialPopulations:
          'Renal impairment can require dose adjustment. Verify age/weight and product concentration for pediatric dosing.',
    ),
    sections: [
      MedicationSection(
        title: 'Suspension ≠ tablet',
        body:
            'Cefuroxime axetil suspension is not bioequivalent to the tablet and is not substitutable mg-for-mg. Keep formulation identity locked during prescribing/dispensing.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Food + storage lock',
        body:
            'Give the suspension with food, shake well before every dose, refrigerate after reconstitution at 2–8°C, and discard after 10 days for the verified product label.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد حيوي من عائلة cephalosporins لعلاج عدوى بكتيرية محددة.',
      howToUseAr:
          'رجّ المعلق جيدًا قبل كل جرعة وقِس الكمية بسرنجة فموية أو أداة مدرجة. لا تبدل بين المعلق والحبوب بمجرد أن عدد الـmg متساوٍ.',
      timingAr: 'خذ المعلق مع الطعام وفي الفواصل المكتوبة لك.',
      importantAr:
          'المعلق ليس مكافئًا mg-for-mg للحبوب. احفظ المعلق المحضر في الثلاجة 2–8°C وتخلص منه بعد 10 أيام حسب هذا الملصق الموثق.',
      commonActionableAr:
          'قد يحدث غثيان أو إسهال خفيف. أخذه مع الطعام يساعد على التحمل.',
      missedDoseAr:
          'خذ الجرعة عند التذكر إذا لم يقترب موعد التالية؛ لا تضاعف جرعتين.',
      storageAr:
          'بعد التحضير: في الثلاجة 2–8°C، ورجّه قبل كل جرعة، وتخلص من المتبقي بعد 10 أيام وفق المنتج الموثق.',
      seekHelpAr:
          'اطلب المساعدة عند تحسس شديد أو إسهال مائي/دموي شديد أو تدهور واضح رغم العلاج.',
      teachBackAr:
          'هل ستأخذ المعلق مع الطعام؟ وهل يمكن استبداله بالحبوب بنفس عدد الـmg؟ وكم يبقى بعد التحضير؟',
    ),
  ),
  Medication(
    id: 'cefpodoxime-suspension',
    familyId: 'antiinfective',
    name: 'Cefpodoxime Proxetil Oral Suspension',
    subtitle: 'Suspension · food-flexible · tablet food rule differs',
    tags: ['Antibiotic', 'Cephalosporin', 'Suspension', 'Food independent'],
    aliases: ['Cefpodoxime suspension', 'Cefpodoxime proxetil suspension'],
    sourceLabel:
        'DailyMed · Cefpodoxime proxetil granules for oral suspension · current verified labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Reconstituted oral suspension; verify 50 mg/5 mL versus 100 mg/5 mL and exact bottle instructions before dose conversion.',
      foodTiming:
          'Oral suspension may be given without regard to food. This differs from cefpodoxime tablets, whose extent of absorption increases with food.',
      duration:
          'Short indication-specific antibiotic course; labeled durations vary from single-dose treatment to 5–14 days depending on infection.',
      formulationHandling:
          'Shake well before use, keep tightly closed, measure with a calibrated device, refrigerate after mixing at 2–8°C, and discard unused suspension after 14 days.',
      monitoring:
          'Clinical response, allergy, significant diarrhea and renal function when clinically relevant.',
      interactions:
          'Acid-reducing therapy can reduce cefpodoxime absorption; renal impairment can require dosage adjustment.',
      commonMistakes:
          'Applying the tablet food rule to the suspension, confusing 50 mg/5 mL with 100 mg/5 mL, not shaking, using a kitchen spoon, or keeping the reconstituted bottle beyond 14 days.',
      specialPopulations:
          'Pediatric dosing is weight- and indication-specific. Verify renal function when relevant.',
    ),
    sections: [
      MedicationSection(
        title: 'Suspension food rule differs from tablet',
        body:
            'Cefpodoxime oral suspension may be given without regard to food; the tablet has higher exposure with food. Do not create one food rule for both formulations.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Reconstituted storage',
        body:
            'After mixing, refrigerate at 2–8°C, shake well before use, keep tightly closed, and discard after 14 days.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد حيوي cephalosporin لعلاج عدوى بكتيرية محددة.',
      howToUseAr:
          'رجّ المعلق جيدًا قبل كل جرعة وقِس الجرعة بأداة مدرجة. تأكد من التركيز المكتوب لأن 50 mg/5 mL يختلف عن 100 mg/5 mL.',
      timingAr:
          'المعلق يمكن أخذه مع الطعام أو بدونه؛ لا تطبق عليه تلقائيًا قاعدة حبوب cefpodoxime التي يفضل امتصاصها مع الطعام.',
      importantAr:
          'احفظ المعلق المحضر في الثلاجة 2–8°C وتخلص من المتبقي بعد 14 يومًا.',
      commonActionableAr:
          'قد يحدث غثيان أو إسهال. تواصل مع الطبيب إذا أصبح الإسهال شديدًا أو مستمرًا.',
      missedDoseAr:
          'خذ الجرعة عند التذكر إذا لم يقترب موعد التالية؛ لا تضاعف.',
      storageAr:
          'بعد التحضير: في الثلاجة 2–8°C، مع إحكام الغطاء ورج العبوة قبل الجرعة، والتخلص من المتبقي بعد 14 يومًا.',
      seekHelpAr:
          'اطلب المساعدة عند تحسس شديد أو إسهال مائي/دموي شديد أو تدهور العدوى.',
      teachBackAr:
          'هل الطعام ضروري مع المعلق؟ وما مدة بقائه في الثلاجة بعد التحضير؟',
    ),
  ),
  Medication(
    id: 'clarithromycin-suspension',
    familyId: 'antiinfective',
    name: 'Clarithromycin Oral Suspension',
    subtitle: 'Suspension · food-flexible · do not refrigerate',
    tags: ['Antibiotic', 'Macrolide', 'Suspension', 'Room temperature'],
    aliases: ['Clarithromycin 125 mg/5 mL', 'Clarithromycin 250 mg/5 mL'],
    sourceLabel:
        'DailyMed · Clarithromycin for oral suspension · current verified labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Reconstituted oral suspension available in multiple concentrations; verify the exact concentration before converting mg to mL.',
      foodTiming:
          'May be taken with or without food and may be taken with milk.',
      duration:
          'Short indication-specific antibacterial course; MAC regimens are a major exception and may require prolonged combination therapy.',
      formulationHandling:
          'Shake well before every use and measure with a calibrated device. After mixing, store at controlled room temperature and use within 14 days. Do not refrigerate.',
      monitoring:
          'Clinical response, significant diarrhea, hepatic symptoms and QT/interacting-medication risk.',
      interactions:
          'Clarithromycin has major CYP3A/QT interactions. Review statins, antiarrhythmics and other interacting drugs before dispensing.',
      commonMistakes:
          'Refrigerating the suspension by habit, failing to shake, confusing 125 mg/5 mL with 250 mg/5 mL, or overlooking major interaction risk.',
      specialPopulations:
          'Renal impairment and interacting antiretroviral/CYP3A therapy can require dose adjustment or avoidance.',
    ),
    sections: [
      MedicationSection(
        title: 'Storage is the opposite of many antibiotic liquids',
        body:
            'After reconstitution, store at room temperature per the verified label, use within 14 days, and do not refrigerate.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Food + interaction lock',
        body:
            'The suspension may be taken with or without food and with milk, but clarithromycin interaction review remains essential because of CYP3A/QT risk.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'مضاد حيوي macrolide لعلاج عدوى بكتيرية محددة.',
      howToUseAr:
          'رجّ العبوة جيدًا قبل كل جرعة واستعمل سرنجة فموية أو أداة مدرجة. تأكد من التركيز على العبوة قبل قياس mL.',
      timingAr: 'يمكن أخذ المعلق مع الطعام أو بدونه، ويمكن أخذه مع الحليب.',
      importantAr:
          'لا تضع المعلق في الثلاجة. بعد التحضير يُحفظ في درجة حرارة الغرفة حسب الملصق ويُستخدم خلال 14 يومًا. أخبر الصيدلي بكل أدويتك بسبب التداخلات المهمة.',
      commonActionableAr:
          'قد يحدث غثيان أو تغير في الطعم أو إسهال؛ إذا أصبح الإسهال شديدًا أو مائيًا/دمويًا راجع الطبيب.',
      missedDoseAr:
          'خذ الجرعة عند التذكر إذا لم يقترب موعد التالية؛ لا تضاعف.',
      storageAr:
          'بعد التحضير: بدرجة حرارة الغرفة حسب الملصق، لا يُبرّد، ويُستخدم خلال 14 يومًا.',
      seekHelpAr:
          'اطلب المساعدة عند خفقان/إغماء شديد، اصفرار، تحسس شديد أو إسهال شديد مستمر.',
      teachBackAr:
          'هل ستضع المعلق في الثلاجة؟ وهل الطعام أو الحليب ممنوعان معه؟',
    ),
  ),
  Medication(
    id: 'budesonide-dr-capsules-crohns',
    familyId: 'gastrointestinal',
    name: 'Budesonide Delayed-Release Capsules (ENTOCORT-type)',
    subtitle: 'Crohn disease · morning · applesauce opening method',
    tags: ['Crohn disease', 'Budesonide', 'Delayed release', 'Morning'],
    aliases: ['ENTOCORT EC', 'Budesonide DR capsules 3 mg'],
    sourceLabel:
        'DailyMed · Budesonide delayed-release capsules · updated 2026',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Delayed-release budesonide capsules for mild-to-moderate Crohn disease involving the ileum and/or ascending colon.',
      foodTiming:
          'Take once daily in the morning. The current administration instructions do not establish a required before/with/after-food anchor; do not invent one.',
      duration:
          'Adults with active disease: 9 mg each morning for up to 8 weeks; maintenance of remission: 6 mg each morning for up to 3 months, then taper to cessation as directed.',
      formulationHandling:
          'Swallow capsules whole. If unable to swallow, open the capsule and place all granules on one tablespoon of non-hot soft applesauce; mix, consume within 30 minutes without chewing/crushing the granules, then drink 8 oz of cool water. Do not save the mixture.',
      monitoring:
          'Response, steroid adverse effects and adrenal suppression risk, especially with prolonged therapy or transition from systemic corticosteroids.',
      interactions:
          'Avoid grapefruit juice. Strong CYP3A4 inhibitors can markedly increase budesonide exposure.',
      commonMistakes:
          'Applying UCERIS instructions to ENTOCORT-type capsules, crushing/chewing granules, saving the applesauce mixture, or continuing maintenance beyond the intended course without review.',
      specialPopulations:
          'Pediatric and hepatic-impairment dosing requires indication-specific review; steroid transition/tapering may be needed when switching from systemic corticosteroids.',
    ),
    sections: [
      MedicationSection(
        title: 'ENTOCORT-type ≠ UCERIS',
        body:
            'This Crohn-disease delayed-release capsule has product-specific morning and applesauce instructions. Do not transfer UCERIS tablet handling to this formulation.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Opening technique',
        body:
            'If needed, open onto 1 tablespoon of non-hot soft applesauce, consume all within 30 minutes without chewing/crushing granules, then drink 8 oz cool water. Do not store the mixture.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يُستخدم لعلاج بعض حالات Crohn disease في نهاية الأمعاء الدقيقة/بداية القولون، أو للمحافظة على الهدأة لفترة محددة.',
      howToUseAr:
          'خذه صباحًا. ابتلع الكبسولة كاملة. إذا تعذر البلع، افتحها وضع كل الحبيبات على ملعقة طعام واحدة من applesauce غير الساخن، تناول الخليط خلال 30 دقيقة دون مضغ الحبيبات، ثم اشرب نحو 240 mL ماء بارد.',
      timingAr:
          'مرة يوميًا صباحًا. الملصق الحالي لا يفرض قبل/مع/بعد الطعام؛ لا تضف قاعدة وجبة من نفسك.',
      importantAr:
          'لا تسحق أو تمضغ الحبيبات ولا تحفظ خليط applesauce لوقت لاحق. تجنب grapefruit juice أثناء العلاج.',
      commonActionableAr:
          'قد تظهر آثار corticosteroid مثل زيادة الشهية أو تغير المزاج عند بعض المرضى؛ لا توقف علاجًا مطولًا فجأة دون خطة الطبيب.',
      missedDoseAr:
          'خذ الجرعة عند التذكر إذا لم يقترب موعد جرعة اليوم التالي؛ لا تضاعف.',
      seekHelpAr:
          'راجع الطبيب عند عدوى شديدة، تورم/ضيق نفس شديد، أو أعراض steroid واضحة ومزعجة.',
      teachBackAr:
          'متى ستأخذ الكبسولة؟ وإذا لم تستطع بلعها، كيف ستستخدم applesauce بالضبط؟ وهل ستُمضغ الحبيبات؟',
    ),
  ),
  Medication(
    id: 'granisetron-sancuso-patch',
    familyId: 'gastrointestinal',
    name: 'Granisetron Transdermal System (SANCUSO)',
    subtitle: 'Chemotherapy antiemetic patch · 24–48 h before · heat/light precautions',
    tags: ['Antiemetic', 'Chemotherapy', 'Patch', 'Granisetron', 'Device'],
    aliases: ['SANCUSO', 'Granisetron patch 3.1 mg/24 h'],
    hasVisualGuide: true,
    sourceLabel:
        'DailyMed · SANCUSO granisetron transdermal system · current verified labeling',
    reviewStatus: 'Verified against current DailyMed labeling',
    lastReviewed: '2026-10',
    useProfile: MedicationUseProfile(
      route:
          'Single granisetron transdermal system for prevention of nausea/vomiting with moderately or highly emetogenic chemotherapy regimens lasting up to 5 consecutive days.',
      foodTiming:
          'No meal anchor; timing is chemotherapy-linked. Apply 24 to 48 hours before chemotherapy.',
      duration:
          'Keep in place through chemotherapy and for at least 24 hours after chemotherapy finishes; total wear may be up to 7 days depending on regimen duration.',
      formulationHandling:
          'Apply one uncut patch to clean, dry, nearly hairless, intact healthy skin on the upper outer arm. Do not cut. Wash hands after application. On removal, fold sticky sides together and dispose safely.',
      monitoring:
          'Patch adhesion, skin reactions, constipation/possible ileus and serotonin-syndrome symptoms when serotonergic drugs are used.',
      interactions:
          'Avoid prolonged external heat over/near the patch because heat increases granisetron exposure. Review serotonergic medicines for serotonin-syndrome risk.',
      commonMistakes:
          'Applying on irritated skin, cutting the patch, placing more than one patch, applying too late, removing too early, exposing it to heating pads/lamps, or leaving the site uncovered in direct sunlight.',
      specialPopulations:
          'Cover the patch site with clothing during wear if exposed to sunlight/artificial UV, and keep the same skin area covered for 10 days after removal.',
    ),
    sections: [
      MedicationSection(
        title: 'Patch timing + placement',
        body:
            'Apply one uncut patch to clean, dry, nearly hairless intact skin on the upper outer arm 24–48 hours before chemotherapy. Keep it on through treatment and at least 24 hours afterward; maximum wear is 7 days.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Heat + sunlight lock',
        body:
            'Do not use heating pads/heat lamps over or near the patch and avoid prolonged heat. Cover the application site from direct natural/artificial sunlight while wearing it and for 10 days after removal.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يمنع الغثيان والقيء المرتبطين ببعض أنظمة chemotherapy متعددة الأيام.',
      howToUseAr:
          'ضع patch واحدة غير مقصوصة على جلد سليم ونظيف وجاف وقليل الشعر في أعلى الذراع من الخارج. اغسل يديك بعد وضعها. لا تضع أكثر من patch ولا تقصها.',
      timingAr:
          'ضعها قبل chemotherapy بـ24–48 ساعة. اتركها طوال العلاج وأزلها بعد مرور 24 ساعة على الأقل من انتهاء chemotherapy؛ الحد الأقصى للارتداء 7 أيام حسب الخطة.',
      importantAr:
          'لا تضع heating pad أو heat lamp فوقها أو قربها وتجنب الحرارة الطويلة. غطِّ مكانها بالملابس عند التعرض للشمس/UV أثناء الاستخدام ولمدة 10 أيام بعد نزعها.',
      commonActionableAr:
          'قد تسبب إمساكًا أو تهيجًا موضعيًا. إذا أصبح تهيج الجلد شديدًا أو منتشرًا فانزعها واتصل بالفريق المعالج.',
      missedDoseAr:
          'إذا لم تضع patch في الوقت المطلوب قبل chemotherapy، اتصل بفريق oncology بدل تغيير التوقيت أو إضافة patch ثانية من نفسك.',
      storageAr:
          'احفظها في عبوتها الأصلية بدرجة حرارة الغرفة حسب الملصق وافتح الكيس فقط وقت الاستخدام.',
      seekHelpAr:
          'اطلب المساعدة عند ألم/انتفاخ بطن شديد مع قلة حركة الأمعاء، تفاعل جلدي شديد، أو أعراض serotonin syndrome.',
      teachBackAr:
          'أرني أين ستضع patch ومتى قبل chemotherapy. هل يجوز قصها؟ وماذا ستفعل مع الحرارة والشمس؟',
    ),
  ),
];
