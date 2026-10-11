import 'package:flutter/material.dart';
import '../../iv_prep/data/iv_preparation_profiles.dart';
import '../../iv_prep/data/iv_fluid_evidence.dart';
import '../domain/iv_dilution_calculator_engine.dart';
import '../domain/iv_labetalol_route_engine.dart';
import '../../iv_prep/data/iv_adult_dose_regimens.dart';
import '../../iv_prep/presentation/iv_adult_dose_guide_panel.dart';
import 'iv_labetalol_injection_calculator.dart';

class IvDilutionCalculatorScreen extends StatefulWidget {
  const IvDilutionCalculatorScreen({super.key, this.initialProfile});
  final IvPreparationProfile? initialProfile;

  @override
  State<IvDilutionCalculatorScreen> createState() => _IvDilutionState();
}

class _IvDilutionState extends State<IvDilutionCalculatorScreen> {
  final vialQuantity = TextEditingController();
  final vialMl = TextEditingController();
  final prescribedQuantity = TextEditingController();
  final fluidMl = TextEditingController();
  final prescribedRate = TextEditingController();
  int selected = ivPreparationProfiles.indexWhere(
    (p) => p.population == 'General' && p.name == 'Nicardipine',
  );
  int presentation = 0;
  IvFluid fluid = IvFluid.normalSaline;
  IvVolumeEntryMode volumeMode = IvVolumeEntryMode.addFluidToDrug;
  bool confirmed = false;
  bool rateConfirmed = false;
  bool localPreparationVerified = false;
  String? selectedDoseRegimen;

  @override
  void initState() {
    super.initState();
    final initial = widget.initialProfile;
    if (initial != null) {
      final matched = ivPreparationProfiles.indexWhere(
        (p) => p.name == initial.name && p.population == initial.population,
      );
      if (matched >= 0) selected = matched;
    }
  }

