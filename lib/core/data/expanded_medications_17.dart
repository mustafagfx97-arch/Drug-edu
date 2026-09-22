import '../models/medication.dart';

const expandedMedications17 = <Medication>[
  Medication(
    id: 'drospirenone-slynd-4mg',
    familyId: 'womens-health',
    name: 'Drospirenone 4 mg (SLYND)',
    subtitle: '24 active + 4 inert progestin-only pill · missed-dose and potassium locks',
    tags: ['Contraception', 'Progestin-only', 'Oral', 'Daily'],
    aliases: ['SLYND', 'Drospirenone progestin-only pill'],
    sourceLabel:
        'DailyMed · SLYND drospirenone 4 mg · updated Aug 27, 2026',
    useProfile: MedicationUseProfile(
      route:
          'Oral progestin-only contraceptive: 24 white active tablets containing drospirenone 4 mg followed by 4 green inert tablets in each 28-day pack.',
      foodTiming:
          'Not meal-dependent. Swallow one tablet every day at about the same time so the interval between doses is approximately 24 hours.',
      duration:
          'Ongoing contraception while desired, effective and clinically appropriate.',
      formulationHandling:
          'Take 24 active tablets then 4 inert tablets continuously pack-to-pack. If one active tablet is missed, take it as soon as possible and continue daily. If two or more active tablets are missed, take the last missed active tablet as soon as possible, continue daily, and use non-hormonal backup contraception for 7 days after the missed tablets. Missed inert tablets are skipped.',
      monitoring:
          'Patients on daily long-term medicines that raise serum potassium should have potassium checked before starting and during the first treatment cycle. Monitor other high-risk patients as clinically indicated.',
      interactions:
          'Potassium-raising medicines can increase hyperkalemia risk. Enzyme inducers can reduce contraceptive effectiveness; strong CYP3A4 inhibitors may increase drospirenone exposure and potassium risk.',
      commonMistakes:
          'Treating missed green inert tablets like missed active tablets, missing two or more white tablets without 7-day backup, stopping the pack during the four inert days, or ignoring potassium risk with spironolactone/ACEI/ARB/potassium products.',
      specialPopulations:
          'Contraindicated in renal impairment, adrenal insufficiency, hepatic impairment/liver tumors, selected progestin-sensitive cancers and unexplained uterine bleeding.',
    ),
    sections: [
      MedicationSection(
        title: 'Missed active-tablet lock',
        body:
            'One missed white active tablet: take it as soon as possible and continue daily. Two or more missed white active tablets: take the last missed active tablet as soon as possible, continue daily, and use non-hormonal backup contraception for 7 days. Missed green inert tablets are simply skipped.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Potassium lock',
        body:
            'Drospirenone has anti-mineralocorticoid activity. With chronic medicines that can raise potassium, current labeling calls for serum potassium before starting SLYND and during the first treatment cycle.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'حبوب منع حمل تحتوي drospirenone فقط بدون estrogen.',
      howToUseAr:
          'خذي حبة واحدة يوميًا تقريبًا في نفس الوقت: 24 حبة بيضاء فعالة ثم 4 حبات خضراء غير فعالة، وبعدها ابدئي الشريط التالي مباشرة.',
      timingAr:
          'مرة يوميًا وبفاصل يقارب 24 ساعة. لا توقفي الحبوب خلال أيام الحبات الخضراء.',
      importantAr:
          'إذا نسيتِ حبة بيضاء واحدة خذيها عند التذكر واستمري. إذا نسيتِ حبتين بيضاوين أو أكثر خذي آخر حبة منسية فورًا، استمري يوميًا، واستخدمي وسيلة غير هرمونية إضافية لمدة 7 أيام. نسيان الحبات الخضراء لا يحتاج تعويضًا.',
      commonActionableAr:
          'قد يتغير نمط الدورة أو يحدث spotting. إذا تستخدمين spironolactone أو ACEI/ARB أو مكملات/أملاح potassium أو أدوية ترفع البوتاسيوم، أخبري الصيدلي لأنك قد تحتاجين فحص potassium.',
      missedDoseAr:
          'حبة فعالة واحدة: خذيها عند التذكر. حبتان فعالتان أو أكثر: خذي آخر حبة منسية، استمري يوميًا، واستخدمي backup غير هرموني 7 أيام. الحبات الخضراء المنسية تُتجاوز.',
      storageAr:
          'يحفظ بدرجة حرارة الغرفة 25°C مع السماح عادةً بـ15–30°C حسب الملصق.',
      seekHelpAr:
          'راجعي بسرعة عند أعراض ارتفاع potassium مثل ضعف شديد/خدر أو خفقان غير معتاد، أو عند نزف شديد أو أعراض حمل.',
      teachBackAr:
          'كم حبة بيضاء وكم خضراء في الشريط؟ ماذا تفعلين إذا نسيتِ حبتين بيضاوين؟ ومتى نحتاج الانتباه للبوتاسيوم؟',
    ),
  ),
  Medication(
    id: 'medroxyprogesterone-depo-provera-ci-150mg-im',
    familyId: 'womens-health',
    name: 'Medroxyprogesterone Acetate 150 mg IM (Depo-Provera CI)',
    subtitle: 'Deep IM contraception every 13 weeks · bone-density and late-dose locks',
    tags: ['Contraception', 'Injection', 'Progestin', '13 weeks'],
    aliases: ['Depo-Provera CI', 'DMPA 150 mg IM'],
    sourceLabel:
        'DailyMed · Medroxyprogesterone Acetate Injectable Suspension 150 mg/mL · updated Aug 25, 2026',
    useProfile: MedicationUseProfile(
      route:
          'Healthcare-administered deep intramuscular injection of 150 mg in the gluteal or deltoid muscle every 3 months (13 weeks), rotating sites.',
      foodTiming:
          'Not meal-related. The critical timing issue is returning for the next injection every 13 weeks.',
      duration:
          'Not recommended as a long-term birth-control method beyond 2 years unless other options are considered inadequate because bone mineral density loss increases with duration.',
      formulationHandling:
          'This record is the 150 mg/mL deep-IM contraceptive formulation. Do not substitute technique or dose from subcutaneous medroxyprogesterone products. Body habitus should be assessed so the injection actually reaches muscle.',
      monitoring:
          'Track reinjection date, bone-health risk and clinically relevant meningioma symptoms. If the interval between injections exceeds 13 weeks, pregnancy must be excluded before another injection.',
      interactions:
          'Enzyme-inducing medicines or herbal products, including carbamazepine and rifampin-type inducers, may reduce contraceptive effectiveness; current labeling advises backup or an alternative method.',
      commonMistakes:
          'Missing the 13-week return date, assuming a late injection can be given without pregnancy assessment, confusing the 150 mg IM product with subcutaneous formulations, or continuing for years without reassessing bone-health tradeoffs.',
      specialPopulations:
          'Not indicated before menarche. Long-term use in adolescents/young adults requires particular bone-health consideration. Discontinue if meningioma is diagnosed.',
    ),
    sections: [
      MedicationSection(
        title: '13-week appointment lock',
        body:
            'Give 150 mg by deep IM injection every 13 weeks. If more than 13 weeks have elapsed since the prior injection, current labeling requires determining that the patient is not pregnant before giving the next dose.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Bone + meningioma lock',
        body:
            'Bone mineral density loss increases with duration; use beyond 2 years is not recommended unless other birth-control options are inadequate. Repeated medroxyprogesterone exposure has also been associated with reported meningiomas; discontinue if meningioma is diagnosed.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'حقنة منع حمل طويلة المفعول تحتوي medroxyprogesterone.',
      howToUseAr:
          'تعطى بواسطة مقدم الرعاية الصحية كحقنة عميقة في العضل بجرعة 150 mg كل 13 أسبوعًا.',
      timingAr:
          'حددي موعد الجرعة التالية كل 13 أسبوعًا. إذا تأخر الموعد أكثر من 13 أسبوعًا يجب التأكد من عدم وجود حمل قبل الحقنة التالية.',
      importantAr:
          'قد تؤثر على كثافة العظم مع الاستخدام الطويل؛ لا يُنصح عادةً باستخدامها أكثر من سنتين إلا إذا كانت الخيارات الأخرى غير مناسبة. أخبري الطبيب عن أدوية مثل carbamazepine أو rifampin لأنها قد تقلل فعالية وسائل منع الحمل الهرمونية.',
      commonActionableAr:
          'عدم انتظام النزف أو spotting شائع في البداية وقد يقل مع الاستمرار وقد تنقطع الدورة لاحقًا. إذا كان النزف شديدًا أو غير معتاد راجعي الطبيب.',
      missedDoseAr:
          'إذا فات موعد 13 أسبوعًا لا تعوضي من نفسك؛ أعيدي حجز الموعد، ويجب استبعاد الحمل إذا تجاوز الفاصل 13 أسبوعًا قبل إعطاء الجرعة.',
      storageAr:
          'تُحفظ العبوات عادةً بدرجة حرارة الغرفة؛ التخزين مسؤولية المنشأة الصحية.',
      seekHelpAr:
          'اطلبي تقييمًا عند أعراض جلطة، ألم بطني شديد مع احتمال الحمل، أو أعراض عصبية جديدة/مستمرة قد تحتاج تقييمًا، خصوصًا مع تاريخ meningioma.',
      teachBackAr:
          'كل كم أسبوع تكون الحقنة؟ ماذا يحدث إذا تجاوزتِ 13 أسبوعًا؟ ولماذا لا نعتبرها تلقائيًا خيارًا طويل الأمد لأكثر من سنتين؟',
    ),
  ),
  Medication(
    id: 'etonogestrel-ethinyl-estradiol-vaginal-ring',
    familyId: 'womens-health',
    name: 'Etonogestrel/Ethinyl Estradiol Vaginal Ring',
    subtitle: '3 weeks in + 1 week out · expelled-ring rules are time-sensitive',
    tags: ['Contraception', 'Vaginal ring', 'Combined hormonal', 'Device'],
    aliases: ['NuvaRing-type', 'Etonogestrel EE vaginal ring'],
    hasVisualGuide: true,
    sourceLabel:
        'DailyMed · Etonogestrel and Ethinyl Estradiol Vaginal Ring · updated Sep 9, 2026',
    useProfile: MedicationUseProfile(
      route:
          'Intravaginal combined hormonal contraceptive ring. Insert one ring and leave it continuously for 3 weeks, then remove it for a 1-week ring-free interval.',
      foodTiming:
          'Not meal-related. Insert and remove on the same day of the week and approximately the same time.',
      duration:
          'Ongoing cyclic contraception while clinically appropriate.',
      formulationHandling:
          'Compress the ring between thumb and index finger, insert into the vagina and gently push it up; exact position is not critical for effectiveness. If expelled for less than 3 hours, rinse with cool-to-lukewarm (not hot) water and reinsert promptly. If out for more than 3 continuous hours, management depends on the week of the cycle and requires backup contraception.',
      monitoring:
          'Confirm smoking status, thrombotic risk, blood pressure and correct ring-in/ring-out timing. Regularly check that the ring remains in the vagina.',
      interactions:
          'Enzyme inducers may reduce contraceptive effectiveness and require backup or an alternative method. Standard combined-hormonal contraceptive thrombotic contraindications apply.',
      commonMistakes:
          'Leaving the ring out for more than 3 hours without applying the week-specific backup rules, extending the ring-free interval beyond 7 days, rinsing with hot water, or assuming the ring needs an exact internal position.',
      specialPopulations:
          'Women older than 35 who smoke should not use this combined hormonal ring. Current labeling also carries the usual CHC thrombotic/cancer/liver contraindications.',
    ),
    sections: [
      MedicationSection(
        title: '3 weeks in + 1 week out',
        body:
            'Leave the ring in continuously for 3 weeks, remove it for exactly 1 week, then insert a new ring on the same weekday at about the same time even if withdrawal bleeding has not finished.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Expelled-ring lock',
        body:
            'Out <3 hours: rinse with cool-to-lukewarm, not hot, water and reinsert; efficacy is not reduced. Out >3 hours in Weeks 1–2: reinsert and use barrier backup until the ring has been continuously in place for 7 days. In Week 3, discard that ring and follow the labeled new-ring options with 7-day backup.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'حلقة مهبلية هرمونية مركبة لمنع الحمل.',
      howToUseAr:
          'اضغطي الحلقة بين الإبهام والسبابة، أدخليها داخل المهبل وادفعيها بلطف للأعلى. لا تحتاج مكانًا دقيقًا داخل المهبل حتى تعمل.',
      timingAr:
          'تبقى 3 أسابيع متواصلة، ثم تزال أسبوعًا واحدًا فقط، ثم توضع حلقة جديدة في نفس يوم الأسبوع تقريبًا.',
      importantAr:
          'إذا خرجت أقل من 3 ساعات اشطفيها بماء بارد إلى فاتر—not hot—وأعيديها مباشرة. إذا خرجت أكثر من 3 ساعات فالقواعد تختلف حسب أسبوع الدورة وغالبًا تحتاجين backup لمدة 7 أيام. لا تمددي فترة بدون حلقة لأكثر من 7 أيام.',
      commonActionableAr:
          'قد يحدث spotting أو إفرازات/انزعاج مهبلي أو صداع. افحصي وجود الحلقة بانتظام خصوصًا بعد الجماع أو استخدام tampon.',
      missedDoseAr:
          'لا توجد جرعة حبة منسية؛ الخطأ المهم هو خروج الحلقة أو تأخير الحلقة الجديدة. إذا خرجت أكثر من 3 ساعات أو طال الأسبوع الخالي من الحلقة، اتبعي قواعد المنتج واستخدمي backup حسب الحالة.',
      storageAr:
          'بعد صرفها للمريضة يمكن تخزينها حتى 4 أشهر عند 25°C ضمن 15–30°C؛ تجنبي الشمس المباشرة والحرارة فوق 30°C. لا تُرمى في المرحاض.',
      seekHelpAr:
          'اطلبي إسعافًا عند ألم/تورم ساق مفاجئ، ضيق نفس مفاجئ، ألم صدر شديد، فقدان رؤية مفاجئ أو أعراض جلطة. إذا شعرتِ بألم بعد الإدخال ولم تجدي الحلقة داخل المهبل راجعي الطبيب.',
      teachBackAr:
          'كم أسبوع تبقى الحلقة وكم أسبوع تزال؟ ماذا تفعلين إذا خرجت أقل من 3 ساعات؟ وماذا يتغير إذا تجاوزت 3 ساعات؟',
    ),
  ),
  Medication(
    id: 'norelgestromin-ethinyl-estradiol-patch',
    familyId: 'womens-health',
    name: 'Norelgestromin/Ethinyl Estradiol Contraceptive Patch',
    subtitle: 'Weekly ×3 then 1 patch-free week · adhesion, BMI and missed-patch locks',
    tags: ['Contraception', 'Patch', 'Combined hormonal', 'Weekly'],
    aliases: ['Xulane-type patch', 'Norelgestromin EE patch'],
    hasVisualGuide: true,
    sourceLabel:
        'DailyMed · Norelgestromin and Ethinyl Estradiol Transdermal System · updated Apr 16, 2026',
    useProfile: MedicationUseProfile(
      route:
          'Combined hormonal transdermal contraceptive. Apply one patch weekly for 3 consecutive weeks to the upper outer arm, abdomen, buttock or back; Week 4 is patch-free.',
      foodTiming:
          'Not meal-related. Change on the same weekday each week and never allow more than 7 consecutive patch-free days.',
      duration:
          'Ongoing cyclic contraception while clinically appropriate.',
      formulationHandling:
          'Apply to clean, dry skin free of powder, makeup, cream, oil or lotion; do not apply to breasts or irritated skin. Press firmly with the palm for 10 seconds and check edges daily. Do not cut or alter the patch. If detached for less than 1 day, reapply or replace immediately with no backup needed; if detached for more than 1 day or duration is unknown, start a new 4-week cycle and use non-hormonal backup for 7 days.',
      monitoring:
          'Assess BMI, body weight, smoking status, blood pressure and thrombotic risk before use. Monitor patch adhesion throughout each week.',
      interactions:
          'Enzyme inducers can reduce effectiveness and require backup or an alternative method. Combined-hormonal contraceptive thrombotic interactions and contraindications apply.',
      commonMistakes:
          'Applying over lotion/oil, using the breast or waistline, taping down a loose patch, cutting the patch, forgetting to check adhesion, or allowing more than 7 patch-free days.',
      specialPopulations:
          'Contraindicated at BMI ≥30 kg/m² and in women over 35 who smoke. Effectiveness may be lower at body weight ≥198 lb (90 kg).',
    ),
    sections: [
      MedicationSection(
        title: 'Weekly cycle + placement lock',
        body:
            'Apply a new patch on the same weekday for Weeks 1, 2 and 3; Week 4 is patch-free. Use upper outer arm, abdomen, buttock or back—not the breast—and apply to clean dry skin without creams/oils. Press firmly for 10 seconds and check edges every day.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Detached/missed patch lock',
        body:
            'Detached <1 day: reapply or replace immediately; no backup is needed and keep the same Patch Change Day. Detached >1 day or unknown: apply a new patch, start a new 4-week cycle/new Change Day, and use non-hormonal backup for 7 days. Never exceed 7 patch-free days.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'BMI + smoking lock',
        body:
            'Current labeling contraindicates use at BMI ≥30 kg/m² and in women older than 35 who smoke. It may be less effective at body weight ≥198 lb (90 kg).',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'لاصقة هرمونية مركبة لمنع الحمل.',
      howToUseAr:
          'ضعي لصقة جديدة مرة أسبوعيًا لمدة 3 أسابيع على أعلى الذراع الخارجي أو البطن أو الأرداف أو الظهر، ثم الأسبوع الرابع بدون لصقة. الجلد يجب أن يكون نظيفًا وجافًا بدون كريم/زيت، ولا توضع على الثدي. اضغطي عليها براحة اليد 10 ثوانٍ وافحصي الحواف يوميًا.',
      timingAr:
          'غيّريها في نفس يوم الأسبوع. لا تسمحي أبدًا بأكثر من 7 أيام متتالية بدون لصقة بين الدورات.',
      importantAr:
          'إذا انفصلت أقل من يوم أعيدي لصقها إذا التصقت تمامًا أو ضعي جديدة فورًا ولا تحتاجين backup. إذا انفصلت أكثر من يوم أو لا تعرفين المدة، ابدئي دورة جديدة من يومها واستخدمي backup غير هرموني 7 أيام. لا تلصقيها بشريط ولا تقصيها.',
      commonActionableAr:
          'قد يحدث تهيج موضعي أو صداع/غثيان/spotting. غيّري مكان اللصقة كل أسبوع.',
      missedDoseAr:
          'في منتصف الدورة: التأخر في تغيير اللصقة حتى 48 ساعة يُعالج بوضع لصقة جديدة والاستمرار في يوم التغيير المعتاد دون backup؛ إذا تجاوز 48 ساعة ابدئي دورة جديدة واستخدمي backup 7 أيام.',
      storageAr:
          'احفظي كل لصقة داخل كيسها حتى وقت الاستخدام، بدرجة حرارة الغرفة، ولا تضعيها في الثلاجة أو الفريزر. عند التخلص اطوي الجانبين اللاصقين معًا ولا ترميها في المرحاض.',
      seekHelpAr:
          'اطلبي إسعافًا عند ألم/تورم ساق، ضيق نفس، ألم صدر شديد، فقدان رؤية مفاجئ أو أعراض جلطة. هذه اللصقة لا تُستخدم إذا كان BMI ≥30 kg/m²، ولا لمن تدخن وعمرها فوق 35 سنة.',
      teachBackAr:
          'أين يمكن وضع اللصقة؟ كم أسبوعًا تضعينها؟ ماذا تفعلين إذا انفصلت أكثر من يوم؟ وما قاعدة BMI؟',
    ),
  ),
];
