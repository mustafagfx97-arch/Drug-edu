import 'package:flutter/material.dart';

import '../data/mineral_toolkit_data.dart';
import '../domain/mineral_toolkit_models.dart';

class MineralToolkitScreen extends StatefulWidget {
  const MineralToolkitScreen({super.key});

  @override
  State<MineralToolkitScreen> createState() => _MineralToolkitScreenState();
}

class _MineralToolkitScreenState extends State<MineralToolkitScreen> {
  MineralId _selected = MineralId.iron;
  String? _presetId;
  bool _saltToElemental = true;
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  double get _amount => double.tryParse(_amountController.text.trim()) ?? 0;

  String _format(double value) {
    if (value == value.roundToDouble()) return value.toInt().toString();
    if (value.abs() < 10) return value.toStringAsFixed(2);
    return value.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final entry = mineralEntry(_selected);
    final convertible = entry.presets
        .where((preset) => preset.elementalFraction != null)
        .toList();
    final selectedPreset = convertible.firstWhere(
      (preset) => preset.id == (_presetId ?? convertible.first.id),
      orElse: () => convertible.first,
    );

    final conversion = _saltToElemental
        ? elementalFromSalt(
            saltAmountMg: _amount,
            elementalFraction: selectedPreset.elementalFraction!,
          )
        : saltFromElemental(
            elementalAmountMg: _amount,
            elementalFraction: selectedPreset.elementalFraction!,
          );

    return Scaffold(
      appBar: AppBar(title: const Text('Mineral Clinical Toolkit')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 32),
        children: [
          Text(
            'من الملح إلى الجرعة الفعلية',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            'Iron, calcium, magnesium and zinc: indication first, then elemental dose, salt choice, interactions and monitoring.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 14),
          SegmentedButton<MineralId>(
            segments: const [
              ButtonSegment(value: MineralId.iron, label: Text('Iron')),
              ButtonSegment(value: MineralId.calcium, label: Text('Ca')),
              ButtonSegment(value: MineralId.magnesium, label: Text('Mg')),
              ButtonSegment(value: MineralId.zinc, label: Text('Zinc')),
            ],
            selected: {_selected},
            onSelectionChanged: (value) {
              setState(() {
                _selected = value.first;
                _presetId = null;
                _amountController.clear();
              });
            },
          ),
          const SizedBox(height: 14),
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
                  entry.name + ' — ' + entry.nameAr,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  entry.coreRule,
                  style: theme.textTheme.bodyLarge?.copyWith(height: 1.5),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'Evidence-based dose pathways',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final protocol in entry.protocols)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ExpansionTile(
                title: Text(
                  protocol.title,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                subtitle: Text(protocol.population),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  _Fact(label: 'Dose', body: protocol.dose),
                  _Fact(label: 'Frequency', body: protocol.frequency),
                  _Fact(label: 'Duration', body: protocol.duration),
                  _Fact(label: 'When to use', body: protocol.whenToUse),
                  _Fact(label: 'Monitoring', body: protocol.monitoring),
                  _Fact(
                    label: 'Safety lock',
                    body: protocol.caveat,
                    critical: true,
                  ),
                  Text(
                    'Source: ' + protocol.sourceLabel,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 18),
          Text(
            'Salts & elemental content',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final preset in entry.presets)
            Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                title: Text(
                  preset.name,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                subtitle: Text(
                  (preset.elementalFraction == null
                          ? 'Label-controlled conversion'
                          : (_format(preset.elementalFraction! * 100) +
                              '% elemental by salt weight')) +
                      '\n' +
                      preset.note,
                ),
                isThreeLine: true,
              ),
            ),
          const SizedBox(height: 16),
          Card(
            color: theme.colorScheme.surfaceContainerLow,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Salt ↔ Elemental Calculator',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Only salts with a sufficiently defined conversion are enabled. For variable hydration/chelate products, use the product’s labeled elemental amount.',
                    style: theme.textTheme.bodySmall?.copyWith(height: 1.45),
                  ),
                  const SizedBox(height: 12),
                  DropdownButton<String>(
                    isExpanded: true,
                    value: selectedPreset.id,
                    items: convertible
                        .map(
                          (preset) => DropdownMenuItem(
                            value: preset.id,
                            child: Text(preset.name),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _presetId = value;
                          _amountController.clear();
                        });
                      }
                    },
                  ),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    value: _saltToElemental,
                    title: Text(
                      _saltToElemental
                          ? 'Salt mg → Elemental mg'
                          : 'Elemental mg → Salt mg',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _saltToElemental = value;
                        _amountController.clear();
                      });
                    },
                  ),
                  TextField(
                    controller: _amountController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: _saltToElemental
                          ? 'Salt amount (mg)'
                          : 'Target elemental amount (mg)',
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 12),
                  _ResultLine(
                    label: _saltToElemental
                        ? 'Elemental amount'
                        : 'Required salt amount',
                    value: _saltToElemental
                        ? _format(conversion.elementalAmountMg) + ' mg'
                        : _format(conversion.saltAmountMg) + ' mg',
                  ),
                  if (_selected == MineralId.calcium) ...[
                    const SizedBox(height: 5),
                    Text(
                      'If this is supplemental elemental calcium, keep individual doses around 500 mg or less when practical. A total of ' +
                          _format(conversion.elementalAmountMg) +
                          ' mg would require at least ' +
                          calciumSplitDoseCount(conversion.elementalAmountMg)
                              .toString() +
                          ' dose(s) by that rule.',
                      style: theme.textTheme.bodySmall?.copyWith(height: 1.4),
                    ),
                  ],
                  const SizedBox(height: 7),
                  Text(
                    'Product label overrides any calculated salt percentage when an elemental amount is printed.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.error,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'Interactions & timing',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final interaction in entry.interactions)
            Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                title: Text(
                  interaction.withItem,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                subtitle: Text(
                  interaction.separation + '\n' + interaction.note,
                ),
              ),
            ),
          const SizedBox(height: 18),
          Text(
            'Safety locks',
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
                color: theme.colorScheme.errorContainer.withValues(alpha: 0.55),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(item, style: const TextStyle(height: 1.45)),
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

class _ResultLine extends StatelessWidget {
  const _ResultLine({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(label)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w900)),
      ],
    );
  }
}
