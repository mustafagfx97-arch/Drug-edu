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
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 32),
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.verified_user_outlined,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Verified preparation profile · ${profile.population}. Match the exact product/presentation before using any value below.',
                    style: theme.textTheme.bodyMedium?.copyWith(height: 1.4),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          IvDoseTimeQuickPanel(
            key: ValueKey('iv-dose-time-${profile.name}-${profile.population}'),
            profile: profile,
            onOpenFullCalculator: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) =>
                    IvDilutionCalculatorScreen(initialProfile: profile),
              ),
            ),
          ),
          const SizedBox(height: 8),
          if (profile.criticalLocks.isNotEmpty)
            Text(
              'Essential safety checks · تحذيرات مهمة',
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w900),
            ),
          if (profile.criticalLocks.isNotEmpty) ...[
            const SizedBox(height: 12),
            for (final lock in profile.criticalLocks) ...[
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: theme.colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.lock_outline_rounded, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        lock,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          height: 1.4,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
          const SizedBox(height: 8),
          Card(
            child: ExpansionTile(
              key: const ValueKey('iv-expand-preparation-details'),
              initiallyExpanded: false,
              title: const Text(
                'Preparation, fluids & stability · تفاصيل التخفيف',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              subtitle: const Text(
                'Review before administration when dilution, '
                'compatibility or storage matters.',
              ),
              childrenPadding: const EdgeInsets.symmetric(
                horizontal: 8, vertical: 4,
              ),
              children: [
                _PrepCard(
                  title: 'Presentation / formulation',
                  text: profile.formulation,
                  icon: Icons.inventory_2_outlined,
                ),
                _PrepCard(
                  title: 'Reconstitution',
                  text: profile.reconstitution,
                  icon: Icons.science_outlined,
                ),
                _PrepCard(
                  title: 'Resulting concentration',
                  text: profile.resultingConcentration,
                  icon: Icons.functions_rounded,
                ),
                _PrepCard(
                  title: 'Further dilution',
                  text: profile.furtherDilution,
                  icon: Icons.water_drop_outlined,
                ),
                const _PrepCard(
                  title: 'Fluid versus Y-site compatibility',
                  text: 'Dilution-fluid compatibility does NOT establish '
                      'compatibility with another IV medication through '
                      'a shared line. If evidence is absent, treat it '
                      'as UNKNOWN.',
                  icon: Icons.shield_outlined,
                ),
                _PrepCard(
                  title: 'Allowed / relevant diluents',
                  text: profile.allowedDiluents,
                  icon: Icons.opacity_rounded,
                ),
                _PrepCard(
                  title: 'Stability / BUD',
                  text: profile.stability,
                  icon: Icons.schedule_outlined,
                ),
                _PrepCard(
                  title: 'Important incompatibilities',
                  text: profile.incompatibilities,
                  icon: Icons.warning_amber_rounded,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              border: Border.all(color: theme.colorScheme.outlineVariant),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              'Source: ${profile.sourceLabel}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }


}

class _PrepCard extends StatelessWidget {
  const _PrepCard({
    required this.title,
    required this.text,
    required this.icon,
  });

  final String title;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42,
              height: 42,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 21),
            ),
            const SizedBox(width: 11),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    text,
                    style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}