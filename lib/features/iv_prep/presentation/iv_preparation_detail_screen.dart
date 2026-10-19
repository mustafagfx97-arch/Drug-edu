import 'package:flutter/material.dart';

import '../data/iv_preparation_profiles.dart';
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
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final profile = widget.profile;

    return Scaffold(
      appBar: AppBar(title: Text(profile.name)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        children: [
          Text('IV · ${profile.population}',
              style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Card(
            margin: EdgeInsets.zero,
            child: Column(
              children: [
                _FastFact(
                  key: const ValueKey('iv-quick-reconstitution'),
                  title: 'بكم ينحل؟ · Reconstitution',
                  value: profile.reconstitution,
                  extra: profile.resultingConcentration,
                  icon: Icons.science_outlined,
                ),
                const Divider(height: 1),
                _FastFact(
                  key: const ValueKey('iv-quick-fluids'),
                  title: 'الفلود المتوافق · Dilution fluids',
                  value: profile.allowedDiluents,
                  extra: 'التوافق مع الفلود لا يثبت توافق Y-site مع دواء آخر.',
                  icon: Icons.water_drop_outlined,
                ),
                const Divider(height: 1),
                _FastFact(
                  key: const ValueKey('iv-quick-time'),
                  title: 'وقت الإعطاء · IV time',
                  value: profile.administration,
                  icon: Icons.schedule_outlined,
                ),
                const Divider(height: 1),
                _FastFact(
                  key: const ValueKey('iv-quick-further-dilution'),
                  title: 'تخفيف إضافي؟ · Further dilution',
                  value: profile.furtherDilution,
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
                title: Text('تنبيهات مهمة (${profile.criticalLocks.length})'),
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
              title: const Text('افتح الحاسبة عند الحاجة'),
              subtitle: const Text('اختيار الأمبولة + الجرعة = mL'),
              childrenPadding: const EdgeInsets.all(8),
              children: [
                IvDoseTimeQuickPanel(
                  key: ValueKey(
                    'iv-dose-time-${profile.name}-${profile.population}'),
                  profile: profile,
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
              title: const Text('تفاصيل إضافية والمصادر'),
              subtitle: const Text('الثبات، التداخلات، وبيانات المستحضر'),
              childrenPadding:
                  const EdgeInsets.fromLTRB(14, 0, 14, 14),
              children: [
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
