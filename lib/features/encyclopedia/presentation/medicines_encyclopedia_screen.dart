import 'package:flutter/material.dart';

import '../../../core/data/sample_families.dart';
import '../../../core/data/sample_medications.dart';
import '../../../core/models/medication.dart';
import '../../../core/models/medication_family.dart';
import 'family_medications_screen.dart';
import 'medication_detail_screen.dart';

class MedicinesEncyclopediaScreen extends StatefulWidget {
  const MedicinesEncyclopediaScreen({super.key});

  @override
  State<MedicinesEncyclopediaScreen> createState() => _MedicinesEncyclopediaScreenState();
}

class _MedicinesEncyclopediaScreenState extends State<MedicinesEncyclopediaScreen> {
  final _controller = TextEditingController();
  String _query = '';
  bool _showFamilies = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<MedicationFamily> get _families {
    final query = _query.trim().toLowerCase();
    if (query.isEmpty) return medicationFamilies;

    return medicationFamilies.where((family) {
      final familyMatch =
          family.name.toLowerCase().contains(query) ||
          family.subtitle.toLowerCase().contains(query) ||
          family.searchTerms.any((term) => term.toLowerCase().contains(query));

      final medicineMatch = sampleMedications.any(
        (medicine) =>
            medicine.familyId == family.id &&
            _matchesMedicine(medicine, query),
      );

      return familyMatch || medicineMatch;
    }).toList();
  }

  List<Medication> get _medicines {
    final query = _query.trim().toLowerCase();
    if (query.isEmpty) return sampleMedications;

    return sampleMedications
        .where((medicine) => _matchesMedicine(medicine, query))
        .toList();
  }

  bool _matchesMedicine(Medication medicine, String query) {
    return medicine.name.toLowerCase().contains(query) ||
        medicine.subtitle.toLowerCase().contains(query) ||
        medicine.tags.any((tag) => tag.toLowerCase().contains(query));
  }

  int _medicineCount(String familyId) {
    return sampleMedications.where((m) => m.familyId == familyId).length;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final families = _families;
    final medicines = _medicines;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.large(
            title: Text('Medicines'),
          ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Browse medicines by therapeutic family or search directly. Every record uses Pharmacist, Patient, and Print Card.',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.45,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
          sliver: SliverToBoxAdapter(
            child: TextField(
              controller: _controller,
              onChanged: (value) => setState(() => _query = value),
              decoration: InputDecoration(
                hintText: 'Search drug or family',
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
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
          sliver: SliverToBoxAdapter(
            child: SegmentedButton<bool>(
              segments: const [
                ButtonSegment(
                  value: true,
                  icon: Icon(Icons.category_outlined),
                  label: Text('Drug families'),
                ),
                ButtonSegment(
                  value: false,
                  icon: Icon(Icons.medication_outlined),
                  label: Text('All medicines'),
                ),
              ],
              selected: {_showFamilies},
              onSelectionChanged: (value) {
                setState(() => _showFamilies = value.first);
              },
            ),
          ),
        ),
        if (_showFamilies)
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
            sliver: SliverList.separated(
              itemCount: families.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final family = families[index];
                final count = _medicineCount(family.id);
                final countLabel = count.toString() +
                    ' medicine' +
                    (count == 1 ? '' : 's');

                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              FamilyMedicationsScreen(family: family),
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
                              family.icon,
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  family.name,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  family.subtitle,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color:
                                        theme.colorScheme.onSurfaceVariant,
                                    height: 1.35,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  countLabel,
                                  style: theme.textTheme.labelMedium?.copyWith(
                                    color: theme.colorScheme.primary,
                                    fontWeight: FontWeight.w700,
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
              },
            ),
          )
        else
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
            sliver: SliverList.separated(
              itemCount: medicines.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final medicine = medicines[index];
                final family = medicationFamilies.firstWhere(
                  (item) => item.id == medicine.familyId,
                );

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
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(Icons.medication_outlined),
                      ),
                      title: Text(
                        medicine.name,
                        style: const TextStyle(fontWeight: FontWeight.w900),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          family.name + ' · ' + medicine.subtitle,
                        ),
                      ),
                      trailing: const Icon(Icons.chevron_right_rounded),
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
}
