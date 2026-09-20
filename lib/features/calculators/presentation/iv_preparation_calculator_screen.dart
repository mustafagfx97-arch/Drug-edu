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

  List<IvPreparationProfile> get _profiles => ivPreparationProfiles
      .where((profile) => profile.withdrawalConcentration != null)
      .toList();

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
          child: Text('No verified dose-volume profiles are available.'),
        ),
      );
    }

    final profile = profiles[_profileIndex.clamp(0, profiles.length - 1)];
    final dose = double.tryParse(_doseController.text.trim());
    final concentration = profile.withdrawalConcentration!;
    final volume = dose == null ? null : dose / concentration;

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
                    'This calculator never selects a therapeutic dose, target concentration, diluent volume or infusion rate. It only converts an already prescribed dose using a verified product concentration.',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<int>(
            value: _profileIndex,
            decoration: const InputDecoration(
              labelText: 'Verified preparation profile',
            ),
            items: List.generate(
              profiles.length,
              (index) => DropdownMenuItem(
                value: index,
                child: Text(
                  '${profiles[index].name} · ${profiles[index].population}',
                ),
              ),
            ),
            onChanged: (value) {
              if (value == null) return;
              setState(() {
                _profileIndex = value;
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
                  const SizedBox(height: 8),
                  Text(profile.formulation),
                  const SizedBox(height: 7),
                  Text(
                    'Verified withdrawal concentration: '
                    '${_fmt(concentration)} ${profile.withdrawalUnit}/mL',
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
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
          TextField(
            controller: _doseController,
            keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Prescribed dose (${profile.withdrawalUnit})',
              helperText: 'Enter the dose already ordered/prescribed.',
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
                    'Volume to withdraw',
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
                    '${_fmt(dose!)} ${profile.withdrawalUnit} ÷ '
                    '${_fmt(concentration)} ${profile.withdrawalUnit}/mL',
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
            title: 'Critical locks',
            text: profile.criticalLocks.isEmpty
                ? 'No additional lock in this profile.'
                : profile.criticalLocks.join('\n• '),
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