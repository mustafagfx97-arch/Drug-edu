import 'package:flutter/material.dart';

import '../data/iv_quick_drip_profiles.dart';
import '../data/iv_unified_infusion_library.dart';
import '../domain/iv_dilution_safety_engine.dart';
import '../domain/iv_infusion_rate_engine.dart';
import 'iv_unified_infusion_screen.dart';

/// Default bedside UI: stock → weight → titrated ORDER → added fluid → pump.
/// This is an arithmetic aide; source dose references are not new orders.
class IvQuickDripScreen extends StatefulWidget {
  const IvQuickDripScreen({super.key, this.initialDrug});
  final String? initialDrug;

  @override
  State<IvQuickDripScreen> createState() => _IvQuickDripScreenState();
}

class _IvQuickDripScreenState extends State<IvQuickDripScreen> {
  late String _drug;
  late String _optionId;
  late double? _dose;
  late IvDiluent _fluid;
  late double _addedMl;
  final _weightCtrl = TextEditingController();
  final _doseCtrl = TextEditingController();
  final _fluidCtrl = TextEditingController();
  IvLineType _line = IvLineType.peripheral;
  bool _lightShield = false;
  bool _lowSorption = false;

  IvQuickDripProfile get _option =>
      quickDripOptionsFor(_drug).firstWhere((v) => v.id == _optionId);

  @override
  void initState() {
    super.initState();
    _drug = ivUnifiedInfusionDrugNames.contains(widget.initialDrug)
        ? widget.initialDrug! : 'Norepinephrine';
    _resetOption(quickDripOptionsFor(_drug).first);
  }

  void _resetOption(IvQuickDripProfile p) {
    _optionId = p.id;
    _dose = p.initialReference;
    _doseCtrl.text = _dose == null ? '' : _fmt(_dose!);
    _fluid = p.fluid;
    _addedMl = p.defaultAddedFluidMl;
    _fluidCtrl.text = _fmt(_addedMl);
    _line = IvLineType.peripheral;
    _lightShield = false;
    _lowSorption = false;
  }

  void _switchDrug(String next) {
    setState(() {
      _drug = next;
      _resetOption(quickDripOptionsFor(next).first);
    });
  }

  @override
  void dispose() {
    _weightCtrl.dispose();
    _doseCtrl.dispose();
    _fluidCtrl.dispose();
    super.dispose();
  }

  static String _fmt(double n) {
    if (!n.isFinite) return '—';
    return n.toStringAsFixed(3).replaceFirst(RegExp(r'0+$'), '')
        .replaceFirst(RegExp(r'\\.$'), '');
  }

