/// A deliberately small, audited library of labeled example doses.
/// These are references to compare against an independently prescribed order,
/// never orders generated from the patient's indication alone.
enum IvGuidedDoseBasis { fixedMg, mgPerKg }

class IvGuidedDoseOption {
  const IvGuidedDoseOption({
    required this.id,
    required this.drug,
    required this.indication,
    required this.label,
    required this.basis,
    required this.amount,
    required this.preparation,
    required this.safety,
    required this.sourceUrl,
    this.minWeightKg,
    this.maxWeightKgExclusive,
    this.maxSingleDoseMg,
  });

  final String id;
  final String drug;
  final String indication;
  final String label;
  final IvGuidedDoseBasis basis;
  final double amount;
  final double? minWeightKg; // inclusive
  final double? maxWeightKgExclusive;
  final double? maxSingleDoseMg;
  final String preparation;
  final String safety;
  final String sourceUrl;

  bool get requiresWeight =>
      basis == IvGuidedDoseBasis.mgPerKg ||
      minWeightKg != null ||
      maxWeightKgExclusive != null;

  double? doseMg({double? weightKg}) {
    if (requiresWeight &&
        (weightKg == null || !weightKg.isFinite || weightKg <= 0)) {
      return null;
    }
    if (weightKg != null && (!weightKg.isFinite || weightKg <= 0)) {
      return null;
    }
    if (minWeightKg != null && weightKg! < minWeightKg!) {
      return null;
    }
    if (maxWeightKgExclusive != null &&
        weightKg! >= maxWeightKgExclusive!) {
      return null;
    }
    final calculated = basis == IvGuidedDoseBasis.fixedMg
        ? amount
        : amount * weightKg!;
    if (!calculated.isFinite || calculated <= 0) {
      return null;
    }
    return maxSingleDoseMg != null && calculated > maxSingleDoseMg!
        ? maxSingleDoseMg
        : calculated;
  }
}

const _acetaminophenSource =
    'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=7243bf2c-2c44-4dff-8a9e-d788d31dca86';
const _ondansetronSource =
    'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=bb4bc810-db26-471b-9ce7-6e2fb3018af0';
const _amiodaroneSource =
    'https://www.dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=6cd870d7-6381-421a-89bc-bce5c9518219';
const _nicardipineSource =
    'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=5749599d-ff2a-42e4-aa72-cd25013feee8';
const _labetalolSource =
    'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=502bb655-9ad8-481b-9e26-1dec8adef471';

const ivGuidedAdultDoseOptions = <IvGuidedDoseOption>[
  IvGuidedDoseOption(
    id: 'apap-50plus-1000q6', drug: 'IV Paracetamol',
    indication: 'Pain / fever · adults and adolescents age 13+',
    label: 'At least 50 kg: 1,000 mg every 6 hours',
    basis: IvGuidedDoseBasis.fixedMg, amount: 1000, minWeightKg: 50,
    preparation: 'Ready 10 mg/mL: full 100 mL for a verified 1,000 mg dose; IV infusion over 15 minutes.',
    safety: 'Verify age 13+, weight at least 50 kg, liver risk, actual order, and TOTAL acetaminophen from all routes (maximum labeled 4,000 mg/24 h).',
    sourceUrl: _acetaminophenSource,
  ),
  IvGuidedDoseOption(
    id: 'apap-50plus-650q4', drug: 'IV Paracetamol',
    indication: 'Pain / fever · adults and adolescents age 13+',
    label: 'At least 50 kg: 650 mg every 4 hours',
    basis: IvGuidedDoseBasis.fixedMg, amount: 650, minWeightKg: 50,
    preparation: 'Ready 10 mg/mL: transfer 65 mL into a separate sterile container; infuse over 15 minutes.',
    safety: 'Verify age 13+, weight at least 50 kg, liver risk, actual order, and TOTAL acetaminophen from all routes (maximum labeled 4,000 mg/24 h).',
    sourceUrl: _acetaminophenSource,
  ),
  IvGuidedDoseOption(
    id: 'apap-under50-15q6', drug: 'IV Paracetamol',
    indication: 'Pain / fever · adults and adolescents age 13+',
    label: 'Below 50 kg: 15 mg/kg every 6 hours',
    basis: IvGuidedDoseBasis.mgPerKg, amount: 15,
    maxWeightKgExclusive: 50, maxSingleDoseMg: 750,
    preparation: 'Ready 10 mg/mL: transfer calculated volume to a separate sterile container; infuse over 15 minutes.',
    safety: 'Verify age 13+, weight below 50 kg, ordered dosing weight, liver risk and all-route total (max 75 mg/kg/day, up to 3,750 mg/day).',
    sourceUrl: _acetaminophenSource,
  ),
  IvGuidedDoseOption(
    id: 'apap-under50-12_5q4', drug: 'IV Paracetamol',
    indication: 'Pain / fever · adults and adolescents age 13+',
    label: 'Below 50 kg: 12.5 mg/kg every 4 hours',
    basis: IvGuidedDoseBasis.mgPerKg, amount: 12.5,
    maxWeightKgExclusive: 50, maxSingleDoseMg: 750,
    preparation: 'Ready 10 mg/mL: transfer calculated volume to a separate sterile container; infuse over 15 minutes.',
    safety: 'Verify age 13+, weight below 50 kg, ordered dosing weight, liver risk and all-route total (max 75 mg/kg/day, up to 3,750 mg/day).',
    sourceUrl: _acetaminophenSource,
  ),
  IvGuidedDoseOption(
    id: 'ondansetron-adult-ponv', drug: 'Ondansetron',
    indication: 'Prevention of postoperative nausea/vomiting · adults',
    label: '4 mg IV · postoperative pathway',
    basis: IvGuidedDoseBasis.fixedMg, amount: 4,
    preparation: '2 mg/mL stock: no routine dilution for this pathway; administer over at least 30 seconds, preferably 2–5 minutes.',
    safety: 'Not the chemotherapy pathway. Verify ordered dose, QT risk, interacting drugs and severe hepatic impairment (8 mg/day limit).',
    sourceUrl: _ondansetronSource,
  ),
  IvGuidedDoseOption(
    id: 'ondansetron-adult-chemo', drug: 'Ondansetron',
    indication: 'Prevention of chemotherapy-related nausea/vomiting · adults',
    label: '0.15 mg/kg per dose (maximum 16 mg/dose)',
    basis: IvGuidedDoseBasis.mgPerKg, amount: 0.15, maxSingleDoseMg: 16,
    preparation: 'Dilution REQUIRED: each dose in 50 mL D5W or 0.9% NaCl; infuse over 15 minutes. Label describes three doses 4 hours apart.',
    safety: 'Verify actual chemotherapy protocol, chosen dosing weight, QT risk, and severe hepatic impairment (8 mg/day limit). This is NOT postoperative preparation.',
    sourceUrl: _ondansetronSource,
  ),
  IvGuidedDoseOption(
    id: 'amiodarone-adult-vt-vf-load', drug: 'Amiodarone',
    indication: 'Refractory recurrent life-threatening VT/VF · adult labeled infusion',
    label: '150 mg INITIAL IV load over 10 minutes',
    basis: IvGuidedDoseBasis.fixedMg, amount: 150,
    preparation: '50 mg/mL CONCENTRATE: 150 mg (3 mL) into 100 mL D5W; infusion over 10 minutes, NOT rapid IV push.',
    safety: 'Not an arrest-bolus protocol and not a universal tachyarrhythmia dose. Confirm rhythm, order, route, ECG/BP and infusion container/line rules.',
    sourceUrl: _amiodaroneSource,
  ),
];

