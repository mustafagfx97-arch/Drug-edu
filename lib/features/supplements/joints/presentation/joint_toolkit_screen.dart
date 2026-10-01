import 'package:flutter/material.dart';

import '../data/joint_toolkit_data.dart';
import '../domain/joint_toolkit_models.dart';

class JointToolkitScreen extends StatefulWidget {
  const JointToolkitScreen({
    super.key,
    this.initialProfileId = 'glucosamine',
  });

  final String initialProfileId;

  @override
  State<JointToolkitScreen> createState() => _JointToolkitScreenState();
}

class _JointToolkitScreenState extends State<JointToolkitScreen> {
  late String _selectedId;

  @override
  void initState() {
    super.initState();
    _selectedId = jointSupplementProfiles.any(
      (profile) => profile.id == widget.initialProfileId,
    )
        ? widget.initialProfileId
        : 'glucosamine';
  }

  String _evidence(JointEvidence value) => switch (value) {
        JointEvidence.moderate => 'Moderate / context-specific',
        JointEvidence.limited => 'Limited',
        JointEvidence.conflicting => 'Conflicting',
        JointEvidence.insufficient => 'Insufficient',
        JointEvidence.againstRoutineUse => 'Against routine use',
      };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final profile = jointSupplement(_selectedId);

    return Scaffold(
      appBar: AppBar(title: const Text('Joint & Collagen Toolkit')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 32),
        children: [
          Text(
            'Joint supplements: formulation matters',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            'Glucosamine, chondroitin, collagen types, MSM and oral hyaluronic acid with exact study doses, duration, evidence boundaries and safety.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 14),
          DropdownButton<String>(
            isExpanded: true,
            value: _selectedId,
            items: jointSupplementProfiles
                .map(
                  (item) => DropdownMenuItem(
                    value: item.id,
                    child: Text(item.name + ' — ' + item.category),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) setState(() => _selectedId = value);
            },
          ),
          const SizedBox(height: 12),
          _InfoBox(
            title: profile.name,
            body: profile.coreRule,
            critical: false,
          ),
          const SizedBox(height: 16),
          Text(
            'Forms / what the label really means',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final form in profile.forms)
            _InfoBox(title: form.name, body: form.meaning, critical: false),
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
            _InfoBox(title: 'Safety', body: item, critical: true),
          const SizedBox(height: 22),
          Text(
            'Collagen type map',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final item in collagenTypeReference)
            Card(
              child: ListTile(
                title: Text(
                  item.type,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                subtitle: Text(
                  item.whereItMatters + '\n' + item.supplementMeaning,
                ),
              ),
            ),
          const SizedBox(height: 22),
          Text(
            'Global clinical locks',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final item in jointGlobalLocks)
            _InfoBox(title: 'Clinical lock', body: item, critical: true),
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

class _InfoBox extends StatelessWidget {
  const _InfoBox({
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
            ? theme.colorScheme.errorContainer.withValues(alpha: 0.5)
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
