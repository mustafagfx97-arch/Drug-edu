import 'package:flutter/material.dart';

import '../data/stack_safety_data.dart';
import '../domain/stack_safety_models.dart';

class StackSafetyScreen extends StatefulWidget {
  const StackSafetyScreen({super.key});

  @override
  State<StackSafetyScreen> createState() => _StackSafetyScreenState();
}

class _StackSafetyScreenState extends State<StackSafetyScreen> {
  final Set<String> _selected = {};
  final Set<StackPatientFlag> _flags = {};

  String _label(StackAdviceLevel level) => switch (level) {
        StackAdviceLevel.okay => 'CAN COMBINE / usually okay',
        StackAdviceLevel.separate => 'SEPARATE TIMING',
        StackAdviceLevel.review => 'CLINICAL REVIEW',
        StackAdviceLevel.avoid => 'AVOID CASUAL COMBINATION',
      };

  Color _color(BuildContext context, StackAdviceLevel level) {
    final scheme = Theme.of(context).colorScheme;
    return switch (level) {
      StackAdviceLevel.okay => scheme.secondaryContainer,
      StackAdviceLevel.separate => scheme.tertiaryContainer,
      StackAdviceLevel.review => scheme.errorContainer.withValues(alpha: 0.65),
      StackAdviceLevel.avoid => scheme.errorContainer,
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final advice = evaluateStack(selectedIds: _selected, flags: _flags);

    return Scaffold(
      appBar: AppBar(title: const Text('Can I Take These Together?')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 32),
        children: [
          Text(
            'خانة المريض: ماذا أجمع وماذا أفصل؟',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 7),
          const Text(
            'Select the supplements the patient actually uses, then add key medicine/condition flags. The output separates “safe to take together” from “useful to take together.”',
          ),
          const SizedBox(height: 18),
          Text(
            'Supplements',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          for (final item in stackItems)
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              value: _selected.contains(item.id),
              title: Text(item.name),
              subtitle: Text(item.group),
              onChanged: (value) {
                setState(() {
                  if (value == true) {
                    _selected.add(item.id);
                  } else {
                    _selected.remove(item.id);
                  }
                });
              },
            ),
          const SizedBox(height: 18),
          Text(
            'Patient / medicine flags',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          _Flag(
            title: 'Warfarin / anticoagulation review',
            flag: StackPatientFlag.warfarin,
            selected: _flags,
            onChanged: () => setState(() {}),
          ),
          _Flag(
            title: 'Levothyroxine',
            flag: StackPatientFlag.levothyroxine,
            selected: _flags,
            onChanged: () => setState(() {}),
          ),
          _Flag(
            title: 'Tetracycline / quinolone antibiotic',
            flag: StackPatientFlag.tetracyclineOrQuinolone,
            selected: _flags,
            onChanged: () => setState(() {}),
          ),
          _Flag(
            title: 'Reduced kidney function',
            flag: StackPatientFlag.renalImpairment,
            selected: _flags,
            onChanged: () => setState(() {}),
          ),
          _Flag(
            title: 'Pregnant / planning pregnancy',
            flag: StackPatientFlag.pregnancyOrPlanning,
            selected: _flags,
            onChanged: () => setState(() {}),
          ),
          _Flag(
            title: 'Sensitive stomach / constipation / diarrhea tendency',
            flag: StackPatientFlag.sensitiveGut,
            selected: _flags,
            onChanged: () => setState(() {}),
          ),
          const SizedBox(height: 20),
          Text(
            'Result',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          if (_selected.isEmpty)
            const Text('Select at least one supplement.')
          else
            for (final item in advice)
              Container(
                margin: const EdgeInsets.only(bottom: 9),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: _color(context, item.level),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      _label(item.level),
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 5),
                    Text(item.message, style: const TextStyle(height: 1.45)),
                  ],
                ),
              ),
          const SizedBox(height: 14),
          const Text(
            'Important: this screen checks selected high-value supplement rules. It does not replace the Product & Combination Analyzer for total dose/UL calculations or an exact medication interaction review.',
          ),
        ],
      ),
    );
  }
}

class _Flag extends StatelessWidget {
  const _Flag({
    required this.title,
    required this.flag,
    required this.selected,
    required this.onChanged,
  });

  final String title;
  final StackPatientFlag flag;
  final Set<StackPatientFlag> selected;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      value: selected.contains(flag),
      title: Text(title),
      onChanged: (value) {
        if (value == true) {
          selected.add(flag);
        } else {
          selected.remove(flag);
        }
        onChanged();
      },
    );
  }
}
