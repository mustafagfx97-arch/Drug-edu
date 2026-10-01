import 'package:flutter/material.dart';

import '../data/expanded_catalog_data.dart';
import '../domain/expanded_supplement_models.dart';

class ExpandedSupplementDetailScreen extends StatelessWidget {
  const ExpandedSupplementDetailScreen({
    super.key,
    required this.profileId,
  });

  final String profileId;

  String _evidenceLabel(ExpandedEvidence value) => switch (value) {
        ExpandedEvidence.strong => 'Strong / established in the stated context',
        ExpandedEvidence.moderate => 'Moderate evidence',
        ExpandedEvidence.contextSpecific => 'Context-specific',
        ExpandedEvidence.limited => 'Limited evidence',
        ExpandedEvidence.insufficient => 'Insufficient evidence',
        ExpandedEvidence.notRecommended => 'Not routinely recommended',
        ExpandedEvidence.avoid => 'Avoid',
        ExpandedEvidence.regulatoryWarning => 'Regulatory / safety warning',
      };

  Color _evidenceColor(BuildContext context, ExpandedEvidence value) {
    final scheme = Theme.of(context).colorScheme;
    return switch (value) {
      ExpandedEvidence.strong => scheme.primaryContainer,
      ExpandedEvidence.moderate => scheme.secondaryContainer,
      ExpandedEvidence.contextSpecific => scheme.tertiaryContainer,
      ExpandedEvidence.limited => scheme.surfaceContainerHighest,
      ExpandedEvidence.insufficient => scheme.surfaceContainerHighest,
      ExpandedEvidence.notRecommended => scheme.errorContainer,
      ExpandedEvidence.avoid => scheme.errorContainer,
      ExpandedEvidence.regulatoryWarning => scheme.errorContainer,
    };
  }

  @override
  Widget build(BuildContext context) {
    final item = expandedSupplementProfile(profileId);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 14, 18, 32),
        children: [
          Text(
            item.subtitle,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
            decoration: BoxDecoration(
              color: _evidenceColor(context, item.evidence),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              _evidenceLabel(item.evidence),
              style: const TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(height: 12),
          _InfoBox(
            title: 'Clinical rule',
            body: item.coreRule,
            icon: Icons.rule_rounded,
            critical: item.evidence == ExpandedEvidence.avoid ||
                item.evidence == ExpandedEvidence.regulatoryWarning ||
                item.evidence == ExpandedEvidence.notRecommended,
          ),
          const SizedBox(height: 10),
          _InfoBox(
            title: 'Why it is used',
            body: item.whyUsed,
            icon: Icons.info_outline_rounded,
          ),
          const SizedBox(height: 18),
          Text(
            'Dose pathways',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final dose in item.dosePathways)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dose.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 9),
                    _Fact('Population', dose.population),
                    _Fact('Dose', dose.dose, important: true),
                    _Fact('Timing', dose.timing),
                    _Fact('Duration', dose.duration),
                    _Fact('Clinical note', dose.note),
                  ],
                ),
              ),
            ),
          if (item.administration.isNotEmpty)
            _ListSection(
              title: 'How to use it',
              icon: Icons.medication_outlined,
              items: item.administration,
            ),
          if (item.commonActionable.isNotEmpty)
            _ListSection(
              title: 'Common / actionable problems',
              icon: Icons.report_problem_outlined,
              items: item.commonActionable,
            ),
          if (item.interactions.isNotEmpty)
            _ListSection(
              title: 'Important interactions',
              icon: Icons.compare_arrows_rounded,
              items: item.interactions,
            ),
          if (item.monitoring.isNotEmpty)
            _ListSection(
              title: 'Monitoring',
              icon: Icons.monitor_heart_outlined,
              items: item.monitoring,
            ),
          if (item.avoidOrRefer.isNotEmpty)
            _ListSection(
              title: 'Avoid / refer',
              icon: Icons.health_and_safety_outlined,
              items: item.avoidOrRefer,
              critical: true,
            ),
          if (item.labelChecks.isNotEmpty)
            _ListSection(
              title: 'What to check on the label',
              icon: Icons.fact_check_outlined,
              items: item.labelChecks,
            ),
          const SizedBox(height: 4),
          _InfoBox(
            title: 'Evidence source',
            body: item.sourceLabel,
            icon: Icons.verified_outlined,
          ),
        ],
      ),
    );
  }
}

class _ListSection extends StatelessWidget {
  const _ListSection({
    required this.title,
    required this.icon,
    required this.items,
    this.critical = false,
  });

  final String title;
  final IconData icon;
  final List<String> items;
  final bool critical;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: critical ? theme.colorScheme.error : null,
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: critical ? theme.colorScheme.error : null,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 9),
            for (final text in items)
              Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Text(
                  '• ' + text,
                  style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
                ),
              ),
          ],
        ),
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
            ? theme.colorScheme.errorContainer.withValues(alpha: 0.55)
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
  const _Fact(this.label, this.body, {this.important = false});

  final String label;
  final String body;
  final bool important;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: RichText(
        text: TextSpan(
          style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
          children: [
            TextSpan(
              text: label + ': ',
              style: const TextStyle(fontWeight: FontWeight.w900),
            ),
            TextSpan(
              text: body,
              style: important
                  ? TextStyle(
                      fontWeight: FontWeight.w800,
                      color: theme.colorScheme.primary,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
