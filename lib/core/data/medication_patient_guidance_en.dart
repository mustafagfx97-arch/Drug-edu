part 'medication_patient_guidance_en_expanded.dart';

class EnglishPatientCounseling {
  const EnglishPatientCounseling({
    required this.purpose,
    required this.howToUse,
    required this.timing,
    required this.duration,
    required this.important,
    required this.missedDose,
    required this.seekHelp,
    required this.teachBack,
    this.commonActionable = '',
    this.storage = '',
  });

  final String purpose;
  final String howToUse;
  final String timing;
  final String duration;
  final String important;
  final String commonActionable;
  final String missedDose;
  final String storage;
  final String seekHelp;
  final String teachBack;

  List<EnglishPatientCounselingItem> get items {
    final result = <EnglishPatientCounselingItem>[];

    void add(String title, String body) {
      if (body.trim().isNotEmpty) {
        result.add(
          EnglishPatientCounselingItem(
            title: title,
            body: body.trim(),
          ),
        );
      }
    }

    add('Why am I using it?', purpose);
    add('How do I use it?', howToUse);
    add('When do I use it?', timing);
    add('How long do I use it?', duration);
    add('Important', important);
    add('A common problem you may notice', commonActionable);
    add('If I miss a dose', missedDose);
    add('Storage', storage);
    add('When should I get help?', seekHelp);

    return result;
  }
}

class EnglishPatientCounselingItem {
  const EnglishPatientCounselingItem({
    required this.title,
    required this.body,
  });

  final String title;
  final String body;
}

