class TubeFeedInteractionRecord {
  const TubeFeedInteractionRecord({
    required this.medicine,
    required this.issue,
    required this.feedInstruction,
    required this.monitoring,
    required this.source,
  });

  final String medicine;
  final String issue;
  final String feedInstruction;
  final String monitoring;
  final String source;
}

class TubeSafetyRule {
  const TubeSafetyRule({
    required this.title,
    required this.action,
    required this.why,
    required this.source,
    this.critical = false,
  });

  final String title;
  final String action;
  final String why;
  final String source;
  final bool critical;
}


class TubeMedicationRecord {
  const TubeMedicationRecord({
    required this.medicine,
    required this.formulation,
    required this.status,
    required this.tubeRoute,
    required this.preparation,
    required this.feedPlan,
    required this.doNot,
    required this.monitoring,
    required this.pediatricNicu,
    required this.practicalAr,
    required this.source,
    this.critical = false,
  });

  final String medicine;
  final String formulation;
  final String status;
  final String tubeRoute;
  final String preparation;
  final String feedPlan;
  final String doNot;
  final String monitoring;
  final String pediatricNicu;
  final String practicalAr;
  final String source;
  final bool critical;
}

/// Current practical medicine-feed interactions summarized from NHS SPS
/// "Managing interactions between medicines and enteral feeds",
/// republished 18 Sep 2025.
const tubeFeedInteractions = <TubeFeedInteractionRecord>[
  TubeFeedInteractionRecord(
    medicine: 'Digoxin',
    issue: 'High-fibre enteral feeds can reduce digoxin absorption.',
    feedInstruction:
        'For high-fibre feeds, withhold feed for 2 hours before and 1 hour after the dose.',
    monitoring:
        'Monitor clinical response and digoxin monitoring parameters according to the indication and patient risk.',
    source: 'NHS SPS · Managing interactions between medicines and enteral feeds · 2025',
  ),
  TubeFeedInteractionRecord(
    medicine: 'Fluoroquinolones',
    issue:
        'Calcium, magnesium, iron, zinc and other multivalent cations in enteral feeds can chelate fluoroquinolones and reduce absorption.',
    feedInstruction:
        'Prefer an alternative route/antibiotic when appropriate. If enteral administration is used, NHS SPS advises withholding feed for 2 hours before and 2 hours after the dose.',
    monitoring:
        'Assess treatment response closely; antibiotic choice and dose remain prescriber decisions.',
    source: 'NHS SPS · Managing interactions between medicines and enteral feeds · 2025',
  ),
  TubeFeedInteractionRecord(
    medicine: 'Phenoxymethylpenicillin (Penicillin V)',
    issue: 'Enteral nutrition can significantly reduce absorption.',
    feedInstruction:
        'Consider an alternative route/antibiotic. If enteral use is necessary, NHS SPS advises withholding feed for 2 hours before and 1 hour after.',
    monitoring: 'Monitor clinical response.',
    source: 'NHS SPS · Managing interactions between medicines and enteral feeds · 2025',
  ),
  TubeFeedInteractionRecord(
    medicine: 'Phenytoin',
    issue: 'Enteral nutrition can significantly reduce phenytoin absorption.',
    feedInstruction:
        'Avoid feeding-tube administration when a suitable alternative exists. If it must be used, NHS SPS advises withholding feed for 2 hours before and 2 hours after.',
    monitoring:
        'Serum phenytoin concentrations and clinical response require close monitoring when administration or feed pattern changes.',
    source: 'NHS SPS · Managing interactions between medicines and enteral feeds · 2025',
  ),
  TubeFeedInteractionRecord(
    medicine: 'Warfarin',
    issue: 'Enteral nutrition can reduce warfarin absorption/clinical effect.',
    feedInstruction:
        'NHS SPS advises withholding feed for 1 to 2 hours before and after each dose.',
    monitoring:
        'Monitor INR closely when feed formulation, feed timing or warfarin administration changes.',
    source: 'NHS SPS · Managing interactions between medicines and enteral feeds · 2025',
  ),
];


