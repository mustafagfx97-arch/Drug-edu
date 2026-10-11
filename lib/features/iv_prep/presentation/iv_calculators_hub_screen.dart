import 'package:flutter/material.dart';

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
        'IV Dilution + Fluid + Rate · حاسبة التخفيف',
        'Enter exact vial strength, prescribed drug amount, fluid to add OR final volume; calculate withdrawal, final concentration and rate from an already ordered infusion.',
        Icons.science_outlined,
        const IvDilutionCalculatorScreen(),
      ),
      (
        'Weight-based IV dose → withdrawal',
        'Prescribed amount/kg × dosing weight → ordered amount and volume at a selected VERIFIED product concentration.',
        Icons.scale_outlined,
        const IvWeightBasedDoseScreen(),
      ),
      (
        'Ordered IV dose → vial volume',
        'Convert an existing ordered amount to withdrawal volume using an exact verified vial or presentation.',
        Icons.science_outlined,
        const IvPreparationCalculatorScreen(),
      ),
      (
        'Dextrose mixing',
        'Mix a prescribed target concentration from exact source concentrations.',
        Icons.water_drop_outlined,
        const DextroseMixingCalculatorScreen(),
      ),
      (
        'Electrolyte payload',
        'Quantify phosphate with its accompanying potassium or sodium.',
        Icons.bolt_outlined,
        const ElectrolytePayloadCalculatorScreen(),
      ),
    ];

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 30),
      children: [
        Text(
          'IV Calculators · حاسبات الوريدي',
          style: Theme.of(context).textTheme.headlineSmall
              ?.copyWith(fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 10),
        const Card(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              'HIGH ALERT: These tools only calculate arithmetic on an already '
              'ordered dose. They cannot authorize a therapeutic dose, a '
              'diluent, a final concentration, IV push or a pump setting. '
              'Verify patient factors and product-specific instructions independently.',
            ),
          ),
        ),
        const SizedBox(height: 12),
        for (final item in items)
          Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(14),
              leading: Icon(item.$3, size: 30),
              title: Text(
                item.$1,
                style: const TextStyle(fontWeight: FontWeight.w800),
              ),
              subtitle: Text(item.$2),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute<void>(builder: (_) => item.$4),
              ),
            ),
          ),
      ],
    );
  }
}
