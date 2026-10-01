import 'package:flutter/material.dart';

import '../data/product_analyzer_data.dart';
import '../domain/product_analyzer_models.dart';

class ProductAnalyzerScreen extends StatefulWidget {
  const ProductAnalyzerScreen({super.key});

  @override
  State<ProductAnalyzerScreen> createState() => _ProductAnalyzerScreenState();
}

class _ProductAnalyzerScreenState extends State<ProductAnalyzerScreen> {
  final _productController = TextEditingController();
  final _amountController = TextEditingController();
  final _servingsController = TextEditingController(text: '1');

  String _ingredientId = 'magnesium';
  bool _amountKnown = true;
  final List<AnalyzerLine> _lines = [];
  final Set<PatientMedicationFlag> _flags = {};

  @override
  void dispose() {
    _productController.dispose();
    _amountController.dispose();
    _servingsController.dispose();
    super.dispose();
  }

  String _unit(AnalyzerUnit unit) => switch (unit) {
        AnalyzerUnit.mg => 'mg',
        AnalyzerUnit.mcg => 'mcg',
        AnalyzerUnit.iu => 'IU',
        AnalyzerUnit.cfu => 'CFU',
      };

  String _format(double value) {
    if (value == value.roundToDouble()) return value.toInt().toString();
    if (value.abs() < 10) return value.toStringAsFixed(2);
    return value.toStringAsFixed(1);
  }

  void _addLine() {
    final name = _productController.text.trim().isEmpty
        ? 'Unnamed product'
        : _productController.text.trim();
    final amount = double.tryParse(_amountController.text.trim()) ?? 0;
    final servings = double.tryParse(_servingsController.text.trim()) ?? 0;
    setState(() {
      _lines.add(
        AnalyzerLine(
          productName: name,
          ingredientId: _ingredientId,
          amountPerServing: amount,
          servingsPerDay: servings,
          amountKnown: _amountKnown,
        ),
      );
      _amountController.clear();
    });
  }

