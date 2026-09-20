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

  'cetirizine': MedicationClinicalDetail(
    therapyDuration:
        'Often used intermittently or seasonally; chronic daily use is reasonable when symptoms are persistent and indication remains.',
    exactAdministration:
        'Usually once daily with or without food. Liquid and chewable products require age/strength-specific measurement.',
    monitoring:
        'Sedation, dry mouth and symptom control; renal function matters for dose adjustment in impairment.',
    interactions:
        'Alcohol and other CNS depressants can increase drowsiness.',
    specialPopulations:
        'Older adults and renal impairment may need lower or less frequent dosing.',
    clinicalPearls:
        '“Non-sedating” is not absolute—cetirizine can still impair some patients.',
    commonMistakes:
        'Driving immediately after first dose without knowing individual sedation response.',
    source: 'MedlinePlus cetirizine',
  ),
  'montelukast': MedicationClinicalDetail(
    therapyDuration:
        'Controller therapy duration is based on ongoing indication and response. For allergic rhinitis, use should be reserved for appropriate patients after considering alternatives.',
    exactAdministration:
        'Once daily according to indication/age; asthma timing is often evening, while exercise/allergy regimens may differ.',
    formulationHandling:
        'Chewable tablets and granules have age-specific instructions. Granules may be given directly or with approved soft foods according to label.',
    monitoring:
        'Asthma control and neuropsychiatric symptoms including sleep, mood and behavior changes.',
    interactions:
        'Few major routine interactions, but full medication review remains appropriate.',
    specialPopulations:
        'Boxed warning for serious neuropsychiatric events makes indication selection especially important for allergic rhinitis.',
    clinicalPearls:
        'Not a rescue drug. New mood/behavior changes should not be dismissed as unrelated automatically.',
    commonMistakes:
        'Using for sudden wheeze; continuing for mild allergic rhinitis despite neuropsychiatric symptoms.',
    source: 'MedlinePlus / FDA montelukast boxed warning',
  ),
  'fexofenadine': MedicationClinicalDetail(
    therapyDuration:
        'Intermittent/seasonal or chronic according to allergy/urticaria pattern.',
    exactAdministration:
        'Take with water; avoid apple, orange and grapefruit juice around the dose because absorption can decrease.',
    formulationHandling:
        'Tablet, ODT and suspension differ. Suspension should be shaken and measured accurately.',
    monitoring:
        'Symptom control and renal function when clinically relevant.',
    interactions:
        'Aluminum/magnesium antacids should be separated from fexofenadine according to label.',
    specialPopulations:
        'Renal impairment can require dose adjustment.',
    clinicalPearls:
        'Fruit-juice interaction is easy to miss because patients often take “allergy tablets” with breakfast juice.',
    commonMistakes:
        'Taking with fruit juice or simultaneously with aluminum/magnesium antacid.',
    source: 'MedlinePlus fexofenadine',
  ),
  'dupilumab': MedicationClinicalDetail(
    therapyDuration:
        'Usually long-term biologic therapy while clinically beneficial; induction/loading and maintenance schedules depend on indication/age/weight.',
    exactAdministration:
        'Subcutaneous injection using product-specific syringe/pen. Rotate sites and avoid scarred/infected skin.',
    formulationHandling:
        'Refrigerate, protect from light and allow to reach room temperature only for the product-specified time. Do not shake or heat.',
    monitoring:
        'Clinical response, injection reactions, conjunctivitis/eye symptoms and eosinophilic complications in selected respiratory patients.',
    interactions:
        'Live-vaccine decisions should be discussed before/during therapy according to current product guidance.',
    specialPopulations:
        'Asthma patients should not abruptly stop systemic or inhaled corticosteroids when starting dupilumab.',
    clinicalPearls:
        'Eye symptoms are common enough that proactive counseling improves adherence.',
    commonMistakes:
        'Heating the syringe/pen; shaking; expecting immediate discontinuation of all other controller therapy.',
    source: 'MedlinePlus / dupilumab product IFU',
  ),
  'polyethylene-glycol-3350': MedicationClinicalDetail(
    therapyDuration:
        'OTC use is generally short-term unless a clinician directs longer therapy; chronic constipation needs cause/medication review.',
    exactAdministration:
        'Dissolve the measured dose completely in the specified volume of liquid and drink. Effect may take 2–4 days.',
    formulationHandling:
        'Plain PEG 3350 and electrolyte bowel-prep products are completely different preparations and must not be confused.',
    monitoring:
        'Bowel response, diarrhea and hydration; investigate alarm symptoms.',
    interactions:
        'Few systemic interactions because absorption is minimal, but bowel-prep regimens can alter absorption of oral medications.',
    specialPopulations:
        'Suspected obstruction, severe unexplained abdominal pain or persistent vomiting requires evaluation before laxative use.',
    clinicalPearls:
        'Patients often over-repeat doses because effect is not immediate.',
    commonMistakes:
        'Confusing daily constipation powder with colonoscopy preparation.',
    source: 'MedlinePlus PEG 3350',
  ),
  'lactulose': MedicationClinicalDetail(
    therapyDuration:
        'Constipation may be short/intermediate term; hepatic encephalopathy regimens are chronic and titrated to a stool-frequency target.',
    exactAdministration:
        'Measure liquid accurately. May be mixed with water/juice/milk if needed for taste, according to product guidance.',
    monitoring:
        'Bowel frequency, diarrhea, dehydration and electrolytes in high-dose/chronic use.',
    interactions:
        'Other laxatives can confound titration in hepatic encephalopathy.',
    specialPopulations:
        'Diabetes and galactose-related excipients may matter depending on product and total intake.',
    clinicalPearls:
        'For hepatic encephalopathy the goal is not “as much diarrhea as possible”; overtreatment causes dehydration/electrolyte problems.',
    commonMistakes:
        'Using a household spoon; continuing unchanged despite profuse diarrhea.',
    source: 'MedlinePlus lactulose',
  ),
  'loperamide': MedicationClinicalDetail(
    therapyDuration:
        'OTC acute-diarrhea use is short-term. Persistent diarrhea beyond label limits requires assessment.',
    exactAdministration:
        'Use the exact initial and post-loose-stool schedule for age/product; do not exceed daily maximum.',
    monitoring:
        'Hydration, fever, blood/mucus, abdominal distension and duration of diarrhea.',
    interactions:
        'High doses plus P-gp/CYP inhibitors can worsen cardiac toxicity; misuse/overdose can cause fatal arrhythmias.',
    specialPopulations:
        'Avoid in young children below approved age and in suspected inflammatory/invasive diarrhea or toxic megacolon risk.',
    clinicalPearls:
        'The most important question is often whether the diarrhea is appropriate for self-treatment, not the dose itself.',
    commonMistakes:
        'Using with bloody diarrhea/high fever; exceeding OTC maximum because diarrhea continues.',
    source: 'MedlinePlus / FDA loperamide safety',
  ),
  'ondansetron-oral': MedicationClinicalDetail(
    therapyDuration:
        'Usually intermittent/short-term based on nausea-vomiting cause; chronic daily use needs indication review.',
    exactAdministration:
        'Tablet, ODT and oral film have different handling; follow formulation-specific instructions.',
    formulationHandling:
        'ODT: peel foil with dry hands; do not push fragile tablet through blister. Film must be handled as its own product.',
    monitoring:
        'QT-risk context, electrolytes when relevant, constipation and serotonin-syndrome risk with serotonergic combinations.',
    interactions:
        'Apomorphine is contraindicated. Other QT-prolonging/serotonergic medicines require review.',
    specialPopulations:
        'Severe hepatic impairment may limit total daily dose.',
    clinicalPearls:
        'An ODT dissolving in the mouth does not necessarily mean faster antiemetic onset than a standard swallowed dose.',
    commonMistakes:
        'Pushing ODT through foil and breaking it; stacking with other QT-risk drugs without review.',
    source: 'MedlinePlus ondansetron',
  ),
  'finasteride': MedicationClinicalDetail(
    therapyDuration:
        'Long-term; BPH benefit may take months and hair-loss benefit persists only while treatment continues.',
    exactAdministration:
        'Once daily with or without food.',
    monitoring:
        'Symptom response and PSA interpretation in BPH; sexual adverse effects and breast changes.',
    interactions:
        'Few major pharmacokinetic interactions.',
    specialPopulations:
        'Pregnant people should not handle crushed/broken tablets because of fetal risk.',
    clinicalPearls:
        'Finasteride lowers PSA; clinicians must account for this when interpreting prostate screening values.',
    commonMistakes:
        'Stopping after a few weeks because benefit is not yet visible; handling crushed tablets during pregnancy.',
    source: 'MedlinePlus finasteride',
  ),
  'timolol-ophthalmic': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic glaucoma therapy.',
    exactAdministration:
        'Instill prescribed drop, close eye gently and use nasolacrimal occlusion for 2–3 minutes to reduce systemic absorption.',
    formulationHandling:
        'Gel-forming and solution products can differ in frequency. Separate other ophthalmic drugs by the labeled interval.',
    monitoring:
        'Intraocular pressure, pulse, bronchospasm, dizziness and systemic beta-blocker effects.',
    interactions:
        'Systemic beta-blockers, verapamil/diltiazem and other rate-slowing drugs can add to bradycardia/hypotension.',
    specialPopulations:
        'Asthma/COPD, bradycardia, heart block and decompensated heart failure are important precautions.',
    clinicalPearls:
        'Eye drops can cause clinically meaningful systemic beta blockade; punctal occlusion matters.',
    commonMistakes:
        'Skipping punctal occlusion; assuming ophthalmic route has no systemic effects.',
    source: 'MedlinePlus timolol ophthalmic',
  ),
  'ciprofloxacin-ophthalmic': MedicationClinicalDetail(
    therapyDuration:
        'Short-course antibacterial treatment; corneal-ulcer and conjunctivitis regimens differ substantially.',
    exactAdministration:
        'Solution and ointment have different schedules. Avoid touching tip and complete course unless reassessed.',
    monitoring:
        'Clinical improvement, worsening pain/photophobia, corneal symptoms and hypersensitivity.',
    interactions:
        'Few systemic interactions due to low exposure; other eye products require spacing.',
    specialPopulations:
        'Contact lenses should not be worn during bacterial conjunctivitis.',
    clinicalPearls:
        'Corneal ulcer regimens can be very frequent initially—do not substitute standard conjunctivitis directions.',
    commonMistakes:
        'Using ear formulation in eye; stopping once redness improves after one day.',
    source: 'MedlinePlus ciprofloxacin ophthalmic',
  ),
  'ciprofloxacin-otic': MedicationClinicalDetail(
    therapyDuration:
        'Short-course otic antibacterial therapy; exact regimen depends on product and indication.',
    exactAdministration:
        'Warm in hands when product instructs, keep affected ear upward and remain positioned for the specified time.',
    formulationHandling:
        'Single-use solution and clinician-administered suspension products are not interchangeable.',
    monitoring:
        'Pain, discharge, hearing symptoms and response after expected interval.',
    interactions:
        'Minimal systemic interactions; avoid contaminating applicator.',
    specialPopulations:
        'Perforated tympanic membrane status influences which ear drops are appropriate; fluoroquinolones are often selected when non-ototoxic therapy is needed.',
    clinicalPearls:
        'Cold drops can cause dizziness; warming in the hand improves tolerability.',
    commonMistakes:
        'Confusing eye/ear formulation instructions; immediately sitting upright so drops drain out.',
    source: 'MedlinePlus ciprofloxacin otic',
  ),
  'naproxen': MedicationClinicalDetail(
    therapyDuration:
        'Lowest effective dose for shortest appropriate duration; chronic inflammatory use needs ongoing GI/CV/renal review.',
    exactAdministration:
        'Take with a full glass of water; food/milk can reduce nausea. Different IR, delayed-release and ER products are not interchangeable.',
    monitoring:
        'GI bleeding, blood pressure, renal function, edema and cardiovascular symptoms.',
    interactions:
        'Anticoagulants/antiplatelets, ACEI/ARB/diuretics, lithium and other NSAIDs are high-value interactions.',
    specialPopulations:
        'CKD, ulcer history, cardiovascular disease, dehydration and pregnancy require extra caution.',
    clinicalPearls:
        'Longer half-life than ibuprofen means patients may accidentally overlap NSAIDs when “switching.”',
    commonMistakes:
        'Taking naproxen plus ibuprofen/diclofenac together.',
    source: 'MedlinePlus naproxen',
  ),
  'bisacodyl-tablets': MedicationClinicalDetail(
    therapyDuration:
        'Short-term self-treatment; persistent need beyond about a week should prompt evaluation unless clinician-directed.',
    exactAdministration:
        'Swallow enteric-coated tablets whole. Avoid dairy/antacids within at least 1 hour of dose.',
    formulationHandling:
        'Tablets and suppositories have different onset and administration; do not crush enteric-coated tablets.',
    monitoring:
        'Bowel response, cramps, dehydration and chronic overuse.',
    interactions:
        'Antacids/dairy can disrupt enteric coating when taken too close.',
    specialPopulations:
        'Suspected obstruction or acute severe abdominal pain requires evaluation.',
    clinicalPearls:
        'A bedtime tablet often works the next day; patients may redose too soon if they expect immediate action.',
    commonMistakes:
        'Chewing/crushing tablet; taking with milk or antacid.',
    source: 'MedlinePlus bisacodyl',
  ),
  'senna': MedicationClinicalDetail(
    therapyDuration:
        'Short-term unless part of a clinician-directed bowel regimen.',
    exactAdministration:
        'Often once daily at bedtime or divided depending on product/regimen; onset commonly overnight.',
    monitoring:
        'Cramps, diarrhea, hydration and persistent constipation.',
    interactions:
        'Chronic excessive use can worsen electrolyte problems and complicate use of selected cardiac drugs.',
    specialPopulations:
        'Alarm GI symptoms require evaluation before stimulant laxatives.',
    clinicalPearls:
        'Useful in opioid bowel regimens, but often needs combination with an osmotic agent rather than escalating senna alone.',
    commonMistakes:
        'Using indefinitely for unexplained constipation without evaluation.',
    source: 'MedlinePlus senna',
  ),
  'hydrocortisone-topical': MedicationClinicalDetail(
    therapyDuration:
        'Short courses are typical for mild inflammatory dermatoses. Duration and potency must match site and diagnosis.',
    exactAdministration:
        'Apply a thin film to affected skin only at the recommended frequency; avoid unnecessary occlusion.',
    formulationHandling:
        'Cream, ointment, lotion and scalp/rectal products are not interchangeable in use.',
    monitoring:
        'Skin thinning, infection, worsening rash and treatment response; systemic absorption risk rises with large areas/occlusion.',
    interactions:
        'Few systemic interactions at low-potency limited use; additive topical steroid exposure matters.',
    specialPopulations:
        'Face, groin, skin folds, infants and large body-surface area require extra caution.',
    clinicalPearls:
        'Use fingertip-unit counseling when appropriate; “more cream” does not mean faster control.',
    commonMistakes:
        'Applying indefinitely to face/groin; using on fungal infection without correct diagnosis.',
    source: 'MedlinePlus hydrocortisone topical',
  ),
  'combined-oral-contraceptive': MedicationClinicalDetail(
    therapyDuration:
        'Ongoing contraception while desired and medically eligible; no fixed maximum duration based on age alone.',
    exactAdministration:
        'One active pill daily following the exact pack. Start method and placebo interval differ by product.',
    formulationHandling:
        'Ethinyl estradiol/progestin types and pack designs differ; missed-pill instructions must follow exact product.',
    monitoring:
        'Blood pressure, adherence, bleeding pattern, VTE/stroke risk factors and interacting medicines.',
    interactions:
        'Enzyme inducers can reduce contraceptive efficacy. Some products interact with lamotrigine; review all antiseizure drugs.',
    specialPopulations:
        'Smoking age >35, migraine with aura, VTE history, early postpartum state and uncontrolled hypertension may contraindicate estrogen-containing methods.',
    clinicalPearls:
        'The “missed pill” plan is a core counseling skill and should be product-specific, not memorized as one rule.',
    commonMistakes:
        'Stopping due to breakthrough bleeding in first cycles; forgetting backup contraception after missed pills when required.',
    source: 'MedlinePlus / contraceptive labeling',
  ),
  'norethindrone-pop': MedicationClinicalDetail(
    therapyDuration:
        'Ongoing contraception while desired; continuous daily use without estrogen-free break unless product specifies otherwise.',
    exactAdministration:
        'Take at the same time every day. The allowable late window and backup rules depend on the exact progestin-only product.',
    monitoring:
        'Bleeding pattern, adherence and pregnancy symptoms if pills are missed/late.',
    interactions:
        'Enzyme-inducing medicines can reduce efficacy.',
    specialPopulations:
        'Useful when estrogen is inappropriate, but individual contraindications still apply.',
    clinicalPearls:
        'Timing precision is more important with traditional norethindrone POPs than with some newer progestin-only pills.',
    commonMistakes:
        'Applying combined-pill missed-dose rules to a progestin-only pill.',
    source: 'MedlinePlus progestin-only oral contraceptives',
  ),
  'levonorgestrel-ec': MedicationClinicalDetail(
    therapyDuration:
        'Single-use emergency contraception after a specific episode; not a scheduled ongoing method.',
    exactAdministration:
        'Take as soon as possible within the product/recommendation window. Vomiting soon after dose may require redosing advice.',
    monitoring:
        'Expected next menses, pregnancy testing if delayed and ongoing contraception plan.',
    interactions:
        'Strong enzyme inducers can reduce effectiveness; consider alternative emergency contraception.',
    specialPopulations:
        'Body weight/BMI may influence effectiveness; guideline/product recommendations should be considered.',
    clinicalPearls:
        'Emergency contraception does not terminate an established pregnancy and does not protect against STIs.',
    commonMistakes:
        'Waiting unnecessarily; using repeatedly without establishing reliable ongoing contraception.',
    source: 'MedlinePlus levonorgestrel emergency contraception',
  ),
  'paracetamol': MedicationClinicalDetail(
    therapyDuration:
        'Short-term self-treatment for pain/fever unless clinician-directed; persistent symptoms require diagnosis review.',
    exactAdministration:
        'Dose interval and maximum daily exposure depend on age, formulation, liver risk and all combination products.',
    formulationHandling:
        'Immediate-release, extended-release, liquid and combination products are not interchangeable by tablet/mL count.',
    monitoring:
        'Total daily dose from every source, liver risk, alcohol use and symptom duration.',
    interactions:
        'Chronic high-dose use can increase INR variability with warfarin in some patients.',
    specialPopulations:
        'Lower total daily limits may be appropriate in low body weight, liver disease, frailty or heavy alcohol use.',
    clinicalPearls:
        'The biggest outpatient safety issue is duplicate acetaminophen/paracetamol hidden in cold/flu products.',
    commonMistakes:
        'Taking two different brand products that both contain paracetamol.',
    source: 'MedlinePlus / OTC labeling',
  ),
  'paracetamol-pediatric-liquid': MedicationClinicalDetail(
    therapyDuration:
        'Short-term for fever/pain while cause is self-limited; persistent fever/pain needs age-appropriate assessment.',
    exactAdministration:
        'Dose by weight and exact concentration; use oral syringe for small children.',
    formulationHandling:
        'Concentrations and dropper/syringe markings vary by market/product. Never copy mL from another bottle.',
    monitoring:
        'Total daily exposure, duplicate cold/flu products, hydration and symptom duration.',
    interactions:
        'Few acute interactions, but chronic repeated dosing can matter with warfarin.',
    specialPopulations:
        'Young infants with fever need medical assessment rather than routine repeated antipyretic treatment alone.',
    clinicalPearls:
        'Weight-based dosing should use a recent weight, not age alone when possible.',
    commonMistakes:
        'Using a kitchen spoon; confusing mg with mL; alternating multiple fever medicines without a written plan.',
    source: 'MedlinePlus / pediatric acetaminophen labeling',
  ),
  'spironolactone': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for heart failure, resistant hypertension or selected endocrine/dermatologic indications.',
    exactAdministration:
        'Take consistently with regard to food, especially for suspension products. Earlier-day dosing may reduce nocturia.',
    formulationHandling:
        'Tablet and suspension are not automatically bioequivalent/interchangeable.',
    monitoring:
        'Potassium and renal function after initiation/titration and periodically; blood pressure and volume status.',
    interactions:
        'ACEI/ARB/ARNI, potassium supplements/salt substitutes, trimethoprim and NSAIDs increase hyperkalemia/renal risk.',
    specialPopulations:
        'Avoid in significant hyperkalemia/renal failure; endocrine adverse effects may limit adherence.',
    clinicalPearls:
        'Trimethoprim is an under-recognized contributor to severe hyperkalemia in spironolactone users.',
    commonMistakes:
        'Adding potassium supplement automatically because it is a “diuretic.”',
    source: 'MedlinePlus spironolactone',
  ),
  'hydrochlorothiazide': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for hypertension; edema regimens may be intermittent.',
    exactAdministration:
        'Once daily or divided depending on indication; morning dosing is practical to reduce nocturia.',
    monitoring:
        'Blood pressure, sodium, potassium, renal function, uric acid/gout and glucose when clinically relevant.',
    interactions:
        'Lithium, NSAIDs and other BP-lowering drugs are high-value interactions.',
    specialPopulations:
        'Older adults and low-solute intake are at greater hyponatremia risk.',
    clinicalPearls:
        'Thiazide-induced hyponatremia can occur even after long-term stable use when circumstances change.',
    commonMistakes:
        'Assuming all muscle cramps mean low potassium without checking sodium/magnesium/volume status.',
    source: 'MedlinePlus hydrochlorothiazide',
  ),
  'sitagliptin': MedicationClinicalDetail(
    therapyDuration:
        'Chronic glucose-lowering therapy while effective and tolerated.',
    exactAdministration:
        'Once daily with or without food.',
    monitoring:
        'A1c/glucose, renal function for dose adjustment, pancreatitis symptoms and heart-failure symptoms in susceptible patients.',
    interactions:
        'Hypoglycemia risk increases with insulin or sulfonylurea.',
    specialPopulations:
        'Renal impairment requires lower doses except for selected DPP-4 alternatives.',
    clinicalPearls:
        'Low hypoglycemia risk alone, but not when combined with insulin/sulfonylurea.',
    commonMistakes:
        'Failing to adjust dose after renal decline.',
    source: 'MedlinePlus sitagliptin',
  ),

  'valsartan': MedicationClinicalDetail(
    therapyDuration:
        'Usually long-term for hypertension/heart failure; post-MI duration is indication-driven.',
    exactAdministration:
        'Once or twice daily according to indication, with or without food, at consistent times.',
    formulationHandling:
        'Tablet and compounded/suspension products require product-specific concentration and storage verification.',
    monitoring:
        'Blood pressure, renal function and potassium after initiation/titration and as clinically indicated.',
    interactions:
        'Potassium supplements/salt substitutes, potassium-sparing diuretics, NSAIDs and dual RAAS blockade increase risk.',
    specialPopulations:
        'Avoid in pregnancy. Use caution with dehydration, renal artery stenosis and hyperkalemia.',
    clinicalPearls:
        'Like other RAAS blockers, mild creatinine increase after initiation does not automatically mean nephrotoxicity.',
    commonMistakes:
        'Stopping when BP normalizes; taking potassium supplements without checking.',
    source: 'MedlinePlus valsartan / ARB labeling',
  ),
  'sacubitril-valsartan': MedicationClinicalDetail(
    therapyDuration:
        'Long-term heart-failure therapy when tolerated and clinically beneficial.',
    exactAdministration:
        'Usually twice daily with or without food. Titration is gradual.',
    formulationHandling:
        'Tablets, sprinkle capsules and pharmacist-prepared suspension require different handling. Do not chew/crush oral pellets.',
    monitoring:
        'Blood pressure, renal function, potassium, angioedema symptoms and heart-failure status.',
    interactions:
        'ACE inhibitors require a 36-hour washout. Potassium-raising therapy, NSAIDs and lithium require review.',
    specialPopulations:
        'Avoid in pregnancy; prior angioedema and severe renal/hepatic disease need individualized assessment.',
    clinicalPearls:
        'The ACE-inhibitor washout is a high-risk transition-of-care point.',
    commonMistakes:
        'Starting immediately after an ACE inhibitor; treating sprinkle capsules like ordinary capsules.',
    source: 'MedlinePlus valsartan/sacubitril',
  ),
  'carvedilol': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for heart failure, hypertension or post-MI indications.',
    exactAdministration:
        'Immediate-release tablets are taken with food to reduce orthostatic hypotension; ER products have different once-daily instructions.',
    formulationHandling:
        'IR and ER are not direct tablet-for-tablet substitutes. ER capsules may have sprinkle instructions depending on product.',
    monitoring:
        'Heart rate, blood pressure, dizziness, weight/edema and heart-failure symptoms.',
    interactions:
        'Other rate-slowing drugs, CYP2D6 inhibitors and clonidine require caution.',
    specialPopulations:
        'Asthma/COPD, conduction disease, diabetes and frailty need individualized titration.',
    clinicalPearls:
        'Heart-failure patients may transiently feel worse during titration; do not escalate quickly without assessing volume status.',
    commonMistakes:
        'Taking IR on an empty stomach; abrupt discontinuation.',
    source: 'MedlinePlus carvedilol',
  ),
  'digoxin-oral': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic when used for atrial fibrillation rate control or selected heart-failure patients.',
    exactAdministration:
        'Take at the same time daily; keep formulation consistent.',
    formulationHandling:
        'Tablet, capsule/elixir products differ in bioavailability. Pediatric liquid measurement is high risk for error.',
    monitoring:
        'Renal function, potassium/magnesium, heart rate/rhythm and serum digoxin concentration when clinically indicated.',
    interactions:
        'Amiodarone, verapamil, macrolides and P-gp inhibitors can increase digoxin exposure; hypokalemia increases toxicity risk.',
    specialPopulations:
        'Older adults and renal impairment need lower dosing and careful interpretation of concentrations.',
    clinicalPearls:
        'Draw serum level at an appropriate post-dose interval; an early level can appear falsely high.',
    commonMistakes:
        'Using “therapeutic range” without clinical context; forgetting renal-dose reassessment.',
    source: 'MedlinePlus / current digoxin labeling',
  ),
  'rosuvastatin': MedicationClinicalDetail(
    therapyDuration:
        'Usually long-term/lifelong cardiovascular risk-reduction therapy while indicated.',
    exactAdministration:
        'Once daily with or without food, any consistent time.',
    formulationHandling:
        'Tablet and sprinkle-capsule products differ. Some sprinkle products can be opened onto approved soft food; verify exact label.',
    monitoring:
        'Lipid response, adherence and muscle/liver symptoms; CK/LFT testing is targeted rather than automatic in every visit.',
    interactions:
        'Cyclosporine, gemfibrozil, some antivirals and aluminum/magnesium antacids are important.',
    specialPopulations:
        'Renal impairment and some ancestry groups require lower starting/max doses.',
    clinicalPearls:
        'Antacid separation can matter even though rosuvastatin is not a CYP3A4-dependent statin.',
    commonMistakes:
        'Stopping after LDL improves; assuming all statins have identical interactions.',
    source: 'MedlinePlus rosuvastatin',
  ),
  'diltiazem-er': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for hypertension, angina or rate control.',
    exactAdministration:
        'ER products are generally once daily but exact meal/opening instructions depend on brand.',
    formulationHandling:
        'Many ER formulations are not interchangeable; some capsules can be opened/sprinkled while others cannot.',
    monitoring:
        'Heart rate, blood pressure, edema, dizziness and conduction symptoms.',
    interactions:
        'Beta-blockers and other AV-node blockers increase bradycardia risk; diltiazem also inhibits CYP3A4 and can increase selected statin levels.',
    specialPopulations:
        'Avoid/caution in significant systolic heart failure or conduction disease unless specifically indicated.',
    clinicalPearls:
        'Always document the exact ER product at transitions of care.',
    commonMistakes:
        'Substituting different ER brands by dose alone; crushing modified-release products.',
    source: 'MedlinePlus diltiazem',
  ),
  'dapagliflozin': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for diabetes, CKD or heart failure while benefit persists.',
    exactAdministration:
        'Once daily with or without food, commonly in the morning for convenience.',
    formulationHandling:
        'Tablet; do not create a nonstandard split/crush plan without product verification.',
    monitoring:
        'Renal function, volume status, genital/urinary infections, ketoacidosis symptoms and glucose/A1c when used for diabetes.',
    interactions:
        'Diuretics can worsen volume depletion; insulin/sulfonylureas can increase hypoglycemia risk.',
    specialPopulations:
        'Temporary interruption before major surgery/prolonged fasting follows label/local protocol.',
    clinicalPearls:
        'Ketoacidosis can occur with only modest glucose elevation.',
    commonMistakes:
        'Continuing through severe vomiting/fasting without sick-day plan.',
    source: 'MedlinePlus dapagliflozin',
  ),
  'dulaglutide': MedicationClinicalDetail(
    therapyDuration:
        'Long-term weekly therapy if effective and tolerated.',
    exactAdministration:
        'Subcutaneous once weekly on the same weekday; time of day is flexible within product rules.',
    formulationHandling:
        'Single-dose pen/syringe devices differ by market. No dose “click counting” unless the exact device is designed for it.',
    monitoring:
        'A1c/glucose, weight, GI tolerance, gallbladder/pancreatitis symptoms and hypoglycemia with insulin/sulfonylurea.',
    interactions:
        'Delayed gastric emptying can affect oral-drug absorption in selected cases.',
    specialPopulations:
        'Pregnancy and severe GI disease require individualized review; boxed thyroid-tumor warning applies to relevant history.',
    clinicalPearls:
        'GI symptoms often improve with time; titration should not be rushed.',
    commonMistakes:
        'Taking more than once weekly; reusing single-dose device.',
    source: 'MedlinePlus dulaglutide',
  ),
  'tirzepatide': MedicationClinicalDetail(
    therapyDuration:
        'Long-term weekly therapy for approved diabetes/weight indications while beneficial.',
    exactAdministration:
        'Once weekly subcutaneous injection; dose escalation is gradual and indication/product specific.',
    formulationHandling:
        'Pen/vial systems vary by product and market; verify concentration and device before teaching.',
    monitoring:
        'A1c/glucose or weight, GI tolerance, gallbladder/pancreatitis symptoms, dehydration and hypoglycemia with insulin/sulfonylurea.',
    interactions:
        'Gastric-emptying effect can reduce reliability of oral hormonal contraceptives around initiation/escalation according to product labeling.',
    specialPopulations:
        'Pregnancy and severe GI disease require review; relevant thyroid-tumor history is contraindication/major warning.',
    clinicalPearls:
        'Weight-loss plateau is not a reason to skip titration steps or exceed approved dose.',
    commonMistakes:
        'Accelerating titration; confusing pen strengths or mg with mL.',
    source: 'FDA tirzepatide labeling',
  ),
  'glipizide': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic while effective and safe.',
    exactAdministration:
        'IR is usually taken about 30 minutes before a meal; ER is generally once daily with breakfast. Verify formulation.',
    formulationHandling:
        'Do not crush or chew ER tablets; empty shell may appear in stool.',
    monitoring:
        'Glucose/A1c, hypoglycemia, meal regularity, renal/hepatic function and weight.',
    interactions:
        'Alcohol, other glucose-lowering therapy and beta-blockers can complicate hypoglycemia recognition.',
    specialPopulations:
        'Older adults and patients with irregular intake are more vulnerable to hypoglycemia.',
    clinicalPearls:
        'Formulation determines timing more than drug name alone.',
    commonMistakes:
        'Taking ER as if it were IR before meals; skipping meal after dose.',
    source: 'MedlinePlus glipizide',
  ),
  'pioglitazone': MedicationClinicalDetail(
    therapyDuration:
        'Chronic therapy if effective, with periodic reassessment of edema/heart-failure and fracture risk.',
    exactAdministration:
        'Once daily with or without food.',
    formulationHandling:
        'Tablet; no special crushing plan should be assumed for tube use without verification.',
    monitoring:
        'Weight/edema, heart-failure symptoms, A1c and liver status when clinically indicated.',
    interactions:
        'Insulin increases edema/heart-failure risk; CYP2C8 modifiers can alter exposure.',
    specialPopulations:
        'Avoid initiation in symptomatic heart failure; assess bladder-cancer history/risk per current labeling.',
    clinicalPearls:
        'Glycemic benefit may take weeks, so rapid dose escalation is not useful.',
    commonMistakes:
        'Ignoring rapid weight gain/edema; treating it as harmless “weight gain.”',
    source: 'MedlinePlus pioglitazone',
  ),
  'insulin-lispro': MedicationClinicalDetail(
    therapyDuration:
        'Chronic mealtime/correction insulin where indicated; dose changes frequently with meals, illness and other therapy.',
    exactAdministration:
        'Use relative to meals exactly as product/prescription specifies; patient should have food immediately available.',
    formulationHandling:
        'U-100 and U-200 products are not volume-interchangeable. Do not withdraw concentrated insulin from a pen into a syringe.',
    monitoring:
        'Glucose/CGM, hypoglycemia, carb intake, injection sites and storage.',
    interactions:
        'Other glucose-lowering drugs increase hypoglycemia; beta-blockers can mask adrenergic warning symptoms.',
    specialPopulations:
        'Renal/hepatic impairment may reduce insulin requirements.',
    clinicalPearls:
        'Most mealtime insulin errors are timing, wrong product or wrong concentration errors—not “dose-calculation” errors.',
    commonMistakes:
        'Injecting then delaying meal; confusing rapid-acting with basal insulin.',
    source: 'MedlinePlus insulin lispro / product IFU',
  ),
  'fluticasone-inhaled': MedicationClinicalDetail(
    therapyDuration:
        'Long-term controller therapy; step-down only after sustained control and clinician review.',
    exactAdministration:
        'Once or twice daily depending on exact product; rinse mouth and spit afterward.',
    formulationHandling:
        'Aerosol and dry-powder devices require different inhalation speed and cleaning; some contain milk protein.',
    monitoring:
        'Symptoms, exacerbations, adherence, technique, candidiasis/dysphonia and pediatric growth when relevant.',
    interactions:
        'Strong CYP3A4 inhibitors can increase systemic steroid exposure.',
    specialPopulations:
        'Device choice must match inspiratory ability and dexterity.',
    clinicalPearls:
        'A “stronger inhaler” often performs worse than a simpler device the patient can use correctly.',
    commonMistakes:
        'Using only when symptomatic; not rinsing; wrong inhalation speed.',
    source: 'MedlinePlus fluticasone inhalation',
  ),
  'fluticasone-salmeterol': MedicationClinicalDetail(
    therapyDuration:
        'Long-term controller therapy; product/indication determines step-down plan.',
    exactAdministration:
        'Usually twice daily ~12 hours apart for many products; rinse mouth and spit after dose.',
    formulationHandling:
        'Diskus, HFA and RespiClick-type devices are not interchangeable in technique or dosing.',
    monitoring:
        'Control, rescue use, exacerbations, technique, adherence and local steroid adverse effects.',
    interactions:
        'Do not duplicate another LABA. Strong CYP3A4 inhibitors can increase fluticasone/salmeterol exposure.',
    specialPopulations:
        'Asthma requires LABA use with inhaled corticosteroid; avoid LABA monotherapy.',
    clinicalPearls:
        'Always verify both drug strength and device name when refilling.',
    commonMistakes:
        'Treating as rescue inhaler; using spacer with a DPI; failing to rinse mouth.',
    source: 'MedlinePlus fluticasone/salmeterol',
  ),
  'ipratropium-inhaled': MedicationClinicalDetail(
    therapyDuration:
        'Maintenance/short-acting bronchodilator use is indication-specific; chronic COPD use is common.',
    exactAdministration:
        'Inhaler or nebulizer at prescribed intervals; technique depends on device.',
    formulationHandling:
        'Do not mix nebulizer solutions unless compatibility is established. Protect eyes from aerosol/mist.',
    monitoring:
        'Dry mouth, urinary retention, glaucoma symptoms and respiratory response.',
    interactions:
        'Additive anticholinergic effects with other antimuscarinic drugs.',
    specialPopulations:
        'Caution with narrow-angle glaucoma and bladder-outflow obstruction.',
    clinicalPearls:
        'Eye exposure from poorly fitting nebulizer masks is preventable and clinically important.',
    commonMistakes:
        'Spraying into eyes; assuming every nebulizer drug can be mixed together.',
    source: 'MedlinePlus ipratropium',
  ),
  'budesonide-nebulizer': MedicationClinicalDetail(
    therapyDuration:
        'Long-term controller therapy when indicated; not for immediate relief.',
    exactAdministration:
        'Nebulize unit-dose suspension through a compatible jet nebulizer per product IFU.',
    formulationHandling:
        'Do not assume compatibility with other nebulized drugs. Shake/resuspend ampule only as label directs.',
    monitoring:
        'Asthma control, candidiasis, dysphonia, mask skin exposure and child growth when relevant.',
    interactions:
        'Strong CYP3A4 inhibitors may increase systemic budesonide exposure.',
    specialPopulations:
        'Young children using a face mask should have face washed after treatment.',
    clinicalPearls:
        'Clean/dry nebulizer equipment is part of medication counseling, not a separate device issue.',
    commonMistakes:
        'Stopping once symptoms improve; not cleaning device; not rinsing mouth.',
    source: 'Budesonide inhalation suspension labeling',
  ),
  'amoxicillin-clavulanate-oral': MedicationClinicalDetail(
    therapyDuration:
        'Fixed course; duration depends on infection and guideline.',
    exactAdministration:
        'Take at start of meal/with food to improve clavulanate tolerance and absorption.',
    formulationHandling:
        'Different strengths have different amoxicillin:clavulanate ratios; tablets/suspensions are not interchangeable by amoxicillin mg alone.',
    monitoring:
        'Allergy, GI tolerance, severe diarrhea and liver injury symptoms; renal function when dose adjustment is relevant.',
    interactions:
        'Warfarin/INR, allopurinol and methotrexate may require review.',
    specialPopulations:
        'History of cholestatic jaundice/hepatic dysfunction due to this drug is a major contraindication.',
    clinicalPearls:
        'The “same amoxicillin dose” can deliver very different clavulanate exposure across formulations.',
    commonMistakes:
        'Substituting suspension strengths without recalculating clavulanate content.',
    source: 'MedlinePlus amoxicillin/clavulanate',
  ),
  'cephalexin': MedicationClinicalDetail(
    therapyDuration:
        'Short fixed course; indication-specific rather than universally 5, 7 or 10 days.',
    exactAdministration:
        'With or without food, at evenly spaced intervals according to prescription.',
    formulationHandling:
        'Suspension requires shaking, accurate mL measurement and product-specific storage/beyond-use.',
    monitoring:
        'Clinical response, allergy, severe diarrhea and renal function for adjustment.',
    interactions:
        'Warfarin/INR and metformin transport interaction can be clinically relevant in selected patients.',
    specialPopulations:
        'Assess beta-lactam allergy carefully rather than applying a blanket “penicillin allergy” exclusion.',
    clinicalPearls:
        'Renal dose adjustment is frequently overlooked.',
    commonMistakes:
        'Using a household spoon or wrong suspension concentration.',
    source: 'MedlinePlus cephalexin',
  ),
  'ciprofloxacin-oral': MedicationClinicalDetail(
    therapyDuration:
        'Fixed course based on infection; avoid unnecessary prolongation.',
    exactAdministration:
        'Take with water. Separate polyvalent cations according to label; do not take with dairy/calcium-fortified juice alone.',
    formulationHandling:
        'Tablet, ER tablet and suspension differ; ER must not be crushed.',
    monitoring:
        'Tendon symptoms, neuropathy, CNS effects, glucose disturbances, QT risk and renal function.',
    interactions:
        'Tizanidine is contraindicated; warfarin, theophylline/caffeine and polyvalent cations are important.',
    specialPopulations:
        'Older adults, transplant recipients, steroid users and patients with aneurysm risk require careful assessment.',
    clinicalPearls:
        'Fluoroquinolone toxicity can be disabling and may start early; indication matters.',
    commonMistakes:
        'Taking with mineral supplements; using for uncomplicated infections when safer options exist.',
    source: 'MedlinePlus / FDA fluoroquinolone warnings',
  ),
  'fluconazole-oral': MedicationClinicalDetail(
    therapyDuration:
        'Single dose to prolonged therapy depending on infection/site/immune status.',
    exactAdministration:
        'With or without food; take consistently when multi-dose regimen.',
    formulationHandling:
        'Tablet/suspension differ; suspension should be shaken and stored per product label.',
    monitoring:
        'Liver symptoms/labs in prolonged therapy, QT risk and renal function for dose adjustment.',
    interactions:
        'Warfarin, sulfonylureas, phenytoin, tacrolimus, selected statins and QT-risk medicines are important.',
    specialPopulations:
        'Pregnancy risk depends on dose/duration and indication; high-dose prolonged use is especially concerning.',
    clinicalPearls:
        'One-dose vaginal candidiasis counseling must not be copied to invasive candidiasis.',
    commonMistakes:
        'Ignoring interaction list because it is “just one antifungal tablet.”',
    source: 'MedlinePlus fluconazole',
  ),
  'valacyclovir': MedicationClinicalDetail(
    therapyDuration:
        'Short episodic, initial-episode or long-term suppressive therapy depending on herpes indication.',
    exactAdministration:
        'With or without food; maintain hydration and begin episodic therapy promptly.',
    formulationHandling:
        'Tablet; compounded suspension requires validated recipe/storage.',
    monitoring:
        'Renal function, hydration and neurotoxicity in renal impairment/older adults.',
    interactions:
        'Other nephrotoxic agents increase risk.',
    specialPopulations:
        'Dose adjustment is important in renal impairment.',
    clinicalPearls:
        'Shingles, genital herpes initial/recurrent and suppression all use different schedules.',
    commonMistakes:
        'Using a previous regimen for a different herpes indication.',
    source: 'MedlinePlus valacyclovir',
  ),
  'trimethoprim-sulfamethoxazole': MedicationClinicalDetail(
    therapyDuration:
        'Course and dose vary widely by indication, including UTI, skin infection and Pneumocystis treatment/prophylaxis.',
    exactAdministration:
        'Take with adequate water; food may improve GI tolerance.',
    formulationHandling:
        'Single-strength/double-strength tablets and suspension differ; calculate by trimethoprim component when appropriate.',
    monitoring:
        'Renal function, potassium, CBC and clinical response in higher-risk or prolonged therapy.',
    interactions:
        'Warfarin, methotrexate, ACEI/ARB/spironolactone and phenytoin are high-value interactions.',
    specialPopulations:
        'Sulfonamide allergy history, G6PD deficiency, pregnancy and renal impairment require individualized assessment.',
    clinicalPearls:
        'Hyperkalemia is a clinically important effect even without kidney failure.',
    commonMistakes:
        'Not checking potassium in high-risk combinations; confusing SS/DS strength.',
    source: 'MedlinePlus TMP-SMX',
  ),
  'lamotrigine': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for epilepsy/bipolar maintenance once effective.',
    exactAdministration:
        'Once or twice daily depending on regimen; titration must follow exact schedule.',
    formulationHandling:
        'Standard, chewable/dispersible and ODT products differ. Restarting after interruption may require re-titration.',
    monitoring:
        'Rash/systemic hypersensitivity, seizure/mood control and adherence.',
    interactions:
        'Valproate substantially increases lamotrigine exposure; enzyme inducers and estrogen-containing contraceptives can alter levels.',
    specialPopulations:
        'Pregnancy can change lamotrigine clearance; monitor clinically/levels when appropriate.',
    clinicalPearls:
        'The number of missed days matters because it can determine whether slow re-titration is needed.',
    commonMistakes:
        'Restarting full dose after several missed days; titrating too quickly.',
    source: 'MedlinePlus lamotrigine',
  ),
  'carbamazepine': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for epilepsy/neuralgia or selected psychiatric indications.',
    exactAdministration:
        'Take consistently with formulation-specific schedule; suspension should be shaken well.',
    formulationHandling:
        'IR, XR and suspension are not automatically interchangeable. XR tablets/capsules must follow exact crush/open rules.',
    monitoring:
        'CBC, sodium, liver function, rash and levels when clinically indicated.',
    interactions:
        'Strong enzyme inducer affecting contraceptives, anticoagulants, many psychiatric/antiseizure drugs and itself through autoinduction.',
    specialPopulations:
        'HLA testing may be appropriate in ancestry groups at higher risk of severe cutaneous reactions.',
    clinicalPearls:
        'Autoinduction means dose/level relationships change during early weeks.',
    commonMistakes:
        'Switching suspension to tablet milligram-for-milligram without considering frequency/peaks.',
    source: 'MedlinePlus carbamazepine',
  ),
  'phenytoin-oral': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for seizure prevention; level-guided adjustments should be small because kinetics are nonlinear.',
    exactAdministration:
        'Keep formulation and timing consistent. Enteral feeds can markedly reduce liquid absorption.',
    formulationHandling:
        'Sodium salt versus free-acid products and suspension/capsules differ in drug content/bioavailability.',
    monitoring:
        'Clinical seizure control, albumin/renal status, free or appropriately interpreted total concentration, CBC/LFTs and long-term bone/gum effects.',
    interactions:
        'Potent enzyme inducer with extensive bidirectional interactions.',
    specialPopulations:
        'Hypoalbuminemia/renal failure increase free fraction and make total level misleading.',
    feedingTube:
        'Validated ICU guidance commonly holds enteral feeds before/after dosing and monitors levels closely; avoid jejunal administration if possible.',
    clinicalPearls:
        'A small dose increase can cause a disproportionate concentration rise.',
    commonMistakes:
        'Large empiric dose increases based only on a “low level.”',
    source: 'MedlinePlus + ICU enteral reference',
  ),
  'pregabalin': MedicationClinicalDetail(
    therapyDuration:
        'Continue only while meaningful benefit persists for neuropathic pain; chronic use is common for epilepsy adjunct.',
    exactAdministration:
        'Two or three times daily depending on formulation/indication; may be taken with or without food.',
    formulationHandling:
        'Capsule, solution and ER tablet differ. ER tablets are not interchangeable with IR total daily dose without conversion instructions.',
    monitoring:
        'Sedation, dizziness, edema, weight gain, falls and respiratory depression with opioids/CNS depressants.',
    interactions:
        'Primarily pharmacodynamic CNS depression; few CYP interactions.',
    specialPopulations:
        'Renal dose adjustment is essential.',
    clinicalPearls:
        'Periodic benefit reassessment prevents indefinite ineffective neuropathic-pain therapy.',
    commonMistakes:
        'Abrupt stopping; failing to adjust for renal decline.',
    source: 'MedlinePlus pregabalin',
  ),
  'duloxetine': MedicationClinicalDetail(
    therapyDuration:
        'Months to long-term depending on depression/anxiety/neuropathic-pain indication and recurrence risk.',
    exactAdministration:
        'Once or twice daily depending on indication; swallow delayed-release capsule whole.',
    formulationHandling:
        'Do not crush/chew delayed-release pellets unless exact product specifically supports another method.',
    monitoring:
        'Mood/suicidality, blood pressure, liver symptoms, sodium and withdrawal symptoms.',
    interactions:
        'MAOIs, serotonergic drugs, CYP1A2 inhibitors and NSAIDs/anticoagulants are important.',
    specialPopulations:
        'Avoid/caution in substantial liver disease, heavy alcohol use and severe renal impairment per label.',
    clinicalPearls:
        'Neuropathic-pain response should be assessed separately from antidepressant response.',
    commonMistakes:
        'Abrupt stopping; opening/crushing delayed-release formulation.',
    source: 'MedlinePlus duloxetine',
  ),
  'escitalopram': MedicationClinicalDetail(
    therapyDuration:
        'Continue for an adequate maintenance period after response; recurrent disorders may need long-term therapy.',
    exactAdministration:
        'Once daily morning or evening, with or without food.',
    formulationHandling:
        'Tablet/oral solution; measure liquid accurately.',
    monitoring:
        'Mood/suicidality, sexual dysfunction, sodium in high-risk patients, QT risk and adherence.',
    interactions:
        'MAOIs and serotonergic drugs; NSAIDs/anticoagulants increase bleeding risk.',
    specialPopulations:
        'Older adults and hepatic impairment often require lower maximum dose.',
    clinicalPearls:
        'Early nausea/anxiety activation can improve before therapeutic benefit is evident.',
    commonMistakes:
        'Stopping in first week because symptoms are not improved yet.',
    source: 'MedlinePlus escitalopram',
  ),
  'topiramate': MedicationClinicalDetail(
    therapyDuration:
        'Chronic for epilepsy or migraine prevention if effective.',
    exactAdministration:
        'Usually once or twice daily depending on product; maintain hydration.',
    formulationHandling:
        'Tablets, sprinkle capsules and ER products have different crush/open instructions.',
    monitoring:
        'Cognition, weight, bicarbonate/metabolic acidosis, kidney stones, ocular symptoms and renal function.',
    interactions:
        'Carbonic-anhydrase inhibitors and selected contraceptives/antiseizure drugs require review.',
    specialPopulations:
        'Pregnancy carries fetal risk; counsel contraception/planning.',
    clinicalPearls:
        'Word-finding difficulty and cognitive slowing are common adherence issues.',
    commonMistakes:
        'Stopping abruptly; inadequate hydration; crushing ER formulations.',
    source: 'MedlinePlus topiramate',
  ),

  'pantoprazole-oral': MedicationClinicalDetail(
    therapyDuration:
        'Indication-specific: many GERD/ulcer courses are time-limited, while hypersecretory or relapse-prone conditions may require long-term therapy.',
    exactAdministration:
        'Delayed-release tablets are swallowed whole. Granules are administered by product-specific mixing instructions; many regimens are given before meals.',
    formulationHandling:
        'Do not crush delayed-release tablets or granules. Tablet and granule administration are not interchangeable.',
    monitoring:
        'Reassess ongoing indication during long-term therapy; monitor magnesium, B12/iron or bone/infection risk only when clinically relevant.',
    interactions:
        'Acid-dependent drugs and selected antiretrovirals can be affected; less CYP2C19 inhibition than omeprazole but still review full medication list.',
    specialPopulations:
        'Long-term use should be periodically reviewed rather than continued automatically.',
    clinicalPearls:
        'Persistent symptoms often reflect incorrect timing or non-acid disease rather than inadequate PPI potency.',
    commonMistakes:
        'Crushing delayed-release tablet; extending OTC-like use indefinitely without reassessment.',
    source: 'MedlinePlus pantoprazole / DailyMed labeling',
  ),
  'famotidine': MedicationClinicalDetail(
    therapyDuration:
        'Short-term self-care for occasional heartburn; longer therapy is indication-driven and should be reassessed.',
    exactAdministration:
        'With or without food. Timing may be bedtime or before trigger food depending on indication/product.',
    formulationHandling:
        'Tablet and suspension differ; shake/measure liquid accurately.',
    monitoring:
        'Symptom control and CNS adverse effects in renal impairment/older adults.',
    interactions:
        'Fewer CYP interactions than cimetidine; gastric pH can still alter absorption of selected drugs.',
    specialPopulations:
        'Renal impairment requires dose/frequency adjustment.',
    clinicalPearls:
        'Tolerance to H2 blockade can develop with continuous use, especially for nocturnal acid suppression.',
    commonMistakes:
        'Using indefinitely for alarm symptoms such as dysphagia, GI bleeding or weight loss.',
    source: 'MedlinePlus famotidine',
  ),
  'sucralfate': MedicationClinicalDetail(
    therapyDuration:
        'Usually a defined ulcer-treatment course; chronic use is uncommon unless a specific indication persists.',
    exactAdministration:
        'Typically on an empty stomach, often 1 hour before meals and at bedtime depending on regimen.',
    formulationHandling:
        'Tablet and suspension are not handled identically; shake suspension well.',
    monitoring:
        'Constipation and aluminum accumulation in significant renal impairment.',
    interactions:
        'Can bind many oral drugs; separate interacting medicines by drug-specific interval.',
    specialPopulations:
        'Avoid indiscriminate long-term use in advanced kidney disease because aluminum can accumulate.',
    clinicalPearls:
        'Sucralfate is primarily a local mucosal agent, so timing around other oral medicines is a major practical issue.',
    commonMistakes:
        'Taking all morning tablets together with sucralfate.',
    source: 'MedlinePlus sucralfate',
  ),
  'mesalamine': MedicationClinicalDetail(
    therapyDuration:
        'Induction and long-term maintenance are both common in ulcerative colitis; regimen depends on extent/severity and formulation.',
    exactAdministration:
        'Food instructions and frequency differ by brand/formulation; follow exact product label.',
    formulationHandling:
        'Delayed- and extended-release products target different GI regions and are not automatically interchangeable. Do not crush unless exact label permits.',
    monitoring:
        'Renal function before and periodically during therapy; monitor worsening GI symptoms, intolerance syndrome and rare cardiac/pancreatic adverse effects.',
    interactions:
        'Nephrotoxic drugs may increase kidney risk; thiopurine-related myelosuppression interactions can be relevant.',
    specialPopulations:
        'Renal impairment requires careful benefit-risk review.',
    clinicalPearls:
        'Brand/formulation substitution can change where the drug is released in the GI tract.',
    commonMistakes:
        'Switching 5-ASA products by milligram dose alone.',
    source: 'MedlinePlus mesalamine / product labeling',
  ),
  'metoclopramide-oral': MedicationClinicalDetail(
    therapyDuration:
        'Keep duration as short as possible; chronic use is limited by cumulative tardive-dyskinesia risk.',
    exactAdministration:
        'Often 30 minutes before meals and at bedtime for gastroparesis/GERD regimens, but indication-specific directions apply.',
    formulationHandling:
        'Tablet, ODT and solution differ. ODT handling and liquid measurement require specific instruction.',
    monitoring:
        'Acute dystonia, akathisia, parkinsonism, sedation and tardive movements; renal function for dose adjustment.',
    interactions:
        'Antipsychotics and other dopamine antagonists increase extrapyramidal risk; serotonergic/CNS depressant combinations matter.',
    specialPopulations:
        'Older adults, Parkinson disease and renal impairment need extra caution.',
    clinicalPearls:
        'A new “restlessness” complaint may be akathisia, not anxiety.',
    commonMistakes:
        'Continuing for months without review; treating new abnormal movements as unrelated.',
    source: 'MedlinePlus metoclopramide / boxed warning',
  ),
  'diclofenac-topical': MedicationClinicalDetail(
    therapyDuration:
        'OTC arthritis gel is generally limited to label-directed duration unless clinician-directed; prescription topical solutions may be chronic.',
    exactAdministration:
        'Apply only to intact skin in the product-specific amount/frequency; allow to dry and follow hand-washing/site instructions.',
    formulationHandling:
        '1% OTC gel, prescription solutions and 3% dermatologic gel have different indications and dosing.',
    monitoring:
        'Local skin reactions and systemic NSAID risks in high-exposure/high-risk patients.',
    interactions:
        'Concurrent oral NSAIDs, anticoagulants/antiplatelets and renal-risk combinations still matter.',
    specialPopulations:
        'Avoid on broken/infected skin and use caution with GI/CV/renal disease despite topical route.',
    clinicalPearls:
        'Topical NSAID reduces but does not eliminate systemic NSAID exposure.',
    commonMistakes:
        'Using household amount instead of dosing card; combining routinely with oral ibuprofen/naproxen.',
    source: 'MedlinePlus diclofenac topical',
  ),
  'celecoxib': MedicationClinicalDetail(
    therapyDuration:
        'Lowest effective dose for shortest appropriate duration; chronic inflammatory use requires ongoing reassessment.',
    exactAdministration:
        'May be taken with or without food at lower doses; larger individual doses may have food-specific instructions—follow product label.',
    formulationHandling:
        'Capsules may have product-specific opening/sprinkle instructions; do not generalize.',
    monitoring:
        'Blood pressure, renal function, edema, GI bleeding and cardiovascular symptoms.',
    interactions:
        'Warfarin/anticoagulants, ACEI/ARB/diuretics, lithium, fluconazole and other NSAIDs are important.',
    specialPopulations:
        'Sulfonamide allergy history should be clarified; CKD/CV disease/ulcer history raise risk.',
    clinicalPearls:
        'COX-2 selectivity lowers some GI risk but does not make the drug “stomach-safe” or cardiovascular-risk free.',
    commonMistakes:
        'Adding another OTC NSAID for breakthrough pain.',
    source: 'MedlinePlus celecoxib',
  ),
  'dabigatran': MedicationClinicalDetail(
    therapyDuration:
        'Indication-specific: atrial fibrillation is usually long-term; VTE treatment may be finite or extended.',
    exactAdministration:
        'Usually twice daily. Take consistently; food is not required for standard capsules.',
    formulationHandling:
        'Capsules must be swallowed whole. Do not crush/open because bioavailability can increase markedly. Storage in original container/blister is important.',
    monitoring:
        'Renal function, bleeding, adherence and peri-procedure plan. Routine INR monitoring is not used.',
    interactions:
        'P-gp inhibitors/inducers and other anticoagulant/antiplatelet/NSAID therapy are important.',
    specialPopulations:
        'Renal impairment substantially affects exposure; neuraxial procedures require timing protocols.',
    clinicalPearls:
        'Capsule-storage and do-not-open instructions are unusually important compared with many other DOACs.',
    commonMistakes:
        'Putting a month of capsules in a pill organizer; opening capsules for swallowing difficulty.',
    source: 'MedlinePlus dabigatran / FDA labeling',
  ),
  'enoxaparin': MedicationClinicalDetail(
    therapyDuration:
        'Can be short prophylaxis, finite VTE treatment/bridging, or longer therapy in selected situations.',
    exactAdministration:
        'Deep subcutaneous abdominal injection at prescribed interval; rotate sites and use exact prefilled-syringe technique.',
    formulationHandling:
        'Prefilled syringe strengths differ. Do not expel air bubble when product instructions say to retain it; avoid IM injection.',
    monitoring:
        'Bleeding, CBC/platelets, renal function and weight. Anti-Xa monitoring is reserved for selected patients.',
    interactions:
        'Other anticoagulants, antiplatelets and NSAIDs increase bleeding risk.',
    specialPopulations:
        'Renal impairment, extremes of body weight, pregnancy and neuraxial procedures require individualized dosing/timing.',
    clinicalPearls:
        'Bruising at injection sites is common; massaging increases local trauma and should be avoided.',
    commonMistakes:
        'Injecting IM; rubbing site; confusing prophylactic and treatment strengths.',
    source: 'MedlinePlus enoxaparin',
  ),
  'loratadine': MedicationClinicalDetail(
    therapyDuration:
        'Intermittent, seasonal or chronic depending on allergy/urticaria pattern.',
    exactAdministration:
        'Usually once daily with or without food.',
    formulationHandling:
        'Tablet, chewable, ODT and liquid formulations have different administration/age instructions.',
    monitoring:
        'Symptom control; sedation is uncommon but possible.',
    interactions:
        'Few major interactions, but full medication review is still needed in liver/renal impairment.',
    specialPopulations:
        'Dose interval may need adjustment in significant hepatic/renal impairment.',
    clinicalPearls:
        'If chronic urticaria is uncontrolled, simply stacking sedating antihistamines is not the best next step.',
    commonMistakes:
        'Assuming “non-drowsy” means zero sedation in every patient.',
    source: 'MedlinePlus loratadine',
  ),
  'chlorpheniramine': MedicationClinicalDetail(
    therapyDuration:
        'Short-term symptom relief; chronic routine use is often less desirable than second-generation antihistamines.',
    exactAdministration:
        'Immediate- and extended-release forms differ in frequency; measure liquids accurately.',
    formulationHandling:
        'Do not crush ER products. Many cough/cold combinations also contain chlorpheniramine.',
    monitoring:
        'Sedation, confusion, dry mouth, constipation, urinary retention and falls.',
    interactions:
        'Alcohol, opioids, benzodiazepines and other anticholinergic/CNS depressants increase adverse effects.',
    specialPopulations:
        'Older adults, glaucoma and BPH/urinary retention are higher-risk.',
    clinicalPearls:
        'First-generation antihistamines can impair driving the next morning even when taken at night.',
    commonMistakes:
        'Combining multiple cold products containing antihistamines.',
    source: 'MedlinePlus chlorpheniramine',
  ),
  'isotretinoin': MedicationClinicalDetail(
    therapyDuration:
        'Usually a finite acne course based on clinical response/cumulative exposure; repeat courses require reassessment.',
    exactAdministration:
        'Take exactly according to product food instructions because absorption differs among formulations.',
    formulationHandling:
        'Different isotretinoin products are not always bioequivalent; do not switch casually.',
    monitoring:
        'Pregnancy testing/prevention requirements, lipids, liver tests and clinically significant mood/visual/musculoskeletal symptoms.',
    interactions:
        'Avoid vitamin A supplements and tetracyclines because of additive toxicity/intracranial-hypertension risk.',
    specialPopulations:
        'Absolute pregnancy prevention requirements apply according to local regulatory program.',
    clinicalPearls:
        'Dry lips/skin are expected and proactive moisturization improves adherence.',
    commonMistakes:
        'Using tetracycline concurrently; donating blood during restricted period; taking pregnancy risk lightly.',
    source: 'FDA / MedlinePlus isotretinoin',
  ),
  'hydroxychloroquine': MedicationClinicalDetail(
    therapyDuration:
        'Long-term DMARD/autoimmune therapy when effective; onset of benefit may take weeks to months.',
    exactAdministration:
        'Take with food or milk to reduce GI upset.',
    formulationHandling:
        'Tablet; compounded liquid may be used under validated pharmacy preparation when needed.',
    monitoring:
        'Baseline/follow-up retinal screening, dose by actual body weight, renal risk, CBC/LFTs when indicated and cardiac/QT context.',
    interactions:
        'Other QT-prolonging agents and glucose-lowering drugs may be clinically relevant.',
    specialPopulations:
        'Renal impairment increases retinal-toxicity risk and may influence monitoring/dose.',
    clinicalPearls:
        'Retinal toxicity relates strongly to daily dose and cumulative exposure, so correct mg/kg dosing matters.',
    commonMistakes:
        'Assuming no eye follow-up is needed because vision feels normal.',
    source: 'MedlinePlus hydroxychloroquine / ophthalmology guidance',
  ),
  'sulfasalazine': MedicationClinicalDetail(
    therapyDuration:
        'Long-term for rheumatoid arthritis/IBD if effective; onset may take weeks.',
    exactAdministration:
        'Take after meals with full glass of water; keep hydration adequate.',
    formulationHandling:
        'Enteric-coated tablets should be swallowed whole; suspension/compounded products require exact formulation guidance.',
    monitoring:
        'CBC, liver function and renal function during initiation and periodically; rash/infection/GI symptoms.',
    interactions:
        'May reduce folate absorption and can affect digoxin; other myelosuppressive drugs increase risk.',
    specialPopulations:
        'Sulfonamide/salicylate allergy and G6PD deficiency require review.',
    clinicalPearls:
        'Reversible oligospermia can matter for male fertility counseling.',
    commonMistakes:
        'Crushing enteric-coated tablets; stopping early before DMARD benefit develops.',
    source: 'MedlinePlus sulfasalazine',
  ),
  'leflunomide': MedicationClinicalDetail(
    therapyDuration:
        'Long-term DMARD when effective/tolerated.',
    exactAdministration:
        'Once daily, with or without food; loading regimens are not appropriate for every patient.',
    formulationHandling:
        'Tablet; no routine crushing recommendation without exact product/handling review.',
    monitoring:
        'Liver tests, CBC, blood pressure, infection and pregnancy status.',
    interactions:
        'Other hepatotoxic/immunosuppressive drugs increase toxicity; warfarin response can change.',
    specialPopulations:
        'Contraindicated in pregnancy; accelerated elimination with cholestyramine/charcoal may be needed after toxicity or before conception.',
    clinicalPearls:
        'Very long active-metabolite half-life means stopping tablets does not rapidly remove exposure.',
    commonMistakes:
        'Thinking discontinuation alone immediately removes pregnancy/toxicity risk.',
    source: 'MedlinePlus leflunomide',
  ),
  'adalimumab': MedicationClinicalDetail(
    therapyDuration:
        'Long-term biologic therapy if effective and tolerated; induction and maintenance schedules vary by indication.',
    exactAdministration:
        'Subcutaneous injection at product/indication-specific interval; rotate sites.',
    formulationHandling:
        'Pens/syringes, citrate-free formulations and concentrations differ. Refrigeration, room-temperature allowance and warming time are product-specific.',
    monitoring:
        'TB/hepatitis screening, serious infection, malignancy/skin-cancer vigilance and clinical response.',
    interactions:
        'Avoid combining with certain biologic immunosuppressants due to infection risk; live-vaccine decisions require review.',
    specialPopulations:
        'Heart failure, demyelinating disease and recurrent infection history need individualized assessment.',
    clinicalPearls:
        'Biosimilars are clinically equivalent when approved, but device training may need repeating after switch.',
    commonMistakes:
        'Injecting cold from refrigerator when product allows warming; continuing through serious infection without contacting clinician.',
    source: 'MedlinePlus adalimumab / product IFU',
  ),
  'solifenacin': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for overactive bladder if symptom benefit outweighs anticholinergic burden.',
    exactAdministration:
        'Once daily, with or without food; swallow tablet whole.',
    formulationHandling:
        'Tablet and suspension products have different food/handling instructions.',
    monitoring:
        'Dry mouth, constipation, urinary retention, cognition and QT risk in susceptible patients.',
    interactions:
        'Strong CYP3A4 inhibitors can increase exposure; other anticholinergics add adverse effects.',
    specialPopulations:
        'Avoid in urinary/gastric retention and uncontrolled narrow-angle glaucoma.',
    clinicalPearls:
        'Constipation can worsen urinary symptoms, so proactive bowel counseling helps.',
    commonMistakes:
        'Escalating dose despite worsening constipation/retention.',
    source: 'MedlinePlus solifenacin',
  ),
  'mirabegron': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for overactive bladder when effective.',
    exactAdministration:
        'ER tablet once daily; swallow whole. Food instructions can differ between adult tablet and pediatric granule products.',
    formulationHandling:
        'Do not crush ER tablet. Granules are a separate suspension product.',
    monitoring:
        'Blood pressure, urinary retention and symptom response.',
    interactions:
        'Moderate CYP2D6 inhibition can raise selected drug levels; digoxin requires careful review.',
    specialPopulations:
        'Severe uncontrolled hypertension and bladder-outlet obstruction require caution.',
    clinicalPearls:
        'Useful when anticholinergic burden is problematic, but it is not “side-effect free.”',
    commonMistakes:
        'Crushing ER tablet; forgetting BP monitoring in hypertensive patients.',
    source: 'MedlinePlus mirabegron',
  ),
  'depot-medroxyprogesterone': MedicationClinicalDetail(
    therapyDuration:
        'Ongoing contraception by repeated injections; long-term use should be periodically reassessed in context of bone-health and patient preference.',
    exactAdministration:
        'Injection at the product-specific interval; late doses require pregnancy/backup-conception plan.',
    formulationHandling:
        'IM and subcutaneous depot products are not interchangeable in dose/device.',
    monitoring:
        'Bleeding pattern, weight, bone-health risk, injection timing and pregnancy risk if delayed.',
    interactions:
        'Enzyme-inducing drugs are generally less problematic than with oral contraceptives, but full review remains appropriate.',
    specialPopulations:
        'Adolescents and patients with osteoporosis risk need individualized bone-health counseling.',
    clinicalPearls:
        'Delayed return to fertility after stopping is common and should be discussed before choosing method.',
    commonMistakes:
        'Assuming fertility returns immediately after final injection; confusing IM and SC products.',
    source: 'MedlinePlus medroxyprogesterone injection',
  ),
  'olopatadine-eye': MedicationClinicalDetail(
    therapyDuration:
        'Seasonal/intermittent according to allergic-conjunctivitis symptoms.',
    exactAdministration:
        'Instill product-specific frequency without touching dropper tip; close eye gently after dose.',
    formulationHandling:
        'OTC strengths can have different once- versus twice-daily schedules.',
    monitoring:
        'Itching/redness response; pain, photophobia, discharge or visual loss require another diagnosis evaluation.',
    interactions:
        'Separate from other eye drops by an appropriate interval.',
    specialPopulations:
        'Contact-lens use must follow product instructions; lenses are not appropriate during active red/inflamed eye in many cases.',
    clinicalPearls:
        'Allergic eye itch should improve; persistent pain is not typical allergy.',
    commonMistakes:
        'Using for infectious conjunctivitis based on redness alone.',
    source: 'MedlinePlus olopatadine ophthalmic',
  ),
  'ibuprofen-pediatric-liquid': MedicationClinicalDetail(
    therapyDuration:
        'Short-term fever/pain treatment; persistent fever or pain requires age-appropriate evaluation.',
    exactAdministration:
        'Weight-based dose using exact concentration, at label/prescribed intervals. Give with food/milk if GI upset.',
    formulationHandling:
        'Concentrated infant drops and children’s suspension can differ substantially by market; use provided syringe/cup.',
    monitoring:
        'Hydration, urine output, GI symptoms, fever duration and total NSAID exposure.',
    interactions:
        'Avoid other NSAIDs; dehydration plus ACEI/ARB/diuretics in older children increases renal risk.',
    specialPopulations:
        'Avoid in significant dehydration and use only within age-approved guidance.',
    clinicalPearls:
        'A current weight is safer than age-banded dosing when available.',
    commonMistakes:
        'Using mL from a previous bottle with different concentration.',
    source: 'MedlinePlus / pediatric ibuprofen labeling',
  ),
  'oral-rehydration-solution': MedicationClinicalDetail(
    therapyDuration:
        'Use during ongoing diarrheal/vomiting fluid losses until hydration and intake recover; not a substitute for evaluation of severe dehydration.',
    exactAdministration:
        'Dissolve sachet in exactly the stated volume of clean water. Give frequent small sips; continue breastfeeding/appropriate feeding.',
    formulationHandling:
        'Do not concentrate, dilute, add juice/soda or add extra salt/sugar to commercial ORS.',
    monitoring:
        'Hydration status, urine output, thirst, mental status, ongoing stool/vomit losses and weight in high-risk patients.',
    interactions:
        'No major drug interactions; timing can be adapted around oral medicines.',
    specialPopulations:
        'Infants, elderly/frail patients and severe renal/cardiac disease may need closer fluid/electrolyte monitoring.',
    clinicalPearls:
        'ORS works because glucose and sodium are balanced—not because it is simply “salty water.”',
    commonMistakes:
        'Mixing one sachet in half the required water; replacing ORS with sports drinks.',
    source: 'WHO/UNICEF oral rehydration guidance',
  ),
  'psyllium': MedicationClinicalDetail(
    therapyDuration:
        'Can be used longer-term for fiber supplementation when appropriate, but persistent constipation still needs cause review.',
    exactAdministration:
        'Mix with the full recommended volume of liquid and drink immediately, followed by adequate fluid.',
    formulationHandling:
        'Powder, wafers/capsules and flavored products differ; never swallow dry powder.',
    monitoring:
        'Bowel response, bloating and swallowing difficulty.',
    interactions:
        'Can reduce absorption of selected oral medicines; separate according to interacting-drug guidance.',
    specialPopulations:
        'Avoid in dysphagia or suspected obstruction; fluid restriction complicates safe use.',
    clinicalPearls:
        'Start gradually to reduce bloating and improve adherence.',
    commonMistakes:
        'Taking with too little fluid or immediately before lying down.',
    source: 'MedlinePlus psyllium',
  ),
  'simethicone': MedicationClinicalDetail(
    therapyDuration:
        'Intermittent symptom relief; persistent/recurrent severe symptoms should prompt diagnosis review.',
    exactAdministration:
        'Product-specific after-meal/bedtime schedule; chew chewables thoroughly and measure liquids accurately.',
    formulationHandling:
        'Chewable tablets, capsules, drops and combination antacids are different products.',
    monitoring:
        'Symptom pattern rather than laboratory monitoring.',
    interactions:
        'Few systemic interactions because simethicone is minimally absorbed; combination products add their own interactions.',
    specialPopulations:
        'Infant drops require concentration/device verification.',
    clinicalPearls:
        'Gas symptoms can reflect constipation, lactose intolerance, IBS or obstruction—simethicone should not mask alarm features.',
    commonMistakes:
        'Using combination product without noticing added antacid or other active ingredients.',
    source: 'MedlinePlus simethicone',
  ),

  'enalapril': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for hypertension or heart failure; continue while indicated and tolerated.',
    exactAdministration:
        'Usually once or twice daily, with or without food, at consistent times.',
    formulationHandling:
        'Tablets and oral solution/concentrations differ. Use product-specific instructions for liquid measurement and storage.',
    monitoring:
        'Blood pressure, serum creatinine/eGFR and potassium after initiation/titration and when clinically indicated.',
    interactions:
        'Potassium supplements/salt substitutes, potassium-sparing diuretics, NSAIDs, lithium and dual RAAS blockade are important. A 36-hour washout is required when switching to/from sacubitril/valsartan.',
    specialPopulations:
        'Contraindicated in pregnancy. Prior ACE-inhibitor angioedema is a major safety concern; use caution with dehydration and renal artery stenosis.',
    clinicalPearls:
        'Dry cough can be adherence-limiting; confirm the cough is medication-related before abandoning evidence-based RAAS therapy.',
    commonMistakes:
        'Starting sacubitril/valsartan immediately after enalapril; adding potassium salt substitutes without review.',
    source: 'MedlinePlus / current enalapril labeling',
  ),
  'ramipril': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for hypertension, cardiovascular risk reduction or post-MI/heart-failure related indications.',
    exactAdministration:
        'Usually once or twice daily. May be taken with or without food; keep timing consistent.',
    formulationHandling:
        'Capsule contents may have product-specific opening/mixing instructions; do not generalize to every brand or tube route.',
    monitoring:
        'Blood pressure, renal function and potassium after initiation/titration and periodically when clinically indicated.',
    interactions:
        'Potassium-raising therapy, NSAIDs, lithium and other RAAS blockers require review; observe ACE-inhibitor/ARNI washout rules.',
    specialPopulations:
        'Avoid in pregnancy. Angioedema history, renal artery stenosis, volume depletion and advanced kidney disease need careful assessment.',
    clinicalPearls:
        'A normal office BP does not mean the medicine is no longer needed; it often indicates the regimen is working.',
    commonMistakes:
        'Stopping once BP is controlled; ignoring persistent dry cough or potassium-containing salt substitutes.',
    source: 'MedlinePlus / current ramipril labeling',
  ),
  'candesartan': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for hypertension or heart failure while effective and tolerated.',
    exactAdministration:
        'Once or twice daily depending on indication, with or without food.',
    formulationHandling:
        'Tablet; compounded liquid use requires a validated concentration and storage recipe.',
    monitoring:
        'Blood pressure, renal function and potassium after initiation/titration and when clinically indicated.',
    interactions:
        'NSAIDs, potassium supplements/salt substitutes, potassium-sparing diuretics and other RAAS blockers can increase renal/hyperkalemia risk.',
    specialPopulations:
        'Avoid in pregnancy. Extra caution with dehydration, bilateral renal artery stenosis and hyperkalemia.',
    clinicalPearls:
        'Heart-failure titration is indication-specific and should not be copied from a hypertension dose schedule.',
    commonMistakes:
        'Treating all ARB doses as equivalent or adding OTC potassium without review.',
    source: 'MedlinePlus / candesartan labeling',
  ),
  'bisoprolol': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for hypertension, rate control or heart failure depending on local indication and regimen.',
    exactAdministration:
        'Typically once daily, with or without food, at a consistent time.',
    formulationHandling:
        'Tablet strengths differ; splitting should follow the exact scored product and prescribed dose.',
    monitoring:
        'Heart rate, blood pressure, dizziness, fatigue and heart-failure symptoms during titration.',
    interactions:
        'Other rate-slowing drugs such as verapamil/diltiazem, digoxin and selected antiarrhythmics can increase bradycardia/conduction risk.',
    specialPopulations:
        'Asthma/COPD, diabetes, peripheral vascular disease and conduction disease require individualized review.',
    clinicalPearls:
        'Beta-1 selectivity is dose-dependent and does not eliminate bronchospasm risk entirely.',
    commonMistakes:
        'Abrupt discontinuation or assuming a slow pulse is harmless without symptoms/BP context.',
    source: 'Current bisoprolol labeling / beta-blocker guidance',
  ),
  'eplerenone': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for heart failure or selected hypertension patients while potassium/renal function remain acceptable.',
    exactAdministration:
        'Once or twice daily depending on indication; may be taken with or without food.',
    formulationHandling:
        'Tablet. Avoid improvised crushing/tube use without exact product verification.',
    monitoring:
        'Serum potassium and renal function are central safety monitoring, especially after initiation and dose changes.',
    interactions:
        'Strong CYP3A inhibitors may be contraindicated. ACEI/ARB/ARNI, potassium supplements, salt substitutes, trimethoprim and NSAIDs can increase hyperkalemia/renal risk.',
    specialPopulations:
        'Renal impairment and baseline hyperkalemia may preclude use or require tighter monitoring.',
    clinicalPearls:
        'Compared with spironolactone, endocrine adverse effects are less common, but hyperkalemia risk remains.',
    commonMistakes:
        'Adding potassium because the patient thinks every diuretic causes low potassium.',
    source: 'MedlinePlus / eplerenone labeling',
  ),
  'verapamil-er': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for hypertension, angina or selected rate-control indications.',
    exactAdministration:
        'Exact timing and food relationship depend on the specific extended-release product; use the brand/formulation instructions.',
    formulationHandling:
        'Multiple ER tablets/capsules are not interchangeable. Some can be opened and sprinkled while others must remain intact; never assume.',
    monitoring:
        'Heart rate, blood pressure, constipation, edema and conduction symptoms.',
    interactions:
        'Beta-blockers, digoxin and other AV-node blockers can cause marked bradycardia/heart block. Verapamil also has important CYP3A4/P-gp interactions.',
    specialPopulations:
        'Avoid/caution in significant conduction disease and many patients with reduced-ejection-fraction heart failure.',
    clinicalPearls:
        'Constipation is common enough to undermine adherence; ask about it proactively.',
    commonMistakes:
        'Switching between ER products by milligram dose alone or crushing a modified-release formulation.',
    source: 'MedlinePlus / verapamil product labeling',
  ),
  'isosorbide-mononitrate-er': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic prophylaxis for stable angina; it does not treat an acute angina episode.',
    exactAdministration:
        'Extended-release products are commonly taken once daily with a regimen that preserves a low-nitrate interval; follow exact label/prescription timing.',
    formulationHandling:
        'Do not crush or chew ER products. Splitting is product-specific and only appropriate when the exact tablet is scored/label-supported.',
    monitoring:
        'Angina frequency, blood pressure, dizziness, headache and adherence.',
    interactions:
        'PDE5 inhibitors (for example sildenafil/tadalafil/vardenafil) and riociguat are contraindicated because severe hypotension can occur.',
    specialPopulations:
        'Volume depletion, low blood pressure and severe aortic stenosis require individualized caution.',
    clinicalPearls:
        'Headache often improves with continued therapy; loss of effect can occur if a nitrate-free interval is not preserved.',
    commonMistakes:
        'Using ER nitrate for acute chest pain or taking PDE5 inhibitors without disclosing nitrate therapy.',
    source: 'MedlinePlus / isosorbide mononitrate labeling',
  ),
  'aspirin-low-dose': MedicationClinicalDetail(
    therapyDuration:
        'Often long-term for secondary cardiovascular/cerebrovascular prevention. Primary-prevention use should be individualized rather than routine.',
    exactAdministration:
        'Take the prescribed daily dose consistently. Food may reduce dyspepsia but does not remove bleeding risk.',
    formulationHandling:
        'Enteric-coated and chewable forms are not equivalent when rapid antiplatelet effect is needed. Do not crush enteric-coated tablets.',
    monitoring:
        'Bleeding, dyspepsia, anemia symptoms, renal function in high-risk patients and adherence after vascular events/stenting.',
    interactions:
        'Other NSAIDs, anticoagulants, antiplatelets, corticosteroids and alcohol can increase GI/bleeding risk. Ibuprofen timing may interfere with aspirin antiplatelet effect in some regimens.',
    specialPopulations:
        'Avoid in children/teens with viral illness because of Reye-syndrome risk. Asthma/nasal-polyp aspirin sensitivity requires caution.',
    clinicalPearls:
        '“Baby aspirin” is still a clinically active antiplatelet medicine, not a harmless supplement.',
    commonMistakes:
        'Stopping after a stent without specialist advice or taking multiple salicylate-containing OTC products.',
    source: 'MedlinePlus / antiplatelet guidance',
  ),
  'linagliptin': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for type 2 diabetes while effective and tolerated.',
    exactAdministration:
        'Once daily, with or without food, at a consistent time.',
    formulationHandling:
        'Tablet; combination products with metformin or SGLT2 inhibitors have different food/timing and renal considerations.',
    monitoring:
        'A1c/glucose, pancreatitis symptoms, severe joint pain, bullous pemphigoid and heart-failure symptoms in susceptible patients.',
    interactions:
        'Strong P-gp/CYP3A inducers can reduce exposure; insulin/sulfonylurea combinations increase hypoglycemia risk.',
    specialPopulations:
        'A major practical advantage is that routine renal dose adjustment is generally not required for linagliptin alone.',
    clinicalPearls:
        'Low hypoglycemia risk applies to monotherapy; combined with insulin/sulfonylurea, hypoglycemia can still occur.',
    commonMistakes:
        'Assuming combination tablets follow the same administration rules as linagliptin alone.',
    source: 'MedlinePlus / linagliptin labeling',
  ),
  'acarbose': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic if effective and tolerated, with dose titration limited by gastrointestinal effects.',
    exactAdministration:
        'Take with the first bite of each main meal. Skip the dose if the meal is skipped.',
    formulationHandling:
        'Tablet; dosing is meal-dependent rather than clock-dependent.',
    monitoring:
        'Postprandial glucose/A1c, GI tolerance and liver tests when clinically indicated at higher doses/prolonged therapy.',
    interactions:
        'Other glucose-lowering medicines can cause hypoglycemia; if hypoglycemia occurs, use glucose/dextrose rather than sucrose alone.',
    specialPopulations:
        'Avoid in inflammatory bowel disease, intestinal obstruction risk and significant digestive/absorption disorders according to labeling.',
    clinicalPearls:
        'The drug works in the gut during carbohydrate digestion, so timing with the first bite is the therapeutic mechanism.',
    commonMistakes:
        'Taking after finishing the meal or treating hypoglycemia with table sugar only.',
    source: 'MedlinePlus / acarbose labeling',
  ),
  'insulin-aspart': MedicationClinicalDetail(
    therapyDuration:
        'Chronic mealtime/correction insulin when indicated; requirements change with meals, illness, renal function and concurrent therapy.',
    exactAdministration:
        'Meal timing is product-specific and must follow the exact insulin-aspart formulation and prescription. Ensure food is available when required.',
    formulationHandling:
        'Vials, cartridges, pens and faster-acting formulations differ. Never substitute concentrations/devices without verification.',
    monitoring:
        'Glucose/CGM, hypoglycemia, carbohydrate intake, injection technique, lipohypertrophy and storage.',
    interactions:
        'Other glucose-lowering agents increase hypoglycemia risk; beta-blockers can mask adrenergic warning symptoms.',
    specialPopulations:
        'Renal/hepatic impairment and reduced oral intake may lower insulin requirements.',
    clinicalPearls:
        'Wrong-insulin and wrong-timing errors are major outpatient hazards; verify the label before every injection.',
    commonMistakes:
        'Injecting a rapid-acting dose and then delaying/skipping the meal.',
    source: 'MedlinePlus / insulin aspart product IFU',
  ),
  'insulin-nph': MedicationClinicalDetail(
    therapyDuration:
        'Chronic intermediate-acting insulin therapy when used as part of the patient’s insulin regimen.',
    exactAdministration:
        'Timing is individualized to the prescribed regimen and meal/sleep pattern; do not auto-schedule without the actual insulin plan.',
    formulationHandling:
        'NPH is cloudy suspension. Gently roll/invert per product instructions until uniformly cloudy; do not vigorously shake. Mixing with selected rapid/short insulins is protocol-specific and order of drawing matters.',
    monitoring:
        'Glucose patterns, hypoglycemia around peak activity, injection sites and storage.',
    interactions:
        'Other glucose-lowering drugs increase hypoglycemia risk; corticosteroids and illness may raise insulin needs.',
    specialPopulations:
        'Renal/hepatic impairment, irregular eating and older age increase hypoglycemia risk.',
    clinicalPearls:
        'NPH has a noticeable peak compared with many basal analogs; meal/snack planning can matter.',
    commonMistakes:
        'Using a clear-insulin technique without resuspending NPH or mixing with insulin glargine.',
    source: 'NPH insulin product labeling / diabetes injection guidance',
  ),
  'methimazole': MedicationClinicalDetail(
    therapyDuration:
        'Often used for many months and sometimes years depending on Graves disease strategy, remission and definitive-treatment plan.',
    exactAdministration:
        'Take at consistent times; may be given once or divided depending on dose and thyroid status.',
    formulationHandling:
        'Tablet; compounded liquid requires validated preparation/storage when used.',
    monitoring:
        'Thyroid function during dose adjustment; CBC when agranulocytosis symptoms occur; liver injury symptoms/labs when clinically indicated.',
    interactions:
        'Anticoagulant requirements can change as thyroid status normalizes; review iodine-containing products and other thyroid therapies.',
    specialPopulations:
        'Pregnancy trimester matters because antithyroid-drug choice can differ. Liver disease and prior severe reaction need specialist review.',
    clinicalPearls:
        'Routine CBC cannot reliably predict agranulocytosis; symptom-triggered urgent testing for fever/sore throat is crucial.',
    commonMistakes:
        'Continuing through fever/severe sore throat without contacting the clinician or changing dose without thyroid labs.',
    source: 'MedlinePlus / methimazole labeling',
  ),
  'beclomethasone-inhaled': MedicationClinicalDetail(
    therapyDuration:
        'Long-term controller therapy while asthma remains an indication; step-down only after sustained control and clinical review.',
    exactAdministration:
        'Usually inhaled once or twice daily depending on exact product. Use every day, not only when symptomatic, and rinse mouth/spit afterward.',
    formulationHandling:
        'Products differ in device, priming, breath actuation and spacer compatibility. Technique must be demonstrated for the exact inhaler.',
    monitoring:
        'Symptoms, exacerbations, rescue use, adherence, inhaler technique, oral candidiasis/dysphonia and pediatric growth when relevant.',
    interactions:
        'Strong CYP3A4 inhibitors may increase systemic corticosteroid exposure.',
    specialPopulations:
        'Choose device based on inspiratory ability, coordination and age; a spacer may be appropriate only for compatible pMDI products.',
    clinicalPearls:
        'Poor technique can mimic treatment failure; reassess technique before escalating therapy.',
    commonMistakes:
        'Using as rescue treatment or failing to rinse/spit after dosing.',
    source: 'MedlinePlus / beclomethasone inhaler IFU',
  ),
  'salmeterol-dpi': MedicationClinicalDetail(
    therapyDuration:
        'Long-term bronchodilator maintenance therapy when indicated; not an acute-relief drug.',
    exactAdministration:
        'Usually one inhalation twice daily about 12 hours apart. Exhale away from the DPI and inhale deeply through the device.',
    formulationHandling:
        'Dry-powder device only; do not use a spacer and do not wash the powder device with water unless the IFU specifically directs it.',
    monitoring:
        'Symptoms, exacerbations, rescue-inhaler use and adherence/technique.',
    interactions:
        'Avoid duplicate LABA therapy. Strong CYP3A4 inhibitors and other sympathomimetics may increase adverse effects.',
    specialPopulations:
        'For asthma, LABA must be used with an inhaled corticosteroid; LABA monotherapy is unsafe.',
    clinicalPearls:
        'A patient may feel rapid bronchodilation and mistakenly use salmeterol as rescue—explicitly distinguish controller from reliever.',
    commonMistakes:
        'Using for sudden attacks or exhaling into the DPI.',
    source: 'MedlinePlus / salmeterol device labeling',
  ),
  'salbutamol-nebulizer': MedicationClinicalDetail(
    therapyDuration:
        'Reliever treatment used intermittently or on a short scheduled plan during exacerbation. Frequent ongoing need signals poor control.',
    exactAdministration:
        'Use the exact prescribed nebule/concentration in a compatible nebulizer, sit upright and continue until treatment is complete.',
    formulationHandling:
        'Unit-dose and multidose concentrates differ. Do not mix with another nebulized drug unless compatibility is established.',
    monitoring:
        'Clinical response, rescue frequency, tremor, tachycardia and potassium in high-dose/repeated hospital use when relevant.',
    interactions:
        'Other sympathomimetics and nonselective beta-blockers can cause clinically important effects.',
    specialPopulations:
        'Children need a well-fitted mask or mouthpiece; infection-control and device cleaning are part of safe use.',
    clinicalPearls:
        'Nebulizer delivery is not automatically “stronger” than a correctly used pMDI plus spacer.',
    commonMistakes:
        'Mixing nebules without compatibility data or using a poorly fitting mask.',
    source: 'MedlinePlus / albuterol nebulizer labeling',
  ),
  'cefixime': MedicationClinicalDetail(
    therapyDuration:
        'Short, infection-specific antibiotic course; duration depends on site and guideline.',
    exactAdministration:
        'Usually once or twice daily, with or without food. Keep doses evenly spaced.',
    formulationHandling:
        'Tablet, capsule, chewable and suspension are not always interchangeable. Verify strength and formulation.',
    monitoring:
        'Clinical response, allergy, severe diarrhea and renal function for dose adjustment.',
    interactions:
        'Warfarin/INR changes and carbamazepine concentration changes have been reported and may require review.',
    specialPopulations:
        'Renal impairment requires dosing adjustment. Clarify severe immediate beta-lactam allergy history.',
    clinicalPearls:
        'Chewable/tablet substitution can alter bioavailability in some products; prescribe/dispense the intended formulation.',
    commonMistakes:
        'Changing suspension/capsule form without checking equivalence.',
    source: 'MedlinePlus / cefixime labeling',
  ),
  'cefuroxime-axetil': MedicationClinicalDetail(
    therapyDuration:
        'Short fixed antibiotic course based on indication.',
    exactAdministration:
        'Tablet absorption is improved after food. Suspension has different administration characteristics; follow exact product labeling.',
    formulationHandling:
        'Tablets and suspension are not bioequivalent milligram-for-milligram in all contexts and should not be casually substituted.',
    monitoring:
        'Clinical response, allergy, severe diarrhea and renal function for adjustment.',
    interactions:
        'Acid-suppressing agents may reduce bioavailability of the axetil prodrug; warfarin/INR changes can occur.',
    specialPopulations:
        'Renal impairment and severe beta-lactam allergy require individualized review.',
    clinicalPearls:
        'The formulation difference is clinically meaningful; “same cefuroxime mg” does not guarantee equivalent exposure.',
    commonMistakes:
        'Switching tablet to suspension without a verified conversion.',
    source: 'MedlinePlus / cefuroxime axetil labeling',
  ),
  'clarithromycin': MedicationClinicalDetail(
    therapyDuration:
        'Course is infection-specific; H. pylori treatment is a multidrug regimen rather than clarithromycin monotherapy.',
    exactAdministration:
        'Immediate-release products may be with or without food; extended-release is generally taken with food and must be swallowed whole.',
    formulationHandling:
        'IR tablet, ER tablet and suspension differ in frequency/food instructions. Shake suspension and store exactly as labeled.',
    monitoring:
        'Clinical response, QT risk, liver symptoms and interaction-related toxicity.',
    interactions:
        'Strong CYP3A4 inhibition creates major interactions with certain statins, calcium-channel blockers, colchicine and many other drugs.',
    specialPopulations:
        'QT prolongation, bradycardia, electrolyte abnormalities and severe liver/renal disease increase risk.',
    clinicalPearls:
        'A medication-interaction check is mandatory before dispensing clarithromycin to a polypharmacy patient.',
    commonMistakes:
        'Dispensing ER and giving IR instructions or missing a contraindicated statin combination.',
    source: 'MedlinePlus / clarithromycin labeling',
  ),
  'levofloxacin-oral': MedicationClinicalDetail(
    therapyDuration:
        'Fixed course according to infection; use should be reserved for appropriate indications because serious class toxicities exist.',
    exactAdministration:
        'Tablet generally with or without food; oral solution may have fasting instructions. Separate polyvalent cations according to label.',
    formulationHandling:
        'Tablet and oral solution are not counseled identically; verify formulation before giving food instructions.',
    monitoring:
        'Renal function, tendon symptoms, peripheral neuropathy, CNS effects, glucose disturbances and QT risk.',
    interactions:
        'Antacids/iron/zinc/calcium, warfarin, QT-risk medicines and glucose-lowering therapy require review.',
    specialPopulations:
        'Older adults, corticosteroid users, transplant recipients and patients with aneurysm risk warrant extra caution.',
    clinicalPearls:
        'New tendon pain or neuropathic symptoms should not be treated as “normal antibiotic side effects.”',
    commonMistakes:
        'Taking with mineral supplements or continuing despite tendon/neurologic symptoms.',
    source: 'MedlinePlus / FDA fluoroquinolone warnings',
  ),
  'oseltamivir': MedicationClinicalDetail(
    therapyDuration:
        'Treatment is generally a short course; prophylaxis duration differs and may be extended in outbreak settings.',
    exactAdministration:
        'With or without food; food may reduce nausea. Start as early as possible for best benefit.',
    formulationHandling:
        'Capsule and suspension differ. Suspension concentration and pharmacy-compounded alternatives require exact verification.',
    monitoring:
        'Clinical influenza course, GI tolerance and unusual neuropsychiatric symptoms when they occur.',
    interactions:
        'Few major routine drug interactions; live attenuated intranasal influenza vaccine timing may be affected by antivirals.',
    specialPopulations:
        'Renal impairment requires dose adjustment. Very young infants and severely ill patients use age/severity-specific guidance.',
    clinicalPearls:
        'Do not delay therapy in high-risk severe influenza solely while waiting for test confirmation when guidelines support empiric treatment.',
    commonMistakes:
        'Using the same schedule for treatment and prophylaxis.',
    source: 'MedlinePlus / oseltamivir labeling',
  ),
  'linezolid-oral': MedicationClinicalDetail(
    therapyDuration:
        'Course duration depends on infection; prolonged therapy increases hematologic and neuropathic toxicity risk.',
    exactAdministration:
        'Tablet/suspension can generally be taken with or without food at evenly spaced times.',
    formulationHandling:
        'Oral suspension should be gently mixed as labeled rather than vigorously shaken when manufacturer instructions specify inversion.',
    monitoring:
        'CBC during prolonged/high-risk therapy; vision/neuropathy with longer courses; lactate if unexplained acidosis symptoms.',
    interactions:
        'Reversible MAOI activity makes serotonergic drugs, sympathomimetics and high-tyramine exposure important.',
    specialPopulations:
        'Renal impairment can increase metabolite exposure; thrombocytopenia risk may be higher in severe renal dysfunction.',
    clinicalPearls:
        'Medication reconciliation for antidepressants/decongestants is as important as the antibiotic dose.',
    commonMistakes:
        'Ignoring serotonergic interaction risk or continuing prolonged therapy without CBC monitoring.',
    source: 'MedlinePlus / linezolid labeling',
  ),
  'fluoxetine': MedicationClinicalDetail(
    therapyDuration:
        'Continue for months after response; recurrent depression/OCD may require long-term therapy.',
    exactAdministration:
        'Often once daily; morning may reduce insomnia if activating. Weekly formulations have separate instructions.',
    formulationHandling:
        'Capsules, tablets, solution and delayed-release weekly product are not interchangeable without a regimen plan.',
    monitoring:
        'Mood/suicidality, activation, sexual effects, sodium in high-risk patients and bleeding risk with NSAIDs/anticoagulants.',
    interactions:
        'Long half-life and CYP2D6 inhibition create prolonged interaction potential. MAOI washout is especially important.',
    specialPopulations:
        'Hepatic impairment and older age may warrant lower/less frequent dosing.',
    clinicalPearls:
        'Because fluoxetine clears slowly, interaction/withdrawal behavior differs from short half-life SSRIs.',
    commonMistakes:
        'Switching directly to an MAOI without sufficient washout.',
    source: 'MedlinePlus / fluoxetine labeling',
  ),
  'venlafaxine-xr': MedicationClinicalDetail(
    therapyDuration:
        'Usually continued for an adequate maintenance period after response; recurrent disorders may require long-term therapy.',
    exactAdministration:
        'XR is generally once daily with food, at the same time each day.',
    formulationHandling:
        'Do not crush or chew ER pellets/tablets. Some capsules can be opened and sprinkled only if exact product labeling permits.',
    monitoring:
        'Mood/suicidality, blood pressure, withdrawal symptoms, sodium and sexual adverse effects.',
    interactions:
        'MAOIs and other serotonergic drugs are important; NSAIDs/anticoagulants increase bleeding risk.',
    specialPopulations:
        'Renal/hepatic impairment may require dose reduction.',
    clinicalPearls:
        'Discontinuation symptoms can be prominent because of relatively short effective half-life; taper thoughtfully.',
    commonMistakes:
        'Abruptly stopping or taking XR without food when the product directs food.',
    source: 'MedlinePlus / venlafaxine labeling',
  ),
  'amitriptyline': MedicationClinicalDetail(
    therapyDuration:
        'Duration depends on depression versus off-label neuropathic pain/migraine use; chronic use should be periodically reassessed.',
    exactAdministration:
        'Often administered at bedtime because of sedation, especially for pain/migraine regimens.',
    formulationHandling:
        'Tablet/liquid products differ. Avoid improvised tube/crush use without verification for exact formulation.',
    monitoring:
        'Sedation, orthostatic hypotension, anticholinergic burden, falls and cardiac/QT risk.',
    interactions:
        'MAOIs, serotonergic drugs, alcohol/CNS depressants and anticholinergic medicines are important.',
    specialPopulations:
        'Older adults, cardiac disease, glaucoma, urinary retention and overdose risk require extra caution.',
    clinicalPearls:
        'Low doses used for neuropathic pain can still produce substantial anticholinergic burden.',
    commonMistakes:
        'Escalating because pain persists after a few nights or combining with multiple sedating OTC products.',
    source: 'MedlinePlus / amitriptyline labeling',
  ),
  'quetiapine': MedicationClinicalDetail(
    therapyDuration:
        'Often chronic for bipolar disorder/schizophrenia; duration for adjunctive depression depends on response and indication.',
    exactAdministration:
        'IR and XR use different schedules. XR is generally once daily and has food-specific instructions; verify exact product.',
    formulationHandling:
        'XR tablets must be swallowed whole; do not split/crush/chew.',
    monitoring:
        'Weight/BMI, glucose/A1c, lipids, orthostatic BP, sedation and movement symptoms.',
    interactions:
        'Strong CYP3A4 inhibitors/inducers can markedly alter exposure; other CNS depressants increase sedation.',
    specialPopulations:
        'Elderly dementia-related psychosis carries boxed mortality warning; falls and QT risk deserve attention.',
    clinicalPearls:
        'Sedation can occur at low doses even when antipsychotic efficacy would require higher exposure.',
    commonMistakes:
        'Using IR and XR interchangeably or crushing XR.',
    source: 'MedlinePlus / quetiapine labeling',
  ),
  'olanzapine': MedicationClinicalDetail(
    therapyDuration:
        'Usually chronic for schizophrenia/bipolar maintenance when effective; acute regimens may transition to maintenance.',
    exactAdministration:
        'Usually once daily, with or without food. ODT handling differs from standard tablets.',
    formulationHandling:
        'Standard tablet, ODT and long-acting injectable are distinct; LAI requires special post-injection observation protocol.',
    monitoring:
        'Weight/BMI, waist, glucose/A1c, lipids, sedation, orthostasis and movement symptoms.',
    interactions:
        'Smoking status can alter olanzapine metabolism; CNS depressants and selected CYP1A2 modifiers matter.',
    specialPopulations:
        'High metabolic-risk patients require proactive alternative/monitoring discussion.',
    clinicalPearls:
        'Smoking cessation can increase olanzapine concentrations; ask about smoking changes.',
    commonMistakes:
        'Failing to monitor metabolic parameters or assuming ODT avoids systemic adverse effects.',
    source: 'MedlinePlus / olanzapine labeling',
  ),
  'risperidone': MedicationClinicalDetail(
    therapyDuration:
        'Often chronic for schizophrenia/bipolar disorder; indication determines duration and formulation.',
    exactAdministration:
        'Once or twice daily depending on regimen. ODT, solution and long-acting injection have separate instructions.',
    formulationHandling:
        'Oral solution should not be mixed with some beverages according to label; LAI products have different oral-overlap/loading requirements.',
    monitoring:
        'Weight/metabolic parameters, prolactin effects, movement symptoms, sedation and orthostasis.',
    interactions:
        'Strong CYP2D6 inhibitors can increase active-moiety exposure; CNS depressants add sedation.',
    specialPopulations:
        'Renal/hepatic impairment may require lower doses. Dementia-related psychosis carries increased mortality warning.',
    clinicalPearls:
        'Hyperprolactinemia can present as menstrual changes, galactorrhea, sexual dysfunction or bone-health issues.',
    commonMistakes:
        'Ignoring prolactin symptoms or assuming all long-acting risperidone products use the same initiation protocol.',
    source: 'MedlinePlus / risperidone labeling',
  ),
  'clonazepam': MedicationClinicalDetail(
    therapyDuration:
        'Short- to long-term depending on seizure versus panic indication, but ongoing need, dependence and tolerance should be regularly reassessed.',
    exactAdministration:
        'Usually divided once to several times daily according to indication; take consistently.',
    formulationHandling:
        'Tablet and ODT formulations differ; ODT should be handled with dry hands as directed.',
    monitoring:
        'Sedation, falls, cognition, respiratory depression and signs of dependence/misuse.',
    interactions:
        'Opioids, alcohol and other CNS depressants can produce profound sedation/respiratory depression.',
    specialPopulations:
        'Older adults, sleep apnea, respiratory disease and hepatic impairment require caution.',
    clinicalPearls:
        'Withdrawal after regular use can include seizures even in patients taking it for anxiety.',
    commonMistakes:
        'Abrupt cessation or combining with alcohol/opioids without recognizing respiratory risk.',
    source: 'MedlinePlus / clonazepam boxed warnings',
  ),
  'tramadol': MedicationClinicalDetail(
    therapyDuration:
        'Use the shortest appropriate duration for acute pain; chronic use requires explicit functional-benefit and dependence-risk review.',
    exactAdministration:
        'IR and ER schedules differ. Use exact prescribed interval; do not exceed total daily limit.',
    formulationHandling:
        'ER tablets/capsules must not be crushed, chewed or dissolved because dose dumping can occur.',
    monitoring:
        'Analgesic benefit, sedation, respiratory depression, constipation, misuse, seizures and serotonin-syndrome symptoms.',
    interactions:
        'SSRIs/SNRIs/TCAs/MAOIs and other serotonergic drugs increase serotonin/seizure risk; opioids/benzodiazepines/alcohol increase respiratory depression.',
    specialPopulations:
        'Renal/hepatic impairment and older age require dose/interval adjustment; pediatric restrictions are important.',
    clinicalPearls:
        'Tramadol is not simply a “weak opioid”; its serotonergic and seizure liabilities are clinically significant.',
    commonMistakes:
        'Crushing ER formulation or combining with multiple serotonergic/sedating medicines without review.',
    source: 'MedlinePlus / FDA tramadol labeling',
  ),
  'meloxicam': MedicationClinicalDetail(
    therapyDuration:
        'Use the lowest effective dose for the shortest appropriate duration; chronic arthritis therapy requires periodic risk review.',
    exactAdministration:
        'Usually once daily. May be taken with food if GI upset occurs.',
    formulationHandling:
        'Tablet, capsule and oral suspension differ; measure suspension accurately and follow product-specific substitution rules.',
    monitoring:
        'GI bleeding, blood pressure, renal function, edema and cardiovascular symptoms.',
    interactions:
        'Other NSAIDs, anticoagulants/antiplatelets, ACEI/ARB/diuretics and lithium are important.',
    specialPopulations:
        'CKD, ulcer/GI bleed history, cardiovascular disease, dehydration and pregnancy require caution.',
    clinicalPearls:
        'Once-daily dosing can lead patients to assume it is safer than ibuprofen; systemic NSAID risks remain.',
    commonMistakes:
        'Adding OTC ibuprofen/naproxen on top of meloxicam.',
    source: 'MedlinePlus / meloxicam labeling',
  ),
  'edoxaban': MedicationClinicalDetail(
    therapyDuration:
        'Indication-specific: often long-term for atrial fibrillation; VTE treatment may be finite or extended.',
    exactAdministration:
        'Usually once daily, with or without food.',
    formulationHandling:
        'Tablet; crushing/tube administration should follow exact label conditions when needed.',
    monitoring:
        'Renal function, bleeding, adherence and peri-procedure interruption plan.',
    interactions:
        'P-gp inducers/inhibitors and concomitant antiplatelets/NSAIDs may be important.',
    specialPopulations:
        'For nonvalvular atrial fibrillation, very high creatinine clearance has a unique label limitation because efficacy may be reduced.',
    clinicalPearls:
        'Unlike most renally cleared drugs, “better” renal function can be a problem for edoxaban in AF.',
    commonMistakes:
        'Ignoring creatinine-clearance upper limit or stopping abruptly.',
    source: 'FDA / edoxaban labeling',
  ),
  'tacrolimus-topical': MedicationClinicalDetail(
    therapyDuration:
        'Used intermittently/short term or as maintenance strategy for atopic dermatitis; avoid continuous use on unaffected skin.',
    exactAdministration:
        'Apply a thin layer to affected skin, usually twice daily initially. Wash hands after use unless hands are the treated area.',
    formulationHandling:
        'Ointment strengths are age/indication-specific. Do not occlude unless directed.',
    monitoring:
        'Local burning/stinging, infection, lymphadenopathy and treatment response.',
    interactions:
        'Systemic interactions are limited with appropriate topical use; avoid excessive UV exposure and consider other immunosuppressive therapy.',
    specialPopulations:
        'Age restrictions and immunocompromised states require product/guideline review.',
    clinicalPearls:
        'Early burning is common and often improves within days; warning patients improves persistence.',
    commonMistakes:
        'Using on active untreated skin infection or applying thickly under occlusion.',
    source: 'MedlinePlus / tacrolimus ointment labeling',
  ),
  'clobetasol-topical': MedicationClinicalDetail(
    therapyDuration:
        'Super-potent topical corticosteroid intended for short courses on appropriate body sites; chronic continuous use is generally avoided.',
    exactAdministration:
        'Apply a very thin layer to affected skin at the prescribed frequency; total weekly quantity and body-surface area matter.',
    formulationHandling:
        'Cream, ointment, lotion, foam, shampoo and solution differ in site/frequency. Do not interchange instructions.',
    monitoring:
        'Skin atrophy, striae, infection, HPA-axis suppression risk with large areas/occlusion and treatment response.',
    interactions:
        'Systemic drug interactions are uncommon with limited use, but concurrent potent topical/systemic steroids increase steroid burden.',
    specialPopulations:
        'Face, groin, axilla, children and large body areas require extra caution.',
    clinicalPearls:
        'Fingertip-unit teaching is more practical than “apply sparingly.”',
    commonMistakes:
        'Using for weeks on the face or continuing after inflammation has resolved.',
    source: 'MedlinePlus / clobetasol topical labeling',
  ),
  'adapalene': MedicationClinicalDetail(
    therapyDuration:
        'Long-term acne maintenance is common if effective; improvement usually takes several weeks.',
    exactAdministration:
        'Apply a thin layer once daily, typically in the evening, to the entire acne-prone area after gentle cleansing/drying.',
    formulationHandling:
        'Gel, cream and lotion strengths differ; use only a small amount and avoid eyes/lips/mucosa.',
    monitoring:
        'Irritation, dryness and adherence; assess severe dermatitis or worsening that does not settle.',
    interactions:
        'Other drying/irritating products, peeling agents and waxing can worsen skin irritation.',
    specialPopulations:
        'Pregnancy planning should be discussed even though systemic absorption is low; follow current local guidance.',
    clinicalPearls:
        'Treating only visible pimples underuses a comedolytic retinoid; prevention requires treating the acne-prone field.',
    commonMistakes:
        'Applying too much, using as spot treatment only or combining with harsh scrubs.',
    source: 'MedlinePlus / adapalene labeling',
  ),
  'mupirocin-topical': MedicationClinicalDetail(
    therapyDuration:
        'Short, defined course for susceptible superficial bacterial skin infection; avoid indefinite prophylactic use.',
    exactAdministration:
        'Apply a small amount to affected skin at the prescribed frequency; cover only if directed.',
    formulationHandling:
        'Skin ointment/cream and intranasal formulations are not interchangeable.',
    monitoring:
        'Local irritation, spreading infection and clinical improvement within expected interval.',
    interactions:
        'Few systemic interactions; avoid mixing with other topical products on the same site unless directed.',
    specialPopulations:
        'Large open wounds or extensive burns may require a different product/vehicle and medical assessment.',
    clinicalPearls:
        'Repeated empiric mupirocin promotes resistance; confirm the condition is bacterial rather than eczema/fungal disease.',
    commonMistakes:
        'Using skin product intranasally or for every minor rash.',
    source: 'MedlinePlus / mupirocin labeling',
  ),
  'etanercept': MedicationClinicalDetail(
    therapyDuration:
        'Long-term biologic therapy while effective and tolerated; schedule varies by indication/age.',
    exactAdministration:
        'Subcutaneous injection at the prescribed interval; rotate injection sites.',
    formulationHandling:
        'Prefilled syringe, autoinjector and vial products have different preparation steps. Refrigerate, protect from light, do not freeze, and follow product-specific room-temperature rules.',
    monitoring:
        'TB/infection screening, clinical response, hepatitis B context, neurologic/heart-failure symptoms and malignancy/skin surveillance.',
    interactions:
        'Avoid combining with certain biologic immunosuppressants because serious infection risk increases; live-vaccine decisions require review.',
    specialPopulations:
        'Heart failure, demyelinating disease and recurrent serious infections require individualized risk assessment.',
    clinicalPearls:
        'Do not assume every TNF inhibitor uses the same loading schedule—etanercept differs from adalimumab/infliximab.',
    commonMistakes:
        'Injecting while frozen/cold without IFU guidance or continuing through a serious active infection without contacting the clinician.',
    source: 'MedlinePlus / etanercept IFU',
  ),
  'clotrimazole-vaginal': MedicationClinicalDetail(
    therapyDuration:
        'One-, three-, seven- or longer-day regimens exist depending on formulation/strength and patient factors.',
    exactAdministration:
        'Usually inserted at bedtime using the product applicator; complete the full course even if symptoms improve.',
    formulationHandling:
        'Cream, tablet/suppository and external cream have different instructions. Do not swallow vaginal products.',
    monitoring:
        'Symptom resolution; recurrent, severe or atypical symptoms should prompt diagnostic review.',
    interactions:
        'Some formulations can weaken latex condoms/diaphragms temporarily; check exact product information.',
    specialPopulations:
        'Pregnancy, first episode, recurrent vulvovaginal symptoms, fever/pelvic pain or foul-smelling discharge warrant clinician input.',
    clinicalPearls:
        'Repeated OTC treatment without confirmed diagnosis can miss bacterial vaginosis, STI or resistant/non-albicans Candida.',
    commonMistakes:
        'Stopping after one night because itching improved or using external cream alone for internal infection.',
    source: 'MedlinePlus / clotrimazole vaginal labeling',
  ),
  'artificial-tears': MedicationClinicalDetail(
    therapyDuration:
        'As-needed or regular long-term lubrication depending on dry-eye severity; persistent symptoms should prompt cause review.',
    exactAdministration:
        'Instill one drop as needed without touching bottle tip. Separate from medicated eye drops by an appropriate interval.',
    formulationHandling:
        'Preserved multidose, preservative-free single-use, gel and ointment products differ in frequency, contamination risk and visual blur.',
    monitoring:
        'Comfort, frequency of use and red-flag symptoms such as pain, photophobia or vision change.',
    interactions:
        'Few systemic interactions; local sequencing with other ophthalmic products matters.',
    specialPopulations:
        'Very frequent use or ocular-surface disease may favor preservative-free products.',
    clinicalPearls:
        'Ointments provide longer lubrication but blur vision and are often better at bedtime.',
    commonMistakes:
        'Reusing single-dose vials against product instructions or assuming severe red eye is just dryness.',
    source: 'Dry-eye guidance / product labeling',
  ),
  'moxifloxacin-ophthalmic': MedicationClinicalDetail(
    therapyDuration:
        'Short course for susceptible bacterial eye infection; regimen depends on exact product/indication.',
    exactAdministration:
        'Instill drops at prescribed intervals without touching tip. Complete course unless clinician reassesses.',
    formulationHandling:
        'Ophthalmic product only; do not substitute oral/IV or other topical formulations.',
    monitoring:
        'Improvement in redness/discharge, pain, photophobia and vision.',
    interactions:
        'Few systemic interactions at ophthalmic exposure; separate other eye products to avoid washout.',
    specialPopulations:
        'Contact lenses should not be worn during active bacterial conjunctivitis.',
    clinicalPearls:
        'Eye pain/photophobia/vision loss is a referral sign rather than routine conjunctivitis.',
    commonMistakes:
        'Stopping after one day or touching dropper tip to lashes/eye.',
    source: 'Moxifloxacin ophthalmic product labeling',
  ),
  'amoxicillin-pediatric-suspension': MedicationClinicalDetail(
    therapyDuration:
        'Short infection-specific course; duration should be tied to diagnosis/guideline rather than a default number of days.',
    exactAdministration:
        'Calculate/verify dose in mg first, then convert using the exact mg/5 mL concentration. Shake well before every dose.',
    formulationHandling:
        'Multiple suspension concentrations exist and reconstituted storage/beyond-use can vary by product/manufacturer.',
    monitoring:
        'Clinical response, allergy, diarrhea and renal function when relevant.',
    interactions:
        'Allopurinol, warfarin/INR and methotrexate can be clinically relevant.',
    specialPopulations:
        'Caregiver health literacy and ability to use an oral syringe are central to safety.',
    clinicalPearls:
        'A prescription that says only “5 mL” is unsafe to transfer to another bottle strength.',
    commonMistakes:
        'Using household spoon, failing to shake, or copying mL from an old prescription.',
    source: 'MedlinePlus / amoxicillin suspension labeling',
  ),
  'bismuth-subsalicylate': MedicationClinicalDetail(
    therapyDuration:
        'Short-term self-care for diarrhea/dyspepsia. Persistent symptoms beyond label limits require evaluation.',
    exactAdministration:
        'Use the product-specific dose after loose stools or as labeled; shake suspension and measure accurately.',
    formulationHandling:
        'Liquid and chewable/tablet strengths differ; note total salicylate exposure from other products.',
    monitoring:
        'Hydration, stool frequency, fever/blood in stool and salicylate toxicity risk with overuse.',
    interactions:
        'Anticoagulants, aspirin/other salicylates, methotrexate and gout medicines can be clinically relevant.',
    specialPopulations:
        'Avoid in children/teens recovering from viral illness because of Reye syndrome risk and use caution with salicylate allergy.',
    clinicalPearls:
        'Harmless black tongue/stool is common, but true melena in a bleeding-risk patient still needs assessment.',
    commonMistakes:
        'Using in bloody febrile diarrhea or combining with aspirin without recognizing duplicate salicylate exposure.',
    source: 'MedlinePlus / bismuth subsalicylate labeling',
  ),
};
