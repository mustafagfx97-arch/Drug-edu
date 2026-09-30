import 'package:flutter/material.dart';

import '../data/probiotic_atlas_data.dart';
import '../domain/probiotic_atlas_models.dart';

class ProbioticAtlasScreen extends StatefulWidget {
  const ProbioticAtlasScreen({super.key});

  @override
  State<ProbioticAtlasScreen> createState() => _ProbioticAtlasScreenState();
}

class _ProbioticAtlasScreenState extends State<ProbioticAtlasScreen> {
  String _selectedId = 'lgg';
  final _targetController = TextEditingController();
  final _servingController = TextEditingController();
  bool _perStrainVerified = true;

  @override
  void dispose() {
    _targetController.dispose();
    _servingController.dispose();
    super.dispose();
  }

  double _parse(TextEditingController controller) =>
      double.tryParse(controller.text.trim()) ?? 0;

  String _evidenceLabel(ProbioticEvidence value) => switch (value) {
        ProbioticEvidence.strong => 'Strong',
        ProbioticEvidence.moderate => 'Moderate',
        ProbioticEvidence.low => 'Low',
        ProbioticEvidence.veryLow => 'Very low',
        ProbioticEvidence.conflicting => 'Conflicting guideline context',
        ProbioticEvidence.insufficient => 'Insufficient',
        ProbioticEvidence.againstRoutineUse => 'Against routine use',
      };

  String _format(double value) {
    if (value == value.roundToDouble()) return value.toInt().toString();
    if (value >= 10) return value.toStringAsFixed(1);
    return value.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final profile = probioticProfile(_selectedId);
    final match = matchProbioticCfu(
      targetCfuPerDay: _parse(_targetController),
      cfuPerServingForExactStrain: _parse(_servingController),
      perStrainCfuVerified: _perStrainVerified,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Probiotic Strain Atlas')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 32),
        children: [
          Text(
            'الـstrain أولًا، وليس اسم الجنس فقط',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            'Clinical benefit = exact strain or exact combination + studied dose + studied indication + viable product. “50 billion probiotic” by itself is not a clinical regimen.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 14),
          DropdownButton<String>(
            isExpanded: true,
            value: _selectedId,
            items: probioticProfiles
                .map(
                  (item) => DropdownMenuItem(
                    value: item.id,
                    child: Text(item.displayName),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedId = value;
                  _targetController.clear();
                  _servingController.clear();
                });
              }
            },
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  profile.displayName,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  profile.organismType,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(profile.keyRule, style: const TextStyle(height: 1.5)),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'Exact indication → dose → duration',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final use in profile.uses)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ExpansionTile(
                title: Text(
                  use.indication,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                subtitle: Text(
                  use.population + ' • ' + _evidenceLabel(use.evidence),
                ),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  _Fact(label: 'Dose', body: use.dose),
                  _Fact(label: 'Frequency', body: use.frequency),
                  _Fact(label: 'Duration', body: use.duration),
                  _Fact(label: 'Exactly how to use', body: use.exactUse),
                  _Fact(
                    label: 'Do not generalize',
                    body: use.caveat,
                    critical: true,
                  ),
                  Text(
                    'Source: ' + use.sourceLabel,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 18),
          Text(
            'Strain safety',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final item in profile.safety)
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: theme.colorScheme.errorContainer.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(item, style: const TextStyle(height: 1.45)),
            ),
          const SizedBox(height: 22),
          _DoseMatcherCard(
            targetController: _targetController,
            servingController: _servingController,
            perStrainVerified: _perStrainVerified,
            match: match,
            format: _format,
            onChanged: () => setState(() {}),
            onVerifiedChanged: (value) =>
                setState(() => _perStrainVerified = value),
          ),
          const SizedBox(height: 22),
          Text(
            'Verified product-technique examples',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final product in probioticProductExamples)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ExpansionTile(
                title: Text(
                  product.name,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                subtitle: Text(product.strain),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  _Fact(label: 'Amount / serving', body: product.amount),
                  _Fact(label: 'Exact administration', body: product.directions),
                  _Fact(label: 'Storage', body: product.storage),
                  _Fact(
                    label: 'Product-specific lock',
                    body: product.productSpecificLock,
                    critical: true,
                  ),
                  Text(
                    'Source: ' + product.sourceLabel,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 22),
          Text(
            'Prebiotics / Synbiotics / Postbiotics',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final item in microbiomeAdjuncts)
            Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                title: Text(
                  item.name,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                subtitle: Text(
                  item.category +
                      '\nDose: ' +
                      item.dose +
                      '\n' +
                      item.use +
                      '\nCaution: ' +
                      item.caveat,
                ),
                isThreeLine: false,
              ),
            ),
          const SizedBox(height: 22),
          Text(
            'Guideline locks — what NOT to promise',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final item in probioticGuidelineLocks)
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color:
                    theme.colorScheme.secondaryContainer.withValues(alpha: 0.55),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(item, style: const TextStyle(height: 1.45)),
            ),
          const SizedBox(height: 12),
          Text(
            'Label rule',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Prefer products that state genus + species + strain, per-strain viable count when clinically relevant, storage, expiration, and potency through the END of shelf life. “CFU at manufacture” is not enough.',
            style: TextStyle(height: 1.5),
          ),
        ],
      ),
    );
  }
}

class _DoseMatcherCard extends StatelessWidget {
  const _DoseMatcherCard({
    required this.targetController,
    required this.servingController,
    required this.perStrainVerified,
    required this.match,
    required this.format,
    required this.onChanged,
    required this.onVerifiedChanged,
  });

  final TextEditingController targetController;
  final TextEditingController servingController;
  final bool perStrainVerified;
  final ProbioticDoseMatch match;
  final String Function(double) format;
  final VoidCallback onChanged;
  final ValueChanged<bool> onVerifiedChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: theme.colorScheme.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'CFU Dose Matcher',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Use the exact strain target from the pathway above. Enter CFU as plain numbers: 10 billion = 10000000000.',
              style: theme.textTheme.bodySmall?.copyWith(height: 1.45),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: targetController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Target CFU/day for exact strain',
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => onChanged(),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: servingController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'CFU per serving for exact strain',
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => onChanged(),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              value: perStrainVerified,
              title: const Text('Per-strain CFU is actually stated/verified'),
              subtitle: const Text(
                'Turn OFF if the label gives only a total blend CFU.',
              ),
              onChanged: onVerifiedChanged,
            ),
            const SizedBox(height: 8),
            Text(
              match.locked
                  ? match.message
                  : 'Mathematical servings/day: ' +
                      format(match.servingsPerDay) +
                      '\n' +
                      match.message,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w800,
                color: match.locked ? theme.colorScheme.error : null,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Fact extends StatelessWidget {
  const _Fact({
    required this.label,
    required this.body,
    this.critical = false,
  });

  final String label;
  final String body;
  final bool critical;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            style: theme.textTheme.labelLarge?.copyWith(
              color: critical
                  ? theme.colorScheme.error
                  : theme.colorScheme.primary,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 3),
          Text(body, style: theme.textTheme.bodyMedium?.copyWith(height: 1.45)),
        ],
      ),
    );
  }
}
