import '../data/iv_unified_infusion_library.dart';

/// Traffic lights apply to an EXACT named adult product + preparation.
 /// Green is a preparation-rule match, NEVER a patient/order approval.
enum IvDilutionLight { green, yellow, red }
enum IvDiluent {
  d5w('D5W (5% dextrose)'),
  normalSaline('0.9% NaCl'),
  d5ns('D5W + 0.9% NaCl'),
  lactatedRingers('Lactated Ringer’s'),
  bicarbonate('Sodium bicarbonate'),
  other('Other / not confirmed');

  const IvDiluent(this.label);
  final String label;
}
enum IvLineType {
  peripheral('Peripheral IV'),
  central('Central venous line');
  const IvLineType(this.label);
  final String label;
}

class IvDilutionAssessment {
  const IvDilutionAssessment(this.light, this.reason, this.action,
      {this.sourceUrl});
  final IvDilutionLight light;
  final String reason;
  final String action;
  final String? sourceUrl;
  bool get blocked => light == IvDilutionLight.red;
}

const _sourceAmio =
    'https://dailymed.nlm.nih.gov/dailymed/fda/fdaDrugXsl.cfm?setid=0a28ae25-7cc4-4ac0-a2ba-7820fb93e25c&type=display';
const _sourceNitro =
    'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=578d8159-5ec6-457f-b4a8-9add624d43a8';
const _sourceDobutamine =
    'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=89becb0c-da60-4f43-0a98-29ff7a9eca58';
const _sourceDex =
    'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=ebdfe2e8-30ca-4f18-935a-41bcbbce4937';
const _sourceEpi =
    'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=1e8ebac1-5b32-47f9-a930-86a98a24dccc';
const _sourceSnp =
    'https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=6fbfb86c-da8d-4741-b1e0-7000e2bbad5f';

