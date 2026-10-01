import 'package:flutter/material.dart';

import '../data/need_matrix_data.dart';
import '../domain/need_matrix_models.dart';

class NeedMatrixScreen extends StatefulWidget {
  const NeedMatrixScreen({super.key});

  @override
  State<NeedMatrixScreen> createState() => _NeedMatrixScreenState();
}

class _NeedMatrixScreenState extends State<NeedMatrixScreen> {
  String _selectedId = 'healthy-balanced-adult';

  String _tier(NeedActionTier tier) => switch (tier) {
        NeedActionTier.foodFirst => 'FOOD FIRST / GAP ONLY',
        NeedActionTier.preventive => 'ROUTINE PREVENTION',
        NeedActionTier.testFirst => 'TEST / RISK FIRST',
        NeedActionTier.treatment => 'TREATMENT',
        NeedActionTier.protocol => 'PROTOCOL-BASED',
        NeedActionTier.avoidSelfSupplement => 'DO NOT SELF-SUPPLEMENT',
      };

  Color _tierColor(BuildContext context, NeedActionTier tier) {
    final c = Theme.of(context).colorScheme;
    return switch (tier) {
      NeedActionTier.foodFirst => c.primaryContainer,
      NeedActionTier.preventive => c.secondaryContainer,
      NeedActionTier.testFirst => c.tertiaryContainer,
      NeedActionTier.treatment => c.errorContainer,
      NeedActionTier.protocol => c.surfaceContainerHighest,
      NeedActionTier.avoidSelfSupplement => c.errorContainer,
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pathway = needPathway(_selectedId);

    return Scaffold(
      appBar: AppBar(title: const Text('Who Actually Needs What?')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 32),
        children: [
          Text(
            'من يحتاج مكملًا فعلًا؟',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            'One screen for healthy people, life-stage prevention, medication risks, deficiency treatment and disease/surgery protocols.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 12),
          for (final rule in needMatrixGlobalRules)
            _Box(title: 'CORE RULE', body: rule, critical: true),
          const SizedBox(height: 14),
          DropdownButton<String>(
            isExpanded: true,
            value: _selectedId,
            items: needPathways
                .map(
                  (item) => DropdownMenuItem(
                    value: item.id,
                    child: Text(item.title),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) setState(() => _selectedId = value);
            },
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: _tierColor(context, pathway.tier),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              _tier(pathway.tier),
              style: const TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(height: 10),
          _Fact(label: 'Who', body: pathway.who),
          _Fact(label: 'Core decision', body: pathway.coreDecision),
          _Fact(label: 'Supplement plan', body: pathway.supplementPlan),
          _Fact(label: 'Daily target / dose logic', body: pathway.dailyTarget),
          _Fact(label: 'What to test', body: pathway.labPlan),
          _Fact(label: 'Duration', body: pathway.duration),
          _Fact(
            label: 'When to stop / review',
            body: pathway.reviewStopRule,
            critical: true,
          ),
          Text(
            'Source: ' + pathway.sourceLabel,
            style: theme.textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 26),
          Text(
            'Healthy adult: what is the “daily supplement dose”?',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 7),
          const Text(
            'These are TOTAL intake targets. The default pill dose is often zero when food already meets the target. Use My Daily Needs for exact age/sex/life-stage values.',
          ),
          const SizedBox(height: 8),
          for (final item in healthySupplementRules)
            Card(
              margin: const EdgeInsets.only(bottom: 9),
              child: ExpansionTile(
                title: Text(
                  item.nutrient,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                subtitle: Text(item.defaultSupplementDose),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  _Fact(label: 'Daily need', body: item.dailyNeed),
                  _Fact(
                    label: 'Default supplement dose',
                    body: item.defaultSupplementDose,
                  ),
                  _Fact(label: 'Practical rule', body: item.practicalRule),
                ],
              ),
            ),
          const SizedBox(height: 24),
          Text(
            'If the patient takes it anyway: usual daily supplement doses',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 7),
          const Text(
            'These are practical nutritional/common label doses, NOT proof of need. The purpose is to prevent a healthy person from jumping directly to megadoses.',
          ),
          const SizedBox(height: 8),
          for (final item in usualSupplementDoseRules)
            Card(
              margin: const EdgeInsets.only(bottom: 9),
              child: ExpansionTile(
                title: Text(
                  item.name,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                subtitle: Text(item.usualIfTakingAnyway),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  _Fact(label: 'Normal daily need', body: item.normalNeed),
                  _Fact(
                    label: 'Usual dose if taking anyway',
                    body: item.usualIfTakingAnyway,
                  ),
                  _Fact(
                    label: 'High-dose boundary',
                    body: item.highDoseBoundary,
                    critical: true,
                  ),
                  _Fact(label: 'Practical use', body: item.practicalUse),
                  Text(
                    'Source: ' + item.sourceLabel,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 24),
          Text(
            'If they take supplements anyway: usual NON-treatment daily doses',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 7),
          const Text(
            'This section does NOT mean the supplement is needed. It gives a practical nutritional/elective dose or clearly states when no standard supplement dose exists.',
          ),
          const SizedBox(height: 8),
          for (final item in electiveDailyDoseRules)
            Card(
              margin: const EdgeInsets.only(bottom: 9),
              child: ExpansionTile(
                title: Text(
                  item.nutrient,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                subtitle: Text(item.usualNonTreatmentUse),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  _Fact(
                    label: 'Nutritional target',
                    body: item.nutritionalTarget,
                  ),
                  _Fact(
                    label: 'Usual non-treatment use',
                    body: item.usualNonTreatmentUse,
                  ),
                  _Fact(
                    label: 'What this is NOT',
                    body: item.notAStandardDose,
                    critical: true,
                  ),
                  _Fact(
                    label: 'Safety ceiling / caution',
                    body: item.safetyCeiling,
                    critical: true,
                  ),
                  _Fact(
                    label: 'Practical rule',
                    body: item.practicalRule,
                  ),
                  Text(
                    'Source: ' + item.sourceLabel,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 24),
          Text(
            'Healthy person: what should actually be tested?',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          for (final item in healthyLabRules)
            Card(
              margin: const EdgeInsets.only(bottom: 9),
              child: ExpansionTile(
                title: Text(
                  item.test,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                subtitle: Text('Routine healthy use: ' + item.routineHealthyUse),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  _Fact(label: 'When useful', body: item.whenUseful),
                  _Fact(
                    label: 'Do not misread',
                    body: item.doNotMisread,
                    critical: true,
                  ),
                  Text(
                    'Source: ' + item.sourceLabel,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
        ],
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
              color: critical ? theme.colorScheme.error : theme.colorScheme.primary,
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

class _Box extends StatelessWidget {
  const _Box({
    required this.title,
    required this.body,
    required this.critical,
  });

  final String title;
  final String body;
  final bool critical;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: critical
            ? theme.colorScheme.errorContainer.withValues(alpha: 0.48)
            : theme.colorScheme.secondaryContainer.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
          const SizedBox(height: 4),
          Text(body, style: const TextStyle(height: 1.45)),
        ],
      ),
    );
  }
}
