import 'package:flutter/material.dart';

import '../data/iv_norepinephrine_workflow.dart';
import '../domain/iv_infusion_rate_engine.dart';

/// Adult-specific, BASE-equivalent, product-verified norepinephrine panel.
/// A titrated pump rate is NOT a stock-vial withdrawal for every new dose.
class IvNorepinephrineWorkflowPanel extends StatefulWidget {
  const IvNorepinephrineWorkflowPanel({
    super.key,
    required this.onOpenFullCalculator,
  });

  final VoidCallback onOpenFullCalculator;

  @override
  State<IvNorepinephrineWorkflowPanel> createState() =>
      _IvNorepinephrineWorkflowPanelState();
}

class _IvNorepinephrineWorkflowPanelState
    extends State<IvNorepinephrineWorkflowPanel> {
  final _weight = TextEditingController();
  final _rate = TextEditingController();
  String? _productId;
  String _indication = 'septic';
  IvOrderedRateUnit _unit = IvOrderedRateUnit.mcgPerKgMin;
  bool _productConfirmed = false;
  bool _orderConfirmed = false;
  bool _prepOnly = false;

  static String _format(double v) {
    final s = v.toStringAsFixed(4);
    return s.replaceFirst(RegExp(r'0+$'), '')
        .replaceFirst(RegExp(r'\.$'), '');
  }

  @override
  void dispose() {
    _weight.dispose();
    _rate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final product = findReviewedNorepinephrinePresentation(_productId);
    final result = orderedNorepinephrinePumpRate(
      product: product,
      prescribedRate: double.tryParse(_rate.text.trim()),
      rateUnit: _unit,
      weightKg: double.tryParse(_weight.text.trim()),
      productConfirmed: _productConfirmed,
      orderConfirmed: _orderConfirmed,
    );

    return Card(
      key: const ValueKey('iv-norepinephrine-specialized-panel'),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Norepinephrine · adult infusion',
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w900)),
            const SizedBox(height: 6),
            const Text(
              'HIGH ALERT. Continuous IV infusion only. Calculations use '
              'norepinephrine BASE (not bitartrate salt mass). Select the '
              'EXACT available vial or factory premix; do not assume all '
              '4 mg or 8 mg products are equivalent.',
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 7,
              children: [
                ChoiceChip(
                  key: const ValueKey('norepi-dose-mode'),
                  label: const Text('Prescribed dose → mL/hr'),
                  selected: !_prepOnly,
                  onSelected: (_) => setState(() => _prepOnly = false),
                ),
                ChoiceChip(
                  key: const ValueKey('norepi-prep-only-mode'),
                  label: const Text('Dilution only · no dose'),
                  selected: _prepOnly,
                  onSelected: (_) => setState(() => _prepOnly = true),
                ),
              ],
            ),
            if (!_prepOnly) ...[
              const SizedBox(height: 11),
              DropdownButtonFormField<String>(
                key: const ValueKey('norepi-indication-choice'),
                initialValue: _indication,
                isExpanded: true,
                decoration: const InputDecoration(
                  labelText: 'Adult indication / dose reference',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'septic',
                    child: Text('Septic shock · SSC 2026'),
                  ),
                  DropdownMenuItem(
                    value: 'hypotension',
                    child: Text('Severe acute hypotension · US label'),
                  ),
                  DropdownMenuItem(
                    value: 'other',
                    child: Text('Other ordered indication · local protocol'),
                  ),
                ],
                onChanged: (v) => setState(() {
                  _indication = v ?? 'other';
                  _orderConfirmed = false;
                }),
              ),
              const SizedBox(height: 7),
              if (_indication == 'septic') ...[
                const Text(
                  '2026 SSC: norepinephrine is first-line for adult septic '
                  'shock. Initial MAP target 65 mm Hg; in patients aged '
                  '65+ a 60–65 mm Hg initial range may be considered. '
                  'Titrate to response; the guideline does not authorize '
                  'a universal weight-based starting dose.',
                ),
                SelectableText('Guideline: ' + septicShock2026Guideline,
                    style: theme.textTheme.bodySmall),
              ] else if (_indication == 'hypotension') ...[
                const Text(
                  'Cited US concentrate label: initial 8–12 mcg/min; '
                  'typical maintenance 2–4 mcg/min, adjusted to '
                  'hemodynamic response. This is a reference, '
                  'NOT a preselected patient prescription.',
                ),
                SelectableText('US label: ' + norepinephrineConcentrateLabel,
                    style: theme.textTheme.bodySmall),
              ] else
                const Text(
                  'Select a validated local protocol and independent '
                  'prescriber order for the specific clinical condition.',
                ),
            ],
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              key: const ValueKey('norepi-product-choice'),
              initialValue: _productId,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Actual vial or ready-to-use bag',
                border: OutlineInputBorder(),
              ),
              hint: const Text('Select exact BASE-equivalent product'),
              items: [
                for (final p in reviewedAdultNorepinephrinePresentations)
                  DropdownMenuItem(
                    value: p.id,
                    child: Text(p.name, overflow: TextOverflow.ellipsis),
                  ),
              ],
              onChanged: (id) => setState(() {
                _productId = id;
                _productConfirmed = false;
                _orderConfirmed = false;
              }),
            ),
            if (product != null) ...[
              const SizedBox(height: 9),
              Text(
                'Labeled infusion concentration: ' +
                    _format(product.nominalFinalMcgPerMl) + ' mcg/mL BASE' +
                    (product.readyToUse ? ' (READY TO USE)' : ' (NOMINAL)'),
                key: const ValueKey('norepi-selected-concentration'),
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 5),
              if (product.readyToUse)
                const Text(
                  'NO VIAL WITHDRAWAL · NO FURTHER DILUTION.',
                  key: ValueKey('norepi-premix-no-dilution'),
                  style: TextStyle(fontWeight: FontWeight.w800),
                )
              else
                Text(
                  'Withdraw ' + _format(product.stockWithdrawalMl) +
                      ' mL of the exact 4 mg/4 mL concentrate before '
                      'the required dilution.',
                  key: const ValueKey('norepi-concentrate-withdrawal'),
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
              Text(product.preparation),
              const SizedBox(height: 5),
              Text('Safety: ' + product.safety),
              SelectableText('Manufacturer label: ' + product.sourceUrl,
                  style: theme.textTheme.bodySmall),
              CheckboxListTile(
                key: const ValueKey('norepi-confirm-product'),
                value: _productConfirmed,
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text(
                  'I confirmed the actual product, BASE-equivalent '
                  'strength, and prepared/factory concentration.',
                ),
                onChanged: (v) => setState(() {
                  _productConfirmed = v ?? false;
                  _orderConfirmed = false;
                }),
              ),
            ] else
              const Padding(
                padding: EdgeInsets.only(top: 7),
                child: Text(
                  'If the stocked product is not listed, STOP. '
                  'Do not substitute salt mass, fluid or a different '
                  'concentrate. Verify its manufacturer insert.',
                ),
              ),
            if (!_prepOnly) ...[
              const Divider(height: 22),
              const Text(
                'Enter the ALREADY PRESCRIBED rate; no dose is selected '
                'automatically from the indication.',
              ),
              const SizedBox(height: 9),
              DropdownButtonFormField<IvOrderedRateUnit>(
                key: const ValueKey('norepi-rate-unit'),
                initialValue: _unit,
                decoration: const InputDecoration(
                  labelText: 'Prescribed dose unit',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: IvOrderedRateUnit.mcgPerKgMin,
                    child: Text('mcg/kg/min'),
                  ),
                  DropdownMenuItem(
                    value: IvOrderedRateUnit.mcgPerMin,
                    child: Text('mcg/min'),
                  ),
                ],
                onChanged: (v) => setState(() {
                  _unit = v ?? IvOrderedRateUnit.mcgPerKgMin;
                  _orderConfirmed = false;
                }),
              ),
              if (_unit.needsWeight) ...[
                const SizedBox(height: 9),
                TextField(
                  key: const ValueKey('norepi-weight-kg'),
                  controller: _weight,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Verified dosing weight (kg)',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (_) => setState(() => _orderConfirmed = false),
                ),
              ],
              const SizedBox(height: 9),
              TextField(
                key: const ValueKey('norepi-ordered-rate'),
                controller: _rate,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  labelText: 'PRESCRIBED rate (' + _unit.display + ')',
                  border: const OutlineInputBorder(),
                ),
                onChanged: (_) => setState(() => _orderConfirmed = false),
              ),
              CheckboxListTile(
                key: const ValueKey('norepi-confirm-order'),
                value: _orderConfirmed,
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  'I checked the clinician order, indication, '
                  'dosing weight (if needed), rate units and monitoring.',
                ),
                onChanged: product == null || !_productConfirmed
                    ? null
                    : (v) => setState(() => _orderConfirmed = v ?? false),
              ),
              if (result != null) ...[
                Text(
                  _format(result.millilitersPerHour) + ' mL/hr',
                  key: const ValueKey('norepi-pump-result'),
                  style: theme.textTheme.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w900),
                ),
                Text(
                  'Calculated delivery: ' +
                      _format(result.microgramsPerHour / 60) +
                      ' mcg/min norepinephrine BASE.',
                ),
                const Text(
                  'PUMP RATE ONLY. This is not a bolus or a new '
                  'vial-withdrawal instruction. Confirm actual final '
                  'concentration, infusion pump and local protocol.',
                ),
              ],
            ] else ...[
              const SizedBox(height: 9),
              const Text(
                'No patient weight, dose or pump speed is needed '
                'to view the preparation. Use the exact product '
                'instructions above. Titrate infusion separately '
                'using a verified prescription and pump.',
              ),
              if (product != null && !_productConfirmed)
                const Text(
                  'Confirm the product label before preparing or using it.',
                ),
            ],
            const Divider(height: 24),
            const Text(
              'Never IV push norepinephrine concentrate. Assess volume '
              'status, use an appropriate vascular access, monitor '
              'blood pressure and perfusion closely, inspect the site '
              'for extravasation, and avoid abrupt discontinuation.',
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              key: const ValueKey('norepi-full-calculator'),
              onPressed: widget.onOpenFullCalculator,
              icon: const Icon(Icons.calculate_outlined),
              label: const Text('Advanced product / infusion calculator'),
            ),
          ],
        ),
      ),
    );
  }
}
