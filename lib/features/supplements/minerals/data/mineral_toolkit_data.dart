import '../domain/mineral_toolkit_models.dart';

const mineralToolkitEntries = <MineralToolkitEntry>[
  MineralToolkitEntry(
    id: MineralId.iron,
    name: 'Iron',
    nameAr: 'الحديد',
    coreRule:
        'Dose oral iron by ELEMENTAL iron. A supplement RDA/DV is not an iron-deficiency treatment dose. Ferrous salts are common first-line oral options.',
    presets: [
      ElementalPreset(
        id: 'ferrous-sulfate',
        name: 'Ferrous sulfate',
        elementalFraction: 0.20,
        note:
            'About 20% elemental iron by salt weight. A common 325 mg tablet provides about 65 mg elemental iron.',
        sourceLabel: 'NIH ODS Iron + AGA 2024',
      ),
      ElementalPreset(
        id: 'ferrous-fumarate',
        name: 'Ferrous fumarate',
        elementalFraction: 0.33,
        note:
            'About 33% elemental iron by salt weight. Product tablet strengths vary.',
        sourceLabel: 'NIH ODS Iron',
      ),
      ElementalPreset(
        id: 'ferrous-gluconate',
        name: 'Ferrous gluconate',
        elementalFraction: 0.12,
        note:
            'About 12% elemental iron by salt weight. Common tablets may provide roughly 27–38 mg elemental iron depending on strength.',
        sourceLabel: 'NIH ODS Iron + AGA 2024',
      ),
    ],
    protocols: [
      MineralProtocol(
        id: 'adult-ida-oral',
        title: 'Adult iron-deficiency anemia — oral start',
        population: 'Adults with confirmed/clinically established IDA',
        dose:
            'Start with one usual tablet of ferrous sulfate, ferrous fumarate, or ferrous gluconate; verify the tablet’s ELEMENTAL iron rather than assuming salt weight.',
        frequency:
            'At most once daily. Every-other-day dosing can be used when better tolerated and has similar or equal absorption in available evidence.',
        duration:
            'Reassess response early. BSG recommends continuing oral iron for about 3 months after hemoglobin normalizes to replenish stores.',
        whenToUse:
            'Confirmed IDA when oral replacement is appropriate and absorption is expected.',
        monitoring:
            'Check hemoglobin response within the first 4 weeks; ferritin/iron stores and the cause of deficiency still need follow-up.',
        caveat:
            'Do not use this pathway for unexplained anemia without evaluating the cause. IV iron is appropriate when oral iron is not tolerated, ferritin fails to improve, or absorption is unlikely.',
        sourceLabel: 'AGA Clinical Practice Update 2024 + BSG IDA Guideline',
      ),
      MineralProtocol(
        id: 'nutrition-gap',
        title: 'Nutrition gap / prevention',
        population: 'Generally healthy person with inadequate intake',
        dose:
            'Use the Daily Needs gap tool. Do not automatically give an IDA-treatment tablet to cover a dietary gap.',
        frequency: 'Depends on product and size of the nutritional gap.',
        duration: 'Reassess diet and total intake rather than defaulting to indefinite use.',
        whenToUse:
            'When intake is inadequate but therapeutic iron replacement is not indicated.',
        monitoring:
            'High-risk users may need CBC/ferritin based on the clinical question.',
        caveat:
            'A 65 mg elemental iron tablet is far above the routine RDA for most adults and should not be treated like a generic wellness dose.',
        sourceLabel: 'NIH ODS Iron',
      ),
    ],
    interactions: [
      MineralInteraction(
        withItem: 'Levothyroxine',
        separation: 'Avoid levothyroxine within 4 hours of iron.',
        note: 'Simultaneous iron can reduce levothyroxine absorption.',
      ),
      MineralInteraction(
        withItem: 'Calcium supplements',
        separation: 'Take at a different time of day when practical.',
        note:
            'Calcium may interfere with iron absorption; the clinical magnitude varies, but separation is commonly advised.',
      ),
      MineralInteraction(
        withItem: 'High-dose zinc',
        separation: 'Avoid taking substantial iron and zinc together.',
        note:
            'Iron supplements containing 25 mg elemental iron or more can reduce zinc absorption when taken at the same time.',
      ),
    ],
    safety: [
      'GI upset, nausea and constipation are common and actionable; taking with food can improve tolerance but may reduce absorption.',
      'Keep iron out of reach of children. Accidental overdose can be fatal.',
      'Dark stools are expected with oral iron, but GI bleeding symptoms still require clinical assessment.',
      'Do not continue “iron for fatigue” indefinitely without confirming the indication and cause.',
    ],
  ),
  MineralToolkitEntry(
    id: MineralId.calcium,
    name: 'Calcium',
    nameAr: 'الكالسيوم',
    coreRule:
        'Count ELEMENTAL calcium from food + supplements. The supplement should usually fill the gap, not reproduce the full RDA on top of food.',
    presets: [
      ElementalPreset(
        id: 'carbonate',
        name: 'Calcium carbonate',
        elementalFraction: 0.40,
        note:
            '40% elemental calcium. Higher elemental fraction; generally take with food.',
        sourceLabel: 'NIH ODS Calcium',
      ),
      ElementalPreset(
        id: 'citrate',
        name: 'Calcium citrate',
        elementalFraction: 0.21,
        note:
            'About 21% elemental calcium. Less dependent on gastric acid; can be taken with or without food.',
        sourceLabel: 'NIH ODS Calcium',
      ),
      ElementalPreset(
        id: 'gluconate',
        name: 'Calcium gluconate',
        elementalFraction: 0.09,
        note:
            'Roughly 9% elemental by chemical composition; exact oral product label controls.',
        sourceLabel: 'NIH ODS Calcium + product-specific labeling',
      ),
      ElementalPreset(
        id: 'lactate',
        name: 'Calcium lactate',
        elementalFraction: 0.13,
        note:
            'Roughly 13% elemental depending on hydration; exact product label controls.',
        sourceLabel: 'NIH ODS Calcium + product-specific labeling',
      ),
    ],
    protocols: [
      MineralProtocol(
        id: 'diet-gap',
        title: 'Diet-gap supplementation',
        population: 'Children or adults with inadequate calcium intake',
        dose:
            'Calculate the gap between the age/life-stage target and dietary intake. Use elemental calcium to cover only the required gap.',
        frequency:
            'If supplemental elemental calcium is more than about 500 mg/day, split it because fractional absorption falls as a single dose gets larger.',
        duration:
            'Continue only while the dietary gap or clinical indication remains; reassess diet periodically.',
        whenToUse: 'When food alone does not reliably meet calcium needs.',
        monitoring:
            'Serum calcium does not measure dietary adequacy. Check labs when there is CKD, hypercalcemia risk, parathyroid disease, or another clinical reason.',
        caveat:
            'Do not prescribe 1,000–1,300 mg supplement just because the RDA is 1,000–1,300 mg/day.',
        sourceLabel: 'NIH ODS Calcium',
      ),
      MineralProtocol(
        id: 'pregnancy-low-intake',
        title: 'Pregnancy — low dietary calcium setting',
        population:
            'Pregnant patients in populations/settings with low dietary calcium intake',
        dose: '1.5–2.0 g/day ELEMENTAL calcium.',
        frequency: 'Divide the daily total into multiple doses.',
        duration:
            'During pregnancy according to the local antenatal protocol; WHO has revalidated this recommendation for low-intake settings.',
        whenToUse:
            'Pre-eclampsia prevention in low dietary calcium settings, especially when hypertension risk is higher.',
        monitoring:
            'Review total dietary calcium, renal disease, stone/hypercalcemia risk and interacting medicines.',
        caveat:
            'This is NOT a universal prenatal dose for every pregnant patient. It is a WHO public-health/antenatal recommendation for low-calcium-intake settings.',
        sourceLabel: 'WHO calcium supplementation in pregnancy',
      ),
    ],
    interactions: [
      MineralInteraction(
        withItem: 'Levothyroxine',
        separation: 'Keep calcium carbonate at least 4 hours from levothyroxine.',
        note: 'Calcium carbonate can reduce levothyroxine absorption.',
      ),
      MineralInteraction(
        withItem: 'Quinolone antibiotics',
        separation: 'Give the antibiotic 2 hours before or 2 hours after calcium.',
        note: 'Simultaneous calcium can reduce quinolone absorption.',
      ),
      MineralInteraction(
        withItem: 'Dolutegravir',
        separation: 'Dolutegravir 2 hours before or 6 hours after calcium.',
        note:
            'Calcium can chelate dolutegravir; product-specific food instructions can modify management.',
      ),
    ],
    safety: [
      'Carbonate causes more gas/constipation than citrate in some patients.',
      'Review total calcium from antacids as well as supplements.',
      'Kidney stones, hypercalcemia, CKD and hyperparathyroid states need individualized review.',
      'Use elemental calcium, not tablet/salt mass, when comparing products.',
    ],
  ),
  MineralToolkitEntry(
    id: MineralId.magnesium,
    name: 'Magnesium',
    nameAr: 'المغنيسيوم',
    coreRule:
        'Use the labeled ELEMENTAL magnesium. More soluble citrate/chloride/lactate/aspartate forms tend to be better absorbed than oxide; laxative products are a different use case.',
    presets: [
      ElementalPreset(
        id: 'oxide-example',
        name: 'Magnesium oxide — common 400 mg example',
        elementalFraction: 0.60325,
        note:
            'A current DailyMed example contains 241.3 mg elemental magnesium per 400 mg magnesium oxide tablet. Treat this as a product example, not a universal label replacement.',
        sourceLabel: 'DailyMed magnesium oxide + NIH ODS Magnesium',
      ),
      ElementalPreset(
        id: 'citrate-label',
        name: 'Magnesium citrate',
        elementalFraction: null,
        note:
            'Hydration/formulation varies. Use the Supplement Facts elemental-magnesium line rather than a universal conversion percentage.',
        sourceLabel: 'NIH ODS Magnesium',
      ),
      ElementalPreset(
        id: 'glycinate-label',
        name: 'Magnesium glycinate / bisglycinate',
        elementalFraction: null,
        note:
            'Chelate composition and buffering vary by manufacturer; use labeled elemental magnesium.',
        sourceLabel: 'Product-specific Supplement Facts',
      ),
      ElementalPreset(
        id: 'chloride-label',
        name: 'Magnesium chloride',
        elementalFraction: null,
        note:
            'Hydration state varies. Label elemental magnesium controls.',
        sourceLabel: 'NIH ODS Magnesium',
      ),
    ],
    protocols: [
      MineralProtocol(
        id: 'diet-gap',
        title: 'Nutrition-gap supplementation',
        population: 'Generally healthy person with inadequate intake',
        dose:
            'Use the Daily Needs gap tool and the product’s ELEMENTAL magnesium amount.',
        frequency: 'Split if GI tolerance is better that way.',
        duration: 'Reassess diet and indication.',
        whenToUse:
            'When food intake is inadequate and there is no clinician-directed deficiency regimen.',
        monitoring:
            'Routine serum magnesium is not needed for every user; check when deficiency/toxicity is plausible or renal function is impaired.',
        caveat:
            'The adult UL of 350 mg/day applies to supplemental/medication magnesium, not magnesium naturally present in food. Clinician-directed treatment can differ.',
        sourceLabel: 'NIH ODS Magnesium',
      ),
      MineralProtocol(
        id: 'hypomagnesemia-lock',
        title: 'Documented hypomagnesemia',
        population: 'Patients with confirmed or clinically significant magnesium deficiency',
        dose:
            'No single oral dose is safe to auto-generate here. Severity, cause, renal function, symptoms and route determine treatment.',
        frequency: 'Clinician-directed.',
        duration: 'Until cause and magnesium deficit are corrected.',
        whenToUse:
            'Confirmed deficiency, arrhythmia/electrolyte disorder, medication-related loss or other clinical indication.',
        monitoring:
            'Serum magnesium, renal function and related electrolytes as clinically appropriate.',
        caveat:
            'Severe/symptomatic deficiency may require IV treatment. Do not apply the nutrition-gap calculator as a treatment protocol.',
        sourceLabel: 'NIH ODS Magnesium + clinical electrolyte management principles',
      ),
    ],
    interactions: [
      MineralInteraction(
        withItem: 'Tetracycline / quinolone antibiotics',
        separation:
            'Take the antibiotic at least 2 hours before or 4–6 hours after magnesium.',
        note: 'Chelation can reduce antibiotic absorption.',
      ),
      MineralInteraction(
        withItem: 'Oral bisphosphonates',
        separation: 'Keep magnesium at least 2 hours before or after.',
        note: 'Magnesium can decrease bisphosphonate absorption.',
      ),
      MineralInteraction(
        withItem: 'Long-term PPI therapy',
        separation: 'No spacing fix — monitor risk instead.',
        note:
            'Long-term PPIs can cause hypomagnesemia; supplementation alone does not correct every case.',
      ),
    ],
    safety: [
      'Diarrhea and abdominal cramping are common dose-limiting effects.',
      'Renal impairment increases the risk of magnesium accumulation and toxicity.',
      'Do not use magnesium citrate laxative directions as a daily nutrition supplement regimen.',
      '“400 mg magnesium” may mean salt weight or elemental amount—verify the Supplement Facts line.',
    ],
  ),
  MineralToolkitEntry(
    id: MineralId.zinc,
    name: 'Zinc',
    nameAr: 'الزنك',
    coreRule:
        'Dose by ELEMENTAL zinc. Short therapeutic courses can exceed normal dietary ULs under clinical guidance; chronic high-dose use is different and can cause copper deficiency.',
    presets: [
      ElementalPreset(
        id: 'sulfate-heptahydrate',
        name: 'Zinc sulfate heptahydrate',
        elementalFraction: 0.227,
        note:
            'About 22.7% elemental zinc. A common 220 mg salt amount provides about 50 mg elemental zinc.',
        sourceLabel: 'NIH ODS Zinc + chemical composition/product labels',
      ),
      ElementalPreset(
        id: 'sulfate-monohydrate',
        name: 'Zinc sulfate monohydrate',
        elementalFraction: 0.364,
        note:
            'About 36.4% elemental zinc. Hydration state must be known before converting.',
        sourceLabel: 'Chemical composition + product label',
      ),
      ElementalPreset(
        id: 'gluconate',
        name: 'Zinc gluconate',
        elementalFraction: 0.143,
        note:
            'About 14.3% elemental zinc by salt weight; the product label controls.',
        sourceLabel: 'NIH ODS Zinc + chemical composition',
      ),
      ElementalPreset(
        id: 'acetate-label',
        name: 'Zinc acetate',
        elementalFraction: null,
        note:
            'Use labeled elemental zinc because hydration/formulation can change the conversion.',
        sourceLabel: 'NIH ODS Zinc + product-specific label',
      ),
    ],
    protocols: [
      MineralProtocol(
        id: 'pediatric-diarrhea',
        title: 'Acute diarrhea — WHO pediatric zinc course',
        population: 'Children under 5 years with acute diarrhea',
        dose:
            '<6 months: 10 mg/day ELEMENTAL zinc. Age 6 months and older: 20 mg/day ELEMENTAL zinc.',
        frequency: 'Once daily.',
        duration: '10–14 days.',
        whenToUse:
            'As part of acute diarrhea management together with oral rehydration and continued feeding.',
        monitoring:
            'Watch hydration status, vomiting, ability to drink and red flags requiring medical care.',
        caveat:
            'This is a therapeutic WHO regimen; it can exceed age-based nutritional ULs, which do not apply the same way to supervised medical treatment.',
        sourceLabel: 'WHO zinc supplementation in management of diarrhea',
      ),
      MineralProtocol(
        id: 'diet-gap',
        title: 'Nutrition gap / deficiency-risk use',
        population: 'Generally healthy person with low intake or risk',
        dose:
            'Use Daily Needs to calculate the nutritional gap. Do not default to 25–50 mg/day for wellness.',
        frequency: 'Product/indication dependent.',
        duration: 'Reassess need; avoid indefinite high-dose use.',
        whenToUse:
            'When diet cannot meet the RDA/AI or a clinical indication is established.',
        monitoring:
            'Long-term high-dose use should trigger total-zinc review and consideration of copper status.',
        caveat:
            'There is no need to prefer one common zinc salt solely from marketing claims; Supplement Facts elemental zinc is the key dose.',
        sourceLabel: 'NIH ODS Zinc',
      ),
    ],
    interactions: [
      MineralInteraction(
        withItem: 'Tetracycline / quinolone antibiotics',
        separation:
            'Take the antibiotic at least 2 hours before or 4–6 hours after zinc.',
        note: 'Chelation can reduce absorption of both.',
      ),
      MineralInteraction(
        withItem: 'Penicillamine',
        separation: 'Keep at least 1 hour apart.',
        note: 'Zinc can reduce penicillamine absorption and action.',
      ),
      MineralInteraction(
        withItem: 'Elemental iron ≥25 mg',
        separation: 'Avoid taking them at the same time when possible.',
        note: 'Substantial iron doses can reduce zinc absorption.',
      ),
    ],
    safety: [
      'Nausea and GI upset are common; food can improve tolerance.',
      'Zinc 50 mg/day or more for weeks can inhibit copper absorption and impair immune/lipid parameters.',
      'Check multivitamins, cold lozenges and stand-alone zinc together before judging the total dose.',
      'Do not continue a therapeutic diarrhea course indefinitely.',
    ],
  ),
];

