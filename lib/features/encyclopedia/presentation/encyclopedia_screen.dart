import 'package:flutter/material.dart';

import '../../feeding_tubes/presentation/feeding_tubes_screen.dart';
import '../../supplements/presentation/supplements_screen.dart';
import '../../visual_guides/presentation/visual_guides_screen.dart';
import 'medicines_encyclopedia_screen.dart';

class EncyclopediaScreen extends StatelessWidget {
  const EncyclopediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final branches = <_EncyclopediaBranch>[
      const _EncyclopediaBranch(
        title: 'Medicines',
        subtitle:
            'Drug families, chronic medicines, OTC, pediatric therapy and patient counseling.',
        icon: Icons.medication_outlined,
        builder: _medicines,
      ),
      const _EncyclopediaBranch(
        title: 'Supplements',
        subtitle:
            'Vitamins, minerals, pediatric supplements and exact how-to-take instructions.',
        icon: Icons.eco_outlined,
        builder: _supplements,
      ),
      const _EncyclopediaBranch(
        title: 'Devices & Technique',
        subtitle:
            'Inhalers, spacers, sprays, pens, drops and step-by-step visual technique.',
        icon: Icons.medical_services_outlined,
        builder: _devices,
      ),
      const _EncyclopediaBranch(
        title: 'Feeding Tubes',
        subtitle:
            'Formulation suitability, crushing/opening, liquids, flushing and tube administration.',
        icon: Icons.route_outlined,
        builder: _feedingTubes,
      ),
    ];

    return CustomScrollView(
      slivers: [
        const SliverAppBar.large(
          title: Text('Patient Education Encyclopedia'),
          automaticallyImplyLeading: false,
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Everything patient-education related lives here. Choose a branch, then open a medicine, supplement, device or tube topic.',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.45,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 18),
          sliver: SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer.withValues(alpha: 0.45),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: _FlowStep(
                      number: '1',
                      title: 'Pharmacist',
                      subtitle: 'Professional notes',
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: _FlowStep(
                      number: '2',
                      title: 'Patient',
                      subtitle: 'Simple Arabic',
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: _FlowStep(
                      number: '3',
                      title: 'Print Card',
                      subtitle: 'QR + PDF',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Encyclopedia branches',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
          sliver: SliverList.separated(
            itemCount: branches.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final branch = branches[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: branch.builder),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Icon(
                            branch.icon,
                            size: 30,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                branch.title,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                branch.subtitle,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
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

  static Widget _medicines(BuildContext context) =>
      const MedicinesEncyclopediaScreen();

  static Widget _supplements(BuildContext context) =>
      const SupplementsScreen();

  static Widget _devices(BuildContext context) =>
      const VisualGuidesScreen();

  static Widget _feedingTubes(BuildContext context) =>
      const FeedingTubesScreen();
}

class _EncyclopediaBranch {
  const _EncyclopediaBranch({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.builder,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final WidgetBuilder builder;
}

class _FlowStep extends StatelessWidget {
  const _FlowStep({
    required this.number,
    required this.title,
    required this.subtitle,
  });

  final String number;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: theme.colorScheme.primary,
          child: Text(
            number,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(height: 7),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          subtitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
