import '../domain/stack_safety_models.dart';

const stackItems = <StackItem>[
  StackItem(id: 'calcium', name: 'Calcium', group: 'Mineral'),
  StackItem(id: 'iron', name: 'Iron', group: 'Mineral'),
  StackItem(id: 'magnesium', name: 'Magnesium', group: 'Mineral'),
  StackItem(id: 'zinc', name: 'Zinc', group: 'Mineral'),
  StackItem(id: 'vitamin-c', name: 'Vitamin C', group: 'Vitamin'),
  StackItem(id: 'vitamin-d', name: 'Vitamin D', group: 'Vitamin'),
  StackItem(id: 'omega3', name: 'Omega-3 / fish oil', group: 'Lipid'),
  StackItem(id: 'glucosamine', name: 'Glucosamine', group: 'Joint'),
  StackItem(id: 'chondroitin', name: 'Chondroitin', group: 'Joint'),
  StackItem(id: 'msm', name: 'MSM', group: 'Joint'),
  StackItem(id: 'collagen', name: 'Collagen peptides', group: 'Joint'),
  StackItem(id: 'ucii', name: 'Undenatured type II collagen', group: 'Joint'),
  StackItem(id: 'hyaluronic', name: 'Oral hyaluronic acid', group: 'Joint'),
  StackItem(id: 'curcumin', name: 'Curcumin / turmeric extract', group: 'Herbal'),
  StackItem(id: 'ginkgo', name: 'Ginkgo', group: 'Herbal'),
  StackItem(id: 'same', name: 'SAMe', group: 'Specialty'),
  StackItem(id: 'st-johns-wort', name: 'St. John’s wort', group: 'Herbal'),
  StackItem(id: 'probiotic', name: 'Bacterial probiotic', group: 'Microbiome'),
];

const stackPairRules = <StackPairRule>[
  StackPairRule(
    a: 'calcium',
    b: 'iron',
    level: StackAdviceLevel.separate,
    message:
        'Calcium can reduce iron absorption. If iron is being used to treat deficiency, take calcium at a different time when practical.',
  ),
  StackPairRule(
    a: 'iron',
    b: 'zinc',
    level: StackAdviceLevel.separate,
    message:
        'Iron supplements containing about 25 mg elemental iron or more can reduce zinc absorption when taken together. Separate substantial therapeutic doses.',
  ),
  StackPairRule(
    a: 'calcium',
    b: 'vitamin-d',
    level: StackAdviceLevel.okay,
    message:
        'Calcium and vitamin D can be taken together when BOTH are indicated. Do not add calcium automatically just because vitamin D is used; count dietary calcium.',
  ),
  StackPairRule(
    a: 'collagen',
    b: 'vitamin-c',
    level: StackAdviceLevel.okay,
    message:
        'Collagen peptides and vitamin C can be taken together. Extra high-dose vitamin C is not necessary when normal dietary vitamin C intake is adequate.',
  ),
  StackPairRule(
    a: 'glucosamine',
    b: 'chondroitin',
    level: StackAdviceLevel.okay,
    message:
        'They can be coadministered and have been studied together, but the combination is not consistently better than placebo or either ingredient alone.',
  ),
  StackPairRule(
    a: 'glucosamine',
    b: 'msm',
    level: StackAdviceLevel.okay,
    message:
        'They can be taken together in combination products, but evidence for additive benefit is limited. Watch pill burden and GI upset.',
  ),
  StackPairRule(
    a: 'chondroitin',
    b: 'msm',
    level: StackAdviceLevel.okay,
    message:
        'No routine same-time prohibition, but combining multiple joint ingredients can increase GI/pill burden without proving extra benefit.',
  ),
  StackPairRule(
    a: 'collagen',
    b: 'ucii',
    level: StackAdviceLevel.review,
    message:
        'Hydrolyzed collagen peptides and native type II collagen use very different doses/mechanisms. They are not dose-equivalent; using both may be unnecessary duplication unless there is a clear trial plan.',
  ),
  StackPairRule(
    a: 'collagen',
    b: 'hyaluronic',
    level: StackAdviceLevel.okay,
    message:
        'No standard same-time restriction is established, but additive clinical benefit of the combination is not proven.',
  ),
  StackPairRule(
    a: 'magnesium',
    b: 'vitamin-c',
    level: StackAdviceLevel.okay,
    message:
        'They can be taken together, but high doses of either can cause diarrhea/cramping; split them if GI tolerance is poor.',
  ),
  StackPairRule(
    a: 'ginkgo',
    b: 'omega3',
    level: StackAdviceLevel.review,
    message:
        'Both can affect bleeding-related pathways. This is not an automatic contraindication, but review bleeding risk, doses and antithrombotic medicines.',
  ),
  StackPairRule(
    a: 'ginkgo',
    b: 'curcumin',
    level: StackAdviceLevel.review,
    message:
        'Avoid casual high-dose stacking in people with bleeding risk or before procedures; evidence for additive benefit is not established.',
  ),
  StackPairRule(
    a: 'same',
    b: 'st-johns-wort',
    level: StackAdviceLevel.avoid,
    message:
        'Do not combine casually: both can increase serotonergic activity and the combination raises interaction risk.',
  ),
];

