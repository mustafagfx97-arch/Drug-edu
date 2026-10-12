/// Source-audited product PRESENTATIONS, not a market-availability list.
/// Each entry is a documented manufacturer vial/reconstituted-stock package.
/// No entry here approves dilution fluid, BUD, final infusion concentration,
/// clinical dose, IV route, pump or Y-site use. Never add an assumed strength.
class IvAuditedStockPresentation {
  const IvAuditedStockPresentation({
    required this.id,
    required this.name,
    required this.unit,
    required this.vialAmount,
    required this.vialVolumeMl,
    required this.packageLabel,
    required this.sourceUrl,
    required this.safetyNote,
  });

  final String id;
  final String name;
  final String unit;
  final double vialAmount;
  final double vialVolumeMl;
  final String packageLabel;
  final String sourceUrl;
  final String safetyNote;

  double get concentrationPerMl => vialAmount / vialVolumeMl;
}

const ivAuditedAdultStockPresentations = <String, List<IvAuditedStockPresentation>>{
  'Dopamine': [
    IvAuditedStockPresentation(
      id: 'dopamine-hcl-hospira-200mg-5ml',
      name: 'Dopamine HCl · Hospira',
      unit: 'mg',
      vialAmount: 200,
      vialVolumeMl: 5,
      packageLabel: '200 mg/5 mL · 40 mg/mL',
      sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=38431050-007e-41b2-e063-6394a90a1d64',
      safetyNote: 'CONCENTRATE · MUST DILUTE. Dose basis is mg dopamine hydrochloride per label, not unconverted free-base mass.',
    ),
    IvAuditedStockPresentation(
      id: 'dopamine-hcl-hospira-400mg-10ml',
      name: 'Dopamine HCl · Hospira',
      unit: 'mg',
      vialAmount: 400,
      vialVolumeMl: 10,
      packageLabel: '400 mg/10 mL · 40 mg/mL',
      sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=38431050-007e-41b2-e063-6394a90a1d64',
      safetyNote: 'CONCENTRATE · MUST DILUTE. Distinct vial TOTAL from 200 mg/5 mL; verify the order and fluid.',
    ),
    IvAuditedStockPresentation(
      id: 'dopamine-hcl-400mg-5ml',
      name: 'Dopamine HCl · labelled 80 mg/mL presentation',
      unit: 'mg',
      vialAmount: 400,
      vialVolumeMl: 5,
      packageLabel: '400 mg/5 mL · 80 mg/mL',
      sourceUrl: 'https://www.dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=38431050-007e-41b2-e063-6394a90a1d64',
      safetyNote: 'CONCENTRATE · MUST DILUTE. Check manufacturer before selecting; 80 mg/mL is double the 40 mg/mL stock.',
    ),
    IvAuditedStockPresentation(
      id: 'dopamine-hcl-800mg-10ml',
      name: 'Dopamine HCl · labelled 80 mg/mL presentation',
      unit: 'mg',
      vialAmount: 800,
      vialVolumeMl: 10,
      packageLabel: '800 mg/10 mL · 80 mg/mL',
      sourceUrl: 'https://www.dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=38431050-007e-41b2-e063-6394a90a1d64',
      safetyNote: 'CONCENTRATE · MUST DILUTE. Confirm manufacturer and dose basis; do not use the 40 mg/mL withdrawal volume.',
    ),
  ],
  'Dobutamine': [
    IvAuditedStockPresentation(
      id: 'dobutamine-250mg-20ml',
      name: 'Dobutamine · Hospira 20 mL',
      unit: 'mg',
      vialAmount: 250,
      vialVolumeMl: 20,
      packageLabel: '250 mg/20 mL · 12.5 mg/mL',
      sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=dc537761-d5f4-488d-24ab-b2bcd2b17b7a',
      safetyNote: 'MUST DILUTE. As-labelled dobutamine-equivalent mg, supplied as hydrochloride; final dilution protocol is separate.',
    ),
    IvAuditedStockPresentation(
      id: 'dobutamine-500mg-40ml',
      name: 'Dobutamine · 40 mL single-dose vial',
      unit: 'mg',
      vialAmount: 500,
      vialVolumeMl: 40,
      packageLabel: '500 mg/40 mL · 12.5 mg/mL',
      sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=9794e9d0-c8b7-4d18-8cd1-15cc4f2a9a55',
      safetyNote: 'MUST DILUTE. Same per-mL concentration but a DIFFERENT total vial dose, product-specific source.',
    ),
  ],
  'Amiodarone': [
    IvAuditedStockPresentation(
      id: 'amiodarone-hcl-150mg-3ml',
      name: 'Amiodarone hydrochloride · single-dose vial',
      unit: 'mg',
      vialAmount: 150,
      vialVolumeMl: 3,
      packageLabel: '150 mg/3 mL · 50 mg/mL',
      sourceUrl: 'https://www.dailymed.nlm.nih.gov/dailymed/fda/fdaDrugXsl.cfm?setid=0a28ae25-7cc4-4ac0-a2ba-7820fb93e25c',
      safetyNote: 'Amiodarone HCl CONCENTRATE, further dilution required. Not a premixed infusion bag.',
    ),
    IvAuditedStockPresentation(
      id: 'amiodarone-hcl-450mg-9ml',
      name: 'Amiodarone hydrochloride · single-dose vial',
      unit: 'mg',
      vialAmount: 450,
      vialVolumeMl: 9,
      packageLabel: '450 mg/9 mL · 50 mg/mL',
      sourceUrl: 'https://www.dailymed.nlm.nih.gov/dailymed/fda/fdaDrugXsl.cfm?setid=0a28ae25-7cc4-4ac0-a2ba-7820fb93e25c',
      safetyNote: 'Amiodarone HCl CONCENTRATE. Distinguish 450 mg total from 150 mg total; label for glass/non-PVC use still applies.',
    ),
  ],
  'Heparin': [
    IvAuditedStockPresentation(
      id: 'heparin-1000usp-1ml',
      name: 'Heparin sodium · treatment vial',
      unit: 'units',
      vialAmount: 1000,
      vialVolumeMl: 1,
      packageLabel: '1,000 USP units/1 mL',
      sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=7014808d-cec9-4b2c-8eb5-940493e356ab',
      safetyNote: 'Treatment-strength heparin, NOT catheter flush. Check formulation/preservative and anticoagulation protocol.',
    ),
    IvAuditedStockPresentation(
      id: 'heparin-5000usp-1ml',
      name: 'Heparin sodium · treatment vial',
      unit: 'units',
      vialAmount: 5000,
      vialVolumeMl: 1,
      packageLabel: '5,000 USP units/1 mL',
      sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=7014808d-cec9-4b2c-8eb5-940493e356ab',
      safetyNote: 'Treatment-strength heparin, NOT flush. Confirm preservative and institutional infusion protocol.',
    ),
    IvAuditedStockPresentation(
      id: 'heparin-10000usp-1ml',
      name: 'Heparin sodium · treatment vial',
      unit: 'units',
      vialAmount: 10000,
      vialVolumeMl: 1,
      packageLabel: '10,000 USP units/1 mL',
      sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=7014808d-cec9-4b2c-8eb5-940493e356ab',
      safetyNote: 'HIGH ALERT · Tenfold error possible. Never use this treatment-strength presentation as line flush.',
    ),
  ],
  'Fosphenytoin': [
    IvAuditedStockPresentation(
      id: 'fosphenytoin-100mgpe-2ml',
      name: 'Fosphenytoin sodium · phenytoin equivalents',
      unit: 'mg PE',
      vialAmount: 100,
      vialVolumeMl: 2,
      packageLabel: '100 mg PE/2 mL · 50 mg PE/mL',
      sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=49b08648-6a83-42c7-ae7b-80c29f2534fc',
      safetyNote: 'Doses ALWAYS in mg phenytoin sodium equivalents (PE). 50 mg PE/mL is NOT total amount per vial.',
    ),
    IvAuditedStockPresentation(
      id: 'fosphenytoin-500mgpe-10ml',
      name: 'Fosphenytoin sodium · phenytoin equivalents',
      unit: 'mg PE',
      vialAmount: 500,
      vialVolumeMl: 10,
      packageLabel: '500 mg PE/10 mL · 50 mg PE/mL',
      sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=49b08648-6a83-42c7-ae7b-80c29f2534fc',
      safetyNote: 'Doses ALWAYS in mg PE. 10 mL vial contains 500 mg PE total, not 50 mg PE.',
    ),
  ],
  'Calcium gluconate': [
    IvAuditedStockPresentation(
      id: 'ca-gluconate-1000mg-10ml',
      name: 'Calcium gluconate injection · single dose',
      unit: 'mg calcium gluconate',
      vialAmount: 1000,
      vialVolumeMl: 10,
      packageLabel: '1,000 mg/10 mL · 100 mg/mL',
      sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=b2470072-f443-4596-ae33-1b8b0d05bc9d',
      safetyNote: 'SALT mg, NOT elemental calcium mg. Single-dose vial; dilution and compatible line instructions still apply.',
    ),
    IvAuditedStockPresentation(
      id: 'ca-gluconate-5000mg-50ml',
      name: 'Calcium gluconate injection · single dose',
      unit: 'mg calcium gluconate',
      vialAmount: 5000,
      vialVolumeMl: 50,
      packageLabel: '5,000 mg/50 mL · 100 mg/mL',
      sourceUrl: 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=b2470072-f443-4596-ae33-1b8b0d05bc9d',
      safetyNote: 'SALT mg. This 50 mL single-dose vial is not equivalent to a pharmacy-bulk package for dispensing rules.',
    ),
  ],
  'Regular insulin infusion': [
    IvAuditedStockPresentation(
      id: 'humulin-r-u100-3ml',
      name: 'HUMULIN R · U-100 regular human insulin',
      unit: 'units',
      vialAmount: 300,
      vialVolumeMl: 3,
      packageLabel: '300 units/3 mL · 100 units/mL (U-100)',
      sourceUrl: 'https://www.dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=81199e55-ade9-46de-a5a3-c0415acee403',
      safetyNote: 'Only U-100 regular product cited for IV dilution in 0.9% saline. Never silently substitute U-500 or other insulins.',
    ),
    IvAuditedStockPresentation(
      id: 'humulin-r-u100-10ml',
      name: 'HUMULIN R · U-100 regular human insulin',
      unit: 'units',
      vialAmount: 1000,
      vialVolumeMl: 10,
      packageLabel: '1,000 units/10 mL · 100 units/mL (U-100)',
      sourceUrl: 'https://www.dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=81199e55-ade9-46de-a5a3-c0415acee403',
      safetyNote: 'IV use supervised; glucose/potassium monitoring. Concentration is U-100, NOT U-500.',
    ),
  ],
};

List<IvAuditedStockPresentation> reviewedAdultIvStockOptions({
  required String name,
  required String population,
}) {
  if (population != 'General') return const [];
  return ivAuditedAdultStockPresentations[name] ?? const [];
}
