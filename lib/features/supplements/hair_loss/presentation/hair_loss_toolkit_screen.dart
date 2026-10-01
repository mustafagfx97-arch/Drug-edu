import 'package:flutter/material.dart';

import '../data/hair_loss_data.dart';
import '../domain/hair_loss_models.dart';

enum _HairLossView { start, oral, topical, shampoo, ingredients }

class HairLossToolkitScreen extends StatefulWidget {
  const HairLossToolkitScreen({
    super.key,
    this.initialProductId,
  });

  final String? initialProductId;

  @override
  State<HairLossToolkitScreen> createState() => _HairLossToolkitScreenState();
}

class _HairLossToolkitScreenState extends State<HairLossToolkitScreen> {
  final _searchController = TextEditingController();
  late _HairLossView _view;
  String _query = '';

  @override
  void initState() {
    super.initState();
    HairLossProduct? product;
    final initial = widget.initialProductId;
    if (initial != null) {
      for (final item in hairLossProducts) {
        if (item.id == initial) {
          product = item;
          break;
        }
      }
    }
    _view = switch (product?.type) {
      HairLossProductType.oralSupplement => _HairLossView.oral,
      HairLossProductType.topicalAmpouleLotionSerum => _HairLossView.topical,
      HairLossProductType.shampoo => _HairLossView.shampoo,
      null => _HairLossView.start,
    };
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String _typeLabel(HairLossProductType value) => switch (value) {
        HairLossProductType.oralSupplement => 'Oral supplement',
        HairLossProductType.topicalAmpouleLotionSerum =>
          'Ampoule / lotion / serum',
        HairLossProductType.shampoo => 'Supportive shampoo',
      };

  String _evidenceLabel(HairLossEvidence value) => switch (value) {
        HairLossEvidence.moderate => 'Moderate product-specific evidence',
        HairLossEvidence.limited => 'Limited evidence',
        HairLossEvidence.productSpecific => 'Product-specific evidence',
        HairLossEvidence.supportiveOnly => 'Supportive care only',
        HairLossEvidence.noRoutineRole => 'No routine role',
        HairLossEvidence.regulatoryCaution => 'Regulatory status varies',
      };

  Color _evidenceColor(BuildContext context, HairLossEvidence value) {
    final scheme = Theme.of(context).colorScheme;
    return switch (value) {
      HairLossEvidence.moderate => scheme.primaryContainer,
      HairLossEvidence.limited => scheme.secondaryContainer,
      HairLossEvidence.productSpecific => scheme.tertiaryContainer,
      HairLossEvidence.supportiveOnly => scheme.surfaceContainerHighest,
      HairLossEvidence.noRoutineRole => scheme.errorContainer,
      HairLossEvidence.regulatoryCaution => scheme.errorContainer,
    };
  }

  List<HairLossProduct> get _filteredProducts {
    final type = switch (_view) {
      _HairLossView.oral => HairLossProductType.oralSupplement,
      _HairLossView.topical =>
        HairLossProductType.topicalAmpouleLotionSerum,
      _HairLossView.shampoo => HairLossProductType.shampoo,
      _ => null,
    };

    final q = _query.trim().toLowerCase();
    return hairLossProducts.where((item) {
      if (type != null && item.type != type) return false;
      if (q.isEmpty) return true;
      return [
        item.brand,
        item.name,
        item.bestFor,
        item.keyIngredients,
        item.regimen,
        item.evidenceNote,
        item.sourceLabel,
      ].join(' ').toLowerCase().contains(q);
    }).toList(growable: false);
  }

  void _selectView(_HairLossView view) {
    setState(() {
      _view = view;
      if (view == _HairLossView.start || view == _HairLossView.ingredients) {
        _query = '';
        _searchController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Hair Loss & Scalp Support')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 14, 18, 32),
        children: [
          Text(
            'Diagnose the pattern before choosing the product',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'A pharmacist-focused guide to oral nutraceuticals, ampoules, lotions, serums and supportive shampoos. Exact brand directions are kept separate from evidence strength and from the diagnosis of hair loss.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _ViewChip(
                label: 'Start',
                icon: Icons.route_outlined,
                selected: _view == _HairLossView.start,
                onTap: () => _selectView(_HairLossView.start),
              ),
              _ViewChip(
                label: 'Oral',
                icon: Icons.medication_outlined,
                selected: _view == _HairLossView.oral,
                onTap: () => _selectView(_HairLossView.oral),
              ),
              _ViewChip(
                label: 'Ampoules / serums',
                icon: Icons.water_drop_outlined,
                selected: _view == _HairLossView.topical,
                onTap: () => _selectView(_HairLossView.topical),
              ),
              _ViewChip(
                label: 'Shampoos',
                icon: Icons.shower_outlined,
                selected: _view == _HairLossView.shampoo,
                onTap: () => _selectView(_HairLossView.shampoo),
              ),
              _ViewChip(
                label: 'Ingredients',
                icon: Icons.science_outlined,
                selected: _view == _HairLossView.ingredients,
                onTap: () => _selectView(_HairLossView.ingredients),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (_view == _HairLossView.start)
            _StartPanel(theme: theme)
          else if (_view == _HairLossView.ingredients)
            _IngredientPanel(theme: theme)
          else ...[
            TextField(
              controller: _searchController,
              onChanged: (value) => setState(() => _query = value),
              decoration: InputDecoration(
                hintText: 'Search Priorin, Crescina, zinc, caffeine...',
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
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: Text(
                    switch (_view) {
                      _HairLossView.oral => 'Oral hair nutraceuticals',
                      _HairLossView.topical =>
                        'Ampoules, lotions & leave-in serums',
                      _HairLossView.shampoo => 'Supportive shampoos',
                      _ => '',
                    },
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Text(
                  _filteredProducts.length.toString(),
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            if (_view == _HairLossView.shampoo) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondaryContainer
                      .withValues(alpha: 0.55),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  'Shampoo rule: use these for cleansing, scalp support, breakage or cosmetic density. Do not counsel a rinse-off shampoo as a stand-alone proven regrowth treatment.',
                  style: TextStyle(height: 1.45, fontWeight: FontWeight.w700),
                ),
              ),
            ],
            const SizedBox(height: 10),
            if (_filteredProducts.isEmpty)
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Text('No matching verified product in this section.'),
                ),
              )
            else
              for (final item in _filteredProducts)
                _ProductCard(
                  product: item,
                  typeLabel: _typeLabel(item.type),
                  evidenceLabel: _evidenceLabel(item.evidence),
                  evidenceColor: _evidenceColor(context, item.evidence),
                  initiallyExpanded: item.id == widget.initialProductId,
                ),
          ],
        ],
      ),
    );
  }
}

class _StartPanel extends StatelessWidget {
  const _StartPanel({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: theme.colorScheme.errorContainer.withValues(alpha: 0.42),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Clinical locks',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 8),
              for (final item in hairLossGlobalLocks)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text('• ' + item, style: const TextStyle(height: 1.45)),
                ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        Text(
          'Start from the hair-loss pattern',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 8),
        for (final rule in hairLossTriageRules)
          Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: ExpansionTile(
              title: Text(
                rule.title,
                style: const TextStyle(fontWeight: FontWeight.w900),
              ),
              subtitle: Text(
                rule.pattern,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              children: [
                _Fact(
                  label: 'What it usually means',
                  body: rule.whatItUsuallyMeans,
                ),
                _Fact(
                  label: 'Role of non-drug products',
                  body: rule.nonDrugRole,
                ),
                _Fact(label: 'Lab plan', body: rule.labPlan),
                _Fact(
                  label: 'Refer / investigate',
                  body: rule.referWhen,
                  critical: true,
                ),
                _Fact(label: 'Source', body: rule.sourceLabel),
              ],
            ),
          ),
      ],
    );
  }
}

class _IngredientPanel extends StatelessWidget {
  const _IngredientPanel({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Ingredient guide — what the ingredient actually means',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Use this before comparing brands. A familiar ingredient on the front label does not prove that the patient needs it or that the dose/formula matches a positive study.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            height: 1.45,
          ),
        ),
        const SizedBox(height: 10),
        for (final item in hairIngredientGuide)
          Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: ExpansionTile(
              title: Text(
                item.name,
                style: const TextStyle(fontWeight: FontWeight.w900),
              ),
              subtitle: Text(item.whereSeen),
              childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              children: [
                _Fact(label: 'When it can be useful', body: item.whenUseful),
                _Fact(
                  label: 'What NOT to promise',
                  body: item.whatNotToPromise,
                  critical: true,
                ),
                _Fact(label: 'Safety', body: item.safety),
                _Fact(label: 'Source', body: item.sourceLabel),
              ],
            ),
          ),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    required this.product,
    required this.typeLabel,
    required this.evidenceLabel,
    required this.evidenceColor,
    required this.initiallyExpanded,
  });

  final HairLossProduct product;
  final String typeLabel;
  final String evidenceLabel;
  final Color evidenceColor;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        initiallyExpanded: initiallyExpanded,
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: evidenceColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            switch (product.type) {
              HairLossProductType.oralSupplement =>
                Icons.medication_outlined,
              HairLossProductType.topicalAmpouleLotionSerum =>
                Icons.water_drop_outlined,
              HairLossProductType.shampoo => Icons.shower_outlined,
            },
          ),
        ),
        title: Text(
          product.name,
          style: const TextStyle(fontWeight: FontWeight.w900),
        ),
        subtitle: Text(
          product.brand + ' · ' + typeLabel + '\n' + evidenceLabel,
        ),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        children: [
          _Fact(label: 'When to use', body: product.bestFor),
          _Fact(label: 'Key ingredients', body: product.keyIngredients),
          _Fact(label: 'Exact use', body: product.regimen),
          _Fact(label: 'How long', body: product.duration),
          _Fact(label: 'Evidence / benefit', body: product.evidenceNote),
          for (final safety in product.safety)
            _Fact(label: 'Safety', body: safety, critical: true),
          _Fact(
            label: 'Product-specific lock',
            body: product.productLock,
            critical: true,
          ),
          _Fact(label: 'Source', body: product.sourceLabel),
        ],
      ),
    );
  }
}

class _ViewChip extends StatelessWidget {
  const _ViewChip({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      selected: selected,
      avatar: Icon(icon, size: 18),
      label: Text(label),
      onSelected: (_) => onTap(),
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
      child: Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
            style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
            children: [
              TextSpan(
                text: label + ': ',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: critical ? theme.colorScheme.error : null,
                ),
              ),
              TextSpan(text: body),
            ],
          ),
        ),
      ),
    );
  }
}
