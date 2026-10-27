import '../domain/iv_infusion_rate_engine.dart';
import 'iv_infusion_rate_profiles.dart';
import 'iv_norepinephrine_workflow.dart';
import 'iv_guided_preparation_options.dart';

/// Only continuous infusions with an explicitly reviewed final concentration.
/// A source-locked profile is not a patient-specific order or a generic
/// authorization to prepare the same amount in a different bag size.
class IvInfusionPreparation {
  const IvInfusionPreparation({
    required this.id,
    required this.drug,
    required this.label,
    required this.nominalMcgPerMl,
    required this.orderUnits,
    required this.instructions,
    required this.safety,
    required this.sourceUrl,
    this.isManufacturerNominal = false,
    this.readyToUse = false,
  });

  final String id;
  final String drug;
  final String label;
  final double nominalMcgPerMl;
  final List<IvOrderedRateUnit> orderUnits;
  final String instructions;
  final String safety;
  final String sourceUrl;
  final bool isManufacturerNominal;
  final bool readyToUse;
}

const _norepiUnits = [
  IvOrderedRateUnit.mcgPerKgMin,
  IvOrderedRateUnit.mcgPerMin,
];
const _mgHrUnits = [IvOrderedRateUnit.mgPerHour];
const _esmololUnits = [IvOrderedRateUnit.mcgPerKgMin];
const _nitroUnits = [IvOrderedRateUnit.mcgPerMin];
const _labetalolUnits = [
  IvOrderedRateUnit.mgPerMin,
  IvOrderedRateUnit.mgPerHour,
];

/// These records deliberately exclude NICU/PICU, intermittent IV pushes,
/// unreviewed concentrate strengths and salt/base assumptions.
final ivUnifiedInfusionPreparations = <IvInfusionPreparation>[
  for (final old in ivInfusionRateProfiles)
    IvInfusionPreparation(
      id: old.id,
      drug: switch (old.id) {
        'cardene-iv-final-100mcg-ml' => 'Nicardipine',
        'cleviprex-rtu-500mcg-ml' => 'Clevidipine',
        'brevibloc-rtu-10mg-ml' => 'Esmolol',
        'norepinephrine-concentrate-final-4mcg-ml' => 'Norepinephrine',
        'nitroglycerin-final-100mcg-ml' => 'Nitroglycerin',
        _ => 'Unreviewed',
      },
      label: old.name,
      nominalMcgPerMl: old.finalMicrogramsPerMilliliter,
      orderUnits: switch (old.orderedUnit) {
        IvOrderedRateUnit.mcgPerKgMin => _norepiUnits,
        IvOrderedRateUnit.mgPerHour => _mgHrUnits,
        IvOrderedRateUnit.mcgPerMin => _nitroUnits,
        _ => [old.orderedUnit],
      },
      instructions: old.presentation,
      safety: old.preparationLock + ' ' + old.compatibilityLock,
      sourceUrl: old.sourceUrl,
      isManufacturerNominal:
          old.id == 'norepinephrine-concentrate-final-4mcg-ml',
      readyToUse: old.id == 'cleviprex-rtu-500mcg-ml' ||
          old.id == 'brevibloc-rtu-10mg-ml',
    ),
  for (final p in reviewedAdultNorepinephrinePresentations)
    if (p.readyToUse)
      IvInfusionPreparation(
        id: p.id,
        drug: 'Norepinephrine',
        label: p.name,
        nominalMcgPerMl: p.nominalFinalMcgPerMl,
        orderUnits: _norepiUnits,
        instructions: p.preparation,
        safety: p.safety,
        sourceUrl: p.sourceUrl,
        readyToUse: true,
      ),
  for (final recipe in dilutionRecipesFor('Labetalol', 'General'))
    IvInfusionPreparation(
      id: recipe.id,
      drug: 'Labetalol',
      label: recipe.label,
      nominalMcgPerMl: recipe.finalMgPerMl * 1000,
      orderUnits: _labetalolUnits,
      instructions: 'Stock: ${recipe.stockAmountMg} mg in '
          '${recipe.stockVolumeMl} mL. ADD '
          '${recipe.addedDiluentMl} mL compatible fluid. '
          'FINAL: ${recipe.finalVolumeMl} mL.',
      safety: recipe.safety + ' ' + recipe.diluent,
      sourceUrl: recipe.sourceUrl,
    ),
];

List<String> get ivUnifiedInfusionDrugNames {
  final names = ivUnifiedInfusionPreparations.map((p) => p.drug).toSet().toList()
    ..remove('Unreviewed')
    ..sort();
  return names;
}

List<IvInfusionPreparation> ivUnifiedPreparationsFor(String drug) =>
    ivUnifiedInfusionPreparations
        .where((p) => p.drug == drug).toList(growable: false);

List<IvOrderedRateUnit> ivApprovedOrderUnits(String drug) =>
    switch (drug) {
      'Norepinephrine' => _norepiUnits,
      'Nicardipine' || 'Clevidipine' => _mgHrUnits,
      'Esmolol' => _esmololUnits,
      'Nitroglycerin' => _nitroUnits,
      'Labetalol' => _labetalolUnits,
      _ => const [],
    };