IvDilutionAssessment assessAdultIvDilution({
  required String drug,
  required double? drugMg,
  required double? actualFinalMl,
  required IvDiluent? fluid,
  required IvLineType line,
  required bool productAndProtocolVerified,
  required bool lightProtectionVerified,
  required bool lowSorptionSetVerified,
}) {
  const yellowIncomplete = IvDilutionAssessment(
    IvDilutionLight.yellow,
    'Enter the medicine amount (mg), ACTUAL final volume (mL), '
        'and the exact diluent.',
    'YELLOW means NOT CLEARED. It is not permission to mix or administer.',
  );
  if (drugMg == null || actualFinalMl == null || fluid == null) {
    return yellowIncomplete;
  }
  if (!drugMg.isFinite || !actualFinalMl.isFinite ||
      drugMg <= 0 || actualFinalMl <= 0) {
    return const IvDilutionAssessment(
      IvDilutionLight.red, 'Amount and final volume must both be positive finite numbers.',
      'STOP: Correct the entered numbers. Do not prepare this mixture.',
    );
  }

  final c = drugMg * 1000 / actualFinalMl; // mcg / ACTUAL final mL
  if (!c.isFinite || c <= 0) {
    return const IvDilutionAssessment(
      IvDilutionLight.red, 'Invalid final concentration.',
      'STOP: Recheck the amount and final volume.',
    );
  }

  IvDilutionAssessment red(String reason, String action, {String? source}) =>
      IvDilutionAssessment(IvDilutionLight.red, reason, action, sourceUrl: source);
  IvDilutionAssessment yellow(String reason, String action, {String? source}) =>
      IvDilutionAssessment(IvDilutionLight.yellow, reason, action, sourceUrl: source);
  IvDilutionAssessment green(String reason, String action, {String? source}) =>
      productAndProtocolVerified
          ? IvDilutionAssessment(
              IvDilutionLight.green, reason, action, sourceUrl: source)
          : yellow(
              'Concentration matches a reviewed example, but the EXACT vial, '
              'diluent and hospital protocol have not been independently verified.',
              'Check the product label and valid hospital preparation protocol '
              'before treating this as an acceptable infusion.',
              source: source,
            );

  bool eq(double value, double target) =>
      (value - target).abs() < (target.abs() * 0.000001 + 0.00000001);
  final dextrose = fluid == IvDiluent.d5w || fluid == IvDiluent.d5ns;
  final nsOrD5 = fluid == IvDiluent.d5w || fluid == IvDiluent.normalSaline;
  final notApprovedFluid = fluid == IvDiluent.other;
  String? sourceForDrug() {
    final p = ivUnifiedPreparationsFor(drug);
    return p.isEmpty ? null : p.first.sourceUrl;
  }

  if (fluid == IvDiluent.bicarbonate &&
      const ['Dobutamine', 'Dopamine', 'Epinephrine', 'Norepinephrine',
        'Amiodarone'].contains(drug)) {
    return red(
      'This product must not be prepared in bicarbonate / '
      'strongly alkaline solutions.',
      'STOP: Choose a product-labeled compatible fluid.',
      source: sourceForDrug(),
    );
  }

  // Prevent physically impossible volume calculations for matched CONCENTRATES.
  // Do not infer stock strengths for premixes or products with multiple strengths.
  final stockMgMl = switch (drug) {
    'Dobutamine' => 12.5,
    'Dopamine' => 40.0,
    'Epinephrine' => 1.0,
    'Norepinephrine' => 1.0,
    'Nitroglycerin' => 5.0,
    'Dexmedetomidine' => 0.1, // 100 mcg/mL
    'Sodium nitroprusside' => 25.0,
    'Amiodarone' => 50.0,
    'Nicardipine' => 2.5,
    'Labetalol' => 5.0,
    _ => null,
  };
  if (stockMgMl != null && drugMg / stockMgMl >= actualFinalMl) {
    return red(
      'Drug stock alone would fill or exceed the requested FINAL volume.',
      'STOP: Final volume must include enough diluent and all stock volume.',
      source: sourceForDrug(),
    );
  }

  switch (drug) {
    case 'Dobutamine':
      if (actualFinalMl < 50) {
        return red(
          'Dobutamine concentrate must be further diluted to a final '
          'container volume of at least 50 mL.',
          'STOP: Follow the exact concentrate label (minimum final volume 50 mL).',
          source: _sourceDobutamine,
        );
      }
      if (c > 5000) {
        return red(
          'Above 5,000 mcg/mL, exceeding the highest concentration '
          'described in this manufacturer label.',
          'STOP: This concentration is not supported by the reviewed label. '
          'Request a validated alternative.',
          source: _sourceDobutamine,
        );
      }
      if (notApprovedFluid) {
        return yellow(
          'This fluid is not confirmed compatible for the selected concentrate.',
          'Check the product insert and local policy; do not use an unverified fluid.',
          source: _sourceDobutamine,
        );
      }
      if (eq(c, 5000)) {
        return yellow(
          '5,000 mcg/mL is the highest concentration described '
          'in this label, typically for fluid-restricted care.',
          'Use only if this higher concentration is specifically '
          'authorized and the IV site, pump and patient monitoring are reviewed.',
          source: _sourceDobutamine,
        );
      }
      if (eq(drugMg, 250) &&
          (eq(actualFinalMl, 500) || eq(actualFinalMl, 250) ||
              eq(actualFinalMl, 125))) {
        return green(
          'Concentration matches a labeled dobutamine infusion example.',
          'Confirm the final bag volume, appropriate diluent and continuous '
          'hemodynamic monitoring. Exact prepared volume overrides nominal tables.',
          source: _sourceDobutamine,
        );
      }
      return yellow(
        'Within the reported concentration experience, but this '
        'specific final-volume preparation has not been verified here.',
        'Needs a documented institution-approved preparation and stability check.',
        source: _sourceDobutamine,
      );
    case 'Nitroglycerin':
      if (!nsOrD5) {
        return red(
          'This nitroglycerin concentrate label uses only D5W or '
          '0.9% sodium chloride for infusion dilution.',
          'STOP: Re-select the compatible diluent.',
          source: _sourceNitro,
        );
      }
      if (c > 400) {
        return red(
          'Above the maximum 400 mcg/mL final concentration in '
          'the reviewed nitroglycerin dilution pathway.',
          'STOP: Increase the validated final volume or use a labeled strength.',
          source: _sourceNitro,
        );
      }
      if (!lowSorptionSetVerified) {
        return yellow(
          'Nitroglycerin is adsorbed by PVC/inappropriate tubing; '
          'the dose delivered can be lower than the calculated dose.',
          'CAUTION: Use the product-required low-sorption/non-PVC '
          'administration system and verify its compatibility.',
          source: _sourceNitro,
        );
      }
      final inLabelTable =
          (eq(drugMg, 5) && eq(actualFinalMl, 100)) ||
          (eq(drugMg, 25) &&
              (eq(actualFinalMl, 500) || eq(actualFinalMl, 250) ||
                  eq(actualFinalMl, 125))) ||
          (eq(drugMg, 50) &&
              (eq(actualFinalMl, 500) || eq(actualFinalMl, 250) ||
                  eq(actualFinalMl, 125))) ||
          (eq(drugMg, 100) &&
              (eq(actualFinalMl, 1000) || eq(actualFinalMl, 500) ||
                  eq(actualFinalMl, 250))) ||
          (eq(drugMg, 200) &&
              (eq(actualFinalMl, 1000) || eq(actualFinalMl, 500)));
      if (inLabelTable) {
        return green(
          'Final amount and volume match a labeled nitroglycerin dilution '
          'with a compatible diluent and verified low-sorption set.',
          'Continue to use an infusion pump, monitor BP, '
          'and verify container/line requirements.',
          source: _sourceNitro,
        );
      }
      return yellow(
        'This concentration does not match a structured '
        'manufacturer dilution example in this app.',
        'Require local protocol validation; do not assume intermediate values are approved.',
        source: _sourceNitro,
      );
    case 'Amiodarone':
      if (fluid != IvDiluent.d5w) {
        return red(
          'This adult VT/VF infusion label uses D5W; this fluid '
          'has not been authorized for the selected preparation.',
          'STOP: Use product-specific D5W preparation.',
          source: _sourceAmio,
        );
      }
      if (c > 6000) {
        return red(
          'Concentration exceeds the reviewed 1–6 mg/mL adult '
          'maintenance infusion range.',
          'STOP: Obtain an authorized alternative preparation.',
          source: _sourceAmio,
        );
      }
      if (c > 2000 && line == IvLineType.peripheral) {
        return red(
          'For infusions longer than 1 hour, amiodarone above '
          '2 mg/mL must NOT be infused through a peripheral line.',
          'STOP: Central venous catheter required for >2 mg/mL. '
          'This rule is for the adult prolonged infusion pathway.',
          source: _sourceAmio,
        );
      }
      if (c > 2000) {
        return yellow(
          'High-concentration amiodarone (>2 mg/mL) requires '
          'a CENTRAL venous catheter for infusion longer than 1 hour.',
          'CAUTION: Confirm central position, in-line filter, volumetric pump '
          'and appropriate glass/polyolefin container for infusion >2 hours.',
          source: _sourceAmio,
        );
      }
      if (c < 1000) {
        return yellow(
          'Below the 1 mg/mL lower bound of the reviewed later '
          'maintenance infusion range.',
          'Check the clinical phase and manufacturer-specific dilution protocol.',
          source: _sourceAmio,
        );
      }
      if (eq(c, 1800) && eq(drugMg, 900)) {
        return green(
          'Matches the 900 mg in 500 mL adult VT/VF slow '
          'infusion labeled example (1.8 mg/mL).',
          'Use a volumetric pump and in-line filter; central access '
          'preferred and glass/polyolefin container needed if >2 hours.',
          source: _sourceAmio,
        );
      }
      return yellow(
        'Within a labeled maintenance concentration range, '
        'but not the verified 900 mg/500 mL first-day pathway.',
        'Confirm infusion phase, hospital recipe, access, filter and container.',
        source: _sourceAmio,
      );
    case 'Dexmedetomidine':
      if (fluid != IvDiluent.normalSaline) {
        return red(
          'The reviewed 200 mcg/2 mL concentrate must be '
          'diluted with 0.9% NaCl for this 4 mcg/mL recipe.',
          'STOP: Check the actual product and labeled diluent.',
          source: _sourceDex,
        );
      }
      if (!eq(c, 4)) {
        return red(
          'Not the 4 mcg/mL concentration required by the '
          'reviewed dexmedetomidine CONCENTRATE preparation label.',
          'STOP: For this product use 200 mcg (0.2 mg) '
          '+ 48 mL NaCl = 50 mL FINAL, or verify a separate product label.',
          source: _sourceDex,
        );
      }
      if (eq(drugMg, 0.2) && eq(actualFinalMl, 50)) {
        return green(
          'Matches 200 mcg (2 mL) + 48 mL 0.9% NaCl = '
          '50 mL FINAL, 4 mcg/mL.',
          'Use mcg/kg/HOUR (not minute); monitor HR and BP.',
          source: _sourceDex,
        );
      }
      return yellow(
        'Same 4 mcg/mL concentration, but this exact '
        'amount/container is not the cited 200 mcg/50 mL recipe.',
        'Verify the alternative preparation, stability and product label.',
        source: _sourceDex,
      );
    case 'Sodium nitroprusside':
      if (fluid != IvDiluent.d5w) {
        return red(
          'This nitroprusside CONCENTRATE requires dilution in D5W only.',
          'STOP: Ready-to-use saline presentations have different labels.',
          source: _sourceSnp,
        );
      }
      if (!eq(drugMg, 50) || c > 200 || c < 50) {
        return red(
          'Outside the reviewed 50 mg concentrate in 250–1000 mL '
          'D5W labeled preparation range.',
          'STOP: Do not extrapolate other strengths without a specific protocol.',
          source: _sourceSnp,
        );
      }
      if (!lightProtectionVerified) {
        return yellow(
          'Sodium nitroprusside infusion must be protected from light.',
          'CAUTION: Apply an opaque bag sleeve and confirm '
          'continuous BP/toxicity monitoring before use.',
          source: _sourceSnp,
        );
      }
      if (eq(c, 50) || eq(c, 100) || eq(c, 200)) {
        return green(
          'Matches a labeled 50 mg nitroprusside D5W infusion '
          'concentration with light protection confirmed.',
          'Continue continuous BP and cyanide/thiocyanate toxicity monitoring.',
          source: _sourceSnp,
        );
      }
      return yellow(
        'Inside the 250–1000 mL manufacturer dilution range but '
        'not a structured nominal strength here.',
        'Verify the actual final volume, monitoring and local protocol.',
        source: _sourceSnp,
      );
    case 'Epinephrine':
      if (!dextrose) {
        return yellow(
          'The chosen fluid is not one of the D5W / D5NS '
          'diluents recommended for this labeled '
          'adult septic-shock epinephrine concentrate preparation.',
          'Use labeled 5%-dextrose-containing fluid; '
          'do not mistake this for IM anaphylaxis or arrest bolus.',
          source: _sourceEpi,
        );
      }
      if (eq(drugMg, 1) && eq(actualFinalMl, 1000)) {
        return yellow(
          'Matches the nominal 1 mcg/mL adult septic-shock '
          'label recipe, but exact final volume may differ after adding stock.',
          'CAUTION: Confirm exact product, volume convention, '
          'and large-vein infusion/access monitoring.',
          source: _sourceEpi,
        );
      }
      return yellow(
        'Not the 1 mg in 1000 mL dextrose-containing fluid '
        'recipe verified for this exact adult septic-shock product.',
        'Do not treat this as approved without a specific hospital/product protocol.',
        source: _sourceEpi,
      );
    case 'Norepinephrine':
      return yellow(
        'The cited norepinephrine vial is 1 mg/mL BASE '
        '(not the diluted pump concentration). This local '
        'concentration is not independently source-cleared.',
        'CAUTION: Verify base-equivalent product, chosen diluent, '
        'venous access and exact final volume with the ICU protocol.',
        source: sourceForDrug(),
      );
    case 'Clevidipine':
    case 'Esmolol':
      return red(
        'The reviewed product is READY TO USE; '
        'do not use this custom dilution lane for the premix.',
        'STOP: Select the exact ready-to-use presentation instead.',
        source: sourceForDrug(),
      );
    case 'Nicardipine':
      if (fluid == IvDiluent.lactatedRingers ||
          fluid == IvDiluent.bicarbonate) {
        return red(
          'CARDENE IV is incompatible with Lactated Ringer’s '
          'and sodium bicarbonate.',
          'STOP: Use a compatible labeled diluent.',
          source: sourceForDrug(),
        );
      }
      if (eq(drugMg, 25) && eq(actualFinalMl, 250) &&
          (nsOrD5 || fluid == IvDiluent.d5ns)) {
        return green(
          '25 mg / 250 mL FINAL = 0.1 mg/mL '
          'CARDENE IV labeled dilution.',
          'Confirm the actual 25 mg/10 mL concentrate, bag volume '
          'and IV-site monitoring.',
          source: sourceForDrug(),
        );
      }
      return yellow(
        'Not a verified CARDENE IV final dilution in this app.',
        'Validate exact product, diluent and final volume against the label.',
        source: sourceForDrug(),
      );
    case 'Dopamine':
      if (fluid == IvDiluent.bicarbonate) {
        return red(
          'Dopamine is inactivated by alkaline bicarbonate.',
          'STOP: Use a dopamine-compatible diluent.',
          source: sourceForDrug(),
        );
      }
      final labeledAmountAndVolume =
          (eq(drugMg, 200) &&
              (eq(actualFinalMl, 250) || eq(actualFinalMl, 500))) ||
          (eq(drugMg, 400) &&
              (eq(actualFinalMl, 250) || eq(actualFinalMl, 500)));
      if (labeledAmountAndVolume && !notApprovedFluid) {
        return green(
          'Matches a listed dopamine 40 mg/mL concentrate '
          'nominal dilution concentration.',
          'Confirm the exact stock amount, bag volume and '
          'compatible fluid; avoid bicarbonate, blood and iron salts.',
          source: sourceForDrug(),
        );
      }
      return yellow(
        'This dopamine final concentration is not a '
        'manufacturer-table concentration reviewed here.',
        'Request approved product/hospital protocol before preparing.',
        source: sourceForDrug(),
      );
    case 'Labetalol':
      if (eq(drugMg, 200) &&
          (eq(actualFinalMl, 200) || eq(actualFinalMl, 290)) &&
          !notApprovedFluid) {
        return green(
          'Matches a reviewed labetalol infusion final-volume example.',
          'Check exact concentrate, compatible diluent and infusion order.',
          source: sourceForDrug(),
        );
      }
      return yellow(
        'Does not match the two reviewed labetalol final dilutions.',
        'Validate the alternative against your local infusion protocol.',
        source: sourceForDrug(),
      );
    default:
      return yellow(
        'No drug-specific source-verified dilution rule is '
        'available for this exact medicine and preparation.',
        'DO NOT treat this as cleared. Confirm manufacturer label '
        'and hospital intravenous preparation protocol.',
      );
  }
}
