import 'package:flutter/material.dart';

import 'visual_guide_detail_screen.dart';

class VisualGuidesScreen extends StatelessWidget {
  const VisualGuidesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final guides = <_GuideData>[
      const _GuideData(
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
      const _GuideData(
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
      const _GuideData(
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
      const _GuideData(
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
      const _GuideData(
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

      const _GuideData(
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
      const _GuideData(
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
      const _GuideData(
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
      const _GuideData(
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
      const _GuideData(
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
      const _GuideData(
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
      const _GuideData(
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
      const _GuideData(
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
      const _GuideData(
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
    ];

    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Visual Guides')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Text(
            'Technique library',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Short visual workflows for medication devices. Product-specific preparation rules stay attached to the exact device record.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 18),
          for (final guide in guides) ...[
            Card(
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => VisualGuideDetailScreen(
                        title: guide.title,
                        subtitle: guide.subtitle,
                        steps: guide.steps,
                        mistakes: guide.mistakes,
                        patientSummaryAr: guide.patientSummaryAr,
                        icon: guide.icon,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(17),
                  child: Row(
                    children: [
                      Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          guide.icon,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              guide.title,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              guide.subtitle,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                                height: 1.35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right_rounded),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}

class _GuideData {
  const _GuideData({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.steps,
    required this.mistakes,
    required this.patientSummaryAr,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final List<String> steps;
  final List<String> mistakes;
  final String patientSummaryAr;
}
