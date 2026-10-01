import 'package:flutter/material.dart';

import '../data/vitamin_toolkit_data.dart';
import '../domain/vitamin_toolkit_models.dart';

class VitaminToolkitScreen extends StatefulWidget {
  const VitaminToolkitScreen({
    super.key,
    this.initialId = VitaminId.vitaminB12,
  });

  final VitaminId initialId;

  @override
  State<VitaminToolkitScreen> createState() => _VitaminToolkitScreenState();
}

class _VitaminToolkitScreenState extends State<VitaminToolkitScreen> {
  late VitaminId _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialId;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final entry = vitaminEntry(_selected);

    return Scaffold(
      appBar: AppBar(title: const Text('Vitamin Clinical Toolkit')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 32),
        children: [
          Text(
            'One vitamin does not have one dose for every use',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            'Nutrition target ≠ prevention dose ≠ deficiency treatment. Choose the vitamin form and regimen only after defining the clinical question.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 14),
          DropdownButton<VitaminId>(
            isExpanded: true,
            value: _selected,
            items: vitaminToolkitEntries
                .map(
                  (item) => DropdownMenuItem(
                    value: item.id,
                    child: Text(item.name),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) setState(() => _selected = value);
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
                  entry.name,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 7),
                Text(entry.coreRule, style: const TextStyle(height: 1.5)),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'Forms that matter',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final form in entry.forms)
            Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                title: Text(
                  form.name,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                subtitle: Text(form.practicalDifference),
              ),
            ),
          const SizedBox(height: 18),
          Text(
            'Clinical pathways',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final pathway in entry.pathways)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ExpansionTile(
                title: Text(
                  pathway.title,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                subtitle: Text(pathway.population),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  _Fact(label: 'Dose / regimen', body: pathway.dose),
                  _Fact(label: 'When to use', body: pathway.whenToUse),
                  _Fact(label: 'Duration', body: pathway.duration),
                  _Fact(label: 'Monitoring', body: pathway.monitoring),
                  _Fact(
                    label: 'Safety lock',
                    body: pathway.caveat,
                    critical: true,
                  ),
                  Text(
                    'Source: ' + pathway.sourceLabel,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 18),
          Text(
            'Safety & common traps',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final item in entry.safety)
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: theme.colorScheme.errorContainer.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(item, style: const TextStyle(height: 1.45)),
            ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(17),
            decoration: BoxDecoration(
              color: theme.colorScheme.secondaryContainer.withValues(alpha: 0.55),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Mitochondrial / Neurometabolic Bridge',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  mitochondrialCocktailRule,
                  style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          for (final item in mitochondrialSupportItems)
            Card(
              margin: const EdgeInsets.only(bottom: 9),
              child: ExpansionTile(
                title: Text(
                  item.ingredient,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  _Fact(label: 'When used', body: item.whenUsed),
                  _Fact(label: 'Dose', body: item.dose),
                  _Fact(label: 'Evidence', body: item.evidence),
                  _Fact(
                    label: 'Do not generalize',
                    body: item.safetyLock,
                    critical: true,
                  ),
                  Text(
                    'Source: ' + item.sourceLabel,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
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