const tubeMedicationRecords = <TubeMedicationRecord>[
  TubeMedicationRecord(
    medicine: 'Lansoprazole delayed-release ODT',
    formulation: '15 mg or 30 mg delayed-release orally disintegrating tablet.',
    status: 'Label-supported NG method',
    tubeRoute:
        'Nasogastric tube into the stomach; tube must be 8 French or larger.',
    preparation:
        'Place a 15 mg tablet in a catheter-tip syringe with 4 mL water, or a 30 mg tablet with 10 mL water. Shake gently until dispersed, keep the microgranules suspended, and administer through the NG tube within 15 minutes. Refill the syringe with about 5 mL water, shake, and flush the tube.',
    feedPlan:
        'Lansoprazole is generally given before food. The cited NG instructions define preparation/flush but do not provide a universal continuous-feed hold interval; coordinate the feed around the prescribed pre-meal plan rather than inventing a hold.',
    doNot:
        'Do not chew or crush the delayed-release microgranules. Do not save the dispersed mixture for later use. Do not apply this ≥8 Fr ODT method to delayed-release capsules, which use a different NG method and larger tube.',
    monitoring:
        'Confirm therapeutic response and that granules are not retained in the syringe/tube.',
    pediatricNicu:
        'The label supports pediatric use by indication, but the labeled 4–10 mL preparation plus 5 mL flush may be too much fluid for some neonates/small infants. Do not scale or reduce volumes by guesswork; use pharmacy/NICU protocol if fluid restriction or very small tubes are involved.',
    practicalAr:
        'ODT ليس مثل الكبسولة: عبر NG مقاس 8 Fr أو أكبر، 15 mg مع 4 mL ماء أو 30 mg مع 10 mL، يُعطى خلال 15 دقيقة ثم flush بنحو 5 mL. لا تسحق الحبيبات.',
    source:
        'DailyMed · Lansoprazole delayed-release orally disintegrating tablets · NG administration instructions · current 2026 label',
  ),
  TubeMedicationRecord(
    medicine: 'Lansoprazole delayed-release capsule',
    formulation: 'Delayed-release capsule containing intact enteric-coated granules.',
    status: 'Label-supported NG method',
    tubeRoute:
        'Nasogastric tube into the stomach; tube must be 16 French or larger.',
    preparation:
        'Open the capsule and place the intact granules in 40 mL apple juice. Mix briefly, draw up with a catheter-tip syringe, keep granules suspended, and administer immediately through the NG tube into the stomach. Refill with 40 mL apple juice and flush to clear the tube.',
    feedPlan:
        'Administer before food according to the prescribed regimen. The tube method itself uses apple juice rather than enteral feed.',
    doNot:
        'Do not crush or chew the granules. For this labeled capsule method use apple juice only through the NG tube; do not substitute water, orange juice, tomato juice, or another liquid. Do not use this method for tubes smaller than 16 Fr.',
    monitoring:
        'Check for retained granules/tube blockage and therapeutic response.',
    pediatricNicu:
        'This 16 Fr / 40 mL + 40 mL method is usually impractical for NICU/small-bore tubes. Do not force granules through a smaller tube; choose a validated alternative formulation/method.',
    practicalAr:
        'كبسولة lansoprazole لها طريقة مختلفة تمامًا عن ODT: NG 16 Fr أو أكبر، افتح الكبسولة لكن لا تسحق الحبيبات، اخلطها مع 40 mL apple juice فقط ثم flush بـ40 mL apple juice.',
    source:
        'DailyMed · Lansoprazole delayed-release capsules · labeled apple-juice NG method',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'Esomeprazole delayed-release oral suspension',
    formulation:
        'Delayed-release granule packets; current products include 2.5 mg, 5 mg, 20 mg and 40 mg strengths.',
    status: 'Label-supported NG / gastric method',
    tubeRoute:
        'Nasogastric or gastric tube into the stomach; French size 6 or larger.',
    preparation:
        'Use a catheter-tip syringe. For 2.5 mg or 5 mg packets, add 5 mL water; for 20 mg or 40 mg packets, add at least 15 mL water. Add the packet, shake immediately, leave 2–3 minutes to thicken, shake again, and administer into the stomach within 30 minutes. Refill with the same amount of water and flush remaining contents.',
    feedPlan:
        'Give at least 1 hour before meals. The label does not define a single universal continuous-feed hold interval beyond the before-meal instruction.',
    doNot:
        'Do not crush the delayed-release granules. Do not apply a water volume from one packet strength to another. Do not use this gastric method for post-pyloric placement without a separate validated plan.',
    monitoring:
        'Confirm the entire dose clears the syringe/tube and monitor acid-suppression response.',
    pediatricNicu:
        'Low-dose packets are useful in pediatrics, but even 5 mL preparation + 5 mL flush can be clinically important fluid in small neonates. NICU volumes require product-specific pharmacy validation rather than proportional reduction.',
    practicalAr:
        'Esomeprazole packets عبر NG/gastric ≥6 Fr: 2.5/5 mg مع 5 mL ماء؛ 20/40 mg مع 15 mL على الأقل. انتظر 2–3 دقائق، أعطه خلال 30 دقيقة ثم flush بنفس حجم الماء.',
    source:
        'DailyMed · Esomeprazole magnesium delayed-release oral suspension · revised April 2026',
  ),
  TubeMedicationRecord(
    medicine: 'Omeprazole delayed-release oral suspension (PRILOSEC-type)',
    formulation: 'Delayed-release oral suspension packets, 2.5 mg and 10 mg.',
    status: 'Label-supported NG / gastric method',
    tubeRoute:
        'Nasogastric or gastric tube into the stomach; size 6 French or larger.',
    preparation:
        'Use a catheter-tip syringe. Add 5 mL water for a 2.5 mg packet or 15 mL water for a 10 mg packet, then add the packet. Shake immediately, leave 2–3 minutes to thicken, shake again, and inject into the stomach within 30 minutes. Refill with the same amount of water, shake, and flush the remaining medicine.',
    feedPlan:
        'Give before meals. Do not invent a 3-hour feed hold for this formulation; that specific hold belongs to omeprazole/sodium bicarbonate oral suspension, not all omeprazole products.',
    doNot:
        'Do not transfer instructions between PRILOSEC-type delayed-release packets and omeprazole/sodium-bicarbonate packets. They use different preparation volumes and feed instructions.',
    monitoring:
        'Confirm full delivery of granules and acid-suppression response.',
    pediatricNicu:
        'The 2.5 mg packet method uses 5 mL water plus an equal flush. In neonates/small infants, exact fluid and tube feasibility require local pharmacy/NICU review.',
    practicalAr:
        'Omeprazole delayed-release packet ليس هو omeprazole/sodium bicarbonate. عبر NG/gastric ≥6 Fr: 2.5 mg مع 5 mL ماء أو 10 mg مع 15 mL، ثم flush بنفس الحجم.',
    source:
        'DailyMed · PRILOSEC delayed-release oral suspension · NG/gastric tube instructions',
  ),
  TubeMedicationRecord(
    medicine: 'Omeprazole / sodium bicarbonate oral suspension',
    formulation:
        'Immediate-release omeprazole + sodium bicarbonate powder for oral suspension packets, commonly 20 mg or 40 mg omeprazole.',
    status: 'Label-supported NG / OG method with explicit feed hold',
    tubeRoute:
        'Nasogastric or orogastric tube into the stomach.',
    preparation:
        'Add 20 mL water to an appropriately sized catheter-tip syringe, then add one packet. Do not use food or another liquid. Shake to dissolve and administer through the NG/OG tube into the stomach immediately. Refill with another 20 mL water, shake, and flush remaining contents.',
    feedPlan:
        'The current label explicitly instructs suspending enteral feeding approximately 3 hours before administration and waiting at least 1 hour after the dose before restarting feed.',
    doNot:
        'Do not use the feed-hold or 20 mL recipe as a generic omeprazole rule. This is formulation-specific to omeprazole/sodium bicarbonate oral suspension.',
    monitoring:
        'Review sodium load and acid-suppression response when clinically relevant.',
    pediatricNicu:
        'The labeled 20 mL preparation plus 20 mL flush and sodium bicarbonate load can be inappropriate in small infants. Do not adapt this adult/product method to NICU by simple volume scaling.',
    practicalAr:
        'هذا المنتج له قاعدة خاصة: 20 mL ماء + packet عبر NG/OG إلى المعدة، ثم flush بـ20 mL. أوقف التغذية تقريبًا 3 ساعات قبل الجرعة وانتظر ساعة بعدها قبل إعادة التغذية.',
    source:
        'DailyMed · Omeprazole and Sodium Bicarbonate for Oral Suspension · current NG/OG instructions',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'Pantoprazole delayed-release oral suspension',
    formulation: 'Delayed-release oral suspension granules, 40 mg packet.',
    status: 'Label-supported NG / gastrostomy method',
    tubeRoute:
        'Nasogastric or gastrostomy tube; 16 French or larger.',
    preparation:
        'Use a 60 mL catheter-tip syringe with the plunger removed and connect to a 16 Fr or larger tube. Empty the packet into the syringe barrel. Add 10 mL apple juice and gently tap/shake to rinse the syringe and tube; repeat at least twice more with 10 mL apple juice each time until no granules remain.',
    feedPlan:
        'Administer approximately 30 minutes before a meal. Apple juice is part of the labeled tube method.',
    doNot:
        'Do not split, chew or crush the granules. For tube administration use apple juice only; do not substitute another liquid. Do not divide the 40 mg packet to create a 20 mg pediatric dose.',
    monitoring:
        'Confirm no granules remain in the syringe/tube and assess acid-suppression response.',
    pediatricNicu:
        'The ≥16 Fr tube and repeated 10 mL apple-juice rinses make this method unsuitable for many neonates/small infants. A different validated formulation/strategy is usually required.',
    practicalAr:
        'Pantoprazole granules عبر NG/G-tube تحتاج 16 Fr أو أكبر وapple juice فقط. أضف 10 mL ثم كرر 10 mL مرتين على الأقل حتى لا تبقى حبيبات. لا تقسّم packet 40 mg لعمل 20 mg.',
    source:
        'DailyMed · Pantoprazole sodium delayed-release oral suspension · NG/gastrostomy instructions',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'Rivaroxaban tablets',
    formulation: 'Immediate-release rivaroxaban tablets; all tablet strengths.',
    status: 'Label-supported gastric tube administration',
    tubeRoute:
        'Nasogastric or gastric feeding tube only after confirming gastric placement.',
    preparation:
        'Crush the prescribed tablet and suspend it in 50 mL water. Administer through the NG or gastric feeding tube after confirming that the tube terminates in the stomach.',
    feedPlan:
        'After crushed 15 mg or 20 mg tablets, immediately follow the dose with enteral feeding. Enteral feeding is not required after 2.5 mg or 10 mg tablets.',
    doNot:
        'Do not administer the crushed tablet distal to the stomach because exposure may be reduced. Do not apply the 15/20 mg feed requirement to 2.5/10 mg doses.',
    monitoring:
        'Monitor for bleeding/thrombosis and ensure the prescribed dose/indication remain correct; tube technique does not select the anticoagulant dose.',
    pediatricNicu:
        'Pediatric rivaroxaban has weight/formulation-specific dosing considerations. Do not use adult tablet manipulation as a NICU dosing method.',
    practicalAr:
        'Rivaroxaban tablet يمكن سحقه وتعليقه في 50 mL ماء عبر NG/gastric فقط بعد التأكد أن نهاية الأنبوب في المعدة. لا تعطه بعد المعدة. جرعات 15 و20 mg يجب أن تتبعها التغذية مباشرة.',
    source:
        'DailyMed · Rivaroxaban tablets · current administration options · 2026',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'Apixaban 2.5 mg / 5 mg tablets',
    formulation:
        'Immediate-release apixaban tablets; current tablet-tube instructions apply to adults and pediatric patients weighing at least 35 kg.',
    status: 'Label-supported NG method',
    tubeRoute: '12 French nasogastric tube.',
    preparation:
        'Crush the 2.5 mg or 5 mg tablet and suspend it in 60 mL water or D5W. Promptly administer through the 12 Fr NG tube. Then flush the tube with an additional 20 mL water or D5W.',
    feedPlan:
        'The current label does not require a generic enteral-feed hold for the tablet NG method. Avoid inventing a food separation interval.',
    doNot:
        'Do not transfer this tablet method to ELIQUIS SPRINKLE/capsule or oral-suspension products used in smaller pediatric patients; those have separate IFU instructions.',
    monitoring:
        'Monitor anticoagulation safety clinically, especially bleeding and renal/hepatic context. Tube administration does not determine dose.',
    pediatricNicu:
        'For pediatric patients under 35 kg, current apixaban products/instructions differ. Do not crush an adult-strength tablet for NICU dosing unless an exact specialist plan supports it.',
    practicalAr:
        'Apixaban 2.5/5 mg tablet: اسحق وعلّق في 60 mL ماء أو D5W عبر NG مقاس 12 Fr، ثم flush بـ20 mL ماء أو D5W. لا تنقل هذه الطريقة لمنتجات الأطفال الأخرى.',
    source:
        'DailyMed · ELIQUIS tablets · current administration options',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'Dabigatran etexilate capsules',
    formulation: 'Dabigatran etexilate capsules containing pellets.',
    status: 'Do NOT open / crush for tube',
    tubeRoute:
        'No tube method is supported for administration of the capsule contents in the cited label.',
    preparation:
        'Do not prepare the capsule for enteral-tube administration. If the patient cannot swallow the capsule whole, the prescriber/pharmacist must select a formulation or anticoagulation strategy that is appropriate for the patient.',
    feedPlan:
        'Food may be used for GI tolerance when taken orally, but feed timing does not solve the formulation problem.',
    doNot:
        'Do not break, chew, open or empty the capsule contents. Opening the capsule increases dabigatran exposure.',
    monitoring:
        'Because this is an anticoagulant, any formulation change requires review of indication, renal function, bleeding risk and dosing.',
    pediatricNicu:
        'Pediatric dabigatran products/dosing are formulation- and age/weight-specific. Never improvise a capsule-to-tube preparation.',
    practicalAr:
        'Dabigatran capsule لا تُفتح ولا تُسحق ولا تُفرغ داخل الأنبوب؛ فتحها يزيد التعرض للدواء. إذا المريض لا يستطيع بلعها يجب تغيير الخطة/الـformulation بدل تحويل الكبسولة إلى NG.',
    source:
        'DailyMed · Dabigatran etexilate capsules · administration section · current 2026 labels',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'Tamsulosin capsules',
    formulation: 'Tamsulosin 0.4 mg modified-release pellet capsule.',
    status: 'Do NOT open / crush for tube',
    tubeRoute:
        'No label-supported tube method for administering opened capsule contents.',
    preparation:
        'Do not manipulate the capsule for NG/PEG administration. Request an alternative medication/formulation plan if tube administration is required.',
    feedPlan:
        'Oral label timing is approximately 30 minutes after the same meal each day; feed timing does not make opening the capsule acceptable.',
    doNot:
        'Do not crush, chew or open the capsule.',
    monitoring:
        'If therapy is changed because of tube access, monitor urinary symptoms and orthostatic blood-pressure effects as appropriate.',
    pediatricNicu:
        'Not a routine pediatric/NICU medicine.',
    practicalAr:
        'Tamsulosin capsule لا تُفتح ولا تُسحق ولا تُمضغ؛ وجود NG لا يبرر فتح الكبسولة. اطلب بديلًا مناسبًا بدل إعطاء الحبيبات عبر الأنبوب.',
    source:
        'DailyMed · Tamsulosin hydrochloride capsules · current 2026 labeling',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'Nifedipine extended-release tablets',
    formulation: 'Extended-release nifedipine tablet.',
    status: 'Do NOT crush for tube',
    tubeRoute:
        'The extended-release tablet is not suitable for tube administration by crushing.',
    preparation:
        'Do not prepare the ER tablet for a feeding tube. Review the indication and select an appropriate alternative formulation/medicine when enteral-tube administration is required.',
    feedPlan:
        'The cited ER product is taken on an empty stomach, but feed separation cannot make a crushed ER tablet safe.',
    doNot:
        'Do not chew, divide or crush the extended-release tablet.',
    monitoring:
        'If switching therapy, monitor blood pressure/angina response and adverse effects.',
    pediatricNicu:
        'Do not extrapolate adult ER-tablet manipulation to pediatric/NICU care.',
    practicalAr:
        'Nifedipine ER لا يُسحق ولا يُقسم؛ فصل التغذية لا يحل المشكلة. إذا احتاج المريض NG يجب اختيار بديل مناسب بدل سحق الـER tablet.',
    source:
        'DailyMed · Nifedipine extended-release tablets · current labeling',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'Venlafaxine XR capsules',
    formulation: 'Extended-release capsule containing spheroid/pellet contents.',
    status: 'Openable orally ≠ tube-validated',
    tubeRoute:
        'The cited label does not provide a feeding-tube administration method.',
    preparation:
        'The capsule may be opened for ORAL administration by sprinkling the entire contents on applesauce and swallowing immediately without chewing. This does not establish tube compatibility.',
    feedPlan:
        'Take with food when used orally. Do not invent a feed-hold strategy to compensate for an unvalidated tube method.',
    doNot:
        'Do not divide, crush or chew the pellets, and do not place them in water. Do not assume that because a capsule may be opened onto applesauce it can be pushed through an NG/PEG tube.',
    monitoring:
        'If an alternative formulation/antidepressant is selected, monitor withdrawal symptoms, blood pressure and clinical response.',
    pediatricNicu:
        'Not a routine NICU medicine; the general lesson is formulation-specific: “openable capsule” does not automatically mean tube-safe.',
    practicalAr:
        'Venlafaxine XR يمكن فتح الكبسولة للأكل مع applesauce فقط حسب الملصق، لكنه لا يعطي طريقة NG. لا تضع الحبيبات في الماء ولا تعتبر فتح الكبسولة دليلًا على أنها tube-safe.',
    source:
        'DailyMed · Venlafaxine hydrochloride extended-release capsules · current 2026 labeling',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'Bupropion XL tablets',
    formulation: 'Extended-release bupropion tablet (XL).',
    status: 'Do NOT crush for tube',
    tubeRoute:
        'No tube method is supported for the intact XL tablet after crushing.',
    preparation:
        'Do not prepare XL tablets for NG/PEG by crushing. Request a clinically appropriate alternative formulation/treatment plan.',
    feedPlan:
        'May be taken with or without food orally; feed timing does not make crushing safe.',
    doNot:
        'Do not chew, cut, divide or crush. Destroying the extended-release system can release drug too rapidly and increase adverse-effect/seizure risk.',
    monitoring:
        'Any therapy/formulation change should consider seizure risk, indication and withdrawal/relapse risk.',
    pediatricNicu:
        'Not a routine NICU medicine.',
    practicalAr:
        'Bupropion XL ممنوع سحقه أو تقسيمه للـNG؛ كسر نظام الـextended release قد يطلق الدواء بسرعة ويرفع خطر الأعراض ومنها seizures. يلزم بديل مناسب.',
    source:
        'DailyMed · Bupropion hydrochloride extended-release tablets (XL) · current 2026 labeling',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'Dexlansoprazole delayed-release capsule',
    formulation: 'Delayed-release capsule containing intact granules/pellets.',
    status: 'Label-supported NG method',
    tubeRoute:
        'Nasogastric tube into the stomach; tube must be 16 French or larger.',
    preparation:
        'Open the capsule and empty the intact granules into a clean container with 20 mL water. Draw the entire mixture into a catheter-tip syringe, gently swirl to keep granules suspended, and administer immediately through the NG tube into the stomach. Refill the syringe with 10 mL water, swirl and flush; repeat the 10 mL rinse once more.',
    feedPlan:
        'Dexlansoprazole may be taken without regard to food. The label does not require a routine enteral-feed hold for this NG method.',
    doNot:
        'Do not chew or crush the granules. Do not save the water/granule mixture. Do not use this labeled method through an NG tube smaller than 16 Fr or assume jejunal delivery is equivalent.',
    monitoring:
        'Ensure all granules clear the syringe/tube and monitor acid-suppression response.',
    pediatricNicu:
        'The labeled 20 mL preparation plus two 10 mL rinses is usually excessive for neonates/small infants. Do not reduce volumes by guesswork; use a validated pediatric/NICU alternative when fluid or tube size is limiting.',
    practicalAr:
        'Dexlansoprazole DR عبر NG يحتاج 16 Fr أو أكبر: افتح الكبسولة دون سحق الحبيبات، ضعها في 20 mL ماء، أعطها فورًا ثم flush بـ10 mL مرتين.',
    source:
        'DailyMed · Dexlansoprazole delayed-release capsules · labeled NG administration instructions · current 2026 label',
  ),
  TubeMedicationRecord(
    medicine: 'Duloxetine DRIZALMA SPRINKLE',
    formulation: 'Duloxetine delayed-release sprinkle capsule with intact pellets.',
    status: 'Label-supported NG method for this product',
    tubeRoute:
        'Nasogastric tube into the stomach; tube must be 12 French or larger.',
    preparation:
        'Remove the plunger from a 60 mL catheter-tip syringe, open the capsule and place the pellets in the syringe barrel. Add 50 mL water only, replace the plunger, and gently shake for about 10 seconds. Administer immediately through the ≥12 Fr NG tube into the stomach, then flush with 15 mL additional water.',
    feedPlan:
        'May be administered with or without food. The label does not require a routine feed-hold interval for the NG method.',
    doNot:
        'Do not use other liquids for the labeled NG method. Do not crush or chew the pellets. Do not transfer this tube instruction to every duloxetine delayed-release capsule; it is product-specific to DRIZALMA SPRINKLE.',
    monitoring:
        'Ensure no pellets remain in the syringe and monitor clinical response/adverse effects when formulation is changed.',
    pediatricNicu:
        'The labeled 50 mL preparation plus 15 mL flush is not a NICU-volume method. Pediatric labeling also differs by product/indication; do not extrapolate this technique to neonates.',
    practicalAr:
        'DRIZALMA SPRINKLE له طريقة NG موثقة: ≥12 Fr، pellets + 50 mL ماء فقط، رجّ بلطف نحو 10 ثوانٍ، أعطه فورًا ثم flush بـ15 mL. لا تعممها على كل duloxetine.',
    source:
        'DailyMed · DRIZALMA SPRINKLE (duloxetine delayed-release capsules) · NG Instructions for Use',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'Mycophenolate mofetil oral suspension',
    formulation:
        'Powder reconstituted by the pharmacist to an oral suspension containing 200 mg/mL mycophenolate mofetil.',
    status: 'Label-supported NG route with hazardous-handling lock',
    tubeRoute:
        'Nasogastric tube; minimum 8 French (minimum 1.7 mm internal diameter).',
    preparation:
        'Pharmacy reconstitution: loosen powder, measure 94 mL water, add about half and shake the closed bottle well for about 1 minute; add the remainder and shake again for about 1 minute. Final concentration is 200 mg/mL. Once reconstituted, administer the measured suspension directly; the label states it must not be mixed with liquids before dose administration.',
    feedPlan:
        'Recommended on an empty stomach. In stable transplant patients, administration with food may be used if necessary. Do not invent a universal feed-hold interval beyond the prescribed transplant plan.',
    doNot:
        'Do not mix the suspension with another medication or liquid before administration. Do not crush tablets or open/crush capsules. Avoid inhalation or skin/mucosal contact with powder/suspension because mycophenolate is hazardous and teratogenic.',
    monitoring:
        'Dose selection and monitoring are transplant-specialist decisions. Verify the exact concentration (200 mg/mL), dose volume, immunosuppression monitoring and infection/toxicity surveillance.',
    pediatricNicu:
        'Pediatric transplant dosing is specialist- and body-size-dependent. The 8 Fr minimum is a product constraint; neonatal use is not inferred. Use appropriate PPE and a dedicated enteral syringe.',
    practicalAr:
        'Mycophenolate suspension تركيزه بعد التحضير 200 mg/mL: الصيدلي يضيف 94 mL ماء على مرحلتين مع رج دقيقة لكل مرحلة. يمكن عبر NG ≥8 Fr. لا تخلطه بسائل أو دواء آخر ولا تسحق tablets/تفتح capsules.',
    source:
        'DailyMed · Mycophenolate mofetil for oral suspension · revised Aug 2026',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'Ranolazine ASPRUZYO SPRINKLE',
    formulation: 'Extended-release ranolazine granules in sachets.',
    status: 'Label-supported NG and G-tube methods',
    tubeRoute:
        'Nasogastric tube ≥12 Fr or gastric (G) tube ≥12 Fr; product-specific methods differ by route.',
    preparation:
        'NG: place sachet granules in a plastic catheter-tip syringe, add 50 mL water, shake gently about 15 seconds, and administer immediately; rinse with about 15 mL additional water if needed. G-tube: add granules to a catheter-tip syringe with 30 mL water, shake about 15 seconds, administer immediately, then rinse with 20 mL water; use about 15 mL more if granules remain.',
    feedPlan:
        'May be taken with or without meals. The labeled NG/G-tube methods do not require a routine enteral-feed hold.',
    doNot:
        'Do not crush or chew the extended-release granules. Do not interchange NG and G-tube water volumes. Do not transfer these instructions to ranolazine extended-release tablets.',
    monitoring:
        'Ranolazine dosing and interaction/QT review remain clinical decisions; tube administration only describes delivery of the prescribed dose.',
    pediatricNicu:
        'Not a routine NICU medicine; labeled water volumes are adult/product instructions and should not be adapted to neonates.',
    practicalAr:
        'ASPRUZYO له طريقتان مختلفتان: NG ≥12 Fr مع 50 mL ماء؛ G-tube ≥12 Fr مع 30 mL ماء ثم flush 20 mL. لا تسحق granules ولا تستخدم هذه الطريقة لـranolazine ER tablets.',
    source:
        'DailyMed · ASPRUZYO SPRINKLE (ranolazine extended-release granules) · tube administration instructions',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'Metoprolol succinate extended-release tablet',
    formulation: 'Extended-release metoprolol succinate tablet.',
    status: 'Do NOT crush for tube',
    tubeRoute:
        'No label-supported crushed-tablet feeding-tube method. The scored tablet may be divided orally, but this does not make it crushable for a tube.',
    preparation:
        'Do not prepare the extended-release tablet by crushing. If tube administration is required, review the clinical indication and use an appropriate alternative formulation/regimen rather than destroying the ER system.',
    feedPlan:
        'Feed timing cannot make crushing the extended-release tablet safe.',
    doNot:
        'Do not crush or chew either the whole or half extended-release tablet. A score line permits division; it does not permit pulverizing the ER dosage form.',
    monitoring:
        'If switching formulation/regimen, monitor heart rate, blood pressure and heart-failure/angina response as appropriate.',
    pediatricNicu:
        'Do not extrapolate the adult ER product to NICU. Pediatric beta-blocker formulation and dose selection require an age-appropriate product/protocol.',
    practicalAr:
        'Metoprolol succinate ER قد يكون scored ويمكن تقسيمه فمويًا، لكن لا يجوز سحق الحبة أو نصفها للـNG. الـscore لا يعني أن الـER قابل للسحق.',
    source:
        'DailyMed · Metoprolol succinate extended-release tablets · administration section · current 2026 labeling',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'Divalproex delayed-release sprinkle capsule',
    formulation: 'Delayed-release capsule containing coated sprinkle particles.',
    status: 'Openable orally ≠ tube-validated',
    tubeRoute:
        'The current label provides an oral soft-food method but does not provide a feeding-tube administration method.',
    preparation:
        'For oral swallowing difficulty, the capsule may be opened and all sprinkles placed on about one teaspoon of soft food such as applesauce or pudding, then swallowed immediately without chewing. This oral method does not establish NG/PEG compatibility.',
    feedPlan:
        'Food timing does not solve the absence of a validated tube method. If enteral-tube administration is needed, verify an alternative valproate formulation and patient-specific dosing/monitoring plan.',
    doNot:
        'Do not chew or crush the coated particles. Do not assume “sprinkle capsule” means the particles can be mixed with water and passed through a tube.',
    monitoring:
        'Changing valproate formulation can affect dose equivalence/tolerability; monitor seizure control or other indication, concentrations when clinically indicated, and safety parameters.',
    pediatricNicu:
        'Valproate use in infants/young children has important age-specific toxicity considerations. Do not improvise a tube method from the sprinkle instructions.',
    practicalAr:
        'Divalproex sprinkle يمكن فتحه على كمية صغيرة من soft food للفم، لكن الملصق لا يعطي طريقة NG. لا تخلط الحبيبات بالماء أو تسحقها فقط لأنها “sprinkle”.',
    source:
        'DailyMed · Divalproex sodium delayed-release sprinkle capsules · Instructions for Use · revised 2026',
    critical: true,
  ),


  TubeMedicationRecord(
    medicine: 'XARELTO rivaroxaban oral suspension',
    formulation:
        'Commercial granules reconstituted by the pharmacy to rivaroxaban 1 mg/mL oral suspension.',
    status: 'Label-supported pediatric NG / gastric-tube formulation',
    tubeRoute:
        'Nasogastric or gastric feeding tube after confirming gastric placement. The label supports PVC, polyurethane and silicone NG tubing; it does not establish post-pyloric administration.',
    preparation:
        'Pharmacy reconstitution: tap the bottle until granules flow freely, add 150 mL purified water, shake for 60 seconds and verify a uniform suspension. Final concentration is 1 mg/mL. Before each dose shake the bottle slowly for 10 seconds. Withdraw the prescribed mL dose with the supplied oral syringe, administer through the NG/gastric tube, then flush the tube with water. Reconstituted suspension is used within 60 days, stored at room temperature and not frozen.',
    feedPlan:
        'For pediatric treatment or reduction of recurrent VTE, immediately follow the tube dose with enteral feeding to increase absorption. For thromboprophylaxis after the Fontan procedure, the label states that enteral feeding is not required after the dose.',
    doNot:
        'Do not give the suspension distal to the stomach by assumption. Do not add flavor to the reconstituted product. Do not switch between suspension and tablets or invent a fractional tablet dose without the prescribed pediatric plan.',
    monitoring:
        'Verify current weight-based dose and indication because pediatric schedules differ. Monitor bleeding, renal/hepatic context and clinical response.',
    pediatricNicu:
        'This is a pediatric formulation, but the current label does not recommend rivaroxaban below the studied weight limits for the specific indication. A neonate or small infant must meet the labeled age/weight/indication criteria; tube use does not authorize off-label NICU dosing.',
    practicalAr:
        'XARELTO suspension تركيزه 1 mg/mL بعد إضافة 150 mL purified water ورج 60 ثانية. يُرج ببطء 10 ثوانٍ قبل كل جرعة، ويمكن عبر NG/gastric ثم flush بالماء. في pediatric VTE تتبع الجرعة بالتغذية مباشرة، بينما Fontan thromboprophylaxis لا يحتاج feed بعدها.',
    source:
        'DailyMed · XARELTO (rivaroxaban) for oral suspension · Administration Options and Pharmacy Preparation Instructions · current label',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'ELIQUIS 0.5 mg tablets for oral suspension',
    formulation:
        'Pediatric apixaban 0.5 mg tablets for oral suspension supplied in single-use packets; packet configurations provide prescribed doses below 35 kg.',
    status: 'FDA-IFU supported pediatric NG / G-tube method',
    tubeRoute:
        'Nasogastric or gastrostomy tube using 5 Fr, 6.5 Fr or 12 Fr tube sizes described in the IFU.',
    preparation:
        'Use the liquid-mixing method. Empty the prescribed packet contents into a medicine cup. Add 10 mL total of water, infant formula or apple juice regardless of packet count; only use 2.5 mL instead if the healthcare provider specifically directs this for fluid restriction. Crush the tablet(s) in the liquid and stir until no tablets are visible, about 5 to 7 minutes. Administer the liquid mixture through the NG/G tube, then flush with water or infant formula according to tube size: 5 Fr = 10 mL, 6.5 Fr = 15 mL, 12 Fr = 25 mL. Liquid mixtures must be given promptly and within 2 hours.',
    feedPlan:
        'The IFU does not require a routine enteral-feed hold. The preparation liquid is product-specific; do not invent a fasting interval.',
    doNot:
        'Do not use an unlisted tube size as though the IFU validated it. Do not place the medicine in a baby bottle. Do not substitute another mixing liquid. Do not use adult 2.5 mg or 5 mg tablet instructions for a child below 35 kg.',
    monitoring:
        'Dose is weight-tiered and must be adjusted as pediatric weight changes. Monitor bleeding and reassess the prescribed presentation whenever the child crosses a weight tier.',
    pediatricNicu:
        'ELIQUIS is not recommended in pediatric patients under 2.6 kg because it was not studied in that group. The availability of a 5 Fr method does not remove this weight limitation or make neonatal dosing automatic.',
    practicalAr:
        'ELIQUIS pediatric 0.5 mg packets لها IFU واضح: حضّرها عادةً في 10 mL ماء/infant formula/apple juice، اسحق وحرّك 5–7 دقائق، ثم عبر NG/G. flush حسب الأنبوب: 5 Fr = 10 mL، 6.5 Fr = 15 mL، 12 Fr = 25 mL. أقل من 2.6 kg غير موصى به حسب الدراسة الحالية.',
    source:
        'DailyMed · ELIQUIS 0.5 mg tablets for oral suspension · FDA Instructions for Use issued Apr 2025',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'Edoxaban SAVAYSA tablets',
    formulation: 'Immediate-release SAVAYSA tablets: 15 mg, 30 mg and 60 mg.',
    status: 'Label-supported crushed gastric-tube method',
    tubeRoute:
        'Gastric feeding tube. The label supports gastric-tube delivery and does not establish jejunal/post-pyloric administration.',
    preparation:
        'Crush the prescribed tablet, mix it with 2 to 3 ounces of water, and administer immediately through the gastric tube.',
    feedPlan:
        'SAVAYSA may be taken with or without food; the current label does not require a routine feed hold for the crushed gastric-tube method.',
    doNot:
        'Do not delay administration after preparing the crushed-water mixture. Do not generalize the gastric-tube instruction to a jejunal tube. Do not alter the prescribed anticoagulant dose based on tube use.',
    monitoring:
        'Review indication, renal function, interacting P-gp medicines and bleeding risk; tube administration does not change those dose-selection requirements.',
    pediatricNicu:
        'This record is not a NICU preparation method. Use only when the prescribed edoxaban regimen is clinically appropriate for the patient; do not extrapolate adult tablet instructions to neonates.',
    practicalAr:
        'SAVAYSA يمكن سحق القرص وخلطه مع 2–3 oz ماء ثم إعطاؤه فورًا عبر gastric tube. الملصق لا يثبت jejunal use ولا يحتاج feed hold روتيني.',
    source:
        'DailyMed · SAVAYSA (edoxaban) tablets · Dosage and Administration / gastric-tube instructions · current label',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'Ticagrelor tablets',
    formulation:
        'Immediate-release ticagrelor tablets, including BRILINTA-type products with label-supported crushing.',
    status: 'Label-supported crushed NG method',
    tubeRoute:
        'Nasogastric tube CH8 or greater into the stomach.',
    preparation:
        'Crush the prescribed tablet and mix with water, then administer the mixture through an NG tube size CH8 or greater. The label does not specify a fixed preparation-water volume, so do not invent one; ensure the complete prepared dose is delivered according to local tube-flush practice.',
    feedPlan:
        'Ticagrelor may be taken with or without food. No routine enteral-feed hold is required by the cited label.',
    doNot:
        'Do not assume smaller NG tubes are validated. Do not change the antiplatelet dose or combine with another oral P2Y12 inhibitor because of tube administration.',
    monitoring:
        'Monitor for bleeding and treatment response; review aspirin dose and clinically important CYP3A interactions according to the prescribed regimen.',
    pediatricNicu:
        'This is not a neonatal tube method. The CH8-or-greater labeled technique and adult antiplatelet indications should not be extrapolated to NICU patients.',
    practicalAr:
        'Ticagrelor يمكن سحقه وخلطه بالماء عبر NG مقاس CH8 أو أكبر إلى المعدة. لا يوجد حجم ماء ثابت في الملصق، لذلك لا نخترع حجمًا. لا يحتاج feed hold روتيني.',
    source:
        'DailyMed · Ticagrelor / BRILINTA tablets · General Administration Instructions and NG bioequivalence data · current 2026 labeling',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'Phenytoin oral suspension 125 mg/5 mL',
    formulation:
        'Immediate-release phenytoin oral suspension 125 mg/5 mL; exact manufacturer/excipients should be checked.',
    status: 'Avoid tube if a suitable alternative exists; major feed interaction',
    tubeRoute:
        'Enteral feeding-tube administration only when no suitable alternative exists. NHS SPS does not provide a universal validated tube size or gastric-vs-jejunal product method for phenytoin.',
    preparation:
        'If enteral-tube use is clinically necessary, use the exact prescribed oral suspension and a local validated tube-administration procedure rather than crushing another phenytoin formulation by assumption. Shake the 125 mg/5 mL suspension well before each use, measure with a calibrated device, administer separately from other medicines and ensure the full dose is delivered.',
    feedPlan:
        'NHS SPS advises withholding enteral feed for 2 hours before and 2 hours after each phenytoin dose because enteral nutrition can markedly reduce absorption.',
    doNot:
        'Do not mix phenytoin directly into enteral feed. Do not assume capsule, chewable-tablet and suspension doses/formulations are interchangeable without review. Do not compensate for reduced absorption by an unmonitored dose increase.',
    monitoring:
        'Monitor serum phenytoin concentrations closely and assess seizure control/toxicity whenever tube route, formulation or feeding pattern changes.',
    pediatricNicu:
        'Phenytoin is used in pediatrics, but this record does not establish a NICU tube recipe or small-bore volume. Neonates need local neonatal dosing, formulation and therapeutic-drug-monitoring protocols.',
    practicalAr:
        'Phenytoin عبر feeding tube ليس خيارًا روتينيًا إذا يوجد بديل. إذا اضطررنا: استخدم suspension المحدد، رجّه جيدًا، وافصل التغذية ساعتين قبل وساعتين بعد الجرعة مع مراقبة مستوى phenytoin. لا تخلطه داخل الـfeed.',
    source:
        'NHS SPS · Managing interactions between medicines and enteral feeds · 18 Sep 2025; DailyMed · Phenytoin oral suspension 125 mg/5 mL · shake-well labeling',
    critical: true,
  ),


  TubeMedicationRecord(
    medicine: 'Levetiracetam tablets for oral suspension',
    formulation:
        'Product-specific levetiracetam tablets designed to disperse for oral suspension; do not substitute ordinary immediate-release tablets by assumption.',
    status: 'Label-supported NG / G-tube method',
    tubeRoute:
        'Nasogastric or gastrostomy tube, French size 10 to 14, as specified in the current label.',
    preparation:
        'Place the prescribed number of whole tablets in a small dosing cup; do not use partial tablets. Add approximately 10 mL room-temperature water and gently swirl until dispersed. Draw the mixture into a 10 mL oral catheter-tip syringe, hold it vertically, and administer immediately through the tube. Then flush the feeding tube twice: each flush uses another 10 mL room-temperature water in the same dosing cup to re-suspend residue, drawn into the same syringe and pushed through immediately.',
    feedPlan:
        'May be administered with or without food. The label does not require a routine enteral-feed hold for this tube method.',
    doNot:
        'Do not use partial tablets. Do not copy this method to ordinary levetiracetam tablets or to an unlisted tube size without product-specific support.',
    monitoring:
        'Monitor seizure control and tolerability. Dose selection remains indication-, age-, weight- and renal-function dependent.',
    pediatricNicu:
        'This formulation has pediatric labeling, but the tube IFU does not establish a neonatal method. The initial 10 mL dispersion plus two additional 10 mL flush cycles may be excessive for neonates or fluid-restricted small infants; do not proportionally scale the labeled volumes by guesswork.',
    practicalAr:
        'Levetiracetam tablets for oral suspension لها طريقة NG/G موثقة لمقاس 10–14 Fr: استخدم whole tablets فقط، مع نحو 10 mL ماء بدرجة الغرفة، أعطِ فورًا ثم اعمل flush مرتين؛ كل مرة 10 mL ماء إضافي لإخراج البقايا. لا تعممها على levetiracetam tablets العادية.',
    source:
        'DailyMed · Levetiracetam tablets for oral suspension · NG/G-tube Administration · Rev. 07/2025',
  ),
  TubeMedicationRecord(
    medicine: 'Baclofen oral suspension 5 mg/mL',
    formulation:
        'Baclofen oral suspension 25 mg/5 mL (5 mg/mL); product concentration must be verified before dose-volume calculation.',
    status: 'Label-supported NG method',
    tubeRoute:
        'Nasogastric tube size 8 French or larger.',
    preparation:
        'Shake the suspension well. Before the dose, flush the NG tube with 15 to 30 mL purified water. Draw the prescribed dose into an oral/enteral syringe and administer through the tube. If drug remains in the syringe, draw purified water into the syringe, shake gently and administer the residue. After the dose, flush the tube with at least 25 mL purified water. The label states the medication may remain in the dosing syringe for up to 4 hours before administration.',
    feedPlan:
        'The current label does not require a routine enteral-feed hold; this record is about the specific NG delivery method.',
    doNot:
        'Do not assume another baclofen liquid has the same concentration or NG instructions. Do not reduce the labeled flush volumes for a small-bore pediatric patient without a validated local method.',
    monitoring:
        'Verify dose and concentration carefully. Avoid abrupt discontinuation because clinically important withdrawal can occur; monitor sedation and clinical response.',
    pediatricNicu:
        'The labeled 15–30 mL pre-flush plus at least 25 mL post-flush is usually unsuitable for neonates/small infants. This is not a NICU-volume recipe and must not be scaled down empirically.',
    practicalAr:
        'Baclofen suspension 5 mg/mL عبر NG ≥8 Fr: رجّ جيدًا، pre-flush بـ15–30 mL purified water، أعطِ الجرعة، ثم post-flush لا يقل عن 25 mL. هذه الأحجام ليست مناسبة تلقائيًا للـNICU ولا تُصغّر بالتخمين.',
    source:
        'DailyMed · Baclofen oral suspension 25 mg/5 mL · Nasogastric Tube Administration · current label',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'LYVISPAH baclofen granules',
    formulation:
        'Baclofen oral granules supplied in single-dose packets; the entire packet is used for the prescribed packet strength.',
    status: 'Label-supported NG / G / PEG / GJ methods',
    tubeRoute:
        'NG tube 8 Fr or larger; G-tube 12 Fr or larger; PEG 14 Fr or larger; GJ tube 16 Fr or larger.',
    preparation:
        'Flush the feeding tube with up to 15 mL water using a catheter-tip syringe. Open one packet and empty the full contents into 15 mL liquid such as apple juice or milk; mix so all granules are wetted. Draw into a dosing syringe immediately and administer through the tube within 2 hours of mixing. If the syringe stands for 15 minutes before administration, invert it three times. Refill the dosing syringe with 15 mL water and flush the tube. If multiple packets are prescribed, mix each packet separately in its own 15 mL liquid volume.',
    feedPlan:
        'The label does not require a routine enteral-feed hold for the feeding-tube method.',
    doNot:
        'Do not combine multiple packets into one shared 15 mL preparation. Do not use a smaller tube than the product-specific minimum for that tube type. Do not transfer these granule instructions to baclofen tablets or another suspension.',
    monitoring:
        'Verify packet strength and total prescribed dose. Monitor sedation, weakness and clinical response; avoid abrupt discontinuation.',
    pediatricNicu:
        'Although the product supports several enteral tube types including GJ, the 15 mL preparation plus flush volume can be excessive in small infants. Do not treat this as a neonatal-volume protocol.',
    practicalAr:
        'LYVISPAH له tube sizes مختلفة حسب النوع: NG ≥8 Fr، G ≥12، PEG ≥14، GJ ≥16. كل packet يُخلط منفردًا في 15 mL liquid، ويُعطى خلال ساعتين، ثم flush بـ15 mL ماء. إذا بقيت السرنجة 15 دقيقة اقلبها 3 مرات قبل الإعطاء.',
    source:
        'DailyMed · LYVISPAH (baclofen) oral granules · Administration via Feeding Tube · current labeling',
  ),
  TubeMedicationRecord(
    medicine: 'Carglumic acid tablets for oral suspension',
    formulation:
        'Carglumic acid 200 mg tablet for oral suspension, functionally scored into quarters.',
    status: 'Label-supported NG / G-tube method including pediatric use from birth',
    tubeRoute:
        'Nasogastric or gastrostomy tube; the current label provides a water-dispersion method without a stated minimum French size.',
    preparation:
        'Add a minimum of 2.5 mL water to a small cup for each whole, half or quarter tablet needed for the prescribed dose. Add the tablet portion(s), carefully stir, draw the mixture into a catheter-tip syringe and administer immediately through the NG or G-tube. Undissolved pieces may remain. Flush immediately with 1 to 2 mL additional water and repeat flushing as needed until no tablet pieces remain in the syringe or tube.',
    feedPlan:
        'Administer immediately before meals or feedings. Water is the studied preparation vehicle; use in other foods or liquids is not recommended by the label.',
    doNot:
        'Do not swallow the tablet whole and do not crush it. Do not mix with food, formula or another liquid instead of water. Do not leave residual tablet pieces in the syringe or tube.',
    monitoring:
        'This is specialist metabolic therapy. Closely monitor plasma ammonia and titrate the prescribed dose to the patient’s age and clinical condition; renal impairment changes dosing.',
    pediatricNicu:
        'The label establishes use from birth to 17 years for NAGS-deficiency hyperammonemia and states treatment may begin as soon as birth when the diagnosis is suspected. This is therefore directly relevant to neonatal care, but dose selection and ammonia-lowering co-therapy remain metabolic-specialist decisions.',
    practicalAr:
        'Carglumic acid مهم للـNICU لأن الملصق يدعم الاستخدام منذ الولادة في NAGS deficiency. للـNG/G: حد أدنى 2.5 mL ماء لكل whole/half/quarter tablet، حرّك وأعطِ فورًا، ثم flush بـ1–2 mL وكرر حتى لا تبقى قطع. لا تسحقه ولا تخلطه مع formula.',
    source:
        'DailyMed · Carglumic acid tablets for oral suspension · revised Mar 2026 · NG/G-tube Instructions for Use',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'TAFINLAR dabrafenib tablets for oral suspension',
    formulation:
        'Dabrafenib tablets for oral suspension; separate from TAFINLAR capsules, which must not be opened, crushed or broken.',
    status: 'FDA-IFU supported pediatric feeding-tube method',
    tubeRoute:
        'Feeding tube 10 Fr or larger for 1 to 3 tablets; 12 Fr or larger for 4 to 15 tablets. The label does not specify a gastric-vs-jejunal destination, so do not invent one.',
    preparation:
        'Prepare 1 to 4 tablets in approximately 5 mL water, or 5 to 15 tablets in approximately 10 mL water, in the provided dosing cup. Gently stir until fully dispersed/dissolved; this may take at least 3 minutes. Administer immediately and discard if not used within 30 minutes. For feeding-tube dosing, pre-flush the tube with drinking water, draw up the full suspension in an oral syringe and administer. Then follow the IFU residue-rinse sequence using about 5 mL water and repeat Steps 4 through 7 three times to deliver remaining medicine, followed by a final drinking-water tube flush.',
    feedPlan:
        'Give on an empty stomach: at least 1 hour before or 2 hours after a meal. For a pediatric patient unable to tolerate fasting, breastfeeding and/or baby formula may be given on demand according to the label.',
    doNot:
        'Do not swallow the tablets for oral suspension whole, chew them or crush them. Do not use the capsule formulation for this tube method. Do not keep a prepared suspension beyond 30 minutes. Follow spill/skin/eye exposure precautions from the product IFU.',
    monitoring:
        'This is oncology therapy. Dose and combination treatment are protocol-specific; monitor according to the oncology regimen and exact indication.',
    pediatricNicu:
        'This is a pediatric oncology formulation, not a general NICU medicine. The smallest labeled feeding-tube method begins at 10 Fr, and the preparation/rinse volumes must not be adapted to neonates without specialist product-specific validation.',
    practicalAr:
        'TAFINLAR tablets for oral suspension: 1–4 tablets مع نحو 5 mL ماء، و5–15 tablets مع نحو 10 mL، تحريك ≥3 دقائق، ويجب الاستخدام خلال 30 دقيقة. للـtube: 1–3 tablets تحتاج ≥10 Fr و4–15 تحتاج ≥12 Fr. أعطه على معدة فارغة 1 ساعة قبل أو 2 ساعة بعد الطعام.',
    source:
        'DailyMed · TAFINLAR (dabrafenib) tablets for oral suspension · revised Mar 2026 · FDA Instructions for Use',
    critical: true,
  ),


  TubeMedicationRecord(
    medicine: 'LINZESS linaclotide capsules',
    formulation:
        'Linaclotide capsules containing drug-coated beads; exact capsule strength remains indication- and age-specific.',
    status: 'Label-supported NG / G-tube method',
    tubeRoute:
        'Nasogastric or gastrostomy tube. The current label does not specify a minimum French size; use an appropriately sized catheter-tip syringe.',
    preparation:
        'Open the capsule and empty all beads into a clean container with 30 mL room-temperature bottled water. Gently swirl for at least 20 seconds. Draw the beads/water mixture into an appropriately sized catheter-tip syringe and administer with rapid, steady pressure at approximately 10 mL per 10 seconds. If beads remain in the container, add another 30 mL water, swirl for at least 20 seconds and repeat. After the dose, flush the NG/G tube with at least 10 mL water. The label notes that the medicine dissolves off the bead surface, so it is not necessary to force every bead through the tube to deliver the full dose.',
    feedPlan:
        'Give on an empty stomach at least 30 minutes before a meal, at approximately the same time each day.',
    doNot:
        'Do not crush or chew the capsule contents. Do not use another liquid or soft food for the tube method. Do not store the bead-water mixture for later use.',
    monitoring:
        'Monitor bowel response and clinically important diarrhea/dehydration. If severe diarrhea occurs, stop the medicine and contact the prescriber.',
    pediatricNicu:
        'Current labeling includes selected pediatric indications from age 2 years, but LINZESS is contraindicated in patients younger than 2 years because of the risk of serious dehydration. This is not a neonatal/NICU tube method.',
    practicalAr:
        'LINZESS عبر NG/G: افتح الكبسولة وضع الحبيبات في 30 mL bottled water بدرجة الغرفة، حرّك ≥20 ثانية، أعطِ بسرعة ثابتة تقريبًا 10 mL/10 sec، كرر 30 mL إذا بقيت حبيبات، ثم flush ≥10 mL. يُعطى قبل الطعام بـ30 دقيقة ولا تُسحق الحبيبات.',
    source:
        'DailyMed · LINZESS (linaclotide) capsules · Administration with Water via Nasogastric or Gastrostomy Tube · current labeling',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'TAGRISSO osimertinib tablets',
    formulation:
        'Osimertinib tablets dispersed in non-carbonated water without crushing; this method is distinct from simply crushing a tablet.',
    status: 'Label-supported NG method',
    tubeRoute:
        'Nasogastric tube. The label provides an NG method and does not establish gastrostomy or jejunal administration by extrapolation.',
    preparation:
        'For NG administration, place the prescribed TAGRISSO tablet in 15 mL non-carbonated water and stir until dispersed into small pieces; the tablet will not completely dissolve. Do not crush, heat or ultrasonicate. Use an additional 15 mL non-carbonated water to transfer any residue to the syringe, producing about 30 mL total. Administer through the NG tube, then flush with approximately 30 mL water. Repeat the rinse/flush as needed until no tablet pieces remain in the syringe. Administer the dispersion and all residues within 30 minutes of first adding the tablet to water.',
    feedPlan:
        'TAGRISSO may be given with or without food; no routine enteral-feed hold is required by the label.',
    doNot:
        'Do not crush, heat or use ultrasound. Do not use carbonated water or another liquid. Do not transfer the NG method to a G-tube or jejunal tube without separate product-specific support.',
    monitoring:
        'This is oncology therapy. Monitor according to the EGFR-mutated lung-cancer regimen, including clinically relevant cardiac/QT, pulmonary and hematologic safety parameters.',
    pediatricNicu:
        'This is not a pediatric or NICU tube method. The labeled preparation and flush volumes are adult oncology instructions and must not be scaled to neonates.',
    practicalAr:
        'TAGRISSO عبر NG فقط: tablet في 15 mL ماء غير غازي، حرّك دون سحق، ثم 15 mL إضافية لنقل البقايا؛ أعطِ نحو 30 mL عبر NG ثم flush بنحو 30 mL. يجب إنهاء التحضير والبقايا خلال 30 دقيقة.',
    source:
        'DailyMed · TAGRISSO (osimertinib) tablets · Administration to Patients Who Have Difficulty Swallowing Solids · current label',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'LENVIMA lenvatinib capsules',
    formulation:
        'Lenvatinib capsules prepared as a water suspension for feeding-tube delivery without breaking or crushing the capsules.',
    status: 'Label-supported feeding-tube method with material-specific minimum bore',
    tubeRoute:
        'Feeding tube at least 5 French for polyvinyl chloride or polyurethane tubing, and at least 6 French for silicone tubing.',
    preparation:
        'Place the prescribed daily dose, up to 5 capsules, into a 20 mL syringe. Add 3 mL water. Wait 10 minutes for the capsule shell to fully disintegrate, then stir or shake for 3 minutes until the capsules are fully disintegrated. Administer the mixture through the feeding tube. Then use a second syringe to add another 2 mL water to the first syringe, cap it, swirl or shake, and administer the rinse. Repeat the 2 mL rinse at least once and continue until no visible residue remains. If the daily dose requires 6 capsules, prepare and administer 3 capsules at a time using the same method.',
    feedPlan:
        'LENVIMA may be taken with or without food. The label does not require a routine enteral-feed hold for tube administration.',
    doNot:
        'Do not break or crush the capsules. For feeding-tube administration use water, not apple juice. Do not ignore tube material: silicone requires at least 6 Fr, while PVC/polyurethane requires at least 5 Fr.',
    monitoring:
        'Oncology monitoring is regimen-specific and includes blood pressure, renal/hepatic function, proteinuria, thyroid function and other toxicity surveillance as clinically indicated.',
    pediatricNicu:
        'This current feeding-tube method is not a NICU recipe. Although the minimum bore can be small, the oncology indication and capsule-dose regimen must not be extrapolated to neonates or small infants.',
    practicalAr:
        'LENVIMA feeding tube: PVC/polyurethane ≥5 Fr، silicone ≥6 Fr. ضع حتى 5 capsules في syringe 20 mL، أضف 3 mL ماء، انتظر 10 دقائق ثم رج/حرّك 3 دقائق، أعطِ الخليط، ثم rinse بـ2 mL ماء وكرر مرة على الأقل حتى لا تبقى بقايا. لا تسحق الكبسولات.',
    source:
        'DailyMed · LENVIMA (lenvatinib) capsules · Preparation of Suspension for Feeding-Tube Administration · current label',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'MEKINIST trametinib oral solution',
    formulation:
        'Pharmacist-reconstituted trametinib oral solution, final concentration 0.05 mg/mL.',
    status: 'FDA-IFU supported NG / G-tube method',
    tubeRoute:
        'Nasogastric or gastric feeding tube, 4 French or larger. The IFU specifies use of the supplied 20 mL oral syringe and an ENFIT adapter when needed.',
    preparation:
        'Pharmacy reconstitution: tap the bottle until the powder flows freely, add 90 mL distilled or purified water, replace the cap and invert or gently shake for up to 5 minutes until fully dissolved. Final concentration is 0.05 mg/mL. For tube dosing, measure the prescribed dose with the supplied 20 mL oral syringe, flush the feeding tube according to the tube manufacturer instructions immediately before the dose, connect the syringe, apply steady pressure to deliver the full dose, confirm no solution remains in the syringe and repeat delivery if needed, then flush the tube again according to manufacturer instructions. Reconstituted solution may be used for 35 days, stored in the original bottle below 25°C, and must not be frozen.',
    feedPlan:
        'When MEKINIST oral solution is given alone, it may be given with a low-fat meal or on an empty stomach. When coadministered with dabrafenib, give on an empty stomach at least 1 hour before or 2 hours after a meal; breastfeeding or baby formula may be given on demand if a pediatric patient cannot tolerate fasting.',
    doNot:
        'Do not transfer this feeding-tube method to MEKINIST tablets. Do not use a tube smaller than 4 Fr. Do not invent a universal flush volume because the IFU directs pre- and post-flushing according to the feeding-tube manufacturer instructions.',
    monitoring:
        'This is oncology therapy. Dose is age/weight/regimen specific in pediatrics and toxicity monitoring follows the exact trametinib treatment protocol.',
    pediatricNicu:
        'The oral-solution formulation is pediatric-capable, but the current dosing tables begin at 8 kg. A 4 Fr tube does not make the product an automatic neonatal/NICU option; weight and indication criteria still apply.',
    practicalAr:
        'MEKINIST oral solution تركيزه 0.05 mg/mL بعد تحضير الصيدلي بـ90 mL distilled/purified water. يمكن عبر NG/G ≥4 Fr باستخدام syringe 20 mL. اعمل flush قبل وبعد حسب تعليمات الشركة المصنّعة للأنبوب؛ لا نخترع حجم flush ثابتًا.',
    source:
        'DailyMed · MEKINIST (trametinib) for oral solution · FDA Instructions for Use · current 2026 labeling',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'Glycerol phenylbutyrate oral liquid 1.1 g/mL',
    formulation:
        'Glycerol phenylbutyrate oral liquid 1.1 g/mL; separate from sodium phenylbutyrate products and other nitrogen-scavenger formulations.',
    status: 'Label-supported NG / G-tube method with small-dose delivery warning',
    tubeRoute:
        'Nasogastric or gastrostomy tube for patients who cannot swallow. The label does not provide a minimum French size.',
    preparation:
        'Use a new dry oral syringe for each prescribed dose. Withdraw the exact prescribed volume from the bottle and administer directly through the NG/G tube. Using a separate syringe, flush once with 10 mL water or formula and allow the flush to drain. If needed, flush a second time with another 10 mL water or formula to clear the tube. Discard the bottle and any remaining contents 28 days after opening; if water enters the bottle and the liquid becomes cloudy, do not use it.',
    feedPlan:
        'Give with food or formula. In breastfeeding infants, administer the dose just before breastfeeding.',
    doNot:
        'Do not substitute sodium phenylbutyrate or another nitrogen-scavenger formulation by volume. Do not assume reliable tube delivery for doses below 1 mL: the label warns that drug adherence to plastic tubing can reduce the delivered dose.',
    monitoring:
        'Monitor plasma ammonia and the broader urea-cycle-disorder treatment plan. For tube doses below 1 mL, closely monitor ammonia after initiation or dose changes because delivered dose may be lower than intended.',
    pediatricNicu:
        'This is directly relevant to neonatal metabolic care: glycerol phenylbutyrate has been studied in patients younger than 2 months, including infants enrolled from about 0.1 month of age. However, tube doses below 1 mL have a specific under-delivery risk, so neonatal use requires close ammonia-guided specialist management.',
    practicalAr:
        'Glycerol phenylbutyrate 1.1 g/mL عبر NG/G: استخدم syringe جافة جديدة للجرعة، أعطِ الجرعة ثم flush بـ10 mL ماء أو formula؛ يمكن تكرار 10 mL مرة ثانية إذا لزم. إذا الجرعة <1 mL قد يلتصق الدواء بالأنبوب ويصل أقل من المطلوب، لذلك يجب مراقبة ammonia بدقة.',
    source:
        'DailyMed · Glycerol phenylbutyrate oral liquid 1.1 g/mL · NG/G-tube administration section · current Mar 2026 labeling',
    critical: true,
  ),


  TubeMedicationRecord(
    medicine: 'EPIDIOLEX cannabidiol oral solution',
    formulation:
        'Cannabidiol oral solution 100 mg/mL; enteral-tube compatibility is material-specific and should not be generalized to other cannabidiol products.',
    status: 'Label-supported enteral use through selected silicone feeding tubes',
    tubeRoute:
        'Silicone feeding tubes such as nasogastric or gastrostomy tubes. Avoid polyvinyl chloride (PVC) and polyurethane tubes. Also avoid short, narrow silicone NG tubes such as those less than 50 cm long and less than 5 Fr.',
    preparation:
        'Measure the prescribed dose with the calibrated 1 mL or 5 mL oral syringe supplied for the product. When enteral administration is necessary, give the measured dose through the compatible silicone feeding tube. Flush after each dose with room-temperature drinking water using approximately 5 times the priming volume of the tube; modify the flush volume when clinically necessary for fluid restriction.',
    feedPlan:
        'Food can change cannabidiol exposure. Keep administration consistent in relation to meals rather than alternating unpredictably between fed and fasting conditions.',
    doNot:
        'Do not use PVC or polyurethane feeding tubes. Do not assume every silicone NG tube is suitable; avoid very short/narrow silicone NG tubing such as <50 cm and <5 Fr. Do not substitute a household spoon for the calibrated syringe.',
    monitoring:
        'Monitor seizure response, sedation and clinically important drug interactions. Follow liver-function monitoring and dose-adjustment recommendations from the current EPIDIOLEX regimen.',
    pediatricNicu:
        'EPIDIOLEX has pediatric indications, but the tube instructions do not make it a neonatal/NICU product. In very small or fluid-restricted children, use the label\'s tube-material restrictions and individualize the post-dose flush rather than automatically giving an adult-sized volume.',
    practicalAr:
        'EPIDIOLEX يمكن إعطاؤه عبر silicone NG/G tube فقط عند الحاجة. لا تستخدم PVC أو polyurethane، وتجنب silicone NG القصير والرفيع مثل <50 cm و<5 Fr. بعد الجرعة flush بماء الشرب بدرجة الغرفة بحجم يقارب 5× priming volume للأنبوب مع تعديل الحجم إذا كان المريض fluid-restricted.',
    source:
        'DailyMed · EPIDIOLEX (cannabidiol) oral solution · enteral feeding-tube administration section · current 2026 labeling',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'FINTEPLA fenfluramine oral solution',
    formulation:
        'Fenfluramine oral solution 2.2 mg/mL supplied for seizure disorders under the product-specific monitoring program.',
    status: 'Label-supported gastric / NG tube compatibility',
    tubeRoute:
        'Commercially available gastric and nasogastric feeding tubes. The current label does not specify a minimum French size, tube material, or a fixed flush volume.',
    preparation:
        'Measure the prescribed dose with the calibrated 3 mL or 6 mL oral syringe supplied by the pharmacy and administer through the gastric or NG tube. Because the label establishes tube compatibility but does not provide a universal flush volume or tube-size method, follow the feeding-tube manufacturer/local validated flushing procedure rather than inventing a product volume.',
    feedPlan:
        'May be given with or without food; no routine enteral-feed hold is required by the label.',
    doNot:
        'Do not invent a minimum French size or fixed flush volume. Do not use household teaspoons or tablespoons. Do not stop FINTEPLA abruptly unless clinically required; antiseizure withdrawal is normally gradual.',
    monitoring:
        'FINTEPLA requires the product-specific cardiac safety program, including echocardiographic monitoring for valvular heart disease and pulmonary arterial hypertension, plus seizure/tolerability review.',
    pediatricNicu:
        'Current labeling is for Dravet syndrome and Lennox-Gastaut syndrome in patients 2 years of age and older. Tube compatibility therefore does not establish neonatal or infant use below the labeled age range.',
    practicalAr:
        'FINTEPLA 2.2 mg/mL متوافق مع gastric وNG feeding tubes. الملصق لا يعطي minimum Fr ولا flush volume ثابت، لذلك لا نخترع أرقامًا؛ نقيس الجرعة بالـ3 أو 6 mL syringe ونستخدم flushing procedure المعتمدة للأنبوب.',
    source:
        'DailyMed · FINTEPLA (fenfluramine) oral solution · Administration Instructions · revised Oct 2025',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'DAYBUE trofinetide oral solution',
    formulation:
        'Trofinetide oral solution 200 mg/mL for Rett syndrome; this record is for the ready oral solution, not a generic trofinetide preparation.',
    status: 'Label-supported G-tube / gastric-port method',
    tubeRoute:
        'Gastrostomy (G) tube. If a gastrojejunal (GJ) tube is present, administer through the G-port only. The label does not establish direct jejunal-port or nasogastric administration.',
    preparation:
        'Measure the prescribed weight-based volume with a calibrated oral syringe or oral dosing cup and administer through the G-tube or the G-port of a GJ tube. The label does not specify a fixed flush volume or minimum French size, so use the local validated tube-flush procedure instead of inventing one. Keep the bottle refrigerated at 2°C to 8°C, upright, and discard unused oral solution 14 days after first opening.',
    feedPlan:
        'May be administered with or without food.',
    doNot:
        'Do not administer a GJ dose through the J-port. Do not extrapolate this record to an NG tube. Do not use a household measuring cup, teaspoon or tablespoon.',
    monitoring:
        'Diarrhea can be frequent and may be severe; monitor hydration and weight, and follow the prescribed interruption/reduction plan when severe diarrhea, dehydration or significant weight loss occurs.',
    pediatricNicu:
        'DAYBUE is labeled for Rett syndrome in patients 2 years of age and older, with current weight-based dosing beginning at 9 kg. This is not a neonatal or NICU tube method.',
    practicalAr:
        'DAYBUE oral solution 200 mg/mL يمكن عبر G-tube، وإذا كان GJ فيجب الإعطاء من G-port فقط وليس J-port. لا توجد طريقة NG مثبتة في الملصق. يُحفظ مبردًا ويُتلف بعد 14 يومًا من فتح العبوة.',
    source:
        'DailyMed · DAYBUE (trofinetide) oral solution · Dosage and Administration / G-tube and GJ G-port instructions · current 2026 label',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'EVRYSDI risdiplam oral solution 0.75 mg/mL',
    formulation:
        'Pharmacist-constituted risdiplam oral solution, 60 mg/80 mL (0.75 mg/mL).',
    status: 'FDA-IFU supported NG / G-tube method including infants',
    tubeRoute:
        'Nasogastric or gastrostomy tube. The current oral-solution IFU provides the same immediate post-dose water-flush range for either route.',
    preparation:
        'Healthcare-provider constitution: add 79 mL purified water to the powder bottle to yield 0.75 mg/mL, cap and shake well for 15 seconds, then wait 10 minutes; if the solution is not clear, shake again for another 15 seconds or until clear. For a tube dose, draw the prescribed volume using the supplied reusable oral syringe and give the full dose through the NG or G-tube. Check that no EVRYSDI remains in the syringe, then flush the tube immediately with 10 to 20 mL water. Give the drawn-up dose promptly; if it is not administered within 5 minutes of drawing it up, discard that syringe contents and prepare a new dose. Refrigerated constituted solution is discarded 64 days after constitution.',
    feedPlan:
        'Give once daily with or without a meal at approximately the same time each day. In breastfed infants it may be given before or after breastfeeding. Do not mix the oral solution with formula or milk.',
    doNot:
        'Do not dispense or use the product as powder; the pharmacy must constitute it before patient use. Do not mix with formula or milk. Do not store a measured dose in the syringe beyond the label window.',
    monitoring:
        'Dose is age- and weight-dependent. Monitor SMA response and treatment tolerability, and reassess the measured volume whenever weight-based dosing changes.',
    pediatricNicu:
        'This formulation is directly relevant to very young infants: the current dosing table includes patients younger than 2 months. The labeled NG/G method and 10–20 mL flush are product instructions, but fluid-restricted neonates still require a patient-specific tube/fluid plan rather than silent volume reduction.',
    practicalAr:
        'EVRYSDI oral solution: الصيدلي يضيف 79 mL purified water ليصبح 0.75 mg/mL، يرج 15 ثانية وينتظر 10 دقائق. للـNG/G أعطِ الجرعة بالـsyringe المرفق ثم flush فورًا بـ10–20 mL ماء. إذا بقيت الجرعة في السرنجة أكثر من 5 دقائق لا تستخدمها.',
    source:
        'DailyMed · EVRYSDI (risdiplam) for oral solution · FDA Instructions for Constitution and Use · current Feb 2026 labeling',
    critical: true,
  ),
  TubeMedicationRecord(
    medicine: 'EVRYSDI risdiplam 5 mg tablet dispersion',
    formulation:
        'EVRYSDI 5 mg tablet dispersed in non-chlorinated drinking water; this method is separate from the 0.75 mg/mL oral solution.',
    status: 'FDA-IFU supported NG / G-tube tablet-dispersion method',
    tubeRoute:
        'Nasogastric or gastrostomy tube at least 8 French.',
    preparation:
        'Place one 5 mg tablet in a small cup with 5 mL room-temperature non-chlorinated drinking water such as filtered water. Gently swirl for up to 3 minutes until mixed; some particles may remain. Administer the dispersion through the NG/G tube immediately and within 10 minutes of adding water. Refill the cup with at least 15 mL non-chlorinated drinking water, swirl to collect remaining medicine, draw up the rinse and administer it through the tube to deliver the residue.',
    feedPlan:
        'Give once daily with or without a meal at approximately the same time each day.',
    doNot:
        'Do not chew, cut or crush the tablet. Do not disperse it in any liquid other than room-temperature non-chlorinated drinking water. Do not use a feeding tube smaller than 8 Fr. Discard the dispersion if not administered within 10 minutes.',
    monitoring:
        'The tablet is only for patients prescribed the 5 mg dose. Monitor SMA response and confirm that a formulation switch does not accidentally change the prescribed dose.',
    pediatricNicu:
        'The tablet option is for patients receiving the fixed 5 mg dose and is not a neonatal formulation. Young infants use the weight-based oral-solution pathway instead.',
    practicalAr:
        'EVRYSDI 5 mg tablet للـNG/G ≥8 Fr: ضع الحبة في 5 mL ماء شرب non-chlorinated بدرجة الغرفة، حرّك حتى 3 دقائق، أعطِ خلال 10 دقائق، ثم rinse الكوب بـ≥15 mL من نفس الماء وأعطه عبر الأنبوب. لا تسحق الحبة ولا تستخدم سائلًا آخر.',
    source:
        'DailyMed · EVRYSDI (risdiplam) 5 mg tablet · FDA Instructions for Use · approved Feb 2026',
    critical: true,
  ),

];

