import 'package:flutter/material.dart';

class VisualGuideData {
  const VisualGuideData({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.steps,
    required this.mistakes,
    required this.patientSummaryAr,
  });

  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final List<String> steps;
  final List<String> mistakes;
  final String patientSummaryAr;
}

const visualGuideCatalog = <VisualGuideData>[
  VisualGuideData(
    id: 'mdi',
    title: 'Metered-dose inhaler',
    subtitle: 'Core MDI technique with room for spacer-specific guidance.',
    icon: Icons.air_outlined,
    steps: [
      'Prepare the device as required by its product instructions.',
      'Breathe out fully away from the mouthpiece.',
      'Seal lips around the mouthpiece and begin a slow inhalation.',
      'Actuate once while continuing the slow deep breath.',
      'Hold the breath as long as comfortably possible.',
    ],
    mistakes: [
      'Inhaling too fast for a standard MDI.',
      'Actuating before or long after inhalation begins.',
      'Skipping product-specific priming or shaking instructions.',
    ],
    patientSummaryAr:
        'جهّز البخاخ حسب تعليمات جهازك، أخرج الهواء أولًا، ثم ضع الفوهة بين الشفتين وابدأ شهيقًا بطيئًا واضغط بخة واحدة مع استمرار الشهيق. اتبع تعليمات الصيدلي الخاصة بجهازك لأن التحضير قد يختلف بين الأنواع.',
  ),
  VisualGuideData(
    id: 'spacer',
    title: 'Spacer with inhaler',
    subtitle: 'Visual workflow for coordinating an MDI with a spacer.',
    icon: Icons.device_hub_outlined,
    steps: [
      'Attach the compatible inhaler to the spacer.',
      'Prepare the inhaler according to the device instructions.',
      'Exhale away from the spacer.',
      'Deliver one puff into the spacer.',
      'Inhale using the spacer technique taught for that device.',
    ],
    mistakes: [
      'Putting multiple puffs into the chamber at the same time.',
      'Waiting too long before inhaling after actuation.',
      'Using a spacer that is not compatible with the inhaler.',
    ],
    patientSummaryAr:
        'ركّب البخاخ على السبيسر، حضّر البخاخ حسب تعليماته، أخرج الهواء ثم أعطِ بخة واحدة داخل السبيسر واستنشق بالطريقة التي شرحها لك الصيدلي. لا تضع عدة بخات داخل الحجرة دفعة واحدة.',
  ),
  VisualGuideData(
    id: 'nasal-spray',
    title: 'Nasal spray',
    subtitle: 'Positioning and aiming guide.',
    icon: Icons.water_drop_outlined,
    steps: [
      'Prepare or prime the spray according to the product instructions.',
      'Clear the nose gently if needed.',
      'Keep the head in the recommended neutral or slightly forward position.',
      'Aim away from the nasal septum.',
      'Spray while breathing in gently, not forcefully.',
    ],
    mistakes: [
      'Aiming directly toward the septum.',
      'Sniffing too hard after spraying.',
      'Using the same priming rule for every brand.',
    ],
    patientSummaryAr:
        'حضّر البخاخ حسب تعليمات المنتج، وجّه الفوهة بعيدًا عن الحاجز الأوسط للأنف، وخذ شهيقًا خفيفًا أثناء الرش. لا تسحب الهواء بقوة ولا تفترض أن كل البخاخات لها نفس طريقة التحضير.',
  ),
  VisualGuideData(
    id: 'eye-drops',
    title: 'Eye drops',
    subtitle: 'Simple drop placement and contamination prevention.',
    icon: Icons.remove_red_eye_outlined,
    steps: [
      'Wash and dry hands.',
      'Tilt the head back and pull down the lower eyelid.',
      'Place one prescribed drop into the lower conjunctival pocket.',
      'Avoid touching the eye, lashes or skin with the dropper tip.',
      'Close the eye gently after the drop.',
    ],
    mistakes: [
      'Touching the dropper tip to the eye.',
      'Adding extra drops because the first drop felt small.',
      'Mixing different eye products without spacing instructions.',
    ],
    patientSummaryAr:
        'اغسل يديك، اسحب الجفن السفلي بلطف وضع القطرة في الجيب أسفل العين دون أن تلمس الفوهة العين أو الرموش. بعد القطرة أغلق العين بلطف واتبع المدة المطلوبة بين القطرات إذا كنت تستخدم أكثر من نوع.',
  ),
  VisualGuideData(
    id: 'insulin-pen',
    title: 'Insulin pen',
    subtitle: 'Device framework; exact priming and hold time remain product-specific.',
    icon: Icons.colorize_outlined,
    steps: [
      'Confirm the correct insulin and pen.',
      'Attach a new compatible needle.',
      'Perform the product-specific safety test or priming step.',
      'Dial the prescribed dose.',
      'Inject using the pen technique and hold time specified for that device.',
    ],
    mistakes: [
      'Skipping the pen-specific priming step.',
      'Reusing needles routinely.',
      'Removing the needle too quickly before the full dose is delivered.',
    ],
    patientSummaryAr:
        'تأكد من نوع الإنسولين والقلم، استخدم إبرة جديدة، ونفّذ اختبار القلم أو التهيئة الخاصة بهذا المنتج ثم اضبط الجرعة الموصوفة. مدة بقاء الإبرة تحت الجلد قد تختلف حسب القلم لذلك اتبع تعليمات جهازك.',
  ),

  VisualGuideData(
    id: 'dpi',
    title: 'Dry-powder inhaler (DPI)',
    subtitle: 'Core DPI technique; loading differs by device.',
    icon: Icons.air_rounded,
    steps: [
      'Prepare or load the dose according to the exact device.',
      'Breathe out fully away from the mouthpiece.',
      'Seal lips around the mouthpiece.',
      'Inhale quickly and deeply through the device.',
      'Hold the breath comfortably, then breathe out away from the device.',
    ],
    mistakes: [
      'Breathing out into the device and exposing the powder to moisture.',
      'Using a slow MDI-style inhalation instead of a forceful DPI inhalation.',
      'Assuming every DPI is loaded the same way.',
    ],
    patientSummaryAr:
        'حضّر الجرعة حسب جهازك، أخرج الهواء بعيدًا عن الجهاز، ثم استنشق بقوة وعمق من الفوهة. لا تزفر داخل الجهاز لأن الرطوبة قد تؤثر على البودرة.',
  ),
  VisualGuideData(
    id: 'turbuhaler',
    title: 'Turbuhaler',
    subtitle: 'Dose-loading and inhalation framework for Turbuhaler-type devices.',
    icon: Icons.rotate_right_outlined,
    steps: [
      'Keep the device upright while loading the dose.',
      'Load one dose using the exact twist sequence for the product.',
      'Breathe out fully away from the mouthpiece.',
      'Inhale quickly and deeply through the mouthpiece.',
      'Hold the breath, then close the device and check the dose indicator.',
    ],
    mistakes: [
      'Holding the device sideways while loading.',
      'Exhaling into the mouthpiece.',
      'Repeating the loading twist unnecessarily after a dose is already prepared.',
    ],
    patientSummaryAr:
        'أمسك الجهاز بشكل مستقيم عند تحضير الجرعة، حمّل جرعة واحدة بالطريقة الخاصة بنوعك، ثم أخرج الهواء بعيدًا عنه واستنشق بقوة وعمق. لا تنفخ داخل الفوهة.',
  ),
  VisualGuideData(
    id: 'diskus',
    title: 'Diskus / Accuhaler',
    subtitle: 'Lever-loaded dry-powder inhaler technique.',
    icon: Icons.horizontal_rule_rounded,
    steps: [
      'Open the device until it is ready.',
      'Move the dose lever only when you are ready to take the dose.',
      'Breathe out away from the mouthpiece.',
      'Inhale quickly and deeply through the mouthpiece.',
      'Hold the breath and close the device.',
    ],
    mistakes: [
      'Moving the lever repeatedly and wasting doses.',
      'Exhaling into the device.',
      'Using the device when the dose counter shows empty.',
    ],
    patientSummaryAr:
        'افتح الجهاز وحضّر جرعة واحدة بالرافعة عندما تكون مستعدًا، أخرج الهواء بعيدًا عن الجهاز ثم استنشق بقوة وعمق. لا تحرك الرافعة أكثر من مرة للجرعة نفسها.',
  ),
  VisualGuideData(
    id: 'ellipta',
    title: 'Ellipta',
    subtitle: 'Open-and-inhale DPI workflow.',
    icon: Icons.view_sidebar_outlined,
    steps: [
      'Open the cover only when you are ready to inhale the dose.',
      'Breathe out away from the device.',
      'Seal lips around the mouthpiece without blocking the air vent.',
      'Take one long, steady, deep breath in.',
      'Hold the breath and close the cover.',
    ],
    mistakes: [
      'Opening and closing the cover without inhaling, which may waste a dose.',
      'Blocking the air vent with the fingers or lips.',
      'Breathing out into the mouthpiece.',
    ],
    patientSummaryAr:
        'افتح الغطاء فقط عندما تكون مستعدًا للجرعة، أخرج الهواء بعيدًا عن الجهاز، ثم خذ شهيقًا طويلًا وعميقًا من الفوهة من دون سد فتحة الهواء.',
  ),
  VisualGuideData(
    id: 'respimat',
    title: 'Respimat-type soft mist inhaler',
    subtitle: 'Slow-inhalation soft-mist technique; setup is product-specific.',
    icon: Icons.blur_on_outlined,
    steps: [
      'Prepare and prime the device exactly as required for the product.',
      'Breathe out slowly and fully away from the device.',
      'Seal lips around the mouthpiece without covering the air vents.',
      'Press the dose-release button while taking a slow deep breath.',
      'Hold the breath comfortably, then close the cap.',
    ],
    mistakes: [
      'Skipping first-use priming.',
      'Inhaling too quickly.',
      'Covering the air vents.',
    ],
    patientSummaryAr:
        'حضّر الجهاز أول مرة حسب تعليماته، ثم أخرج الهواء وابدأ شهيقًا بطيئًا وعميقًا مع الضغط على زر الجرعة. لا تسد فتحات الهواء.',
  ),
  VisualGuideData(
    id: 'nebulizer',
    title: 'Nebulizer',
    subtitle: 'Basic medication-nebulizer workflow.',
    icon: Icons.cloud_outlined,
    steps: [
      'Confirm the prescribed medication and exact nebulizer volume.',
      'Place the medicine in the nebulizer cup using the correct measuring method.',
      'Sit upright and use the mouthpiece or fitted mask.',
      'Breathe normally until the treatment is complete.',
      'Clean and dry the nebulizer parts according to the device instructions.',
    ],
    mistakes: [
      'Mixing nebulized medicines without confirmed compatibility.',
      'Using a poorly fitted mask.',
      'Leaving medication residue in an unclean device.',
    ],
    patientSummaryAr:
        'ضع الدواء بالكمية الموصوفة في حجرة النيبولايزر، اجلس بشكل مستقيم وتنفس بشكل طبيعي حتى انتهاء الجلسة. نظف أجزاء الجهاز بالطريقة الخاصة به بعد الاستخدام.',
  ),
  VisualGuideData(
    id: 'ear-drops',
    title: 'Ear drops',
    subtitle: 'Positioning and drop technique.',
    icon: Icons.hearing_outlined,
    steps: [
      'Wash hands and warm the bottle in the hands if allowed by the product.',
      'Position the affected ear upward.',
      'Pull the ear as appropriate for the patient age and product instructions.',
      'Instill the prescribed drops without touching the dropper tip.',
      'Keep the ear upward for the recommended period.',
    ],
    mistakes: [
      'Touching the dropper to the ear.',
      'Using drops in a perforated eardrum unless the product is appropriate.',
      'Immediately standing up so the drops drain out.',
    ],
    patientSummaryAr:
        'اجعل الأذن المصابة للأعلى وضع القطرات من دون أن تلمس الفوهة الأذن. ابقَ على هذا الوضع للمدة التي شرحها لك الصيدلي حتى لا تخرج القطرات مباشرة.',
  ),
  VisualGuideData(
    id: 'prefilled-syringe',
    title: 'Prefilled syringe injection',
    subtitle: 'General subcutaneous prefilled-syringe framework.',
    icon: Icons.vaccines_outlined,
    steps: [
      'Confirm the correct medicine, strength and dose.',
      'Inspect the syringe and prepare the injection site.',
      'Use the product-specific angle and skin-fold technique.',
      'Inject the full prescribed dose as instructed.',
      'Dispose of the syringe immediately in a sharps container.',
    ],
    mistakes: [
      'Removing an air bubble when the product instructions say not to.',
      'Rubbing the site when the product advises against it.',
      'Reusing or recapping the syringe.',
    ],
    patientSummaryAr:
        'تأكد من اسم الدواء والجرعة قبل الحقن، استخدم الطريقة الخاصة بالسرنجة التي شرحها لك الصيدلي، ثم تخلص منها مباشرة في حاوية الأدوات الحادة.',
  ),
  VisualGuideData(
    id: 'oral-syringe',
    title: 'Oral syringe',
    subtitle: 'Accurate liquid-medicine measurement.',
    icon: Icons.straighten_outlined,
    steps: [
      'Confirm the medicine concentration and prescribed mL dose.',
      'Insert the oral syringe into the bottle adapter when available.',
      'Draw slightly more than needed, then remove air bubbles.',
      'Adjust to the exact mL mark at eye level.',
      'Give the medicine slowly into the inside of the cheek.',
    ],
    mistakes: [
      'Using a household spoon.',
      'Reading the syringe from the wrong edge of the plunger.',
      'Using the same mL amount after changing to a different concentration.',
    ],
    patientSummaryAr:
        'تأكد من تركيز الدواء والحجم المطلوب، اسحب الجرعة بالسرنجة الفموية حتى علامة mL الصحيحة، وأعطها ببطء داخل جانب الفم. لا تستخدم ملعقة منزلية.',
  ),

  VisualGuideData(
    id: 'handihaler-capsule-dpi',
    title: 'Capsule DPI / HandiHaler-type',
    subtitle:
        'Capsule-based dry-powder inhaler workflow; the capsule is inhaled through the device, not swallowed.',
    icon: Icons.air_rounded,
    steps: [
      'Confirm the exact capsule inhaler and matching inhalation capsule.',
      'Open/load and pierce the capsule exactly as the device instructions describe.',
      'Breathe out fully away from the mouthpiece.',
      'Seal lips around the mouthpiece and inhale deeply through the device.',
      'Follow the device-specific repeat-inhalation and capsule-disposal steps.',
    ],
    mistakes: [
      'Swallowing the inhalation capsule.',
      'Exhaling into the device.',
      'Using a capsule from a different inhaler system.',
    ],
    patientSummaryAr:
        'الكبسولة هنا للاستنشاق وليست للبلع. ضعها في جهازها المخصص وافتح/اثقب الكبسولة بالطريقة الخاصة بالجهاز، ثم أخرج الهواء بعيدًا عنه واستنشق بعمق. اتبع تعليمات نفس جهازك لأن خطوات الفتح وعدد مرات الاستنشاق قد تختلف.',
  ),
  VisualGuideData(
    id: 'weekly-injection-device',
    title: 'Weekly injection device',
    subtitle:
        'Framework for weekly GLP-1/GIP medicines; exact pen, vial or multidose-device steps remain product-specific.',
    icon: Icons.vaccines_outlined,
    steps: [
      'Confirm the exact medicine, strength, presentation and weekly dose.',
      'Inspect the product and read the exact device IFU before first use.',
      'Prepare the injection site and any needle/device step required by that presentation.',
      'Administer the prescribed dose using the exact activation and hold-time instructions.',
      'Dispose/store the device according to its product-specific instructions.',
    ],
    mistakes: [
      'Using technique from a different brand or pen generation.',
      'Dialing or measuring a dose by clicks unless the exact IFU instructs it.',
      'Sharing pens, needles or multidose devices.',
    ],
    patientSummaryAr:
        'أول خطوة هي التأكد من اسم المنتج وشكل الجهاز لأن أقلام وعبوات semaglutide وtirzepatide ليست متطابقة. اتبع تعليمات نفس الجهاز في التحضير والحقن والحفظ ولا تنقل خطوات منتج إلى آخر.',
  ),  VisualGuideData(
    id: 'transdermal-patch',
    title: 'Transdermal patch',
    subtitle: 'General medicated-patch workflow; site and replacement schedule remain product-specific.',
    icon: Icons.layers_outlined,
    steps: [
      'Confirm the exact patch product and replacement schedule.',
      'Choose clean, dry, intact skin at a site allowed by that product.',
      'Remove the liner without touching the adhesive more than necessary.',
      'Apply the patch and press firmly, especially around the edges.',
      'Remove the old patch on schedule, fold adhesive sides together, and rotate sites.',
    ],
    mistakes: [
      'Using the same replacement schedule for every patch brand.',
      'Applying to oily, irritated, damaged, or prohibited skin sites.',
      'Leaving the old patch on when the new patch is applied.',
    ],
    patientSummaryAr:
        'تأكد أولًا من اسم اللاصقة وجدول تغييرها. ضعها على جلد نظيف وجاف وسليم في المكان المسموح لنفس المنتج، واضغط جيدًا على الحواف. عند موعد التغيير أزل اللاصقة القديمة وبدّل مكان اللصق حسب التعليمات.',
  ),


  VisualGuideData(
    id: 'nayzilam-device',
    title: 'NAYZILAM seizure-rescue spray',
    subtitle: 'One 5 mg dose per unit; second dose uses the opposite nostril after 10 minutes only if authorized.',
    icon: Icons.water_drop_outlined,
    steps: [
      'Keep the single-dose unit sealed in the blister until the seizure-cluster rescue plan says to use it.',
      'Do not test or prime the device.',
      'Insert the spray tip into one nostril and press the plunger once to deliver the full 5 mg dose.',
      'Observe breathing, alertness and seizure response.',
      'If the prescriber has authorized a second dose and it is still needed after 10 minutes, use a NEW unit in the opposite nostril.',
    ],
    mistakes: [
      'Testing or priming and losing the only dose.',
      'Reusing the first spray unit.',
      'Giving the second dose before 10 minutes or into the same nostril.',
      'Giving a second dose when breathing is concerning or sedation is excessive.',
    ],
    patientSummaryAr:
        'NAYZILAM جهاز جرعة واحدة 5 mg. لا تختبره قبل الاستخدام. أعطِ بخة واحدة في فتحة أنف واحدة؛ وإذا سمح الطبيب بجرعة ثانية بعد 10 دقائق فتكون بجهاز جديد في فتحة الأنف الأخرى. لا تعطِ الجرعة الثانية إذا كان التنفس مقلقًا أو النعاس شديدًا بشكل غير معتاد.',
  ),
  VisualGuideData(
    id: 'valtoco-device',
    title: 'VALTOCO seizure-rescue spray',
    subtitle: 'Device count depends on the prescribed dose; 15/20 mg use both nostrils.',
    icon: Icons.water_drop_outlined,
    steps: [
      'Check the exact prescribed VALTOCO dose before opening the blister.',
      'Do not test the single-use device.',
      'For a prescribed 5 mg or 10 mg dose, use one device and one spray in one nostril.',
      'For a prescribed 15 mg or 20 mg dose, use both devices in that dose pack: one spray in each nostril.',
      'If a second dose is prescribed, use a NEW blister pack no sooner than 4 hours after the first dose.',
    ],
    mistakes: [
      'Assuming every VALTOCO dose uses one device.',
      'Using only one device for a prescribed 15 mg or 20 mg dose.',
      'Repeating the dose before 4 hours.',
      'Testing a device before the emergency.',
    ],
    patientSummaryAr:
        'VALTOCO يختلف حسب الجرعة الموصوفة: 5 أو 10 mg = جهاز واحد في فتحة واحدة؛ 15 أو 20 mg = جهازان، بخة في كل فتحة. إذا كانت هناك جرعة ثانية موصوفة فلا تكون قبل 4 ساعات وتحتاج عبوة جديدة.',
  ),
  VisualGuideData(
    id: 'diastat-acudial-device',
    title: 'DIASTAT AcuDial rectal rescue system',
    subtitle: 'Pharmacist-locked dose with caregiver count-to-three administration technique.',
    icon: Icons.medical_services_outlined,
    steps: [
      'Before use, confirm the prescribed dose is visible in the dose window and the green READY band is visible.',
      'Place the patient on the side, expose the rectum and lubricate the rectal tip.',
      'Remove the cap and make sure the seal pin comes off with the cap.',
      'Insert the tip gently, then push the plunger slowly while counting aloud to 3.',
      'Count to 3 before removing the syringe, then hold the buttocks together while counting to 3 and continue observation.',
    ],
    mistakes: [
      'Trying to change a pharmacist-locked AcuDial dose.',
      'Using the device when the prescribed dose or green READY band is not visible.',
      'Skipping lubrication or forcing the tip.',
      'Removing the syringe immediately without the count-to-three sequence.',
    ],
    patientSummaryAr:
        'قبل DIASTAT AcuDial تأكد من الجرعة الظاهرة والشريط الأخضر READY. ضع المريض على جانبه، زيّت الطرف، أدخله بلطف، اضغط المكبس ببطء مع العد 1-2-3، انتظر 1-2-3 قبل إخراج السرنجة ثم اضغط الإليتين معًا 1-2-3.',
  ),
  VisualGuideData(
    id: 'gvoke-hypopen-device',
    title: 'GVOKE HypoPen',
    subtitle: 'Ready-to-use glucagon auto-injector; bare skin, click, 5-count, red window.',
    icon: Icons.vaccines_outlined,
    steps: [
      'Open the foil pouch only when the severe-hypoglycemia emergency occurs and inspect the solution.',
      'Pull the red needle cap straight off; keep fingers away from the yellow needle guard.',
      'Place the device straight down on bare skin of the lower abdomen, outer thigh or outer upper arm.',
      'Push and hold until you hear the click, then keep holding while slowly counting to 5.',
      'Confirm the viewing window is red, lift the device, turn an unconscious patient onto the side and call emergency medical help.',
    ],
    mistakes: [
      'Injecting through clothing.',
      'Covering the yellow needle guard with fingers.',
      'Lifting before the slow 5-count is complete or before the window turns red.',
      'Reusing the single-dose device.',
    ],
    patientSummaryAr:
        'GVOKE HypoPen: افتح الـfoil وقت الطوارئ، اسحب الغطاء الأحمر، ضع القلم مستقيمًا على جلد مكشوف، اضغط حتى تسمع click واستمر بالضغط مع العد ببطء إلى 5. اكتمال الجرعة يظهر عندما تصبح النافذة حمراء.',
  ),
  VisualGuideData(
    id: 'neffy-device',
    title: 'neffy epinephrine nasal spray',
    subtitle: 'Straight intranasal placement; do not sniff; second dose uses the same nostril after 5 minutes.',
    icon: Icons.water_drop_outlined,
    steps: [
      'Do not prime the single-dose device.',
      'Insert the nozzle fully into one nostril until the fingers touch the nose.',
      'Keep the device straight into the nose; do not angle toward the septum or outer nasal wall.',
      'Press the plunger firmly once and do not sniff during or after administration.',
      'If symptoms do not improve or worsen, use a NEW device in the SAME nostril starting 5 minutes after the first dose and follow the emergency plan.',
    ],
    mistakes: [
      'Priming the device.',
      'Angling the spray toward the septum or outer nasal wall.',
      'Sniffing during or after the dose.',
      'Using the opposite nostril for the second dose.',
    ],
    patientSummaryAr:
        'neffy: لا تختبر الجهاز. أدخل الفوهة كاملة واجعلها مستقيمة داخل الأنف، اضغط مرة واحدة ولا تشم أثناء أو بعد الرش. إذا احتجت جرعة ثانية فهي بجهاز جديد في نفس فتحة الأنف ابتداءً من 5 دقائق بعد الأولى.',
  ),

];


