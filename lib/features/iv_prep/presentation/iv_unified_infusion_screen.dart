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
    final localConcentration = _localMode
        ? verifiedLocalFinalMcgPerMl(
            totalActiveMg: double.tryParse(_activeMg.text.trim()) ??
                double.nan,
            actualFinalVolumeMl: double.tryParse(_finalMl.text.trim()) ??
                double.nan,
            protocolVerified: _localProtocolConfirmed &&
                _protocolReference.text.trim().isNotEmpty,
          )
        : null;
    final result = calculateVerifiedIvPump(
      drug: _drug,
      reviewedPreparation: _localMode ? null : chosen,
      localTotalActiveMg: double.tryParse(_activeMg.text.trim()),
      localFinalVolumeMl: double.tryParse(_finalMl.text.trim()),
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
          Text('Weight + ordered dose + final dilution → mL/hr',
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.w900)),
          const SizedBox(height: 6),
          const Text(
            'Adult continuous infusions ONLY. This tool converts an '
            'independently prescribed dose using a VERIFIED final '
            'concentration. It does not recommend a dose, decide a '
            'diluent, approve a local preparation, or authorize an IV push.',
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
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 7,
            children: [
              ChoiceChip(
                key: const ValueKey('unified-source-mode'),
                label: const Text('Reviewed preparation'),
                selected: !_localMode,
                onSelected: (_) => setState(() {
                  _localMode = false;
                  _invalidate();
                }),
              ),
              ChoiceChip(
                key: const ValueKey('unified-local-mode'),
                label: const Text('Verified local dilution'),
                selected: _localMode,
                onSelected: (_) => setState(() {
                  _localMode = true;
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
                labelText: '2 · Actual prepared bag / strength',
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
              Text(chosen.instructions),
              if (chosen.readyToUse)
                const Text('READY TO USE · do NOT dilute further.'),
              const SizedBox(height: 5),
              Text('Safety: ${chosen.safety}'),
              SelectableText('Source: ${chosen.sourceUrl}',
                  style: theme.textTheme.bodySmall),
            ],
          ] else ...[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'LOCAL-PROTOCOL ARITHMETIC ONLY. This does NOT tell '
                      'you how to prepare a bag, whether a diluent is '
                      'compatible, or whether a selected concentration '
                      'is safe for this medicine/patient. Verify the '
                      'institution-approved protocol FIRST.',
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
                    const SizedBox(height: 10),
                    TextField(
                      key: const ValueKey('unified-total-active-mg'),
                      controller: _activeMg,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Active $_drug amount in FINAL bag (mg)',
                        helperText: _drug == 'Norepinephrine'
                            ? 'Norepinephrine BASE mg; NEVER salt mg.'
                            : 'Active ingredient mg; not vial strength or mEq.',
                      ),
                      onChanged: (_) => setState(_invalidate),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      key: const ValueKey('unified-actual-final-ml'),
                      controller: _finalMl,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'ACTUAL FINAL solution volume (mL)',
                        helperText:
                            'Not the amount of diluent added; include drug volume.',
                      ),
                      onChanged: (_) => setState(_invalidate),
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
              'I checked the exact prepared container label, correct '
              'drug/unit and ACTUAL final concentration.',
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
          Text('3 · Enter already ORDERED infusion dose',
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
