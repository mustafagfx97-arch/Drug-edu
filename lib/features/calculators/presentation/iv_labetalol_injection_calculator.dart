import 'package:flutter/material.dart';

import '../domain/iv_labetalol_route_engine.dart';

/// Separate adult slow-IV injection path. NEVER uses the infusion-bag fields.
class IvLabetalolInjectionCalculator extends StatefulWidget {
  const IvLabetalolInjectionCalculator({
    super.key,
    required this.stage,
  });

  final LabetalolInjectionStage stage;

  @override
  State<IvLabetalolInjectionCalculator> createState() =>
      _IvLabetalolInjectionCalculatorState();
}

class _IvLabetalolInjectionCalculatorState
    extends State<IvLabetalolInjectionCalculator> {
  final vialMg = TextEditingController(text: '100');
  final vialMl = TextEditingController(text: '20');
  final orderedDose = TextEditingController();
  final previouslyGiven = TextEditingController(text: '0');
  bool verified = false;

  @override
  void dispose() {
    for (final c in [vialMg, vialMl, orderedDose, previouslyGiven]) {
      c.dispose();
    }
    super.dispose();
  }

  void invalidate() => setState(() => verified = false);

  @override
  Widget build(BuildContext context) {
    final initial = widget.stage == LabetalolInjectionStage.initial;
    final a = double.tryParse(vialMg.text.trim());
    final v = double.tryParse(vialMl.text.trim());
    final d = double.tryParse(orderedDose.text.trim());
    final prior = double.tryParse(previouslyGiven.text.trim());
    final result = verified && a != null && v != null && d != null &&
            prior != null
        ? calculateOrderedLabetalolInjection(
            vialAmountMg: a,
            vialVolumeMl: v,
            prescribedDoseMg: d,
            previousCumulativeMg: prior,
            stage: widget.stage,
          )
        : null;
    return Card(
      key: const ValueKey('labetalol-injection-calculator'),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Slow IV Injection: Ordered Dose Calculator',
                style: Theme.of(context).textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w900)),
            const SizedBox(height: 7),
            Text(initial
                ? 'Manufacturer initial injection: 20 mg slowly over '
                  '2 minutes. Enter ONLY the clinician-ordered 20 mg.'
                : 'Subsequent ordered injections: 40 OR 80 mg '
                  'at minimum 10-minute intervals. Sum of repeated '
                  'injections must not exceed 300 mg.'),
            const SizedBox(height: 10),
            _Number(
              key: const ValueKey('labetalol-bolus-vial-mg'),
              label: 'Actual vial amount (mg)',
              controller: vialMg,
              changed: invalidate,
            ),
            _Number(
              key: const ValueKey('labetalol-bolus-vial-ml'),
              label: 'Actual vial volume (mL)',
              controller: vialMl,
              changed: invalidate,
            ),
            _Number(
              key: const ValueKey('labetalol-bolus-ordered-mg'),
              label: 'Already ORDERED injection dose (mg)',
              controller: orderedDose,
              changed: invalidate,
            ),
            _Number(
              key: const ValueKey('labetalol-bolus-prior-mg'),
              label: 'Previous cumulative IV injection dose (mg)',
              controller: previouslyGiven,
              changed: invalidate,
            ),
            CheckboxListTile(
              key: const ValueKey('labetalol-injection-verify'),
              value: verified,
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text(
                'I confirmed ADULT severe hypertension, slow-IV '
                'injection route, order, vial 5 mg/mL, previous IV '
                'doses, contraindications and patient monitoring.',
              ),
              onChanged: (v) =>
                  setState(() => verified = v ?? false),
            ),
            if (verified && result == null)
              const Text(
                'STOP: dose or vial mismatch, incorrect route stage, '
                'invalid prior dose or 300 mg cumulative limit exceeded. '
                'No injection volume is produced.',
              ),
            if (result != null) ...[
              const Divider(),
              Text(
                'Withdraw ' +
                    result.withdrawalMl.toStringAsFixed(1) +
                    ' mL from VERIFIED 5 mg/mL vial',
                style: Theme.of(context).textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w900),
              ),
              Text('Cumulative injections after this order: ' +
                  result.cumulativeMg.toStringAsFixed(0) + ' mg'),
              const SizedBox(height: 8),
              const Text(
                'SLOW IV injection over 2 minutes for initial dose. '
                'Additional injection interval at least 10 minutes as '
                'ordered. Check supine BP before, at 5 and 10 minutes. '
                'Do NOT apply to infusion-bag preparation.',
              ),
            ],
            const SizedBox(height: 7),
            const Text(
              'Critical: bronchial asthma, overt cardiac failure, '
              'heart block greater than first degree, shock, '
              'severe bradycardia and severe hypotension are '
              'contraindications in the cited label.',
            ),
          ],
        ),
      ),
    );
  }
}

class _Number extends StatelessWidget {
  const _Number({
    super.key,
    required this.label,
    required this.controller,
    required this.changed,
  });
  final String label;
  final TextEditingController controller;
  final VoidCallback changed;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
          ),
          onChanged: (_) => changed(),
        ),
      );
}
