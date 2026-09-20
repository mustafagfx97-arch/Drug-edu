import 'package:flutter/material.dart';

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

  static const _profiles = [
    _PreparationProfile(
      name: 'Caffeine Citrate',
      population: 'NICU',
      authority: 'ANMF neonatal standard profile',
      unit: 'mg',
      stockConcentration: 20,
      targetConcentration: 8,
      finalVolume: 5,
      diluent: 'NS or D5W',
      formulation: 'Caffeine citrate 20 mg/mL',
    ),
    _PreparationProfile(
      name: 'Norepinephrine',
      population: 'PICU',
      authority: 'Pediatric standard concentration profile',
      unit: 'mcg',
      stockConcentration: 1000,
      targetConcentration: 32,
      finalVolume: 50,
      diluent: 'Validated dextrose-containing diluent',
      formulation: 'Norepinephrine 1 mg/mL = 1000 mcg/mL',
    ),
    _PreparationProfile(
      name: 'Sodium Bicarbonate',
      population: 'NICU',
      authority: 'ANMF neonatal preparation profile',
      unit: 'mmol',
      stockConcentration: 1,
      targetConcentration: 0.5,
      finalVolume: 20,
      diluent: 'WFI, D5W or NS as permitted by profile',
      formulation: 'Sodium bicarbonate 8.4% = 1 mmol/mL',
    ),
  ];

  @override
  void dispose() {
    _doseController.dispose();
    super.dispose();
  }

  double? get _dose => double.tryParse(_doseController.text.trim());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final profile = _profiles[_profileIndex];

    final totalDrug = profile.targetConcentration * profile.finalVolume;
    final stockVolume = totalDrug / profile.stockConcentration;
    final diluentVolume = profile.finalVolume - stockVolume;
    final doseVolume =
        _dose == null ? null : _dose! / profile.targetConcentration;

    return Scaffold(
      appBar: AppBar(title: const Text('IV Preparation Calculator')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          const _SafetyBanner(
            text:
                'Select the exact profile first. The calculator converts a prescribed dose; it does not select the dose.',
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<int>(
            value: _profileIndex,
            decoration: const InputDecoration(labelText: 'Preparation profile'),
            items: List.generate(
              _profiles.length,
              (index) => DropdownMenuItem(
                value: index,
                child: Text(
                  '${_profiles[index].name} · ${_profiles[index].population}',
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
          _InfoCard(
            title: profile.formulation,
            lines: [
              '${profile.population} · ${profile.authority}',
              'Stock: ${_fmt(profile.stockConcentration)} ${profile.unit}/mL',
              'Prepared: ${_fmt(profile.targetConcentration)} ${profile.unit}/mL',
              'Diluent: ${profile.diluent}',
            ],
          ),
          const SizedBox(height: 12),
          _ResultCard(
            title: 'Preparation',
            rows: [
              ('Drug needed', '${_fmt(totalDrug)} ${profile.unit}'),
              ('Volume from stock', '${_fmt(stockVolume)} mL'),
              ('Diluent volume', '${_fmt(diluentVolume)} mL'),
              ('Final total volume', '${_fmt(profile.finalVolume)} mL'),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _doseController,
            keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Total prescribed dose (${profile.unit})',
              helperText: 'Enter the already prescribed total dose.',
            ),
            onChanged: (_) => setState(() {}),
          ),
          if (doseVolume != null) ...[
            const SizedBox(height: 12),
            _ResultCard(
              title: 'Dose volume from prepared solution',
              rows: [
                ('Prescribed dose', '${_fmt(_dose!)} ${profile.unit}'),
                (
                  'Prepared concentration',
                  '${_fmt(profile.targetConcentration)} ${profile.unit}/mL'
                ),
                ('Volume to withdraw', '${_fmt(doseVolume)} mL'),
              ],
            ),
          ],
          const SizedBox(height: 14),
          Text(
            'V1 contains a small set of profile-linked examples. The full encyclopedia will migrate each verified preparation profile into the same calculator model.',
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

class _PreparationProfile {
  const _PreparationProfile({
    required this.name,
    required this.population,
    required this.authority,
    required this.unit,
    required this.stockConcentration,
    required this.targetConcentration,
    required this.finalVolume,
    required this.diluent,
    required this.formulation,
  });

  final String name;
  final String population;
  final String authority;
  final String unit;
  final double stockConcentration;
  final double targetConcentration;
  final double finalVolume;
  final String diluent;
  final String formulation;
}

class _SafetyBanner extends StatelessWidget {
  const _SafetyBanner({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(0.55),
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
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.title, required this.lines});
  final String title;
  final List<String> lines;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 10),
            for (final line in lines)
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(line),
              ),
          ],
        ),
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({required this.title, required this.rows});
  final String title;
  final List<(String, String)> rows;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 10),
            for (final row in rows)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Expanded(child: Text(row.$1)),
                    Text(
                      row.$2,
                      style: const TextStyle(fontWeight: FontWeight.w800),
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