const stackFlagRules = <StackFlagRule>[
  StackFlagRule(
    flag: StackPatientFlag.warfarin,
    itemIds: {'glucosamine', 'chondroitin'},
    level: StackAdviceLevel.review,
    message:
        'Warfarin + glucosamine/chondroitin: increased bleeding/INR has been reported. Coordinate with the anticoagulation plan.',
  ),
  StackFlagRule(
    flag: StackPatientFlag.warfarin,
    itemIds: {'ginkgo', 'curcumin', 'omega3'},
    level: StackAdviceLevel.review,
    message:
        'Warfarin plus supplements that may affect bleeding requires individualized review and INR/bleeding monitoring when clinically appropriate.',
  ),
  StackFlagRule(
    flag: StackPatientFlag.levothyroxine,
    itemIds: {'calcium', 'iron'},
    level: StackAdviceLevel.separate,
    message:
        'Levothyroxine: keep calcium/iron about 4 hours away unless the exact product instructions say otherwise.',
  ),
  StackFlagRule(
    flag: StackPatientFlag.tetracyclineOrQuinolone,
    itemIds: {'calcium', 'magnesium', 'zinc'},
    level: StackAdviceLevel.separate,
    message:
        'Tetracycline/quinolone antibiotics can chelate calcium, magnesium or zinc. Use antibiotic-specific spacing rather than taking them together.',
  ),
  StackFlagRule(
    flag: StackPatientFlag.renalImpairment,
    itemIds: {'magnesium'},
    level: StackAdviceLevel.review,
    message:
        'Reduced kidney function increases magnesium accumulation/toxicity risk. Review renal function and total elemental magnesium before use.',
  ),
  StackFlagRule(
    flag: StackPatientFlag.pregnancyOrPlanning,
    itemIds: {'glucosamine', 'chondroitin', 'msm', 'same'},
    level: StackAdviceLevel.review,
    message:
        'Pregnancy/planning pregnancy: safety evidence for these nonessential joint supplements is insufficient for routine self-use.',
  ),
];

List<StackAdvice> evaluateStack({
  required Set<String> selectedIds,
  required Set<StackPatientFlag> flags,
}) {
  final messages = <StackAdvice>[];

  for (final rule in stackPairRules) {
    if (selectedIds.contains(rule.a) && selectedIds.contains(rule.b)) {
      messages.add(StackAdvice(level: rule.level, message: rule.message));
    }
  }

  for (final rule in stackFlagRules) {
    if (!flags.contains(rule.flag)) continue;
    if (selectedIds.intersection(rule.itemIds).isNotEmpty) {
      messages.add(StackAdvice(level: rule.level, message: rule.message));
    }
  }

  if (flags.contains(StackPatientFlag.sensitiveGut)) {
    final giItems = selectedIds.intersection(
      {'iron', 'magnesium', 'vitamin-c', 'glucosamine', 'msm'},
    );
    if (giItems.length >= 2) {
      messages.add(
        StackAdvice(
          level: StackAdviceLevel.review,
          message:
              'GI-tolerance flag: several selected products can cause nausea, constipation, cramping or diarrhea. Do not start all at once; introduce one at a time and split doses if needed.',
        ),
      );
    }
  }

  if (selectedIds.length >= 5) {
    messages.add(
      const StackAdvice(
        level: StackAdviceLevel.review,
        message:
            'Large stack: five or more supplements are selected. Re-check whether each has a separate indication and measurable goal; unnecessary stacking increases cost, duplication and adverse-effect attribution problems.',
      ),
    );
  }

  if (messages.isEmpty && selectedIds.isNotEmpty) {
    messages.add(
      const StackAdvice(
        level: StackAdviceLevel.okay,
        message:
            'No high-value rule in this v1.1 planner requires separation for the selected combination. This does NOT prove every brand/ingredient is interaction-free; check exact labels and medicines.',
      ),
    );
  }

  messages.sort((a, b) => b.level.index.compareTo(a.level.index));
  return messages;
}
