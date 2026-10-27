import 'package:flutter/material.dart';

import '../data/iv_unified_infusion_library.dart';
import '../domain/iv_infusion_rate_engine.dart';
import '../domain/iv_unified_infusion_engine.dart';

/// One workflow for adult continuous infusions. An existing prescription and
/// validated final preparation are prerequisites; no empirical dose selection.
class IvUnifiedInfusionScreen extends StatefulWidget {
  const IvUnifiedInfusionScreen({super.key, this.initialDrug});

  final String? initialDrug;

  @override
  State<IvUnifiedInfusionScreen> createState() =>
      _IvUnifiedInfusionScreenState();
}

class _IvUnifiedInfusionScreenState extends State<IvUnifiedInfusionScreen> {
  final _weight = TextEditingController();
  final _rate = TextEditingController();
  final _activeMg = TextEditingController();
  final _finalMl = TextEditingController();
  final _protocolReference = TextEditingController();

  late String _drug;
  String? _preparationId;
  late IvOrderedRateUnit _rateUnit;
  bool _localMode = false;
  bool _localProtocolConfirmed = false;
  bool _productConfirmed = false;
  bool _orderConfirmed = false;
  bool _norepiVialConfirmed = false;
  bool _norepiVolumeIsAdded = false;

  @override
  void initState() {
    super.initState();
    _drug = ivUnifiedInfusionDrugNames.contains(widget.initialDrug)
        ? widget.initialDrug! : 'Norepinephrine';
    _rateUnit = ivApprovedOrderUnits(_drug).first;
  }

