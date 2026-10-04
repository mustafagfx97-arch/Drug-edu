import 'package:flutter/material.dart';

import '../data/visual_guide_catalog.dart';
import 'visual_guide_detail_screen.dart';

enum _GuideGroup { all, inhalers, nose, eye, ear, injection, other }

class VisualGuidesScreen extends StatefulWidget {
  const VisualGuidesScreen({super.key});

  @override
  State<VisualGuidesScreen> createState() => _VisualGuidesScreenState();
}

class _VisualGuidesScreenState extends State<VisualGuidesScreen> {
  final _searchController = TextEditingController();
  String _query = '';
  _GuideGroup _group = _GuideGroup.all;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<VisualGuideData> get _visibleGuides {
    final query = _query.trim().toLowerCase();

    return visualGuideCatalog.where((guide) {
      final groupMatch =
          _group == _GuideGroup.all || _groupFor(guide) == _group;
      if (!groupMatch) return false;
      if (query.isEmpty) return true;

      return guide.title.toLowerCase().contains(query) ||
          guide.subtitle.toLowerCase().contains(query) ||
          guide.id.toLowerCase().contains(query) ||
          guide.sourceLabel.toLowerCase().contains(query);
    }).toList();
  }

  _GuideGroup _groupFor(VisualGuideData guide) {
    final text = (guide.id + ' ' + guide.title + ' ' + guide.subtitle)
        .toLowerCase();

    if (text.contains('inhaler') ||
        text.contains('mdi') ||
        text.contains('dpi') ||
        text.contains('spacer') ||
        text.contains('turbuhaler') ||
        text.contains('diskus') ||
        text.contains('ellipta') ||
        text.contains('respimat') ||
        text.contains('nebulizer') ||
        text.contains('handihaler')) {
      return _GuideGroup.inhalers;
    }
    if (text.contains('nasal') || text.contains('nose')) {
      return _GuideGroup.nose;
    }
    if (text.contains('eye') || text.contains('ophthalm')) {
      return _GuideGroup.eye;
    }
    if (text.contains('ear') || text.contains('otic')) {
      return _GuideGroup.ear;
    }
    if (text.contains('pen') ||
        text.contains('syringe') ||
        text.contains('inject') ||
        text.contains('gvoke') ||
        text.contains('forteo') ||
        text.contains('tymlos') ||
        text.contains('tresiba') ||
        text.contains('humulin')) {
      return _GuideGroup.injection;
    }
    return _GuideGroup.other;
  }

  int _count(_GuideGroup group) {
    if (group == _GuideGroup.all) return visualGuideCatalog.length;
    return visualGuideCatalog.where((guide) => _groupFor(guide) == group).length;
  }

  String _label(_GuideGroup group) {
    switch (group) {
      case _GuideGroup.all:
        return 'All';
      case _GuideGroup.inhalers:
        return 'Inhalers';
      case _GuideGroup.nose:
        return 'Nose';
      case _GuideGroup.eye:
        return 'Eye';
      case _GuideGroup.ear:
        return 'Ear';
      case _GuideGroup.injection:
        return 'Injection';
      case _GuideGroup.other:
        return 'Other';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final guides = _visibleGuides;

    return Scaffold(
      appBar: AppBar(title: const Text('Devices & Technique')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Text(
            'Technique library',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'First-use preparation, every-dose technique, cleaning, common errors, teach-back and verified official media. Product-specific rules override family-level technique.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _searchController,
            onChanged: (value) => setState(() => _query = value),
            decoration: InputDecoration(
              hintText: 'Search device or brand',
              prefixIcon: const Icon(Icons.search_rounded),
              suffixIcon: _query.isEmpty
                  ? null
                  : IconButton(
                      onPressed: () {
                        _searchController.clear();
                        setState(() => _query = '');
                      },
                      icon: const Icon(Icons.close_rounded),
                    ),
            ),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final group in _GuideGroup.values) ...[
                  ChoiceChip(
                    selected: _group == group,
                    onSelected: (_) => setState(() => _group = group),
                    label: Text(
                      _label(group) + ' · ' + _count(group).toString(),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ],
            ),
          ),
          const SizedBox(height: 18),
          if (guides.isEmpty)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Text(
                  'No technique guide matches this filter yet.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            )
          else
            for (final guide in guides) ...[
              Card(
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => VisualGuideDetailScreen(
                          guide: guide,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(17),
                    child: Row(
                      children: [
                        Container(
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            guide.icon,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                guide.title,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                guide.subtitle,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                  height: 1.35,
                                ),
                              ),
                              if (guide.firstUseSteps.isNotEmpty ||
                                  guide.mediaLinks.isNotEmpty) ...[
                                const SizedBox(height: 8),
                                Wrap(
                                  spacing: 6,
                                  runSpacing: 6,
                                  children: [
                                    if (guide.firstUseSteps.isNotEmpty)
                                      const _GuideBadge(
                                        icon: Icons.new_releases_outlined,
                                        label: 'First use',
                                      ),
                                    if (guide.mediaLinks.any(
                                      (link) => link.isVideo,
                                    ))
                                      const _GuideBadge(
                                        icon: Icons.play_circle_outline_rounded,
                                        label: 'Official video',
                                      ),
                                    if (guide.sourceLabel.isNotEmpty)
                                      const _GuideBadge(
                                        icon: Icons.verified_outlined,
                                        label: 'Verified',
                                      ),
                                  ],
                                ),
                              ],
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
      ),
    );
  }
}

class _GuideBadge extends StatelessWidget {
  const _GuideBadge({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14),
          const SizedBox(width: 4),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
