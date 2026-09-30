import 'package:flutter/material.dart';

import '../data/herbal_toolkit_data.dart';
import '../domain/herbal_toolkit_models.dart';

class HerbalToolkitScreen extends StatefulWidget {
  const HerbalToolkitScreen({super.key});

  @override
  State<HerbalToolkitScreen> createState() => _HerbalToolkitScreenState();
}

class _HerbalToolkitScreenState extends State<HerbalToolkitScreen> {
  String _selectedId = 'black-cohosh';

  String _evidence(HerbalEvidence value) => switch (value) {
        HerbalEvidence.moderate => 'Moderate',
        HerbalEvidence.limited => 'Limited',
        HerbalEvidence.conflicting => 'Conflicting',
        HerbalEvidence.insufficient => 'Insufficient',
        HerbalEvidence.againstRoutineUse => 'Against routine use',
        HerbalEvidence.highRiskInteraction => 'High interaction risk',
        HerbalEvidence.productSpecific => 'Product specific',
      };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final profile = herbalProfile(_selectedId);

    return Scaffold(
      appBar: AppBar(title: const Text('Herbals, Menopause & Nerves')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 32),
        children: [
          Text(
            'الدليل أولًا، وليس اسم العشبة',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            'Menopause, stress, sleep, mood and cognition: exact studied form, dose, duration and the reason NOT to generalize one extract to every product.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 14),
          DropdownButton<String>(
            isExpanded: true,
            value: _selectedId,
            items: herbalProfiles
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
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  profile.name,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  profile.category,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(profile.keyRule, style: const TextStyle(height: 1.5)),
              ],
            ),
          ),
          const SizedBox(height: 18),
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
                subtitle: Text(
                  use.population + ' • ' + _evidence(use.evidence),
                ),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  _Fact(label: 'Form / extract', body: use.formOrExtract),
                  _Fact(label: 'Dose', body: use.dose),
                  _Fact(label: 'Frequency', body: use.frequency),
                  _Fact(label: 'Duration', body: use.duration),
                  _Fact(label: 'Exactly how to use', body: use.exactUse),
                  _Fact(
                    label: 'Do not generalize',
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
          const SizedBox(height: 18),
          Text(
            'Safety / interactions',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final item in profile.safety)
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: theme.colorScheme.errorContainer.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(item, style: const TextStyle(height: 1.45)),
            ),
          const SizedBox(height: 22),
          _LockSection(
            title: 'Menopause safety locks',
            items: menopauseGlobalLocks,
          ),
          const SizedBox(height: 18),
          _LockSection(
            title: 'Neuro / mood / sleep safety locks',
            items: neuroGlobalLocks,
          ),
        ],
      ),
    );
  }
}

class _LockSection extends StatelessWidget {
  const _LockSection({required this.title, required this.items});

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 8),
        for (final item in items)
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              color:
                  theme.colorScheme.secondaryContainer.withValues(alpha: 0.55),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(item, style: const TextStyle(height: 1.45)),
          ),
      ],
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
              color: critical
                  ? theme.colorScheme.error
                  : theme.colorScheme.primary,
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
