import 'package:flutter/material.dart';

import '../data/adult_daily_needs.dart';
import '../data/nutrient_gap.dart';
import '../data/pediatric_daily_needs.dart';
import '../domain/daily_needs_models.dart';

enum _NeedsPopulation { adult, pediatric }

class DailyNeedsScreen extends StatefulWidget {
  const DailyNeedsScreen({super.key});

  @override
  State<DailyNeedsScreen> createState() => _DailyNeedsScreenState();
}

class _DailyNeedsScreenState extends State<DailyNeedsScreen> {
  _NeedsPopulation _population = _NeedsPopulation.adult;

  PatientSex _sex = PatientSex.female;
  AdultAgeBand _ageBand = AdultAgeBand.age19to30;
  AdultLifeStage _lifeStage = AdultLifeStage.none;
  bool _smoker = false;

  PatientSex _pediatricSex = PatientSex.female;
  PediatricAgeBand _pediatricAgeBand = PediatricAgeBand.age1To3Years;
  PediatricLifeStage _pediatricLifeStage = PediatricLifeStage.none;
  InfantFeedingMode _feedingMode = InfantFeedingMode.breastMilk;
  FormulaDailyVolume _formulaDailyVolume =
      FormulaDailyVolume.lessThan32OzOrUnknown;
  bool _pretermOrLowBirthWeight = false;

  String? _gapNutrientId;
  final _foodController = TextEditingController();
  final _supplementController = TextEditingController();

  AdultDailyNeedInput get _adultInput => AdultDailyNeedInput(
        sex: _sex,
        ageBand: _ageBand,
        lifeStage: _lifeStage,
        smoker: _smoker,
      );

  PediatricDailyNeedInput get _pediatricInput => PediatricDailyNeedInput(
        sex: _pediatricSex,
        ageBand: _pediatricAgeBand,
        lifeStage: _pediatricLifeStage,
        feedingMode: _feedingMode,
        formulaDailyVolume: _formulaDailyVolume,
        pretermOrLowBirthWeight: _pretermOrLowBirthWeight,
      );

  bool get _supportsAdultLifeStage => supportsAdultLifeStage(_adultInput);
  bool get _supportsPediatricLifeStage =>
      supportsTeenLifeStage(_pediatricInput);
  bool get _isInfant => isInfantBand(_pediatricAgeBand);

  @override
  void dispose() {
    _foodController.dispose();
    _supplementController.dispose();
    super.dispose();
  }

  void _setAdultSex(PatientSex value) {
    setState(() {
      _sex = value;
      if (!_supportsAdultLifeStage) {
        _lifeStage = AdultLifeStage.none;
      }
    });
  }

  void _setAdultAge(AdultAgeBand value) {
    setState(() {
      _ageBand = value;
      if (!_supportsAdultLifeStage) {
        _lifeStage = AdultLifeStage.none;
      }
    });
  }

  void _setPediatricSex(PatientSex value) {
    setState(() {
      _pediatricSex = value;
      if (!_supportsPediatricLifeStage) {
        _pediatricLifeStage = PediatricLifeStage.none;
      }
    });
  }

  void _setPediatricAge(PediatricAgeBand value) {
    setState(() {
      _pediatricAgeBand = value;
      if (!_supportsPediatricLifeStage) {
        _pediatricLifeStage = PediatricLifeStage.none;
      }
    });
  }

  String _sexLabel(PatientSex value) =>
      value == PatientSex.male ? 'Male / ذكر' : 'Female / أنثى';

  String _adultAgeLabel(AdultAgeBand value) => switch (value) {
        AdultAgeBand.age19to30 => '19–30 years',
        AdultAgeBand.age31to50 => '31–50 years',
        AdultAgeBand.age51to70 => '51–70 years',
        AdultAgeBand.age71plus => '71+ years',
      };

