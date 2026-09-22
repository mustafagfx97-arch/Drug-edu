import '../models/medication.dart';

const expandedMedications16 = <Medication>[
  Medication(
    id: 'permethrin-5-cream-scabies',
    familyId: 'allergy-dermatology',
    name: 'Permethrin 5% Cream (Scabies)',
    subtitle: 'Full-body scabies treatment · wash off after 8–14 hours',
    tags: ['Scabies', 'Topical', 'Cream', 'Antiparasitic'],
    aliases: ['Permethrin 5% cream', 'Elimite-type scabies cream'],
    hasVisualGuide: true,
    sourceLabel:
        'DailyMed · Permethrin Cream 5% · current label issued Mar 2026',
    useProfile: MedicationUseProfile(
      route:
          'Prescription topical permethrin 5% cream for scabies; current labeling supports use in pediatric patients 2 months of age and older.',
      foodTiming:
          'Not food-related. Choose a time that allows the cream to remain on the skin for the full 8–14-hour contact period before bathing it off.',
      duration:
          'Usually one complete application. Persistent itching alone after treatment is rarely proof of failure; demonstrable living mites after 14 days indicate retreatment.',
      formulationHandling:
          'Thoroughly massage the cream into the skin from the head to the soles of the feet according to the current label, then wash off by shower or bath after 8–14 hours. About 30 g is usually sufficient for an average adult. In infants, include the scalp, temples and forehead; avoid the eyes.',
      monitoring:
          'Confirm correct full-body coverage, contact time and whether persistent symptoms are post-scabetic itch versus ongoing infestation.',
      interactions:
          'No major systemic timing interaction is central; the main safety issue is correct topical coverage and avoiding unnecessary repeated applications.',
      commonMistakes:
          'Applying only to visible lesions, washing off too early, missing finger/toe webs or other skin areas, retreating immediately just because itching persists, or using the 5% scabies cream like permethrin lice products.',
      specialPopulations:
          'Safety/effectiveness are established from 2 months of age; not established below 2 months. Infants and older adults may require scalp/hairline/temple/forehead coverage.',
    ),
    sections: [
      MedicationSection(
        title: 'Full-body + contact-time lock',
        body:
            'Massage Permethrin 5% cream thoroughly from head to soles, then wash off after 8–14 hours. Usually about 30 g is sufficient for an average adult; do not treat only the visible rash.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Post-treatment itch is not automatic failure',
        body:
            'Itching can persist after successful treatment and rarely by itself means failure. Current labeling uses demonstrable living mites after 14 days as the signal that retreatment is necessary.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'يعالج الجرب بقتل العث الموجود على الجلد.',
      howToUseAr:
          'ضع الكريم على الجلد كاملًا حسب تعليمات الوصفة، وليس فقط فوق الحبوب الظاهرة. النشرة الحالية توصي بتدليكه من الرأس حتى أخمص القدمين، ثم تركه 8–14 ساعة قبل غسله بالحمام. عند الرضع يشمل فروة الرأس والصدغ والجبهة مع تجنب العينين.',
      timingAr:
          'اختر وقتًا يسمح ببقاء الكريم كامل مدة 8–14 ساعة قبل الغسل، وغالبًا يكون ذلك ليلًا.',
      importantAr:
          'لا تكرر العلاج مباشرة لمجرد استمرار الحكة؛ الحكة قد تستمر بعد نجاح العلاج. إذا وُجد عث حي بعد 14 يومًا يحتاج الأمر مراجعة وإعادة العلاج حسب الخطة.',
      commonActionableAr:
          'قد يحدث حرقان أو لسع أو حكة مؤقتة بعد التطبيق.',
      missedDoseAr:
          'هذه ليست جرعة يومية. إذا لم تُكمل التطبيق أو غُسل مبكرًا، اتصل بالصيدلي/الطبيب بدل تكراره عشوائيًا.',
      storageAr:
          'يحفظ بدرجة حرارة الغرفة 20–25°C.',
      seekHelpAr:
          'راجع إذا كان هناك تهيج شديد، تحسس واضح، أو استمرار علامات عدوى/عث حي بعد الفترة المتوقعة.',
      teachBackAr:
          'هل تضع الكريم فقط على أماكن الطفح أم على كامل الجلد؟ وكم ساعة تتركه قبل الغسل؟ وهل استمرار الحكة وحده يعني فشل العلاج؟',
    ),
  ),
  Medication(
    id: 'clotrimazole-1-cream-otc',
    familyId: 'allergy-dermatology',
    name: 'Clotrimazole 1% Cream (OTC)',
    subtitle: 'Athlete’s foot / jock itch / ringworm · indication-specific duration',
    tags: ['Antifungal', 'OTC', 'Cream', 'Tinea'],
    aliases: ['Clotrimazole cream 1%', 'Athlete foot antifungal cream'],
    sourceLabel:
        'DailyMed · Clotrimazole 1% Antifungal Cream · updated Aug 13, 2026',
    useProfile: MedicationUseProfile(
      route:
          'OTC clotrimazole 1% topical cream for athlete’s foot, jock itch and ringworm.',
      foodTiming:
          'Not food-related. Apply morning and night to clean, thoroughly dried skin.',
      duration:
          'Use daily for 4 weeks for athlete’s foot or ringworm; use daily for 2 weeks for jock itch. Refer if there is no improvement within the labeled interval.',
      formulationHandling:
          'Wash the affected area, dry thoroughly, then apply a thin layer over the affected area twice daily. For athlete’s foot, pay special attention between the toes, use well-fitting ventilated shoes and change shoes/socks at least daily.',
      monitoring:
          'Stop and seek review if irritation occurs or if expected improvement is absent at 4 weeks for athlete’s foot/ringworm or 2 weeks for jock itch.',
      interactions:
          'No routine systemic interaction is central with labeled topical use.',
      commonMistakes:
          'Stopping when itching improves after only a few days, applying to damp toe webs, using it for nail/scalp infection, or assuming all fungal sites need the same duration.',
      specialPopulations:
          'Do not use in children under 2 years unless directed by a doctor. Current label states this product is not effective on the scalp or nails.',
    ),
    sections: [
      MedicationSection(
        title: 'Duration depends on fungal site',
        body:
            'Athlete’s foot and ringworm: continue daily for 4 weeks. Jock itch: continue daily for 2 weeks. Twice-daily application is morning and night after washing and thorough drying.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Athlete’s-foot hygiene lock',
        body:
            'Dry especially between the toes, apply a thin layer, wear well-fitting ventilated shoes and change shoes/socks at least once daily. This topical cream is not effective for scalp or nail infection.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'مضاد فطري للقدم الرياضي، حكة الفخذ الفطرية، والسعفة الجلدية.',
      howToUseAr:
          'اغسل المنطقة وجففها جيدًا، ثم ضع طبقة رقيقة صباحًا ومساءً. في فطريات القدم اهتم بتجفيف ما بين الأصابع وغيّر الجوارب/الحذاء بانتظام.',
      timingAr:
          'مرتين يوميًا: صباحًا ومساءً.',
      importantAr:
          'مدة العلاج تختلف: القدم الرياضي أو ringworm لمدة 4 أسابيع، وjock itch لمدة أسبوعين. لا توقفه بمجرد تحسن الحكة في الأيام الأولى.',
      commonActionableAr:
          'قد يحدث تهيج موضعي؛ إذا كان واضحًا أو يزداد أوقفه وراجع.',
      missedDoseAr:
          'ضع الجرعة عند التذكر إذا لم يقترب موعد التالية، ولا تضع كمية مضاعفة.',
      storageAr:
          'يحفظ حسب العبوة بدرجة حرارة الغرفة.',
      seekHelpAr:
          'راجع إذا لم يتحسن athlete’s foot/ringworm خلال 4 أسابيع أو jock itch خلال أسبوعين، أو إذا كان الجلد شديد الاحمرار/الألم أو ظهرت إفرازات.',
      teachBackAr:
          'كم مرة يوميًا تضع الكريم؟ وكم مدة علاج القدم الرياضي مقارنةً بـjock itch؟ وهل يستخدم لفطريات الأظافر؟',
    ),
  ),
  Medication(
    id: 'adapalene-0-1-gel-otc',
    familyId: 'allergy-dermatology',
    name: 'Adapalene 0.1% Gel (OTC)',
    subtitle: 'Once-daily acne retinoid · whole affected area, not spot treatment',
    tags: ['Acne', 'Retinoid', 'OTC', 'Gel'],
    aliases: ['Adapalene gel 0.1%', 'Differin-type OTC gel'],
    sourceLabel:
        'DailyMed · Adapalene Gel USP 0.1% · updated Jul 31, 2026',
    useProfile: MedicationUseProfile(
      route:
          'OTC topical retinoid gel for acne in adults and children 12 years and older; children under 12 should ask a doctor.',
      foodTiming:
          'Not food-related. Use once daily after gently cleaning the skin and patting it dry.',
      duration:
          'A meaningful response can take up to 3 months of once-daily use. If there is no improvement after 3 months, seek medical review rather than simply escalating use.',
      formulationHandling:
          'Apply a thin layer to the entire acne-affected area, not only individual lesions. Do not use more than once daily; extra applications do not work faster and increase irritation. Avoid eyes, lips and mouth and wash hands after use.',
      monitoring:
          'Expect possible early dryness/redness/burning and even temporary apparent worsening. Review severe irritation or lack of improvement after 3 months.',
      interactions:
          'Using multiple topical acne products at the same time can increase irritation. Avoid waxing treated areas and limit sun/tanning exposure; use sunscreen outdoors.',
      commonMistakes:
          'Using as a spot treatment, applying several times daily, scrubbing aggressively before application, waxing treated skin, or stopping within days because acne initially appears worse.',
      specialPopulations:
          'Do not apply to cuts, abrasions, eczema or sunburn. Current OTC label instructs patients who become pregnant or plan pregnancy while using it to stop and ask a doctor.',
    ),
    sections: [
      MedicationSection(
        title: 'Whole-area once-daily lock',
        body:
            'Clean gently and pat dry, then cover the entire acne-affected area with a thin layer once daily. Using more than once daily does not improve results and can worsen irritation.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Expect weeks, not days',
        body:
            'Acne can look worse during the early weeks and results may take up to 3 months. Limit sun/tanning exposure, use sunscreen, and do not wax areas where adapalene is applied.',
        priority: ClinicalPriority.important,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'ريتينويد موضعي لعلاج حب الشباب ومنع تكوّن انسدادات جديدة.',
      howToUseAr:
          'نظف الجلد بلطف وجففه، ثم ضع طبقة رقيقة مرة واحدة يوميًا على كامل المنطقة المعرضة للحبوب، وليس فقط فوق كل حبة.',
      timingAr:
          'مرة واحدة يوميًا. لا تكرر أكثر لأن ذلك لا يسرع النتيجة ويزيد التهيج.',
      importantAr:
          'قد يبدو حب الشباب أسوأ في الأسابيع الأولى، وقد تحتاج النتيجة حتى 3 أشهر. قلل الشمس وأجهزة التسمير، استخدم واقي شمس، ولا تعمل waxing على المناطق المعالجة.',
      commonActionableAr:
          'الجفاف والاحمرار/الحرقان شائعان خاصة بالبداية؛ إذا أصبح التهيج شديدًا أوقفه وراجع.',
      missedDoseAr:
          'إذا فات يوم، استأنف مرة واحدة في اليوم التالي؛ لا تعوض بمرتين.',
      storageAr:
          'يحفظ بدرجة حرارة الغرفة 20–25°C ويُحمى من التجمد.',
      seekHelpAr:
          'راجع إذا لم يظهر تحسن بعد 3 أشهر، إذا أصبح التهيج شديدًا، أو إذا حدث تحسس. إذا أصبحتِ حاملًا أو تخططين للحمل أثناء الاستخدام أوقفيه واسألي الطبيب.',
      teachBackAr:
          'هل تضع adapalene على الحبة فقط أم على كامل المنطقة؟ كم مرة يوميًا؟ ومتى تتوقع النتيجة؟',
    ),
  ),
  Medication(
    id: 'mupirocin-2-ointment-impetigo',
    familyId: 'allergy-dermatology',
    name: 'Mupirocin 2% Ointment',
    subtitle: 'Impetigo ointment · small amount three times daily for up to 10 days',
    tags: ['Topical antibiotic', 'Impetigo', 'Ointment', 'Prescription'],
    aliases: ['Mupirocin ointment 2%', 'Bactroban-type skin ointment'],
    sourceLabel:
        'DailyMed · Mupirocin Ointment USP 2% · current label updated Jul 28, 2026',
    useProfile: MedicationUseProfile(
      route:
          'Topical mupirocin 2% ointment for susceptible impetigo; not the separate intranasal formulation.',
      foodTiming:
          'Not food-related. Apply a small amount to the affected skin three times daily.',
      duration:
          'Use for up to 10 days as prescribed. Re-evaluate if there is no clinical response within 3–5 days.',
      formulationHandling:
          'Wash hands before and after use. Apply a small amount with a cotton swab or gauze pad; a clean gauze dressing may cover the area if desired. Do not use in the nose, eyes, mouth or other mucosal surfaces.',
      monitoring:
          'Monitor for improvement by days 3–5 and for worsening local infection, severe irritation or allergic reaction.',
      interactions:
          'Current labeling says not to apply mupirocin ointment concurrently with other lotions, creams or ointments on the same treated area.',
      commonMistakes:
          'Using the skin ointment intranasally, mixing it with another topical product, stopping as soon as the crust improves, using it for every rash, or continuing without reassessment when there is no response after 3–5 days.',
      specialPopulations:
          'The polyethylene-glycol ointment base can be absorbed from large open/damaged areas and should be avoided when large absorption is possible, especially with moderate/severe renal impairment. Do not use at IV cannula/central-line sites. If used on breast/nipple during breastfeeding, wash the area well before feeding.',
    ),
    sections: [
      MedicationSection(
        title: 'Small amount ×3/day + response checkpoint',
        body:
            'Apply a small amount to the affected area three times daily for up to 10 days. If there is no clinical response within 3–5 days, re-evaluate rather than simply continuing the ointment.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Skin ointment is not nasal ointment',
        body:
            'Do not use this skin ointment in the nose, eyes, mouth or other mucosa, and do not mix it on the treated area with other creams/lotions/ointments. Avoid large open/damaged areas when polyethylene-glycol absorption is a concern, particularly with renal impairment.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'مضاد بكتيري موضعي لبعض حالات impetigo الجلدية عندما تكون البكتيريا حساسة له.',
      howToUseAr:
          'اغسل يديك، ثم ضع كمية صغيرة على المنطقة المصابة 3 مرات يوميًا باستخدام إصبع نظيف/قطنة أو gauze حسب تعليمات الطبيب. يمكن تغطيتها بشاش نظيف إذا طُلب.',
      timingAr:
          '3 مرات يوميًا خلال المدة الموصوفة، وبحد أقصى 10 أيام في الملصق الحالي.',
      importantAr:
          'مرهم الجلد هذا ليس للاستعمال داخل الأنف أو العين أو الفم. لا تخلطه فوق نفس المكان مع كريمات/مراهم أخرى إلا إذا أكد الطبيب أو الصيدلي ذلك.',
      commonActionableAr:
          'قد يحدث لسع أو حرقان أو حكة خفيفة موضعية؛ أوقفه وراجع إذا أصبح التهيج شديدًا أو ظهر طفح منتشر.',
      missedDoseAr:
          'ضع الجرعة عند التذكر إذا لم يقترب موعد التالية، ولا تضاعف كمية المرهم.',
      storageAr:
          'يحفظ بدرجة حرارة الغرفة 20–25°C.',
      seekHelpAr:
          'راجع إذا لم يتحسن الجلد خلال 3–5 أيام، إذا انتشر الاحمرار/الألم أو ظهرت حرارة، أو إذا حدث تورم بالوجه/الشفتين أو صعوبة تنفس.',
      teachBackAr:
          'كم مرة يوميًا تضع المرهم؟ متى يجب أن ترى تحسنًا؟ وهل يجوز استخدام نفس مرهم الجلد داخل الأنف؟',
    ),
  ),
];
