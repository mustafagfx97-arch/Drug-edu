import 'package:flutter/material.dart';

import '../../../core/data/medication_clinical_overlays.dart';
import '../../../core/data/sample_medications.dart';
import '../../../core/models/medication.dart';
import '../../encyclopedia/presentation/medication_detail_screen.dart';
import '../../medication_plan/presentation/medication_plan_screen.dart';
import '../domain/medication_timing_catalog.dart';

enum _TimingLens { food, day }

class MedicationTimingScreen extends StatefulWidget {
  const MedicationTimingScreen({super.key});

  @override
  State<MedicationTimingScreen> createState() => _MedicationTimingScreenState();
}

class _MedicationTimingScreenState extends State<MedicationTimingScreen> {
  final _searchController = TextEditingController();

  _TimingLens _lens = _TimingLens.food;
  FoodTimingCategory _foodCategory =
      FoodTimingCategory.beforeFoodOrEmptyStomach;
  DayTimingCategory _dayCategory = DayTimingCategory.morning;
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Medication> get _visibleMedicines {
    final query = _query.trim().toLowerCase();

    final result = sampleMedications.where((medicine) {
      final profile = medicationTimingProfileFor(medicine.id);

      final categoryMatch = _lens == _TimingLens.food
          ? profile.foodCategory == _foodCategory
          : profile.dayCategory == _dayCategory;

      if (!categoryMatch) return false;
      if (query.isEmpty) return true;

      return medicine.name.toLowerCase().contains(query) ||
          medicine.subtitle.toLowerCase().contains(query) ||
          medicine.tags.any((tag) => tag.toLowerCase().contains(query)) ||
          resolvedMedicationAliases(medicine)
              .any((alias) => alias.toLowerCase().contains(query));
    }).toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    return result;
  }

  int _foodCount(FoodTimingCategory category) {
    return sampleMedications
        .where(
          (medicine) =>
              medicationTimingProfileFor(medicine.id).foodCategory == category,
        )
        .length;
  }

