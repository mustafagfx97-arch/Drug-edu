import 'package:flutter/material.dart';

import '../library/data/supplement_library_catalog.dart';
import '../library/domain/supplement_library_entry.dart';
import '../library/presentation/supplement_library_router.dart';
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

  IconData _iconFor(String categoryId) => switch (categoryId) {
        'vitamins' => Icons.wb_sunny_outlined,
        'minerals' => Icons.hexagon_outlined,
        'probiotics' => Icons.biotech_outlined,
        'gi-specialty' => Icons.medical_information_outlined,
        'herbals' => Icons.spa_outlined,
        'joints' => Icons.accessibility_new_outlined,
        'reproductive' => Icons.favorite_outline_rounded,
        'nerve-hair' => Icons.psychology_alt_outlined,
        'hair-loss' => Icons.content_cut_rounded,
        'general' => Icons.science_outlined,
        'pediatric' => Icons.child_friendly_outlined,
        'combinations' => Icons.grid_view_outlined,
        'sports-growth' => Icons.fitness_center_outlined,
        'safety' => Icons.health_and_safety_outlined,
        _ => Icons.menu_book_outlined,
      };

  String _categoryTitle(String categoryId) =>
      supplementLibraryCategories
          .singleWhere((category) => category.id == categoryId)
          .title;

  Widget _entryCard(
    BuildContext context,
    SupplementLibraryEntry entry,
  ) {
    final theme = Theme.of(context);
    return Card(
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
                child: Icon(_iconFor(entry.categoryId)),
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
                    const SizedBox(height: 3),
                    Text(
                      _categoryTitle(entry.categoryId),
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      entry.subtitle,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        height: 1.35,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final results = searchSupplementLibrary(_query);

    return Scaffold(
      appBar: AppBar(title: const Text('Supplement Encyclopedia')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 10, 18, 32),
        children: [
          Text(
            'One searchable clinical supplement library',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Search vitamins, mineral salts, probiotic strains, herbs, collagen, joint products, GI supplements, fertility adjuncts, hair-loss brands/ampoules/shampoos and common performance supplements from one place.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.45),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(Icons.library_books_outlined),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    supplementLibraryEntries.length.toString() +
                        ' indexed clinical entries across ' +
                        supplementLibraryCategories.length.toString() +
                        ' organized sections.',
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            onChanged: (value) => setState(() => _query = value),
            decoration: InputDecoration(
              hintText:
                  'Search LGG, BB-12, creatine, collagen, biotin, DAO...',
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
          if (_query.trim().isNotEmpty) ...[
            const SizedBox(height: 18),
            Row(
              children: [
                Text(
                  'Search results',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Spacer(),
                Text(
                  results.length.toString(),
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (results.isEmpty)
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    'No matching verified encyclopedia entry. Try an ingredient, strain, form, salt, use or common product term.',
                  ),
                ),
              )
            else
              for (final entry in results) _entryCard(context, entry),
          ] else ...[
            const SizedBox(height: 18),
            Text(
              'Browse the encyclopedia',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 10),
            for (final category in supplementLibraryCategories) ...[
              Card(
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => SupplementGroupScreen(
                          categoryId: category.id,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            _iconFor(category.id),
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      category.title,
                                      style:
                                          theme.textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 9,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme
                                          .surfaceContainerHighest,
                                      borderRadius: BorderRadius.circular(999),
                                    ),
                                    child: Text(
                                      supplementLibraryEntriesFor(category.id)
                                          .length
                                          .toString(),
                                      style: theme.textTheme.labelMedium
                                          ?.copyWith(
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                category.subtitle,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                  height: 1.35,
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
              const SizedBox(height: 10),
            ],
          ],
        ],
      ),
    );
  }
}
