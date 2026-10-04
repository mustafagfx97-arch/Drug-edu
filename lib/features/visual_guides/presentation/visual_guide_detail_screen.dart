import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/visual_guide_catalog.dart';

class VisualGuideDetailScreen extends StatelessWidget {
  const VisualGuideDetailScreen({
    super.key,
    required this.guide,
  });

  final VisualGuideData guide;

  Future<void> _openResource(
    BuildContext context,
    VisualGuideMediaLink link,
  ) async {
    final uri = Uri.parse(link.url);
    final launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Unable to open this official resource on this device.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(guide.title)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: scheme.primaryContainer.withValues(alpha: 0.45),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                Container(
                  width: 84,
                  height: 84,
                  decoration: BoxDecoration(
                    color: scheme.surface,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: scheme.outlineVariant),
                  ),
                  child: Icon(guide.icon, size: 44, color: scheme.primary),
                ),
                const SizedBox(height: 14),
                Text(
                  guide.subtitle,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: scheme.onSurfaceVariant,
                    height: 1.4,
                  ),
                ),
                if (guide.scopeNote.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: scheme.surface.withValues(alpha: 0.78),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.fact_check_outlined,
                          size: 20,
                          color: scheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            guide.scopeNote,
                            style: theme.textTheme.bodySmall?.copyWith(
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'Visual sequence',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          _VisualSequence(steps: guide.steps),
          if (guide.firstUseSteps.isNotEmpty) ...[
            const SizedBox(height: 20),
            _SectionTitle(
              icon: Icons.new_releases_outlined,
              title: 'First use / priming',
            ),
            const SizedBox(height: 10),
            _NumberedSteps(steps: guide.firstUseSteps),
          ],
          const SizedBox(height: 20),
          _SectionTitle(
            icon: Icons.play_circle_outline_rounded,
            title: 'Every dose',
          ),
          const SizedBox(height: 10),
          _NumberedSteps(steps: guide.steps),
          if (guide.afterUseSteps.isNotEmpty) ...[
            const SizedBox(height: 20),
            _SectionTitle(
              icon: Icons.done_all_rounded,
              title: 'After use',
            ),
            const SizedBox(height: 10),
            _BulletSteps(steps: guide.afterUseSteps),
          ],
          if (guide.cleaningSteps.isNotEmpty) ...[
            const SizedBox(height: 20),
            _SectionTitle(
              icon: Icons.cleaning_services_outlined,
              title: 'Cleaning / replacement',
            ),
            const SizedBox(height: 10),
            _BulletSteps(steps: guide.cleaningSteps),
          ],
          const SizedBox(height: 20),
          _SectionTitle(
            icon: Icons.warning_amber_rounded,
            title: 'Common mistakes',
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: scheme.errorContainer.withValues(alpha: 0.55),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: guide.mistakes
                  .map(
                    (mistake) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.close_rounded,
                            size: 20,
                            color: scheme.error,
                          ),
                          const SizedBox(width: 9),
                          Expanded(child: Text(mistake)),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 18),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: scheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: scheme.outlineVariant),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'ما أقوله للمريض',
                    textAlign: TextAlign.right,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    guide.patientSummaryAr,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.bodyLarge?.copyWith(height: 1.75),
                  ),
                  if (guide.teachBackAr.isNotEmpty) ...[
                    const SizedBox(height: 14),
                    Text(
                      'Teach-back',
                      textAlign: TextAlign.right,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: scheme.primary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      guide.teachBackAr,
                      textAlign: TextAlign.right,
                      style: theme.textTheme.bodyMedium?.copyWith(height: 1.65),
                    ),
                  ],
                ],
              ),
            ),
          ),
          if (guide.sourceLabel.isNotEmpty || guide.mediaLinks.isNotEmpty) ...[
            const SizedBox(height: 18),
            _SectionTitle(
              icon: Icons.verified_outlined,
              title: 'Verified source & media',
            ),
            if (guide.sourceLabel.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                guide.sourceLabel,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: scheme.onSurfaceVariant,
                  height: 1.4,
                ),
              ),
            ],
            if (guide.mediaLinks.isNotEmpty) ...[
              const SizedBox(height: 12),
              for (final link in guide.mediaLinks) ...[
                OutlinedButton.icon(
                  onPressed: () => _openResource(context, link),
                  icon: Icon(
                    link.isVideo
                        ? Icons.play_circle_outline_rounded
                        : Icons.open_in_new_rounded,
                  ),
                  label: Text(link.label),
                ),
                const SizedBox(height: 8),
              ],
            ],
          ],
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, color: theme.colorScheme.primary),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}

class _NumberedSteps extends StatelessWidget {
  const _NumberedSteps({required this.steps});

  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < steps.length; i++) ...[
          _StepRow(number: i + 1, text: steps[i]),
          if (i != steps.length - 1) const SizedBox(height: 10),
        ],
      ],
    );
  }
}

class _BulletSteps extends StatelessWidget {
  const _BulletSteps({required this.steps});

  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: steps
          .map(
            (step) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outline_rounded,
                    size: 19,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      step,
                      style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _VisualSequence extends StatelessWidget {
  const _VisualSequence({required this.steps});

  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return SizedBox(
      height: 118,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: steps.length,
        separatorBuilder: (_, __) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Icon(
            Icons.arrow_forward_rounded,
            color: scheme.outline,
          ),
        ),
        itemBuilder: (context, index) {
          return Container(
            width: 98,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: scheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: scheme.outlineVariant),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: scheme.primaryContainer,
                  child: Icon(
                    _stepIcon(steps[index]),
                    size: 21,
                    color: scheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _shortLabel(steps[index]),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  IconData _stepIcon(String value) {
    final lower = value.toLowerCase();
    if (lower.contains('wash') || lower.contains('clean')) {
      return Icons.clean_hands_outlined;
    }
    if (lower.contains('open') || lower.contains('cover')) {
      return Icons.lock_open_rounded;
    }
    if (lower.contains('turn') || lower.contains('twist')) {
      return Icons.rotate_right_rounded;
    }
    if (lower.contains('press') || lower.contains('actuat')) {
      return Icons.touch_app_outlined;
    }
    if (lower.contains('breathe out') || lower.contains('exhale')) {
      return Icons.air_rounded;
    }
    if (lower.contains('inhale') || lower.contains('breathe in')) {
      return Icons.wind_power_outlined;
    }
    if (lower.contains('rinse')) {
      return Icons.water_drop_outlined;
    }
    if (lower.contains('drop') || lower.contains('instill')) {
      return Icons.opacity_rounded;
    }
    return Icons.medical_services_outlined;
  }

  String _shortLabel(String value) {
    final words = value
        .replaceAll(RegExp(r'[^A-Za-z0-9\- ]'), ' ')
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .toList();
    if (words.length <= 4) return words.join(' ');
    return words.take(4).join(' ');
  }
}

class _StepRow extends StatelessWidget {
  const _StepRow({
    required this.number,
    required this.text,
  });

  final int number;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: scheme.primaryContainer,
          child: Text(
            number.toString(),
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              text,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
            ),
          ),
        ),
      ],
    );
  }
}
