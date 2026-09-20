import 'package:flutter/material.dart';

import '../data/iv_preparation_profiles.dart';

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
  final _doseController = TextEditingController();

  @override
  void dispose() {
    _doseController.dispose();
    super.dispose();
  }

  double? get _dose => double.tryParse(_doseController.text.trim());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final profile = widget.profile;
    final withdrawalVolume =
        _dose == null || profile.withdrawalConcentration == null
            ? null
            : _dose! / profile.withdrawalConcentration!;

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
          const SizedBox(height: 4),
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
          _PrepCard(
            title: 'Allowed / relevant diluents',
            text: profile.allowedDiluents,
            icon: Icons.opacity_rounded,
          ),
          _PrepCard(
            title: 'Administration',
            text: profile.administration,
            icon: Icons.route_outlined,
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
          if (profile.withdrawalConcentration != null) ...[
            const SizedBox(height: 6),
            Text(
              'Prescribed-dose → withdrawal volume',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              'This calculator only converts a dose already prescribed to volume using the verified concentration shown above. It does not choose the dose, final concentration or infusion rate.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _doseController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Prescribed dose (${profile.withdrawalUnit})',
                suffixText: profile.withdrawalUnit,
              ),
              onChanged: (_) => setState(() {}),
            ),
            if (withdrawalVolume != null) ...[
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Volume to withdraw',
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${_fmt(withdrawalVolume)} mL',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${_fmt(_dose!)} ${profile.withdrawalUnit} ÷ '
                      '${_fmt(profile.withdrawalConcentration!)} ${profile.withdrawalUnit}/mL',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ],
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

  static String _fmt(double value) {
    final text = value.toStringAsFixed(3);
    return text
        .replaceFirst(RegExp(r'0+$'), '')
        .replaceFirst(RegExp(r'\.$'), '');
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