  void _loadProduct(RealProductProfile product) {
    if (product.analyzerLines.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'This product is shown for label literacy but has no quantitative analyzer lines to import.',
          ),
        ),
      );
      return;
    }
    setState(() => _lines.addAll(product.analyzerLines));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rule = analyzerRule(_ingredientId);
    final result = analyzeSupplementLines(
      lines: _lines,
      medicationFlags: _flags,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Product & Combination Analyzer')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 32),
        children: [
          Text(
            'افتح Supplement Facts بدل الاعتماد على اسم المنتج',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            'Aggregate daily doses across products, detect duplicates, compare supported UL references, and flag hidden proprietary/pooled amounts.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            '1. Add label lines',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _productController,
            decoration: const InputDecoration(
              labelText: 'Product name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          DropdownButton<String>(
            isExpanded: true,
            value: _ingredientId,
            items: analyzerIngredientRules
                .map(
                  (item) => DropdownMenuItem(
                    value: item.id,
                    child: Text(item.name),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _ingredientId = value;
                  _amountController.clear();
                });
              }
            },
          ),
          Text(
            rule.amountBasis,
            style: theme.textTheme.bodySmall?.copyWith(height: 1.4),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  enabled: _amountKnown,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText:
                        'Amount per serving (' + _unit(rule.unit) + ')',
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 120,
                child: TextField(
                  controller: _servingsController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'Servings/day',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            value: _amountKnown,
            title: const Text('Exact amount is stated on the label'),
            subtitle: const Text(
              'Turn OFF for a proprietary blend / pooled amount that hides this ingredient dose.',
            ),
            onChanged: (value) => setState(() => _amountKnown = value),
          ),
          FilledButton.icon(
            onPressed: _addLine,
            icon: const Icon(Icons.add_rounded),
            label: const Text('Add label line'),
          ),
          if (_lines.isNotEmpty) ...[
            const SizedBox(height: 12),
            for (var i = 0; i < _lines.length; i++)
              Card(
                child: ListTile(
                  title: Text(_lines[i].productName),
                  subtitle: Text(
                    analyzerRule(_lines[i].ingredientId).name +
                        ' • ' +
                        (_lines[i].amountKnown
                            ? _format(_lines[i].amountPerServing) +
                                ' ' +
                                _unit(
                                  analyzerRule(_lines[i].ingredientId).unit,
                                ) +
                                ' × ' +
                                _format(_lines[i].servingsPerDay) +
                                '/day'
                            : 'amount hidden / pooled'),
                  ),
                  trailing: IconButton(
                    onPressed: () => setState(() => _lines.removeAt(i)),
                    icon: const Icon(Icons.delete_outline_rounded),
                  ),
                ),
              ),
          ],
          const SizedBox(height: 22),
          Text(
            '2. Patient context',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          _FlagTile(
            title: 'Levothyroxine',
            flag: PatientMedicationFlag.levothyroxine,
            selected: _flags,
            onChanged: () => setState(() {}),
          ),
          _FlagTile(
            title: 'Tetracycline / quinolone antibiotic',
            flag: PatientMedicationFlag.tetracyclineOrQuinolone,
            selected: _flags,
            onChanged: () => setState(() {}),
          ),
          _FlagTile(
            title: 'Warfarin',
            flag: PatientMedicationFlag.warfarin,
            selected: _flags,
            onChanged: () => setState(() {}),
          ),
          _FlagTile(
            title: 'Upcoming biotin-sensitive lab tests',
            flag: PatientMedicationFlag.upcomingBiotinSensitiveLabs,
            selected: _flags,
            onChanged: () => setState(() {}),
          ),
          _FlagTile(
            title: 'Levodopa',
            flag: PatientMedicationFlag.levodopa,
            selected: _flags,
            onChanged: () => setState(() {}),
          ),
          _FlagTile(
            title: 'Penicillamine',
            flag: PatientMedicationFlag.penicillamine,
            selected: _flags,
            onChanged: () => setState(() {}),
          ),
          _FlagTile(
            title: 'Dolutegravir',
            flag: PatientMedicationFlag.dolutegravir,
            selected: _flags,
            onChanged: () => setState(() {}),
          ),
          _FlagTile(
            title: 'Renal impairment / reduced kidney function',
            flag: PatientMedicationFlag.renalImpairment,
            selected: _flags,
            onChanged: () => setState(() {}),
          ),
          _FlagTile(
            title: 'Pregnant or could become pregnant',
            flag: PatientMedicationFlag.pregnantOrCouldBecomePregnant,
            selected: _flags,
            onChanged: () => setState(() {}),
          ),
          const SizedBox(height: 22),
          Text(
            '3. Analysis',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          if (_lines.isEmpty)
            const Text('Add at least one label line to analyze.')
          else ...[
            for (final summary in result.summaries)
              Card(
                child: ListTile(
                  title: Text(
                    analyzerRule(summary.ingredientId).name,
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                  subtitle: Text(
                    'Known daily total: ' +
                        _format(summary.totalPerDay) +
                        ' ' +
                        _unit(analyzerRule(summary.ingredientId).unit) +
                        '\nProducts: ' +
                        summary.productNames.join(', ') +
                        (summary.hiddenLines > 0
                            ? '\nHidden/pooled lines: ' +
                                summary.hiddenLines.toString()
                            : ''),
                  ),
                ),
              ),
            _Messages(
              title: 'Duplicate ingredients',
              messages: result.duplicateMessages,
              critical: false,
            ),
            _Messages(
              title: 'UL / threshold review',
              messages: result.thresholdMessages,
              critical: true,
            ),
            _Messages(
              title: 'Medication / lab interactions',
              messages: result.interactionMessages,
              critical: true,
            ),
            _Messages(
              title: 'Unknown amounts',
              messages: result.unknownAmountMessages,
              critical: true,
            ),
          ],
          const SizedBox(height: 24),
          Text(
            'Real products — verified examples',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            'These examples teach label interpretation. Product labels can change, so each entry carries a verification date and the official product page as its source.',
            style: theme.textTheme.bodySmall?.copyWith(height: 1.45),
          ),
          const SizedBox(height: 8),
          for (final product in realProductProfiles)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ExpansionTile(
                title: Text(
                  product.brand + ' — ' + product.name,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                subtitle: Text(product.servingSize),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  _Fact(label: 'Suggested use', body: product.suggestedUse),
                  _Fact(label: 'Storage', body: product.storage),
                  const Divider(),
                  for (final item in product.ingredients)
                    _Fact(
                      label: item.name + ': ' + item.amount,
                      body: item.note,
                    ),
                  for (final flag in product.transparencyFlags)
                    _Badge(text: flag, critical: false),
                  for (final lock in product.clinicalLocks)
                    _Badge(text: lock, critical: true),
                  const SizedBox(height: 8),
                  if (product.analyzerLines.isNotEmpty)
                    OutlinedButton.icon(
                      onPressed: () => _loadProduct(product),
                      icon: const Icon(Icons.add_chart_rounded),
                      label: const Text('Load labeled amounts into analyzer'),
                    ),
                  const SizedBox(height: 6),
                  Text(
                    'Source: ' + product.sourceLabel,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 22),
          Text(
            'FDA label-literacy rules',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final item in fdaLabelRules)
            _Badge(text: item, critical: false),
        ],
      ),
    );
  }
}

class _FlagTile extends StatelessWidget {
  const _FlagTile({
    required this.title,
    required this.flag,
    required this.selected,
    required this.onChanged,
  });

  final String title;
  final PatientMedicationFlag flag;
  final Set<PatientMedicationFlag> selected;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      value: selected.contains(flag),
      title: Text(title),
      onChanged: (value) {
        if (value == true) {
          selected.add(flag);
        } else {
          selected.remove(flag);
        }
        onChanged();
      },
    );
  }
}

class _Messages extends StatelessWidget {
  const _Messages({
    required this.title,
    required this.messages,
    required this.critical,
  });

  final String title;
  final List<String> messages;
  final bool critical;

  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty) return const SizedBox.shrink();
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          for (final message in messages)
            _Badge(text: message, critical: critical),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.text, required this.critical});

  final String text;
  final bool critical;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: critical
            ? theme.colorScheme.errorContainer.withValues(alpha: 0.55)
            : theme.colorScheme.secondaryContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(text, style: const TextStyle(height: 1.45)),
    );
  }
}

class _Fact extends StatelessWidget {
  const _Fact({required this.label, required this.body});

  final String label;
  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.primary,
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