MineralToolkitEntry mineralEntry(MineralId id) {
  return mineralToolkitEntries.singleWhere((entry) => entry.id == id);
}

ElementalConversionResult elementalFromSalt({
  required double saltAmountMg,
  required double elementalFraction,
}) {
  final safeSalt = saltAmountMg < 0 ? 0.0 : saltAmountMg;
  final safeFraction = elementalFraction < 0 ? 0.0 : elementalFraction;
  return ElementalConversionResult(
    saltAmountMg: safeSalt,
    elementalAmountMg: safeSalt * safeFraction,
    elementalFraction: safeFraction,
  );
}

ElementalConversionResult saltFromElemental({
  required double elementalAmountMg,
  required double elementalFraction,
}) {
  final safeElemental = elementalAmountMg < 0 ? 0.0 : elementalAmountMg;
  final safeFraction = elementalFraction <= 0 ? 0.0 : elementalFraction;
  final saltAmount =
      safeFraction == 0 ? 0.0 : safeElemental / safeFraction;
  return ElementalConversionResult(
    saltAmountMg: saltAmount,
    elementalAmountMg: safeElemental,
    elementalFraction: safeFraction,
  );
}

int calciumSplitDoseCount(double supplementalElementalCalciumMg) {
  if (supplementalElementalCalciumMg <= 0) return 0;
  return (supplementalElementalCalciumMg / 500).ceil();
}
