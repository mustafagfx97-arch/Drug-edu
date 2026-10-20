import 'package:flutter/material.dart';

import '../data/iv_adult_dose_regimens.dart';

class IvAdultDoseGuidePanel extends StatelessWidget {
  const IvAdultDoseGuidePanel({
    super.key,
    required this.drugName,
    required this.population,
    required this.selectedId,
    required this.onChanged,
  });

  final String drugName;
  final String population;
  final String? selectedId;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    final options = reviewedAdultIvDoseRegimens(
      name: drugName,
      population: population,
    );
    final selected = options.where((r) => r.id == selectedId).toList();
    final picked = selected.isEmpty ? null : selected.first;
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('IV Dose Guide: Injection and Infusion',
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w900)),
            const SizedBox(height: 7),
            const Text(
              'REFERENCE FOR ADULTS ONLY. Select the indication and route '
              'matching the clinician order. This does NOT select an '
              'individual patient dose. Do not apply to NICU/PICU, '
              'pregnancy-specific protocols, stroke or aortic emergencies '
              'without their own verified regimen.',
            ),
            const SizedBox(height: 10),
            if (options.isEmpty)
              const Text(
                'No product- and indication-verified IV dose regimen has '
                'been reviewed here. Continue with local clinical '
                'reference; do not infer a dose from dilution math.',
              )
            else ...[
              DropdownButtonFormField<String>(
                key: ValueKey('iv-dose-route-' + drugName),
                isExpanded: true,
                initialValue: picked?.id,
                decoration: const InputDecoration(
                  labelText: 'Indication and administration route',
                  border: OutlineInputBorder(),
                ),
                hint: const Text('Choose an adult labeled regimen'),
                items: [
                  for (final regimen in options)
                    DropdownMenuItem(
                      value: regimen.id,
                      child: Text(
                        regimen.indication + ' · ' + regimen.heading,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
                onChanged: onChanged,
              ),
              const SizedBox(height: 8),
              if (picked != null) ...[
                Text(picked.heading, style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w800)),
                const SizedBox(height: 8),
                Text('Labeled dose and titration: ' +
                    picked.doseDirections),
                const SizedBox(height: 8),
                Text('Monitoring: ' + picked.monitoring),
                const SizedBox(height: 8),
                Text('Safety: ' + picked.safety,
                    style: TextStyle(
                      color: theme.colorScheme.error,
                      fontWeight: FontWeight.w700,
                    )),
                const SizedBox(height: 8),
                SelectableText('DailyMed source: ' + picked.sourceUrl,
                    style: theme.textTheme.bodySmall),
              ] else
                const Text(
                  'Pick a regimen above to see its labeled dose, '
                  'route, titration, monitoring, contraindication '
                  'warnings and manufacturer source.',
                ),
            ],
          ],
        ),
      ),
    );
  }
}
