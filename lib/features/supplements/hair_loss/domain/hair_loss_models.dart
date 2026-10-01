enum HairLossProductType {
  oralSupplement,
  topicalAmpouleLotionSerum,
  shampoo,
}

enum HairLossEvidence {
  moderate,
  limited,
  productSpecific,
  supportiveOnly,
  noRoutineRole,
  regulatoryCaution,
}

class HairLossProduct {
  const HairLossProduct({
    required this.id,
    required this.brand,
    required this.name,
    required this.type,
    required this.bestFor,
    required this.keyIngredients,
    required this.regimen,
    required this.duration,
    required this.evidence,
    required this.evidenceNote,
    required this.safety,
    required this.productLock,
    required this.sourceLabel,
  });

  final String id;
  final String brand;
  final String name;
  final HairLossProductType type;
  final String bestFor;
  final String keyIngredients;
  final String regimen;
  final String duration;
  final HairLossEvidence evidence;
  final String evidenceNote;
  final List<String> safety;
  final String productLock;
  final String sourceLabel;
}

class HairLossTriageRule {
  const HairLossTriageRule({
    required this.id,
    required this.title,
    required this.pattern,
    required this.whatItUsuallyMeans,
    required this.nonDrugRole,
    required this.labPlan,
    required this.referWhen,
    required this.sourceLabel,
  });

  final String id;
  final String title;
  final String pattern;
  final String whatItUsuallyMeans;
  final String nonDrugRole;
  final String labPlan;
  final String referWhen;
  final String sourceLabel;
}

class HairIngredientGuide {
  const HairIngredientGuide({
    required this.name,
    required this.whereSeen,
    required this.whenUseful,
    required this.whatNotToPromise,
    required this.safety,
    required this.sourceLabel,
  });

  final String name;
  final String whereSeen;
  final String whenUseful;
  final String whatNotToPromise;
  final String safety;
  final String sourceLabel;
}
