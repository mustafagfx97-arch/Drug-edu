import '../models/medication.dart';

const expandedMedications12 = <Medication>[
  Medication(
    id: 'amoxicillin-clavulanate-augmentin-es600-suspension',
    familyId: 'pediatrics',
    name: 'Amoxicillin / Clavulanate (AUGMENTIN ES-600)',
    subtitle: '600 mg/42.9 mg per 5 mL pediatric suspension · formulation-specific',
    tags: ['Pediatrics', 'Antibiotic', 'Suspension', 'AUGMENTIN ES-600'],
    aliases: ['Augmentin ES-600', 'Amoxicillin clavulanate 600/42.9 mg per 5 mL'],
    hasVisualGuide: true,
    sourceLabel:
        'DailyMed · AUGMENTIN ES-600 600 mg/42.9 mg per 5 mL · updated Jul 2026',
    useProfile: MedicationUseProfile(
      route:
          'Product-specific pediatric amoxicillin/clavulanate oral suspension containing 600 mg amoxicillin and 42.9 mg clavulanic acid per 5 mL after reconstitution.',
      foodTiming:
          'Give at the start of a meal. This reduces gastrointestinal intolerance and improves clavulanate absorption.',
      duration:
          'Use for the exact prescribed antibiotic course. The current branded pediatric labeling uses an indication-specific course; do not infer duration from another amoxicillin/clavulanate product.',
      formulationHandling:
          'Shake well before every dose and measure with a calibrated oral syringe. Pharmacy reconstitution is bottle-size specific in the current label: 75 mL bottle + 70 mL water; 125 mL bottle + 110 mL water; 200 mL bottle + 180 mL water.',
      monitoring:
          'Clinical response, allergy, diarrhea severity and hepatic symptoms when relevant.',
      interactions:
          'Warfarin response may change. Allopurinol may increase rash risk. Product excipients and clavulanate exposure matter when switching formulations.',
      commonMistakes:
          'Giving after the meal instead of at its start, using a household spoon, forgetting to shake, or substituting another AUGMENTIN suspension by matching only amoxicillin milligrams.',
      specialPopulations:
          'AUGMENTIN ES-600 has a different clavulanate ratio from 200/28.5 mg per 5 mL and 400/57 mg per 5 mL suspensions and is not automatically interchangeable. Current labeling also contains phenylalanine, which matters in phenylketonuria.',
    ),
    sections: [
      MedicationSection(
        title: 'ES-600 is not interchangeable',
        body:
            'AUGMENTIN ES-600 contains 600/42.9 mg per 5 mL. Do not substitute 200/28.5 or 400/57 mg per 5 mL suspensions solely by matching amoxicillin milligrams because clavulanate exposure differs.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Reconstitution + stability lock',
        body:
            'Current ES-600 label: add 70 mL water for 75 mL bottle, 110 mL for 125 mL bottle, or 180 mL for 200 mL bottle. Refrigerate after reconstitution, shake before each use and discard after 10 days.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'مضاد حيوي للأطفال عندما يختار الطبيب تركيبة AUGMENTIN ES-600 بالتحديد.',
      howToUseAr:
          'رج العبوة جيدًا قبل كل جرعة، وتأكد من تركيز 600/42.9 mg لكل 5 mL، ثم قِس الجرعة بسرنجة فموية مدرجة.',
      timingAr:
          'أعط الجرعة في بداية الوجبة، وليس بعد انتهاء الطفل من الأكل.',
      importantAr:
          'لا تستبدل ES-600 بمعلق AUGMENTIN آخر حتى لو كان مقدار amoxicillin قريبًا؛ نسبة clavulanate مختلفة.',
      commonActionableAr:
          'قد يحدث إسهال أو ألم معدة؛ إعطاؤه في بداية الوجبة يساعد على تقليل انزعاج المعدة.',
      missedDoseAr:
          'أعط الجرعة عند التذكر إذا لم يقترب موعد التالية؛ لا تضاعف جرعتين معًا.',
      storageAr:
          'بعد التحضير يجب حفظ AUGMENTIN ES-600 في الثلاجة والتخلص من المتبقي بعد 10 أيام.',
      seekHelpAr:
          'اطلب مساعدة عاجلة عند تورم الوجه/اللسان أو صعوبة التنفس أو طفح شديد، وراجع الطبيب عند إسهال شديد أو دموي أو اصفرار واضح.',
      teachBackAr:
          'متى ستعطي الجرعة بالنسبة للوجبة؟ وهل تستطيع تبديل ES-600 بتركيز AUGMENTIN آخر بنفس mL من نفسك؟',
    ),
  ),
  Medication(
    id: 'azithromycin-suspension-200mg5ml',
    familyId: 'pediatrics',
    name: 'Azithromycin Oral Suspension 200 mg/5 mL',
    subtitle: 'Concentration-specific macrolide liquid · shake + measured dosing',
    tags: ['Pediatrics', 'Antibiotic', 'Suspension', 'Azithromycin'],
    aliases: ['Azithromycin 200 mg/5 mL', 'Zithromax suspension 200 mg/5 mL'],
    hasVisualGuide: true,
    sourceLabel:
        'DailyMed · Azithromycin for Oral Suspension USP 200 mg/5 mL · updated Aug 2026',
    useProfile: MedicationUseProfile(
      route:
          'Reconstituted azithromycin oral suspension at 200 mg per 5 mL. Pediatric dose and course remain indication- and weight-specific.',
      foodTiming:
          'May be taken with or without food. Do not take aluminum- or magnesium-containing antacids at the same time.',
      duration:
          'Short antibiotic course according to the exact indication and prescription. Do not reuse leftover suspension for a later illness.',
      formulationHandling:
          'Shake well before each dose and measure with a calibrated oral syringe. Reconstitution water volume depends on bottle fill; current 200 mg/5 mL labeling uses 9 mL water for a 600 mg/15 mL bottle, 12 mL for 900 mg/22.5 mL, and 15 mL for 1200 mg/30 mL.',
      monitoring:
          'Clinical response, allergy, significant diarrhea, hepatic symptoms and QT-risk context when clinically relevant.',
      interactions:
          'Avoid simultaneous aluminum/magnesium antacids. Warfarin, digoxin and QT-prolonging therapy may require clinical review.',
      commonMistakes:
          'Using a household spoon, forgetting to shake, confusing 100 mg/5 mL with 200 mg/5 mL, or refrigerating/discarding by habit without checking the exact dispensed label.',
      specialPopulations:
          'Storage after reconstitution is product-label specific; current U.S. labels commonly allow controlled room-temperature ranges rather than requiring refrigeration. Follow the pharmacy label for the exact product and discard date.',
    ),
    sections: [
      MedicationSection(
        title: 'Concentration + measurement lock',
        body:
            'Verify 200 mg/5 mL before converting mg to mL. Shake well immediately before measuring and use a calibrated oral syringe.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Storage is not an automatic refrigerator rule',
        body:
            'Current U.S. labels for constituted azithromycin generally allow controlled room-temperature storage; exact range/discard wording varies by manufacturer. Follow the dispensed product label rather than refrigerating every antibiotic liquid by habit.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'مضاد حيوي لالتهابات بكتيرية محددة عندما يصف الطبيب azithromycin.',
      howToUseAr:
          'رج العبوة جيدًا قبل كل جرعة، تأكد أن التركيز 200 mg/5 mL، وقِس الجرعة بسرنجة فموية.',
      timingAr:
          'يمكن أخذه مع الطعام أو بدونه. لا تأخذ antacid يحتوي aluminum أو magnesium في نفس وقت الجرعة.',
      importantAr:
          'لا تستخدم mL من وصفة أو عبوة قديمة قبل التأكد من التركيز؛ يوجد azithromycin بتركيزات مختلفة.',
      commonActionableAr:
          'قد يحدث غثيان أو إسهال خفيف. الطعام قد يساعد إذا أزعج المعدة.',
      missedDoseAr:
          'خذ الجرعة عند التذكر إذا لم يقترب موعد التالية؛ لا تضاعف.',
      storageAr:
          'اتبع ملصق الصيدلية للمنتج الذي صُرف لك؛ كثير من المعلقات الحالية لا تحتاج تبريدًا بعد التحضير، لكن مدى الحرارة ومدة الحفظ قد تختلف.',
      seekHelpAr:
          'اطلب مساعدة عند تحسس شديد، إغماء/خفقان شديد غير معتاد، اصفرار، أو إسهال شديد/دموي.',
      teachBackAr:
          'ما تركيز العبوة؟ وبأي أداة ستقيس الجرعة؟ وهل ستفترض أنها تحتاج الثلاجة دون قراءة ملصق الصيدلية؟',
    ),
  ),
  Medication(
    id: 'cephalexin-suspension-250mg5ml',
    familyId: 'pediatrics',
    name: 'Cephalexin Oral Suspension 250 mg/5 mL',
    subtitle: 'Cephalosporin liquid · refrigerate after mixing for 14 days',
    tags: ['Pediatrics', 'Antibiotic', 'Suspension', 'Cephalexin'],
    aliases: ['Cephalexin 250 mg/5 mL', 'Keflex suspension'],
    hasVisualGuide: true,
    sourceLabel:
        'DailyMed · Cephalexin for Oral Suspension USP 250 mg/5 mL · current labels 2025–2026',
    useProfile: MedicationUseProfile(
      route:
          'Reconstituted cephalexin oral suspension containing 250 mg per 5 mL.',
      foodTiming:
          'Use on the prescribed schedule. Food may be used if needed for gastrointestinal comfort unless the prescriber gives different instructions.',
      duration:
          'Defined antibiotic course according to infection. Some infections require a specific minimum course; the app does not choose the duration.',
      formulationHandling:
          'Shake well before every dose and use a calibrated oral syringe. Pharmacy reconstitution water volume is manufacturer/bottle specific: current 250 mg/5 mL labels show different totals such as 66, 67 or 69 mL for some 100 mL bottles, so never generalize one water volume across products.',
      monitoring:
          'Clinical response, allergy, diarrhea severity and renal function when clinically relevant.',
      interactions:
          'Metformin exposure can increase with cephalexin; anticoagulation and other patient-specific therapy may require review.',
      commonMistakes:
          'Using the wrong mg/5 mL concentration, a household spoon, failing to shake, or using a remembered reconstitution water volume from a different manufacturer.',
      specialPopulations:
          'Renal impairment can change the dosing regimen. Current labels consistently instruct refrigeration after mixing and allow use for 14 days.',
    ),
    sections: [
      MedicationSection(
        title: 'Reconstitution water is manufacturer-specific',
        body:
            'Do not memorize one cephalexin water volume: current 250 mg/5 mL labels differ by manufacturer/bottle. Use the exact bottle label or manufacturer instructions for reconstitution.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'After mixing',
        body:
            'Shake well before each dose, refrigerate the reconstituted suspension and discard after 14 days.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'مضاد حيوي من cephalosporins لعلاج عدوى بكتيرية محددة.',
      howToUseAr:
          'رج العبوة جيدًا قبل كل جرعة، تحقق من تركيز 250 mg/5 mL، وقِس الجرعة بسرنجة فموية.',
      timingAr:
          'التزم بالفاصل المكتوب في الوصفة وأكمل الكورس المحدد.',
      importantAr:
          'كمية الماء التي يستخدمها الصيدلي لتحضير cephalexin ليست رقمًا واحدًا لكل الشركات؛ لا تعيد التحضير اعتمادًا على رقم محفوظ من عبوة أخرى.',
      commonActionableAr:
          'قد يحدث غثيان أو إسهال خفيف.',
      missedDoseAr:
          'أعط الجرعة عند التذكر إذا لم يقترب موعد التالية؛ لا تضاعف.',
      storageAr:
          'بعد التحضير احفظ المعلق في الثلاجة وتخلص منه بعد 14 يومًا.',
      seekHelpAr:
          'اطلب مساعدة عند تحسس شديد، وراجع الطبيب عند إسهال شديد/دموي أو تدهور واضح.',
      teachBackAr:
          'أين ستقرأ تركيز mg/5 mL؟ وكم يومًا تحتفظ بالمعلق بعد التحضير؟',
    ),
  ),
  Medication(
    id: 'trimethoprim-sulfamethoxazole-suspension-200-40mg5ml',
    familyId: 'pediatrics',
    name: 'Trimethoprim / Sulfamethoxazole Oral Suspension',
    subtitle: '200 mg/40 mg per 5 mL · shake + hydration + light protection',
    tags: ['Pediatrics', 'Antibiotic', 'Suspension', 'TMP-SMX'],
    aliases: ['TMP-SMX suspension', 'Co-trimoxazole suspension', 'Bactrim suspension', '200/40 mg per 5 mL'],
    hasVisualGuide: true,
    sourceLabel:
        'DailyMed · Sulfamethoxazole/Trimethoprim Oral Suspension 200 mg/40 mg per 5 mL · updated Mar 2025',
    useProfile: MedicationUseProfile(
      route:
          'Oral suspension containing sulfamethoxazole 200 mg and trimethoprim 40 mg per 5 mL.',
      foodTiming:
          'Use on the prescribed schedule and maintain adequate fluid intake unless fluid restriction or another clinical reason prevents it.',
      duration:
          'Course is infection-specific; prophylaxis regimens are different from treatment regimens and must not be inferred automatically.',
      formulationHandling:
          'Shake well before use, verify 200/40 mg per 5 mL and measure with a calibrated oral syringe. Store at controlled room temperature and protect from light.',
      monitoring:
          'Clinical response, rash, renal function, potassium and blood counts when clinically indicated, especially with renal disease or interacting potassium-raising drugs.',
      interactions:
          'Warfarin effect can increase. Trimethoprim can raise potassium, especially with ACE inhibitors, ARBs, spironolactone or renal impairment. Methotrexate toxicity risk also requires review.',
      commonMistakes:
          'Forgetting to shake, not encouraging appropriate fluids, assuming every sulfonamide rash is minor, or overlooking hyperkalemia risk in susceptible patients.',
      specialPopulations:
          'Contraindicated in pediatric patients younger than 2 months in current labeling. Renal impairment and folate-risk states need individualized review.',
    ),
    sections: [
      MedicationSection(
        title: 'Hydration + rash lock',
        body:
            'Maintain adequate fluid intake when clinically appropriate to reduce crystalluria/stone risk. New rash with systemic symptoms is not a routine side effect to simply continue through.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Potassium interaction lock',
        body:
            'TMP can raise potassium. Review ACEI/ARB/ARNI, spironolactone, potassium supplements and renal impairment rather than relying on timing separation.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'مضاد حيوي مركب لعلاج أو الوقاية من عدوى محددة حسب الوصفة.',
      howToUseAr:
          'رج العبوة جيدًا، تأكد من تركيز 200/40 mg لكل 5 mL، وقِس الجرعة بسرنجة فموية.',
      timingAr:
          'التزم بالمواعيد المكتوبة واشرب سوائل كافية إذا لم تكن لديك تعليمات بتقييد السوائل.',
      importantAr:
          'أخبر الصيدلي إذا كنت تستخدم أدوية ترفع البوتاسيوم مثل ACEI/ARB أو spironolactone أو مكملات البوتاسيوم.',
      commonActionableAr:
          'قد يحدث غثيان أو إسهال خفيف. طفح جديد خاصة مع حرارة أو تقرحات بالفم يحتاج إيقاف الدواء وتقييمًا سريعًا.',
      missedDoseAr:
          'خذ الجرعة عند التذكر إذا لم يقترب موعد التالية؛ لا تضاعف.',
      storageAr:
          'يحفظ بدرجة حرارة الغرفة في عبوة محكمة ومحمية من الضوء؛ لا يحتاج تبريدًا روتينيًا.',
      seekHelpAr:
          'أوقف الدواء واطلب تقييمًا سريعًا عند طفح شديد/فقاعات أو تقرحات، صعوبة تنفس، اصفرار، قلة بول أو ضعف/خفقان قد يدل على اضطراب البوتاسيوم.',
      teachBackAr:
          'هل تحتاج رج العبوة؟ وما سبب الاهتمام بالسوائل والبوتاسيوم مع هذا الدواء؟',
    ),
  ),
  Medication(
    id: 'nitrofurantoin-suspension-25mg5ml',
    familyId: 'pediatrics',
    name: 'Nitrofurantoin Oral Suspension 25 mg/5 mL',
    subtitle: 'Urinary antibacterial liquid · with food + shake vigorously',
    tags: ['Pediatrics', 'UTI', 'Suspension', 'Nitrofurantoin'],
    aliases: ['Nitrofurantoin 25 mg/5 mL', 'Macrodantin suspension'],
    hasVisualGuide: true,
    sourceLabel:
        'DailyMed · Nitrofurantoin Oral Suspension USP 25 mg/5 mL · current labels 2024–2026',
    useProfile: MedicationUseProfile(
      route:
          'Oral nitrofurantoin suspension at 25 mg per 5 mL for susceptible lower urinary tract infection indications; not for pyelonephritis or perinephric abscess.',
      foodTiming:
          'Take with food. Food improves tolerance and absorption.',
      duration:
          'Treatment or suppressive duration is prescription-specific. Long-term suppressive therapy has additional toxicity considerations and should not be inferred from an acute-course prescription.',
      formulationHandling:
          'Shake vigorously before every dose, verify 25 mg/5 mL and measure with a calibrated oral syringe. Store at controlled room temperature, protect from strong light and freezing. Current product labels differ in use-after-opening/discard period, so follow the exact dispensed label rather than assuming one universal day count.',
      monitoring:
          'Clinical response and renal function; pulmonary, hepatic, neurologic or hemolysis symptoms if clinically relevant, particularly with prolonged therapy.',
      interactions:
          'Magnesium trisilicate antacids can reduce absorption. Renal function is central to safe use.',
      commonMistakes:
          'Giving on an empty stomach, not shaking vigorously, using for presumed kidney infection/pyelonephritis, or applying a discard period from another manufacturer.',
      specialPopulations:
          'Contraindicated in infants younger than 1 month. Current labels also contraindicate use at term pregnancy/labor because of hemolytic risk to the neonate.',
    ),
    sections: [
      MedicationSection(
        title: 'Food + vigorous shaking',
        body:
            'Give with food and shake vigorously before each measured dose. This is a suspension and dosing accuracy depends on resuspension.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Lower-UTI + storage lock',
        body:
            'Do not use nitrofurantoin suspension as a pyelonephritis/perinephric-abscess drug. Protect from strong light and freezing; use the exact pharmacy discard date because current manufacturers differ.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'مضاد بكتيري لبعض التهابات المسالك البولية السفلية، وليس علاجًا مناسبًا لالتهاب الكلية pyelonephritis.',
      howToUseAr:
          'رج العبوة بقوة قبل كل جرعة، تأكد من تركيز 25 mg/5 mL، وقِس الجرعة بسرنجة فموية.',
      timingAr:
          'أعط الجرعة مع الطعام لتحسين الامتصاص وتقليل انزعاج المعدة.',
      importantAr:
          'لا تستخدمه من نفسك عند حرارة عالية مع ألم بالخاصرة/الظهر على أنه نفس التهاب المثانة؛ هذه الأعراض تحتاج تقييمًا لالتهاب الكلية.',
      commonActionableAr:
          'قد يسبب غثيانًا، وقد يصبح لون البول أغمق؛ أخذه مع الطعام يساعد على التحمل.',
      missedDoseAr:
          'خذ الجرعة عند التذكر إذا لم يقترب موعد التالية؛ لا تضاعف.',
      storageAr:
          'يحفظ بدرجة حرارة الغرفة بعيدًا عن الضوء القوي ولا يُجمّد. مدة الاستخدام بعد الفتح تختلف بين الشركات، لذلك اتبع تاريخ التخلص على ملصق الصيدلية.',
      seekHelpAr:
          'راجع بسرعة عند ضيق نفس/سعال جديد مستمر، اصفرار، تنميل/ضعف جديد، تحسس شديد أو استمرار حرارة وألم خاصرة.',
      teachBackAr:
          'هل ستعطي nitrofurantoin مع الطعام؟ وكيف ستعرف تاريخ التخلص من العبوة؟',
    ),
  ),
];
