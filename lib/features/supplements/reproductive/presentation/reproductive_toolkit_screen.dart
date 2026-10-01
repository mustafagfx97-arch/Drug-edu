import 'package:flutter/material.dart';

import '../data/reproductive_toolkit_data.dart';
import '../domain/reproductive_toolkit_models.dart';

class ReproductiveToolkitScreen extends StatefulWidget {
  const ReproductiveToolkitScreen({super.key});

  @override
  State<ReproductiveToolkitScreen> createState() =>
      _ReproductiveToolkitScreenState();
}

class _ReproductiveToolkitScreenState extends State<ReproductiveToolkitScreen> {
  String _selectedId = 'l-citrulline';

  String _evidence(ReproEvidence value) => switch (value) {
        ReproEvidence.guidelineRecommended => 'Guideline recommended',
        ReproEvidence.moderate => 'Moderate',
        ReproEvidence.limited => 'Limited',
        ReproEvidence.conflicting => 'Conflicting',
        ReproEvidence.insufficient => 'Insufficient',
        ReproEvidence.researchOnly => 'Research / specialist context',
        ReproEvidence.againstRoutineUse => 'Against routine use',
      };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final profile = reproductiveProfile(_selectedId);

    return Scaffold(
      appBar: AppBar(title: const Text('Sexual Health & Fertility')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 32),
        children: [
          Text(
            'الجنس والخصوبة: لا نبيع وعدًا بدل التشخيص',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            'Separate sexual function from infertility. Study doses are shown exactly, but guideline boundaries, testing and referral come first.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 14),
          DropdownButton<String>(
            isExpanded: true,
            value: _selectedId,
            items: reproductiveProfiles
                .map(
                  (item) => DropdownMenuItem(
                    value: item.id,
                    child: Text(item.name + ' — ' + item.domain),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) setState(() => _selectedId = value);
            },
          ),
          const SizedBox(height: 12),
          _Box(
            title: profile.name,
            body: profile.coreRule,
            critical: false,
          ),
          const SizedBox(height: 16),
          Text(
            'Clinical-use pathways',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final use in profile.uses)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ExpansionTile(
                title: Text(
                  use.indication,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                subtitle: Text(use.population + ' • ' + _evidence(use.evidence)),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  _Fact(label: 'Form', body: use.form),
                  _Fact(label: 'Dose', body: use.dose),
                  _Fact(label: 'Frequency', body: use.frequency),
                  _Fact(label: 'Duration', body: use.duration),
                  _Fact(label: 'Exactly how to use', body: use.exactUse),
                  _Fact(
                    label: 'Evidence boundary',
                    body: use.caveat,
                    critical: true,
                  ),
                  Text(
                    'Source: ' + use.sourceLabel,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 16),
          Text(
            'Safety / common mistakes',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final item in profile.safety)
            _Box(title: 'Safety', body: item, critical: true),
          const SizedBox(height: 22),
          Text(
            'When to test / when to refer',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final rule in reproductiveAssessmentRules)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ExpansionTile(
                title: Text(
                  rule.title,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                subtitle: Text(rule.who),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  for (final action in rule.actions)
                    _Box(title: 'Action', body: action, critical: false),
                  Text(
                    'Source: ' + rule.sourceLabel,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 22),
          Text(
            'Global fertility / sexual-health locks',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final item in reproductiveGlobalLocks)
            _Box(title: 'Clinical lock', body: item, critical: true),
        ],
      ),
    );
  }
}

class _Fact extends StatelessWidget {
  const _Fact({
    required this.label,
    required this.body,
    this.critical = false,
  });

  final String label;
  final String body;
  final bool critical;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            style: theme.textTheme.labelLarge?.copyWith(
              color: critical ? theme.colorScheme.error : theme.colorScheme.primary,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 3),
          Text(body, style: theme.textTheme.bodyMedium?.copyWith(height: 1.45)),
        ],
      ),
    );
  }
}

class _Box extends StatelessWidget {
  const _Box({
    required this.title,
    required this.body,
    required this.critical,
  });

  final String title;
  final String body;
  final bool critical;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: critical
            ? theme.colorScheme.errorContainer.withValues(alpha: 0.52)
            : theme.colorScheme.secondaryContainer.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
          const SizedBox(height: 4),
          Text(body, style: const TextStyle(height: 1.45)),
        ],
      ),
    );
  }
}
