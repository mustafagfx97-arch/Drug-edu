import 'package:flutter/material.dart';

import '../../../shared/widgets/section_card.dart';

class CalculatorsScreen extends StatelessWidget {
  const CalculatorsScreen({super.key});

  void _showSafetyGate(BuildContext context, String title) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 6, 20, 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'This calculator will open only after a verified medication profile and exact formulation are selected. Free-form drug calculations are intentionally disabled to reduce unit and concentration errors.',
                ),
                const SizedBox(height: 18),
                FilledButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.verified_user_outlined),
                  label: const Text('Understood'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final tools = [
      (
        'IV Preparation Calculator',
        'Dose → withdrawal volume → final volume → diluent volume → vials required.',
        Icons.science_outlined
      ),
      (
        'Continuous Infusion',
        'Prescribed rate and selected standard concentration → pump rate in mL/hr.',
        Icons.speed_outlined
      ),
      (
        'Dextrose Mixing',
        'Prepare a target dextrose concentration from verified source solutions.',
        Icons.water_drop_outlined
      ),
      (
        'Electrolyte Payload',
        'Show phosphate plus accompanying potassium or sodium and other linked electrolyte amounts.',
        Icons.bolt_outlined
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
                'Calculators convert an already prescribed order. They never recommend a therapeutic dose. Drug, population, formulation, unit basis and allowed concentration must be selected before calculation.',
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
                  onTap: () => _showSafetyGate(context, item.$1),
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