VisualGuideData? visualGuideById(String id) {
  for (final guide in visualGuideCatalog) {
    if (guide.id == id) return guide;
  }
  return null;
}

const medicationVisualGuideIds = <String, List<String>>{
  'salbutamol-mdi': ['mdi', 'spacer'],
  'insulin-glargine': ['insulin-pen'],
  'budesonide-formoterol': ['mdi', 'turbuhaler'],
  'latanoprost': ['eye-drops'],
  'semaglutide-injection': ['weekly-injection-device'],
  'tiotropium-capsule-inhalation': ['handihaler-capsule-dpi'],
  'timolol-ophthalmic': ['eye-drops'],
  'ciprofloxacin-ophthalmic': ['eye-drops'],
  'ciprofloxacin-otic': ['ear-drops'],
  'ipratropium-hfa': ['mdi', 'spacer'],
  'fluticasone-hfa': ['mdi', 'spacer'],
  'fluticasone-salmeterol-dpi': ['diskus', 'dpi'],
  'tirzepatide-mounjaro': ['weekly-injection-device'],
  'albuterol-nebulizer-0083': ['nebulizer'],
  'albuterol-nebulizer-concentrate-05': ['nebulizer'],
  'ipratropium-nebulizer': ['nebulizer'],
  'ipratropium-albuterol-nebulizer': ['nebulizer'],
  'budesonide-nebulizer': ['nebulizer'],
  'tiotropium-respimat': ['respimat'],
  'fluticasone-nasal': ['nasal-spray'],
  'mometasone-nasal': ['nasal-spray'],
  'azelastine-nasal': ['nasal-spray'],
  'oxymetazoline-nasal': ['nasal-spray'],
  'amoxicillin-pediatric-suspension': ['oral-syringe'],
  'cefdinir-pediatric-suspension': ['oral-syringe'],
  'simethicone-infant-drops': ['oral-syringe'],
  'estradiol-transdermal-patch': ['transdermal-patch'],
  'dorzolamide-ophthalmic': ['eye-drops'],
  'olopatadine-ophthalmic-otc': ['eye-drops'],
  'prednisolone-acetate-ophthalmic': ['eye-drops'],
  'ofloxacin-otic': ['ear-drops'],
  'nayzilam-midazolam-nasal': ['nayzilam-device'],
  'valtoco-diazepam-nasal': ['valtoco-device'],
  'diastat-acudial-diazepam-rectal': ['diastat-acudial-device'],
  'gvoke-hypopen-glucagon': ['gvoke-hypopen-device'],
  'neffy-epinephrine-nasal': ['neffy-device'],
};

List<VisualGuideData> visualGuidesForMedication(String medicationId) {
  final ids = medicationVisualGuideIds[medicationId] ?? const <String>[];
  return ids
      .map(visualGuideById)
      .whereType<VisualGuideData>()
      .toList(growable: false);
}
