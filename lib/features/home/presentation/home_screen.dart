import 'package:flutter/material.dart';

import '../../../shared/widgets/module_card.dart';
import '../../../shared/widgets/section_card.dart';
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

    final modules = [
      (
        'Patient Counseling',
        'Clinical notes in English with a focused Arabic patient explanation.',
        Icons.record_voice_over_outlined,
        '1',
        'Core'
      ),
      (
        'Patient Cards',
        'Clone, customize and generate focused Arabic counseling cards with QR.',
        Icons.badge_outlined,
        'patient_cards',
        'QR'
      ),
      (
        'IV Preparation',
        'Reconstitution, dilution, compatible fluids, standard concentrations and safety locks.',
        Icons.vaccines_outlined,
        '2',
        'High safety'
      ),
      (
        'Calculators',
        'Preparation math only. Prescribed doses are entered by the clinician.',
        Icons.calculate_outlined,
        '3',
        'No dose selection'
      ),
      (
        'NICU / PICU',
        'Population-specific preparation profiles kept separate from adult/general profiles.',
        Icons.child_care_outlined,
        '2',
        'Separate profiles'
      ),
      (
        'Visual Guides',
        'Technique illustrations for inhalers, sprays, pens, drops and other medication devices.',
        Icons.auto_awesome_mosaic_outlined,
        'visual_guides',
        'Technique'
      ),
      (
        'Feeding Tubes',
        'Tube administration, formulation handling, crushing, liquids and oral-use workflows.',
        Icons.route_outlined,
        'feeding_tubes',
        'Formulation-specific'
      ),
      (
        'Supplements',
        'Vitamins, minerals, pediatric products, combinations and safety-focused counseling.',
        Icons.spa_outlined,
        'supplements',
        'Counseling'
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
                        'Clinical Pharmacist Encyclopedia · V1 Preview',
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
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 12),
          sliver: SliverToBoxAdapter(
            child: TextField(
              readOnly: true,
              onTap: () => onSelectDestination(1),
              decoration: const InputDecoration(
                hintText: 'Search drug, formulation, device or topic',
                prefixIcon: Icon(Icons.search_rounded),
                suffixIcon: Icon(Icons.tune_rounded),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 6, 20, 16),
          sliver: SliverToBoxAdapter(
            child: SectionCard(
              title: 'Clinical safety first',
              icon: Icons.verified_user_outlined,
              child: Text(
                'Preparation profiles remain formulation-specific. NICU and PICU standards are never silently reused across populations, and calculators convert prescribed orders without selecting treatment doses.',
                style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 2, 20, 10),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Modules',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = modules[index];
                return ModuleCard(
                  title: item.$1,
                  subtitle: item.$2,
                  icon: item.$3,
                  badge: item.$5,
                  onTap: () => _openModule(context, item.$4),
                );
              },
              childCount: modules.length,
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
