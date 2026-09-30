import 'package:flutter/material.dart';

import '../data/adult_daily_needs.dart';
import '../domain/daily_needs_models.dart';

class DailyNeedsScreen extends StatefulWidget {
  const DailyNeedsScreen({super.key});

  @override
  State<DailyNeedsScreen> createState() => _DailyNeedsScreenState();
}

class _DailyNeedsScreenState extends State<DailyNeedsScreen> {
  PatientSex _sex = PatientSex.female;
  AdultAgeBand _ageBand = AdultAgeBand.age19to30;
  AdultLifeStage _lifeStage = AdultLifeStage.none;
  bool _smoker = false;

  AdultDailyNeedInput get _input => AdultDailyNeedInput(
        sex: _sex,
        ageBand: _ageBand,
        lifeStage: _lifeStage,
        smoker: _smoker,
      );

  bool get _supportsLifeStage => supportsAdultLifeStage(_input);

  void _setSex(PatientSex value) {
    setState(() {
      _sex = value;
      if (!_supportsLifeStage) {
        _lifeStage = AdultLifeStage.none;
      }
    });
  }

  void _setAgeBand(AdultAgeBand value) {
    setState(() {
      _ageBand = value;
      if (!_supportsLifeStage) {
        _lifeStage = AdultLifeStage.none;
      }
    });
  }

  String _sexLabel(PatientSex value) {
    return value == PatientSex.male ? 'Male / ذكر' : 'Female / أنثى';
  }

  String _ageLabel(AdultAgeBand value) {
    return switch (value) {
      AdultAgeBand.age19to30 => '19–30 years',
      AdultAgeBand.age31to50 => '31–50 years',
      AdultAgeBand.age51to70 => '51–70 years',
      AdultAgeBand.age71plus => '71+ years',
    };
  }

  String _lifeStageLabel(AdultLifeStage value) {
    return switch (value) {
      AdultLifeStage.none => 'None / لا يوجد',
      AdultLifeStage.pregnant => 'Pregnant / حامل',
      AdultLifeStage.lactating => 'Lactating / مرضع',
    };
  }

  String _formatAmount(double value) {
    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    }
    return value.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final needs = adultDailyNeeds(_input);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Needs & Labs'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 32),
        children: [
          Container(
            padding: const EdgeInsets.all(17),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'كم يحتاج هذا المريض يوميًا؟',
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'The number shown is the total daily nutritional target (food + supplements), not an automatic supplement dose. Use a supplement only to cover a real gap or a defined preventive/therapeutic indication.',
                  style: theme.textTheme.bodyLarge?.copyWith(height: 1.5),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Adult profile',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text('Sex', style: theme.textTheme.labelLarge),
                  DropdownButton<PatientSex>(
                    isExpanded: true,
                    value: _sex,
                    items: PatientSex.values
                        .map(
                          (value) => DropdownMenuItem(
                            value: value,
                            child: Text(_sexLabel(value)),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) _setSex(value);
                    },
                  ),
                  const SizedBox(height: 10),
                  Text('Age', style: theme.textTheme.labelLarge),
                  DropdownButton<AdultAgeBand>(
                    isExpanded: true,
                    value: _ageBand,
                    items: AdultAgeBand.values
                        .map(
                          (value) => DropdownMenuItem(
                            value: value,
                            child: Text(_ageLabel(value)),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) _setAgeBand(value);
                    },
                  ),
                  const SizedBox(height: 10),
                  Text('Life stage', style: theme.textTheme.labelLarge),
                  DropdownButton<AdultLifeStage>(
                    isExpanded: true,
                    value: _lifeStage,
                    items: AdultLifeStage.values
                        .map(
                          (value) => DropdownMenuItem(
                            value: value,
                            enabled: value == AdultLifeStage.none ||
                                _supportsLifeStage,
                            child: Text(_lifeStageLabel(value)),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null &&
                          (value == AdultLifeStage.none ||
                              _supportsLifeStage)) {
                        setState(() => _lifeStage = value);
                      }
                    },
                  ),
                  if (!_supportsLifeStage)
                    Text(
                      'Pregnancy/lactation values in this adult module are limited to females age 19–50.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  const SizedBox(height: 6),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    value: _smoker,
                    title: const Text('Current smoker'),
                    subtitle: const Text(
                      'Adds 35 mg/day to the vitamin C RDA.',
                    ),
                    onChanged: (value) => setState(() => _smoker = value),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'Personalized daily targets',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'RDA/AI is a nutrition target for generally healthy people. It is not the same as a treatment dose for deficiency.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 10),
          for (final item in needs)
            Card(
              margin: const EdgeInsets.only(bottom: 11),
              child: ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 5,
                ),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                title: Text(
                  item.nameEn + ' — ' + item.nameAr,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    item.referenceType +
                        ': ' +
                        _formatAmount(item.amount) +
                        ' ' +
                        item.unit,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                children: [
                  _Fact(
                    label: 'What this number means',
                    body:
                        'Daily total target from food + supplements. Do not automatically prescribe this entire amount as a supplement.',
                  ),
                  _Fact(
                    label: 'Food first',
                    body: item.foodFirstAr,
                    rtl: true,
                  ),
                  _Fact(
                    label: 'When a supplement makes sense',
                    body: item.supplementRuleAr,
                    rtl: true,
                  ),
                  _Fact(
                    label: 'Upper limit',
                    body: item.upperLimit + '. ' + item.upperLimitScope,
                  ),
                  _Fact(
                    label: 'Lab checkpoint',
                    body: item.labRuleAr,
                    rtl: true,
                  ),
                  Text(
                    'Source: ' + item.sourceLabel,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 20),
          Text(
            'Lab Navigator',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Target the laboratory question. A “vitamin panel for everyone” is not the default.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 10),
          for (final item in labNavigatorItems)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ExpansionTile(
                title: Text(
                  item.titleEn + ' — ' + item.titleAr,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  _Fact(
                    label: 'When to test',
                    body: item.whenToTestAr,
                    rtl: true,
                  ),
                  _Fact(
                    label: 'What to order',
                    body: item.whatToOrderAr,
                    rtl: true,
                  ),
                  _Fact(
                    label: 'Interpretation lock',
                    body: item.interpretationAr,
                    rtl: true,
                  ),
                  Text(
                    'Source: ' + item.sourceLabel,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
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
    this.rtl = false,
  });

  final String label;
  final String body;
  final bool rtl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w900,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            body,
            textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
            textAlign: rtl ? TextAlign.right : TextAlign.left,
            style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
          ),
        ],
      ),
    );
  }
}