  int _dayCount(DayTimingCategory category) {
    return sampleMedications
        .where(
          (medicine) =>
              medicationTimingProfileFor(medicine.id).dayCategory == category,
        )
        .length;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final medicines = _visibleMedicines;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.large(
            title: Text('Medication Timing'),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Browse by food relationship or time of day. This is a counseling index: exact product, formulation, indication and prescription instructions still override a general category.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  height: 1.45,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
            sliver: SliverToBoxAdapter(
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const MedicationPlanScreen(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(17),
                    child: Row(
                      children: [
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            Icons.event_note_outlined,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(width: 13),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Build the patient’s full schedule',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'Enter all medicines and supplements, prescribed doses and frequencies, then organize one combined counseling timetable.',
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
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
            sliver: SliverToBoxAdapter(
              child: TextField(
                controller: _searchController,
                onChanged: (value) => setState(() => _query = value),
                decoration: InputDecoration(
                  hintText: 'Search medicine',
                  prefixIcon: const Icon(Icons.search_rounded),
                  suffixIcon: _query.isEmpty
                      ? null
                      : IconButton(
                          tooltip: 'Clear',
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _query = '');
                          },
                          icon: const Icon(Icons.close_rounded),
                        ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
            sliver: SliverToBoxAdapter(
              child: SegmentedButton<_TimingLens>(
                segments: const [
                  ButtonSegment(
                    value: _TimingLens.food,
                    icon: Icon(Icons.restaurant_outlined),
                    label: Text('Food relation'),
                  ),
                  ButtonSegment(
                    value: _TimingLens.day,
                    icon: Icon(Icons.schedule_outlined),
                    label: Text('Time of day'),
                  ),
                ],
                selected: {_lens},
                onSelectionChanged: (selection) {
                  setState(() => _lens = selection.first);
                },
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
            sliver: SliverToBoxAdapter(
              child: _lens == _TimingLens.food
                  ? _FoodCategorySelector(
                      selected: _foodCategory,
                      countFor: _foodCount,
                      onSelected: (value) {
                        setState(() => _foodCategory = value);
                      },
                    )
                  : _DayCategorySelector(
                      selected: _dayCategory,
                      countFor: _dayCount,
                      onSelected: (value) {
                        setState(() => _dayCategory = value);
                      },
                    ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _categoryTitle,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Text(
                    medicines.length.toString(),
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (medicines.isEmpty)
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
              sliver: SliverToBoxAdapter(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text(
                      'No medicines match this category and search yet.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
              sliver: SliverList.separated(
                itemCount: medicines.length,
                separatorBuilder: (_, __) => const SizedBox(height: 9),
                itemBuilder: (context, index) {
                  final medicine = medicines[index];
                  final profile = medicationTimingProfileFor(medicine.id);

                  return Card(
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                MedicationDetailScreen(medication: medicine),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 46,
                                  height: 46,
                                  decoration: BoxDecoration(
                                    color:
                                        theme.colorScheme.primaryContainer,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: const Icon(
                                    Icons.medication_outlined,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        medicine.name,
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        medicine.subtitle,
                                        style:
                                            theme.textTheme.bodySmall?.copyWith(
                                          color: theme
                                              .colorScheme.onSurfaceVariant,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.chevron_right_rounded),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                profile.instructionAr,
                                textAlign: TextAlign.right,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  height: 1.5,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 7,
                              runSpacing: 7,
                              children: [
                                _Tag(
                                  label: _foodLabel(profile.foodCategory),
                                  icon: Icons.restaurant_outlined,
                                ),
                                _Tag(
                                  label: _dayLabel(profile.dayCategory),
                                  icon: Icons.schedule_outlined,
                                ),
                                if (profile.requiresPrescriptionReview)
                                  const _Tag(
                                    label: 'Review exact regimen',
                                    icon: Icons.fact_check_outlined,
                                  ),
                                if (!profile.hasVerifiedRule)
                                  const _Tag(
                                    label: 'Timing rule not verified',
                                    icon: Icons.warning_amber_rounded,
                                  ),
                              ],
                            ),
                            if (profile.source.trim().isNotEmpty) ...[
                              const SizedBox(height: 9),
                              Text(
                                'Timing source: ' + profile.source,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  String get _categoryTitle {
    if (_lens == _TimingLens.food) return _foodLabel(_foodCategory);
    return _dayLabel(_dayCategory);
  }
}

class _FoodCategorySelector extends StatelessWidget {
  const _FoodCategorySelector({
    required this.selected,
    required this.countFor,
    required this.onSelected,
  });

  final FoodTimingCategory selected;
  final int Function(FoodTimingCategory) countFor;
  final ValueChanged<FoodTimingCategory> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: FoodTimingCategory.values.map((category) {
        return ChoiceChip(
          selected: selected == category,
          onSelected: (_) => onSelected(category),
          label: Text(
            _foodLabel(category) + ' · ' + countFor(category).toString(),
          ),
        );
      }).toList(),
    );
  }
}

class _DayCategorySelector extends StatelessWidget {
  const _DayCategorySelector({
    required this.selected,
    required this.countFor,
    required this.onSelected,
  });

  final DayTimingCategory selected;
  final int Function(DayTimingCategory) countFor;
  final ValueChanged<DayTimingCategory> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: DayTimingCategory.values.map((category) {
        return ChoiceChip(
          selected: selected == category,
          onSelected: (_) => onSelected(category),
          label: Text(
            _dayLabel(category) + ' · ' + countFor(category).toString(),
          ),
        );
      }).toList(),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15),
          const SizedBox(width: 5),
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

String _foodLabel(FoodTimingCategory category) {
  switch (category) {
    case FoodTimingCategory.beforeFoodOrEmptyStomach:
      return 'Before food / empty stomach';
    case FoodTimingCategory.withOrAfterFood:
      return 'With / after food';
    case FoodTimingCategory.noMealAnchor:
      return 'No meal anchor in timing rule';
    case FoodTimingCategory.prescriptionSpecific:
      return 'Product / prescription specific';
    case FoodTimingCategory.unverified:
      return 'Needs timing verification';
  }
}

String _dayLabel(DayTimingCategory category) {
  switch (category) {
    case DayTimingCategory.morning:
      return 'Morning';
    case DayTimingCategory.eveningBedtime:
      return 'Evening / bedtime';
    case DayTimingCategory.flexible:
      return 'Flexible fixed time';
    case DayTimingCategory.regimenSpecific:
      return 'Meal / regimen specific';
    case DayTimingCategory.unverified:
      return 'Needs timing verification';
  }
}
