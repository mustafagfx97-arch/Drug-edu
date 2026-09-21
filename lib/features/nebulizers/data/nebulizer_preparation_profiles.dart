import '../domain/nebulizer_preparation_profile.dart';

const nebulizerPreparationProfiles = <NebulizerPreparationProfile>[
  NebulizerPreparationProfile(
    id: 'albuterol-0083-rtu',
    name: 'Albuterol 0.083% unit-dose solution',
    formulation: '2.5 mg albuterol / 3 mL sterile unit-dose vial',
    status: 'Ready to use — NO routine dilution',
    device: 'Standard jet nebulizer connected to an air compressor; mouthpiece or suitable face mask.',
    doses: [
      NebulizerDosePreparation(
        label: 'Whole unit-dose vial',
        prescribedDose: '2.5 mg albuterol',
        sourceStrength: '2.5 mg / 3 mL (0.083%)',
        drawVolume: 'Use the full 3 mL vial; do not draw from a multidose concentrate.',
        diluent: 'None.',
        finalVolume: '3 mL',
      ),
    ],
    preparation: [
      'Remove one vial from the foil pouch immediately before use.',
      'Twist off the top and squeeze the ENTIRE 3 mL into the nebulizer reservoir.',
      'Do not add saline simply to “make volume”; this formulation is already ready to use.',
    ],
    administration: [
      'Sit upright.',
      'Use mouthpiece or a well-fitting mask.',
      'Turn on the compressor and breathe calmly, deeply and evenly through the mouth.',
      'Continue until no more mist is formed; product IFU examples state about 5–15 minutes.',
    ],
    mixing:
        'The albuterol unit-dose label does not establish a general “mix with anything” rule. If intentional co-nebulization with ipratropium is prescribed, the ipratropium 0.02% label specifically supports mixing with albuterol when used within 1 hour. Do not extrapolate this permission to other drugs.',
    doNot: [
      'Do not dilute the ready-to-use 0.083% 3 mL vial routinely.',
      'Do not confuse this with albuterol 0.5% concentrate.',
      'Do not use distilled drinking water as a nebulizer diluent.',
    ],
    cleaning:
        'After treatment, clean the nebulizer according to the device manufacturer instructions.',
    practicalAr:
        'Albuterol 0.083% (2.5 mg/3 mL): الأمبولة جاهزة. ضع 3 mL كاملة داخل الـnebulizer بدون إضافة normal saline. شغّل الجهاز والتنفس يكون بهدوء من الفم حتى ينتهي الرذاذ، ثم نظّف الجهاز.',
    source:
        'DailyMed · Albuterol Sulfate Inhalation Solution 0.083%, 2.5 mg/3 mL · current unit-dose IFU',
  ),
  NebulizerPreparationProfile(
    id: 'albuterol-05-concentrate',
    name: 'Albuterol 0.5% concentrate',
    formulation: '5 mg/mL albuterol concentrate in multidose bottle',
    status: 'CONCENTRATE — must be diluted with sterile normal saline',
    device: 'Standard jet nebulizer connected to air compressor.',
    doses: [
      NebulizerDosePreparation(
        label: '1.25 mg preparation',
        prescribedDose: '1.25 mg albuterol',
        sourceStrength: '5 mg/mL (0.5%)',
        drawVolume: '0.25 mL concentrate',
        diluent: 'Add 2.75 mL STERILE normal saline (0.9% sodium chloride).',
        finalVolume: '3 mL',
      ),
      NebulizerDosePreparation(
        label: '2.5 mg preparation',
        prescribedDose: '2.5 mg albuterol',
        sourceStrength: '5 mg/mL (0.5%)',
        drawVolume: '0.5 mL concentrate',
        diluent: 'Add 2.5 mL STERILE normal saline (0.9% sodium chloride).',
        finalVolume: '3 mL',
      ),
    ],
    preparation: [
      'Confirm the bottle says 0.5% concentrate / 5 mg per mL.',
      'Measure the prescribed concentrate volume with the marked dropper or an appropriate calibrated device.',
      'Place concentrate in the nebulizer reservoir.',
      'Add sterile normal saline to a TOTAL volume of 3 mL using the product-label recipe.',
      'Gently swirl to mix.',
    ],
    administration: [
      'Connect the reservoir to mouthpiece or mask and then to the compressor.',
      'Sit upright and breathe calmly/deeply/evenly through the mouth.',
      'Continue until no more mist is formed; label examples state about 5–15 minutes.',
    ],
    mixing:
        'Do not invent admixtures. Ipratropium 0.02% labeling supports mixing ipratropium with albuterol if the mixture is used within 1 hour; other combinations require exact compatibility evidence.',
    doNot: [
      'Do not nebulize 0.5% concentrate undiluted.',
      'Do not replace sterile normal saline with tap water or distilled drinking water.',
      'Do not use the 0.25 mL or 0.5 mL draw instruction unless the prescribed dose matches 1.25 mg or 2.5 mg respectively.',
    ],
    cleaning: 'Clean the nebulizer promptly according to manufacturer instructions.',
    practicalAr:
        'Albuterol 0.5% = 5 mg/mL وهو مركز. جرعة 1.25 mg: اسحب 0.25 mL + أضف 2.75 mL sterile NS = 3 mL. جرعة 2.5 mg: اسحب 0.5 mL + أضف 2.5 mL sterile NS = 3 mL. لا تستخدم ماء مقطر للشرب بدل الـsterile normal saline.',
    source:
        'DailyMed · Albuterol Sulfate Inhalation Solution 0.5% concentrate · dilution and IFU',
  ),
  NebulizerPreparationProfile(
    id: 'ipratropium-002',
    name: 'Ipratropium bromide 0.02%',
    formulation: '0.5 mg / 2.5 mL sterile unit-dose vial in normal saline',
    status: 'Ready to use — full 2.5 mL vial',
    device: 'Jet nebulizer/compressor with mouthpiece or mask.',
    doses: [
      NebulizerDosePreparation(
        label: 'Unit-dose vial',
        prescribedDose: '0.5 mg ipratropium',
        sourceStrength: '0.5 mg / 2.5 mL (0.02%)',
        drawVolume: 'Use entire 2.5 mL vial.',
        diluent: 'None routinely required.',
        finalVolume: '2.5 mL',
      ),
    ],
    preparation: [
      'Open one unit-dose vial and squeeze the full contents into the nebulizer reservoir.',
      'No extra saline is required for this labeled unit-dose preparation.',
    ],
    administration: [
      'Sit upright; use mouthpiece when practical or ensure a well-fitting mask.',
      'Avoid aerosol leaking into the eyes.',
      'Breathe calmly, deeply and evenly until mist stops; label examples state about 5–15 minutes.',
    ],
    mixing:
        'Label-supported: may be mixed in the nebulizer with albuterol or metaproterenol if used within 1 hour. Stability/safety with other drugs has not been established.',
    doNot: [
      'Do not routinely mix with drugs other than the explicitly supported albuterol/metaproterenol combination.',
      'Avoid directing mask aerosol into the eyes because anticholinergic ocular effects can occur.',
    ],
    cleaning: 'Clean the nebulizer after use according to manufacturer instructions.',
    practicalAr:
        'Ipratropium 0.02% = 0.5 mg/2.5 mL: استخدم الأمبولة 2.5 mL كاملة بدون تخفيف روتيني. يمكن خلطها مع albuterol إذا استُخدم الخليط خلال ساعة حسب النشرة؛ لا نعمم ذلك على باقي الأدوية.',
    source:
        'DailyMed · Ipratropium Bromide Inhalation Solution 0.02% · revised Jul 2026 / label mixing statement',
  ),
  NebulizerPreparationProfile(
    id: 'ipratropium-albuterol-3ml',
    name: 'Ipratropium + albuterol unit-dose solution',
    formulation: '0.5 mg ipratropium + 3 mg albuterol sulfate (equivalent 2.5 mg albuterol base) / 3 mL',
    status: 'Ready-to-use combination vial — NO mixing or dilution needed',
    device: 'Nebulizer/compressor system as directed by product and healthcare provider.',
    doses: [
      NebulizerDosePreparation(
        label: 'Whole combination vial',
        prescribedDose: '0.5 mg ipratropium + 2.5 mg albuterol base',
        sourceStrength: 'Combination in 3 mL',
        drawVolume: 'Use one entire 3 mL vial.',
        diluent: 'None.',
        finalVolume: '3 mL',
      ),
    ],
    preparation: [
      'Remove one vial from foil pouch.',
      'Twist off the cap and squeeze all 3 mL into the nebulizer reservoir.',
      'Use one new vial per treatment.',
    ],
    administration: [
      'Sit upright with mouthpiece or mask.',
      'Breathe calmly, deeply and evenly until no mist remains; label example about 5–15 minutes.',
    ],
    mixing:
        'This is already the fixed ipratropium/albuterol combination. Current label says no mixing or dilution is needed; do not add additional nebulized medicine to the chamber without separate compatibility evidence and a clinical reason.',
    doNot: [
      'Do not add more albuterol or ipratropium automatically.',
      'Do not dilute a ready-to-use 3 mL vial without an exact clinical/device reason.',
    ],
    cleaning: 'Clean nebulizer after each treatment per device instructions.',
    practicalAr:
        'Ipratropium + albuterol 3 mL: جاهز للاستعمال. افتح الأمبولة وضع 3 mL كلها في الجهاز؛ لا تضف saline ولا دواء آخر بصورة روتينية.',
    source:
        'DailyMed · Ipratropium Bromide and Albuterol Sulfate Inhalation Solution · current 3 mL unit-dose IFU',
  ),
  NebulizerPreparationProfile(
    id: 'budesonide-suspension',
    name: 'Budesonide inhalation suspension',
    formulation: '0.25 mg/2 mL, 0.5 mg/2 mL, or 1 mg/2 mL single-dose ampules',
    status: 'Ready-to-use SUSPENSION — administer separately',
    device: 'Jet nebulizer connected to air compressor. Ultrasonic nebulizers are NOT recommended.',
    doses: [
      NebulizerDosePreparation(
        label: '0.25 mg strength',
        prescribedDose: '0.25 mg',
        sourceStrength: '0.25 mg / 2 mL',
        drawVolume: 'Use entire 2 mL ampule.',
        diluent: 'None routinely added.',
        finalVolume: '2 mL',
      ),
      NebulizerDosePreparation(
        label: '0.5 mg strength',
        prescribedDose: '0.5 mg',
        sourceStrength: '0.5 mg / 2 mL',
        drawVolume: 'Use entire 2 mL ampule.',
        diluent: 'None routinely added.',
        finalVolume: '2 mL',
      ),
      NebulizerDosePreparation(
        label: '1 mg strength',
        prescribedDose: '1 mg',
        sourceStrength: '1 mg / 2 mL',
        drawVolume: 'Use entire 2 mL ampule.',
        diluent: 'None routinely added.',
        finalVolume: '2 mL',
      ),
    ],
    preparation: [
      'Remove one ampule from the foil pouch; return remaining ampules to the pouch.',
      'GENTLY shake the ampule using a circular motion.',
      'Hold upright, twist off top, and slowly squeeze the entire 2 mL into the nebulizer cup.',
      'Use opened ampule promptly.',
    ],
    administration: [
      'Use a jet nebulizer with adequate compressor airflow and mouthpiece or suitable mask.',
      'After the steroid treatment, rinse the mouth and spit.',
      'If a face mask is used, wash the face afterward to reduce local steroid exposure.',
    ],
    mixing:
        'Mixing with other nebulizable medicines has NOT been adequately assessed in the label. Administer budesonide inhalation suspension separately.',
    doNot: [
      'Do not use an ultrasonic nebulizer for this product.',
      'Do not mix routinely with albuterol/ipratropium just because they are also nebulized.',
      'Do not swallow the suspension.',
    ],
    cleaning: 'Clean the jet nebulizer per manufacturer instructions after use.',
    practicalAr:
        'Budesonide respule: كل strength يأتي 2 mL جاهز. حرّك الأمبولة بلطف بحركة دائرية، اعصر 2 mL كلها في jet nebulizer. لا تخلطه مع أدوية nebulizer أخرى لأن النشرة تطلب إعطاءه منفصلًا. بعده مضمضة وبصق، واغسل الوجه إذا استُخدم mask.',
    source:
        'DailyMed · Budesonide Inhalation Suspension · current IFU and mixing statement',
  ),
  NebulizerPreparationProfile(
    id: 'levalbuterol-rtu',
    name: 'Levalbuterol ready-to-use solution',
    formulation: '0.31 mg/3 mL, 0.63 mg/3 mL, or 1.25 mg/3 mL unit-dose vials',
    status: 'Ready to use — NO dilution',
    device: 'Standard jet nebulizer with mouthpiece or mask and air compressor.',
    doses: [
      NebulizerDosePreparation(
        label: '0.31 mg vial',
        prescribedDose: '0.31 mg',
        sourceStrength: '0.31 mg / 3 mL',
        drawVolume: 'Use entire 3 mL vial.',
        diluent: 'None.',
        finalVolume: '3 mL',
      ),
      NebulizerDosePreparation(
        label: '0.63 mg vial',
        prescribedDose: '0.63 mg',
        sourceStrength: '0.63 mg / 3 mL',
        drawVolume: 'Use entire 3 mL vial.',
        diluent: 'None.',
        finalVolume: '3 mL',
      ),
      NebulizerDosePreparation(
        label: '1.25 mg vial',
        prescribedDose: '1.25 mg',
        sourceStrength: '1.25 mg / 3 mL',
        drawVolume: 'Use entire 3 mL vial.',
        diluent: 'None.',
        finalVolume: '3 mL',
      ),
    ],
    preparation: [
      'Verify this is the 3 mL READY-TO-USE formulation.',
      'Open one vial and place the entire 3 mL in the reservoir.',
    ],
    administration: [
      'Use standard jet nebulizer/compressor and breathe the mist through mouthpiece or mask until treatment is complete.',
    ],
    mixing:
        'Do not assume compatibility with other nebulized medicines unless the exact products have supporting evidence.',
    doNot: [
      'Do not add saline to the 3 mL ready-to-use vial routinely.',
      'Do not confuse with the 1.25 mg/0.5 mL levalbuterol concentrate.',
    ],
    cleaning: 'Clean equipment according to manufacturer instructions.',
    practicalAr:
        'Levalbuterol 3 mL unit-dose (0.31 أو 0.63 أو 1.25 mg): جاهز، استخدم 3 mL كاملة بدون تخفيف. انتبه لا تخلطه مع concentrate 1.25 mg/0.5 mL.',
    source:
        'DailyMed · Levalbuterol Inhalation Solution 0.31/0.63/1.25 mg per 3 mL · current label',
  ),
  NebulizerPreparationProfile(
    id: 'levalbuterol-concentrate',
    name: 'Levalbuterol concentrate (XOPENEX-type)',
    formulation: '1.25 mg / 0.5 mL concentrate unit-dose vial',
    status: 'CONCENTRATE — dilute with sterile normal saline',
    device: 'Standard jet nebulizer connected to air compressor.',
    doses: [
      NebulizerDosePreparation(
        label: '1.25 mg concentrate vial',
        prescribedDose: '1.25 mg levalbuterol',
        sourceStrength: '1.25 mg / 0.5 mL',
        drawVolume: 'Use entire 0.5 mL concentrate vial.',
        diluent: 'Add 2.5 mL sterile normal saline (unless prescriber directs a different validated amount).',
        finalVolume: '3 mL using the standard IFU recipe',
      ),
    ],
    preparation: [
      'Open the concentrate vial and squeeze the entire 0.5 mL into the nebulizer reservoir.',
      'Add 2.5 mL sterile normal saline.',
      'Gently swirl to mix.',
    ],
    administration: [
      'Connect to standard jet nebulizer/compressor, sit upright, and inhale via mouthpiece or mask until mist stops.',
    ],
    mixing:
        'No blanket admixture permission. Use only exact compatibility evidence for any added nebulized drug.',
    doNot: [
      'Do not nebulize the 0.5 mL concentrate undiluted.',
      'Do not use the concentrate to prepare doses below 1.25 mg; current label directs use of the non-concentrate 3 mL formulation for lower doses.',
      'Use sterile normal saline, not household/distilled drinking water.',
    ],
    cleaning: 'Clean nebulizer according to device instructions.',
    practicalAr:
        'Levalbuterol concentrate 1.25 mg/0.5 mL: ضع 0.5 mL كاملة + 2.5 mL sterile normal saline = 3 mL. لا يُعطى مركزًا بدون تخفيف، ولجرعات أقل تُستخدم ready-to-use formulations حسب النشرة.',
    source:
        'DailyMed · XOPENEX / levalbuterol inhalation solution concentrate 1.25 mg/0.5 mL · IFU',
  ),
  NebulizerPreparationProfile(
    id: 'arformoterol',
    name: 'Arformoterol inhalation solution',
    formulation: '15 mcg / 2 mL unit-dose vial',
    status: 'Ready to use — NO dilution',
    device: 'Standard jet nebulizer with mouthpiece or mask connected to air compressor.',
    doses: [
      NebulizerDosePreparation(
        label: 'Unit-dose vial',
        prescribedDose: '15 mcg',
        sourceStrength: '15 mcg / 2 mL',
        drawVolume: 'Use entire 2 mL vial.',
        diluent: 'None.',
        finalVolume: '2 mL',
      ),
    ],
    preparation: ['Open immediately before use and empty the full 2 mL vial into the nebulizer cup.'],
    administration: [
      'Use standard jet nebulizer/compressor.',
      'This is maintenance COPD therapy, not a rescue treatment for acute bronchospasm.',
    ],
    mixing:
        'Physical/chemical compatibility, efficacy and safety when mixed with other nebulized drugs have not been established.',
    doNot: [
      'Do not dilute routinely.',
      'Do not use as rescue medicine.',
      'Do not use LABA monotherapy for asthma; this nebulized product is not indicated for asthma.',
    ],
    cleaning: 'Clean nebulizer per manufacturer instructions.',
    practicalAr:
        'Arformoterol 15 mcg/2 mL: استخدم 2 mL كاملة بدون تخفيف. دواء صيانة COPD وليس إسعافًا، ولا تخلطه مع أدوية أخرى لأن compatibility غير مثبتة.',
    source: 'DailyMed · Arformoterol Tartrate Inhalation Solution 15 mcg/2 mL · current label',
  ),
  NebulizerPreparationProfile(
    id: 'formoterol-neb',
    name: 'Formoterol fumarate inhalation solution',
    formulation: '20 mcg / 2 mL unit-dose vial (PERFOROMIST-type)',
    status: 'Ready to use — NO dilution',
    device: 'Standard jet nebulizer connected to an air compressor.',
    doses: [
      NebulizerDosePreparation(
        label: 'Unit-dose vial',
        prescribedDose: '20 mcg',
        sourceStrength: '20 mcg / 2 mL',
        drawVolume: 'Use entire 2 mL vial.',
        diluent: 'None.',
        finalVolume: '2 mL',
      ),
    ],
    preparation: ['Remove from foil immediately before use and squeeze entire 2 mL into reservoir.'],
    administration: [
      'Use standard jet nebulizer; product examples show about 9 minutes with the tested PARI system.',
      'Maintenance COPD therapy, not acute rescue.',
    ],
    mixing:
        'Compatibility, efficacy and safety with other nebulized drugs have not been established; PERFOROMIST patient instructions say not to mix with other medicines in the nebulizer.',
    doNot: [
      'Do not dilute routinely.',
      'Do not mix with another nebulized medicine in the same cup.',
      'Do not use as rescue treatment or LABA monotherapy for asthma.',
    ],
    cleaning: 'Follow nebulizer/compressor manufacturer cleaning instructions.',
    practicalAr:
        'Formoterol neb 20 mcg/2 mL: الأمبولة 2 mL كاملة بدون saline. لا تخلط معها دواء آخر في نفس chamber. هي صيانة COPD وليست rescue.',
    source:
        'DailyMed · PERFOROMIST / formoterol fumarate inhalation solution 20 mcg/2 mL · current label/IFU',
  ),
  NebulizerPreparationProfile(
    id: 'revefenacin',
    name: 'Revefenacin (YUPELRI)',
    formulation: '175 mcg / 3 mL unit-dose vial',
    status: 'Ready to use — NO dilution',
    device: 'Standard jet nebulizer connected to air compressor; label clinical trials used PARI LC Sprint with mouthpiece.',
    doses: [
      NebulizerDosePreparation(
        label: 'Unit-dose vial',
        prescribedDose: '175 mcg',
        sourceStrength: '175 mcg / 3 mL',
        drawVolume: 'Use entire 3 mL vial.',
        diluent: 'None.',
        finalVolume: '3 mL',
      ),
    ],
    preparation: [
      'Remove the vial from foil and open IMMEDIATELY before use.',
      'Empty all 3 mL into the nebulizer cup and discard residual contents after treatment.',
    ],
    administration: ['Administer by oral inhalation through a standard jet nebulizer with mouthpiece.'],
    mixing:
        'Drug compatibility, efficacy and safety when YUPELRI is mixed with other drugs in a nebulizer have not been established.',
    doNot: [
      'Do not dilute.',
      'Do not pre-mix with another nebulized drug.',
      'Discard solution that is not clear and colorless.',
    ],
    cleaning: 'Clean nebulizer according to manufacturer instructions.',
    practicalAr:
        'YUPELRI 175 mcg/3 mL: 3 mL كاملة، لا تخفيف ولا خلط. افتحها مباشرة قبل الاستعمال وتخلص من أي بقايا.',
    source: 'DailyMed · YUPELRI (revefenacin) 175 mcg/3 mL · current prescribing information',
  ),
  NebulizerPreparationProfile(
    id: 'dornase-alfa',
    name: 'Dornase alfa (PULMOZYME)',
    formulation: '2.5 mg / 2.5 mL single-dose ampule',
    status: 'Ready to use — DO NOT dilute or mix',
    device: 'Use only a nebulizer system listed/allowed in the current PULMOZYME labeling for the patient/device context.',
    doses: [
      NebulizerDosePreparation(
        label: 'Single ampule',
        prescribedDose: '2.5 mg',
        sourceStrength: '1 mg/mL = 2.5 mg / 2.5 mL',
        drawVolume: 'Use entire 2.5 mL ampule.',
        diluent: 'NONE — do not dilute.',
        finalVolume: '2.5 mL',
      ),
    ],
    preparation: [
      'Squeeze ampule before opening to check for leaks.',
      'Discard if cloudy or discolored.',
      'Open and use the entire ampule; discard unused contents.',
    ],
    administration: ['Use the product-approved jet or vibrating-mesh nebulizer system and follow its IFU.'],
    mixing:
        'DO NOT mix PULMOZYME with any other drug in the nebulizer. Mixing can cause physicochemical or functional changes.',
    doNot: [
      'Do not dilute.',
      'Do not mix with tobramycin or any other nebulized medicine.',
      'Do not transfer device instructions from an unlisted nebulizer without product-specific confirmation.',
    ],
    cleaning: 'Clean/disinfect equipment according to the selected nebulizer manufacturer manual.',
    practicalAr:
        'Pulmozyme 2.5 mg/2.5 mL: استخدم 2.5 mL كاملة. ممنوع التخفيف وممنوع الخلط مع أي دواء آخر في nebulizer. استخدم جهازًا معتمدًا ضمن تعليمات المنتج.',
    source: 'DailyMed · PULMOZYME (dornase alfa) · current FDA labeling and IFU',
  ),
  NebulizerPreparationProfile(
    id: 'acetylcysteine',
    name: 'Acetylcysteine inhalation solution',
    formulation: '10% (100 mg/mL) or 20% (200 mg/mL) mucolytic solution',
    status: 'Concentration- and volume-specific; 20% MAY be diluted with approved sterile diluents',
    device: 'Nebulizer suitable for face mask, mouthpiece or tracheostomy; equipment material/cleaning matters because residue can occlude/corrode parts.',
    doses: [
      NebulizerDosePreparation(
        label: 'Common 20% nebulization volume',
        prescribedDose: 'Most-patient label range: 3–5 mL of 20% solution',
        sourceStrength: '20% = 200 mg/mL',
        drawVolume: '3–5 mL when that exact regimen is prescribed',
        diluent:
            'May be used at prescribed concentration or diluted lower with Sodium Chloride Injection, Sodium Chloride Inhalation Solution, Sterile Water for Injection, or Sterile Water for Inhalation.',
        finalVolume: 'Depends on prescribed concentration/device; no single universal final volume.',
      ),
      NebulizerDosePreparation(
        label: 'Common 10% nebulization volume',
        prescribedDose: 'Most-patient label range: 6–10 mL of 10% solution',
        sourceStrength: '10% = 100 mg/mL',
        drawVolume: '6–10 mL when that exact regimen is prescribed',
        diluent: '10% solution may be used undiluted.',
        finalVolume: '6–10 mL for the common undiluted label range.',
      ),
    ],
    preparation: [
      'Confirm 10% versus 20% before drawing any volume.',
      'For 20%, use only an approved sterile diluent if dilution is clinically/device indicated.',
      'If only part of a vial is used, refrigerate the remainder and use for inhalation within 96 hours per current label.',
    ],
    administration: [
      'Nebulize via prescribed mask, mouthpiece or tracheostomy setup.',
      'Bronchospasm can occur; bronchodilator planning may be clinically relevant in susceptible patients.',
      'Clean equipment immediately after use because acetylcysteine residue can occlude fine orifices/corrode metal parts.',
    ],
    mixing:
        'Do not use the old compatibility table as a blanket recommendation to mix. Current label says drug stability/safety of nebulizer mixtures is not established and specifically lists several antibiotics (e.g. tetracycline HCl, oxytetracycline HCl, erythromycin lactobionate; also ampicillin in compatibility table) as incompatible. If an admixture is clinically chosen from validated compatibility data, prepare/use promptly and do not store unused mixture.',
    doNot: [
      'Do not use household/distilled drinking water. Approved diluents are sterile medical products specified in the label.',
      'Do not assume 10% and 20% use the same volume.',
      'Do not store prepared admixtures with other drugs.',
    ],
    cleaning: 'Clean nebulizing equipment immediately after use.',
    practicalAr:
        'Acetylcysteine: تأكد أولًا 10% أم 20%. الشائع في النشرة: 20% حجم 3–5 mL، و10% حجم 6–10 mL. الـ20% يمكن تخفيفه فقط بمذيبات sterile محددة في النشرة مثل sterile NS أو sterile water for injection/inhalation؛ لا تستخدم ماء مقطر منزلي. خلطه مع أدوية أخرى ليس قاعدة عامة وبعض المضادات غير متوافقة.',
    source: 'DailyMed · Acetylcysteine Solution 10% and 20% · current inhalation and compatibility labeling',
  ),
  NebulizerPreparationProfile(
    id: 'tobramycin-inhalation',
    name: 'Tobramycin inhalation solution',
    formulation: '300 mg / 5 mL single-dose ampule (TOBI/KITABIS-type solution)',
    status: 'Ready to use — DO NOT dilute or mix',
    device: 'Exact product labeling specifies PARI LC PLUS reusable nebulizer with the stated compressor for the cited solution product.',
    doses: [
      NebulizerDosePreparation(
        label: 'Single ampule',
        prescribedDose: '300 mg',
        sourceStrength: '300 mg / 5 mL',
        drawVolume: 'Use entire 5 mL ampule.',
        diluent: 'NONE.',
        finalVolume: '5 mL',
      ),
    ],
    preparation: [
      'Inspect solution; do not use if cloudy or particulate.',
      'Empty one entire 5 mL ampule into the specified nebulizer.',
      'Do not dilute.',
    ],
    administration: [
      'Sit or stand upright and breathe normally through the mouthpiece.',
      'Treatment takes about 15 minutes with the labeled system.',
      'When multiple cystic-fibrosis therapies are used, label instructs other therapies before inhaled tobramycin or as directed by the clinician.',
    ],
    mixing:
        'DO NOT mix or dilute tobramycin inhalation solution with dornase alfa or other medicines in the nebulizer.',
    doNot: [
      'Do not mix with PULMOZYME.',
      'Do not substitute an IV tobramycin vial into this inhalation recipe.',
      'Do not use an unapproved nebulizer for a product whose label specifies the delivery system.',
    ],
    cleaning: 'Clean/disinfect the reusable nebulizer according to its manufacturer instructions.',
    practicalAr:
        'Tobramycin inhalation solution 300 mg/5 mL: استخدم 5 mL كاملة، بدون تخفيف وبدون خلط مع Pulmozyme أو أي دواء آخر. العلاج نحو 15 دقيقة بالجهاز المحدد في المنتج.',
    source: 'DailyMed · Tobramycin Inhalation Solution 300 mg/5 mL · current labeling',
  ),

  NebulizerPreparationProfile(
    id: 'albuterol-lower-strength-rtu',
    name: 'Albuterol 0.63 mg/3 mL and 1.25 mg/3 mL unit-dose solution',
    formulation:
        'Sterile preservative-free albuterol sulfate inhalation solution in 3 mL unit-dose vials: 0.63 mg/3 mL (0.021%) or 1.25 mg/3 mL (0.042%), potency expressed as albuterol.',
    status: 'Ready to use — NO mixing or dilution',
    device:
        'Jet nebulizer with adequate airflow, mouthpiece or suitable face mask. The cited label was studied with PARI LC Plus + PARI PRONEB; safety/efficacy with other nebulizer systems was not established in that label.',
    doses: [
      NebulizerDosePreparation(
        label: '0.63 mg unit-dose vial',
        prescribedDose: '0.63 mg albuterol',
        sourceStrength: '0.63 mg / 3 mL (0.021%)',
        drawVolume: 'Use the entire 3 mL single-dose vial.',
        diluent: 'None — no mixing or dilution is needed.',
        finalVolume: '3 mL',
      ),
      NebulizerDosePreparation(
        label: '1.25 mg unit-dose vial',
        prescribedDose: '1.25 mg albuterol',
        sourceStrength: '1.25 mg / 3 mL (0.042%)',
        drawVolume: 'Use the entire 3 mL single-dose vial.',
        diluent: 'None — no mixing or dilution is needed.',
        finalVolume: '3 mL',
      ),
    ],
    preparation: [
      'Confirm the exact lower-strength unit-dose vial: 0.63 mg/3 mL or 1.25 mg/3 mL.',
      'Remove one vial from the foil pouch immediately before use and return remaining vials to the pouch.',
      'Twist off the top and squeeze the entire 3 mL into the nebulizer reservoir.',
    ],
    administration: [
      'Sit comfortably upright and use the mouthpiece or a suitable face mask.',
      'Breathe calmly, deeply and evenly through the mouth until no more mist forms; the cited IFU describes about 5–15 minutes.',
    ],
    mixing:
        'The cited product is ready to use and requires no mixing or dilution. Do not add another nebulized medicine unless the exact combination has separate compatibility evidence.',
    doNot: [
      'Do not add saline to these 3 mL ready-to-use vials.',
      'Do not confuse these lower-strength vials with albuterol 0.5% (5 mg/mL) concentrate.',
      'Do not use a household or drinking-water product as nebulizer diluent.',
    ],
    cleaning: 'Clean the nebulizer after each treatment according to the nebulizer manufacturer instructions.',
    practicalAr:
        'Albuterol 0.63 mg/3 mL أو 1.25 mg/3 mL: هذه أمبولات جاهزة للاستعمال. استخدم 3 mL كاملة بدون إضافة normal saline. لا تخلطها مع albuterol 0.5% concentrate.',
    source:
        'DailyMed · Albuterol Sulfate Inhalation Solution 0.63 mg/3 mL and 1.25 mg/3 mL · current unit-dose labeling; no dilution required',
  ),
  NebulizerPreparationProfile(
    id: 'cromolyn-sodium-20mg-2ml',
    name: 'Cromolyn sodium inhalation solution',
    formulation:
        'Cromolyn Sodium Inhalation Solution, USP 20 mg/2 mL; sterile, preservative-free, single-dose aqueous solution for nebulization.',
    status: 'Ready-to-use single-dose vial — use fresh vial each treatment',
    device:
        'Power-driven nebulizer with adequate airflow and a suitable mask or mouthpiece. The cited IFU specifies 6–8 L/min; hand-operated nebulizers are not suitable.',
    doses: [
      NebulizerDosePreparation(
        label: 'Single-dose vial',
        prescribedDose: '20 mg cromolyn sodium',
        sourceStrength: '20 mg / 2 mL',
        drawVolume: 'Use the entire fresh 2 mL vial.',
        diluent: 'No dilution step is specified in the cited IFU.',
        finalVolume: '2 mL',
      ),
    ],
    preparation: [
      'Remove one fresh 2 mL vial from the protective pouch/tray at time of use.',
      'Twist off the top and squeeze the entire vial into the nebulizer solution container.',
      'Do not use if the solution is discolored, cloudy or contains a precipitate.',
    ],
    administration: [
      'Use a power-driven nebulizer at the product-specified airflow, with mouthpiece or suitable mask.',
      'Breathe in through the mouth and out through the nose in a normal relaxed manner; the cited IFU describes about 5–10 minutes.',
    ],
    mixing:
        'Drug stability and safety when cromolyn sodium inhalation solution is mixed with other drugs in a nebulizer have not been established.',
    doNot: [
      'Do not use a hand-operated nebulizer for this product.',
      'Do not mix routinely with other nebulized medicines.',
      'Do not use as a rescue bronchodilator for an acute asthma attack.',
    ],
    cleaning: 'Clean the power-driven nebulizer according to its manufacturer instructions after treatment.',
    practicalAr:
        'Cromolyn sodium 20 mg/2 mL: استخدم الأمبولة 2 mL كاملة في power-driven nebulizer. لا تضف دواء آخر في نفس chamber لأن ثبات وسلامة الخلط غير مثبتين. ليس دواء rescue للنوبة الحادة.',
    source:
        'DailyMed · Cromolyn Sodium Inhalation Solution, USP 20 mg/2 mL · revised Dec 2025 · current IFU',
  ),
  NebulizerPreparationProfile(
    id: 'cayston-aztreonam-75mg',
    name: 'Aztreonam for inhalation solution (CAYSTON)',
    formulation:
        'CAYSTON single-use vial containing 75 mg lyophilized aztreonam, supplied with a 1 mL ampule of sterile 0.17% sodium chloride diluent.',
    status: 'RECONSTITUTE immediately before use with the supplied 1 mL diluent only',
    device:
        'Altera Nebulizer System only. The FDA labeling states CAYSTON should not be administered with any other nebulizer.',
    doses: [
      NebulizerDosePreparation(
        label: 'One CAYSTON vial',
        prescribedDose: '75 mg aztreonam',
        sourceStrength: '75 mg lyophilized powder per single-use vial',
        drawVolume: 'Use the entire reconstituted vial.',
        diluent: 'Add the entire supplied 1 mL ampule of sterile 0.17% sodium chloride.',
        finalVolume: 'Approximately 1 mL reconstituted solution',
      ),
    ],
    preparation: [
      'Do not reconstitute until ready to administer the dose.',
      'Open one CAYSTON vial and one supplied saline ampule.',
      'Squeeze the entire 1 mL diluent ampule into the CAYSTON vial.',
      'Replace the rubber stopper and gently swirl until the powder is fully dissolved and the solution is clear.',
      'If cloudy or particulate, discard the dose and prepare a new vial with a new supplied diluent ampule.',
      'Use the reconstituted dose immediately.',
    ],
    administration: [
      'Pour all reconstituted CAYSTON into the Altera medication reservoir.',
      'Sit upright, seal lips around the mouthpiece, and breathe normally through the mouth; the current label describes about 2–3 minutes.',
      'When multiple inhaled therapies are prescribed, the label sequence is bronchodilator, then mucolytic, then CAYSTON.',
    ],
    mixing:
        'Do not mix CAYSTON with any other medicine in the Altera handset. Use only the supplied 0.17% sodium chloride diluent; do not substitute routine 0.9% normal saline.',
    doNot: [
      'Do not reconstitute with 0.9% sodium chloride or sterile water.',
      'Do not use another nebulizer system in place of Altera.',
      'Do not prepare doses in advance; use immediately after reconstitution.',
    ],
    cleaning:
        'Clean and disinfect the Altera Nebulizer Handset according to the manufacturer IFU after treatment.',
    practicalAr:
        'CAYSTON 75 mg: افتح الفيال فقط وقت الجرعة، أضف كامل 1 mL من الـdiluent المرفق 0.17% NaCl، أعد السدادة وحرّك بلطف حتى يذوب ويصبح المحلول صافياً، ثم استخدمه فوراً في جهاز Altera فقط. لا تستخدم NS 0.9% بدل المذيب المرفق ولا تخلطه مع دواء آخر.',
    source:
        'DailyMed · CAYSTON (aztreonam for inhalation solution) 75 mg/vial + supplied 1 mL 0.17% sodium chloride diluent · revised Dec 2025',
  ),
  NebulizerPreparationProfile(
    id: 'arikayce-590mg-8_4ml',
    name: 'Amikacin liposome inhalation suspension (ARIKAYCE)',
    formulation:
        'ARIKAYCE sterile liposomal suspension, 590 mg amikacin / 8.4 mL in a single-dose glass vial.',
    status: 'Ready-to-use SUSPENSION — room temperature before use; shake well',
    device:
        'Lamira Nebulizer System only. The FDA-approved Lamira IFU states the system is made specifically for ARIKAYCE and no other medicine should be placed in the handset.',
    doses: [
      NebulizerDosePreparation(
        label: 'One ARIKAYCE vial',
        prescribedDose: '590 mg amikacin',
        sourceStrength: '590 mg / 8.4 mL',
        drawVolume: 'Use the entire 8.4 mL single-dose vial.',
        diluent: 'None — the FDA IFU provides no dilution step.',
        finalVolume: '8.4 mL',
      ),
    ],
    preparation: [
      'If refrigerated, remove the vial at least 45 minutes before use so it reaches room temperature; do not use if frozen.',
      'Shake the vial for at least 10–15 seconds until the suspension looks uniform and well mixed.',
      'Open the vial carefully and pour the entire contents into the Lamira medication reservoir.',
      'Use an opened vial immediately and discard the vial after use.',
    ],
    administration: [
      'Use only with the Lamira Nebulizer System and its supplied handset/aerosol head.',
      'Sit relaxed and upright and take slow, deep breaths through the mouthpiece.',
      'If the patient uses an inhaled bronchodilator, the ARIKAYCE label instructs using the bronchodilator first.',
    ],
    mixing:
        'Do not place any other medicine in the Lamira handset. Do not dilute or combine ARIKAYCE with another nebulized medicine.',
    doNot: [
      'Do not use another nebulizer handset or aerosol head in place of the Lamira components supplied for ARIKAYCE.',
      'Do not use if the vial has been frozen.',
      'Do not swallow the vial contents or use the product by another route.',
    ],
    cleaning:
        'Rinse and clean the Lamira handset including the aerosol head immediately after every use, and disinfect after every use according to the FDA-approved Lamira IFU. Replace the aerosol head after 7 uses and the handset after 28 days as supplied with the kit.',
    practicalAr:
        'ARIKAYCE 590 mg/8.4 mL: أخرجه من الثلاجة قبل الاستعمال بـ45 دقيقة، ثم رجّ الفيال 10–15 ثانية حتى يصبح متجانساً. صب 8.4 mL كاملة في Lamira فقط، بدون تخفيف وبدون إضافة أي دواء آخر. نظّف وعقّم الـhandset بعد كل استعمال.',
    source:
        'DailyMed · ARIKAYCE (amikacin liposome inhalation suspension) 590 mg/8.4 mL · current Jun 2026 labeling and FDA-approved Lamira IFU',
  ),
  NebulizerPreparationProfile(
    id: 'pentamidine-inhalation-300mg',
    name: 'Pentamidine isethionate for inhalation',
    formulation:
        'Pentamidine isethionate 300 mg lyophilized powder in a single-dose vial for oral inhalation after reconstitution.',
    status: 'RECONSTITUTE with Sterile Water for Injection ONLY — saline causes precipitation',
    device:
        'Respirgard II nebulizer. The current label specifies 5–7 L/min from a 40–50 PSI air/oxygen source or equivalent compressor setup; low-pressure compressors are not suitable.',
    doses: [
      NebulizerDosePreparation(
        label: 'One 300 mg vial',
        prescribedDose: '300 mg pentamidine isethionate',
        sourceStrength: '300 mg lyophilized powder per vial',
        drawVolume: 'Place the entire reconstituted contents into the Respirgard II reservoir.',
        diluent: 'Add exactly 6 mL Sterile Water for Injection, USP.',
        finalVolume: '6 mL',
      ),
    ],
    preparation: [
      'Reconstitute one 300 mg vial with exactly 6 mL Sterile Water for Injection, USP.',
      'Dissolve completely and transfer the entire reconstituted contents to the Respirgard II reservoir.',
      'Fresh preparation is preferred; protect reconstituted solution from light.',
    ],
    administration: [
      'Administer through the Respirgard II until the chamber is empty; current labeling describes approximately 30–45 minutes.',
      'Use the product-specified airflow/pressure setup; low-pressure compressors below the labeled threshold are not appropriate.',
    ],
    mixing:
        'Do not mix pentamidine with any other medicine. Do not use saline for reconstitution because the drug will precipitate. Do not use the Respirgard II to administer a bronchodilator.',
    doNot: [
      'Do not reconstitute with normal saline.',
      'Do not mix another medication into the pentamidine solution.',
      'Do not use a low-pressure compressor or substitute an unverified nebulizer setup.',
    ],
    cleaning:
        'Handle and clean/dispose of Respirgard II components according to the device and institutional infection-control procedure.',
    practicalAr:
        'Pentamidine inhalation 300 mg: حل الفيال بـ6 mL Sterile Water for Injection فقط. ممنوع NS لأن الدواء يترسب. ضع كامل 6 mL في Respirgard II ولا تخلطه مع أي دواء آخر. الجلسة تقارب 30–45 دقيقة حسب النشرة.',
    source:
        'DailyMed · Pentamidine Isethionate for Inhalation 300 mg/vial · revised Mar/Jun 2026 · Respirgard II labeling',
  ),
  NebulizerPreparationProfile(
    id: 'hypertonic-sodium-chloride-3-7',
    name: 'Hypertonic sodium chloride inhalation solution 3% / 7%',
    formulation:
        'Nephron Sodium Chloride Inhalation Solution, USP: sterile preservative-free single-use 4 mL vials at 3% (120 mg/4 mL) or 7% (280 mg/4 mL), for respiratory therapy only.',
    status: 'Ready-to-use inhalation solution — concentration must match the prescription',
    device:
        'Nebulizer for respiratory therapy. The cited product labeling provides the solution and single-use handling but does not establish a universal disease-specific dose or device recipe.',
    doses: [
      NebulizerDosePreparation(
        label: '3% single-use vial',
        prescribedDose: 'Prescribed volume of 3% sodium chloride',
        sourceStrength: '3% = 30 mg/mL; 120 mg in 4 mL',
        drawVolume: 'Dispense only the prescribed volume; the unit-dose vial contains 4 mL.',
        diluent: 'None specified for the ready 3% inhalation solution.',
        finalVolume: 'Prescribed volume; whole vial = 4 mL',
      ),
      NebulizerDosePreparation(
        label: '7% single-use vial',
        prescribedDose: 'Prescribed volume of 7% sodium chloride',
        sourceStrength: '7% = 70 mg/mL; 280 mg in 4 mL',
        drawVolume: 'Dispense only the prescribed volume; the unit-dose vial contains 4 mL.',
        diluent: 'None specified for the ready 7% inhalation solution.',
        finalVolume: 'Prescribed volume; whole vial = 4 mL',
      ),
    ],
    preparation: [
      'Confirm 3% versus 7% before opening the vial.',
      'Twist/pull off the vial top, invert, and squeeze the prescribed volume into the nebulizer cup.',
      'Discard any unused portion of the single-use vial and any solution remaining in the nebulizer cup.',
    ],
    administration: [
      'Use only for respiratory therapy by nebulizer according to the clinical order.',
      'This profile does not choose the indication, treatment frequency or therapeutic concentration.',
    ],
    mixing:
        'The cited sodium chloride inhalation labels do not establish these hypertonic solutions as universal diluents for other nebulized drugs. Only mix when the exact other product explicitly supports that concentration and combination.',
    doNot: [
      'Do not inject or use parenterally.',
      'Do not substitute 7% for 3% or vice versa.',
      'Do not automatically use hypertonic saline as a diluent for another nebulized medicine.',
    ],
    cleaning: 'Clean the nebulizer according to the device manufacturer instructions after use.',
    practicalAr:
        'Hypertonic saline 3% أو 7% يأتي 4 mL single-use. تأكد من التركيز المكتوب في الوصفة، وضع الحجم الموصوف في nebulizer ثم تخلص من الباقي. لا تستبدل 3% بـ7%، ولا تستخدمه تلقائياً كمذيب لدواء آخر.',
    source:
        'DailyMed · Nephron Sodium Chloride Inhalation Solution, USP 3% and 7%, 4 mL single-use vials · current listed labeling',
  ),

];

NebulizerPreparationProfile? nebulizerPreparationById(String id) {
  for (final profile in nebulizerPreparationProfiles) {
    if (profile.id == id) return profile;
  }
  return null;
}
