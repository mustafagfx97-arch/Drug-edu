import 'package:flutter/material.dart';

import '../../domain/supplement_profile.dart';

class SupplementEncyclopediaDetailScreen extends StatelessWidget {
  const SupplementEncyclopediaDetailScreen({
    super.key,
    required this.profile,
  });

  final SupplementProfile profile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(profile.name)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 14, 18, 32),
        children: [
          Text(
            profile.subtitle,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            profile.formulation,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 14),
          _InfoBox(
            title: 'How to take it',
            body: profile.howToTakeEn,
            icon: Icons.restaurant_outlined,
          ),
          if (profile.useBasis.isNotEmpty) ...[
            const SizedBox(height: 10),
            _InfoBox(
              title: 'When it is actually used',
              body: profile.useBasis,
              icon: Icons.fact_check_outlined,
            ),
          ],
          if (profile.monitoringEn.isNotEmpty) ...[
            const SizedBox(height: 10),
            _InfoBox(
              title: 'Monitoring / labs',
              body: profile.monitoringEn,
              icon: Icons.biotech_outlined,
            ),
          ],
          if (profile.formulationAlert.isNotEmpty) ...[
            const SizedBox(height: 10),
            _InfoBox(
              title: 'Formulation alert',
              body: profile.formulationAlert,
              icon: Icons.warning_amber_rounded,
              critical: true,
            ),
          ],
          if (profile.saltVariants.isNotEmpty) ...[
            const SizedBox(height: 18),
            Text(
              'Forms / salts that matter',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 8),
            for (final variant in profile.saltVariants)
              Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: ExpansionTile(
                  title: Text(
                    variant.name,
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                  subtitle:
                      variant.formula.isEmpty ? null : Text(variant.formula),
                  childrenPadding:
                      const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  children: [
                    _Fact('Elemental amount', variant.elementalAmount),
                    if (variant.elementalPercent.isNotEmpty)
                      _Fact('Elemental fraction', variant.elementalPercent),
                    if (variant.example.isNotEmpty)
                      _Fact('Example', variant.example),
                    _Fact('Best practical use', variant.practicalUse),
                    _Fact('How to take', variant.administration),
                    _Fact('Cautions', variant.cautions),
                    _Fact('Source', variant.source),
                  ],
                ),
              ),
          ],
          const SizedBox(height: 8),
          for (final section in profile.pharmacistSections)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      section.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      section.body,
                      style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 8),
          _InfoBox(
            title: 'Source',
            body: profile.sourceLabel,
            icon: Icons.verified_outlined,
          ),
        ],
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  const _InfoBox({
    required this.title,
    required this.body,
    required this.icon,
    this.critical = false,
  });

  final String title;
  final String body;
  final IconData icon;
  final bool critical;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: critical
            ? theme.colorScheme.errorContainer.withValues(alpha: 0.45)
            : theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: critical ? theme.colorScheme.error : null),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  body,
                  style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Fact extends StatelessWidget {
  const _Fact(this.label, this.body);

  final String label;
  final String body;

  @override
  Widget build(BuildContext context) {
    if (body.trim().isEmpty) return const SizedBox.shrink();
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
            style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
            children: [
              TextSpan(
                text: '$label: ',
                style: const TextStyle(fontWeight: FontWeight.w900),
              ),
              TextSpan(text: body),
            ],
          ),
        ),
      ),
    );
  }
}
