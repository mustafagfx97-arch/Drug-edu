import 'package:flutter/material.dart';

import '../library/data/supplement_library_catalog.dart';
import '../library/presentation/supplement_library_router.dart';

class SupplementGroupScreen extends StatelessWidget {
  const SupplementGroupScreen({
    super.key,
    required this.categoryId,
  });

  final String categoryId;

  IconData _iconFor(String id) => switch (id) {
        'vitamins' => Icons.wb_sunny_outlined,
        'minerals' => Icons.hexagon_outlined,
        'probiotics' => Icons.biotech_outlined,
        'gi-specialty' => Icons.medical_information_outlined,
        'herbals' => Icons.spa_outlined,
        'joints' => Icons.accessibility_new_outlined,
        'reproductive' => Icons.favorite_outline_rounded,
        'nerve-hair' => Icons.psychology_alt_outlined,
        'general' => Icons.science_outlined,
        'pediatric' => Icons.child_friendly_outlined,
        'combinations' => Icons.grid_view_outlined,
        'sports-growth' => Icons.fitness_center_outlined,
        'safety' => Icons.health_and_safety_outlined,
        _ => Icons.menu_book_outlined,
      };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final category = supplementLibraryCategories.singleWhere(
      (item) => item.id == categoryId,
    );
    final entries = supplementLibraryEntriesFor(categoryId);

    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 10, 18, 32),
        children: [
          Container(
            padding: const EdgeInsets.all(17),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  _iconFor(categoryId),
                  size: 34,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entries.length.toString() + ' indexed entries',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        category.subtitle,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          height: 1.45,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          for (final entry in entries)
            Card(
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () => openSupplementLibraryEntry(context, entry),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Icon(_iconFor(categoryId)),
                      ),
                      const SizedBox(width: 13),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              entry.title,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              entry.subtitle,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(Icons.chevron_right_rounded),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
