/// Adult IV dose references transcribed for EXACT selected manufacturer labels.
/// NOT an order set, not pediatric, obstetric, stroke- or indication-universal.
enum IvAdministrationMethod { slowInjection, loadingInfusion, continuousInfusion }

class IvLabelDoseRegimen {
  const IvLabelDoseRegimen({
    required this.id,
    required this.indication,
    required this.method,
    required this.heading,
    required this.doseDirections,
    required this.monitoring,
    required this.safety,
    required this.sourceUrl,
  });

  final String id;
  final String indication;
  final IvAdministrationMethod method;
  final String heading;
  final String doseDirections;
  final String monitoring;
  final String safety;
  final String sourceUrl;
}

const _labetalol = 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=502bb655-9ad8-481b-9e26-1dec8adef471';
const _cardene = 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=5749599d-ff2a-42e4-aa72-cd25013feee8';
const _cleviprex = 'https://dailymed.nlm.nih.gov/dailymed/fda/fdaDrugXsl.cfm?setid=f9290625-b723-4eda-bab8-a97bef6041f6';
const _esmolol = 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=220a07b8-5c68-41a3-8705-fd91f14c50b4';
const _nitroglycerin = 'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=578d8159-5ec6-457f-b4a8-9add624d43a8';

const _labetalolRegimens = <IvLabelDoseRegimen>[
  IvLabelDoseRegimen(
    id: 'labetalol-initial-injection',
    indication: 'Adult severe hypertension · initial injection',
    method: IvAdministrationMethod.slowInjection,
    heading: 'Initial slow IV injection',
    doseDirections: '20 mg slow IV over 2 minutes. This is an adult labeled INITIAL injection, not a rapid IV push.',
    monitoring: 'Measure supine BP before and 5 and 10 minutes after injection; observe BP and HR closely.',
    safety: 'Check asthma/bronchospasm, overt cardiac failure, heart block >first degree, cardiogenic shock, severe bradycardia and hypotension. Keep patient supine. Do not treat this as a hypertensive-emergency universal algorithm.',
    sourceUrl: _labetalol,
  ),
  IvLabelDoseRegimen(
    id: 'labetalol-repeat-injection',
    indication: 'Adult severe hypertension · repeat injection',
    method: IvAdministrationMethod.slowInjection,
    heading: 'Further slow IV injections after response check',
    doseDirections: 'Additional 40 mg OR 80 mg doses at 10-minute intervals if ordered, to cumulative IV injection total 300 mg. Verify previous doses before giving another.',
    monitoring: 'Supine BP, pulse/ECG and response between administrations. Do not rapidly lower BP beyond the clinician-defined goal.',
    safety: 'Same contraindications as initial labetalol dose. A repeat dose is NOT interchangeable with initial 20 mg or with a continuous infusion.',
    sourceUrl: _labetalol,
  ),
  IvLabelDoseRegimen(
    id: 'labetalol-continuous-infusion',
    indication: 'Adult severe hypertension · continuous infusion',
    method: IvAdministrationMethod.continuousInfusion,
    heading: 'Slow continuous IV infusion (not IV bolus)',
    doseDirections: 'Two distinct adult manufacturer examples: (A) 200 mg from 40 mL of 5 mg/mL stock + 160 mL IV fluid = 200 mL FINAL, 1 mg/mL. (B) 200 mg in 40 mL stock + 250 mL IV fluid = 290 mL FINAL, approximately 0.69 mg/mL (described as ~2 mg/3 mL). Labeled illustrative rate is about 2 mg/min with physician-directed BP titration. Do not treat illustrative rate as a new patient order.',
    monitoring: 'Continuous/close BP and HR monitoring. Stop after satisfactory response as directed; consider oral transition.',
    safety: 'The label describes rate control with a graduated burette or a mechanically driven infusion pump. This does not justify uncontrolled gravity drips or drops/min estimates. Exact 290 mL final volume is NOT 250 mL. Stability at one concentration cannot be assumed for all concentrations; dose rate is physician-directed.',
    sourceUrl: _labetalol,
  ),
];

const _nicardipineRegimens = <IvLabelDoseRegimen>[
  IvLabelDoseRegimen(
    id: 'nicardipine-start-titrate',
    indication: 'Adult IV blood-pressure control when oral therapy is not feasible · no prior oral nicardipine',
    method: IvAdministrationMethod.continuousInfusion,
    heading: 'Nicardipine IV infusion only · CARDENE IV diluted vial',
    doseDirections: 'Start 5 mg/hr; increase by 2.5 mg/hr at 5-minute intervals for rapid titration or every 15 minutes for gradual titration; maximum 15 mg/hr. Manufacturer vial needs dilution to FINAL 0.1 mg/mL.',
    monitoring: 'Continuous BP and HR. Stop for unacceptable hypotension or tachycardia; prescriber determines restart.',
    safety: 'No IV bolus route in this label. Advanced aortic stenosis is contraindicated. Oral-to-IV substitution uses a separate labeled conversion table, not this starting pathway.',
    sourceUrl: _cardene,
  ),
];

