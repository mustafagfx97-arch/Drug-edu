import 'package:flutter/material.dart';

import '../../iv_prep/data/iv_infusion_rate_profiles.dart';
import '../../iv_prep/domain/iv_infusion_rate_engine.dart';

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
  int _index = 0;

  @override
  void dispose() {
    _weightController.dispose();
    _rateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final profile = ivInfusionRateProfiles[_index];
    final enteredRate = double.tryParse(_rateController.text.trim());
    final enteredWeight = double.tryParse(_weightController.text.trim());
    final result = enteredRate == null
        ? null
        : calculateOrderedIvInfusion(
            prescribedRate: enteredRate,
            rateUnit: profile.orderedUnit,
            finalMicrogramsPerMilliliter:
                profile.finalMicrogramsPerMilliliter,
            weightKg: enteredWeight,
          );

    return Scaffold(
      appBar: AppBar(title: const Text('IV Infusion · CCU / ICU')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 32),
        children: [
          Card(
            color: theme.colorScheme.errorContainer,
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'HIGH ALERT: convert ONLY an ALREADY PRESCRIBED order. '
                'This calculator NEVER selects a dose, validates a therapeutic range, '
                'recommends titration, or establishes Y-site compatibility. '
                'Match exact product and FINAL prepared concentration, check units '
                'and pump drug library, and perform independent double-check.',
              ),
            ),
          ),
          const SizedBox(height: 14),
          DropdownButtonFormField<int>(
            key: ValueKey('ccu-iv-selection-' + _index.toString()),
            isExpanded: true,
            initialValue: _index,
            decoration: const InputDecoration(
              labelText: 'Verified FINAL infusion preparation',
            ),
            items: [
              for (var i = 0; i < ivInfusionRateProfiles.length; i++)
                DropdownMenuItem(
                  value: i,
                  child: Text(
                    ivInfusionRateProfiles[i].name,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
            onChanged: (index) {
              if (index == null) return;
              setState(() {
                _index = index;
                _weightController.clear();
                _rateController.clear();
              });
            },
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(profile.presentation),
                  const SizedBox(height: 8),
                  Text(
                    'FINAL concentration: ' +
                        _format(profile.finalMicrogramsPerMilliliter) +
                        ' mcg/mL',
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'Order unit: ' + profile.orderedUnit.display,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 8),
                  Text('Preparation: ' + profile.preparationLock),
                  const SizedBox(height: 7),
                  Text('Fluid / line: ' + profile.compatibilityLock),
                  const SizedBox(height: 7),
                  Text(
                    'Verified product label: ' + profile.sourceUrl,
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          if (profile.orderedUnit.needsWeight) ...[
            const SizedBox(height: 12),
            TextField(
              key: const ValueKey('ccu-iv-weight'),
              controller: _weightController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Ordered dosing weight (kg)',
                helperText: 'Use the weight defined in the patient order.',
              ),
              onChanged: (_) => setState(() {}),
            ),
          ],
          const SizedBox(height: 12),
          TextField(
            key: const ValueKey('ccu-iv-ordered-rate'),
            controller: _rateController,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
            decoration: InputDecoration(
              labelText: 'ALREADY ordered rate (' +
                  profile.orderedUnit.display +
                  ')',
              helperText: 'Enter only the unit printed above.',
            ),
            onChanged: (_) => setState(() {}),
          ),
          if (result != null) ...[
            const SizedBox(height: 14),
            Card(
              color: theme.colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    _row(
                      'Total dose',
                      _format(result.microgramsPerHour) + ' mcg/hr',
                    ),
                    const Divider(),
                    _row(
                      'Calculated pump rate',
                      _format(result.millilitersPerHour) + ' mL/hr',
                      strong: true,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'ARITHMETIC ONLY. Do not program pump without matching '
                      'actual bag concentration and clinical double-check.',
                    ),
                  ],
                ),
              ),
            ),
          ] else if (_rateController.text.trim().isNotEmpty ||
              (profile.orderedUnit.needsWeight &&
                  _weightController.text.trim().isNotEmpty)) ...[
            const SizedBox(height: 14),
            const Text(
              'No result: enter a valid positive prescribed rate and, '
              'for weight-based orders, a valid positive dosing weight.',
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

  static String _format(double value) {
    // Avoid displaying a small positive pump rate as zero.
    if (value > 0 && value < 0.000001) {
      return value.toStringAsExponential(3);
    }
    final precision = value < 0.01 ? 6 : (value < 1 ? 4 : 3);
    final output = value.toStringAsFixed(precision);
    return output
        .replaceFirst(RegExp(r'0+$'), '')
        .replaceFirst(RegExp(r'\\.$'), '');
  }
}
