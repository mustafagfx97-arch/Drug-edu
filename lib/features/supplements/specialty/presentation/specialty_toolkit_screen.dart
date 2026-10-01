import 'package:flutter/material.dart';

import '../data/specialty_toolkit_data.dart';
import '../domain/specialty_toolkit_models.dart';

class SpecialtyToolkitScreen extends StatefulWidget {
  const SpecialtyToolkitScreen({
    super.key,
    this.initialProfileId = 'lactase',
  });

  final String initialProfileId;

  @override
  State<SpecialtyToolkitScreen> createState() => _SpecialtyToolkitScreenState();
}

class _SpecialtyToolkitScreenState extends State<SpecialtyToolkitScreen> {
  late String _selectedId;

  @override
  void initState() {
    super.initState();
    _selectedId = specialtyIngredients.any(
      (item) => item.id == widget.initialProfileId,
    )
        ? widget.initialProfileId
        : 'lactase';
  }

  String _evidenceLabel(SpecialtyEvidence value) => switch (value) {
        SpecialtyEvidence.establishedUse => 'Established targeted use',
        SpecialtyEvidence.moderate => 'Moderate',
        SpecialtyEvidence.limited => 'Limited',
        SpecialtyEvidence.conflicting => 'Conflicting',
        SpecialtyEvidence.insufficient => 'Insufficient',
        SpecialtyEvidence.againstRoutineUse => 'Against routine use',
        SpecialtyEvidence.productSpecific => 'Product specific',
      };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ingredient = specialtyIngredient(_selectedId);

    return Scaffold(
      appBar: AppBar(title: const Text('GI & Specialty Supplements')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 32),
        children: [
          Text(
            'When to use it, how much, and exactly how',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            'Enzymes, DAO, IBS aids and liver/metabolic supplements. Product-specific instructions stay separate from general evidence.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 14),
          DropdownButton<String>(
            isExpanded: true,
            value: _selectedId,
            items: specialtyIngredients
                .map(
                  (item) => DropdownMenuItem(
                    value: item.id,
                    child: Text(item.name + ' — ' + item.category),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) setState(() => _selectedId = value);
            },
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  ingredient.name,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  ingredient.category,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(ingredient.keyRule, style: const TextStyle(height: 1.5)),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'Clinical use pathways',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final use in ingredient.uses)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ExpansionTile(
                title: Text(
                  use.indication,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                subtitle: Text(
                  use.population + ' • ' + _evidenceLabel(use.evidence),
                ),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  _Fact(label: 'Dose', body: use.dose),
                  _Fact(label: 'Frequency', body: use.frequency),
                  _Fact(label: 'Duration', body: use.duration),
                  _Fact(label: 'Exactly how to use', body: use.exactUse),
                  _Fact(
                    label: 'Clinical lock',
                    body: use.caveat,
                    critical: true,
                  ),
                  Text(
                    'Source: ' + use.sourceLabel,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 18),
          Text(
            'Safety / common errors',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final item in ingredient.safety)
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: theme.colorScheme.errorContainer.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(item, style: const TextStyle(height: 1.45)),
            ),
          const SizedBox(height: 22),
          Text(
            'Verified product-technique examples',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final product in specialtyProductTechniques)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ExpansionTile(
                title: Text(
                  product.name,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                subtitle: Text(product.ingredient),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  _Fact(label: 'Amount', body: product.amount),
                  _Fact(label: 'Directions', body: product.directions),
                  _Fact(label: 'Storage', body: product.storage),
                  _Fact(
                    label: 'Do not copy blindly',
                    body: product.lock,
                    critical: true,
                  ),
                  Text(
                    'Source: ' + product.sourceLabel,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 22),
          Text(
            'Global clinical locks',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final item in specialtyGlobalLocks)
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color:
                    theme.colorScheme.secondaryContainer.withValues(alpha: 0.55),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(item, style: const TextStyle(height: 1.45)),
            ),
        ],
      ),
    );
  }
}

class _Fact extends StatelessWidget {
  const _Fact({
    required this.label,
    required this.body,
    this.critical = false,
  });

  final String label;
  final String body;
  final bool critical;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            style: theme.textTheme.labelLarge?.copyWith(
              color: critical
                  ? theme.colorScheme.error
                  : theme.colorScheme.primary,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 3),
          Text(body, style: theme.textTheme.bodyMedium?.copyWith(height: 1.45)),
        ],
      ),
    );
  }
}
