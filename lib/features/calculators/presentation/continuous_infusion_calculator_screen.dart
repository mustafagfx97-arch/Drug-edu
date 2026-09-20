import 'package:flutter/material.dart';

class ContinuousInfusionCalculatorScreen extends StatefulWidget {
  const ContinuousInfusionCalculatorScreen({super.key});

  @override
  State<ContinuousInfusionCalculatorScreen> createState() =>
      _ContinuousInfusionCalculatorScreenState();
}

class _ContinuousInfusionCalculatorScreenState
    extends State<ContinuousInfusionCalculatorScreen> {
  final _weightController = TextEditingController();
  final _rateController = TextEditingController();

  static const double _concentration = 32;

  @override
  void dispose() {
    _weightController.dispose();
    _rateController.dispose();
    super.dispose();
  }

  double? get _weight => double.tryParse(_weightController.text.trim());
  double? get _rate => double.tryParse(_rateController.text.trim());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    double? totalPerMinute;
    double? totalPerHour;
    double? pumpRate;

    if (_weight != null && _rate != null) {
      totalPerMinute = _weight! * _rate!;
      totalPerHour = totalPerMinute * 60;
      pumpRate = totalPerHour / _concentration;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Continuous Infusion')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withOpacity(0.55),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Text(
              'V1 sample profile: PICU norepinephrine 32 mcg/mL. Enter the prescribed mcg/kg/min rate; the calculator does not choose it.',
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Norepinephrine · PICU',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('Prepared concentration: 32 mcg/mL'),
                  const Text('Dosing basis: mcg/kg/min'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _weightController,
            keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(labelText: 'Weight (kg)'),
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _rateController,
            keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Prescribed rate (mcg/kg/min)',
            ),
            onChanged: (_) => setState(() {}),
          ),
          if (pumpRate != null) ...[
            const SizedBox(height: 14),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(17),
                child: Column(
                  children: [
                    _row(
                      'Total dose/min',
                      '${_fmt(totalPerMinute!)} mcg/min',
                    ),
                    _row(
                      'Total dose/hr',
                      '${_fmt(totalPerHour!)} mcg/hr',
                    ),
                    _row('Concentration', '32 mcg/mL'),
                    const Divider(),
                    _row(
                      'Pump rate',
                      '${_fmt(pumpRate)} mL/hr',
                      strong: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  static Widget _row(String label, String value, {bool strong = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Text(
            value,
            style: TextStyle(
              fontWeight: strong ? FontWeight.w900 : FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  static String _fmt(double value) {
    final text = value.toStringAsFixed(3);
    return text
        .replaceFirst(RegExp(r'0+$'), '')
        .replaceFirst(RegExp(r'\.$'), '');
  }
}
