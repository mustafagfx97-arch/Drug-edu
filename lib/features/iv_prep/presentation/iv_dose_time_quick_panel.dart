import 'package:flutter/material.dart';

import '../data/iv_preparation_profiles.dart';
import '../data/iv_stock_strength_audit.dart';
import '../data/iv_adult_dose_regimens.dart';
import '../data/iv_guided_preparation_options.dart';
import 'iv_adult_dose_guide_panel.dart';

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
      'Potassium chloride',
      'Potassium phosphate',
      'Sodium phosphate',
      'Epinephrine',
      'Sodium nitroprusside',
      'Nitroglycerin',
      'Phenytoin',
    }.contains(profile.name)) ||
    profile.population == 'NICU' ||
    profile.population == 'PICU';

class IvDoseTimeQuickPanel extends StatefulWidget {
  const IvDoseTimeQuickPanel({
    super.key,
    required this.profile,
    required this.onOpenFullCalculator,
    this.initialVariantId,
  });

  final IvPreparationProfile profile;
  final VoidCallback onOpenFullCalculator;
  final String? initialVariantId;

  @override
  State<IvDoseTimeQuickPanel> createState() => _IvDoseTimeQuickPanelState();
}

class _IvDoseTimeQuickPanelState extends State<IvDoseTimeQuickPanel> {
  final _orderedDose = TextEditingController();
  final _dosingWeight = TextEditingController();
  int _mode = 0; // 0 = dose/withdrawal, 1 = prepare without dose
  String? _guidedDoseId;
  String? _recipeId;
  bool _regimenConfirmed = false;
  int? _selectedStrength;
  bool _vialConfirmed = false;
  String? _selectedDoseRegimen;

  @override
  void initState() {
    super.initState();
    final id = widget.initialVariantId;
    if (id != null) {
      final choices = widget.profile.calculatorVariants;
      final index = choices.indexWhere((item) => item.id == id);
      if (index >= 0) _selectedStrength = index;
    }
  }

