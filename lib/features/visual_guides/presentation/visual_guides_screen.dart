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
