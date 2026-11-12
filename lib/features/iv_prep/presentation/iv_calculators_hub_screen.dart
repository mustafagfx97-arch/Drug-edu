import 'package:flutter/material.dart';
import 'iv_quick_drip_screen.dart';

import '../../calculators/presentation/dextrose_mixing_calculator_screen.dart';
import '../../calculators/presentation/electrolyte_payload_calculator_screen.dart';
import '../../calculators/presentation/iv_preparation_calculator_screen.dart';
import '../../calculators/presentation/iv_weight_based_dose_screen.dart';
import '../../calculators/presentation/iv_dilution_calculator_screen.dart';

class IvCalculatorsHubScreen extends StatelessWidget {
  const IvCalculatorsHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <(String, String, IconData, Widget)>[
      (
        'Quick IV Drip',
        'Vial, dose ±, dilution and mL/hr',
        Icons.monitor_heart_outlined,
        const IvQuickDripScreen(),
      ),
      (
        'Dilution calculator',
        'Stock withdrawal, fluid and final concentration',
        Icons.science_outlined,
        const IvDilutionCalculatorScreen(),
      ),
      (
        'Weight-based dose',
        'Ordered dose per kg → drug volume',
        Icons.scale_outlined,
        const IvWeightBasedDoseScreen(),
      ),
      (
        'Vial volume',
        'Ordered amount → mL from verified stock',
        Icons.science_outlined,
        const IvPreparationCalculatorScreen(),
      ),
      (
        'Dextrose mixing',
        'Calculate a prescribed dextrose mixture',
        Icons.water_drop_outlined,
        const DextroseMixingCalculatorScreen(),
      ),
      (
        'Electrolyte payload',
        'Calculate potassium / sodium in phosphate',
        Icons.bolt_outlined,
        const ElectrolytePayloadCalculatorScreen(),
      ),
    ];

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 30),
      children: [
        Text(
          'IV Calculators',
          style: Theme.of(context).textTheme.headlineSmall
              ?.copyWith(fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 10),
        const Card(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              'Calculation support only. Verify the ordered dose, '
              'exact product, route and local preparation protocol. '
              'Results are not authorization to administer.'
              
            ),
          ),
        ),
        const SizedBox(height: 12),
        for (final item in items)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Card(
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              leading: Icon(item.$3, size: 30),
              title: Text(
                item.$1,
                style: const TextStyle(fontWeight: FontWeight.w800),
              ),
              subtitle: Text(item.$2, maxLines: 2, overflow: TextOverflow.ellipsis),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute<void>(builder: (_) => item.$4),
              ),
            ),
            ),
          ),
      ],
    );
  }
}