  @override
  void dispose() {
    _orderedDose.dispose();
    _dosingWeight.dispose();
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
    final doseOptions = guidedDoseOptionsFor(profile.name, profile.population);
    final chosenDoses = doseOptions.where((v) => v.id == _guidedDoseId);
    final chosenDose = chosenDoses.isEmpty ? null : chosenDoses.first;
    final kg = double.tryParse(_dosingWeight.text.trim());
    final guidedMg = chosenDose?.doseMg(weightKg: kg);
    final recipes = dilutionRecipesFor(profile.name, profile.population);
    final chosenRecipes = recipes.where((v) => v.id == _recipeId);
    final chosenRecipe = chosenRecipes.isEmpty ? null : chosenRecipes.first;
    final selection = _selectedStrength != null &&
            _selectedStrength! >= 0 &&
            _selectedStrength! < variants.length
        ? _selectedStrength
        : null;
    final variant = selection == null ? null : variants[selection];
    final volume = variant == null
        ? null
        : quickIvOrderedDoseToMl(
            orderedDose: chosenDose == null
                ? double.tryParse(_orderedDose.text.trim()) ?? double.nan
                : (variant.unit == 'mg' && _regimenConfirmed
                    ? guidedMg ?? double.nan : double.nan),
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
              'Dose and IV administration',
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
            Text('Administration method and duration',
                style: theme.textTheme.titleSmall
                    ?.copyWith(fontWeight: FontWeight.w900)),
            const SizedBox(height: 5),
            Text(profile.administration),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: [
                ChoiceChip(
                  key: const ValueKey('iv-mode-dose'),
                  label: const Text('Patient dose → mL'),
                  selected: _mode == 0,
                  onSelected: (_) => setState(() => _mode = 0),
                ),
                ChoiceChip(
                  key: const ValueKey('iv-mode-prep-only'),
                  label: const Text('Dilution only · no dose'),
                  selected: _mode == 1,
                  onSelected: (_) => setState(() => _mode = 1),
                ),
              ],
            ),
            if (_mode == 1) ...[
              const SizedBox(height: 10),
              Text('Preparation without prescribing a dose',
                  style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.w900)),
              const SizedBox(height: 5),
              const Text(
                'For titrated infusions: prepare the verified concentration '
                'first; the actual pump rate and dose are set separately '
                'by the clinician. A diluent is NOT a Y-site clearance.',
              ),
              if (recipes.isNotEmpty) ...[
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  key: const ValueKey('iv-prep-only-recipe-choice'),
                  isExpanded: true,
                  initialValue: _recipeId,
                  decoration: const InputDecoration(
                    labelText: 'Exact manufacturer dilution recipe',
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text('Choose the matching concentrate'),
                  items: [
                    for (final recipe in recipes)
                      DropdownMenuItem(
                        value: recipe.id,
                        child: Text(recipe.label, overflow: TextOverflow.ellipsis),
                      ),
                  ],
                  onChanged: (id) => setState(() => _recipeId = id),
                ),
                if (chosenRecipe != null) ...[
                  const SizedBox(height: 10),
                  Text(
                    'Withdraw ' + _fmt(chosenRecipe.stockVolumeMl) +
                    ' mL = ' + _fmt(chosenRecipe.stockAmountMg) + ' mg',
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'Add ' + _fmt(chosenRecipe.addedDiluentMl) +
                    ' mL compatible fluid → FINAL ' +
                    _fmt(chosenRecipe.finalVolumeMl) + ' mL',
                  ),
                  Text(
                    'Final concentration: ' +
                    _fmt(chosenRecipe.finalMgPerMl) + ' mg/mL',
                    key: const ValueKey('iv-prep-only-concentration'),
                    style: theme.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  Text('Fluid: ' + chosenRecipe.diluent),
                  Text('Critical: ' + chosenRecipe.safety),
                  SelectableText('Manufacturer: ' + chosenRecipe.sourceUrl,
                      style: theme.textTheme.bodySmall),
                ],
              ] else
                const Padding(
                  padding: EdgeInsets.only(top: 7),
                  child: Text(
                    'No structured manufacturer dilution recipe is reviewed '
                    'for this exact product yet. See the verified preparation '
                    'directions below; no arbitrary concentration is calculated.',
                  ),
                ),
              const SizedBox(height: 10),
              Text('Reconstitution: ' + profile.reconstitution),
              const SizedBox(height: 6),
              Text('Further dilution: ' + profile.furtherDilution),
              const SizedBox(height: 6),
              Text('Compatible infusion fluids: ' + profile.allowedDiluents),
              const SizedBox(height: 6),
              Text('Administration: ' + profile.administration),
            ] else ...[
              if (reviewedAdultIvDoseRegimens(
                name: profile.name, population: profile.population,
              ).isNotEmpty) ...[
                const SizedBox(height: 8),
                IvAdultDoseGuidePanel(
                  drugName: profile.name,
                  population: profile.population,
                  selectedId: _selectedDoseRegimen,
                  onChanged: (id) => setState(() {
                    _selectedDoseRegimen = id;
                    _selectedStrength = null;
                    _orderedDose.clear();
                    _vialConfirmed = false;
                    _regimenConfirmed = false;
                    _guidedDoseId = null;
                  }),
                ),
              ],
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 6),
              Text('Patient dose to stock withdrawal volume',
                  style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.w900)),
              const SizedBox(height: 7),
              if (special)
                const Text(
                  'SPECIALIZED PATHWAY: high-alert infusion, salt/base or '
                  'pediatric dose units must use the dedicated calculator. '
                  'This quick stock-withdrawal calculation is locked.',
                )
              else if (variants.isEmpty)
                const Text(
                  'No verified structured stock concentration and unit '
                  'are available. This quick mL calculation is locked.',
                )
              else ...[
                DropdownButtonFormField<int>(
                  key: const ValueKey('iv-quick-vial-choice'),
                  isExpanded: true,
                  initialValue: _selectedStrength,
                  decoration: const InputDecoration(
                    labelText: 'Actual vial / stock',
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text('Select matching source-listed stock'),
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
                    _vialConfirmed = false;
                    _regimenConfirmed = false;
                  }),
                ),
                if (variant != null) ...[
                  const SizedBox(height: 7),
                  Text('Selected concentration: ' +
                      _fmt(variant.concentration) + ' ' +
                      variant.unit + '/mL'),
                  Text(variant.note, style: theme.textTheme.bodySmall),
                  if (selectedPackage != null)
                    SelectableText(
                      'Official package: ' + selectedPackage.packageLabel +
                      '\nManufacturer source: ' + selectedPackage.sourceUrl,
                      style: theme.textTheme.bodySmall,
                    )
                  else
                    Text(
                      'Existing concentration reference — confirm the '
                      'manufacturer and package locally.',
                      style: theme.textTheme.bodySmall,
                    ),
                  if (doseOptions.isNotEmpty && variant.unit == 'mg') ...[
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      key: const ValueKey('iv-guided-indication-dose'),
                      isExpanded: true,
                      initialValue: _guidedDoseId,
                      decoration: const InputDecoration(
                        labelText: 'Indication / labeled dose option',
                        border: OutlineInputBorder(),
                      ),
                      hint: const Text('Manual ordered dose (default)'),
                      items: [
                        const DropdownMenuItem<String>(
                          value: '',
                          child: Text('Enter prescribed dose manually'),
                        ),
                        for (final choice in doseOptions)
                          DropdownMenuItem(
                            value: choice.id,
                            child: Text(choice.label,
                                overflow: TextOverflow.ellipsis),
                          ),
                      ],
                      onChanged: (id) => setState(() {
                        _guidedDoseId = (id == null || id.isEmpty) ? null : id;
                        _regimenConfirmed = false;
                        _vialConfirmed = false;
                        _dosingWeight.clear();
                        _orderedDose.clear();
                      }),
                    ),
                  ],
                  if (chosenDose != null && variant.unit == 'mg') ...[
                    const SizedBox(height: 8),
                    Text('Indication: ' + chosenDose.indication),
                    if (chosenDose.requiresWeight) ...[
                      const SizedBox(height: 8),
                      TextField(
                        key: const ValueKey('iv-guided-weight-kg'),
                        controller: _dosingWeight,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Verified dosing weight (kg)',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (_) => setState(() {
                          _vialConfirmed = false;
                          _regimenConfirmed = false;
                        }),
                      ),
                    ],
                    if (guidedMg != null)
                      Text(
                        'Labeled example for this weight: ' +
                        _fmt(guidedMg) + ' mg',
                        key: const ValueKey('iv-guided-example-mg'),
                      )
                    else
                      const Text('Enter an eligible weight before calculation.'),
                    Text('Preparation: ' + chosenDose.preparation),
                    Text('Safety: ' + chosenDose.safety),
                    SelectableText('Label: ' + chosenDose.sourceUrl,
                        style: theme.textTheme.bodySmall),
                    CheckboxListTile(
                      key: const ValueKey('iv-guided-confirm-order'),
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _regimenConfirmed,
                      onChanged: guidedMg == null
                          ? null
                          : (value) => setState(
                                () => _regimenConfirmed = value ?? false,
                              ),
                      title: const Text(
                        'I verified this example matches the actual '
                        'patient-specific PRESCRIBED order and indication.',
                      ),
                    ),
                  ] else ...[
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
                  ],
                  CheckboxListTile(
                    key: const ValueKey('iv-quick-confirm-vial'),
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    value: _vialConfirmed,
                    onChanged: (value) => setState(
                      () => _vialConfirmed = value ?? false,
                    ),
                    title: const Text(
                      'I matched the actual product, labeled stock '
                      'concentration, dosage form, order and SAME dose units.',
                    ),
                  ),
                  if (volume != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Withdrawal volume (arithmetic only)',
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
                      const Text(
                        'More than one vial is needed. Check single-use '
                        'and discard rules; do not assume one vial suffices.',
                      ),
                    const Text(
                      'STOCK withdrawal only, not final IV preparation '
                      'or permission for direct injection. Check further '
                      'dilution, route and infusion duration.',
                    ),
                  ],
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