  String _adultLifeStageLabel(AdultLifeStage value) => switch (value) {
        AdultLifeStage.none => 'None / لا يوجد',
        AdultLifeStage.pregnant => 'Pregnant / حامل',
        AdultLifeStage.lactating => 'Lactating / مرضع',
      };

  String _pediatricAgeLabel(PediatricAgeBand value) => switch (value) {
        PediatricAgeBand.birthTo6Months => 'Birth–6 months',
        PediatricAgeBand.age7To12Months => '7–12 months',
        PediatricAgeBand.age1To3Years => '1–3 years',
        PediatricAgeBand.age4To8Years => '4–8 years',
        PediatricAgeBand.age9To13Years => '9–13 years',
        PediatricAgeBand.age14To18Years => '14–18 years',
      };

  String _pediatricLifeStageLabel(PediatricLifeStage value) => switch (value) {
        PediatricLifeStage.none => 'None / لا يوجد',
        PediatricLifeStage.pregnant => 'Pregnant teen / حمل',
        PediatricLifeStage.lactating => 'Lactating teen / رضاعة',
      };

  String _feedingModeLabel(InfantFeedingMode value) => switch (value) {
        InfantFeedingMode.breastMilk => 'Breast milk only / حليب الأم',
        InfantFeedingMode.mixed => 'Mixed feeding / مختلط',
        InfantFeedingMode.ironFortifiedFormula =>
          'Iron-fortified formula / حليب صناعي مدعم بالحديد',
      };

  String _formulaVolumeLabel(FormulaDailyVolume value) => switch (value) {
        FormulaDailyVolume.lessThan32OzOrUnknown =>
          '<32 oz/day or unknown / أقل من 32 أونصة أو غير معروف',
        FormulaDailyVolume.atLeast32Oz =>
          '≥32 oz/day / 32 أونصة أو أكثر',
      };

  String _formatAmount(double value) {
    if (value == value.roundToDouble()) return value.toInt().toString();
    if (value.abs() < 1) return value.toStringAsFixed(2);
    return value.toStringAsFixed(1);
  }

  double _parse(String value) => double.tryParse(value.trim()) ?? 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final adultNeeds = adultDailyNeeds(_adultInput);
    final pediatricNeeds = pediatricDailyNeeds(_pediatricInput);
    final needs = _population == _NeedsPopulation.adult
        ? adultNeeds
        : pediatricNeeds;
    final pediatricNotes = pediatricSafetyNotes(_pediatricInput);