  void _adjustDose(int sign) {
    final p = _option;
    final current = double.tryParse(_doseCtrl.text) ?? 0;
    final next = current + sign * p.step;
    if (next <= 0 || (p.maxReference != null && next > p.maxReference!)) {
      return;
    }
    setState(() {
      _dose = double.parse(next.toStringAsFixed(4));
      _doseCtrl.text = _fmt(_dose!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final p = _option;
    final weight = double.tryParse(_weightCtrl.text);
    final dose = double.tryParse(_doseCtrl.text);
    final fluidAdded = double.tryParse(_fluidCtrl.text);
    final ready = p.premix;
    final finalMl = ready
        ? p.finalMl(0)
        : fluidAdded != null && fluidAdded.isFinite &&
                fluidAdded > 0 && p.stockMl.isFinite
            ? p.stockMl + fluidAdded
            : null;
    final validMixture = ready ||
        (finalMl != null && finalMl.isFinite && finalMl > p.stockMl);
    final concentration = validMixture
        ? p.finalMcgMl(fluidAdded ?? 0)
        : null;

    final check = ready
        ? const IvDilutionAssessment(
            IvDilutionLight.green,
            'Factory ready-to-use product; do NOT add fluid.',
            'Verify the exact manufacturer bag strength and infusion set.',
          )
        : assessAdultIvDilution(
            drug: _drug,
            drugMg: p.totalDrugMg,
            actualFinalMl: validMixture ? finalMl : fluidAdded == null ? null : 0,
            fluid: _fluid,
            line: _line,
            productAndProtocolVerified: true, // matched source-listed vial
            lightProtectionVerified: _lightShield,
            lowSorptionSetVerified: _lowSorption,
          );
    final doseValid = dose != null && dose.isFinite && dose > 0 &&
        (p.maxReference == null || dose <= p.maxReference!);
    final weightValid = !p.doseUnit.needsWeight ||
        (weight != null && weight.isFinite && weight > 0);
    final rate = doseValid && weightValid &&
            validMixture && !check.blocked && concentration != null
        ? calculateOrderedIvInfusion(
            prescribedRate: dose,
            rateUnit: p.doseUnit,
            finalMicrogramsPerMilliliter: concentration,
            weightKg: weight,
          )
        : null;

    final (statusColor, statusIcon, statusTitle) = switch (check.light) {
      IvDilutionLight.green =>
        (Colors.green.shade700, Icons.check_circle_outline, 'GREEN · Reviewed dilution'),
      IvDilutionLight.yellow =>
        (Colors.amber.shade800, Icons.warning_amber_outlined, 'YELLOW · Check dilution'),
      IvDilutionLight.red =>
        (Colors.red.shade700, Icons.cancel_outlined, 'RED · Stop'),
    };
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick IV Drip'),
        actions: [
          TextButton(
            key: const ValueKey('quick-drip-advanced'),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => IvUnifiedInfusionScreen(initialDrug: _drug),
              ),
            ),
            child: const Text('Advanced'),
          ),
        ],
      ),
      body: ListView(
        key: const ValueKey('quick-drip-screen'),
        padding: const EdgeInsets.fromLTRB(14, 10, 14, 32),
        children: [
          DropdownButtonFormField<String>(
            key: const ValueKey('quick-drip-drug'),
            isExpanded: true,
            initialValue: _drug,
            decoration: const InputDecoration(
              labelText: 'Medicine',
              border: OutlineInputBorder(),
              isDense: true,
            ),
            items: [
              for (final name in ivUnifiedInfusionDrugNames)
                DropdownMenuItem(value: name, child: Text(name)),
            ],
            onChanged: (v) {
              if (v != null) _switchDrug(v);
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            key: ValueKey('quick-drip-stock-$_drug'),
            isExpanded: true,
            initialValue: _optionId,
            decoration: const InputDecoration(
              labelText: 'Vial / available strength',
              border: OutlineInputBorder(),
              isDense: true,
            ),
            items: [
              for (final option in quickDripOptionsFor(_drug))
                DropdownMenuItem(
                  value: option.id,
                  child: Text(option.stockLabel,
                      overflow: TextOverflow.ellipsis),
                ),
            ],
            onChanged: (id) {
              if (id == null) return;
              setState(() => _resetOption(
                  quickDripOptionsFor(_drug).firstWhere((v) => v.id == id)));
            },
          ),
          const SizedBox(height: 14),
          if (p.doseUnit.needsWeight)
            TextField(
              key: const ValueKey('quick-drip-weight'),
              controller: _weightCtrl,
              keyboardType: const TextInputType.numberWithOptions(
                  decimal: true),
              decoration: const InputDecoration(
                labelText: 'Patient dosing weight (kg)',
                border: OutlineInputBorder(),
                isDense: true,
              ),
              onChanged: (_) => setState(() {}),
            ),
          if (p.doseUnit.needsWeight) const SizedBox(height: 14),
          Text('Infusion dose · ${p.doseUnit.display}',
              style: theme.textTheme.labelLarge),
          const SizedBox(height: 5),
          Row(
            children: [
              IconButton.filledTonal(
                key: const ValueKey('quick-drip-minus'),
                onPressed: dose == null || dose <= p.step
                    ? null : () => _adjustDose(-1),
                icon: const Icon(Icons.remove),
                tooltip: 'Reduce dose increment',
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  key: const ValueKey('quick-drip-dose'),
                  controller: _doseCtrl,
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true),
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    hintText: 'Ordered dose',
                  ),
                  onChanged: (_) => setState(() {}),
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filled(
                key: const ValueKey('quick-drip-plus'),
                onPressed: dose != null && p.maxReference != null &&
                        dose + p.step > p.maxReference!
                    ? null : () => _adjustDose(1),
                icon: const Icon(Icons.add),
                tooltip: 'Increase dose increment',
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            p.initialReference != null
                ? 'Lowest reviewed reference: ${_fmt(p.initialReference!)} '
                  '· +/− ${_fmt(p.step)} per tap · prescriber order required'
                : 'No universal starting dose · enter prescribed dose; '
                  '+/− is arithmetic only.',
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 14),
          if (!ready) ...[
            Row(
              children: [
                Expanded(
                  child: TextField(
                    key: const ValueKey('quick-drip-fluid-ml'),
                    controller: _fluidCtrl,
                    keyboardType: const TextInputType.numberWithOptions(
                        decimal: true),
                    decoration: const InputDecoration(
                      isDense: true,
                      labelText: 'Fluid to ADD (mL)',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (v) => setState(() {
                      _addedMl = double.tryParse(v) ?? double.nan;
                    }),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<IvDiluent>(
                    key: const ValueKey('quick-drip-fluid-type'),
                    initialValue: _fluid,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      isDense: true,
                      labelText: 'Fluid',
                      border: OutlineInputBorder(),
                    ),
                    items: [
                      for (final fluid in IvDiluent.values)
                        DropdownMenuItem(
                          value: fluid,
                          child: Text(fluid == IvDiluent.normalSaline
                              ? 'NS 0.9%'
                              : fluid == IvDiluent.d5w
                                  ? 'D5W'
                                  : fluid.label,
                              overflow: TextOverflow.ellipsis),
                        ),
                    ],
                    onChanged: (v) {
                      if (v != null) setState(() => _fluid = v);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              'Drug stock ${_fmt(p.stockMl)} mL + '
              'fluid ${fluidAdded == null ? "—" : _fmt(fluidAdded)} mL '
              '= FINAL ${finalMl == null ? "—" : _fmt(finalMl)} mL',
              key: const ValueKey('quick-drip-final-volume'),
              style: theme.textTheme.bodySmall,
            ),
          ] else
            const Text('READY-TO-USE · No fluid added',
                key: ValueKey('quick-drip-ready-no-diluent')),
          if (_drug == 'Amiodarone') ...[
            const SizedBox(height: 8),
            SegmentedButton<IvLineType>(
              segments: const [
                ButtonSegment(value: IvLineType.peripheral,
                    label: Text('Peripheral')),
                ButtonSegment(value: IvLineType.central,
                    label: Text('Central')),
              ],
              selected: {_line},
              onSelectionChanged: (v) => setState(() => _line = v.first),
            ),
          ],
          if (_drug == 'Nitroglycerin')
            CheckboxListTile(
              key: const ValueKey('quick-drip-tubing'),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text('Non-PVC / low-sorption line checked'),
              value: _lowSorption,
              onChanged: (v) => setState(() => _lowSorption = v ?? false),
            ),
          if (_drug == 'Sodium nitroprusside')
            CheckboxListTile(
              key: const ValueKey('quick-drip-shield'),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text('Light-protected bag checked'),
              value: _lightShield,
              onChanged: (v) => setState(() => _lightShield = v ?? false),
            ),
          const SizedBox(height: 12),
          Container(
            key: const ValueKey('quick-drip-traffic-light'),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: statusColor, width: 1.4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Icon(statusIcon, color: statusColor),
                  const SizedBox(width: 7),
                  Expanded(child: Text(statusTitle,
                    key: const ValueKey('quick-drip-status'),
                    style: TextStyle(
                      fontWeight: FontWeight.w800, color: statusColor))),
                ]),
                const SizedBox(height: 5),
                Text(check.reason,
                    key: const ValueKey('quick-drip-reason'),
                    maxLines: 3, overflow: TextOverflow.ellipsis),
                if (check.light != IvDilutionLight.green)
                  Text(check.action,
                      maxLines: 3, overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            key: const ValueKey('quick-drip-rate-card'),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              children: [
                const Text('PUMP RATE'),
                Text(
                  rate == null ? '— mL/hr' :
                      '${_fmt(rate.millilitersPerHour)} mL/hr',
                  key: const ValueKey('quick-drip-rate'),
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: check.blocked ? theme.colorScheme.error : null,
                  ),
                ),
                Text(
                  concentration == null || !concentration.isFinite
                      ? 'Select a valid dilution'
                      : 'Final: ${_fmt(concentration)} mcg/mL',
                  style: theme.textTheme.bodySmall,
                ),
                if (check.light == IvDilutionLight.yellow)
                  const Text('Arithmetic ONLY · Dilution not cleared',
                      textAlign: TextAlign.center),
                if (check.blocked)
                  const Text('STOP · Rate intentionally hidden',
                      textAlign: TextAlign.center),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Adult reference only. +/− shows calculated rate changes; '
            'it does NOT authorize dose titration. Verify actual vial, '
            'clinical order, patient monitoring and pump.',
            style: TextStyle(fontSize: 12),
          ),
          ExpansionTile(
            title: const Text('Why this dose / preparation?'),
            childrenPadding: const EdgeInsets.all(10),
            children: [
              Text(p.note),
              const SizedBox(height: 5),
              SelectableText(p.sourceUrl,
                  style: theme.textTheme.bodySmall),
              const SizedBox(height: 4),
              const Text(
                'Yellow means further verification is required. '
                'Green verifies only the specific checked preparation rule, '
                'not the patient indication, Y-site, stability or route.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
