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
};

List<VisualGuideData> visualGuidesForMedication(String medicationId) {
  final ids = medicationVisualGuideIds[medicationId] ?? const <String>[];
  return ids
      .map(visualGuideById)
      .whereType<VisualGuideData>()
      .toList(growable: false);
}
