import 'package:flutter/material.dart';

import '../data/supplement_profiles.dart';
import 'supplement_detail_screen.dart';
import 'supplement_group_screen.dart';

class SupplementsScreen extends StatefulWidget {
  const SupplementsScreen({super.key});

  @override
  State<SupplementsScreen> createState() => _SupplementsScreenState();
}

class _SupplementsScreenState extends State<SupplementsScreen> {
  final _controller = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<dynamic> get _searchResults {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return const [];

    return supplementProfiles.where((profile) {
      return profile.name.toLowerCase().contains(q) ||
          profile.subtitle.toLowerCase().contains(q) ||
          profile.group.toLowerCase().contains(q) ||
          profile.formulation.toLowerCase().contains(q);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final groups = const [
      _SupplementGroup(
        title: 'Vitamins',
        subtitle:
            'Vitamin D, B12, folic acid and other vitamin profiles with practical administration instructions.',
        icon: Icons.wb_sunny_outlined,
      ),
      _SupplementGroup(
        title: 'Minerals',
        subtitle:
            'Iron, calcium, magnesium, zinc and salt-specific counseling using elemental amounts.',
        icon: Icons.hexagon_outlined,
      ),
      _SupplementGroup(
        title: 'Pediatric supplements',
        subtitle:
            'Age-appropriate products, drops, liquids and when laboratory testing is needed.',
        icon: Icons.child_friendly_outlined,
      ),
      _SupplementGroup(
        title: 'Combination products',
        subtitle:
            'Multivitamins and multi-mineral products with duplication and total-intake checks.',
        icon: Icons.grid_view_outlined,
      ),
      _SupplementGroup(
        title: 'Growth / amino-acid products',
        subtitle:
            'Evidence-focused review of products marketed for growth rather than treating them as routine essentials.',
        icon: Icons.trending_up_rounded,
      ),
      _SupplementGroup(
        title: 'Safety review',
        subtitle:
            'High-risk, withdrawn, misleading or inappropriate weight-loss and supplement products.',
        icon: Icons.health_and_safety_outlined,
      ),
    ];

    final results = _searchResults;

    return Scaffold(
      appBar: AppBar(title: const Text('Supplement Encyclopedia')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Text(
            'Supplements are a separate branch',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Each profile answers the practical questions first: exact form, how to take it, food timing, separation from medicines/minerals, formulation differences, and what the patient actually needs to remember.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            onChanged: (value) => setState(() => _query = value),
            decoration: InputDecoration(
              hintText: 'Search vitamin, mineral or supplement',
              prefixIcon: const Icon(Icons.search_rounded),
              suffixIcon: _query.isEmpty
                  ? null
                  : IconButton(
                      tooltip: 'Clear',
                      onPressed: () {
                        _controller.clear();
                        setState(() => _query = '');
                      },
                      icon: const Icon(Icons.close_rounded),
                    ),
            ),
          ),
          if (_query.isNotEmpty) ...[
            const SizedBox(height: 18),
            Text(
              'Search results',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 10),
            if (results.isEmpty)
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Text('No matching supplement profile yet.'),
                ),
              )
            else
              for (final profile in results) ...[
                Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      profile.name,
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        profile.group + ' · ' + profile.subtitle,
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              SupplementDetailScreen(profile: profile),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
              ],
          ] else ...[
            const SizedBox(height: 18),
            Text(
              'Browse by supplement type',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 10),
            for (final group in groups) ...[
              Card(
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => SupplementGroupScreen(
                          group: group.title,
                          subtitle: group.subtitle,
                          icon: group.icon,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            group.icon,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                group.title,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                group.subtitle,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                  height: 1.35,
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
              ),
              const SizedBox(height: 10),
            ],
          ],
        ],
      ),
    );
  }
}

class _SupplementGroup {
  const _SupplementGroup({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;
}
