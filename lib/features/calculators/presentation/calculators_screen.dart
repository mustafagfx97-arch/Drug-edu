import 'package:flutter/material.dart';

import '../../../shared/widgets/section_card.dart';
import 'continuous_infusion_calculator_screen.dart';
import 'dextrose_mixing_calculator_screen.dart';
import 'electrolyte_payload_calculator_screen.dart';
import 'iv_preparation_calculator_screen.dart';

class CalculatorsScreen extends StatelessWidget {
  const CalculatorsScreen({super.key});

  void _open(BuildContext context, String key) {
    final routes = <String, WidgetBuilder>{
      'iv': (_) => const IvPreparationCalculatorScreen(),
      'infusion': (_) => const ContinuousInfusionCalculatorScreen(),
      'dextrose': (_) => const DextroseMixingCalculatorScreen(),
      'electrolyte': (_) => const ElectrolytePayloadCalculatorScreen(),
    };

    Navigator.of(context).push(
      MaterialPageRoute(builder: routes[key]!),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final tools = [
      (
        'IV Preparation Calculator',
        'Profile-linked stock, dilution and dose-volume calculations.',
        Icons.science_outlined,
        'iv'
      ),
      (
        'Continuous Infusion',
        'Convert an entered prescribed rate to pump mL/hr.',
        Icons.speed_outlined,
        'infusion'
      ),
      (
        'Dextrose Mixing',
        'Mix two verified source concentrations to a target concentration.',
        Icons.water_drop_outlined,
        'dextrose'
      ),
      (
        'Electrolyte Payload',
        'Show phosphate plus the linked potassium or sodium contribution.',
        Icons.bolt_outlined,
        'electrolyte'
      ),
    ];

    return CustomScrollView(
      slivers: [
        const SliverAppBar.large(
          title: Text('Calculators'),
          automaticallyImplyLeading: false,
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
          sliver: SliverToBoxAdapter(
            child: SectionCard(
              title: 'Calculation policy',
              icon: Icons.rule_rounded,
              child: Text(
                'Calculators convert an already prescribed order. They do not recommend a therapeutic dose. Product-specific calculators require a selected preparation profile.',
                style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
          sliver: SliverList.separated(
            itemCount: tools.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final item = tools[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => _open(context, item.$4),
                  child: Padding(
                    padding: const EdgeInsets.all(17),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(
                            item.$3,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.$1,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                item.$2,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                  height: 1.35,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.chevron_right_rounded),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