  @override
  void dispose() {
    for (final c in [
      _weight, _rate, _activeMg, _finalMl, _protocolReference,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  void _invalidate() {
    _productConfirmed = false;
    _orderConfirmed = false;
    _localProtocolConfirmed = false;
  }

  void _changeDrug(String newDrug) {
    setState(() {
      _drug = newDrug;
      _preparationId = null;
      _rateUnit = ivApprovedOrderUnits(newDrug).first;
      _localMode = false;
      _norepiVolumeIsAdded = false;
      _norepiVialConfirmed = false;
      _weight.clear();
      _rate.clear();
      _activeMg.clear();
      _finalMl.clear();
      _protocolReference.clear();
      _invalidate();
    });
  }

  static String _fmt(double v) {
    if (v > 0 && v < 0.0001) return v.toStringAsExponential(3);
    final t = v.toStringAsFixed(4);
    return t.replaceFirst(RegExp(r'0+$'), '')
        .replaceFirst(RegExp(r'\.$'), '');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final options = ivUnifiedPreparationsFor(_drug);
    IvInfusionPreparation? chosen;
    for (final p in options) {
      if (p.id == _preparationId) chosen = p;
    }
    final isNorepinephrine = _drug == 'Norepinephrine';
    final activeMg = double.tryParse(_activeMg.text.trim());
    final enteredVolumeMl = double.tryParse(_finalMl.text.trim());
    final norepiWithdrawalMl = isNorepinephrine
        ? norepinephrineReviewedStockWithdrawalMl(
            totalNorepinephrineBaseMg: activeMg ?? double.nan,
            matchingVialVerified: _norepiVialConfirmed,
          )
        : null;
    final localFinalMl = isNorepinephrine && _norepiVolumeIsAdded
        ? (enteredVolumeMl != null && norepiWithdrawalMl != null &&
                enteredVolumeMl.isFinite && enteredVolumeMl > 0
            ? enteredVolumeMl + norepiWithdrawalMl : null)
        : enteredVolumeMl;
    final volumeIsPhysicallyValid = !isNorepinephrine ||
        (norepiWithdrawalMl != null &&
            localFinalMl != null && localFinalMl.isFinite &&
            localFinalMl > norepiWithdrawalMl);
    final localConcentration = _localMode && volumeIsPhysicallyValid
        ? verifiedLocalFinalMcgPerMl(
            totalActiveMg: activeMg ?? double.nan,
            actualFinalVolumeMl: localFinalMl ?? double.nan,
            protocolVerified: _localProtocolConfirmed &&
                _protocolReference.text.trim().isNotEmpty,
          )
        : null;
    final result = calculateVerifiedIvPump(
      drug: _drug,
      reviewedPreparation: _localMode ? null : chosen,
      localTotalActiveMg: double.tryParse(_activeMg.text.trim()),
      localFinalVolumeMl: localFinalMl,
      localProtocolConfirmed: _localProtocolConfirmed &&
          _protocolReference.text.trim().isNotEmpty,
      orderedUnit: _rateUnit,
      orderedRate: double.tryParse(_rate.text.trim()) ?? double.nan,
      dosingWeightKg: double.tryParse(_weight.text.trim()),
      checkedProductAndProtocol: _productConfirmed &&
          (_localMode
              ? _protocolReference.text.trim().isNotEmpty &&
                  localConcentration != null
              : chosen != null),
      checkedClinicianOrder: _orderConfirmed,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('IV Infusion · Dose + Dilution')),
      body: ListView(
        key: const ValueKey('unified-infusion-screen'),
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 36),
        children: [
          Text('Vial → dilution → dose → mL/hr',
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.w900)),
          const SizedBox(height: 6),
          const Text(
            'Adult IV infusion: choose the ACTUAL preparation, then enter '
            'the ordered dose. For concentrated vials, stock strength '
            'is NOT the same as the final pump concentration.',
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            key: const ValueKey('unified-drug'),
            initialValue: _drug,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: '1 · IV medicine',
            ),
            items: [
              for (final drug in ivUnifiedInfusionDrugNames)
                DropdownMenuItem(value: drug, child: Text(drug)),
            ],
            onChanged: (v) {
              if (v != null) _changeDrug(v);
            },
          ),
          if (isNorepinephrine &&
              (_localMode || chosen == null || !chosen.readyToUse)) ...[
            const SizedBox(height: 10),
            Card(
              key: const ValueKey('norepi-stock-one-mg-ml'),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Vial / stock concentration',
                        style: theme.textTheme.labelLarge),
                    Text(
                      '1 mg / 1 mL',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Text(
                      'Norepinephrine BASE · 4 mg / 4 mL concentrate. '
                      'MATCH THE VIAL LABEL. Dilute before IV infusion.',
                    ),
                    const Text(
                      'Stock 1 mg/mL ≠ final infusion strength.',
                    ),
                  ],
                ),
              ),
            ),
          ],
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 7,
            children: [
              ChoiceChip(
                key: const ValueKey('unified-source-mode'),
                label: const Text('Labeled dilution / premix'),
                selected: !_localMode,
                onSelected: (_) => setState(() {
                  _localMode = false;
                  _norepiVialConfirmed = false;
                  _invalidate();
                }),
              ),
              ChoiceChip(
                key: const ValueKey('unified-local-mode'),
                label: const Text('Hospital dilution'),
                selected: _localMode,
                onSelected: (_) => setState(() {
                  _localMode = true;
                  _norepiVialConfirmed = false;
                  _invalidate();
                }),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (!_localMode) ...[
            DropdownButtonFormField<String>(
              key: ValueKey('unified-preparation-$_drug'),
              initialValue: _preparationId,
              isExpanded: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '2 · Dilution or ready-made infusion',
              ),
              hint: const Text('Choose the exact listed preparation'),
              items: [
                for (final prep in options)
                  DropdownMenuItem(
                    value: prep.id,
                    child: Text(prep.label, overflow: TextOverflow.ellipsis),
                  ),
              ],
              onChanged: (id) => setState(() {
                _preparationId = id;
                _invalidate();
              }),
            ),
            if (chosen != null) ...[
              const SizedBox(height: 7),
              Text(
                'FINAL concentration: ${_fmt(chosen.nominalMcgPerMl)} mcg/mL'
                '${chosen.isManufacturerNominal ? ' (manufacturer nominal)' : ''}',
                key: const ValueKey('unified-final-concentration'),
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w800),
              ),
              if (chosen.readyToUse)
                const Text('READY TO USE · do NOT dilute further.')
              else if (isNorepinephrine)
                const Text('4 mg / 4 mL stock at 1 mg/mL MUST be diluted.'),
              ExpansionTile(
                key: const ValueKey('unified-preparation-details-toggle'),
                title: const Text('How to prepare · safety · source'),
                initiallyExpanded: false,
                childrenPadding: const EdgeInsets.fromLTRB(8, 4, 8, 12),
                children: [
                  Text(chosen.instructions),
                  const SizedBox(height: 5),
                  Text('Safety: ${chosen.safety}'),
                  SelectableText('Source: ${chosen.sourceUrl}',
                      style: theme.textTheme.bodySmall),
                ],
              ),
            ],
          ] else ...[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Only use a VERIFIED hospital dilution. '
                      'This calculator does not approve the fluid, '
                      'strength, stability or administration route.',
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      key: const ValueKey('unified-protocol-reference'),
                      controller: _protocolReference,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Verified product + hospital protocol ID',
                        hintText: 'Required (not a patient identifier)',
                      ),
                      onChanged: (_) => setState(_invalidate),
                    ),
                    if (isNorepinephrine) ...[
                      const SizedBox(height: 8),
                      CheckboxListTile(
                        key: const ValueKey('norepi-confirm-one-mg-stock'),
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        value: _norepiVialConfirmed,
                        title: const Text(
                          'My actual concentrate is norepinephrine BASE '
                          '1 mg/mL (4 mg / 4 mL).',
                        ),
                        onChanged: (value) => setState(() {
                          _invalidate();
                          _norepiVialConfirmed = value ?? false;
                        }),
                      ),
                    ],
                    const SizedBox(height: 10),
                    TextField(
                      key: const ValueKey('unified-total-active-mg'),
                      controller: _activeMg,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: isNorepinephrine
                            ? 'Norepinephrine BASE amount for bag (mg)'
                            : 'Active $_drug amount in FINAL bag (mg)',
                        helperText: _drug == 'Norepinephrine'
                            ? 'Norepinephrine BASE mg; NEVER salt mg.'
                            : 'Active ingredient mg; not vial strength or mEq.',
                      ),
                      onChanged: (_) => setState(_invalidate),
                    ),
                    if (isNorepinephrine) ...[
                      if (norepiWithdrawalMl != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          'Withdraw ${_fmt(norepiWithdrawalMl)} mL '
                          'from 1 mg/mL vial stock',
                          key: const ValueKey('norepi-vial-withdrawal-ml'),
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        if (activeMg != null &&
                            activeMg > reviewedNorepinephrineVialBaseMg)
                          const Text(
                            'More than one 4 mg/4 mL single-dose vial '
                            'is required. Verify the order and discard rules.',
                          ),
                        const Text(
                          'Stock volume calculation only: final dilution '
                          'must match your validated hospital protocol.',
                        ),
                      ],
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 7,
                        children: [
                          ChoiceChip(
                            key: const ValueKey('norepi-final-volume-choice'),
                            label: const Text('Final bag volume'),
                            selected: !_norepiVolumeIsAdded,
                            onSelected: (_) => setState(() {
                              _norepiVolumeIsAdded = false;
                              _invalidate();
                            }),
                          ),
                          ChoiceChip(
                            key: const ValueKey('norepi-added-fluid-choice'),
                            label: const Text('Fluid added'),
                            selected: _norepiVolumeIsAdded,
                            onSelected: (_) => setState(() {
                              _norepiVolumeIsAdded = true;
                              _finalMl.clear();
                              _invalidate();
                            }),
                          ),
                        ],
                      ),
                    ],
                    const SizedBox(height: 10),
                    TextField(
                      key: const ValueKey('unified-actual-final-ml'),
                      controller: _finalMl,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: isNorepinephrine && _norepiVolumeIsAdded
                            ? 'Precisely measured compatible fluid ADDED (mL)'
                            : 'ACTUAL FINAL solution volume (mL)',
                        helperText: isNorepinephrine
                            ? (_norepiVolumeIsAdded
                                ? 'Final volume = added fluid + withdrawn drug.'
                                : 'Final volume includes drug + fluid, NOT just bag label.')
                            : 'Final volume includes drug, not just fluid.',
                      ),
                      onChanged: (_) => setState(_invalidate),
                    ),
                    if (isNorepinephrine &&
                        norepiWithdrawalMl != null &&
                        localFinalMl != null &&
                        volumeIsPhysicallyValid) ...[
                      const SizedBox(height: 7),
                      Text(
                        'Actual final volume: ${_fmt(localFinalMl)} mL',
                        key: const ValueKey('norepi-local-final-volume'),
                      ),
                      if (!_norepiVolumeIsAdded)
                        Text(
                          'Calculated fluid volume: '
                          '${_fmt(localFinalMl - norepiWithdrawalMl)} mL '
                          '(arithmetic only; NOT a preparation order).',
                        ),
                    ],
                    if (isNorepinephrine &&
                        norepiWithdrawalMl != null &&
                        localFinalMl != null &&
                        !volumeIsPhysicallyValid)
                      const Text(
                        'Final bag volume must exceed stock withdrawal '
                        'volume. No calculation available.',
                        key: ValueKey('norepi-invalid-final-volume'),
                      ),
                    const SizedBox(height: 9),
                    CheckboxListTile(
                      key: const ValueKey('unified-local-protocol-confirm'),
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _localProtocolConfirmed,
                      title: const Text(
                        'I independently checked this exact medicine, '
                        'brand, final concentration, diluent and stability '
                        'against a valid institutional preparation protocol.',
                      ),
                      onChanged: (v) => setState(() {
                        _localProtocolConfirmed = v ?? false;
                        _productConfirmed = false;
                        _orderConfirmed = false;
                      }),
                    ),
                    if (localConcentration != null)
                      Text(
                        'Calculated ACTUAL final concentration: '
                        '${_fmt(localConcentration)} mcg/mL',
                        key: const ValueKey('unified-local-concentration'),
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w900),
                      ),
                  ],
                ),
              ),
            ),
          ],
          const SizedBox(height: 12),
          CheckboxListTile(
            key: const ValueKey('unified-confirm-concentration'),
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
            value: _productConfirmed,
            title: const Text(
              'Verified prepared bag, concentration and dose units.',
            ),
            onChanged: (_localMode
                    ? localConcentration != null
                    : chosen != null)
                ? (v) => setState(() {
                    _productConfirmed = v ?? false;
                    _orderConfirmed = false;
                  })
                : null,
          ),
          const Divider(height: 22),
          Text('3 · Enter prescribed infusion dose',
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          DropdownButtonFormField<IvOrderedRateUnit>(
            key: ValueKey('unified-ordered-unit-$_drug'),
            initialValue: _rateUnit,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Prescribed dose unit',
            ),
            items: [
              for (final unit in ivApprovedOrderUnits(_drug))
                DropdownMenuItem(value: unit, child: Text(unit.display)),
            ],
            onChanged: (unit) => setState(() {
              if (unit != null) _rateUnit = unit;
              _orderConfirmed = false;
            }),
          ),
          if (_rateUnit.needsWeight) ...[
            const SizedBox(height: 9),
            TextField(
              key: const ValueKey('unified-patient-weight'),
              controller: _weight,
              keyboardType: const TextInputType.numberWithOptions(
                  decimal: true),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Dosing weight (kg)',
              ),
              onChanged: (_) => setState(() => _orderConfirmed = false),
            ),
          ],
          const SizedBox(height: 9),
          TextField(
            key: const ValueKey('unified-prescribed-rate'),
            controller: _rate,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'ALREADY prescribed rate (${_rateUnit.display})',
            ),
            onChanged: (_) => setState(() => _orderConfirmed = false),
          ),
          CheckboxListTile(
            key: const ValueKey('unified-confirm-order'),
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
            value: _orderConfirmed,
            title: const Text(
              'I verified the clinical order, indication, weight '
              '(if needed), dose units and appropriate monitoring.',
            ),
            onChanged: _productConfirmed
                ? (v) => setState(() => _orderConfirmed = v ?? false)
                : null,
          ),
          if (result != null) ...[
            Card(
              key: const ValueKey('unified-pump-card'),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text('Calculated IV pump rate'),
                    Text(
                      '${_fmt(result.pumpMlPerHour)} mL/hr',
                      key: const ValueKey('unified-pump-result'),
                      style: theme.textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w900),
                    ),
                    Text(
                      'Concentration: '
                      '${_fmt(result.finalMicrogramsPerMl)} mcg/mL'
                      '${result.nominalConcentration ? ' (NOMINAL)' : ''}',
                    ),
                    Text(
                      'Ordered delivery: '
                      '${_fmt(result.deliveryMicrogramsPerHour)} mcg/hr',
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Calculation ONLY, not a prescribing recommendation '
                      'or authorization to compound. Double-check actual '
                      'prepared bag, pump drug library, monitoring, '
                      'infusion access and hospital policy.',
                    ),
                  ],
                ),
              ),
            ),
          ] else
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Rate appears only after selecting/validating final '
                'concentration, entering a valid prescribed dose and '
                'completing both independent checks.',
              ),
            ),
        ],
      ),
    );
  }
}
