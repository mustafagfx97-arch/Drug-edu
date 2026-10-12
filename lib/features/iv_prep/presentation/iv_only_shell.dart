import 'package:flutter/material.dart';

import '../../calculators/presentation/continuous_infusion_calculator_screen.dart';
import '../data/iv_medication_catalog.dart';
import '../data/iv_preparation_profiles.dart';
import 'iv_calculators_hub_screen.dart';
import 'iv_fluid_screen.dart';
import 'iv_preparation_detail_screen.dart';

/// The PWA navigation intentionally contains ONLY intravenous tools.
class IvOnlyShell extends StatefulWidget {
  const IvOnlyShell({super.key});

  @override
  State<IvOnlyShell> createState() => _IvOnlyShellState();
}

class _IvOnlyShellState extends State<IvOnlyShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: IndexedStack(
          index: _index,
          children: const [
            _IvOnlyCatalog(),
            IvCalculatorsHubScreen(),
            ContinuousInfusionCalculatorScreen(),
            IvFluidScreen(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (value) => setState(() => _index = value),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.medication_liquid_outlined),
            selectedIcon: Icon(Icons.medication_liquid),
            label: 'IV drugs',
          ),
          NavigationDestination(
            icon: Icon(Icons.calculate_outlined),
            selectedIcon: Icon(Icons.calculate),
            label: 'Dose',
          ),
          NavigationDestination(
            icon: Icon(Icons.monitor_heart_outlined),
            selectedIcon: Icon(Icons.monitor_heart),
            label: 'Infusion',
          ),
          NavigationDestination(
            icon: Icon(Icons.water_drop_outlined),
            selectedIcon: Icon(Icons.water_drop),
            label: 'Fluids',
          ),
        ],
      ),
    );
  }
}

class _IvOnlyCatalog extends StatefulWidget {
  const _IvOnlyCatalog();

  @override
  State<_IvOnlyCatalog> createState() => _IvOnlyCatalogState();
}

class _IvOnlyCatalogState extends State<_IvOnlyCatalog> {
  String _population = 'All';
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final query = _query.trim().toLowerCase();
    final entries = ivMedicationCatalog.where((entry) {
      if (!entry.structured ||
          findIvPreparationProfile(entry.name, entry.population) == null) {
        return false;
      }
      if (_population != 'All' && entry.population != _population) return false;
      if (query.isEmpty) return true;
      return entry.name.toLowerCase().contains(query) ||
          entry.category.toLowerCase().contains(query) ||
          entry.population.toLowerCase().contains(query);
    }).toList(growable: false);
    final categories = entries.map((entry) => entry.category).toSet().toList()
      ..sort();
    return CustomScrollView(
      key: const ValueKey('iv-only-catalog'),
      slivers: [
        const SliverAppBar.large(title: Text('Drug IV · الأدوية الوريدية')),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 2, 16, 12),
          sliver: SliverToBoxAdapter(
            child: Card(
              color: theme.colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dose + IV administration · الجرعة ووقت الإعطاء',
                      style: theme.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      '${ivPreparationProfiles.length} product/population-specific profiles · '
                      'General, NICU & PICU.',
                    ),
                    const SizedBox(height: 7),
                    const Text(
                      'Search the drug and patient group. Dose-to-stock-volume '
                      'arithmetic and exact administration instructions appear '
                      'FIRST. Preparation, fluids and stability remain '
                      'available under Details. A faster route is not '
                      'automatically a safe route.',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          sliver: SliverToBoxAdapter(
            child: TextField(
              key: const ValueKey('iv-only-search'),
              onChanged: (value) => setState(() => _query = value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: 'Search IV drug / ابحث عن الدواء الوريدي',
                hintText: 'e.g. Nicardipine, Vancomycin, dopamine',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          sliver: SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final population in const [
                    'All', 'General', 'NICU', 'PICU',
                  ])
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(population),
                        selected: _population == population,
                        onSelected: (_) =>
                            setState(() => _population = population),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          sliver: SliverToBoxAdapter(
            child: Text(
              '${entries.length} matching verified IV profiles',
              style: theme.textTheme.titleSmall
                  ?.copyWith(fontWeight: FontWeight.w800),
            ),
          ),
        ),
        if (entries.isEmpty)
          const SliverFillRemaining(
            child: Center(
              child: Text(
                'No verified preparation profile for this query. '
                'Do not improvise a dilution or infusion.',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        for (final category in categories) ...[
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 7),
            sliver: SliverToBoxAdapter(
              child: Text(
                category,
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w900),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 4),
            sliver: SliverList.separated(
              itemCount: entries.where((e) => e.category == category).length,
              separatorBuilder: (_, __) => const SizedBox(height: 3),
              itemBuilder: (context, index) {
                final entry = entries
                    .where((e) => e.category == category)
                    .elementAt(index);
                final profile =
                    findIvPreparationProfile(entry.name, entry.population)!;
                return Card(
                  child: ListTile(
                    title: Text(
                      entry.name,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    subtitle: Text(
                      '${entry.population} · formulation-specific source',
                    ),
                    leading: const Icon(Icons.vaccines_outlined),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (_) =>
                            IvPreparationDetailScreen(profile: profile),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
        const SliverToBoxAdapter(child: SizedBox(height: 22)),
      ],
    );
  }
}
