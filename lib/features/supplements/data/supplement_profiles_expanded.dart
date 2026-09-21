import '../../../core/models/medication.dart';
import '../domain/supplement_profile.dart';

const expandedSupplementProfiles = <SupplementProfile>[
  SupplementProfile(
    id: 'oral-iron-salts',
    group: 'Minerals',
    name: 'Iron',
    subtitle: 'Elemental iron · salt/form comparison',
    formulation: 'Ferrous salts, chelates, carbonyl iron and other oral iron products',
    searchTerms: [
      'ferrous sulfate',
      'ferrous fumarate',
      'ferrous gluconate',
      'iron bisglycinate',
      'carbonyl iron',
      'elemental iron',
    ],
    howToTakeEn:
        'Counsel by ELEMENTAL iron, not salt weight. Absorption is generally best away from food, calcium and antacids, but a small amount of food can be used when GI intolerance threatens adherence. Product/formulation instructions take priority.',
    formulationAlert:
        'Never copy the same tablet count between iron salts. Ferrous fumarate is about 33% elemental iron, ferrous sulfate about 20%, and ferrous gluconate about 12% by weight; the label elemental-iron amount is the value to dose from.',
    useBasis: 'Laboratory/risk-based replacement or prevention',
    monitoringEn:
        'For treatment, define the cause and follow CBC/ferritin or other iron studies as appropriate. Do not continue therapeutic-dose iron indefinitely without evidence of need and response.',
    saltVariants: [
      SupplementSaltVariant(
        id: 'ferrous-sulfate',
        name: 'Ferrous sulfate',
        formula: 'Common oral salt; hydration state/product matters',
        elementalAmount: 'Dose from the label elemental-iron amount.',
        elementalPercent: 'About 20% elemental iron by weight (NIH ODS).',
        example:
            'A common “325 mg ferrous sulfate” tablet supplies about 65 mg elemental iron.',
        practicalUse:
            'Most familiar, inexpensive replacement salt; strong evidence base and common first choice when tolerated.',
        administration:
            'Best absorbed away from food; may take with a small amount of food for nausea. Separate from calcium/antacids and interacting medicines.',
        cautions:
            'Constipation, nausea and dark stool are common. Keep securely away from children because overdose can be fatal.',
        source: 'NIH ODS Iron Fact Sheet + product label elemental amount',
      ),
      SupplementSaltVariant(
        id: 'ferrous-fumarate',
        name: 'Ferrous fumarate',
        elementalAmount: 'Dose from elemental iron on the label.',
        elementalPercent: 'About 33% elemental iron by weight (NIH ODS).',
        example:
            'A 300 mg ferrous fumarate amount is roughly 99 mg elemental iron; commercial strengths vary.',
        practicalUse:
            'Higher elemental fraction per gram can reduce salt mass/tablet bulk.',
        administration:
            'Same separation principles as other oral iron salts; food may be used if needed for tolerability.',
        cautions:
            'Do not assume fewer milligrams means a weaker iron dose; compare ELEMENTAL iron.',
        source: 'NIH ODS Iron Fact Sheet',
      ),
      SupplementSaltVariant(
        id: 'ferrous-gluconate',
        name: 'Ferrous gluconate',
        elementalAmount: 'Dose from elemental iron on the product label.',
        elementalPercent: 'About 12% elemental iron by weight (NIH ODS).',
        example:
            'A common 325 mg ferrous gluconate tablet supplies about 35–38 mg elemental iron depending on product.',
        practicalUse:
            'Lower elemental amount per tablet can be useful when smaller elemental doses are intended.',
        administration:
            'Use the same interaction/separation checks as other iron salts.',
        cautions:
            'More tablets may be required to reach a prescribed elemental dose; do not convert by salt milligrams alone.',
        source: 'NIH ODS Iron Fact Sheet + exact product label',
      ),
      SupplementSaltVariant(
        id: 'iron-bisglycinate',
        name: 'Ferrous bisglycinate / amino-acid chelate',
        elementalAmount:
            'Highly product-specific; use the Supplement Facts elemental-iron line.',
        practicalUse:
            'Some patients report better GI tolerance, but products and evidence are not interchangeable with standard salts.',
        administration:
            'Follow product directions and the same major medication-separation principles.',
        cautions:
            'Do not assume “chelated” means interaction-free or automatically better absorbed in every patient.',
        source: 'NIH ODS Iron Fact Sheet · other chelated forms',
      ),
      SupplementSaltVariant(
        id: 'carbonyl-iron',
        name: 'Carbonyl iron',
        elementalAmount:
            'The ingredient is elemental iron particles; dose by the labeled elemental-iron amount.',
        practicalUse:
            'Alternative oral form; onset/absorption characteristics differ from soluble ferrous salts.',
        administration: 'Use according to the exact product label.',
        cautions:
            'Still toxic in overdose and still requires an indication; do not treat as a benign multivitamin ingredient.',
        source: 'NIH ODS Iron Fact Sheet · carbonyl iron listed among supplemental forms',
      ),
    ],
    pharmacistSections: [
      MedicationSection(
        title: 'Clinical pearl',
        body:
            'The prescription/recommendation should be written and counseled in elemental iron whenever possible. Salt strength is a formulation property, not the therapeutic dose.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Interaction priorities',
        body:
            'Calcium/antacids can impair absorption. Levothyroxine, tetracyclines and fluoroquinolones often need separation; use the interacting medicine’s exact interval.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم للوقاية من نقص الحديد أو علاجه حسب الحاجة والتحاليل.',
      howToUseAr:
          'المهم هو كمية الحديد العنصري Elemental iron وليس وزن ملح الحديد. خذ الجرعة التي حسبها لك الطبيب/الصيدلي من خانة elemental iron.',
      timingAr:
          'امتصاصه أفضل بعيدًا عن الطعام، لكن إذا سبب غثيانًا يمكن أخذه مع كمية بسيطة من الطعام. افصل الكالسيوم ومضادات الحموضة وبعض الأدوية حسب تعليمات الصيدلي.',
      commonActionableAr:
          'قد يسبب غثيانًا أو إمساكًا، وقد يجعل لون البراز داكنًا.',
      importantAr:
          'لا تبدل ferrous sulfate إلى fumarate أو gluconate بنفس عدد الحبات دون حساب elemental iron.',
      seekHelpAr:
          'احتفظ به بعيدًا عن الأطفال؛ جرعة زائدة من الحديد حالة طارئة.',
      teachBackAr:
          'أرني أين مكتوب مقدار elemental iron في منتجك وكم mg ستأخذ في الجرعة.',
    ),
    sourceLabel: 'NIH Office of Dietary Supplements · Iron Fact Sheet + exact product Supplement Facts',
  ),
  SupplementProfile(
    id: 'calcium',
    group: 'Minerals',
    name: 'Calcium',
    subtitle: 'Carbonate, citrate and other calcium salts',
    formulation: 'Tablets, chews, powders and liquids; compare ELEMENTAL calcium',
    searchTerms: [
      'calcium carbonate',
      'calcium citrate',
      'calcium gluconate',
      'calcium lactate',
      'calcium phosphate',
      'elemental calcium',
    ],
    howToTakeEn:
        'Choose the salt based on elemental amount, acid dependence, tolerability and pill burden. Divide larger supplemental doses; calcium absorption from supplements is highest at about 500 mg elemental calcium or less per dose.',
    formulationAlert:
        'Calcium carbonate is 40% elemental calcium and should generally be taken with food. Calcium citrate is about 21% and is less dependent on gastric acid, so it can be taken with or without food.',
    useBasis: 'Diet-gap replacement or indication-specific supplementation',
    monitoringEn:
        'Serum calcium does not measure dietary calcium adequacy. Laboratory monitoring is most relevant with CKD, parathyroid disease, hypercalcemia risk or pharmacologic calcium therapy.',
    saltVariants: [
      SupplementSaltVariant(
        id: 'carbonate',
        name: 'Calcium carbonate',
        formula: 'CaCO3',
        elementalAmount: '40% calcium by weight.',
        elementalPercent: '40% elemental calcium (NIH ODS).',
        example:
            '1,250 mg calcium carbonate = 500 mg elemental calcium in a current DailyMed oral suspension example.',
        practicalUse:
            'High elemental fraction and lower pill burden; also used as an antacid.',
        administration:
            'Take with food because gastric acid improves absorption. Divide larger daily supplemental doses.',
        cautions:
            'More constipation/gas/bloating than citrate in some patients; review kidney-stone/hypercalcemia risk and drug separation.',
        source: 'NIH ODS Calcium + DailyMed calcium carbonate 1,250 mg = 500 mg elemental',
      ),
      SupplementSaltVariant(
        id: 'citrate',
        name: 'Calcium citrate',
        formula: 'Calcium citrate salts',
        elementalAmount: 'About 21% calcium by weight.',
        elementalPercent: '21% elemental calcium (NIH ODS).',
        example:
            'Product tablet mass varies; calculate from the label elemental-calcium amount rather than tablet weight.',
        practicalUse:
            'Often preferred with low gastric acid, acid-suppressive therapy, or when carbonate causes troublesome GI effects.',
        administration:
            'May be taken with or without food; taking with food is still acceptable.',
        cautions:
            'Lower elemental fraction means more tablets/greater salt mass may be needed for the same elemental dose.',
        source: 'NIH ODS Calcium Fact Sheet',
      ),
      SupplementSaltVariant(
        id: 'gluconate',
        name: 'Calcium gluconate',
        elementalAmount:
            'Low elemental fraction (roughly 9% by chemical composition); exact product label controls.',
        practicalUse:
            'Oral products exist but are less efficient for routine elemental-calcium replacement because of low elemental content.',
        administration: 'Use the exact oral product instructions.',
        cautions:
            'Do not transfer IV calcium-gluconate concentrations or ampoule instructions to oral supplementation.',
        source: 'NIH ODS lists calcium gluconate as a supplemental form; exact product label required',
      ),
      SupplementSaltVariant(
        id: 'lactate',
        name: 'Calcium lactate',
        elementalAmount:
            'Relatively low elemental fraction (about 13% depending hydration); label amount controls.',
        practicalUse:
            'Alternative salt when available; typically larger salt mass is required.',
        administration: 'Use product directions and total elemental calcium.',
        cautions:
            'Do not compare products by “calcium lactate mg” alone.',
        source: 'NIH ODS lists calcium lactate as a supplemental form',
      ),
      SupplementSaltVariant(
        id: 'phosphate',
        name: 'Calcium phosphate',
        elementalAmount:
            'VARIES substantially by mono-/di-/tribasic salt and hydration; use the label elemental-calcium amount.',
        practicalUse:
            'Used in some supplements/foods; not a single interchangeable chemical form.',
        administration: 'Follow exact product labeling.',
        cautions:
            'Do not assign one elemental percentage to every “calcium phosphate” product.',
        source: 'NIH ODS Calcium · phosphate forms; exact product label required',
      ),
    ],
    pharmacistSections: [
      MedicationSection(
        title: 'Dose by elemental calcium',
        body:
            'Add dietary calcium plus supplements and antacids. Do not calculate calcium intake from salt weight when the elemental line is available.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Medication separation',
        body:
            'Calcium can impair absorption of levothyroxine, bisphosphonates, iron and selected antibiotics. Use the exact interacting product’s separation interval.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يعوض نقص الكالسيوم الغذائي أو يُستخدم ضمن خطة صحة العظام حسب الحاجة.',
      howToUseAr:
          'انظر إلى خانة Elemental calcium. لا تقارن المنتجات بوزن calcium carbonate أو citrate فقط.',
      timingAr:
          'Calcium carbonate مع الطعام. Calcium citrate يمكن مع الطعام أو بدونه. عادةً يكون امتصاص الجرعات المقسمة أفضل من جرعة كبيرة واحدة.',
      commonActionableAr:
          'Carbonate قد يسبب إمساكًا أو نفخة أكثر من citrate عند بعض الأشخاص.',
      importantAr:
          'افصل الكالسيوم عن levothyroxine والحديد وbisphosphonates وبعض المضادات حسب تعليمات الصيدلي.',
      teachBackAr:
          'ما نوع ملح الكالسيوم لديك؟ وكم mg من elemental calcium يعطي في الجرعة؟',
    ),
    sourceLabel: 'NIH ODS Calcium Fact Sheet + current DailyMed calcium carbonate label',
  ),
  SupplementProfile(
    id: 'magnesium',
    group: 'Minerals',
    name: 'Magnesium',
    subtitle: 'Oxide, citrate, glycinate, chloride, lactate, gluconate and hydroxide',
    formulation: 'Supplement, antacid and laxative products are NOT the same use',
    searchTerms: [
      'magnesium oxide',
      'magnesium citrate',
      'magnesium glycinate',
      'magnesium bisglycinate',
      'magnesium chloride',
      'magnesium lactate',
      'magnesium gluconate',
      'magnesium hydroxide',
      'elemental magnesium',
    ],
    howToTakeEn:
        'Use the ELEMENTAL magnesium value on Supplement Facts. Salt solubility and indication matter: citrate/chloride/lactate/aspartate are generally more bioavailable than oxide; laxative or antacid products should not be treated as routine supplement dosing.',
    formulationAlert:
        'The same “400 mg magnesium” wording may refer to salt weight or elemental amount. A current DailyMed magnesium oxide 400 mg tablet contains 241.3 mg elemental magnesium.',
    useBasis: 'Diet-gap replacement, documented deficiency or indication-specific use',
    monitoringEn:
        'Renal function is important before substantial/prolonged supplementation. Serum magnesium is useful when deficiency or toxicity is suspected but can be normal despite low total-body stores.',
    saltVariants: [
      SupplementSaltVariant(
        id: 'oxide',
        name: 'Magnesium oxide',
        formula: 'MgO',
        elementalAmount:
            'A current DailyMed product: 400 mg magnesium oxide = 241.3 mg elemental magnesium.',
        elementalPercent: 'About 60% elemental magnesium by weight.',
        practicalUse:
            'High elemental fraction and inexpensive, but less bioavailable than several more soluble salts; also used as antacid/laxative.',
        administration:
            'Use the elemental amount and purpose on the label. Food can improve GI tolerance.',
        cautions:
            'May loosen stools; do not equate antacid/laxative dosing with deficiency replacement.',
        source: 'DailyMed magnesium oxide updated Jul 2026 + NIH ODS Magnesium',
      ),
      SupplementSaltVariant(
        id: 'citrate',
        name: 'Magnesium citrate',
        elementalAmount:
            'Product-specific; many supplement salts provide roughly 15–16% elemental magnesium, but hydration/formulation changes this.',
        practicalUse:
            'More soluble and generally better absorbed than oxide; separate supplement capsules from magnesium-citrate saline laxative products.',
        administration: 'Dose from elemental magnesium on Supplement Facts.',
        cautions:
            'Can cause loose stools/diarrhea. Laxative solution directions are not a supplement regimen.',
        source: 'NIH ODS Magnesium · citrate is relatively well absorbed',
      ),
      SupplementSaltVariant(
        id: 'glycinate',
        name: 'Magnesium glycinate / bisglycinate',
        elementalAmount:
            'Chelate composition and buffering differ by manufacturer; use the labeled elemental magnesium, not a universal percentage.',
        practicalUse:
            'Commonly chosen when GI tolerance is a priority; comparative clinical superiority is not established for every use.',
        administration: 'Follow Supplement Facts elemental amount.',
        cautions:
            '“Buffered glycinate” may contain magnesium oxide in addition to chelate; inspect ingredients.',
        source: 'Product-specific Supplement Facts + NIH ODS magnesium principles',
      ),
      SupplementSaltVariant(
        id: 'chloride',
        name: 'Magnesium chloride',
        elementalAmount:
            'Elemental fraction depends on hydration/product; use the label elemental amount.',
        practicalUse:
            'Soluble form; NIH notes chloride tends to be more bioavailable than oxide.',
        administration: 'Use the product elemental-magnesium amount.',
        cautions: 'GI upset/diarrhea and renal accumulation remain possible.',
        source: 'NIH ODS Magnesium Fact Sheet',
      ),
      SupplementSaltVariant(
        id: 'lactate',
        name: 'Magnesium lactate',
        elementalAmount:
            'Product/hydration specific; use elemental magnesium on the label.',
        practicalUse:
            'NIH lists lactate among more soluble/bioavailable forms.',
        administration: 'Follow exact product directions.',
        cautions: 'Dose adjustment/avoidance may be needed with significant renal impairment.',
        source: 'NIH ODS Magnesium Fact Sheet',
      ),
      SupplementSaltVariant(
        id: 'gluconate',
        name: 'Magnesium gluconate',
        elementalAmount:
            'Low elemental fraction; exact tablet/liquid label determines elemental dose.',
        practicalUse:
            'Alternative oral salt when a lower elemental amount per unit is useful.',
        administration: 'Dose by elemental magnesium.',
        cautions: 'Do not compare salt milligrams directly with oxide/citrate.',
        source: 'Product-specific label + NIH ODS magnesium principles',
      ),
      SupplementSaltVariant(
        id: 'hydroxide',
        name: 'Magnesium hydroxide',
        formula: 'Mg(OH)2',
        elementalAmount:
            'OTC products can provide large elemental amounts; NIH example: milk of magnesia provides 500 mg elemental magnesium per tablespoon.',
        practicalUse:
            'Primarily antacid/laxative use rather than routine nutritional replacement.',
        administration: 'Use the Drug Facts indication/directions.',
        cautions:
            'Do not convert laxative doses into routine supplementation; high doses can accumulate in kidney impairment.',
        source: 'NIH ODS Magnesium Fact Sheet',
      ),
    ],
    pharmacistSections: [
      MedicationSection(
        title: 'Absorption vs elemental content',
        body:
            'A high elemental fraction does not automatically mean better absorbed. More soluble citrate/chloride/lactate/aspartate forms are generally absorbed better than oxide/sulfate.',
      ),
      MedicationSection(
        title: 'Major separations',
        body:
            'Review tetracycline/fluoroquinolone antibiotics, bisphosphonates and levothyroxine; magnesium can reduce their absorption.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يعوض المغنيسيوم عند الحاجة، لكن نوع الملح وسبب الاستخدام يغيران الاختيار.',
      howToUseAr:
          'اعتمد على مقدار Elemental magnesium في الملصق. لا تقارن 400 mg oxide مع 400 mg citrate كأنهما نفس الجرعة.',
      timingAr:
          'يمكن أخذه مع الطعام إذا سبب انزعاجًا. افصله عن بعض المضادات الحيوية وlevothyroxine وbisphosphonates حسب تعليمات الصيدلي.',
      commonActionableAr: 'الإسهال أو ليونة البراز أشهر مشكلة، خاصة مع بعض الأملاح والجرعات.',
      importantAr:
          'إذا لديك قصور كلوي فلا تستخدم جرعات كبيرة أو مزمنة بدون مراجعة لأن المغنيسيوم قد يتراكم.',
      teachBackAr: 'ما الملح الموجود في منتجك وكم elemental magnesium يعطي؟',
    ),
    sourceLabel: 'NIH ODS Magnesium Fact Sheet + current DailyMed magnesium oxide label',
  ),
  SupplementProfile(
    id: 'zinc',
    group: 'Minerals',
    name: 'Zinc',
    subtitle: 'Sulfate, gluconate, acetate, picolinate and other zinc forms',
    formulation: 'Tablets, capsules, lozenges and liquids; dose by ELEMENTAL zinc',
    searchTerms: [
      'zinc sulfate',
      'zinc gluconate',
      'zinc acetate',
      'zinc picolinate',
      'elemental zinc',
    ],
    howToTakeEn:
        'Use the elemental zinc amount on Supplement Facts. Taking substantial iron at the same time can reduce zinc absorption; tetracycline and quinolone antibiotics require separation.',
    formulationAlert:
        'The salt name is not the dose. Zinc sulfate, acetate and gluconate contain very different elemental fractions, and hydration state changes sulfate calculations.',
    useBasis: 'Deficiency/risk-based supplementation or product-specific short-term use',
    monitoringEn:
        'Routine zinc testing is not required for every user. Prolonged high-dose use should trigger review for copper deficiency and total zinc exposure.',
    saltVariants: [
      SupplementSaltVariant(
        id: 'sulfate-heptahydrate',
        name: 'Zinc sulfate heptahydrate',
        elementalAmount:
            'Common 220 mg zinc sulfate heptahydrate products provide about 50 mg elemental zinc.',
        elementalPercent: 'About 22.7% elemental zinc.',
        practicalUse: 'Traditional replacement salt.',
        administration: 'Use elemental zinc on the label; food may improve nausea but can reduce absorption somewhat.',
        cautions:
            'Do not confuse monohydrate with heptahydrate; the same salt name can have different elemental fractions.',
        source: 'Stoichiometric conversion + product-specific label; NIH ODS zinc sulfate',
      ),
      SupplementSaltVariant(
        id: 'sulfate-monohydrate',
        name: 'Zinc sulfate monohydrate',
        elementalAmount: 'About 36% elemental zinc by chemical composition.',
        elementalPercent: 'Approximately 36.4%.',
        practicalUse: 'Higher elemental fraction than heptahydrate.',
        administration: 'Use the exact product elemental-zinc line.',
        cautions: 'Hydration state must be known before converting salt weight.',
        source: 'Chemical stoichiometry; NIH ODS identifies zinc sulfate as common form',
      ),
      SupplementSaltVariant(
        id: 'gluconate',
        name: 'Zinc gluconate',
        elementalAmount: 'Approximately 14% elemental zinc by salt weight; product label controls.',
        elementalPercent: 'About 14.3%.',
        practicalUse:
            'Common supplement/lozenge salt; NIH reports absorption similar to zinc citrate in young adults.',
        administration: 'Dose by elemental zinc on Supplement Facts.',
        cautions:
            'Lozenges may have a different intended short-term use and elemental amount than daily supplements.',
        source: 'NIH ODS Zinc + chemical stoichiometry',
      ),
      SupplementSaltVariant(
        id: 'acetate',
        name: 'Zinc acetate',
        elementalAmount: 'Approximately 30% elemental zinc depending hydration; product label controls.',
        practicalUse: 'Common supplement/lozenge form.',
        administration: 'Use labeled elemental zinc.',
        cautions: 'Do not substitute milligram-for-milligram with gluconate or sulfate.',
        source: 'NIH ODS Zinc + exact product label',
      ),
      SupplementSaltVariant(
        id: 'picolinate',
        name: 'Zinc picolinate',
        elementalAmount: 'Product-specific; use Supplement Facts elemental zinc.',
        practicalUse:
            'Common marketed chelate; no routine need to prefer it solely because of marketing claims.',
        administration: 'Use labeled elemental zinc.',
        cautions:
            'Long-term high elemental zinc can cause copper deficiency regardless of salt.',
        source: 'Product-specific Supplement Facts + NIH ODS zinc safety principles',
      ),
    ],
    pharmacistSections: [
      MedicationSection(
        title: 'High-dose safety',
        body:
            'Chronic high-dose zinc can cause copper deficiency, anemia and neurologic problems. Check total zinc from cold products, lozenges, multivitamins and stand-alone supplements.',
        priority: ClinicalPriority.critical,
      ),
      MedicationSection(
        title: 'Interactions',
        body:
            'Separate tetracycline/quinolone antibiotics according to their labels. Taking ≥25 mg elemental iron at the same time can reduce zinc absorption.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لتعويض نقص الزنك أو في حالات محددة، وليس لأن كل شخص يحتاج جرعة عالية.',
      howToUseAr:
          'انظر إلى مقدار Elemental zinc. لا تعتمد على وزن zinc sulfate أو gluconate وحده.',
      timingAr:
          'إذا سبب غثيانًا يمكن أخذه مع الطعام. افصل بعض المضادات الحيوية والحديد العالي حسب تعليمات الصيدلي.',
      importantAr:
          'الجرعات العالية لفترة طويلة قد تسبب نقص النحاس؛ لا تجمع عدة منتجات زنك.',
      teachBackAr: 'كم mg من elemental zinc موجود في منتجك، وما نوع الملح؟',
    ),
    sourceLabel: 'NIH ODS Zinc Fact Sheet + exact product Supplement Facts',
  ),
  SupplementProfile(
    id: 'potassium-supplements',
    group: 'Minerals',
    name: 'Potassium',
    subtitle: 'Chloride, citrate, bicarbonate, gluconate, phosphate and salt substitutes',
    formulation: 'OTC supplements, prescription salts and salt substitutes are not interchangeable',
    searchTerms: [
      'potassium chloride',
      'potassium citrate',
      'potassium bicarbonate',
      'potassium gluconate',
      'potassium phosphate',
      'salt substitute',
    ],
    howToTakeEn:
        'Use the elemental potassium amount or mEq on the exact product. Most U.S. dietary supplements provide no more than 99 mg potassium per serving, whereas prescription potassium products can provide much larger therapeutic doses.',
    formulationAlert:
        'A potassium “supplement” may be nutritionally small, while prescription KCl/citrate or potassium salt substitutes can deliver clinically important amounts. Do not interchange them.',
    useBasis: 'Laboratory/clinical indication or limited dietary supplementation',
    monitoringEn:
        'Serum potassium and kidney function are central when treating hypokalemia or when ACEI/ARB/ARNI/MRA therapy, CKD or other hyperkalemia risks are present.',
    saltVariants: [
      SupplementSaltVariant(
        id: 'chloride',
        name: 'Potassium chloride',
        elementalAmount:
            'Prescription products are often expressed in mEq; 1 mEq potassium = about 39.1 mg elemental potassium.',
        practicalUse:
            'Preferred replacement when chloride is also needed, such as many hypokalemia settings; therapeutic use is prescription-level care.',
        administration:
            'Follow exact dosage-form instructions; many extended-release products must not be crushed.',
        cautions:
            'Can cause GI injury and hyperkalemia. Never substitute an OTC 99 mg supplement for prescribed KCl or vice versa.',
        source: 'NIH ODS Potassium + product-specific KCl labeling',
      ),
      SupplementSaltVariant(
        id: 'citrate',
        name: 'Potassium citrate',
        elementalAmount: 'Usually prescribed in mEq; use product labeling.',
        practicalUse:
            'Prescription use may include urinary citrate/stone indications; this is different from general dietary potassium supplementation.',
        administration: 'Follow exact ER tablet/liquid instructions and meal/fluid guidance.',
        cautions: 'Hyperkalemia risk and GI contraindications are clinically important.',
        source: 'NIH ODS lists potassium citrate + product-specific prescription label',
      ),
      SupplementSaltVariant(
        id: 'gluconate',
        name: 'Potassium gluconate',
        elementalAmount:
            'Common dietary-supplement products usually list up to 99 mg elemental potassium per serving.',
        practicalUse: 'Small dietary-supplement doses, not treatment of significant hypokalemia.',
        administration: 'Follow Supplement Facts.',
        cautions: 'Still unsafe in significant hyperkalemia risk or CKD without review.',
        source: 'NIH ODS Potassium',
      ),
      SupplementSaltVariant(
        id: 'bicarbonate-phosphate',
        name: 'Potassium bicarbonate / phosphate',
        elementalAmount:
            'Form-dependent; use elemental potassium or mEq on the exact product.',
        practicalUse:
            'Used in selected supplements or prescription/medical contexts; not automatically interchangeable with KCl.',
        administration: 'Use exact product instructions.',
        cautions: 'Phosphate or bicarbonate payload may matter independently of potassium.',
        source: 'NIH ODS Potassium',
      ),
    ],
    pharmacistSections: [
      MedicationSection(
        title: 'Do not recommend blindly',
        body:
            'ACE inhibitors, ARBs, ARNIs, spironolactone/eplerenone and kidney disease can turn a seemingly simple potassium supplement into a hyperkalemia hazard.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لتعويض البوتاسيوم فقط عندما توجد حاجة واضحة؛ كثير من منتجات OTC تعطي كمية صغيرة جدًا مقارنةً بأدوية البوتاسيوم الموصوفة.',
      howToUseAr:
          'لا تبدل بين KCl وpotassium citrate أو مكمل 99 mg من نفسك. اتبع مقدار elemental potassium أو mEq في المنتج الموصوف.',
      timingAr: 'اتبع تعليمات نفس المنتج، خصوصًا الأنواع ممتدة المفعول والوصفات العلاجية.',
      importantAr:
          'إذا تستخدم ACEI/ARB/Entresto أو spironolactone/eplerenone أو لديك مرض كلوي، لا تبدأ بوتاسيوم أو بديل ملح غني بالبوتاسيوم من نفسك.',
      seekHelpAr: 'ضعف شديد أو خفقان أو أعراض ارتفاع البوتاسيوم تحتاج تقييمًا عاجلًا حسب شدتها.',
      teachBackAr: 'هل منتجك مكمل غذائي صغير الجرعة أم دواء بوتاسيوم بوحدة mEq؟',
    ),
    sourceLabel: 'NIH ODS Potassium Fact Sheet + product-specific prescription labeling',
  ),
  SupplementProfile(
    id: 'copper',
    group: 'Minerals',
    name: 'Copper',
    subtitle: 'Cupric oxide, sulfate, gluconate and amino-acid chelates',
    formulation: 'Stand-alone or multivitamin/mineral products',
    searchTerms: ['cupric oxide', 'cupric sulfate', 'copper gluconate', 'copper chelate'],
    howToTakeEn:
        'Use the elemental copper amount on the label. Routine high-dose copper is not indicated for most people; look for a specific deficiency/risk reason.',
    formulationAlert:
        'NIH lists cupric oxide, cupric sulfate, copper amino-acid chelates and copper gluconate; comparative bioavailability is not well established.',
    useBasis: 'Deficiency/risk-based supplementation',
    monitoringEn:
        'Consider copper and ceruloplasmin or other specialist testing when deficiency/toxicity is clinically suspected. Long-term high zinc exposure is an important cause of acquired copper deficiency.',
    saltVariants: [
      SupplementSaltVariant(
        id: 'gluconate',
        name: 'Copper gluconate',
        elementalAmount: 'Product-specific; use labeled elemental copper.',
        practicalUse: 'Common oral supplement form.',
        administration: 'Follow product directions.',
        cautions: 'Do not use high doses long term without a reason; copper can accumulate in specific disorders.',
        source: 'NIH ODS Copper',
      ),
      SupplementSaltVariant(
        id: 'sulfate-oxide-chelates',
        name: 'Cupric sulfate / cupric oxide / amino-acid chelates',
        elementalAmount: 'Product-specific.',
        practicalUse: 'Available supplement forms; no form has proven universal superiority.',
        administration: 'Use elemental copper on Supplement Facts.',
        cautions: 'Investigate why deficiency exists, especially excess zinc or malabsorption.',
        source: 'NIH ODS Copper',
      ),
    ],
    pharmacistSections: [
      MedicationSection(
        title: 'Zinc–copper balance',
        body:
            'Prolonged high-dose zinc can impair copper absorption. New anemia, neutropenia or neuropathy in a high-zinc user should trigger copper review.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يعوض نقص النحاس في الحالات التي تحتاجه.',
      howToUseAr: 'اتبع مقدار elemental copper في المنتج ولا تستخدم جرعات عالية عشوائيًا.',
      importantAr: 'الزنك العالي لفترة طويلة قد يسبب نقص النحاس.',
      teachBackAr: 'هل تستخدم زنك بجرعة عالية أو أكثر من منتج معادن؟',
    ),
    sourceLabel: 'NIH ODS Copper Fact Sheet',
  ),
  SupplementProfile(
    id: 'chromium',
    group: 'Minerals',
    name: 'Chromium',
    subtitle: 'Chromium picolinate and other trivalent chromium supplements',
    formulation: 'Tablets/capsules, often marketed for glucose or weight control',
    searchTerms: ['chromium picolinate', 'chromium chloride'],
    howToTakeEn:
        'Do not present chromium as a substitute for diabetes or weight-management treatment. Use only the labeled amount when a clear reason exists.',
    formulationAlert:
        'Claims for weight loss or major glucose lowering exceed the evidence for routine supplementation.',
    useBasis: 'Usually not routinely needed without a specific indication',
    monitoringEn:
        'Routine chromium testing is not standard. In diabetes, monitor glucose based on the diabetes plan rather than chromium levels.',
    pharmacistSections: [
      MedicationSection(
        title: 'Evidence checkpoint',
        body:
            'Chromium supplements are widely marketed for glucose/weight control, but clinically meaningful benefit is inconsistent. Medication therapy should not be displaced.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'الكروميوم معدن أساسي بكميات صغيرة، لكن المكمل ليس علاجًا بديلًا للسكري أو التنحيف.',
      howToUseAr: 'إذا استُخدم فالتزم بجرعة المنتج ولا ترفعها بهدف خفض السكر أو الوزن.',
      importantAr: 'إذا تستخدم أدوية سكر راقب الخطة العلاجية ولا تغيّر الجرعات بسبب المكمل.',
      teachBackAr: 'ما الهدف من استخدام chromium، وهل تتوقع منه أن يحل محل دواء السكري؟',
    ),
    sourceLabel: 'NIH ODS Chromium Fact Sheet',
  ),
  SupplementProfile(
    id: 'manganese',
    group: 'Minerals',
    name: 'Manganese',
    subtitle: 'Trace mineral',
    formulation: 'Usually part of multivitamin/mineral products',
    howToTakeEn:
        'Most people obtain manganese from food. Avoid unnecessary high-dose stand-alone supplementation.',
    formulationAlert:
        'Excess exposure is neurotoxic; this is not a “more is better” mineral.',
    useBasis: 'Routine dietary adequacy; stand-alone supplementation rarely necessary',
    monitoringEn:
        'Routine manganese levels are not used for general wellness. Specialist assessment is appropriate for suspected deficiency or toxicity.',
    pharmacistSections: [
      MedicationSection(
        title: 'Safety',
        body:
            'Chronic excessive manganese exposure can cause neurologic toxicity; review total intake and liver disease when exposure is high.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'المنغنيز معدن يحتاجه الجسم بكميات صغيرة وغالبًا يحصل عليه الشخص من الغذاء.',
      howToUseAr: 'لا تستخدم جرعات عالية منفردة بدون سبب واضح.',
      importantAr: 'الزيادة المزمنة قد تكون مؤذية للجهاز العصبي.',
      teachBackAr: 'هل المنغنيز موجود أصلًا في multivitamin الذي تستخدمه؟',
    ),
    sourceLabel: 'NIH ODS Manganese Fact Sheet',
  ),
  SupplementProfile(
    id: 'phosphorus',
    group: 'Minerals',
    name: 'Phosphorus / Phosphate',
    subtitle: 'Dietary phosphorus and phosphate salts',
    formulation: 'Dietary supplements, phosphate salts and combination mineral products',
    searchTerms: ['phosphate', 'phosphorus', 'sodium phosphate', 'potassium phosphate'],
    howToTakeEn:
        'Routine phosphorus supplementation is rarely needed in a typical diet. Therapeutic phosphate replacement is a separate medical treatment and should not be treated like a generic supplement.',
    formulationAlert:
        '“Phosphorus” on a supplement label and prescription sodium/potassium phosphate are different clinical contexts; potassium/sodium payload also matters.',
    useBasis: 'Deficiency treatment is laboratory/clinical-indication driven',
    monitoringEn:
        'Serum phosphate, calcium, kidney function and the accompanying sodium/potassium load are relevant when phosphate is being therapeutically replaced.',
    pharmacistSections: [
      MedicationSection(
        title: 'CKD caution',
        body:
            'Patients with CKD may need phosphate restriction rather than supplementation. Avoid general wellness recommendations without context.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'الفوسفات يُعوض فقط عند وجود حاجة واضحة؛ معظم الناس لا يحتاجون مكمل فوسفور منفرد.',
      howToUseAr: 'إذا كان phosphate موصوفًا كعلاج فاتبع الجرعة ونوع الملح بالضبط.',
      importantAr: 'مرضى الكلى قد يحتاجون تقليل الفوسفات وليس زيادته.',
      teachBackAr: 'هل المنتج مكمل غذائي أم phosphate علاجي موصوف؟',
    ),
    sourceLabel: 'NIH ODS Phosphorus Fact Sheet + product-specific phosphate labeling',
  ),
  SupplementProfile(
    id: 'vitamin-b1-thiamin',
    group: 'Vitamins',
    name: 'Vitamin B1 (Thiamin)',
    subtitle: 'Thiamin / thiamine',
    formulation: 'B-complex, multivitamin and stand-alone products',
    howToTakeEn:
        'May be taken with or without food. High-risk deficiency states such as alcohol-use disorder, refeeding risk or neurologic syndromes require clinician-directed treatment rather than routine wellness dosing.',
    useBasis: 'Nutritional supplementation or deficiency treatment',
    monitoringEn:
        'Routine levels are not required for typical low-dose use; clinical context drives deficiency assessment.',
    pharmacistSections: [
      MedicationSection(
        title: 'Do not undertreat high-risk deficiency',
        body:
            'Suspected Wernicke encephalopathy or severe deficiency is a medical treatment problem, not an OTC supplement-selection problem.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'فيتامين B1 مهم للأعصاب والطاقة، ويُعوض عند نقصه أو زيادة خطر النقص.',
      howToUseAr: 'يمكن أخذه مع الطعام أو بدونه حسب المنتج.',
      importantAr: 'حالات النقص الشديد أو أعراض عصبية تحتاج علاجًا طبيًا وليس مجرد جرعة multivitamin.',
      teachBackAr: 'هل تستخدمه كمكمل اعتيادي أم لعلاج نقص مشخص؟',
    ),
    sourceLabel: 'NIH ODS Thiamin Fact Sheet',
  ),
  SupplementProfile(
    id: 'vitamin-b2-riboflavin',
    group: 'Vitamins',
    name: 'Vitamin B2 (Riboflavin)',
    subtitle: 'Riboflavin',
    formulation: 'B-complex, multivitamin and stand-alone tablets/capsules',
    howToTakeEn:
        'May be taken with food; bright-yellow urine is an expected harmless effect of riboflavin excretion.',
    useBasis: 'Nutritional supplementation; selected higher-dose uses are indication-specific',
    monitoringEn: 'Routine testing is not needed for typical supplementation.',
    pharmacistSections: [
      MedicationSection(
        title: 'Counseling pearl',
        body:
            'Warn about bright-yellow urine so it does not alarm the patient. High-dose migraine-prevention use should be separated conceptually from basic nutritional replacement.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'فيتامين B2 يساعد وظائف الجسم الطبيعية ويُستخدم لتعويض النقص.',
      howToUseAr: 'يمكن أخذه مع الطعام حسب المنتج.',
      commonActionableAr: 'قد يجعل لون البول أصفر فاقعًا؛ هذا متوقع وغير خطير عادةً.',
      teachBackAr: 'إذا أصبح البول أصفر فاقعًا بعد B2، هل تعرف أنه تأثير متوقع؟',
    ),
    sourceLabel: 'NIH ODS Riboflavin Fact Sheet',
  ),
  SupplementProfile(
    id: 'vitamin-b3-niacin',
    group: 'Vitamins',
    name: 'Vitamin B3 (Niacin)',
    subtitle: 'Nicotinic acid / niacinamide',
    formulation: 'Nutritional supplements and high-dose lipid products are not equivalent',
    howToTakeEn:
        'Low nutritional doses can be taken with food. High-dose nicotinic acid used for lipid effects requires clinician supervision because flushing, liver toxicity and glucose/uric-acid effects become clinically important.',
    formulationAlert:
        'Nicotinic acid causes flushing and has lipid effects; niacinamide/nicotinamide does not have the same lipid-lowering role.',
    useBasis: 'Nutritional supplementation; pharmacologic high-dose use is separate',
    monitoringEn:
        'High-dose therapy may require liver enzymes, glucose and uric acid monitoring according to the treatment plan.',
    pharmacistSections: [
      MedicationSection(
        title: 'Do not equate forms',
        body:
            'Nicotinic acid and niacinamide are both vitamin B3 sources but have different pharmacologic effects and adverse-effect profiles at high doses.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'فيتامين B3 يُستخدم غذائيًا بجرعات صغيرة، أما الجرعات العالية من nicotinic acid فهي علاج دوائي مختلف.',
      howToUseAr: 'إذا كان مكملًا غذائيًا فاتبع الجرعة. لا تستخدم جرعات عالية للكوليسترول من نفسك.',
      commonActionableAr: 'Nicotinic acid قد يسبب احمرارًا وسخونة وحكة بالجلد خاصة بجرعات أعلى.',
      importantAr: 'الجرعات العالية قد تؤثر في الكبد والسكر وحمض اليوريك.',
      teachBackAr: 'هل منتجك nicotinic acid أم niacinamide، وهل الجرعة غذائية أم علاجية عالية؟',
    ),
    sourceLabel: 'NIH ODS Niacin Fact Sheet',
  ),
  SupplementProfile(
    id: 'vitamin-b5-pantothenic-acid',
    group: 'Vitamins',
    name: 'Vitamin B5 (Pantothenic Acid)',
    subtitle: 'Pantothenic acid / calcium pantothenate',
    formulation: 'B-complex and multivitamin products',
    howToTakeEn:
        'May be taken with or without food. Deficiency is rare, so high stand-alone doses usually need a specific rationale.',
    useBasis: 'Routine nutritional intake; deficiency is uncommon',
    monitoringEn: 'Routine laboratory testing is not needed for typical supplementation.',
    pharmacistSections: [
      MedicationSection(
        title: 'Evidence',
        body:
            'Do not infer benefit for acne, energy or other marketed claims from the fact that B5 is an essential vitamin.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'فيتامين B5 ضروري للجسم لكن نقصه نادر.',
      howToUseAr: 'إذا كان ضمن B-complex أو multivitamin فاتبع الجرعة ولا تضاعفه من عدة منتجات.',
      importantAr: 'لا توجد فائدة مؤكدة من جرعات عالية لمجرد التسويق للطاقة أو البشرة.',
      teachBackAr: 'هل B5 موجود أصلًا في B-complex أو multivitamin الذي تستخدمه؟',
    ),
    sourceLabel: 'NIH ODS Pantothenic Acid Fact Sheet',
  ),
  SupplementProfile(
    id: 'choline',
    group: 'Other supplements',
    name: 'Choline',
    subtitle: 'Choline bitartrate, phosphatidylcholine and dietary choline',
    formulation: 'Stand-alone and prenatal/multivitamin products',
    howToTakeEn:
        'Use total choline from diet plus supplements. Pregnancy increases choline requirements, but products vary widely in whether they contain it and how much.',
    formulationAlert:
        'Choline bitartrate and phosphatidylcholine are different ingredient masses; use the label amount of choline rather than comparing compound weight.',
    useBasis: 'Dietary adequacy; patient-specific supplementation',
    monitoringEn: 'Routine blood choline testing is not a standard wellness test.',
    pharmacistSections: [
      MedicationSection(
        title: 'Prenatal gap',
        body:
            'Many prenatal products contain little or no choline; assess the whole diet/product rather than assuming a prenatal automatically covers it.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'الكولين عنصر غذائي مهم للدماغ والكبد، وتزداد الحاجة إليه في الحمل.',
      howToUseAr: 'احسب الكمية من الغذاء والمكمل، وانظر إلى مقدار choline نفسه لا وزن choline bitartrate فقط.',
      importantAr: 'لا تفترض أن كل prenatal يحتوي كمية كافية من choline.',
      teachBackAr: 'كم choline يعطي منتجك فعليًا، وهل يحتوي prenatal عليه أصلًا؟',
    ),
    sourceLabel: 'NIH ODS Choline Fact Sheet',
  ),
  SupplementProfile(
    id: 'creatine-monohydrate',
    group: 'Other supplements',
    name: 'Creatine Monohydrate',
    subtitle: 'Sports/performance supplement',
    formulation: 'Powder/capsules; creatine monohydrate has the largest evidence base',
    howToTakeEn:
        'Use a reputable product and measure the dose accurately. A loading phase is not mandatory for eventual muscle saturation; adequate fluid intake and the overall training/nutrition plan matter.',
    formulationAlert:
        'Creatine monohydrate is the reference form with the strongest evidence; “buffered” or proprietary forms are not automatically superior.',
    useBasis: 'Performance/strength support in appropriate adults; not a growth-hormone substitute',
    monitoringEn:
        'Routine creatine kinase testing is not required in healthy users. Kidney disease, unexplained renal dysfunction or nephrotoxic therapy warrants clinical review before use.',
    pharmacistSections: [
      MedicationSection(
        title: 'Creatinine pearl',
        body:
            'Creatine use can increase serum creatinine without necessarily representing kidney injury; interpret renal assessment in clinical context rather than ignoring or overcalling the result.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'قد يساعد القوة والأداء مع التدريب المناسب؛ ليس هرمون نمو ولا يبني العضلات بدون تدريب وغذاء مناسب.',
      howToUseAr: 'استخدم creatine monohydrate من منتج موثوق وقِس الجرعة بدقة.',
      importantAr: 'إذا لديك مرض كلوي أو تحاليل كلى غير طبيعية راجع الطبيب قبل الاستخدام.',
      teachBackAr: 'هل منتجك creatine monohydrate وما الهدف الواقعي الذي تتوقعه منه؟',
    ),
    sourceLabel: 'Evidence-based sports nutrition consensus + product-specific quality review',
  ),
  SupplementProfile(
    id: 'melatonin',
    group: 'Other supplements',
    name: 'Melatonin',
    subtitle: 'Sleep/circadian supplement',
    formulation: 'Immediate-release and extended-release products; content quality varies',
    howToTakeEn:
        'Timing depends on the sleep/circadian goal. Do not use “bedtime” as a universal instruction for circadian-shift treatment; product and indication matter.',
    formulationAlert:
        'Immediate- and extended-release products are not interchangeable for every sleep problem, and supplement content may differ from the label in poorly controlled products.',
    useBasis: 'Short-term or indication-specific sleep/circadian use',
    monitoringEn:
        'Persistent insomnia needs assessment for cause rather than indefinite dose escalation.',
    pharmacistSections: [
      MedicationSection(
        title: 'Practical safety',
        body:
            'Drowsiness can impair driving. Review other sedatives, anticoagulants and special populations; pediatric long-term use should be clinician-directed.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يساعد في بعض مشاكل النوم أو تنظيم الساعة البيولوجية حسب السبب.',
      howToUseAr: 'التوقيت يعتمد على المشكلة؛ لا ترفع الجرعة أو تغيّر الوقت عشوائيًا إذا لم ينفع.',
      importantAr: 'قد يسبب نعاسًا؛ لا تقد السيارة حتى تعرف تأثيره عليك.',
      seekHelpAr: 'إذا استمر الأرق أو كان شديدًا فابحث عن السبب بدل زيادة الجرعة باستمرار.',
      teachBackAr: 'لماذا تستخدم melatonin بالضبط، وما الوقت الذي اتفقتم عليه للجرعة؟',
    ),
    sourceLabel: 'NCCIH Melatonin guidance + product-specific labeling/quality considerations',
  ),
  SupplementProfile(
    id: 'probiotics',
    group: 'Other supplements',
    name: 'Probiotics',
    subtitle: 'Strain-specific live microorganisms',
    formulation: 'Capsules, sachets, liquids and foods; evidence is strain/indication specific',
    howToTakeEn:
        'Choose by documented strain(s), CFU through end of shelf life, storage and the exact indication. “Probiotic” is not one interchangeable active ingredient.',
    formulationAlert:
        'Lactobacillus/Bifidobacterium/Saccharomyces products cannot be treated as equivalent simply because they are all probiotics.',
    useBasis: 'Indication- and strain-specific evidence',
    monitoringEn:
        'Routine laboratory monitoring is not needed, but high-risk immunocompromised/critically ill patients require clinician review because rare invasive infections have occurred.',
    pharmacistSections: [
      MedicationSection(
        title: 'Strain lock',
        body:
            'Evidence should identify genus, species and ideally strain. Do not transfer benefit from one probiotic strain to another product.',
        priority: ClinicalPriority.critical,
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'قد تفيد بعض سلالات البروبيوتك في حالات محددة، لكن ليست كل المنتجات متشابهة.',
      howToUseAr: 'اختر المنتج حسب السلالة والهدف وتعليمات الحفظ، وليس فقط كلمة probiotic.',
      importantAr: 'إذا المناعة ضعيفة جدًا أو المريض في العناية المركزة فلابد من مراجعة الطبيب قبل الاستخدام.',
      teachBackAr: 'ما اسم السلالة الموجودة في المنتج وما الحالة التي تستخدمها لأجلها؟',
    ),
    sourceLabel: 'NCCIH probiotics guidance + strain-specific evidence required',
  ),
  SupplementProfile(
    id: 'coenzyme-q10',
    group: 'Other supplements',
    name: 'Coenzyme Q10',
    subtitle: 'Ubiquinone / ubiquinol',
    formulation: 'Softgels/capsules; fat-soluble',
    howToTakeEn:
        'Take with a meal containing some fat to improve absorption. Product strength and formulation vary.',
    formulationAlert:
        'Ubiquinone and ubiquinol products are marketed differently; routine superiority for every indication is not established.',
    useBasis: 'Evidence varies by indication; not a routine essential supplement',
    monitoringEn:
        'No routine CoQ10 level is needed. Review warfarin and blood-pressure therapy when clinically relevant.',
    pharmacistSections: [
      MedicationSection(
        title: 'Interaction checkpoint',
        body:
            'CoQ10 may interact with warfarin and blood-pressure therapy; monitor the clinical regimen rather than assuming a supplement is inert.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr: 'يُستخدم لأهداف مختلفة لكن فائدته تعتمد على الحالة وليس مكملًا ضروريًا للجميع.',
      howToUseAr: 'يفضل أخذه مع وجبة تحتوي بعض الدهون لتحسين الامتصاص.',
      importantAr: 'إذا تستخدم warfarin أو أدوية ضغط أخبر الصيدلي قبل البدء.',
      teachBackAr: 'ما الهدف من CoQ10 وما الأدوية المزمنة التي تستخدمها معه؟',
    ),
    sourceLabel: 'NCCIH Coenzyme Q10 guidance + interaction review',
  ),
  SupplementProfile(
    id: 'molybdenum',
    group: 'Minerals',
    name: 'Molybdenum',
    subtitle: 'Essential trace mineral',
    formulation: 'Usually present in multivitamin/mineral products',
    searchTerms: ['molybdate', 'sodium molybdate'],
    howToTakeEn:
        'Most people obtain adequate molybdenum from food. Stand-alone supplementation is rarely necessary; count it from multivitamin/mineral products before adding more.',
    formulationAlert:
        'Molybdenum deficiency is very rare outside unusual clinical settings; high-dose wellness use has no routine role.',
    useBasis: 'Routine dietary adequacy; deficiency treatment is specialist-directed',
    monitoringEn:
        'Routine molybdenum testing is not needed for general supplementation.',
    pharmacistSections: [
      MedicationSection(
        title: 'Practical checkpoint',
        body:
            'Do not recommend a stand-alone high-dose product solely because molybdenum is an essential nutrient. Verify total intake and the specific clinical reason.',
      ),
    ],
    patient: PatientCounselingData(
      purposeAr:
          'الموليبدينوم معدن يحتاجه الجسم بكميات صغيرة جدًا وغالبًا يحصل عليه الشخص من الغذاء.',
      howToUseAr:
          'إذا كان موجودًا ضمن multivitamin/mineral فاحسب الكمية من المنتج ولا تضف مكملًا منفردًا بدون سبب واضح.',
      importantAr:
          'نقصه نادر جدًا؛ الجرعات العالية ليست مكملًا روتينيًا.',
      teachBackAr: 'هل الموليبدينوم موجود أصلًا في الملتي فيتامين الذي تستخدمه؟',
    ),
    sourceLabel: 'NIH ODS Molybdenum Fact Sheet',
  ),

];