/// First reviewed English counseling batch.
///
/// English is intentionally opt-in per medication: the UI only exposes the
/// English view when a complete record exists here. There is no automatic
/// machine-translation fallback for clinical instructions.
const englishPatientCounseling = <String, EnglishPatientCounseling>{
  'paracetamol': EnglishPatientCounseling(
    purpose: 'Relieves pain and reduces fever.',
    howToUse:
        'Use the dose written for you and check every cold, flu, pain or combination product for acetaminophen/paracetamol so you do not accidentally take it twice.',
    timing:
        'Use only at the interval on your prescription or product label. If you are using it only when needed, do not take extra doses just to keep a schedule.',
    duration:
        'Use for the shortest period needed for the problem unless your clinician has given you a longer plan.',
    important:
        'Too much acetaminophen/paracetamol can seriously injure the liver. Count the total from every product.',
    commonActionable:
        'It is usually well tolerated at the correct dose. If you need it frequently for persistent pain or fever, the cause should be reviewed.',
    missedDose:
        'If it is an as-needed medicine, there is no missed dose. If it is scheduled, skip a late dose when the next dose is close. Do not double.',
    seekHelp:
        'If you took more than the recommended amount, get medical help or poison-center advice immediately even if you feel well.',
    teachBack:
        'Show me the other pain/cold medicines you use. Which ones also contain acetaminophen or paracetamol?',
  ),
  'ibuprofen': EnglishPatientCounseling(
    purpose: 'Relieves pain, inflammation and fever.',
    howToUse:
        'Take the prescribed or labeled dose. Take it with food or milk if it upsets your stomach, and avoid adding another NSAID such as naproxen or diclofenac unless a clinician specifically told you to.',
    timing:
        'Use the spacing on your prescription or label. Do not take doses closer together because the pain returns early.',
    duration:
        'For self-care, use the shortest effective course. Persistent or worsening pain or fever needs assessment rather than prolonged self-treatment.',
    important:
        'NSAIDs can cause stomach bleeding and can worsen kidney function, especially with dehydration, kidney disease or certain blood-pressure medicines.',
    commonActionable:
        'Indigestion or stomach discomfort can occur. Food may improve stomach tolerance but does not remove the bleeding or kidney risk.',
    missedDose:
        'If it is as needed, there is no missed dose. If it is scheduled, skip a late dose when the next one is close. Do not double or add another NSAID.',
    seekHelp:
        'Get urgent help for vomiting blood, black/tarry stools, severe allergic swelling or breathing trouble. Seek review for marked swelling or very low urine output.',
    teachBack:
        'Which other pain medicines are you taking, and are any of them NSAIDs?',
  ),
  'omeprazole': EnglishPatientCounseling(
    purpose: 'Reduces stomach acid for reflux, ulcers or another acid-related condition.',
    howToUse:
        'Use the exact delayed-release product as directed. Do not crush delayed-release granules or tablets unless your specific product instructions explicitly allow a method.',
    timing:
        'It is commonly taken before a meal. Follow the timing for your exact formulation and regimen.',
    duration:
        'Some courses are short and some conditions need long-term treatment. Long-term use should have a continuing reason and periodic review.',
    important:
        'Do not keep treating new alarm symptoms as simple heartburn.',
    commonActionable:
        'Headache, abdominal discomfort or bowel changes can occur. If symptoms do not improve as expected, reassess the diagnosis and use.',
    missedDose:
        'Take it when you remember unless the next dose is close. If it is close, skip the missed dose. Do not double.',
    seekHelp:
        'Seek medical review for painful or difficult swallowing, vomiting blood, black stools, unexplained weight loss or chest pain.',
    teachBack:
        'When will you take it in relation to food, and will you crush your delayed-release product?',
  ),
  'metformin': EnglishPatientCounseling(
    purpose: 'Helps lower blood glucose and improve diabetes control.',
    howToUse:
        'Take it exactly as prescribed. Immediate-release and extended-release products have different schedules and handling; do not crush an extended-release tablet.',
    timing:
        'Take with meals as directed for your formulation to improve stomach tolerance.',
    duration:
        'Usually long term while it remains appropriate and effective.',
    important:
        'Kidney function matters. Severe dehydration or serious illness can change whether it is safe to continue temporarily.',
    commonActionable:
        'Nausea, loose stools and stomach upset are common at first and often improve. Taking it with food and gradual titration can help when prescribed that way.',
    missedDose:
        'Take the next dose at the usual time if the missed dose is close to the next one. Do not double.',
    seekHelp:
        'Get medical advice during severe illness with persistent vomiting/dehydration. Seek urgent care for severe weakness, unusual sleepiness or trouble breathing, especially if kidney function may have worsened.',
    teachBack:
        'Is your metformin immediate-release or extended-release, and which meal will you take it with?',
  ),
  'insulin-glargine': EnglishPatientCounseling(
    purpose: 'Provides long-acting background insulin to control blood glucose between meals and overnight.',
    howToUse:
        'Inject the exact insulin-glargine product and dose prescribed for you. Use a new needle as instructed, rotate injection sites and never share a pen.',
    timing:
        'Use it at the time specified for your product and diabetes plan, usually at a consistent time. It is not meal-time insulin.',
    duration:
        'Usually long term. Do not stop basal insulin without a diabetes plan.',
    important:
        'Check the product name and strength every time. Do not mix, dilute or change between glargine products on your own.',
    commonActionable:
        'Low blood sugar is the most important common risk. Carry a fast source of glucose and know your treatment plan.',
    missedDose:
        'Do not double basal insulin or give two doses close together. Check your glucose and follow the missed-dose plan for your exact product, or contact your diabetes team.',
    storage:
        'Storage after first use differs by brand/device. Follow the exact pen or vial label and do not freeze insulin.',
    seekHelp:
        'Get urgent help for severe low blood sugar with unconsciousness or seizure, or for very high glucose with vomiting, ketones or abnormal breathing.',
    teachBack:
        'Show me which insulin is your long-acting insulin, its strength, and what you will do if you miss the usual time.',
  ),
  'insulin-lispro': EnglishPatientCounseling(
    purpose: 'Rapidly lowers the rise in blood glucose around meals.',
    howToUse:
        'Inject the exact product and dose prescribed for the meal or correction. Confirm the insulin name and strength before every injection.',
    timing:
        'Use it in the meal-time window specified for your product and plan. Do not inject and then unexpectedly skip or substantially delay the meal unless your diabetes plan tells you what to do.',
    duration:
        'Usually long term when meal-time insulin remains part of the diabetes plan.',
    important:
        'Meal timing, carbohydrate intake and the dose are linked. Dose changes should follow your diabetes plan rather than guesswork.',
    commonActionable:
        'Low blood sugar can cause sweating, shaking, hunger, confusion or palpitations. Treat promptly using your hypoglycemia plan.',
    missedDose:
        'Do not automatically take a full meal dose long after the meal or double the next dose. Check glucose and follow your correction/missed-meal plan.',
    storage:
        'Follow the exact pen/vial storage and in-use expiration instructions. Do not freeze.',
    seekHelp:
        'Get urgent help for severe low blood sugar, unconsciousness or seizure, or for persistent severe hyperglycemia with ketones/vomiting.',
    teachBack:
        'When in relation to your meal will you use this insulin, and what will you do if the meal is delayed?',
  ),
  'glimepiride': EnglishPatientCounseling(
    purpose: 'Helps the pancreas release insulin to lower blood glucose.',
    howToUse:
        'Take the prescribed dose with breakfast or your first main meal of the day unless your prescriber gave different instructions.',
    timing:
        'Link the dose to the first main meal. Taking it and then skipping the meal can increase the risk of low blood sugar.',
    duration:
        'Usually long term while it remains appropriate and effective.',
    important:
        'Low blood sugar is the main counseling issue, especially with missed meals, alcohol, kidney problems or other glucose-lowering medicines.',
    commonActionable:
        'Know the symptoms of low blood sugar and carry a fast source of glucose.',
    missedDose:
        'Do not take an extra dose on an empty stomach to make up for a missed meal-time dose. Do not double the next dose.',
    seekHelp:
        'Get urgent help for severe hypoglycemia with unconsciousness or seizure; use glucagon if it has been prescribed and your caregiver knows how.',
    teachBack:
        'Which meal will you take glimepiride with, and how will you treat a low blood sugar?',
  ),
  'empagliflozin': EnglishPatientCounseling(
    purpose: 'Lowers blood glucose by increasing glucose loss in the urine and may provide heart or kidney benefits in selected patients.',
    howToUse:
        'Take it once daily as prescribed and stay appropriately hydrated. Follow your sick-day plan when you are acutely ill or unable to eat/drink normally.',
    timing:
        'Take at a consistent time each day. Food is not usually required.',
    duration:
        'Usually long term when used for diabetes, heart failure or kidney protection.',
    important:
        'It can cause genital yeast infections and dehydration. Rarely, ketoacidosis can occur even when blood glucose is not extremely high.',
    commonActionable:
        'You may urinate more. Maintain appropriate fluids unless you have a fluid restriction and report troublesome dizziness or recurrent infections.',
    missedDose:
        'Take it when you remember unless the next dose is close; then skip it. Do not double.',
    seekHelp:
        'Stop and get urgent medical assessment for nausea/vomiting, abdominal pain, unusual tiredness or rapid/deep breathing, especially during illness or fasting.',
    teachBack:
        'What symptoms would make you stop this medicine and seek help for possible ketoacidosis?',
  ),
  'levothyroxine': EnglishPatientCounseling(
    purpose: 'Replaces thyroid hormone when your body does not make enough.',
    howToUse:
        'Take it consistently with water. Keep the same product and routine when possible because absorption changes can affect your thyroid level.',
    timing:
        'A common routine is on an empty stomach 30–60 minutes before breakfast. Separate calcium and iron by at least 4 hours; follow your prescriber if using a consistent bedtime regimen instead.',
    duration:
        'Often lifelong when treating permanent hypothyroidism, with dose adjustment based on thyroid tests.',
    important:
        'Do not change the dose because of day-to-day symptoms. Thyroid tests guide dose changes.',
    commonActionable:
        'Too much replacement may cause palpitations, tremor, sweating or insomnia; too little may leave hypothyroid symptoms.',
    missedDose:
        'Follow your clinician/pharmacist plan for a missed dose and do not repeatedly double doses without guidance.',
    seekHelp:
        'Seek urgent care for severe chest pain, fainting or a sustained rapid/irregular heartbeat.',
    teachBack:
        'When will you take levothyroxine, and how far apart will you keep calcium or iron?',
  ),
  'warfarin': EnglishPatientCounseling(
    purpose: 'Prevents or treats harmful blood clots.',
    howToUse:
        'Take exactly the dose on your current anticoagulation plan. Your dose can change based on INR results.',
    timing:
        'Take it at a consistent time each day so dose changes can be made safely. Keep vitamin K intake reasonably consistent rather than suddenly avoiding or loading it.',
    duration:
        'Duration depends on why you need anticoagulation; some patients need a defined course and others long-term therapy.',
    important:
        'Many prescription medicines, antibiotics, pain medicines, alcohol changes and supplements can change bleeding or INR. Check before starting or stopping products.',
    commonActionable:
        'Easy bruising or minor bleeding can occur, but increasing or persistent bleeding requires review.',
    missedDose:
        'If you remember later the same day, take the missed dose. If you do not remember until the next day, skip it and record the missed dose. Do not double.',
    seekHelp:
        'Get urgent help for major bleeding, vomiting/coughing blood, black stools, severe unexplained headache, head injury or stroke symptoms.',
    teachBack:
        'What will you do if you remember a missed warfarin dose the next day, and what test is used to monitor it?',
  ),
  'apixaban': EnglishPatientCounseling(
    purpose: 'Prevents or treats blood clots and reduces stroke risk in selected patients.',
    howToUse:
        'Take the prescribed dose twice daily. Do not stop it without a plan because clot risk can rise when anticoagulation is interrupted.',
    timing:
        'Take doses about 12 hours apart at consistent times. It can generally be taken with or without food.',
    duration:
        'Duration depends on the indication and your clot/bleeding risk.',
    important:
        'Tell clinicians and dentists that you take apixaban. Check before adding NSAIDs such as ibuprofen/naproxen or supplements that may increase bleeding.',
    commonActionable:
        'Bruising or minor bleeding can occur. Persistent or unusual bleeding needs assessment.',
    missedDose:
        'Take the missed dose as soon as possible on the same day, then continue the regular twice-daily schedule. Do not double doses.',
    seekHelp:
        'Get urgent help for major bleeding, black stools, vomiting blood, severe headache after a fall/head injury or stroke symptoms.',
    teachBack:
        'How many times a day will you take apixaban, and which pain medicines will you check before using?',
  ),
  'rivaroxaban': EnglishPatientCounseling(
    purpose: 'Prevents or treats blood clots and reduces stroke risk in selected patients.',
    howToUse:
        'Take exactly the dose and schedule prescribed for your indication. Rivaroxaban regimens are not all the same.',
    timing:
        'The food rule depends on strength: 15 mg and 20 mg tablets must be taken with food; lower strengths have different instructions.',
    duration:
        'Duration depends on the indication and clot/bleeding risk.',
    important:
        'Do not stop anticoagulation without a plan. Tell clinicians/dentists and check before using NSAIDs or other bleeding-risk products.',
    commonActionable:
        'Bruising or minor bleeding can occur; increasing or persistent bleeding needs review.',
    missedDose:
        'Missed-dose instructions are regimen-specific. The initial 15 mg twice-daily clot-treatment phase has a different rule from once-daily regimens and 2.5 mg twice daily. Follow your exact prescription or ask the pharmacist.',
    seekHelp:
        'Get urgent help for major bleeding, black stools, vomiting blood, severe headache after injury or stroke symptoms.',
    teachBack:
        'What is your tablet strength and how many times per day do you take it? Does your dose require food?',
  ),
  'dabigatran': EnglishPatientCounseling(
    purpose: 'Prevents or treats blood clots in selected patients.',
    howToUse:
        'Swallow the capsule whole with water. Do not break, chew, open or empty the capsule because this can substantially change drug exposure.',
    timing:
        'Take at consistent times, usually twice daily for common adult indications. Follow your exact regimen.',
    duration:
        'Duration depends on the indication and your clot/bleeding risk.',
    important:
        'Keep capsules in the original packaging required by your product and protect them from moisture. Do not stop anticoagulation without a plan.',
    commonActionable:
        'Stomach upset can occur. Taking with food may improve stomach tolerance without changing the need to swallow the capsule whole.',
    missedDose:
        'Take a missed dose if the next dose is more than 6 hours away. If the next dose is within 6 hours, skip the missed dose. Do not double.',
    storage:
        'Moisture protection is product-specific; follow the bottle/blister instructions and do not transfer capsules casually to a pill organizer if the label prohibits it.',
    seekHelp:
        'Get urgent help for major bleeding, black stools, vomiting blood, severe headache after injury or stroke symptoms.',
    teachBack:
        'Can you open the dabigatran capsule, and how many hours before the next dose must remain before taking a missed dose?',
  ),
  'lisinopril': EnglishPatientCounseling(
    purpose: 'Lowers blood pressure and may protect the heart or kidneys in selected conditions.',
    howToUse:
        'Take the prescribed dose consistently. Rise slowly if you feel dizzy, especially when treatment starts or after a dose increase.',
    timing:
        'Take once daily at a consistent time unless your prescription says otherwise. Food is not usually required.',
    duration:
        'Usually long term while it remains appropriate and effective.',
    important:
        'Kidney function and potassium may need monitoring. Do not add potassium supplements or potassium-containing salt substitutes without review.',
    commonActionable:
        'A dry cough can occur. Do not ignore severe dizziness, dehydration or very low blood pressure symptoms.',
    missedDose:
        'Take it when you remember unless the next dose is close; then skip it. Do not double.',
    seekHelp:
        'Get emergency help for swelling of the lips, tongue, face or throat or trouble breathing. Contact your clinician if pregnancy occurs or is planned.',
    teachBack:
        'Which supplements or salt substitutes will you check before using with lisinopril?',
  ),
  'losartan': EnglishPatientCounseling(
    purpose: 'Lowers blood pressure and may protect the heart or kidneys in selected conditions.',
    howToUse:
        'Take it consistently as prescribed. Rise slowly if it causes dizziness.',
    timing:
        'Usually once daily and can generally be taken with or without food.',
    duration:
        'Usually long term while it remains appropriate and effective.',
    important:
        'Kidney function and potassium may need monitoring. Avoid adding potassium supplements/salt substitutes without review.',
    commonActionable:
        'Dizziness can occur, especially early in treatment or with dehydration.',
    missedDose:
        'Take it when remembered unless the next dose is close. Do not double.',
    seekHelp:
        'Seek review for fainting, very low urine output or marked weakness/palpitations. Contact your clinician promptly if pregnancy occurs or is planned.',
    teachBack:
        'What will you do before starting a potassium supplement or salt substitute?',
  ),
  'valsartan': EnglishPatientCounseling(
    purpose: 'Lowers blood pressure and is also used for selected heart conditions.',
    howToUse:
        'Take it consistently as prescribed. Do not add a separate valsartan product if you already use sacubitril/valsartan unless specifically directed.',
    timing:
        'Use the schedule on your prescription; food instructions can be product/regimen specific, so keep your routine consistent.',
    duration:
        'Usually long term for blood pressure or heart conditions.',
    important:
        'Kidney function and potassium may need monitoring. Avoid unreviewed potassium supplements or salt substitutes.',
    commonActionable:
        'Dizziness can occur, particularly with dehydration or after dose changes.',
    missedDose:
        'Take it when remembered unless the next dose is close; then skip it. Do not double.',
    seekHelp:
        'Seek review for fainting, markedly reduced urine output or symptoms of high potassium. Contact your clinician promptly if pregnancy occurs or is planned.',
    teachBack:
        'Are you taking any product that already contains valsartan, and do you use a potassium salt substitute?',
  ),
  'metoprolol': EnglishPatientCounseling(
    purpose: 'Slows the heart rate and lowers blood pressure; it is used for several heart conditions.',
    howToUse:
        'Take the exact immediate-release or extended-release product prescribed. These forms are not interchangeable instruction-for-instruction.',
    timing:
        'Use it at consistent times. Follow the food instruction for your exact product and prescription.',
    duration:
        'Often long term. Do not stop suddenly without a clinician-directed plan.',
    important:
        'It can slow the pulse and lower blood pressure. Check your plan if you develop marked dizziness or an unusually slow pulse.',
    commonActionable:
        'Tiredness or dizziness may occur when treatment starts and often improves.',
    missedDose:
        'Take it when remembered unless the next dose is close. Do not double.',
    seekHelp:
        'Seek urgent help for fainting, severe breathing difficulty or severe chest pain. Contact your clinician for persistent symptomatic slow pulse.',
    teachBack:
        'Is your metoprolol immediate-release or extended-release, and why should you not stop it abruptly?',
  ),
  'furosemide': EnglishPatientCounseling(
    purpose: 'Removes excess fluid and can help with swelling, heart failure or blood pressure.',
    howToUse:
        'Take the dose prescribed and monitor the symptoms/weight your clinician asked you to follow.',
    timing:
        'It increases urination, so morning dosing is practical. If a second dose is prescribed, it is often taken earlier in the afternoon rather than near bedtime.',
    duration:
        'Duration depends on the condition and fluid status; many heart-failure patients use it long term with dose adjustments.',
    important:
        'Too much fluid loss can cause dizziness, dehydration, kidney problems or electrolyte changes.',
    commonActionable:
        'Frequent urination after a dose is expected. Rise slowly and follow your fluid plan.',
    missedDose:
        'If it is late in the day, taking a missed dose may cause nighttime urination. Follow your prescription plan and do not double.',
    seekHelp:
        'Contact your clinician for fainting, severe weakness, very low urine output, severe cramps/confusion or rapid worsening of swelling/breathlessness.',
    teachBack:
        'When will you take your dose so it does not keep you awake at night, and what daily changes are you monitoring?',
  ),
  'spironolactone': EnglishPatientCounseling(
    purpose: 'Helps remove excess fluid while conserving potassium and is used for heart, blood-pressure and hormonal indications.',
    howToUse:
        'Take exactly as prescribed. Do not add potassium supplements or potassium-containing salt substitutes unless your clinician has reviewed them.',
    timing:
        'Use at a consistent time; because it can increase urination, earlier dosing may be more comfortable.',
    duration:
        'Often long term depending on the indication.',
    important:
        'Potassium and kidney function may need monitoring, especially with ACE inhibitors, ARBs or ARNIs.',
    commonActionable:
        'Dizziness, breast tenderness or menstrual/sexual effects can occur depending on the patient and dose.',
    missedDose:
        'Take it when remembered unless the next dose is close; then skip it. Do not double.',
    seekHelp:
        'Seek review for severe weakness, palpitations, fainting or markedly reduced urine output because these can signal potassium or kidney problems.',
    teachBack:
        'Which potassium products or salt substitutes should you avoid starting on your own?',
  ),
  'atorvastatin': EnglishPatientCounseling(
    purpose: 'Lowers LDL cholesterol and reduces cardiovascular risk.',
    howToUse:
        'Take the prescribed dose consistently. Continue lifestyle measures as part of the overall cardiovascular plan.',
    timing:
        'Atorvastatin can be taken at a convenient consistent time, with or without food.',
    duration:
        'Usually long term because the cardiovascular benefit depends on continued treatment.',
    important:
        'Do not stop because your cholesterol number improved without discussing the long-term prevention plan.',
    commonActionable:
        'Muscle aches can occur, but most aches are not dangerous. New severe or persistent muscle symptoms deserve review.',
    missedDose:
        'Take it when remembered unless the next dose is close; then skip it. Do not double.',
    seekHelp:
        'Seek prompt review for severe muscle pain/weakness, especially with dark urine, or signs of significant liver injury such as jaundice.',
    teachBack:
        'Is this a short course or a long-term prevention medicine, and what muscle symptoms would you report?',
  ),
  'clopidogrel': EnglishPatientCounseling(
    purpose: 'Reduces platelet clotting to prevent heart attack, stroke or stent-related clots in selected patients.',
    howToUse:
        'Take it once daily exactly as prescribed. Tell clinicians and dentists that you take an antiplatelet medicine.',
    timing:
        'Take at a consistent time; it can generally be taken with or without food.',
    duration:
        'Duration depends on why it was prescribed, especially after coronary stenting. Do not decide the stop date yourself.',
    important:
        'Stopping clopidogrel too early after a stent can be dangerous. Check before adding NSAIDs or other products that increase bleeding.',
    commonActionable:
        'Bruising or minor bleeding can occur. Persistent or unusual bleeding needs review.',
    missedDose:
        'Take it when you remember unless the next dose is close; then skip it. Do not double.',
    seekHelp:
        'Get urgent help for major bleeding, black stools, vomiting blood, severe unexplained headache or stroke symptoms.',
    teachBack:
        'Who should you contact before stopping clopidogrel, especially if you have a coronary stent?',
  ),
  'amoxicillin-clavulanate': EnglishPatientCounseling(
    purpose: 'Treats bacterial infections when this antibiotic combination is appropriate.',
    howToUse:
        'Use the exact strength and formulation prescribed and complete the planned course unless a clinician tells you to stop. Different strengths are not interchangeable based only on the amoxicillin number.',
    timing:
        'Take at the start of a meal to improve tolerance and clavulanate absorption.',
    duration:
        'Use for the exact prescribed course; do not save leftover antibiotic for a future illness.',
    important:
        'Antibiotics do not treat viral colds or flu. Report a history of serious penicillin allergy before use.',
    commonActionable:
        'Diarrhea or nausea can occur. Taking it at the start of a meal can help stomach tolerance.',
    missedDose:
        'Take a missed dose when remembered if there is enough time before the next one. Do not double doses; keep doses reasonably evenly spaced.',
    seekHelp:
        'Get urgent help for severe allergic swelling/breathing difficulty. Seek medical review for severe, persistent or bloody diarrhea or jaundice.',
    teachBack:
        'When in relation to the meal will you take it, and how many days is your prescribed course?',
  ),
  'doxycycline': EnglishPatientCounseling(
    purpose: 'Treats selected bacterial infections and is used for some other specific conditions.',
    howToUse:
        'Swallow with a full glass of water while sitting or standing. Stay upright for at least 30 minutes and do not take it just before lying down.',
    timing:
        'Separate it from iron, calcium, magnesium, zinc and antacids according to the prescribed/product interval. Food may be used for stomach tolerance when compatible with the product.',
    duration:
        'For infection, complete the prescribed course unless the clinician changes the plan.',
    important:
        'It can irritate the esophagus and make skin more sensitive to sunlight.',
    commonActionable:
        'Nausea can occur. Adequate water and correct posture reduce esophageal irritation.',
    missedDose:
        'Take it when remembered unless the next dose is close; then skip it. Do not double.',
    seekHelp:
        'Seek help for severe allergic reaction, severe headache with vision changes, painful swallowing/chest pain after a dose, or severe/persistent diarrhea.',
    teachBack:
        'Show me how much water you will use and how long you will stay upright after the dose.',
  ),
  'azithromycin': EnglishPatientCounseling(
    purpose: 'Treats selected bacterial infections.',
    howToUse:
        'Take the exact formulation and course prescribed. Tablets, standard suspension and extended-release products can have different food instructions.',
    timing:
        'Follow the food and spacing instructions for your exact product rather than using one rule for every azithromycin formulation.',
    duration:
        'Complete the prescribed course unless the clinician changes it.',
    important:
        'Tell the clinician/pharmacist about significant heart-rhythm problems or other QT-prolonging medicines.',
    commonActionable:
        'Nausea, abdominal discomfort or diarrhea can occur.',
    missedDose:
        'Take it when remembered unless the next dose is close; then skip it. Do not double.',
    seekHelp:
        'Seek urgent help for severe allergy, fainting/serious palpitations, jaundice or severe/persistent diarrhea.',
    teachBack:
        'Which azithromycin formulation do you have, and what does its label say about food?',
  ),
  'nitrofurantoin': EnglishPatientCounseling(
    purpose: 'Treats certain urinary tract infections.',
    howToUse:
        'Take the exact product and course prescribed. It is for appropriate lower urinary infections and is not a general antibiotic for every infection.',
    timing:
        'Take with food to improve absorption and stomach tolerance.',
    duration:
        'Complete the prescribed course unless a clinician changes the plan.',
    important:
        'Kidney function and the site/type of urinary infection matter when deciding if nitrofurantoin is appropriate.',
    commonActionable:
        'Nausea can improve with food. Urine may become dark yellow or brown; this can be harmless with nitrofurantoin.',
    missedDose:
        'Take it when remembered unless the next dose is close; then skip it. Do not double.',
    seekHelp:
        'Seek review for new shortness of breath/cough, jaundice, severe numbness/tingling or severe allergic reaction.',
    teachBack:
        'Will you take it with food, and what symptoms would make you seek help rather than simply finishing the course?',
  ),
  'cefdinir-pediatric-suspension': EnglishPatientCounseling(
    purpose: 'Treats selected bacterial infections in children when cefdinir is appropriate.',
    howToUse:
        'Shake the suspension well and measure the exact mL with an oral syringe. Verify the bottle concentration because different mg/5 mL strengths exist.',
    timing:
        'It can be taken with or without food. Separate therapeutic iron supplements and aluminum/magnesium antacids by at least 2 hours. Iron-fortified infant formula is an exception in current labeling.',
    duration:
        'Give the full prescribed course unless the prescriber changes it.',
    important:
        'Cefdinir can make stool look reddish when taken with iron; this is a known nonabsorbed complex, but true blood or a sick child still needs assessment.',
    commonActionable:
        'Diarrhea or stomach upset can occur.',
    missedDose:
        'Give it when remembered unless the next dose is close. Do not give two doses together.',
    storage:
        'For the current U.S. suspension labeling used in this app: store the mixed suspension at room temperature and discard after 10 days.',
    seekHelp:
        'Get urgent help for severe allergy. Seek review for severe, persistent or bloody diarrhea or if the infection is not improving as expected.',
    teachBack:
        'Show me the bottle concentration and the mL you will draw into the oral syringe.',
  ),
  'sertraline': EnglishPatientCounseling(
    purpose: 'Treats depression and several anxiety-related conditions.',
    howToUse:
        'Take it every day as prescribed. Benefit builds gradually; do not stop suddenly because you feel better or because early side effects occur.',
    timing:
        'Take once daily at a consistent time. If it makes you sleepy or more alert, the dosing time can be adjusted with your clinician/pharmacist.',
    duration:
        'Treatment is usually continued for months or longer depending on the condition and relapse risk.',
    important:
        'Mood or suicidal thoughts can worsen in some people, especially early in treatment or after dose changes. Close follow-up matters.',
    commonActionable:
        'Nausea, loose stools, sleep changes or sexual side effects can occur. Many early GI effects improve with time.',
    missedDose:
        'Take it when remembered unless the next dose is close; then skip it. Do not double.',
    seekHelp:
        'Get urgent help for suicidal thoughts, severe agitation/confusion with fever and muscle rigidity, severe allergic reaction or dangerous bleeding.',
    teachBack:
        'How long do you expect before judging whether it works, and why should you not stop it suddenly?',
  ),
  'levetiracetam': EnglishPatientCounseling(
    purpose: 'Helps prevent seizures.',
    howToUse:
        'Take it regularly at the prescribed times. Do not stop seizure medicine abruptly unless your treating clinician gives you a plan.',
    timing:
        'Keep doses consistently spaced according to the prescribed regimen. Food is usually not the main issue.',
    duration:
        'Often long term; duration depends on seizure type, control and neurologic plan.',
    important:
        'Sleepiness or dizziness can occur. Watch for new or severe mood/behavior changes.',
    commonActionable:
        'Drowsiness, dizziness or fatigue may be most noticeable when starting or increasing the dose.',
    missedDose:
        'Take it when remembered unless the next dose is close. Do not double. If several doses are missed or a seizure occurs, contact the treatment team.',
    seekHelp:
        'Seek urgent help for suicidal thoughts, dangerous behavior change, severe rash or allergic swelling/breathing difficulty.',
    teachBack:
        'What will you do if you miss several doses, and why should you not stop it suddenly?',
  ),
  'methotrexate-rheumatology': EnglishPatientCounseling(
    purpose: 'Controls inflammation in conditions such as rheumatoid arthritis or psoriasis.',
    howToUse:
        'For rheumatology/dermatology use, take methotrexate ONCE A WEEK on the prescribed day—not every day. Take folic acid exactly as your treatment plan directs.',
    timing:
        'Choose one fixed weekly day. Keep the methotrexate day clearly marked and separate from any daily medicines.',
    duration:
        'Usually long term while effective and tolerated, with regular laboratory monitoring.',
    important:
        'Weekly-versus-daily errors can be fatal. Blood counts, liver and kidney monitoring are important, and pregnancy must be avoided according to the treatment plan.',
    commonActionable:
        'Nausea, fatigue or mouth soreness can occur. Report persistent mouth ulcers rather than simply taking extra doses or supplements.',
    missedDose:
        'Do not take extra doses or switch to daily dosing. If you miss the weekly dose, contact the pharmacist/clinical team for the correct next dose date.',
    seekHelp:
        'Seek prompt medical advice for fever/infection, severe mouth ulcers, unusual bruising/bleeding, shortness of breath or jaundice.',
    teachBack:
        'What day of the week will you take methotrexate? Tell me how often—not how many tablets—you take it.',
  ),
  'prednisone': EnglishPatientCounseling(
    purpose: 'Reduces inflammation and immune activity for many different conditions.',
    howToUse:
        'Take exactly the dose and taper prescribed. Do not reuse an old taper for a new illness.',
    timing:
        'Take with food to reduce stomach upset. If it is a single daily dose, morning dosing is often practical; divided or special regimens follow the prescription.',
    duration:
        'Can be a short burst, taper or longer treatment depending on the condition. Longer courses may require gradual dose reduction.',
    important:
        'Do not stop suddenly after prolonged/high-dose use unless your clinician says it is safe. It can raise blood glucose and infection risk.',
    commonActionable:
        'Increased appetite, indigestion, mood or sleep changes can occur, especially at higher doses.',
    missedDose:
        'Missed-dose advice depends on your schedule and taper. Do not double or redesign the taper; ask if you are unsure.',
    seekHelp:
        'Seek medical advice for severe infection symptoms, black/bloody stools, severe mood/behavior change, vision problems or symptoms of adrenal insufficiency after abrupt interruption.',
    teachBack:
        'Are you on a fixed dose or a taper, and what is the next dose written on your schedule?',
  ),
  'salbutamol-mdi': EnglishPatientCounseling(
    purpose: 'Quickly relaxes airway muscles to relieve wheeze and shortness of breath.',
    howToUse:
        'Use the exact inhaler technique you were shown. Shake/prime if your product requires it, seal your lips around the mouthpiece, coordinate a slow deep inhalation with the puff, then hold your breath if able. A spacer can improve delivery for many pressurized inhalers.',
    timing:
        'Usually used when needed according to the asthma/COPD action plan. It is not a substitute for controller treatment when symptoms are frequent.',
    duration:
        'Keep available as directed while it remains part of your rescue plan.',
    important:
        'Needing it more often than usual can mean the airway disease is poorly controlled rather than that you simply need more puffs.',
    commonActionable:
        'Tremor, a fast heartbeat or feeling jittery can occur, especially with repeated doses.',
    missedDose:
        'If it is a rescue inhaler, there is no missed dose. If you have a special scheduled plan, follow that plan rather than doubling puffs.',
    seekHelp:
        'Get urgent help for severe breathlessness, difficulty speaking, bluish lips, fainting, or symptoms that do not improve with the rescue plan.',
    teachBack:
        'Show me one complete puff with your inhaler (and spacer if you use one).',
  ),
  'budesonide-formoterol': EnglishPatientCounseling(
    purpose: 'Combines an inhaled steroid with a long-acting bronchodilator to control asthma or COPD; some asthma plans also use specific products as reliever therapy.',
    howToUse:
        'Use the exact device and number of inhalations prescribed. Technique differs between inhaler devices. Rinse your mouth and spit after maintenance steroid doses.',
    timing:
        'Use maintenance doses at the prescribed times. If your clinician prescribed the same inhaler for MART/SMART reliever use, follow that written action plan; do not assume every budesonide/formoterol product is a rescue inhaler.',
    duration:
        'Usually ongoing controller therapy while indicated, with periodic review of symptom control and inhaler technique.',
    important:
        'Device technique and the treatment plan matter as much as the medicine. Do not stop controller therapy just because symptoms improve.',
    commonActionable:
        'Thrush/hoarseness can occur; rinsing and spitting after steroid doses helps reduce this risk. Tremor or palpitations can occur from formoterol.',
    missedDose:
        'For fixed maintenance dosing, use the next dose according to the product plan rather than taking extra inhalations to compensate. MART/SMART plans have their own reliever limits.',
    seekHelp:
        'Get urgent help for severe breathlessness not responding to the action plan or if breathing becomes suddenly worse immediately after inhalation.',
    teachBack:
        'Show me your inhaler technique and tell me whether your specific inhaler is maintenance-only or also part of a MART/SMART reliever plan.',
  ),
  ...reviewedEnglishPatientCounselingExpansion,
};

EnglishPatientCounseling? englishPatientCounselingFor(String medicationId) =>
    englishPatientCounseling[medicationId];
