import 'package:flutter/material.dart';

import '../data/supplement_decision_pathways.dart';
import '../domain/supplement_decision_models.dart';

class SupplementDecisionScreen extends StatefulWidget {
  const SupplementDecisionScreen({super.key});

  @override
  State<SupplementDecisionScreen> createState() =>
      _SupplementDecisionScreenState();
}

class _SupplementDecisionScreenState extends State<SupplementDecisionScreen> {
  final Set<SupplementDecisionFlag> _selected = {};

  void _toggle(SupplementDecisionFlag flag, bool selected) {
    setState(() {
      if (selected) {
        _selected.add(flag);
      } else {
        _selected.remove(flag);
      }
    });
  }

  Color _tierColor(BuildContext context, SupplementDecisionTier tier) {
    final colors = Theme.of(context).colorScheme;
    return switch (tier) {
      SupplementDecisionTier.foundation => colors.primaryContainer,
      SupplementDecisionTier.preventive => colors.secondaryContainer,
      SupplementDecisionTier.testFirst => colors.tertiaryContainer,
      SupplementDecisionTier.clinicianReview => colors.errorContainer,
      SupplementDecisionTier.productSafety => colors.surfaceContainerHighest,
    };
  }

  String _tierLabel(SupplementDecisionTier tier) {
    return switch (tier) {
      SupplementDecisionTier.foundation => 'FOUNDATION',
      SupplementDecisionTier.preventive => 'PREVENTIVE',
      SupplementDecisionTier.testFirst => 'TEST FIRST',
      SupplementDecisionTier.clinicianReview => 'CLINICIAN REVIEW',
      SupplementDecisionTier.productSafety => 'PRODUCT SAFETY',
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final actions = evaluateSupplementDecision(_selected);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Do I need a supplement?'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 32),
        children: [
          Text(
            'قرار المكمل يبدأ من المريض، لا من العلبة',
            textDirection: TextDirection.rtl,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Select every statement that applies. The result does not diagnose deficiency; it tells you whether the next step is food-first, routine prevention, targeted testing, a medication/product review, or clinician-directed treatment.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            '1. What applies to this patient?',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          for (final prompt in supplementDecisionPrompts)
            Card(
              margin: const EdgeInsets.only(bottom: 9),
              child: CheckboxListTile(
                value: _selected.contains(prompt.flag),
                onChanged: (value) => _toggle(prompt.flag, value ?? false),
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  prompt.titleAr,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        prompt.titleEn,
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        prompt.detailAr,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          const SizedBox(height: 18),
          Text(
            '2. Practical result',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          for (final action in actions)
            Container(
              margin: const EdgeInsets.only(bottom: 11),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _tierColor(context, action.tier),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _tierLabel(action.tier),
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.7,
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    action.titleAr,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    action.titleEn,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 9),
                  Text(
                    action.patientActionAr,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    action.clinicalNoteEn,
                    style: theme.textTheme.bodySmall?.copyWith(height: 1.45),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Source: ' + action.sourceLabel,
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 18),
          Text(
            '3. What should I test?',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          for (final rule in supplementLabRules)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      rule.titleAr,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      rule.titleEn,
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      rule.bodyAr,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      rule.clinicalNoteEn,
                      style: theme.textTheme.bodySmall?.copyWith(height: 1.45),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Source: ' + rule.sourceLabel,
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
