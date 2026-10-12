import 'package:flutter/material.dart';

import '../data/iv_preparation_profiles.dart';
import '../data/iv_stock_strength_audit.dart';

/// Arithmetic from an actual clinician-ordered dose and a manually confirmed
/// source-listed stock concentration. NO therapeutic dose selection, route,
/// dilution/compatibility approval or infusion rate is provided here.
double? quickIvOrderedDoseToMl({
  required double orderedDose,
  required double verifiedStockUnitPerMl,
  required bool vialAndUnitConfirmed,
}) {
  if (!vialAndUnitConfirmed ||
      !orderedDose.isFinite ||
      orderedDose <= 0 ||
      !verifiedStockUnitPerMl.isFinite ||
      verifiedStockUnitPerMl <= 0) {
    return null;
  }
  final volume = orderedDose / verifiedStockUnitPerMl;
  return volume.isFinite && volume > 0 ? volume : null;
}

/// High-risk products require additional dose-unit, formulation or route
/// verification that must not be bypassed by a generic one-line calculator.
bool quickIvNeedsSpecializedCalculator(IvPreparationProfile profile) =>
    (profile.population == 'General' && <String>{
      'Norepinephrine',
      'Labetalol',
      'Regular insulin infusion',
      'Colistimethate / Colistin',
      'Clevidipine',
      'Esmolol',
    }.contains(profile.name)) ||
    profile.population == 'NICU' ||
    profile.population == 'PICU';

class IvDoseTimeQuickPanel extends StatefulWidget {
  const IvDoseTimeQuickPanel({
    super.key,
    required this.profile,
    required this.onOpenFullCalculator,
  });

  final IvPreparationProfile profile;
  final VoidCallback onOpenFullCalculator;

  @override
  State<IvDoseTimeQuickPanel> createState() => _IvDoseTimeQuickPanelState();
}

class _IvDoseTimeQuickPanelState extends State<IvDoseTimeQuickPanel> {
  final _orderedDose = TextEditingController();
  int? _selectedStrength;
  bool _vialConfirmed = false;

  @override
  void dispose() {
    _orderedDose.dispose();
    super.dispose();
  }

  static String _fmt(double value) {
    final t = value.toStringAsFixed(4);
    return t.replaceFirst(RegExp(r'0+$'), '')
        .replaceFirst(RegExp(r'\.$'), '');
  }

