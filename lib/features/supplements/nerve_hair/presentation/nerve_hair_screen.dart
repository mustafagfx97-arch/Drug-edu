import 'package:flutter/material.dart';

import '../data/nerve_hair_data.dart';
import '../domain/nerve_hair_models.dart';

class NerveHairScreen extends StatefulWidget {
  const NerveHairScreen({super.key});

  @override
  State<NerveHairScreen> createState() => _NerveHairScreenState();
}

class _NerveHairScreenState extends State<NerveHairScreen> {
  String _selectedId = 'biotin';

  String _evidence(NerveHairEvidence value) => switch (value) {
        NerveHairEvidence.nutritional => 'Nutritional / daily intake',
        NerveHairEvidence.limited => 'Limited',
        NerveHairEvidence.conflicting => 'Conflicting',
        NerveHairEvidence.insufficient => 'Insufficient',
        NerveHairEvidence.againstRoutineUse => 'Against routine use',
        NerveHairEvidence.treatmentOnly => 'Treatment only',
      };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final profile = nerveHairProfile(_selectedId);

    return Scaffold(
      appBar: AppBar(title: const Text('Nerves, Biotin & Hair/Nails')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 32),
        children: [
          Text(
            'الأعصاب والشعر: الجرعة تغيّر معنى المكمل',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 7),
          const Text(
            'Low nutritional doses, high-potency retail products and disease-study doses are shown separately so mcg, mg and evidence are not mixed.',
          ),
          const SizedBox(height: 12),
          for (final item in nerveHairGlobalLocks)
            _Box(title: 'CLINICAL LOCK', body: item, critical: true),
          const SizedBox(height: 12),
          DropdownButton<String>(
            isExpanded: true,
            value: _selectedId,
            items: nerveHairProfiles
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
          _Box(title: profile.name, body: profile.coreRule, critical: false),
          const SizedBox(height: 14),
          for (final use in profile.uses)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ExpansionTile(
                title: Text(
                  use.indication,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                subtitle: Text(_evidence(use.evidence)),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
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
          const SizedBox(height: 12),
          Text(
            'Safety / what commonly goes wrong',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final item in profile.safety)
            _Box(title: 'Safety', body: item, critical: true),
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