List<IvGuidedDoseOption> guidedDoseOptionsFor(
    String name, String population) {
  if (population != 'General') return const [];
  return ivGuidedAdultDoseOptions
      .where((item) => item.drug == name).toList(growable: false);
}

/// Exact manufacturer dilution examples with no patient dose selected.
/// Added diluent and FINAL volume must remain distinct.
class IvVerifiedDilutionRecipe {
  const IvVerifiedDilutionRecipe({
    required this.id,
    required this.drug,
    required this.label,
    required this.stockAmountMg,
    required this.stockVolumeMl,
    required this.addedDiluentMl,
    required this.diluent,
    required this.safety,
    required this.sourceUrl,
  });

  final String id;
  final String drug;
  final String label;
  final double stockAmountMg;
  final double stockVolumeMl;
  final double addedDiluentMl;
  final String diluent;
  final String safety;
  final String sourceUrl;

  double get finalVolumeMl => stockVolumeMl + addedDiluentMl;
  double get finalMgPerMl => stockAmountMg / finalVolumeMl;
}

const ivVerifiedDilutionRecipes = <IvVerifiedDilutionRecipe>[
  IvVerifiedDilutionRecipe(
    id: 'cardene-25-in-250', drug: 'Nicardipine',
    label: 'CARDENE 25 mg/10 mL → FINAL 250 mL',
    stockAmountMg: 25, stockVolumeMl: 10, addedDiluentMl: 240,
    diluent: 'Compatible labeled fluid, e.g. D5W or 0.9% NaCl',
    safety: 'CONCENTRATE must be diluted. If using a 250 mL bag, first remove 10 mL. Do not use LR or 5% sodium bicarbonate.',
    sourceUrl: _nicardipineSource,
  ),
  IvVerifiedDilutionRecipe(
    id: 'labetalol-200-in-200', drug: 'Labetalol',
    label: 'Labetalol 200 mg/40 mL → FINAL 200 mL',
    stockAmountMg: 200, stockVolumeMl: 40, addedDiluentMl: 160,
    diluent: 'Manufacturer-compatible fluid; verify exact product and institutional policy',
    safety: 'INFUSION only. Not the repeated-injection route. Infusion rate remains an independently prescribed order.',
    sourceUrl: _labetalolSource,
  ),
  IvVerifiedDilutionRecipe(
    id: 'labetalol-200-in-290', drug: 'Labetalol',
    label: 'Labetalol 200 mg/40 mL + 250 mL → FINAL 290 mL',
    stockAmountMg: 200, stockVolumeMl: 40, addedDiluentMl: 250,
    diluent: 'Manufacturer-compatible fluid; verify exact product and institutional policy',
    safety: 'Adding to 250 mL does NOT yield a 250 mL final mixture. Do not substitute the 1 mg/mL recipe.',
    sourceUrl: _labetalolSource,
  ),
];

List<IvVerifiedDilutionRecipe> dilutionRecipesFor(
    String name, String population) {
  if (population != 'General') return const [];
  return ivVerifiedDilutionRecipes
      .where((item) => item.drug == name).toList(growable: false);
}
