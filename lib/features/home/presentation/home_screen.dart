import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.onSelectDestination,
  });

  final ValueChanged<int> onSelectDestination;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 22, 20, 10),
          sliver: SliverToBoxAdapter(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Supplement Edu',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Evidence-based supplement decisions for clinical pharmacists',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 23,
                  backgroundColor: theme.colorScheme.primaryContainer,
                  child: Icon(
                    Icons.science_outlined,
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
            child: _HomeModuleCard(
              icon: Icons.fact_check_outlined,
              title: 'Do I need a supplement?',
              subtitle:
                  'Start with need, risk, diet, medicines, labs and life stage before choosing a product.',
              onTap: () => onSelectDestination(1),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
          sliver: SliverToBoxAdapter(
            child: _HomeModuleCard(
              icon: Icons.monitor_heart_outlined,
              title: 'My Daily Needs & Labs',
              subtitle:
                  'Personalized adult RDA/AI targets, upper limits, food-first guidance and a targeted lab navigator.',
              onTap: () => onSelectDestination(2),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
          sliver: SliverToBoxAdapter(
            child: _HomeModuleCard(
              icon: Icons.science_outlined,
              title: 'Mineral Clinical Toolkit',
              subtitle:
                  'Iron, calcium, magnesium and zinc: salts, elemental-dose conversion, treatment pathways, interactions and monitoring.',
              onTap: () => onSelectDestination(3),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
          sliver: SliverToBoxAdapter(
            child: _HomeModuleCard(
              icon: Icons.menu_book_outlined,
              title: 'Supplement Encyclopedia',
              subtitle:
                  'The verified Drug Edu supplement library is preserved and will expand by nutrient, salt, indication, dose, monitoring and counseling.',
              onTap: () => onSelectDestination(4),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
          sliver: SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: theme.colorScheme.outlineVariant),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Clinical workflow',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const _RoadmapLine(
                    icon: Icons.person_search_outlined,
                    text: '1. Does this patient actually need a supplement?',
                  ),
                  const _RoadmapLine(
                    icon: Icons.restaurant_outlined,
                    text: '2. What is the total daily nutritional target from food + supplements?',
                  ),
                  const _RoadmapLine(
                    icon: Icons.biotech_outlined,
                    text: '3. What should be tested — and what should not be tested routinely?',
                  ),
                  const _RoadmapLine(
                    icon: Icons.scale_outlined,
                    text: '4. If a supplement is needed: choose the dose, salt, elemental amount and duration.',
                  ),
                  const _RoadmapLine(
                    icon: Icons.swap_horiz_rounded,
                    text: '5. Check medicines, duplication, upper limits and practical timing.',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _HomeModuleCard extends StatelessWidget {
  const _HomeModuleCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(19),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(
                  icon,
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
                      title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        height: 1.45,
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
  }
}

class _RoadmapLine extends StatelessWidget {
  const _RoadmapLine({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: theme.colorScheme.primary),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}