const tubeSafetyRules = <TubeSafetyRule>[
  TubeSafetyRule(
    title: 'Modified-release / prolonged-release products',
    action:
        'Do not routinely crush or open. Verify the exact product and release mechanism; choose a suitable alternative formulation when the release system would be destroyed.',
    why:
        'Crushing can release the whole dose rapidly or change the intended absorption profile.',
    source: 'NHS SPS · Choosing medicines for enteral tube administration · 2025',
    critical: true,
  ),
  TubeSafetyRule(
    title: 'Enteric-coated / gastro-resistant products',
    action:
        'Do not routinely crush. Verify whether an alternative formulation or a validated tube method exists for the exact product.',
    why:
        'Destroying the coating can expose an acid-labile drug, irritate the stomach or change the intended site of release.',
    source: 'NHS SPS · Swallowing difficulties / enteral tube guidance · 2025–2026',
    critical: true,
  ),
  TubeSafetyRule(
    title: 'Hazardous handling',
    action:
        'Avoid open crushing when occupational exposure is a concern. Assess PPE, containment and alternative formulations for cytotoxic, teratogenic, hormonal, selected antibiotic or immunosuppressive medicines.',
    why:
        'Crushing/opening can generate powder or droplets that expose staff, carers or family members.',
    source: 'NHS SPS · Choosing medicines for enteral tube administration · 2025',
    critical: true,
  ),
  TubeSafetyRule(
    title: 'Liquids are not automatically safer',
    action:
        'Check concentration, viscosity, osmolality, sorbitol/excipients, sodium load and tube compatibility before selecting a liquid.',
    why:
        'Viscous liquids can resist flushing; hyperosmolar or sorbitol-rich products can cause GI intolerance, and some formulations may block small-bore tubes.',
    source: 'NHS SPS · Choosing medicines for enteral tube administration · 2025',
  ),
  TubeSafetyRule(
    title: 'Granules / effervescent products',
    action:
        'Verify particle size and whether complete dispersion is possible before use through the actual tube bore.',
    why:
        'Large granules, gels, gas production or sediment can obstruct the tube.',
    source: 'NHS SPS · Choosing medicines for enteral tube administration · 2025',
  ),
  TubeSafetyRule(
    title: 'Gastric vs post-pyloric tube',
    action:
        'Confirm the tube tip location before recommending administration. Do not assume gastric and jejunal delivery are interchangeable.',
    why:
        'Site of absorption, first-pass metabolism and local drug action can change when the stomach is bypassed.',
    source: 'NHS SPS · Choosing medicines for enteral tube administration · 2025',
    critical: true,
  ),
];

