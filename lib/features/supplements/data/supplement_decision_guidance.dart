class SupplementDecisionGuidance {
  const SupplementDecisionGuidance({
    required this.labPlan,
    required this.useCheckpoint,
    required this.interactionLock,
    required this.safetyLock,
    required this.source,
  });

  final String labPlan;
  final String useCheckpoint;
  final String interactionLock;
  final String safetyLock;
  final String source;
}

const supplementDecisionGuidance = <String, SupplementDecisionGuidance>{
  'vitamin-d3': SupplementDecisionGuidance(
    labPlan:
        'Routine low-risk maintenance supplementation does not automatically require a 25-hydroxyvitamin D level. Testing is more useful when deficiency is suspected, malabsorption is present, symptoms/risk are significant, or higher-dose treatment is being monitored.',
    useCheckpoint:
        'Separate routine maintenance from treatment of confirmed/suspected deficiency; do not let the calculator choose a treatment regimen without the clinical context and product strength.',
    interactionLock:
        'Review duplicate vitamin D, calcium, thiazides and conditions that raise hypercalcemia risk when doses are high or prolonged.',
    safetyLock:
        'High-dose chronic use should not be treated as routine wellness supplementation. Verify IU versus mcg and total intake across all products.',
    source: 'NIH ODS · Vitamin D',
  ),
  'oral-iron-salts': SupplementDecisionGuidance(
    labPlan:
        'For treatment rather than routine prevention, CBC and ferritin are commonly relevant, with additional iron studies/cause assessment according to the case. Do not continue therapeutic iron indefinitely without confirming why it is needed and whether it is working.',
    useCheckpoint:
        'Confirm elemental iron per dose, the indication, expected duration and whether blood loss, malabsorption or pregnancy changes the plan.',
    interactionLock:
        'Calcium/antacids reduce absorption; several antibiotics and levothyroxine also require separation according to their product guidance.',
    safetyLock:
        'Iron overdose can be dangerous, especially in children. Keep products secured and avoid duplicate iron-containing combinations.',
    source: 'NIH ODS · Iron + MedlinePlus',
  ),
  'calcium-carbonate': SupplementDecisionGuidance(
    labPlan:
        'Serum calcium is not a routine test of dietary calcium adequacy. Laboratory monitoring becomes more relevant with CKD, parathyroid disorders, hypercalcemia risk, high-dose therapy or clinically significant symptoms.',
    useCheckpoint:
        'Counsel by elemental calcium and total daily intake from diet plus supplements. Carbonate should be taken with food and is not interchangeable with citrate counseling.',
    interactionLock:
        'Separate when required from levothyroxine, bisphosphonates, iron and selected antibiotics.',
    safetyLock:
        'Large single elemental-calcium doses are not ideal; commonly divide doses so each is about 500 mg elemental calcium or less.',
    source: 'NIH ODS · Calcium',
  ),
  'calcium-citrate': SupplementDecisionGuidance(
    labPlan:
        'Routine serum calcium does not measure calcium intake. Test/monitor when kidney, parathyroid or hypercalcemia risk makes it clinically relevant.',
    useCheckpoint:
        'Verify elemental calcium. Citrate can be taken with or without food and is less dependent on gastric acid than carbonate.',
    interactionLock:
        'Review levothyroxine, bisphosphonates, iron and selected antibiotics for separation.',
    safetyLock:
        'Avoid duplicate calcium across supplements/antacids and divide larger daily elemental-calcium amounts.',
    source: 'NIH ODS · Calcium',
  ),
  'magnesium-gluconate': SupplementDecisionGuidance(
    labPlan:
        'Serum magnesium is useful when deficiency/toxicity is clinically suspected, but a normal serum value does not always exclude low total-body stores. Renal function matters before substantial or prolonged supplementation.',
    useCheckpoint:
        'Counsel by elemental magnesium rather than salt weight. Keep the exact salt visible because tolerability and absorption differ.',
    interactionLock:
        'Magnesium can reduce absorption of bisphosphonates and some antibiotics and can interfere with levothyroxine absorption.',
    safetyLock:
        'Supplemental magnesium commonly causes diarrhea; accumulation/toxicity risk rises with significant renal impairment.',
    source: 'NIH ODS · Magnesium + MedlinePlus magnesium gluconate',
  ),
  'magnesium-citrate': SupplementDecisionGuidance(
    labPlan:
        'Check clinical indication and renal function when use is more than short-term routine supplementation. Serum magnesium is appropriate when deficiency or toxicity is suspected.',
    useCheckpoint:
        'Distinguish a magnesium supplement from magnesium-citrate laxative products; the intended elemental-magnesium dose and directions are not the same.',
    interactionLock:
        'Separate from interacting antibiotics, bisphosphonates and levothyroxine according to the affected medicine guidance.',
    safetyLock:
        'Citrate is relatively well absorbed but can loosen stools; kidney impairment increases risk of magnesium accumulation.',
    source: 'NIH ODS · Magnesium',
  ),
  'magnesium-oxide': SupplementDecisionGuidance(
    labPlan:
        'Routine low-dose use does not automatically require a level, but renal function and magnesium testing matter when deficiency treatment, toxicity risk or prolonged substantial dosing is involved.',
    useCheckpoint:
        'Magnesium oxide contains a large fraction of elemental magnesium by weight but is less bioavailable than several more soluble salts; do not compare products by total salt milligrams.',
    interactionLock:
        'Separate from interacting antibiotics, bisphosphonates and levothyroxine.',
    safetyLock:
        'GI effects, especially diarrhea, can limit use. Do not treat antacid/laxative dosing as a routine supplement schedule.',
    source: 'NIH ODS · Magnesium',
  ),
  'zinc': SupplementDecisionGuidance(
    labPlan:
        'Routine zinc testing is not needed for every supplement user. Consider targeted assessment when deficiency is plausible or prolonged high-dose use raises concern for copper deficiency.',
    useCheckpoint:
        'Use elemental zinc from the Supplement Facts label, not the total salt weight.',
    interactionLock:
        'Quinolone/tetracycline antibiotics require separation; high-dose iron taken at the same time can also reduce zinc absorption.',
    safetyLock:
        'Chronic high-dose zinc can cause copper deficiency and other harms. Avoid stacking multiple zinc-containing products.',
    source: 'NIH ODS · Zinc',
  ),
  'vitamin-b12': SupplementDecisionGuidance(
    labPlan:
        'CBC and serum B12 are commonly useful when deficiency is suspected; methylmalonic acid can help when results are borderline or the clinical picture is discordant.',
    useCheckpoint:
        'Clarify why B12 is needed and whether malabsorption, pernicious anemia, gastric surgery, metformin or long-term acid suppression affects route/dose.',
    interactionLock:
        'The key issue is often the underlying cause or route rather than a clock-time interaction.',
    safetyLock:
        'Do not assume an oral wellness product is sufficient for every malabsorption condition; route and treatment intensity may need clinician-directed therapy.',
    source: 'NIH ODS · Vitamin B12',
  ),
  'folic-acid': SupplementDecisionGuidance(
    labPlan:
        'When macrocytosis, anemia or neurologic symptoms are present, evaluate vitamin B12 status as appropriate rather than giving prolonged high-dose folic acid blindly.',
    useCheckpoint:
        'Check prenatal/multivitamin duplication and distinguish folic acid amount from total folate/DFE labeling.',
    interactionLock:
        'Review methotrexate/antifolate therapy and specialist plans before adding high-dose folic acid.',
    safetyLock:
        'High folic-acid intake can correct anemia while allowing B12-related neurologic injury to progress if B12 deficiency is missed.',
    source: 'NIH ODS · Folate',
  ),
  'vitamin-c': SupplementDecisionGuidance(
    labPlan:
        'Routine vitamin C levels are not needed for typical supplementation. Testing is reserved for selected clinical deficiency questions.',
    useCheckpoint:
        'Assess diet, indication and total dose rather than assuming higher intake is more beneficial.',
    interactionLock:
        'Vitamin C increases nonheme iron absorption; this can be useful with oral iron but deserves caution when iron overload is a concern.',
    safetyLock:
        'High supplemental doses commonly cause GI upset; review kidney-stone history and iron-overload disorders before prolonged high-dose use.',
    source: 'NIH ODS · Vitamin C',
  ),
  'vitamin-a': SupplementDecisionGuidance(
    labPlan:
        'Routine serum vitamin A testing is not required for wellness use; targeted assessment belongs to suspected deficiency/malabsorption or specialist care.',
    useCheckpoint:
        'Distinguish preformed vitamin A (retinol/retinyl esters) from beta-carotene and count all sources including cod-liver products and multivitamins.',
    interactionLock:
        'Review retinoid medicines and other vitamin-A sources to avoid additive exposure.',
    safetyLock:
        'Avoid casual high-dose preformed vitamin A, especially in pregnancy and liver disease.',
    source: 'NIH ODS · Vitamin A and Carotenoids',
  ),
  'vitamin-e': SupplementDecisionGuidance(
    labPlan:
        'Routine vitamin E testing is not needed for most users; deficiency testing is generally reserved for selected malabsorption or neurologic contexts.',
    useCheckpoint:
        'Clarify whether use is nutritional replacement or high-dose self-treatment; evidence and risk are different.',
    interactionLock:
        'High-dose vitamin E can increase bleeding concern with anticoagulant/antiplatelet therapy.',
    safetyLock:
        'Do not present high-dose chronic vitamin E as universally harmless.',
    source: 'NIH ODS · Vitamin E',
  ),
  'vitamin-k': SupplementDecisionGuidance(
    labPlan:
        'For patients on warfarin, INR response—not a routine vitamin K level—is the clinically useful monitoring tool when vitamin K intake changes.',
    useCheckpoint:
        'Consistency matters more than eliminating all vitamin K from the diet.',
    interactionLock:
        'Warfarin is the key interaction; a new supplement or major dietary vitamin K change can alter anticoagulation.',
    safetyLock:
        'Do not start/stop vitamin K supplements abruptly in a stable warfarin patient without an anticoagulation plan.',
    source: 'NIH ODS · Vitamin K',
  ),
  'iodine': SupplementDecisionGuidance(
    labPlan:
        'Routine iodine blood testing is not a standard wellness screen. Thyroid testing becomes relevant when thyroid disease/symptoms or excessive iodine exposure are concerns.',
    useCheckpoint:
        'Check prenatal/multivitamin duplication and the iodine amount/form. Seaweed/kelp products can be highly variable.',
    interactionLock:
        'Thyroid disease and antithyroid medicines require individualized review before extra iodine.',
    safetyLock:
        'Both deficiency and excess can disturb thyroid function; avoid high-dose kelp/iodine products without a clear indication.',
    source: 'NIH ODS · Iodine',
  ),
  'selenium': SupplementDecisionGuidance(
    labPlan:
        'Routine selenium testing is not needed for typical low-risk use; targeted testing belongs to selected deficiency/toxicity or malabsorption situations.',
    useCheckpoint:
        'Count selenium from multivitamins and stand-alone products; the safety margin is narrower than many patients assume.',
    interactionLock:
        'Review concurrent high-dose antioxidant products and oncology/specialist plans before adding large doses.',
    safetyLock:
        'Excess selenium can cause hair/nail changes, GI symptoms and neurologic complaints; avoid chronic high doses.',
    source: 'NIH ODS · Selenium',
  ),
  'pediatric-vitamin-d': SupplementDecisionGuidance(
    labPlan:
        'Routine prophylactic infant vitamin D does not automatically require a level. Testing is more relevant with suspected deficiency, malabsorption, bone disease, major risk factors or treatment dosing.',
    useCheckpoint:
        'Verify IU per drop or mL every time; infant drop products can differ dramatically in concentration.',
    interactionLock:
        'Review duplicate vitamin D from formula, combination drops and other products.',
    safetyLock:
        'Never transfer “number of drops” from one brand/concentration to another.',
    source: 'CDC + NIH ODS · Vitamin D',
  ),
  'pediatric-iron': SupplementDecisionGuidance(
    labPlan:
        'Need is feeding-pattern and risk based. Screening for anemia/iron deficiency is age- and risk-dependent; treatment should have a follow-up plan rather than indefinite dosing.',
    useCheckpoint:
        'Confirm gestational age, feeding pattern, formula iron content, complementary foods and elemental iron concentration.',
    interactionLock:
        'Calcium-containing feeds/products and selected medicines can reduce absorption; product-specific timing may be needed.',
    safetyLock:
        'Iron overdose is dangerous. Use a measured oral syringe/dropper and keep the bottle secured.',
    source: 'CDC + pediatric iron guidance',
  ),
  'multivitamin-mineral': SupplementDecisionGuidance(
    labPlan:
        'A multivitamin does not create a need for broad routine laboratory testing. Testing should be driven by specific symptoms, risks or suspected deficiencies.',
    useCheckpoint:
        'Read the full ingredient panel and compare it with all stand-alone supplements before recommending.',
    interactionLock:
        'Iron, calcium, magnesium, vitamin K and other ingredients can each create different medication interactions.',
    safetyLock:
        'The main risk is duplication and hidden high-dose ingredients; “one tablet” is not one active ingredient.',
    source: 'Ingredient-level NIH ODS fact sheets',
  ),
  'prenatal-combination': SupplementDecisionGuidance(
    labPlan:
        'Prenatal laboratory assessment is driven by obstetric care and individual risk. Iron status/anemia and thyroid context may matter more than a generic “vitamin panel.”',
    useCheckpoint:
        'Check folate/folic acid, iron, iodine, vitamin D and vitamin A form in the exact product; prenatal products are not interchangeable.',
    interactionLock:
        'Iron/calcium can interfere with levothyroxine and some medicines; choose timing after reviewing the ingredient panel.',
    safetyLock:
        'Avoid stacking high-dose preformed vitamin A or duplicate iron/folic acid/iodine without a clear reason.',
    source: 'NIH ODS · Folate, Iron, Iodine, Vitamin D, Vitamin A',
  ),
  'growth-amino-acid-blends': SupplementDecisionGuidance(
    labPlan:
        'Do not order a generic “growth supplement panel.” Evaluate growth trajectory, diet and clinical red flags; targeted tests belong to the suspected cause.',
    useCheckpoint:
        'Identify every ingredient and amount before judging the product. Growth marketing is not evidence of benefit.',
    interactionLock:
        'Multi-ingredient products can contain minerals, stimulants, herbs or amino acids that interact with medicines.',
    safetyLock:
        'Do not present these products as substitutes for evaluation of poor growth or as equivalent to growth-hormone therapy.',
    source: 'Product-specific evidence review required',
  ),
  'high-risk-weight-loss-supplements': SupplementDecisionGuidance(
    labPlan:
        'No routine lab plan should be generated until the exact ingredients and product legitimacy are established.',
    useCheckpoint:
        'Verify every ingredient and current regulatory status before discussing administration.',
    interactionLock:
        'Stimulants, undeclared drugs and multi-ingredient blends can interact with cardiovascular, psychiatric and metabolic medicines.',
    safetyLock:
        'Safety gate: do not generate a routine how-to-use recommendation for an unverified weight-loss product.',
    source: 'FDA safety/regulatory review + product-specific evidence',
  ),
  'potassium-supplements': SupplementDecisionGuidance(
    labPlan:
        'Serum potassium and renal function are central when potassium is used therapeutically or in anyone at risk of hyperkalemia. Recheck after clinically important dose/medicine changes according to the care plan.',
    useCheckpoint:
        'Distinguish food potassium, OTC dietary supplements, prescription potassium salts and potassium-containing salt substitutes; they are not interchangeable.',
    interactionLock:
        'ACE inhibitors, ARBs, ARNIs, spironolactone/eplerenone and significant kidney disease can raise potassium. Salt substitutes may also contain substantial potassium.',
    safetyLock:
        'Do not recommend routine potassium supplementation solely for “energy” or cramps without establishing need and hyperkalemia risk.',
    source: 'NIH ODS · Potassium',
  ),
  'omega-3': SupplementDecisionGuidance(
    labPlan:
        'Routine omega-3 blood testing is not required for general supplementation. For severe hypertriglyceridemia, use the prescription/lipid-management plan rather than substituting a dietary supplement.',
    useCheckpoint:
        'Check the label for actual EPA + DHA per serving; “fish oil 1000 mg” is not the same as 1000 mg EPA+DHA.',
    interactionLock:
        'Review anticoagulants/antiplatelets and high-dose therapy. Prescription omega-3 products are not interchangeable with generic fish-oil supplements.',
    safetyLock:
        'High-dose long-term omega-3 therapy is a clinical treatment decision; trials using 4 g/day have reported a small increase in atrial fibrillation in higher-risk patients.',
    source: 'NIH ODS · Omega-3 Fatty Acids',
  ),
  'biotin': SupplementDecisionGuidance(
    labPlan:
        'Biotin deficiency testing is rarely a routine wellness test. The more important practical issue is laboratory-assay interference.',
    useCheckpoint:
        'Ask why the patient is using biotin and how much; many hair/nail products use doses far above nutritional requirements.',
    interactionLock:
        'Biotin can interfere with certain laboratory assays. Tell the laboratory/clinician about biotin use before testing; the needed interruption interval depends on dose and the specific assay/laboratory instructions.',
    safetyLock:
        'Do not give a universal “stop biotin for X hours” rule because assay susceptibility differs. False test results can be clinically important, including some troponin assays.',
    source: 'FDA · Biotin interference with laboratory tests + NIH ODS · Biotin',
  ),
  'vitamin-b6': SupplementDecisionGuidance(
    labPlan:
        'Routine B6 testing is not required for typical low-dose use. Consider targeted evaluation when deficiency or toxicity/neuropathy is suspected.',
    useCheckpoint:
        'Add up pyridoxine/B6 from B-complex, magnesium-combination, energy and stand-alone products before counseling.',
    interactionLock:
        'Review specialist-directed use and medicines that affect B6; do not assume high-dose B-complex products are harmless.',
    safetyLock:
        'Chronic high supplemental B6 can cause sensory neuropathy. In the U.S. Dietary Reference Intake framework the adult UL is 100 mg/day, while some authorities use lower limits.',
    source: 'NIH ODS · Vitamin B6',
  ),
  'calcium': SupplementDecisionGuidance(
    labPlan:
        'Serum calcium does not measure dietary calcium adequacy. Laboratory monitoring is most relevant with CKD, parathyroid disease, hypercalcemia risk, nephrolithiasis risk or therapeutic calcium replacement.',
    useCheckpoint:
        'Calculate TOTAL elemental calcium from diet, supplements and antacids. Choose carbonate versus citrate based on acid dependence, GI tolerance and pill burden.',
    interactionLock:
        'Calcium can reduce absorption of levothyroxine, bisphosphonates, iron and selected antibiotics; use the interacting medicine’s exact separation interval.',
    safetyLock:
        'Avoid duplicate calcium products and large single supplemental doses; calcium absorption is highest at about 500 mg elemental calcium or less at one time.',
    source: 'NIH ODS · Calcium',
  ),
  'magnesium': SupplementDecisionGuidance(
    labPlan:
        'Assess renal function before substantial/prolonged supplementation. Serum magnesium is useful when deficiency or toxicity is suspected, although a normal serum value does not always exclude low body stores.',
    useCheckpoint:
        'Counsel by elemental magnesium and distinguish supplement use from magnesium-containing laxative/antacid products.',
    interactionLock:
        'Magnesium can reduce absorption of tetracyclines, fluoroquinolones, bisphosphonates and levothyroxine; apply product-specific separation.',
    safetyLock:
        'Diarrhea is dose/form dependent; significant renal impairment raises the risk of magnesium accumulation and toxicity.',
    source: 'NIH ODS · Magnesium',
  ),
  'copper': SupplementDecisionGuidance(
    labPlan:
        'Targeted copper/ceruloplasmin and hematologic assessment is appropriate when deficiency or toxicity is suspected; routine wellness testing is not required.',
    useCheckpoint:
        'Look for the cause of deficiency, especially malabsorption or chronic high-dose zinc use.',
    interactionLock:
        'High zinc intake can impair copper absorption; review duplicated mineral products.',
    safetyLock:
        'Avoid unsupervised high-dose copper, especially in disorders of copper handling.',
    source: 'NIH ODS · Copper',
  ),
  'chromium': SupplementDecisionGuidance(
    labPlan:
        'Routine chromium testing is not a standard wellness assessment. In diabetes, follow glucose/A1C rather than chromium levels.',
    useCheckpoint:
        'Do not substitute chromium supplements for evidence-based diabetes or weight-management treatment.',
    interactionLock:
        'Review glucose-lowering therapy because supplement claims may prompt unsafe self-adjustment of medicines.',
    safetyLock:
        'Avoid high-dose or prolonged use without a clear rationale; benefit for weight loss or major glucose reduction is inconsistent.',
    source: 'NIH ODS · Chromium',
  ),
  'manganese': SupplementDecisionGuidance(
    labPlan:
        'Routine manganese testing is not indicated for typical supplementation; specialist assessment is appropriate for suspected deficiency or toxicity.',
    useCheckpoint:
        'Most people obtain adequate manganese from food; stand-alone supplementation is rarely necessary.',
    interactionLock:
        'Review total intake from multivitamin/mineral products and occupational/environmental exposure.',
    safetyLock:
        'Chronic excessive manganese exposure can cause neurologic toxicity.',
    source: 'NIH ODS · Manganese',
  ),
  'phosphorus': SupplementDecisionGuidance(
    labPlan:
        'Therapeutic phosphate replacement requires serum phosphate plus calcium and renal assessment, with attention to sodium/potassium carried by the salt.',
    useCheckpoint:
        'Routine dietary phosphorus supplementation is rarely needed; prescription phosphate replacement is a separate clinical treatment.',
    interactionLock:
        'The sodium or potassium load of phosphate salts can materially change safety.',
    safetyLock:
        'CKD frequently calls for phosphate restriction rather than supplementation.',
    source: 'NIH ODS · Phosphorus',
  ),
  'vitamin-b1-thiamin': SupplementDecisionGuidance(
    labPlan:
        'Routine levels are not required for typical supplementation; suspected severe deficiency or Wernicke risk requires clinical assessment and treatment.',
    useCheckpoint:
        'Separate routine nutritional supplementation from treatment of high-risk deficiency states.',
    interactionLock:
        'The main issue is clinical context rather than clock-time separation.',
    safetyLock:
        'Do not manage suspected Wernicke encephalopathy with an OTC multivitamin dose.',
    source: 'NIH ODS · Thiamin',
  ),
  'vitamin-b2-riboflavin': SupplementDecisionGuidance(
    labPlan:
        'Routine laboratory testing is not needed for typical low-risk supplementation.',
    useCheckpoint:
        'Clarify whether the goal is basic nutrition or an indication-specific higher-dose regimen such as migraine prevention.',
    interactionLock:
        'No major routine timing separation is required for nutritional doses.',
    safetyLock:
        'Bright-yellow urine is expected and harmless; avoid unnecessary duplication across B-complex products.',
    source: 'NIH ODS · Riboflavin',
  ),
  'vitamin-b3-niacin': SupplementDecisionGuidance(
    labPlan:
        'High-dose nicotinic-acid therapy may require liver enzymes, glucose and uric acid monitoring; nutritional doses do not.',
    useCheckpoint:
        'Distinguish nicotinic acid from niacinamide and nutritional from pharmacologic dosing.',
    interactionLock:
        'Review statins, glucose-lowering therapy and other hepatotoxic exposures when pharmacologic niacin is used.',
    safetyLock:
        'High-dose niacin is not a routine supplement; flushing, hepatotoxicity and metabolic effects become clinically important.',
    source: 'NIH ODS · Niacin',
  ),
  'vitamin-b5-pantothenic-acid': SupplementDecisionGuidance(
    labPlan:
        'Routine testing is not needed; deficiency is rare.',
    useCheckpoint:
        'Check duplication across B-complex and multivitamin products before recommending a stand-alone high dose.',
    interactionLock:
        'No major routine medication-separation rule at nutritional doses.',
    safetyLock:
        'Do not extrapolate essential-vitamin status into proof for high-dose acne or energy claims.',
    source: 'NIH ODS · Pantothenic Acid',
  ),
  'choline': SupplementDecisionGuidance(
    labPlan:
        'Routine blood choline testing is not a standard wellness test.',
    useCheckpoint:
        'Assess dietary intake plus supplements, especially in pregnancy when requirements increase.',
    interactionLock:
        'Check prenatal/multivitamin labels because choline content varies widely.',
    safetyLock:
        'Dose from actual choline content, not choline-bitartrate compound weight.',
    source: 'NIH ODS · Choline',
  ),
  'creatine-monohydrate': SupplementDecisionGuidance(
    labPlan:
        'Routine CK or creatinine monitoring is not required in every healthy user, but kidney disease or unexplained renal dysfunction warrants clinical review.',
    useCheckpoint:
        'Use a reputable creatine-monohydrate product and set realistic performance expectations.',
    interactionLock:
        'Review nephrotoxic medicines/conditions when kidney safety is a concern.',
    safetyLock:
        'A rise in serum creatinine can occur from creatine metabolism and must be interpreted clinically rather than automatically labeled kidney injury.',
    source: 'Evidence-based sports nutrition consensus',
  ),
  'melatonin': SupplementDecisionGuidance(
    labPlan:
        'Routine laboratory monitoring is not required. Persistent insomnia needs evaluation for an underlying cause.',
    useCheckpoint:
        'Timing must match the sleep/circadian goal; bedtime is not a universal rule for circadian-shift treatment.',
    interactionLock:
        'Review sedatives and clinically important anticoagulant/other interactions.',
    safetyLock:
        'Avoid indefinite dose escalation, driving while impaired, and unsupervised long-term pediatric use.',
    source: 'NCCIH · Melatonin',
  ),
  'probiotics': SupplementDecisionGuidance(
    labPlan:
        'Routine laboratory monitoring is not required for most users.',
    useCheckpoint:
        'Match the exact genus/species/strain and CFU to evidence for the intended condition; “probiotic” is not one interchangeable active ingredient.',
    interactionLock:
        'Review severe immunocompromise, central lines and critical illness before use.',
    safetyLock:
        'Rare invasive infections have occurred in high-risk hosts; avoid generic reassurance in critically ill/immunocompromised patients.',
    source: 'NCCIH · Probiotics + strain-specific evidence',
  ),
  'coenzyme-q10': SupplementDecisionGuidance(
    labPlan:
        'No routine CoQ10 level is needed.',
    useCheckpoint:
        'Use only for a defined goal; evidence varies substantially by indication.',
    interactionLock:
        'Review warfarin and blood-pressure therapy.',
    safetyLock:
        'Do not present CoQ10 as a universally necessary adjunct to statins or cardiovascular therapy.',
    source: 'NCCIH · Coenzyme Q10',
  ),

};

SupplementDecisionGuidance? supplementDecisionFor(String id) =>
    supplementDecisionGuidance[id];