const _clevidipineRegimens = <IvLabelDoseRegimen>[
  IvLabelDoseRegimen(
    id: 'clevidipine-start-titrate',
    indication: 'Adult BP reduction when oral therapy is not feasible/desirable',
    method: IvAdministrationMethod.continuousInfusion,
    heading: 'Clevidipine (Cleviprex) infusion only',
    doseDirections: 'Initial 1–2 mg/hr. Dose may double about every 90 seconds early in titration, then titrate more cautiously at 5–10 minute intervals near target. Common response around 4–6 mg/hr. Most patients received no more than 16 mg/hr; limited short-term experience up to 32 mg/hr; 24-hour lipid exposure limits apply.',
    monitoring: 'Continuous/frequent BP and HR monitoring and lipid intake tracking.',
    safety: 'READY TO USE 0.5 mg/mL lipid emulsion. DO NOT DILUTE, bolus or put in the same line with other medicines. Contraindications include egg/soy allergy, defective lipid metabolism and severe aortic stenosis.',
    sourceUrl: _cleviprex,
  ),
];

const _esmololRegimens = <IvLabelDoseRegimen>[
  IvLabelDoseRegimen(
    id: 'esmolol-svt-loading',
    indication: 'Adult SVT/atrial fibrillation/flutter ventricular rate control',
    method: IvAdministrationMethod.loadingInfusion,
    heading: 'Optional loading infusion · SVT',
    doseDirections: 'Optional 500 mcg/kg over ONE minute, then 50 mcg/kg/min for four minutes; titrate according to response at intervals of at least 4 minutes. SVT maximum infusion generally 200 mcg/kg/min in cited label.',
    monitoring: 'Continuous ECG, BP and HR; ensure weight-based units and a validated product concentration.',
    safety: 'Loading over 1 minute is NOT unrestricted rapid bolus. Separate 10 mg/mL and 20 mg/mL ready-to-use preparations. Do not dilute premix.',
    sourceUrl: _esmolol,
  ),
  IvLabelDoseRegimen(
    id: 'esmolol-perioperative-hypertension',
    indication: 'Adult perioperative hypertension/tachycardia',
    method: IvAdministrationMethod.loadingInfusion,
    heading: 'Perioperative loading and infusion · distinct indication',
    doseDirections: 'For gradual control: loading 500 mcg/kg over 1 minute, then infusion 50 mcg/kg/min. For immediate control: 1 mg/kg over 30 seconds followed by 150 mcg/kg/min. Maximum cited infusion 200 mcg/kg/min for tachycardia or 300 mcg/kg/min for hypertension.',
    monitoring: 'Anesthesia/critical-care supervision with continuous ECG and BP monitoring.',
    safety: 'These perioperative regimens must NOT be generalized to all hypertensive emergencies or SVT patients. Choose a regimen through a verified clinician order.',
    sourceUrl: _esmolol,
  ),
];

const _nitroglycerinRegimens = <IvLabelDoseRegimen>[
  IvLabelDoseRegimen(
    id: 'nitroglycerin-titrated',
    indication: 'Adult monitored IV nitroglycerin therapy · product-specific',
    method: IvAdministrationMethod.continuousInfusion,
    heading: 'Continuous infusion using nonadsorbing tubing',
    doseDirections: 'Start 5 mcg/min with a nonadsorbing set; initial titration in 5 mcg/min increments every 3–5 minutes. If no response at 20 mcg/min, increments of 10 or later 20 mcg/min may be used as directed. No single fixed optimum dose.',
    monitoring: 'Continuous BP and HR; consider filling pressure and perfusion.',
    safety: 'NEVER IV bolus the 5 mg/mL concentrate. Mandatory D5W or 0.9% saline dilution and appropriate glass/nonadsorbing setup; dose delivery varies by infusion tubing. Screen for important nitrate contraindications and interactions.',
    sourceUrl: _nitroglycerin,
  ),
];

List<IvLabelDoseRegimen> reviewedAdultIvDoseRegimens({
  required String name,
  required String population,
}) {
  if (population != 'General') return const [];
  switch (name) {
    case 'Labetalol':
      return _labetalolRegimens;
    case 'Nicardipine':
      return _nicardipineRegimens;
    case 'Clevidipine':
      return _clevidipineRegimens;
    case 'Esmolol':
      return _esmololRegimens;
    case 'Nitroglycerin':
      return _nitroglycerinRegimens;
    default:
      return const [];
  }
}
