import 'package:flutter/material.dart';

import '../../../shared/widgets/section_card.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({
    super.key,
    required this.themeMode,
    required this.onThemeModeChanged,
  });

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
      children: [
        Text(
          'More',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 18),
        SectionCard(
          title: 'Appearance',
          icon: Icons.brightness_6_outlined,
          child: SegmentedButton<ThemeMode>(
            segments: const [
              ButtonSegment(
                value: ThemeMode.light,
                icon: Icon(Icons.light_mode_outlined),
                label: Text('Light'),
              ),
              ButtonSegment(
                value: ThemeMode.system,
                icon: Icon(Icons.settings_brightness_outlined),
                label: Text('System'),
              ),
              ButtonSegment(
                value: ThemeMode.dark,
                icon: Icon(Icons.dark_mode_outlined),
                label: Text('Dark'),
              ),
            ],
            selected: {themeMode},
            onSelectionChanged: (value) {
              onThemeModeChanged(value.first);
            },
          ),
        ),
        const SizedBox(height: 12),
        SectionCard(
          title: 'Language policy',
          icon: Icons.translate_rounded,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _PolicyRow(
                label: 'Application interface',
                value: 'English',
              ),
              const SizedBox(height: 10),
              const _PolicyRow(
                label: 'Clinical pharmacist content',
                value: 'English',
              ),
              const SizedBox(height: 10),
              const _PolicyRow(
                label: 'Patient counseling',
                value: 'Arabic · RTL',
              ),
              const SizedBox(height: 12),
              Text(
                'Arabic is intentionally limited to the patient-facing counseling block so the professional interface stays consistent and easy to scan.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const SectionCard(
          title: 'Clinical content status',
          icon: Icons.fact_check_outlined,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _StatusRow(
                icon: Icons.verified_outlined,
                title: 'Versioned sources',
                detail:
                    'Every record stores source authority, version and review metadata.',
              ),
              SizedBox(height: 14),
              _StatusRow(
                icon: Icons.layers_outlined,
                title: 'Formulation-specific',
                detail:
                    'Different products and populations stay in separate profiles.',
              ),
              SizedBox(height: 14),
              _StatusRow(
                icon: Icons.lock_outline_rounded,
                title: 'Safety-gated tools',
                detail:
                    'Profile validation happens before linked calculations are enabled.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PolicyRow extends StatelessWidget {
  const _PolicyRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(child: Text(label)),
        Text(
          value,
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class _StatusRow extends StatelessWidget {
  const _StatusRow({
    required this.icon,
    required this.title,
    required this.detail,
  });

  final IconData icon;
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: theme.colorScheme.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                detail,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
