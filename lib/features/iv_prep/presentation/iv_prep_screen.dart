import 'package:flutter/material.dart';

import '../data/iv_medication_catalog.dart';
import '../data/iv_preparation_profiles.dart';
import 'iv_preparation_detail_screen.dart';

class IvPrepScreen extends StatefulWidget {
  const IvPrepScreen({super.key});

  @override
  State<IvPrepScreen> createState() => _IvPrepScreenState();
}

class _IvPrepScreenState extends State<IvPrepScreen> {
  String _population = 'General';
  String _query = '';

  List<IvCatalogEntry> get _entries {
    final q = _query.trim().toLowerCase();

    return ivMedicationCatalog.where((entry) {
      if (entry.population != _population) return false;
      if (q.isEmpty) return true;
      return entry.name.toLowerCase().contains(q) ||
          entry.category.toLowerCase().contains(q);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final entries = _entries;
    final verifiedCount = entries.where((entry) =>
        findIvPreparationProfile(entry.name, entry.population) != null).length;
    final categories = entries.map((entry) => entry.category).toSet().toList()
      ..sort();

    return CustomScrollView(
      slivers: [
        const SliverAppBar.large(
          title: Text('IV Preparation'),
          automaticallyImplyLeading: false,
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
          sliver: SliverToBoxAdapter(
            child: SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'General', label: Text('General')),
                ButtonSegment(value: 'NICU', label: Text('NICU')),
                ButtonSegment(value: 'PICU', label: Text('PICU')),
              ],
              selected: {_population},
              onSelectionChanged: (value) {
                setState(() {
                  _population = value.first;
                  _query = '';
                });
              },
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
          sliver: SliverToBoxAdapter(
            child: TextField(
              onChanged: (value) => setState(() => _query = value),
              decoration: const InputDecoration(
                hintText: 'Search IV medication or category',
                prefixIcon: Icon(Icons.search_rounded),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
          sliver: SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer.withValues(alpha: 0.45),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _WorkflowRow(
                    number: '1',
                    title: 'Select population',
                    detail: 'General, NICU and PICU profiles stay separate.',
                  ),
                  _WorkflowRow(
                    number: '2',
                    title: 'Select exact formulation',
                    detail:
                        'Strength, salt/base and manufacturer differences must be explicit.',
                  ),
                  _WorkflowRow(
                    number: '3',
                    title: 'Verify preparation authority',
                    detail:
                        'Manufacturer, ANMF/NeoMED, pediatric standard or institution-specific.',
                  ),
                  _WorkflowRow(
                    number: '4',
                    title: 'Use the calculator only after profile validation',
                    detail:
                        'The calculator converts a prescribed order; it never invents a preparation recipe.',
                    isLast: true,
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _population + ' catalog',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Text(
                  verifiedCount.toString() + ' verified / ' +
                      entries.length.toString() + ' catalogued',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
        for (final category in categories) ...[
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 8),
            sliver: SliverToBoxAdapter(
              child: Text(
                category,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 4),
            sliver: SliverList.separated(
              itemCount:
                  entries.where((entry) => entry.category == category).length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final categoryEntries = entries
                    .where((entry) => entry.category == category)
                    .toList();
                final entry = categoryEntries[index];

                final profile =
                    findIvPreparationProfile(entry.name, entry.population);
                final verified = entry.structured && profile != null;

                return Card(
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: verified
                            ? theme.colorScheme.primaryContainer
                            : theme.colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Icon(
                        Icons.vaccines_outlined,
                        color: verified
                            ? theme.colorScheme.onPrimaryContainer
                            : theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    title: Text(
                      entry.name,
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        verified
                            ? 'Verified source-locked preparation profile'
                            : 'Catalogued only · preparation values locked until exact product data are verified',
                      ),
                    ),
                    trailing: verified
                        ? Icon(
                            Icons.verified_outlined,
                            color: theme.colorScheme.primary,
                          )
                        : const Icon(Icons.lock_outline_rounded),
                    onTap: verified
                        ? () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) =>
                                    IvPreparationDetailScreen(profile: profile!),
                              ),
                            );
                          }
                        : null,
                  ),
                );
              },
            ),
          ),
        ],
        const SliverPadding(
          padding: EdgeInsets.only(bottom: 28),
        ),
      ],
    );
  }
}

class _WorkflowRow extends StatelessWidget {
  const _WorkflowRow({
    required this.number,
    required this.title,
    required this.detail,
    this.isLast = false,
  });

  final String number;
  final String title;
  final String detail;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: theme.colorScheme.primary,
            child: Text(
              number,
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  detail,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
