import 'package:flutter/material.dart';

import '../../iv_prep/data/iv_preparation_profiles.dart';

class IvPreparationCalculatorScreen extends StatefulWidget {
  const IvPreparationCalculatorScreen({super.key});

  @override
  State<IvPreparationCalculatorScreen> createState() =>
      _IvPreparationCalculatorScreenState();
}

class _IvPreparationCalculatorScreenState
    extends State<IvPreparationCalculatorScreen> {
  final _doseController = TextEditingController();
  int _profileIndex = 0;
  int _variantIndex = 0;

  List<IvPreparationProfile> get _profiles =>
      ivPreparationProfiles.toList(growable: false);

  @override
  void dispose() {
    _doseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final profiles = _profiles;

    if (profiles.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Text('No verified IV preparation profiles are available.'),
        ),
      );
    }

    final safeProfileIndex = _profileIndex < profiles.length ? _profileIndex : 0;
    final profile = profiles[safeProfileIndex];
    final variants = profile.calculatorVariants;
    final safeVariantIndex =
        _variantIndex < variants.length ? _variantIndex : 0;
    final variant = variants.isEmpty ? null : variants[safeVariantIndex];

    final dose = double.tryParse(_doseController.text.trim());
    final volume = dose == null || variant == null
        ? null
        : dose / variant.concentration;
    final calculatorEnabledCount = profiles
        .where((item) => item.calculatorVariants.isNotEmpty)
        .length;

    return Scaffold(
      appBar: AppBar(title: const Text('IV Dose → Volume Calculator')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 32),
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: theme.colorScheme.errorContainer,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.lock_outline_rounded),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'This tool never selects a therapeutic dose, target concentration, diluent volume or infusion rate. It only converts an already prescribed dose when an exact source-locked product concentration exists.',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${profiles.length} verified profiles · '
            '$calculatorEnabledCount calculator-enabled',
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<int>(
            key: ValueKey('iv-profile-$_profileIndex'),
            isExpanded: true,
            initialValue: safeProfileIndex,
            decoration: const InputDecoration(
              labelText: 'Verified preparation profile',
            ),
            items: List.generate(
              profiles.length,
              (index) => DropdownMenuItem(
                value: index,
                child: Text(
                  '${profiles[index].name} · ${profiles[index].population}',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            onChanged: (value) {
              if (value == null) return;
              setState(() {
                _profileIndex = value;
                _variantIndex = 0;
                _doseController.clear();
              });
            },
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(profile.formulation),
                  const SizedBox(height: 7),
                  Text(
                    profile.resultingConcentration,
                    style: theme.textTheme.bodyMedium?.copyWith(height: 1.4),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          if (variants.length > 1) ...[
            DropdownButtonFormField<int>(
              key: ValueKey(
                'iv-variant-$_profileIndex-$_variantIndex',
              ),
              isExpanded: true,
              initialValue: safeVariantIndex,
              decoration: const InputDecoration(
                labelText: 'Exact vial / presentation',
              ),
              items: List.generate(
                variants.length,
                (index) => DropdownMenuItem(
                  value: index,
                  child: Text(
                    variants[index].label,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  _variantIndex = value;
                  _doseController.clear();
                });
              },
            ),
            const SizedBox(height: 12),
          ],
          if (variant != null) ...[
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    variant.label,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Verified concentration: '
                    '${_fmt(variant.concentration)} ${variant.unit}/mL',
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    variant.note,
                    style: theme.textTheme.bodyMedium?.copyWith(height: 1.4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _doseController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Prescribed dose (${variant.unit})',
                helperText:
                    'Enter the already ordered dose in the SAME unit shown here.',
              ),
              onChanged: (_) => setState(() {}),
            ),
            if (volume != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Volume to withdraw / use',
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${_fmt(volume)} mL',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${_fmt(dose!)} ${variant.unit} ÷ '
                      '${_fmt(variant.concentration)} ${variant.unit}/mL',
                    ),
                  ],
                ),
              ),
            ],
          ] else ...[
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: theme.colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(17),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.front_hand_outlined),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Manual exact-product profile: this verified medicine does not have one calculator-safe withdrawal concentration for the IV method shown. Use the reconstitution instructions below; dose-to-volume calculation is intentionally disabled rather than guessed.',
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 14),
          _InfoCard(
            title: 'Reconstitution',
            text: profile.reconstitution,
          ),
          _InfoCard(
            title: 'Further dilution',
            text: profile.furtherDilution,
          ),
          _InfoCard(
            title: 'Allowed diluents',
            text: profile.allowedDiluents,
          ),
          _InfoCard(
            title: 'Administration',
            text: profile.administration,
          ),
          _InfoCard(
            title: 'Critical locks',
            text: profile.criticalLocks.isEmpty
                ? 'No additional lock in this profile.'
                : '• ' + profile.criticalLocks.join('\n• '),
          ),
          const SizedBox(height: 10),
          Text(
            'Source: ${profile.sourceLabel}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.4,
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

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.title,
    required this.text,
  });

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
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
    );
  }
}
