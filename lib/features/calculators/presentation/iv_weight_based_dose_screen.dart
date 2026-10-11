import 'package:flutter/material.dart';

import '../../iv_prep/data/iv_preparation_profiles.dart';
import '../domain/iv_weight_based_dose_engine.dart';

class IvWeightBasedDoseScreen extends StatefulWidget {
  const IvWeightBasedDoseScreen({super.key});

  @override
  State<IvWeightBasedDoseScreen> createState() =>
      _IvWeightBasedDoseScreenState();
}

class _IvWeightBasedDoseScreenState extends State<IvWeightBasedDoseScreen> {
  final _weightController = TextEditingController();
  final _doseController = TextEditingController();
  int _profileIndex = 0;
  int _variantIndex = 0;
  bool _confirmed = false;

  List<IvPreparationProfile> get _profiles => ivPreparationProfiles
      .where((p) => p.calculatorVariants.isNotEmpty)
      .toList(growable: false);

  @override
  void dispose() {
    _weightController.dispose();
    _doseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final profiles = _profiles;
    final profile = profiles[_profileIndex];
    final variants = profile.calculatorVariants;
    final variant = variants[_variantIndex];
    final weight = double.tryParse(_weightController.text.trim());
    final amountPerKg = double.tryParse(_doseController.text.trim());
    final result = !_confirmed || weight == null || amountPerKg == null
        ? null
        : calculateOrderedWeightBasedWithdrawal(
            prescribedAmountPerKg: amountPerKg,
            dosingWeightKg: weight,
            verifiedStockAmountPerMl: variant.concentration,
          );

    return Scaffold(
      appBar: AppBar(title: const Text('IV weight-based prescribed dose')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 30),
        children: [
          Card(
            color: theme.colorScheme.errorContainer,
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'HIGH ALERT · This is arithmetic ONLY, not prescribing or '
                'validation of a dose. The unit must be the exact product '
                'unit shown. Match the ordered dosing weight, vial strength, '
                'route, indication, dilution, maximum allowed volume and '
                'independent pharmacy checks before administration.',
              ),
            ),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<int>(
            key: ValueKey('weight-iv-profile-$_profileIndex'),
            isExpanded: true,
            initialValue: _profileIndex,
            decoration: const InputDecoration(
              labelText: 'Verified IV product / population',
              border: OutlineInputBorder(),
            ),
            items: [
              for (var i = 0; i < profiles.length; i++)
                DropdownMenuItem(
                  value: i,
                  child: Text(
                    '${profiles[i].name} · ${profiles[i].population}',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
            onChanged: (index) {
              if (index == null) return;
              setState(() {
                _profileIndex = index;
                _variantIndex = 0;
                _confirmed = false;
                _weightController.clear();
                _doseController.clear();
              });
            },
          ),
          const SizedBox(height: 12),
          if (variants.length > 1)
            DropdownButtonFormField<int>(
              key: ValueKey('weight-iv-variant-${_profileIndex}_$_variantIndex'),
              isExpanded: true,
              initialValue: _variantIndex,
              decoration: const InputDecoration(
                labelText: 'Exact presentation / vial',
                border: OutlineInputBorder(),
              ),
              items: [
                for (var i = 0; i < variants.length; i++)
                  DropdownMenuItem(
                    value: i,
                    child: Text(
                      variants[i].label,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
              onChanged: (index) {
                if (index == null) return;
                setState(() {
                  _variantIndex = index;
                  _confirmed = false;
                  _weightController.clear();
                  _doseController.clear();
                });
              },
            ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile.formulation,
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 8),
                  Text('Exact selected concentration: '
                      '${_display(variant.concentration)} '
                      '${variant.unit}/mL'),
                  const SizedBox(height: 8),
                  Text(variant.note),
                  const SizedBox(height: 8),
                  Text('Further dilution: ${profile.furtherDilution}'),
                  const SizedBox(height: 8),
                  Text('Source: ${profile.sourceLabel}',
                      style: theme.textTheme.bodySmall),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            key: const ValueKey('iv-weight-kg'),
            controller: _weightController,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
            decoration: const InputDecoration(
              labelText: 'Prescribed dosing weight (kg)',
              border: OutlineInputBorder(),
            ),
            onChanged: (_) => setState(() => _confirmed = false),
          ),
          const SizedBox(height: 10),
          TextField(
            key: const ValueKey('iv-dose-per-kg'),
            controller: _doseController,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
            decoration: InputDecoration(
              labelText: 'ALREADY prescribed amount (${variant.unit}/kg)',
              border: const OutlineInputBorder(),
            ),
            onChanged: (_) => setState(() => _confirmed = false),
          ),
          const SizedBox(height: 7),
          CheckboxListTile(
            key: const ValueKey('iv-weight-confirm'),
            value: _confirmed,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (value) =>
                setState(() => _confirmed = value ?? false),
            title: const Text(
              'I checked the exact product/strength, ordered dose unit '
              'and patient-specific dosing weight.',
            ),
          ),
          if (result != null)
            Card(
              color: theme.colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Prescribed total amount: '
                        '${_display(result.orderedAmount)} ${variant.unit}'),
                    const SizedBox(height: 9),
                    Text(
                      'Calculated stock withdrawal: '
                      '${_display(result.withdrawalMilliliters)} mL',
                      style: theme.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 9),
                    const Text(
                      'This is the volume at the selected VERIFIED '
                      'concentration, NOT a final infusion volume or '
                      'authorization for direct IV injection.',
                    ),
                  ],
                ),
              ),
            )
          else if (_confirmed)
            const Text(
              'No result: enter positive, finite dosing weight and '
              'prescribed amount per kg.',
            ),
          for (final lock in profile.criticalLocks)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text('⚠ $lock'),
              ),
            ),
        ],
      ),
    );
  }

  static String _display(double value) {
    if (value > 0 && value < 0.000001) {
      return value.toStringAsExponential(3);
    }
    var number = value.toStringAsFixed(value < 1 ? 6 : 3);
    if (number.contains('.')) {
      while (number.endsWith('0')) {
        number = number.substring(0, number.length - 1);
      }
      if (number.endsWith('.')) {
        number = number.substring(0, number.length - 1);
      }
    }
    return number;
  }
}
