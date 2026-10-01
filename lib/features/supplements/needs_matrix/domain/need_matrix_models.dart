enum NeedActionTier {
  foodFirst,
  preventive,
  testFirst,
  treatment,
  protocol,
  avoidSelfSupplement,
}

class NeedPathway {
  const NeedPathway({
    required this.id,
    required this.title,
    required this.who,
    required this.tier,
    required this.coreDecision,
    required this.supplementPlan,
    required this.dailyTarget,
    required this.labPlan,
    required this.duration,
    required this.reviewStopRule,
    required this.sourceLabel,
  });

  final String id;
  final String title;
  final String who;
  final NeedActionTier tier;
  final String coreDecision;
  final String supplementPlan;
  final String dailyTarget;
  final String labPlan;
  final String duration;
  final String reviewStopRule;
  final String sourceLabel;
}

class HealthyLabRule {
  const HealthyLabRule({
    required this.test,
    required this.routineHealthyUse,
    required this.whenUseful,
    required this.doNotMisread,
    required this.sourceLabel,
  });

  final String test;
  final String routineHealthyUse;
  final String whenUseful;
  final String doNotMisread;
  final String sourceLabel;
}

class HealthySupplementRule {
  const HealthySupplementRule({
    required this.nutrient,
    required this.dailyNeed,
    required this.defaultSupplementDose,
    required this.practicalRule,
  });

  final String nutrient;
  final String dailyNeed;
  final String defaultSupplementDose;
  final String practicalRule;
}