  @override
  Widget build(BuildContext context) {
    final profile = widget.profile;
    final theme = Theme.of(context);
    final audited = reviewedAdultIvStockOptions(
      name: profile.name, population: profile.population,
    );
    final variants = audited.isNotEmpty
        ? [
            for (final a in audited)
              IvWithdrawalVariant(
                id: a.id,
                label: a.packageLabel,
                unit: a.unit,
                concentration: a.concentrationPerMl,
                note: a.safetyNote,
              ),
          ]
        : profile.calculatorVariants;
    final special = quickIvNeedsSpecializedCalculator(profile);
    final selection = _selectedStrength != null &&
            _selectedStrength! >= 0 &&
            _selectedStrength! < variants.length
        ? _selectedStrength
        : null;
    final variant = selection == null ? null : variants[selection];
    final volume = variant == null
        ? null
        : quickIvOrderedDoseToMl(
            orderedDose: double.tryParse(_orderedDose.text.trim()) ?? double.nan,
            verifiedStockUnitPerMl: variant.concentration,
            vialAndUnitConfirmed: _vialConfirmed && !special,
          );
    final selectedPackage = selection != null && audited.isNotEmpty
        ? audited[selection]
        : null;

    return Card(
      key: const ValueKey('iv-dose-time-first-panel'),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'الجرعة + طريقة ووقت الإعطاء · Dose & time',
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 7),
            const Text(
              '1. Check the actual order, indication and IV route. '
              'The administration instructions below come from '
              'the selected product/profile; they may describe '
              'multiple distinct methods. Not every medicine '
              'may be given as an IV push.',
            ),
            const SizedBox(height: 9),
            Text('Method & duration · الطريقة والمدة',
                style: theme.textTheme.titleSmall
                    ?.copyWith(fontWeight: FontWeight.w900)),
            const SizedBox(height: 5),
            Text(profile.administration),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 6),
            Text('2. Prescribed dose → stock mL · الجرعة إلى mL',
                style: theme.textTheme.titleSmall
                    ?.copyWith(fontWeight: FontWeight.w900)),
            const SizedBox(height: 7),
            if (special)
              const Text(
                'SPECIALIZED PATHWAY: dose basis and IV mode must be '
                'checked using this drug/population-specific '
                'calculator. Generic withdrawal is hidden to avoid '
                'mixing salt/base, adult/pediatric regimens, '
                'bolus and infusion, or ready-to-use products.',
              )
            else if (variants.isEmpty)
              const Text(
                'This profile does not yet have a sufficiently '
                'structured dose unit and stock strength. '
                'Use the manufacturer/institutional reference; '
                'no mL figure is generated.',
              )
            else ...[
              DropdownButtonFormField<int>(
                key: const ValueKey('iv-quick-vial-choice'),
                isExpanded: true,
                initialValue: _selectedStrength,
                decoration: const InputDecoration(
                  labelText: 'Actual vial / stock · الأمبولة الموجودة',
                  border: OutlineInputBorder(),
                ),
                hint: const Text('Select a matching source-listed stock'),
                items: [
                  for (var i = 0; i < variants.length; i++)
                    DropdownMenuItem(
                      value: i,
                      child: Text(
                        variants[i].label,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
                onChanged: (index) => setState(() {
                  _selectedStrength = index;
                  _orderedDose.clear();
                  _vialConfirmed = false;
                }),
              ),
              if (variant != null) ...[
                const SizedBox(height: 7),
                Text(
                  'Selected concentration: ' +
                      _fmt(variant.concentration) + ' ' +
                      variant.unit + '/mL',
                ),
                Text(variant.note, style: theme.textTheme.bodySmall),
                if (selectedPackage != null)
                  SelectableText(
                    'Official package: ' + selectedPackage.packageLabel +
                    '\nManufacturer source: ' + selectedPackage.sourceUrl,
                    style: theme.textTheme.bodySmall,
                  )
                else
                  Text(
                    'Existing concentration reference — confirm '
                    'the manufacturer and package locally.',
                    style: theme.textTheme.bodySmall,
                  ),
                const SizedBox(height: 8),
                TextField(
                  key: const ValueKey('iv-quick-ordered-dose'),
                  controller: _orderedDose,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Already ORDERED dose (' + variant.unit + ')',
                    border: const OutlineInputBorder(),
                  ),
                  onChanged: (_) => setState(() {}),
                ),
                CheckboxListTile(
                  key: const ValueKey('iv-quick-confirm-vial'),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  value: _vialConfirmed,
                  onChanged: (value) => setState(
                    () => _vialConfirmed = value ?? false,
                  ),
                  title: const Text(
                    'I matched the actual product, labelled stock '
                    'concentration, dosage-form, prescribed dose '
                    'and SAME dose units.',
                  ),
                ),
                if (volume != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    'Withdrawal arithmetic · حجم السحب',
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  Text(
                    _fmt(volume) + ' mL',
                    key: const ValueKey('iv-quick-withdrawal-result'),
                    style: theme.textTheme.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  if (selectedPackage != null &&
                      volume > selectedPackage.vialVolumeMl)
                    Text(
                      'More than one vial is needed. Check the '
                      'number of vials and single-use/discard rules.',
                    ),
                  const Text(
                    'STOCK withdrawal only, NOT final IV preparation '
                    'or permission for direct injection. Verify '
                    'required dilution, compatibility, route, '
                    'administration duration and monitoring.',
                  ),
                ],
              ],
            ],
            const SizedBox(height: 10),
            OutlinedButton.icon(
              key: const ValueKey('iv-open-full-calculator'),
              onPressed: widget.onOpenFullCalculator,
              icon: const Icon(Icons.calculate_outlined),
              label: const Text(
                'Other strength / verified dilution / infusion rate',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
