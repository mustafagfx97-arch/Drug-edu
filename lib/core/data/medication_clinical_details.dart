import '../models/medication_clinical_detail.dart';

const medicationClinicalDetails = <String, MedicationClinicalDetail>{
  'losartan': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic/long-term for hypertension, CKD protection or heart-failure related indications. Duration is indication-driven rather than a fixed course.',
    exactAdministration:
        'Once or twice daily depending on the prescription; may be taken with or without food. Keep timing consistent.',
    monitoring:
        'Blood pressure, serum creatinine/eGFR and potassium after initiation/titration and when clinically indicated.',
    interactions:
        'Potassium supplements/salt substitutes, potassium-sparing diuretics, NSAIDs and dual RAAS blockade can increase risk.',
    specialPopulations:
        'Avoid in pregnancy. Use extra caution with dehydration, renal artery stenosis, advanced kidney disease or hyperkalemia.',
    clinicalPearls:
        'A rise in creatinine can occur after RAAS blockade; interpret in clinical context rather than stopping automatically.',
    commonMistakes:
        'Stopping because blood pressure “looks normal”; using potassium salt substitutes without review.',
    source: 'MedlinePlus / current ARB labeling',
  ),
  'metformin': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for type 2 diabetes while effective and tolerated; temporary interruption may be needed in selected acute illness/procedure contexts.',
    exactAdministration:
        'Immediate-release is usually divided with meals. Extended-release is generally taken with the evening meal or as product-specific labeling directs.',
    formulationHandling:
        'Do not assume all ER products can be split, crushed or opened. Verify the exact brand/formulation.',
    monitoring:
        'Renal function before and during therapy; A1c/glucose response; vitamin B12 periodically in long-term therapy or if symptoms/risk factors arise.',
    interactions:
        'Alcohol excess increases lactic-acidosis risk. Iodinated contrast and acute kidney injury/dehydration may require temporary interruption according to current protocol.',
    specialPopulations:
        'Avoid in severe renal impairment; reassess during hypoxia, sepsis, dehydration or severe acute illness.',
    clinicalPearls:
        'Early GI intolerance often improves with slower titration and administration with food.',
    commonMistakes:
        'Crushing ER tablets; continuing during significant dehydration without a sick-day plan.',
    source: 'MedlinePlus / DailyMed metformin labeling',
  ),
  'salbutamol-mdi': MedicationClinicalDetail(
    therapyDuration:
        'Reliever therapy is used as needed within the patient’s asthma/COPD action plan. Frequent need signals poor control and should trigger reassessment.',
    exactAdministration:
        'Shake when required by the product, exhale fully, seal lips, begin slow deep inhalation while actuating one puff, continue inhaling, hold breath, then wait between puffs as directed.',
    formulationHandling:
        'Priming, cleaning, dose counter and spacer compatibility differ by product. Do not generalize across inhalers.',
    monitoring:
        'Reliever frequency, nocturnal symptoms, exercise limitation, technique and exacerbations.',
    interactions:
        'Other sympathomimetics, nonselective beta-blockers and selected QT/arrhythmia-risk drugs may be clinically relevant.',
    specialPopulations:
        'Children often benefit from pMDI + spacer; mask versus mouthpiece depends on age/ability.',
    clinicalPearls:
        'Technique failure is a common reason for apparent “drug failure.” Demonstrate and require return-demonstration.',
    commonMistakes:
        'Inhaling too fast, actuating before inhalation, multiple puffs into spacer at once, skipping priming or using an empty canister.',
    source: 'GINA 2026 + product IFU',
  ),
  'amoxicillin': MedicationClinicalDetail(
    therapyDuration:
        'Fixed-course antibiotic; duration depends on infection, site, severity and guideline. Do not use a single duration for all infections.',
    exactAdministration:
        'May be taken with or without food; food can improve GI tolerance. Space doses according to the prescribed frequency.',
    formulationHandling:
        'Suspension concentrations differ. Reconstituted storage and beyond-use period are product-specific; verify the exact manufacturer.',
    monitoring:
        'Clinical response, allergy, diarrhea; renal function for dose adjustment when relevant.',
    interactions:
        'Warfarin/INR changes may occur; allopurinol can increase rash risk. Review methotrexate and other patient-specific interactions.',
    specialPopulations:
        'Clarify true immediate hypersensitivity versus nonallergic historical rash before unnecessarily excluding penicillins.',
    clinicalPearls:
        'Antibiotic duration should be indication-specific and should not be extended automatically because symptoms persist mildly.',
    commonMistakes:
        'Using household spoons; confusing 125/5, 200/5, 250/5 and 400/5 mL strengths; storing every suspension the same way.',
    source: 'MedlinePlus / DailyMed amoxicillin product labeling',
  ),
  'levetiracetam': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for seizure prevention; duration and tapering depend on seizure type, control and neurology plan.',
    exactAdministration:
        'Give at consistent times; IR is commonly twice daily and XR once daily, according to the prescribed product.',
    formulationHandling:
        'XR tablets must not be crushed. Oral solution requires accurate mL measurement. Verify tablet versus XR versus solution.',
    monitoring:
        'Seizure control, adherence, renal function, sedation and behavioral/mood changes.',
    interactions:
        'Few CYP interactions compared with many antiseizure medicines, but additive CNS depression is clinically relevant.',
    specialPopulations:
        'Renal dose adjustment is often required. Caregivers should be asked about irritability/aggression or unusual behavior.',
    clinicalPearls:
        'Behavioral adverse effects can be adherence-limiting even when seizure control is good.',
    commonMistakes:
        'Abruptly stopping; confusing XR with IR; measuring liquid with household spoon.',
    source: 'MedlinePlus / current levetiracetam labeling',
  ),
  'omeprazole': MedicationClinicalDetail(
    therapyDuration:
        'Duration depends strongly on indication: short courses are common for uncomplicated reflux/ulcer treatment, while selected indications require long-term therapy.',
    exactAdministration:
        'Most delayed-release products are taken before a meal; exact timing and administration depend on product and indication.',
    formulationHandling:
        'Do not crush delayed-release granules. Some capsules may be opened and granules sprinkled on approved soft food; verify exact product.',
    monitoring:
        'Reassess indication in long-term use; consider magnesium, B12, iron, fracture/infection risk only when clinically relevant.',
    interactions:
        'Clinically important interactions include selected antiretrovirals and acid-dependent drugs; omeprazole can reduce clopidogrel activation.',
    specialPopulations:
        'Long-term use should be periodically reviewed rather than continued indefinitely without an indication.',
    clinicalPearls:
        'Persistent “PPI failure” often reflects wrong timing, nonadherence or a non-acid cause.',
    commonMistakes:
        'Taking after meals when pre-meal timing is intended; crushing enteric-coated granules.',
    source: 'MedlinePlus / current PPI labeling',
  ),
  'apixaban': MedicationClinicalDetail(
    therapyDuration:
        'Duration is indication-specific: atrial-fibrillation stroke prevention is usually long-term; VTE treatment/prevention may be time-limited or extended based on recurrence/bleeding risk.',
    exactAdministration:
        'Usually twice daily. May be taken with or without food. Missed-dose advice is product-specific and should be reinforced.',
    formulationHandling:
        'Crushing/NG administration is possible under specific labeled conditions; use exact label instructions rather than generic tablet rules.',
    monitoring:
        'Renal/hepatic function, bleeding, adherence, weight/age criteria where dose reduction rules apply, and peri-procedure planning.',
    interactions:
        'Strong dual CYP3A4/P-gp inhibitors/inducers and additional antiplatelet/NSAID therapy can be important.',
    specialPopulations:
        'Pregnancy, severe liver disease, extremes of renal function and neuraxial procedures need individualized review.',
    clinicalPearls:
        'No routine INR monitoring, but absence of INR testing does not mean “no monitoring.”',
    commonMistakes:
        'Stopping before dental/surgical procedures without a plan; assuming once-daily because other DOACs are once daily.',
    source: 'MedlinePlus / FDA apixaban labeling',
  ),
  'amlodipine': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for hypertension/angina. Continue while indicated even if the patient feels well.',
    exactAdministration:
        'Once daily, with or without food, at a consistent time.',
    monitoring:
        'Blood pressure, edema, dizziness; heart rate is less affected than with non-dihydropyridine calcium-channel blockers.',
    interactions:
        'Simvastatin exposure increases with amlodipine; review dose limits and other CYP3A4-related combinations when relevant.',
    specialPopulations:
        'Start cautiously in frail older adults or significant hepatic impairment.',
    clinicalPearls:
        'Dose-related ankle edema is not the same as heart-failure fluid overload and often does not respond well to simply adding a diuretic.',
    commonMistakes:
        'Stopping due to ankle swelling without assessing dose/alternative; using it as acute angina relief.',
    source: 'MedlinePlus / DailyMed amlodipine',
  ),
  'lisinopril': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for hypertension, heart failure or post-MI indications.',
    exactAdministration:
        'Usually once daily, with or without food. Keep fluid status and sick-day context in mind.',
    monitoring:
        'Blood pressure, creatinine/eGFR and potassium after initiation/titration and when clinically indicated.',
    interactions:
        'Potassium products, potassium-sparing diuretics, NSAIDs, lithium and dual RAAS blockade are important review points.',
    specialPopulations:
        'Contraindicated in pregnancy. Prior ACE-inhibitor angioedema is a major safety issue.',
    clinicalPearls:
        'Dry cough may persist and affect adherence; distinguish it from pulmonary congestion or infection.',
    commonMistakes:
        'Ignoring potassium-containing salt substitutes; taking NSAIDs routinely without review.',
    source: 'MedlinePlus / ACE inhibitor labeling',
  ),
  'glimepiride': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic while effective/tolerated; reassess if recurrent hypoglycemia, renal decline or changing nutritional intake.',
    exactAdministration:
        'Take with breakfast or the first main meal of the day.',
    monitoring:
        'Glucose/A1c, hypoglycemia, weight; renal/hepatic function when clinically relevant.',
    interactions:
        'Other glucose-lowering drugs, alcohol and medicines that mask hypoglycemia symptoms (for example beta-blockers) matter clinically.',
    specialPopulations:
        'Older adults, irregular eaters and renal impairment have higher hypoglycemia risk.',
    clinicalPearls:
        'Meal-skipping is a bigger counseling issue than minor clock-time variation.',
    commonMistakes:
        'Taking the dose then skipping the meal; treating recurrent hypoglycemia by repeatedly eating extra calories without medication review.',
    source: 'MedlinePlus glimepiride',
  ),
  'insulin-glargine': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic basal insulin therapy; requirements change with illness, renal function, diet, steroids and other factors.',
    exactAdministration:
        'Subcutaneous basal insulin at the prescribed daily time; exact flexibility differs among glargine products/concentrations.',
    formulationHandling:
        'U-100 and U-300 are not volume-for-volume device substitutions. Do not mix standard insulin glargine with other insulins unless exact labeling says otherwise.',
    monitoring:
        'Glucose/CGM patterns, hypoglycemia, injection technique, site rotation, storage and adherence.',
    interactions:
        'Other glucose-lowering agents and medications that increase or lower glucose requirements require review.',
    specialPopulations:
        'Renal/hepatic impairment, poor oral intake and older age can lower insulin requirements.',
    clinicalPearls:
        'Confirm insulin name and concentration at every transition of care.',
    commonMistakes:
        'Sharing pens, reusing needles, injecting repeatedly into lipohypertrophy, confusing units with mL.',
    source: 'MedlinePlus / insulin glargine product IFUs',
  ),
  'budesonide-formoterol': MedicationClinicalDetail(
    therapyDuration:
        'Controller therapy is usually long-term; step-up/step-down depends on asthma/COPD control and the exact regimen.',
    exactAdministration:
        'Technique and whether it serves as maintenance-only or maintenance-and-reliever therapy are regimen/product-specific.',
    formulationHandling:
        'MDI and DPI products are not interchangeable in technique. Priming/shaking/spacer use differ by device.',
    monitoring:
        'Symptoms, reliever use, exacerbations, inhaler technique, adherence and oral candidiasis/dysphonia.',
    interactions:
        'Other LABAs should generally not be duplicated; strong CYP3A4 inhibitors may increase steroid exposure.',
    specialPopulations:
        'Children need device selection matched to ability; ensure a written asthma action plan.',
    clinicalPearls:
        'Always ask the patient to demonstrate the exact inhaler rather than asking “Do you know how to use it?”',
    commonMistakes:
        'Not rinsing/spitting after ICS; using wrong inhalation speed for device; duplicating LABA.',
    source: 'GINA 2026 + product IFU',
  ),
  'ibuprofen': MedicationClinicalDetail(
    therapyDuration:
        'Use the lowest effective dose for the shortest appropriate duration. OTC use is generally short-term unless clinician-directed.',
    exactAdministration:
        'May be taken with food or milk if GI upset occurs; food does not eliminate GI bleeding risk.',
    monitoring:
        'Pain/fever response, GI symptoms, renal function/BP in at-risk patients, edema and bleeding.',
    interactions:
        'Anticoagulants/antiplatelets, ACEI/ARB + diuretic combinations, other NSAIDs, lithium and methotrexate can be important.',
    specialPopulations:
        'Avoid/limit in CKD, active ulcer/GI bleed, some cardiovascular disease, dehydration and later pregnancy according to current warnings.',
    clinicalPearls:
        'A patient taking “just OTC ibuprofen” may still have clinically important bleeding or kidney risk.',
    commonMistakes:
        'Stacking ibuprofen with naproxen/diclofenac; using pediatric mL from a different concentration.',
    source: 'MedlinePlus / FDA NSAID warnings',
  ),
  'warfarin': MedicationClinicalDetail(
    therapyDuration:
        'Duration is indication-specific and may be finite or lifelong. Mechanical valve and recurrent-risk situations often require long-term therapy.',
    exactAdministration:
        'Once daily at a consistent time. Food consistency matters more than complete vitamin-K avoidance.',
    monitoring:
        'INR, bleeding, interacting medications, diet/alcohol changes, adherence and upcoming procedures.',
    interactions:
        'Extensive interaction burden: antibiotics, amiodarone, antifungals, NSAIDs, antiplatelets, many supplements and abrupt diet changes.',
    specialPopulations:
        'Pregnancy and high-fall/bleeding-risk patients require individualized management.',
    clinicalPearls:
        'Any major new prescription, OTC, herb or acute illness can justify closer INR follow-up.',
    commonMistakes:
        'Stopping green vegetables entirely; taking an extra tablet to “catch up”; starting antibiotics without INR plan.',
    source: 'MedlinePlus / anticoagulation guidance',
  ),
  'rivaroxaban': MedicationClinicalDetail(
    therapyDuration:
        'Indication-specific: long-term for many AF patients; VTE courses may be finite or extended.',
    exactAdministration:
        'Food requirement depends on tablet strength/indication; do not generalize. Keep dosing consistent and verify the exact regimen.',
    formulationHandling:
        'Crushing/feeding-tube use is possible only under specific label conditions and tube locations.',
    monitoring:
        'Renal/hepatic function, adherence, bleeding and peri-procedure planning.',
    interactions:
        'Strong CYP3A4/P-gp inhibitors/inducers and additional antiplatelet/NSAID therapy can be important.',
    specialPopulations:
        'Renal impairment, hepatic disease, pregnancy and neuraxial procedures require careful review.',
    clinicalPearls:
        'The 15 mg and 20 mg tablets have a clinically important food requirement.',
    commonMistakes:
        'Assuming every strength can be taken fasting; stopping abruptly before a procedure.',
    source: 'MedlinePlus / FDA rivaroxaban labeling',
  ),
  'methotrexate-rheumatology': MedicationClinicalDetail(
    therapyDuration:
        'Usually long-term disease-modifying therapy when effective and tolerated. Response is assessed over weeks to months.',
    exactAdministration:
        'For inflammatory conditions it is commonly ONCE WEEKLY on a fixed day, not daily. Folic acid is commonly co-prescribed according to the regimen.',
    formulationHandling:
        'Tablet strengths and injectable formulations can create serious dose confusion; verify strength and weekly total dose.',
    monitoring:
        'CBC, liver tests, renal function, infection, mouth ulcers and pulmonary symptoms; monitoring frequency depends on stability and guideline/local protocol.',
    interactions:
        'Trimethoprim/co-trimoxazole is a high-value interaction to avoid or manage carefully; NSAIDs and other hepatotoxic/myelosuppressive agents need review.',
    specialPopulations:
        'Contraindicated in pregnancy; renal impairment can markedly increase toxicity.',
    clinicalPearls:
        'Weekly-versus-daily error is one of the most dangerous outpatient medication errors.',
    commonMistakes:
        'Taking daily; misunderstanding 2.5 mg tablet count; continuing through severe infection without advice.',
    source: 'DailyMed / MedlinePlus / rheumatology monitoring guidance',
  ),
  'upadacitinib': MedicationClinicalDetail(
    therapyDuration:
        'Induction and maintenance schedules depend on indication. Long-term continuation depends on response and safety.',
    exactAdministration:
        'Extended-release tablet once daily according to indication; swallow whole with or without food.',
    formulationHandling:
        'Do not split, crush or chew extended-release tablets.',
    monitoring:
        'CBC, liver tests, lipids and infection/TB screening as clinically indicated; monitor for herpes zoster and serious infection.',
    interactions:
        'Strong CYP3A4 modulators and additive immunosuppressive therapy can be clinically important.',
    specialPopulations:
        'Risk-benefit is especially important in older adults and patients with cardiovascular, malignancy or thrombosis risk factors.',
    clinicalPearls:
        'Induction and maintenance doses can differ; never assume the higher induction dose continues indefinitely.',
    commonMistakes:
        'Crushing ER tablet; continuing the induction dose without review; ignoring shingles vaccination status.',
    source: 'Current upadacitinib labeling + specialty guideline review',
  ),
  'tofacitinib': MedicationClinicalDetail(
    therapyDuration:
        'Long-term immunomodulatory therapy if effective/tolerated; induction versus maintenance dose differs by indication/formulation.',
    exactAdministration:
        'Immediate-release, XR and oral-solution regimens differ. Verify formulation before counseling.',
    formulationHandling:
        'XR tablets must be swallowed whole; do not crush or split.',
    monitoring:
        'CBC, liver tests, lipids, TB/infection screening and clinical surveillance for thrombosis/cardiovascular/malignancy risk.',
    interactions:
        'CYP3A4 interactions and additive immunosuppression are clinically important.',
    specialPopulations:
        'Use requires careful risk assessment in older adults and those with cardiovascular, malignancy or VTE risk factors.',
    clinicalPearls:
        'Dose de-escalation after induction may be appropriate by indication; verify the current maintenance plan.',
    commonMistakes:
        'Confusing IR and XR frequency; staying on high induction dosing longer than intended.',
    source: 'DailyMed / specialty guideline review',
  ),
  'tamsulosin': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for lower urinary tract symptoms while effective/tolerated.',
    exactAdministration:
        'Take about 30 minutes after the same meal each day.',
    formulationHandling:
        'Swallow capsules whole; do not crush, chew or open.',
    monitoring:
        'Symptom response, orthostatic dizziness/falls and blood pressure when clinically relevant.',
    interactions:
        'Other blood-pressure lowering drugs and strong CYP3A4 inhibitors may increase adverse effects.',
    specialPopulations:
        'Tell ophthalmic surgeon before cataract/glaucoma surgery because of intraoperative floppy iris syndrome risk.',
    clinicalPearls:
        'Consistency with the same meal helps reduce pharmacokinetic variability.',
    commonMistakes:
        'Taking on an empty stomach some days and after meals on others; opening the capsule.',
    source: 'MedlinePlus tamsulosin',
  ),
  'levothyroxine': MedicationClinicalDetail(
    therapyDuration:
        'Usually lifelong for permanent hypothyroidism; duration may differ in temporary thyroiditis or selected post-surgical cases.',
    exactAdministration:
        'Take consistently on an empty stomach 30–60 minutes before breakfast, or use a consistently separated bedtime regimen if specifically instructed.',
    formulationHandling:
        'Brand/formulation changes can alter exposure. Tablets, soft-gels and liquid are not automatically equivalent in absorption behavior.',
    monitoring:
        'TSH (and FT4 when indicated) after dose changes and periodically once stable; timing depends on clinical context.',
    interactions:
        'Separate calcium and iron by at least 4 hours. Many binders, acid-suppressants and foods can affect absorption.',
    specialPopulations:
        'Pregnancy often increases dose requirement; elderly/CAD patients generally need cautious titration.',
    clinicalPearls:
        'Consistency of administration is often more important than chasing minor day-to-day timing variation.',
    commonMistakes:
        'Taking with breakfast, coffee, iron or calcium; switching products repeatedly without follow-up.',
    source: 'MedlinePlus / thyroid replacement guidance',
  ),
  'sertraline': MedicationClinicalDetail(
    therapyDuration:
        'Often continued for months after response; longer treatment is common for recurrent depression/anxiety disorders. Do not stop abruptly.',
    exactAdministration:
        'Once daily morning or evening. Liquid concentrate has product-specific dilution instructions.',
    formulationHandling:
        'Oral concentrate must be diluted immediately before use with approved beverages; verify exact product.',
    monitoring:
        'Mood, suicidality early in treatment/after dose changes, sexual adverse effects, hyponatremia risk and adherence.',
    interactions:
        'MAOIs, serotonergic drugs, anticoagulants/NSAIDs and other QT/bleeding-risk medicines may matter.',
    specialPopulations:
        'Older adults have higher hyponatremia risk; pregnancy/breastfeeding decisions are individualized.',
    clinicalPearls:
        'Initial activation, nausea or sleep change may improve before full antidepressant benefit appears.',
    commonMistakes:
        'Stopping after a few days because benefit is not immediate; abrupt discontinuation.',
    source: 'MedlinePlus sertraline',
  ),
  'gabapentin': MedicationClinicalDetail(
    therapyDuration:
        'Duration is indication-driven; chronic use is common for epilepsy or persistent neuropathic pain.',
    exactAdministration:
        'Immediate-release and ER products have different schedules and food requirements.',
    formulationHandling:
        'IR, Gralise and Horizant are not interchangeable. Verify product before counseling or tube administration.',
    monitoring:
        'Sedation, dizziness/falls, renal function, respiratory depression risk with opioids/CNS depressants and clinical benefit.',
    interactions:
        'Antacids containing aluminum/magnesium reduce absorption; separate according to label. Additive CNS depression is important.',
    specialPopulations:
        'Renal dose adjustment is essential.',
    clinicalPearls:
        'If there is no meaningful benefit after an adequate trial, avoid indefinite continuation purely because the drug is “safe.”',
    commonMistakes:
        'Substituting one ER product for another; abrupt discontinuation; ignoring renal decline.',
    source: 'MedlinePlus gabapentin',
  ),
  'doxycycline': MedicationClinicalDetail(
    therapyDuration:
        'Course duration depends on infection/indication; acne/rosacea regimens may be prolonged and are not the same as acute infection courses.',
    exactAdministration:
        'Take with a full glass of water and remain upright to reduce esophageal injury. Food may improve GI tolerance.',
    formulationHandling:
        'Delayed-release/specialty products differ in crush/open instructions. Verify the exact product.',
    monitoring:
        'Clinical response, severe GI symptoms, photosensitivity and hepatotoxicity risk when relevant.',
    interactions:
        'Separate from iron, calcium, magnesium, zinc and antacids according to product guidance; retinoids can increase intracranial-pressure risk.',
    specialPopulations:
        'Pregnancy and young-child use are indication-specific and should follow current guidance rather than an absolute blanket rule.',
    clinicalPearls:
        'Esophagitis is preventable with water and remaining upright.',
    commonMistakes:
        'Taking immediately before bed; taking simultaneously with mineral supplements.',
    source: 'MedlinePlus doxycycline',
  ),
  'nitrofurantoin': MedicationClinicalDetail(
    therapyDuration:
        'Short course for uncomplicated lower UTI is common; prophylaxis is a different long-term indication and needs separate review.',
    exactAdministration:
        'Take with food to improve absorption/tolerance. Space doses according to the formulation and prescription.',
    formulationHandling:
        'Macrocrystals, monohydrate/macrocrystals and suspension are not interchangeable in schedule.',
    monitoring:
        'Clinical response; renal function; pulmonary/hepatic toxicity if prolonged therapy.',
    interactions:
        'Antacids containing magnesium trisilicate can reduce absorption; selected uricosurics affect elimination.',
    specialPopulations:
        'Avoid when renal function is inadequate for the product/indication. Pregnancy timing requires review.',
    clinicalPearls:
        'Not appropriate for suspected pyelonephritis/systemic infection because tissue concentrations are inadequate.',
    commonMistakes:
        'Using for fever/flank pain suggestive of upper UTI; taking on an empty stomach.',
    source: 'MedlinePlus / nitrofurantoin labeling',
  ),
  'clindamycin-oral': MedicationClinicalDetail(
    therapyDuration:
        'Course duration is infection-specific. Avoid extending unnecessarily because C. difficile risk is clinically important.',
    exactAdministration:
        'Capsules with a full glass of water; remain upright after dosing to reduce esophageal irritation.',
    monitoring:
        'Clinical response and diarrhea during therapy and for weeks afterward.',
    interactions:
        'Neuromuscular blockers and selected CYP interactions may matter in hospitalized patients.',
    specialPopulations:
        'History of C. difficile infection or significant GI disease warrants extra caution.',
    clinicalPearls:
        'Watery/bloody diarrhea may occur during therapy or after the course; patients should not self-treat severe diarrhea with loperamide without review.',
    commonMistakes:
        'Taking capsules dry; ignoring post-antibiotic diarrhea.',
    source: 'MedlinePlus clindamycin',
  ),
  'atorvastatin': MedicationClinicalDetail(
    therapyDuration:
        'Usually long-term for lipid lowering and cardiovascular risk reduction.',
    exactAdministration:
        'Tablet once daily with or without food; time of day is flexible. Suspension has different administration instructions.',
    formulationHandling:
        'Do not generalize tablet instructions to suspension.',
    monitoring:
        'Lipid response/adherence; liver tests and CK only when clinically indicated rather than routine CK in asymptomatic patients.',
    interactions:
        'Strong CYP3A4 inhibitors, grapefruit excess and interacting drugs can raise myopathy risk.',
    specialPopulations:
        'Avoid in pregnancy according to current product recommendations unless a specialist determines otherwise in rare circumstances.',
    clinicalPearls:
        'Muscle symptoms need context—do not label every ache “statin intolerance” without assessment.',
    commonMistakes:
        'Stopping after cholesterol improves; confusing suspension fasting instructions with tablet instructions.',
    source: 'MedlinePlus atorvastatin',
  ),
  'metoprolol': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for hypertension, angina, rate control or heart failure; indication determines formulation and target dose.',
    exactAdministration:
        'Immediate-release tartrate should be taken with food or immediately after meals. Extended-release succinate is usually once daily; keep administration consistent.',
    formulationHandling:
        'IR tartrate and ER succinate are not interchangeable milligram-for-milligram without a deliberate conversion plan. ER tablets should not be crushed; sprinkle capsules have their own instructions.',
    monitoring:
        'Heart rate, blood pressure, symptoms of bradycardia, heart failure, dizziness and glycemic awareness in diabetes.',
    interactions:
        'Other rate-slowing drugs, CYP2D6 inhibitors and clonidine require special attention.',
    specialPopulations:
        'Asthma/COPD, conduction disease and frailty require individualized risk assessment.',
    feedingTube:
        'IR tablets: evidence supports crushing/dispersing in purified water for gastric or post-pyloric tubes with feed held during administration and feeds restarted after flushing. ER tablets are not recommended for tube administration because they must not be crushed. Selected ER sprinkle capsules may be given via appropriate gastric tubes using product-specific instructions.',
    clinicalPearls:
        'Confirm tartrate versus succinate before every transition of care.',
    commonMistakes:
        'Crushing ER tablets; switching IR↔ER without checking total daily dose; abruptly stopping.',
    source: 'Library metoprolol monograph + product labeling',
  ),
  'empagliflozin': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for diabetes, CKD or heart failure while benefits outweigh risks.',
    exactAdministration:
        'Once daily, commonly in the morning, with or without food.',
    monitoring:
        'Renal function, volume status, genital/urinary infections, ketoacidosis symptoms and glucose when used for diabetes.',
    interactions:
        'Diuretics can increase volume depletion; insulin/sulfonylureas may increase hypoglycemia risk when combined.',
    specialPopulations:
        'Hold before major surgery/prolonged fasting according to current label/institution protocol to reduce ketoacidosis risk.',
    clinicalPearls:
        'Euglycemic ketoacidosis can occur even without markedly elevated glucose.',
    commonMistakes:
        'Continuing through prolonged fasting/vomiting without a sick-day plan; assuming dysuria is always “normal.”',
    source: 'MedlinePlus empagliflozin',
  ),
  'valproic-acid': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for epilepsy or mood stabilization; migraine prevention is also long-term when effective.',
    exactAdministration:
        'Take with food if GI upset occurs and keep dosing consistent.',
    formulationHandling:
        'Valproic acid, sodium valproate and divalproex products/formulations are not simply interchangeable. Delayed-release/ER products must not be crushed.',
    monitoring:
        'Liver function, CBC/platelets, pregnancy prevention/risk discussion, pancreatitis symptoms and ammonia when clinically indicated.',
    interactions:
        'Raises lamotrigine exposure and interacts with several antiseizure drugs; aspirin and enzyme-inducers may also alter levels/effects.',
    specialPopulations:
        'Major teratogenic risk. Avoid in pregnancy for migraine prevention and follow current regulatory pregnancy-prevention requirements for epilepsy/bipolar use.',
    feedingTube:
        'Use a formulation specifically suitable for enteral administration. ICU references distinguish sodium valproate liquid from valproic-acid products and warn against assuming all formulations can be given NG.',
    clinicalPearls:
        'A “valproate level” must be interpreted with timing, albumin and clinical response; total level can mislead in hypoalbuminemia.',
    commonMistakes:
        'Crushing modified-release tablets; confusing valproic acid, sodium valproate and divalproex; ignoring pregnancy risk.',
    source: 'MedlinePlus + ICU handbook / product labeling',
  ),
  'furosemide': MedicationClinicalDetail(
    therapyDuration:
        'Chronic for many heart-failure/edema patients, but dose and frequency often change with volume status.',
    exactAdministration:
        'Schedule earlier in the day when feasible to reduce nocturia while respecting the prescribed frequency.',
    monitoring:
        'Weight/volume status, blood pressure, renal function, sodium, potassium and magnesium as clinically indicated.',
    interactions:
        'NSAIDs may blunt diuresis and worsen kidney function; digoxin toxicity risk increases with hypokalemia; lithium levels can rise.',
    specialPopulations:
        'Frailty, dehydration and CKD increase adverse-effect risk.',
    clinicalPearls:
        'Daily weight trends and symptoms are often more useful than a single edema observation in heart failure.',
    commonMistakes:
        'Self-escalating dose for every ankle swelling episode; taking late at night unnecessarily.',
    source: 'MedlinePlus / loop diuretic guidance',
  ),
  'clopidogrel': MedicationClinicalDetail(
    therapyDuration:
        'Duration depends on indication and stent/ACS history; it may be short, months-long or indefinite.',
    exactAdministration:
        'Once daily with or without food.',
    monitoring:
        'Bleeding, adherence and peri-procedure interruption plan.',
    interactions:
        'Omeprazole/esomeprazole can reduce active-metabolite formation; NSAIDs/anticoagulants increase bleeding risk.',
    specialPopulations:
        'Poor CYP2C19 metabolizers may have reduced effect; genotype-guided decisions are patient-specific.',
    clinicalPearls:
        'Premature discontinuation after coronary stenting can be dangerous.',
    commonMistakes:
        'Stopping for dental work without cardiology/procedure plan; taking ibuprofen routinely without review.',
    source: 'MedlinePlus + antiplatelet literature',
  ),
  'nitroglycerin-sublingual': MedicationClinicalDetail(
    therapyDuration:
        'Rescue therapy for angina episodes; chronic prevention usually requires a separate maintenance strategy.',
    exactAdministration:
        'Sit down; place tablet under tongue or use spray as instructed. Follow the emergency repeat-dose plan exactly.',
    formulationHandling:
        'Tablets require original-container storage protection; spray and tablets have different handling.',
    monitoring:
        'Angina frequency, blood pressure, headache/dizziness and emergency escalation needs.',
    interactions:
        'PDE5 inhibitors and riociguat are major contraindicated combinations because of profound hypotension risk.',
    specialPopulations:
        'Patients with hypotension, severe aortic stenosis or volume depletion need individualized caution.',
    clinicalPearls:
        'If pain is not responding according to the action plan, the next step is emergency care—not indefinite repeated self-dosing.',
    commonMistakes:
        'Swallowing the tablet; carrying loose tablets in a pill organizer for long periods; combining with sildenafil/tadalafil.',
    source: 'MedlinePlus nitroglycerin',
  ),
  'semaglutide-injection': MedicationClinicalDetail(
    therapyDuration:
        'Usually long-term while clinically beneficial and tolerated. Dose escalation is gradual and product/indication-specific.',
    exactAdministration:
        'Once weekly on the same day; injection time may be flexible within product rules. Rotate injection sites.',
    formulationHandling:
        'Semaglutide products and pens differ. Confirm brand, concentration, indication and pen technique before counseling.',
    monitoring:
        'Weight/glucose/A1c as relevant, GI tolerance, gallbladder symptoms, pancreatitis symptoms and retinopathy risk in selected diabetes patients.',
    interactions:
        'Delayed gastric emptying may affect selected oral drugs; concomitant insulin/sulfonylurea can increase hypoglycemia risk.',
    specialPopulations:
        'Pregnancy planning requires advance discontinuation according to product labeling.',
    clinicalPearls:
        'Do not accelerate titration simply because the patient has not yet lost weight; GI tolerability drives escalation.',
    commonMistakes:
        'Confusing mg and mL/pen clicks; sharing pens; increasing dose too quickly.',
    source: 'MedlinePlus / semaglutide product IFU',
  ),
  'tiotropium-capsule-inhalation': MedicationClinicalDetail(
    therapyDuration:
        'Long-term maintenance therapy for COPD; not a rescue medicine.',
    exactAdministration:
        'Capsule contents are inhaled through the designated device; the capsule is never swallowed.',
    formulationHandling:
        'Capsule inhaler and Respimat-type tiotropium products use completely different devices/instructions.',
    monitoring:
        'Symptoms/exacerbations, inhaler technique, dry mouth, urinary retention and glaucoma symptoms in susceptible patients.',
    interactions:
        'Avoid unnecessary duplication with other anticholinergic inhalers.',
    specialPopulations:
        'Use extra caution with urinary retention and narrow-angle glaucoma risk.',
    clinicalPearls:
        'Patients commonly swallow the capsule if device training is inadequate.',
    commonMistakes:
        'Swallowing capsule; using capsule without the device; treating acute breathlessness with tiotropium.',
    source: 'MedlinePlus tiotropium + device IFU',
  ),
  'azithromycin': MedicationClinicalDetail(
    therapyDuration:
        'Short-course antibiotic for many infections; regimen differs greatly by indication and formulation.',
    exactAdministration:
        'Tablets/standard suspension are generally with or without food; the 1-g packet has a specific mixing method.',
    formulationHandling:
        'Suspension and single-dose packet are not counseled the same way. Verify reconstituted storage for the exact product.',
    monitoring:
        'Clinical response, severe diarrhea, liver symptoms and QT risk in susceptible patients.',
    interactions:
        'Other QT-prolonging agents and selected antacids/products require review.',
    specialPopulations:
        'Higher arrhythmia risk in patients with QT prolongation, bradycardia or electrolyte abnormalities.',
    clinicalPearls:
        'A “Z-pack” is not an appropriate default duration for every infection.',
    commonMistakes:
        'Using leftover tablets for viral illness; redosing automatically after vomiting without advice.',
    source: 'MedlinePlus azithromycin',
  ),
  'acyclovir-oral': MedicationClinicalDetail(
    therapyDuration:
        'Varies by indication: short episodic courses, initial-episode courses or chronic suppression.',
    exactAdministration:
        'Space doses evenly; with or without food. Maintain hydration unless fluid restricted.',
    monitoring:
        'Renal function and neurotoxicity risk in renal impairment; clinical lesion response.',
    interactions:
        'Other nephrotoxic drugs can increase kidney risk.',
    specialPopulations:
        'Renal adjustment is important, especially in older/dehydrated patients.',
    clinicalPearls:
        'Early initiation matters for episodic herpes treatment.',
    commonMistakes:
        'Using the same regimen for shingles, initial genital herpes and suppression.',
    source: 'MedlinePlus acyclovir',
  ),
  'metronidazole-oral': MedicationClinicalDetail(
    therapyDuration:
        'Indication-specific; may be single dose or multi-day course.',
    exactAdministration:
        'Take according to the exact regimen; food can reduce GI upset for many products.',
    formulationHandling:
        'Immediate-release, extended-release and suspension/compounded products require product-specific instructions.',
    monitoring:
        'Clinical response, neuropathy with prolonged/high cumulative exposure, severe GI symptoms and hepatic function when relevant.',
    interactions:
        'Warfarin can be potentiated; alcohol/propylene glycol avoidance follows current product guidance.',
    specialPopulations:
        'Significant hepatic impairment may require regimen modification.',
    clinicalPearls:
        'The interaction concern with alcohol is a high-value counseling point because patients often forget non-beverage alcohol/propylene glycol products.',
    commonMistakes:
        'Stopping early when symptoms improve; drinking alcohol immediately after last dose.',
    source: 'MedlinePlus metronidazole',
  ),
  'latanoprost': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic glaucoma/ocular-hypertension therapy.',
    exactAdministration:
        'Usually one drop in affected eye(s) in the evening. More frequent use can reduce effect.',
    formulationHandling:
        'Storage before/after opening varies by product. Separate other eye drops by at least 5 minutes.',
    monitoring:
        'Intraocular pressure, adherence, ocular irritation and iris/eyelash changes.',
    interactions:
        'Multiple prostaglandin analogs together may paradoxically reduce pressure-lowering effect.',
    specialPopulations:
        'Use caution in selected inflammatory eye disease or macular-edema risk.',
    clinicalPearls:
        'One drop is enough; extra drops mostly increase waste/systemic exposure.',
    commonMistakes:
        'Touching dropper to eye; using multiple drops; not separating from other ophthalmic products.',
    source: 'MedlinePlus latanoprost',
  ),
};
