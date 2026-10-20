import 'package:flutter/material.dart';

import '../data/iv_preparation_profiles.dart';
import '../data/iv_methylprednisolone_presentations.dart';
import '../../calculators/presentation/iv_dilution_calculator_screen.dart';
import 'iv_dose_time_quick_panel.dart';

class IvPreparationDetailScreen extends StatefulWidget {
  const IvPreparationDetailScreen({
    super.key,
    required this.profile,
  });

  final IvPreparationProfile profile;

  @override
  State<IvPreparationDetailScreen> createState() =>
      _IvPreparationDetailScreenState();
}

class _IvPreparationDetailScreenState
    extends State<IvPreparationDetailScreen> {
  String? _methylprednisoloneProductId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final profile = widget.profile;
    final selectingMethylprednisolone =
        profile.population == 'General' && profile.name == 'Methylprednisolone';
    IvMethylprednisolonePresentation? product;
    if (selectingMethylprednisolone) {
      for (final option in ivMethylprednisolonePresentations) {
        if (option.id == _methylprednisoloneProductId) product = option;
      }
    }
    final requiresProduct = selectingMethylprednisolone && product == null;
    final reconstitution = requiresProduct
        ? 'Select the exact methylprednisolone vial above to see its dilution volume.'
        : product?.reconstitution ?? profile.reconstitution;
    final fluids = requiresProduct
        ? 'Select the exact vial before applying fluid compatibility instructions.'
        : product?.compatibleInfusionFluids ?? profile.allowedDiluents;
    final time = requiresProduct
        ? 'High-dose IV administration needs indication-specific timing. Select the vial.'
        : product?.administration ?? profile.administration;
    final further = requiresProduct
        ? 'Reconstitution and further infusion dilution are different steps. Select the vial.'
        : product?.furtherDilution ?? profile.furtherDilution;

    return Scaffold(
      appBar: AppBar(title: Text(profile.name)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        children: [
          Text('IV · ${profile.population}',
              style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          if (selectingMethylprednisolone) ...[
            DropdownButtonFormField<String>(
              key: const ValueKey('iv-methylprednisolone-product'),
              initialValue: _methylprednisoloneProductId,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Exact methylprednisolone vial',
                helperText: 'Act-O-Vial and plain vials have different reconstitution volumes.',
                border: OutlineInputBorder(),
              ),
              items: [
                for (final option in ivMethylprednisolonePresentations)
                  DropdownMenuItem(
                    value: option.id,
                    child: Text(option.label, overflow: TextOverflow.ellipsis),
                  ),
              ],
              onChanged: (value) => setState(() {
                _methylprednisoloneProductId = value;
              }),
            ),
            const SizedBox(height: 10),
          ],
          Card(
            margin: EdgeInsets.zero,
            child: Column(
              children: [
                _FastFact(
                  key: const ValueKey('iv-quick-reconstitution'),
                  title: 'Reconstitution',
                  value: reconstitution,
                  extra: product == null
                      ? (requiresProduct ? null : profile.resultingConcentration)
                      : 'Resulting stock: ${product.stockMgPerMl} mg/mL',
                  icon: Icons.science_outlined,
                ),
                const Divider(height: 1),
                _FastFact(
                  key: const ValueKey('iv-quick-fluids'),
                  title: 'Compatible IV fluids',
                  value: fluids,
                  extra: 'Compatible infusion fluids do NOT establish Y-site compatibility.',
                  icon: Icons.water_drop_outlined,
                ),
                const Divider(height: 1),
                _FastFact(
                  key: const ValueKey('iv-quick-time'),
                  title: 'Administration time',
                  value: time,
                  icon: Icons.schedule_outlined,
                ),
                const Divider(height: 1),
                _FastFact(
                  key: const ValueKey('iv-quick-further-dilution'),
                  title: 'Further dilution',
                  value: further,
                  icon: Icons.opacity_outlined,
                ),
              ],
            ),
          ),
          if (profile.criticalLocks.isNotEmpty) ...[
            const SizedBox(height: 8),
            Card(
              margin: EdgeInsets.zero,
              child: ExpansionTile(
                key: const ValueKey('iv-quick-safety'),
                initiallyExpanded: false,
                leading: Icon(Icons.warning_amber_rounded,
                    color: theme.colorScheme.error),
                title: Text('Critical notes (${profile.criticalLocks.length})'),
                subtitle: Text(
                  profile.criticalLocks.first,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                childrenPadding:
                    const EdgeInsets.fromLTRB(16, 0, 16, 10),
                children: [
                  for (final warning in profile.criticalLocks)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(warning),
                      ),
                    ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 8),
          Card(
            margin: EdgeInsets.zero,
            child: ExpansionTile(
              key: const ValueKey('iv-simple-calc-toggle'),
              initiallyExpanded: false,
              leading: const Icon(Icons.calculate_outlined),
              title: const Text('Dose calculator (optional)'),
              subtitle: const Text('Choose vial + prescribed dose → mL'),
              childrenPadding: const EdgeInsets.all(8),
              children: [
                if (requiresProduct)
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text('Select the exact methylprednisolone vial first.'),
                  )
                else
                  IvDoseTimeQuickPanel(
                  key: ValueKey(
                    'iv-dose-time-${profile.name}-${profile.population}-${product?.id ?? ''}'),
                  profile: profile,
                  initialVariantId: product?.id,
                  onOpenFullCalculator: () =>
                      Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (_) =>
                        IvDilutionCalculatorScreen(initialProfile: profile),
                  )),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Card(
            margin: EdgeInsets.zero,
            child: ExpansionTile(
              key: const ValueKey('iv-expand-preparation-details'),
              initiallyExpanded: false,
              leading: const Icon(Icons.menu_book_outlined),
              title: const Text('Full details and sources'),
              subtitle: const Text('Stability, incompatibilities, product labeling'),
              childrenPadding:
                  const EdgeInsets.fromLTRB(14, 0, 14, 14),
              children: [
                if (product != null) ...[
                  _InfoLine('Selected product', product.label),
                  _InfoLine('Product-specific safety', product.safety),
                  _InfoLine('Manufacturer label', product.sourceUrl),
                ],
                _InfoLine('Presentation', profile.formulation),
                _InfoLine('Resulting concentration',
                    profile.resultingConcentration),
                _InfoLine('Stability/BUD', profile.stability),
                _InfoLine('Incompatibilities', profile.incompatibilities),
                _InfoLine('Source', profile.sourceLabel),
              ],
            ),
          ),
        ],
      ),
    );
  }


}

class _FastFact extends StatefulWidget {
  const _FastFact({
    super.key, required this.title, required this.value,
    required this.icon, this.extra,
  });

  final String title;
  final String value;
  final String? extra;
  final IconData icon;

  @override
  State<_FastFact> createState() => _FastFactState();
}

class _FastFactState extends State<_FastFact> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final expandable = widget.value.length > 125 || widget.extra != null;
    return InkWell(
      onTap: expandable ? () => setState(() => expanded = !expanded) : null,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 10, 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(widget.icon, color: theme.colorScheme.primary, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,
                      style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  Text(widget.value,
                      maxLines: expanded ? null : 3,
                      overflow: expanded
                          ? TextOverflow.visible : TextOverflow.ellipsis),
                  if (expanded && widget.extra != null) ...[
                    const SizedBox(height: 6),
                    Text(widget.extra!, style: theme.textTheme.bodySmall),
                  ],
                ],
              ),
            ),
            if (expandable)
              Icon(expanded ? Icons.expand_less : Icons.expand_more,
                  size: 20),
          ],
        ),
      ),
    );
  }
}

class _InfoLine extends StatelessWidget {
  const _InfoLine(this.title, this.value);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 12),
    child: Align(
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text(value),
        ],
      ),
    ),
  );
}
