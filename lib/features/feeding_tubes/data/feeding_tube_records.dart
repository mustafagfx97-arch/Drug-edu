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