  @override
  void dispose() {
    for (final c in [
      vialQuantity, vialMl, prescribedQuantity, fluidMl, prescribedRate,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  void reset() {
    for (final c in [
      vialQuantity, vialMl, prescribedQuantity, fluidMl, prescribedRate,
    ]) {
      c.clear();
    }
    confirmed = false;
    rateConfirmed = false;
    localPreparationVerified = false;
    selectedDoseRegimen = null;
  }

  void invalidate() => setState(() {
        confirmed = false;
        rateConfirmed = false;
        localPreparationVerified = false;
      });

  @override
  Widget build(BuildContext context) {
    final profile = ivPreparationProfiles[selected];
    final labetalol = profile.population == 'General' &&
        profile.name == 'Labetalol';
    final selectedRegimens = reviewedAdultIvDoseRegimens(
      name: profile.name, population: profile.population,
    ).where((r) => r.id == selectedDoseRegimen).toList();
    final currentDoseRegimen = selectedRegimens.isEmpty
        ? null
        : selectedRegimens.first;
    final slowLabetalol = labetalol &&
        currentDoseRegimen?.method == IvAdministrationMethod.slowInjection;
    final labetalolInfusion = labetalol &&
        currentDoseRegimen?.id == 'labetalol-continuous-infusion';
    final variants = profile.calculatorVariants;
    final variant = variants.isEmpty ? null : variants[presentation];
    final evidence = reviewedIvFluidEvidence(
      name: profile.name, population: profile.population, fluid: fluid,
    );
    final hardLock = evidence.status ==
            IvFluidEvidenceStatus.incompatibleDiluent ||
        evidence.status == IvFluidEvidenceStatus.coadministrationOnly ||
        (profile.population == 'General' &&
            (profile.name == 'Clevidipine' || profile.name == 'Esmolol'));
    final stockAmount = double.tryParse(vialQuantity.text.trim());
    final stockVolume = double.tryParse(vialMl.text.trim());
    final doseAmount = double.tryParse(prescribedQuantity.text.trim());
    final requestedFluid = double.tryParse(fluidMl.text.trim());
    final plan = confirmed && !hardLock && variant != null &&
            stockAmount != null && stockVolume != null &&
            doseAmount != null && requestedFluid != null
        ? calculateVerifiedIvDilution(
            ampouleAmount: stockAmount,
            ampouleVolumeMl: stockVolume,
            orderedTotalAmount: doseAmount,
            verifiedStrengthPerMl: variant.concentration,
            volumeMl: requestedFluid,
            volumeMode: volumeMode,
          )
        : null;
    final cardene = profile.population == 'General' &&
        profile.name == 'Nicardipine';
    final exactCardene = cardene && plan != null &&
        stockAmount != null && stockVolume != null &&
        doseAmount != null &&
        matchesCardeneIvLabelRecipe(
          ampouleAmountMg: stockAmount,
          ampouleVolumeMl: stockVolume,
          orderedAmountMg: doseAmount,
          addedFluidMl: plan.addedFluidMl,
          finalVolumeMl: plan.finalVolumeMl,
        ) &&
        evidence.status == IvFluidEvidenceStatus.verifiedDiluent;
    final nitroglycerin = profile.population == 'General' &&
        profile.name == 'Nitroglycerin';
    final exactNitroglycerin = nitroglycerin && plan != null &&
        stockAmount != null && stockVolume != null &&
        doseAmount != null &&
        matchesNitroglycerinLabelRecipe(
          ampouleAmountMg: stockAmount,
          ampouleVolumeMl: stockVolume,
          orderedAmountMg: doseAmount,
          addedFluidMl: plan.addedFluidMl,
          finalVolumeMl: plan.finalVolumeMl,
        ) &&
        evidence.status == IvFluidEvidenceStatus.verifiedDiluent;
    // These regimens are continuous, titrated, bolus, or procedure-specific:
    // a user-entered bag duration must NEVER be silently treated as
    // a drug-specific administration instruction.
    const noGenericInfusionTime = <String>{
      'Norepinephrine', 'Epinephrine', 'Dopamine', 'Dobutamine',
      'Sodium nitroprusside', 'Heparin', 'Regular insulin infusion',
      'Insulin', 'Adenosine', 'Tenecteplase', 'Alteplase',
      'Dexmedetomidine', 'Propofol',
      'Labetalol', 'Esmolol', 'Clevidipine',
    };
    final mustUseProtocolRate = noGenericInfusionTime.contains(profile.name);
    final labetalolRecipe = labetalolInfusion && plan != null &&
            variant != null && doseAmount != null
        ? classifyLabetalolInfusionRecipe(
            stockConcentrationMgPerMl: variant.concentration,
            selectedAmountMg: doseAmount,
            withdrawnMl: plan.withdrawalMl,
            addedDiluentMl: plan.addedFluidMl,
            finalVolumeMl: plan.finalVolumeMl,
          )
        : LabetalolInfusionRecipeStatus.localProtocolOnly;
    final labelLabetalol = labetalolInfusion && plan != null &&
        evidence.status == IvFluidEvidenceStatus.verifiedDiluent &&
        labetalolRecipe != LabetalolInfusionRecipeStatus.localProtocolOnly;
    final labetalolNonstandardMathEligible = labetalolInfusion &&
        !labelLabetalol && plan != null &&
        evidence.status == IvFluidEvidenceStatus.verifiedDiluent;
    final orderedRate = double.tryParse(prescribedRate.text.trim());
    final pump = !rateConfirmed || plan == null || orderedRate == null
        ? null
        : labelLabetalol
            ? labetalolOrderedInfusionMlPerHour(
                prescribedMgPerMinute: orderedRate,
                verifiedFinalMgPerMl: plan.finalStrengthPerMl,
              )
        : labetalolNonstandardMathEligible
            ? calculateLocallyVerifiedLabetalolRateMathOnly(
                prescribedMgPerMinute: orderedRate,
                calculatedFinalMgPerMl: plan.finalStrengthPerMl,
                localPreparationVerified: localPreparationVerified,
              )
        : exactCardene
            ? orderedRate.isFinite && orderedRate > 0
                ? orderedRate / plan.finalStrengthPerMl
                : null
            : exactNitroglycerin
                ? calculateOrderedMcgPerMinutePump(
                    orderedMcgPerMin: orderedRate,
                    finalMgPerMl: plan.finalStrengthPerMl,
                  )
                : !cardene && !nitroglycerin && !mustUseProtocolRate
                    ? calculateOrderedDurationPumpRate(
                        finalVolumeMl: plan.finalVolumeMl,
                        orderedDurationMinutes: orderedRate,
                      )
                    : null;
    final titleStyle = Theme.of(context).textTheme.titleMedium
        ?.copyWith(fontWeight: FontWeight.w900);
    return Scaffold(
      appBar: AppBar(title: const Text('IV dilution · حاسبة التخفيف')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 30),
        children: [
          const _Alert(
            'HIGH ALERT: Arithmetic ONLY. No dose, route, diluent, '
            'infusion time or concentration is clinically prescribed '
            'by this calculator. Verify product, source, drug order, '
            'fluid, stability and infusion protocol independently.',
          ),
          const SizedBox(height: 10),
          Text('1 · اختر الدواء وتركيز الأمبولة', style: titleStyle),
          const SizedBox(height: 10),
          DropdownButtonFormField<int>(
            key: ValueKey('dilution-product-$selected'),
            initialValue: selected,
            isExpanded: true,
            decoration: const InputDecoration(
              labelText: 'IV drug / patient population',
              border: OutlineInputBorder(),
            ),
            items: [
              for (var i = 0; i < ivPreparationProfiles.length; i++)
                DropdownMenuItem(
                  value: i,
                  child: Text(
                    ivPreparationProfiles[i].name + ' · ' +
                        ivPreparationProfiles[i].population,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
            onChanged: (i) {
              if (i == null) return;
              setState(() {
                selected = i;
                presentation = 0;
                reset();
              });
            },
          ),
          if (variants.length > 1) ...[
            const SizedBox(height: 10),
            DropdownButtonFormField<int>(
              key: ValueKey('dilution-vial-$selected-$presentation'),
              initialValue: presentation,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Exact vial / formulation',
                border: OutlineInputBorder(),
              ),
              items: [
                for (var i = 0; i < variants.length; i++)
                  DropdownMenuItem(
                    value: i,
                    child: Text(
                      variants[i].label,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
              onChanged: (i) {
                if (i == null) return;
                setState(() {
                  presentation = i;
                  reset();
                });
              },
            ),
          ],
          _Info('Verified formulation', profile.formulation),
          _Info('Reconstitution', profile.reconstitution),
          _Info('Specific dilution / formulation rules', profile.furtherDilution),
          _Info('Administration rules', profile.administration),
          IvAdultDoseGuidePanel(
            drugName: profile.name,
            population: profile.population,
            selectedId: selectedDoseRegimen,
            onChanged: (id) => setState(() {
              selectedDoseRegimen = id;
              localPreparationVerified = false;
              for (final c in [
                vialQuantity, vialMl, prescribedQuantity,
                fluidMl, prescribedRate,
              ]) {
                c.clear();
              }
              confirmed = false;
              rateConfirmed = false;
            }),
          ),
          if (labetalol && currentDoseRegimen == null)
            const _Alert(
              'Choose adult Labetalol INITIAL slow IV injection, '
              'REPEATED slow IV injection, or continuous infusion '
              'above. Injection and infusion calculations '
              'MUST NOT share a preparation pathway.',
            ),
          if (slowLabetalol)
            IvLabetalolInjectionCalculator(
              key: ValueKey(selectedDoseRegimen),
              stage: currentDoseRegimen!.id ==
                      'labetalol-initial-injection'
                  ? LabetalolInjectionStage.initial
                  : LabetalolInjectionStage.additional,
            ),
          if (!labetalol || labetalolInfusion) ...[
          if (variant == null)
            const _Alert(
              'Calculation LOCKED: exact verified stock concentration '
              'is unavailable for this presentation.',
            )
          else
            _Info(
              'Verified stock',
              _fmt(variant.concentration) + ' ' +
                  variant.unit + '/mL · ' + variant.note,
            ),
          const SizedBox(height: 12),
          Text('2 · أدخل كمية الدواء والفلود', style: titleStyle),
          _Numeric(
            key: const ValueKey('dilution-vial-quantity'),
            label: 'Amount per vial (' + (variant?.unit ?? 'unit') + ')',
            controller: vialQuantity, changed: invalidate,
          ),
          _Numeric(
            key: const ValueKey('dilution-vial-volume'),
            label: 'Stock vial / reconstituted volume (mL)',
            controller: vialMl, changed: invalidate,
          ),
          _Numeric(
            key: const ValueKey('dilution-ordered-quantity'),
            label: 'Already ORDERED drug amount (' +
                (variant?.unit ?? 'unit') + ')',
            controller: prescribedQuantity, changed: invalidate,
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<IvFluid>(
            key: ValueKey('dilution-fluid-' + fluid.name),
            initialValue: fluid,
            isExpanded: true,
            decoration: const InputDecoration(
              labelText: 'Selected fluid type',
              border: OutlineInputBorder(),
            ),
            items: [
              for (final f in IvFluid.values)
                DropdownMenuItem(value: f, child: Text(f.label)),
            ],
            onChanged: (f) {
              if (f == null) return;
              setState(() {
                fluid = f;
                confirmed = false;
                rateConfirmed = false;
                localPreparationVerified = false;
              });
            },
          ),
          const SizedBox(height: 10),
          _Alert(
            evidence.status == IvFluidEvidenceStatus.incompatibleDiluent
                ? 'INCOMPATIBLE / BLOCKED. ' + evidence.explanation
                : evidence.status == IvFluidEvidenceStatus.coadministrationOnly
                    ? 'CO-ADMINISTRATION ONLY: NOT a diluent. Blocked. '
                        + evidence.explanation
                    : evidence.status == IvFluidEvidenceStatus.unknown
                        ? 'UNKNOWN compatibility: arithmetic only, NOT an '
                          'approved preparation. Verify exact manufacturer '
                          'and diluent. ' + evidence.explanation
                        : 'Label-supported diluent for EXACT manufacturer '
                          'recipe, NOT blanket compatibility. '
                          + evidence.explanation,
          ),
          const SizedBox(height: 10),
          SegmentedButton<IvVolumeEntryMode>(
            segments: const [
              ButtonSegment(
                value: IvVolumeEntryMode.addFluidToDrug,
                label: Text('Added fluid'),
              ),
              ButtonSegment(
                value: IvVolumeEntryMode.finalVolumeTarget,
                label: Text('Final total'),
              ),
            ],
            selected: {volumeMode},
            onSelectionChanged: (s) => setState(() {
              volumeMode = s.first;
              confirmed = false;
              rateConfirmed = false;
              localPreparationVerified = false;
            }),
          ),
          const SizedBox(height: 7),
          Text(volumeMode == IvVolumeEntryMode.addFluidToDrug
              ? 'الحجم النهائي = الفلود المضاف + حجم الدواء'
              : 'الفلود المضاف = الحجم النهائي − حجم الدواء'),
          _Numeric(
            key: const ValueKey('dilution-fluid-quantity'),
            label: volumeMode == IvVolumeEntryMode.addFluidToDrug
                ? 'Fluid to ADD (mL)'
                : 'Desired FINAL total volume (mL)',
            controller: fluidMl, changed: invalidate,
          ),
          CheckboxListTile(
            key: const ValueKey('dilution-check-stock'),
            controlAffinity: ListTileControlAffinity.leading,
            value: confirmed,
            onChanged: variant == null || hardLock
                ? null
                : (v) => setState(() {
                      confirmed = v ?? false;
                      rateConfirmed = false;
                      localPreparationVerified = false;
                    }),
            title: const Text(
              'Verified prescribed dose, unit, exact vial identity '
              'and source-locked stock concentration.',
            ),
          ),
          if (hardLock)
            const _Alert(
              'STOP: this ready-to-use presentation or incompatible '
              'fluid cannot be diluted by this calculator.',
            ),
          if (confirmed && plan == null && !hardLock)
            const _Alert(
              'No result: entered amount ÷ vial mL must match '
              'VERIFIED stock concentration; volume/quantity must '
              'be positive and final volume large enough.',
            ),
          if (plan != null && variant != null) ...[
            if (labetalolInfusion &&
                evidence.status == IvFluidEvidenceStatus.verifiedDiluent)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        labelLabetalol
                            ? 'LABEL-SUPPORTED EXAMPLE · وصفة مذكورة بالنشرة'
                            : 'NON-LABEL RECIPE · يحتاج تحقق محلي',
                        style: const TextStyle(fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        labelLabetalol
                            ? labetalolRecipe ==
                                    LabetalolInfusionRecipeStatus.labelFinal200Ml
                                ? 'Example A: 200 mg / 200 mL final '
                                  '= 1 mg/mL.'
                                : 'Example B: 200 mg / 290 mL final '
                                  '= 0.689655 mg/mL (calculated).'
                            : 'Your numbers are mathematically valid, '
                              'but final concentration, fluid and '
                              'beyond-use time require local pharmacist '
                              'validation before clinical use.',
                      ),
                      const SizedBox(height: 7),
                      const Text(
                        'If a pump is unavailable: the labetalol label '
                        'describes a controlled graduated burette OR '
                        'mechanical infusion pump. This is NOT approval '
                        'for uncontrolled gravity drip, estimated '
                        'drops/min or other high-alert medications. '
                        'Use only an institutional approved method with '
                        'BP/heart-rate monitoring.',
                      ),
                    ],
                  ),
                ),
              ),
            Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Calculation results · النتائج', style: titleStyle),
                    _Result('الدواء المسحوب', _fmt(plan.withdrawalMl) + ' mL'),
                    _Result('Minimum vial equivalents',
                        plan.minimumContainerCount.toString()),
                    _Result('الفلود المضاف',
                        _fmt(plan.addedFluidMl) + ' mL'),
                    _Result('الحجم النهائي',
                        _fmt(plan.finalVolumeMl) + ' mL'),
                    _Result('التركيز النهائي',
                        _fmt(plan.finalStrengthPerMl) +
                            ' ' + variant.unit + '/mL'),
                    const SizedBox(height: 5),
                    const Text('Mathematical output, NOT approved dilution.'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            if (labetalolNonstandardMathEligible) ...[
              const _Alert(
                'UNVALIDATED LABETALOL PREPARATION: This mixture does NOT '
                'match the labeled 200 mg (40 mL stock) + 160 mL fluid = '
                '200 mL FINAL, 1 mg/mL example. Label stability testing '
                'does not establish safety of every other concentration. '
                'Do NOT prepare or administer until an independent '
                'pharmacist confirms this exact formulation and '
                'institutional compounding/infusion protocol.',
              ),
              const SizedBox(height: 8),
              Text(
                '3 · حساب معدل المضخة · mL/hr (رياضيات فقط)',
                style: titleStyle,
              ),
              const SizedBox(height: 7),
              const Text(
                'Only enter the actual physician-ORDERED continuous '
                'infusion rate in mg/min. The calculated mL/hr is '
                'NOT a verified or authorized pump setting.',
              ),
              _Numeric(
                key: const ValueKey('dilution-prescribed-rate'),
                label: 'Physician-ordered continuous infusion (mg/min)',
                controller: prescribedRate,
                changed: () => setState(() {
                  rateConfirmed = false;
                }),
              ),
              CheckboxListTile(
                key: const ValueKey('labetalol-local-preparation-verified'),
                value: localPreparationVerified,
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text(
                  'A pharmacist independently validated this EXACT '
                  'non-label-standard preparation, final concentration, '
                  'compatible fluid and stability under local protocol.',
                ),
                onChanged: (value) => setState(() {
                  localPreparationVerified = value ?? false;
                  rateConfirmed = false;
                }),
              ),
              CheckboxListTile(
                key: const ValueKey('dilution-check-rate'),
                value: rateConfirmed,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: !localPreparationVerified
                    ? null
                    : (value) => setState(
                        () => rateConfirmed = value ?? false,
                      ),
                title: const Text(
                  'I checked the actual prescribed mg/min rate, '
                  'continuous infusion route, final mixed volume '
                  'and hospital pump protocol.',
                ),
              ),
              if (pump != null && pump.isFinite && pump > 0)
                Card(
                  color: Theme.of(context).colorScheme.errorContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'ARITHMETIC ONLY · حساب رياضي وليس موافقة سريرية',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        Text(
                          _fmt(pump) + ' mL/hr',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w900),
                        ),
                        const Text(
                          'NOT an approved dilution or pump instruction. '
                          'Independent hospital verification is required.',
                        ),
                      ],
                    ),
                  ),
                ),
            ] else if (labetalol && !labelLabetalol)
              const _Alert(
                'LABETALOL: two different label examples are available: '
                '200 mg + 160 mL fluid = 200 mL FINAL, or '
                '200 mg + 250 mL fluid = 290 mL FINAL. '
                'Other volumes require product-specific independent review '
                'before infusion rate arithmetic is permitted.',
              )
            else if (cardene && !exactCardene)
              const _Alert(
                'CARDENE IV product-specific lock: label recipe is '
                '25 mg/10 mL + 240 mL compatible fluid = '
                '250 mL FINAL at 0.1 mg/mL. Pump rate disabled.',
              )
            else if (nitroglycerin && !exactNitroglycerin)
              const _Alert(
                'NITROGLYCERIN 5 mg/mL concentrate lock: 50 mg '
                'in 500 mL FINAL (q.s.) with D5W or 0.9% NaCl gives '
                '100 mcg/mL. No pump rate for other preparations here.',
              )
            else if (mustUseProtocolRate)
              const _Alert(
                'NO GENERIC DURATION RATE: this high-alert medication '
                'requires a validated drug/route-specific ordered infusion '
                'protocol. Use the dedicated infusion calculator where '
                'an exact final concentration is available.',
              )
            else ...[
              Text('3 · ريت إعطاء الجرعة الموصوفة', style: titleStyle),
              const SizedBox(height: 7),
              _Alert(
                labelLabetalol
                    ? labetalolRecipe ==
                            LabetalolInfusionRecipeStatus.labelFinal200Ml
                        ? 'LABEL EXAMPLE A: 200 mg labetalol + 160 mL '
                          'compatible IV fluid = 200 mL FINAL '
                          'at 1 mg/mL. Enter prescribed mg/min; '
                          'the app does not select a therapeutic rate.'
                        : 'LABEL EXAMPLE B: 200 mg labetalol + 250 mL '
                          'compatible IV fluid = 290 mL FINAL '
                          '(exact 0.689655 mg/mL, approximately 2 mg/3 mL). '
                          'Enter prescribed mg/min; do not assume '
                          '3 mL/min delivers EXACTLY 2 mg/min.'
                    : exactCardene
                    : exactCardene
                    ? 'CARDENE IV exact final concentration: '
                      'enter already PRESCRIBED mg/hour (NOT dose selection).'
                    : exactNitroglycerin
                        ? 'NITROGLYCERIN exact 100 mcg/mL final '
                          'preparation: enter already PRESCRIBED mcg/min. '
                          'Use the specified nonabsorbing tubing/set.'
                        : 'Only enter minutes if an INTERMITTENT infusion '
                      'duration was ordered and independently approved '
                      'for THIS exact medicine. No calculation authorizes '
                      'IV push, continuous titration or unknown infusion time.',
              ),
              _Numeric(
                key: const ValueKey('dilution-prescribed-rate'),
                label: labelLabetalol
                    ? 'Already PRESCRIBED infusion rate (mg/min)'
                    : exactCardene
                    ? 'Already PRESCRIBED rate (mg/hr)'
                    : exactNitroglycerin
                        ? 'Already PRESCRIBED rate (mcg/min)'
                        : 'Already PRESCRIBED infusion duration (minutes)',
                controller: prescribedRate,
                changed: () =>
                    setState(() => rateConfirmed = false),
              ),
              CheckboxListTile(
                key: const ValueKey('dilution-check-rate'),
                value: rateConfirmed,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (v) => setState(() => rateConfirmed = v ?? false),
                title: const Text(
                  'Verified prescription, IV infusion route, '
                  'label/local rate instructions, final preparation '
                  'and pump library independently.',
                ),
              ),
              if (pump != null && pump.isFinite && pump > 0)
                Card(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Calculated rate · فقط حساب رياضي'),
                        Text(
                          _fmt(pump) + ' mL/hr',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w900),
                        ),
                        const Text(
                          'NOT authorization to set the infusion pump. '
                          'Independent verification remains mandatory.',
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ],
          ],
          for (final lock in profile.criticalLocks) _Alert(lock),
          _Info('Fluid details', profile.allowedDiluents),
          _Info('Stability / BUD', profile.stability),
          _Info('Incompatibilities', profile.incompatibilities),
          _Info('Product source', profile.sourceLabel),
        ],
      ),
    );
  }

  static String _fmt(double v) {
    if (v > 0 && v < 0.000001) return v.toStringAsExponential(3);
    var s = v.toStringAsFixed(v < 1 ? 6 : 3);
    if (s.contains('.')) {
      while (s.endsWith('0')) {
        s = s.substring(0, s.length - 1);
      }
      if (s.endsWith('.')) s = s.substring(0, s.length - 1);
    }
    return s;
  }
}

class _Numeric extends StatelessWidget {
  const _Numeric({
    super.key, required this.label,
    required this.controller, required this.changed,
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
            labelText: label, border: const OutlineInputBorder(),
          ),
          onChanged: (_) => changed(),
        ),
      );
}

class _Info extends StatelessWidget {
  const _Info(this.label, this.content);
  final String label;
  final String content;
  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(height: 5),
              Text(content),
            ],
          ),
        ),
      );
}

class _Alert extends StatelessWidget {
  const _Alert(this.content);
  final String content;
  @override
  Widget build(BuildContext context) => Card(
        color: Theme.of(context).colorScheme.errorContainer,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(content),
        ),
      );
}

class _Result extends StatelessWidget {
  const _Result(this.label, this.content);
  final String label;
  final String content;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Expanded(child: Text(label)),
            Flexible(
              child: Text(
                content, textAlign: TextAlign.end,
                style: const TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      );
}
