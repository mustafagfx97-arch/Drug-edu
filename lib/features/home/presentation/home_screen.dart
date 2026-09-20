import 'package:flutter/material.dart';

import '../../../shared/widgets/module_card.dart';
import '../../feeding_tubes/presentation/feeding_tubes_screen.dart';
import '../../patient_cards/presentation/patient_cards_screen.dart';
import '../../supplements/presentation/supplements_screen.dart';
import '../../visual_guides/presentation/visual_guides_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.onSelectDestination,
  });

  final ValueChanged<int> onSelectDestination;

  void _openModule(BuildContext context, String action) {
    final routes = <String, WidgetBuilder>{
      'patient_cards': (_) => const PatientCardsScreen(),
      'visual_guides': (_) => const VisualGuidesScreen(),
      'feeding_tubes': (_) => const FeedingTubesScreen(),
      'supplements': (_) => const SupplementsScreen(),
    };

    final builder = routes[action];
    if (builder != null) {
      Navigator.of(context).push(MaterialPageRoute(builder: builder));
      return;
    }

    onSelectDestination(int.parse(action));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width;
    final columns = width >= 900 ? 3 : width >= 620 ? 2 : 1;

    final clinicalTools = [
      (
        'IV Preparation',
        'General, NICU and PICU preparation profiles with formulation-specific safety.',
        Icons.vaccines_outlined,
        '2',
        'High safety'
      ),
      (
        'Calculators',
        'Preparation and infusion calculations from prescribed orders only.',
        Icons.calculate_outlined,
        '3',
        'Dose not selected'
      ),
      (
        'Visual Guides',
        'Technique guides for inhalers, sprays, pens, drops and medication devices.',
        Icons.auto_awesome_mosaic_outlined,
        'visual_guides',
        'Technique'
      ),
      (
        'Feeding Tubes',
        'Formulation handling, crushing, liquids and tube-administration workflows.',
        Icons.route_outlined,
        'feeding_tubes',
        null
      ),
      (
        'Supplement Encyclopedia',
        'Vitamins, minerals and supplement products with exact how-to-take instructions.',
        Icons.spa_outlined,
        'supplements',
        null
      ),
      (
        'Patient Cards',
        'Saved reusable take-home cards with focused Arabic instructions and QR.',
        Icons.badge_outlined,
        'patient_cards',
        'Print'
      ),
    ];

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          sliver: SliverToBoxAdapter(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Drug Edu',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Patient Education for Clinical Pharmacists',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 22,
                  backgroundColor: theme.colorScheme.primaryContainer,
                  child: Icon(
                    Icons.local_pharmacy_outlined,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 14),
          sliver: SliverToBoxAdapter(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => onSelectDestination(1),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: Icon(
                              Icons.menu_book_outlined,
                              color: theme.colorScheme.onPrimaryContainer,
                              size: 30,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Patient Education Encyclopedia',
                                  style:
                                      theme.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Browse by drug family or search a medicine.',
                                  style:
                                      theme.textTheme.bodyMedium?.copyWith(
                                    color:
                                        theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right_rounded),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: const [
                          Expanded(
                            child: _ThreeStep(
                              number: '1',
                              title: 'Pharmacist',
                              detail: 'Clinical notes',
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: _ThreeStep(
                              number: '2',
                              title: 'Patient',
                              detail: 'Simple Arabic',
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: _ThreeStep(
                              number: '3',
                              title: 'Print Card',
                              detail: 'QR + PDF',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 10),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Clinical tools',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = clinicalTools[index];
                return ModuleCard(
                  title: item.$1,
                  subtitle: item.$2,
                  icon: item.$3,
                  badge: item.$5,
                  onTap: () => _openModule(context, item.$4),
                );
              },
              childCount: clinicalTools.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 190,
            ),
          ),
        ),
      ],
    );
  }
}

class _ThreeStep extends StatelessWidget {
  const _ThreeStep({
    required this.number,
    required this.title,
    required this.detail,
  });

  final String number;
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 13,
            backgroundColor: theme.colorScheme.primary,
            child: Text(
              number,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 8),
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
            detail,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