    final selectedGapItem = needs.firstWhere(
      (item) => item.id == (_gapNutrientId ?? needs.first.id),
      orElse: () => needs.first,
    );
    final gap = calculateNutrientGap(
      target: selectedGapItem.amount,
      foodIntake: _parse(_foodController.text),
      existingSupplementIntake: _parse(_supplementController.text),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Daily Needs & Labs')),
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
                  'RDA/AI is the total nutritional target from food + supplements. It is not an automatic supplement or deficiency-treatment dose.',
                  style: theme.textTheme.bodyLarge?.copyWith(height: 1.5),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          SegmentedButton<_NeedsPopulation>(
            segments: const [
              ButtonSegment(
                value: _NeedsPopulation.adult,
                label: Text('Adult'),
                icon: Icon(Icons.person_outline),
              ),
              ButtonSegment(
                value: _NeedsPopulation.pediatric,
                label: Text('Child / Teen'),
                icon: Icon(Icons.child_care_outlined),
              ),
            ],
            selected: {_population},
            onSelectionChanged: (value) {
              setState(() {
                _population = value.first;
                _gapNutrientId = null;
                _foodController.clear();
                _supplementController.clear();
              });
            },
          ),
          const SizedBox(height: 14),
          if (_population == _NeedsPopulation.adult)
            _AdultProfileCard(
              input: _adultInput,
              supportsLifeStage: _supportsAdultLifeStage,
              sexLabel: _sexLabel,
              ageLabel: _adultAgeLabel,
              lifeStageLabel: _adultLifeStageLabel,
              onSexChanged: _setAdultSex,
              onAgeChanged: _setAdultAge,
              onLifeStageChanged: (value) {
                setState(() => _lifeStage = value);
              },
              onSmokerChanged: (value) {
                setState(() => _smoker = value);
              },
            )
          else
            _PediatricProfileCard(
              input: _pediatricInput,
              isInfant: _isInfant,
              supportsLifeStage: _supportsPediatricLifeStage,
              sexLabel: _sexLabel,
              ageLabel: _pediatricAgeLabel,
              lifeStageLabel: _pediatricLifeStageLabel,
              feedingModeLabel: _feedingModeLabel,
              formulaVolumeLabel: _formulaVolumeLabel,
              onSexChanged: _setPediatricSex,
              onAgeChanged: _setPediatricAge,
              onLifeStageChanged: (value) {
                setState(() => _pediatricLifeStage = value);
              },
              onFeedingModeChanged: (value) {
                setState(() => _feedingMode = value);
              },
              onFormulaVolumeChanged: (value) {
                setState(() => _formulaDailyVolume = value);
              },
              onPretermChanged: (value) {
                setState(() => _pretermOrLowBirthWeight = value);
              },
            ),
          if (_population == _NeedsPopulation.pediatric &&
              pediatricNotes.isNotEmpty) ...[
            const SizedBox(height: 12),
            for (final note in pediatricNotes)
              Container(
                margin: const EdgeInsets.only(bottom: 9),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: note.critical
                      ? theme.colorScheme.errorContainer
                      : theme.colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      note.titleEn + ' — ' + note.titleAr,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      note.bodyAr,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      style: theme.textTheme.bodyMedium?.copyWith(height: 1.55),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Source: ' + note.sourceLabel,
                      style: theme.textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
          ],
          const SizedBox(height: 18),
          Text(
            'Personalized daily targets',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Use these values to plan nutrition. A therapeutic replacement dose may be very different.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 10),
          for (final item in needs)
            _DailyNeedCard(item: item, formatAmount: _formatAmount),
          const SizedBox(height: 18),
          _GapCalculatorCard(
            needs: needs,
            selectedItem: selectedGapItem,
            gap: gap,
            foodController: _foodController,
            supplementController: _supplementController,
            formatAmount: _formatAmount,
            onNutrientChanged: (id) {
              setState(() {
                _gapNutrientId = id;
                _foodController.clear();
                _supplementController.clear();
              });
            },
            onValuesChanged: () => setState(() {}),
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
            'Target the laboratory question. A broad “vitamin panel for everyone” is not the default.',
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

class _AdultProfileCard extends StatelessWidget {
  const _AdultProfileCard({
    required this.input,
    required this.supportsLifeStage,
    required this.sexLabel,
    required this.ageLabel,
    required this.lifeStageLabel,
    required this.onSexChanged,
    required this.onAgeChanged,
    required this.onLifeStageChanged,
    required this.onSmokerChanged,
  });

  final AdultDailyNeedInput input;
  final bool supportsLifeStage;
  final String Function(PatientSex) sexLabel;
  final String Function(AdultAgeBand) ageLabel;
  final String Function(AdultLifeStage) lifeStageLabel;
  final ValueChanged<PatientSex> onSexChanged;
  final ValueChanged<AdultAgeBand> onAgeChanged;
  final ValueChanged<AdultLifeStage> onLifeStageChanged;
  final ValueChanged<bool> onSmokerChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
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
            _DropdownField<PatientSex>(
              label: 'Sex',
              value: input.sex,
              values: PatientSex.values,
              labelFor: sexLabel,
              onChanged: onSexChanged,
            ),
            _DropdownField<AdultAgeBand>(
              label: 'Age',
              value: input.ageBand,
              values: AdultAgeBand.values,
              labelFor: ageLabel,
              onChanged: onAgeChanged,
            ),
            _DropdownField<AdultLifeStage>(
              label: 'Life stage',
              value: input.lifeStage,
              values: AdultLifeStage.values,
              labelFor: lifeStageLabel,
              enabled: (value) =>
                  value == AdultLifeStage.none || supportsLifeStage,
              onChanged: onLifeStageChanged,
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              value: input.smoker,
              title: const Text('Current smoker'),
              subtitle: const Text('Adds 35 mg/day to vitamin C RDA.'),
              onChanged: onSmokerChanged,
            ),
          ],
        ),
      ),
    );
  }
}

