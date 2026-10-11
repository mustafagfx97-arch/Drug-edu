import 'package:flutter/material.dart';

import '../data/iv_fluid_evidence.dart';
import '../data/iv_preparation_profiles.dart';
import 'iv_preparation_detail_screen.dart';

class IvFluidScreen extends StatefulWidget {
  const IvFluidScreen({super.key});

  @override
  State<IvFluidScreen> createState() => _IvFluidScreenState();
}

class _IvFluidScreenState extends State<IvFluidScreen> {
  late int _selectedIndex = ivPreparationProfiles.indexWhere(
    (p) => p.name == 'Nicardipine' && p.population == 'General',
  );
  IvFluid _fluid = IvFluid.normalSaline;
  int? _firstYsite;
  int? _secondYsite;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final chosen = ivPreparationProfiles[_selectedIndex];
    final evidence = reviewedIvFluidEvidence(
      name: chosen.name,
      population: chosen.population,
      fluid: _fluid,
    );

    final (icon, label) = switch (evidence.status) {
      IvFluidEvidenceStatus.verifiedDiluent =>
        (Icons.check_circle_outline, 'LABEL-SUPPORTED DILUENT'),
      IvFluidEvidenceStatus.incompatibleDiluent =>
        (Icons.block, 'LABEL INCOMPATIBLE'),
      IvFluidEvidenceStatus.coadministrationOnly =>
        (Icons.info_outline, 'FLUID CO-ADMINISTRATION ONLY — DO NOT DILUTE'),
      IvFluidEvidenceStatus.unknown =>
        (Icons.help_outline, 'NOT VERIFIED — MANUAL CHECK REQUIRED'),
    };

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 30),
      children: [
        Text(
          'IV Fluids & Y-site · توافق المحاليل',
          style: theme.textTheme.headlineSmall
              ?.copyWith(fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 9),
        const Card(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              'Two different questions: (1) Can this EXACT medicine be prepared '
              'in this IV fluid? (2) Can TWO prepared medicines share a Y-site? '
              'A YES for dilution does NOT answer Y-site compatibility. '
              'Unknown means: verify, never assume.',
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '1 · Preparation-fluid checker',
          style: theme.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 10),
        _DrugPicker(
          key: const ValueKey('fluid-drug-picker'),
          label: 'Select exact drug + population',
          value: _selectedIndex,
          onChanged: (index) {
            if (index != null) setState(() => _selectedIndex = index);
          },
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<IvFluid>(
          key: const ValueKey('fluid-type-picker'),
          initialValue: _fluid,
          isExpanded: true,
          decoration: const InputDecoration(
            labelText: 'IV fluid to check',
            border: OutlineInputBorder(),
          ),
          items: [
            for (final fluid in IvFluid.values)
              DropdownMenuItem(value: fluid, child: Text(fluid.label)),
          ],
          onChanged: (value) {
            if (value != null) setState(() => _fluid = value);
          },
        ),
        const SizedBox(height: 11),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        label,
                        style: const TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(evidence.explanation),
                const SizedBox(height: 7),
                Text(
                  'Source: ${evidence.source}',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 9),
        const Text(
          'Original verified product profile (read all warnings and conditions):',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        _InfoCard(title: 'Exact formulation', text: chosen.formulation),
        _InfoCard(title: 'Manufacturer / protocol diluent text',
            text: chosen.allowedDiluents),
        _InfoCard(title: 'Further dilution / ready-to-use',
            text: chosen.furtherDilution),
        _InfoCard(title: 'Incompatibilities',
            text: chosen.incompatibilities),
        _InfoCard(title: 'Source', text: chosen.sourceLabel),
        OutlinedButton.icon(
          icon: const Icon(Icons.open_in_new),
          label: const Text('Open complete IV preparation profile'),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (_) => IvPreparationDetailScreen(profile: chosen),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          '2 · Drug + drug Y-site check',
          style: theme.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 7),
        const Text(
          'Concentrations, diluent, contact time, device and manufacturer '
          'matter. This app does NOT certify any drug pair as compatible; '
          'it can flag a label prohibition and otherwise returns UNKNOWN.',
        ),
        const SizedBox(height: 10),
        _DrugPicker(
          key: const ValueKey('ysite-first-picker'),
          label: 'First infused drug',
          value: _firstYsite,
          onChanged: (value) => setState(() => _firstYsite = value),
        ),
        const SizedBox(height: 10),
        _DrugPicker(
          key: const ValueKey('ysite-second-picker'),
          label: 'Second infused drug',
          value: _secondYsite,
          onChanged: (value) => setState(() => _secondYsite = value),
        ),
        const SizedBox(height: 10),
        if (_firstYsite != null && _secondYsite != null)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                _firstYsite == _secondYsite
                    ? 'Choose two different IV medicines.'
                    : reviewIvYsite(
                            firstDrug: ivPreparationProfiles[_firstYsite!].name,
                            secondDrug:
                                ivPreparationProfiles[_secondYsite!].name,
                            firstPopulation:
                                ivPreparationProfiles[_firstYsite!].population,
                            secondPopulation:
                                ivPreparationProfiles[_secondYsite!].population,
                          ) == IvYsiteStatus.prohibitedByLabel
                        ? 'DO NOT SHARE LINE: Cleviprex labeling explicitly '
                          'prohibits administration in the same IV line as '
                          'other medications. Separate line required.'
                        : 'UNKNOWN: No product/concentration-specific Y-site '
                          'evidence validated for this pair in this app. '
                          'Consult a current compatibility reference or pharmacy '
                          'before shared-line administration.',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
      ],
    );
  }
}

class _DrugPicker extends StatelessWidget {
  const _DrugPicker({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final int? value;
  final ValueChanged<int?> onChanged;

  @override
  Widget build(BuildContext context) => DropdownButtonFormField<int>(
        key: ValueKey('picker-$label-${value ?? 'none'}'),
        initialValue: value,
        isExpanded: true,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        items: [
          for (var i = 0; i < ivPreparationProfiles.length; i++)
            DropdownMenuItem(
              value: i,
              child: Text(
                '${ivPreparationProfiles[i].name} · '
                '${ivPreparationProfiles[i].population}',
                overflow: TextOverflow.ellipsis,
              ),
            ),
        ],
        onChanged: onChanged,
      );
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.title, required this.text});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(
                fontWeight: FontWeight.w800,
              )),
              const SizedBox(height: 5),
              Text(text),
            ],
          ),
        ),
      );
}