const injectableEnteralSafetyRules = <TubeSafetyRule>[
  TubeSafetyRule(
    title: 'No blanket permission',
    action:
        'Do not label an ampoule/vial as drinkable or tube-safe merely because it is injectable. Verify the exact formulation and a licensed or supported enteral route.',
    why:
        'Most injections are not licensed for enteral use, and excipients, pH, bioavailability and acid stability can differ from oral formulations.',
    source: 'NHS SPS · Assessing injectables for enteral administration · updated 2026',
    critical: true,
  ),
  TubeSafetyRule(
    title: 'Document off-label enteral use',
    action:
        'When an injectable is deliberately used enterally, document the product, route, preparation method and monitoring plan in the medication record/care plan.',
    why:
        'Complex manipulation and off-label use introduce additional error and monitoring requirements.',
    source: 'NHS SPS · Assessing injectables for enteral administration · updated 2026',
  ),
  TubeSafetyRule(
    title: 'Glass ampoules need appropriate withdrawal equipment',
    action:
        'Use locally approved equipment such as a filter straw/needle when required, then transfer to an enteral/oral syringe for administration.',
    why:
        'This reduces the risk of glass-particle ingestion and route-selection errors.',
    source: 'NHS SPS · Assessing injectables for enteral administration · updated 2026',
  ),
];