class _PediatricProfileCard extends StatelessWidget {
  const _PediatricProfileCard({
    required this.input,
    required this.isInfant,
    required this.supportsLifeStage,
    required this.sexLabel,
    required this.ageLabel,
    required this.lifeStageLabel,
    required this.feedingModeLabel,
    required this.formulaVolumeLabel,
    required this.onSexChanged,
    required this.onAgeChanged,
    required this.onLifeStageChanged,
    required this.onFeedingModeChanged,
    required this.onFormulaVolumeChanged,
    required this.onPretermChanged,
  });

  final PediatricDailyNeedInput input;
  final bool isInfant;
  final bool supportsLifeStage;
  final String Function(PatientSex) sexLabel;
  final String Function(PediatricAgeBand) ageLabel;
  final String Function(PediatricLifeStage) lifeStageLabel;
  final String Function(InfantFeedingMode) feedingModeLabel;
  final String Function(FormulaDailyVolume) formulaVolumeLabel;
  final ValueChanged<PatientSex> onSexChanged;
  final ValueChanged<PediatricAgeBand> onAgeChanged;
  final ValueChanged<PediatricLifeStage> onLifeStageChanged;
  final ValueChanged<InfantFeedingMode> onFeedingModeChanged;
  final ValueChanged<FormulaDailyVolume> onFormulaVolumeChanged;
  final ValueChanged<bool> onPretermChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Infant / child / teen profile',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 12),
            _DropdownField<PediatricAgeBand>(
              label: 'Age',
              value: input.ageBand,
              values: PediatricAgeBand.values,
              labelFor: ageLabel,
              onChanged: onAgeChanged,
            ),
            _DropdownField<PatientSex>(
              label: 'Sex',
              value: input.sex,
              values: PatientSex.values,
              labelFor: sexLabel,
              onChanged: onSexChanged,
            ),
            if (supportsLifeStage)
              _DropdownField<PediatricLifeStage>(
                label: 'Teen life stage',
                value: input.lifeStage,
                values: PediatricLifeStage.values,
                labelFor: lifeStageLabel,
                onChanged: onLifeStageChanged,
              ),
            if (isInfant) ...[
              _DropdownField<InfantFeedingMode>(
                label: 'Infant feeding',
                value: input.feedingMode,
                values: InfantFeedingMode.values,
                labelFor: feedingModeLabel,
                onChanged: onFeedingModeChanged,
              ),
              if (input.feedingMode != InfantFeedingMode.breastMilk)
                _DropdownField<FormulaDailyVolume>(
                  label: 'Formula volume',
                  value: input.formulaDailyVolume,
                  values: FormulaDailyVolume.values,
                  labelFor: formulaVolumeLabel,
                  onChanged: onFormulaVolumeChanged,
                ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                value: input.pretermOrLowBirthWeight,
                title: const Text('Preterm or low birth weight'),
                subtitle: const Text(
                  'Locks the general tool from being treated as a dosing protocol.',
                ),
                onChanged: onPretermChanged,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _DropdownField<T> extends StatelessWidget {
  const _DropdownField({
    required this.label,
    required this.value,
    required this.values,
    required this.labelFor,
    required this.onChanged,
    this.enabled,
  });

  final String label;
  final T value;
  final List<T> values;
  final String Function(T) labelFor;
  final ValueChanged<T> onChanged;
  final bool Function(T)? enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelLarge),
          DropdownButton<T>(
            isExpanded: true,
            value: value,
            items: values
                .map(
                  (item) => DropdownMenuItem<T>(
                    value: item,
                    enabled: enabled?.call(item) ?? true,
                    child: Text(labelFor(item)),
                  ),
                )
                .toList(),
            onChanged: (item) {
              if (item != null && (enabled?.call(item) ?? true)) {
                onChanged(item);
              }
            },
          ),
        ],
      ),
    );
  }
}

class _DailyNeedCard extends StatelessWidget {
  const _DailyNeedCard({
    required this.item,
    required this.formatAmount,
  });

  final DailyNeedItem item;
  final String Function(double) formatAmount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 11),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
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
                formatAmount(item.amount) +
                ' ' +
                item.unit,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        children: [
          const _Fact(
            label: 'What this number means',
            body:
                'Daily total nutritional target. Do not automatically prescribe the entire amount as a supplement.',
          ),
          _Fact(label: 'Food first', body: item.foodFirstAr, rtl: true),
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
    );
  }
}

class _GapCalculatorCard extends StatelessWidget {
  const _GapCalculatorCard({
    required this.needs,
    required this.selectedItem,
    required this.gap,
    required this.foodController,
    required this.supplementController,
    required this.formatAmount,
    required this.onNutrientChanged,
    required this.onValuesChanged,
  });

  final List<DailyNeedItem> needs;
  final DailyNeedItem selectedItem;
  final NutrientGapResult gap;
  final TextEditingController foodController;
  final TextEditingController supplementController;
  final String Function(double) formatAmount;
  final ValueChanged<String> onNutrientChanged;
  final VoidCallback onValuesChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final unit = selectedItem.unit.replaceAll('/day', '');

    return Card(
      color: theme.colorScheme.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Food → Supplement Gap Calculator',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'This calculates the uncovered nutritional gap only. It does NOT automatically recommend that the gap be given as a supplement dose.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.45,
              ),
            ),
            const SizedBox(height: 12),
            DropdownButton<String>(
              isExpanded: true,
              value: selectedItem.id,
              items: needs
                  .map(
                    (item) => DropdownMenuItem(
                      value: item.id,
                      child: Text(item.nameEn + ' — ' + item.nameAr),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) onNutrientChanged(value);
              },
            ),
            const SizedBox(height: 8),
            Text(
              'Daily target: ' +
                  formatAmount(selectedItem.amount) +
                  ' ' +
                  selectedItem.unit,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w900,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: foodController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Estimated from food/formula ($unit)',
                border: const OutlineInputBorder(),
              ),
              onChanged: (_) => onValuesChanged(),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: supplementController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Already from supplements ($unit)',
                border: const OutlineInputBorder(),
              ),
              onChanged: (_) => onValuesChanged(),
            ),
            const SizedBox(height: 12),
            _ResultLine(
              label: 'Current total',
              value: formatAmount(gap.totalCurrentIntake) + ' ' + unit,
            ),
            _ResultLine(
              label: gap.targetMet ? 'Status' : 'Uncovered nutrition gap',
              value: gap.targetMet
                  ? 'Target met or exceeded'
                  : formatAmount(gap.uncoveredGap) + ' ' + unit,
            ),
            const SizedBox(height: 8),
            Text(
              'Safety check: ' +
                  selectedItem.upperLimit +
                  '. ' +
                  selectedItem.upperLimitScope,
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'If the patient has a documented deficiency, malabsorption, CKD, prematurity, pregnancy, or another clinical indication, use the indication-specific treatment pathway instead of this nutrition-gap tool.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.error,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResultLine extends StatelessWidget {
  const _ResultLine({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          const SizedBox(width: 10),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w900),
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
