enum PatientSex { male, female }

enum AdultAgeBand {
  age19to30,
  age31to50,
  age51to70,
  age71plus,
}

enum AdultLifeStage {
  none,
  pregnant,
  lactating,
}

enum PediatricAgeBand {
  birthTo6Months,
  age7To12Months,
  age1To3Years,
  age4To8Years,
  age9To13Years,
  age14To18Years,
}

enum PediatricLifeStage {
  none,
  pregnant,
  lactating,
}

enum InfantFeedingMode {
  breastMilk,
  mixed,
  ironFortifiedFormula,
}

enum FormulaDailyVolume {
  lessThan32OzOrUnknown,
  atLeast32Oz,
}

class AdultDailyNeedInput {
  const AdultDailyNeedInput({
    required this.sex,
    required this.ageBand,
    required this.lifeStage,
    required this.smoker,
  });

  final PatientSex sex;
  final AdultAgeBand ageBand;
  final AdultLifeStage lifeStage;
  final bool smoker;
}

class PediatricDailyNeedInput {
  const PediatricDailyNeedInput({
    required this.sex,
    required this.ageBand,
    required this.lifeStage,
    required this.feedingMode,
    required this.formulaDailyVolume,
    required this.pretermOrLowBirthWeight,
  });

  final PatientSex sex;
  final PediatricAgeBand ageBand;
  final PediatricLifeStage lifeStage;
  final InfantFeedingMode feedingMode;
  final FormulaDailyVolume formulaDailyVolume;
  final bool pretermOrLowBirthWeight;
}

class DailyNeedItem {
  const DailyNeedItem({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.amount,
    required this.unit,
    required this.referenceType,
    required this.upperLimit,
    required this.upperLimitScope,
    required this.foodFirstAr,
    required this.supplementRuleAr,
    required this.labRuleAr,
    required this.sourceLabel,
  });

  final String id;
  final String nameEn;
  final String nameAr;
  final double amount;
  final String unit;
  final String referenceType;
  final String upperLimit;
  final String upperLimitScope;
  final String foodFirstAr;
  final String supplementRuleAr;
  final String labRuleAr;
  final String sourceLabel;
}

class PediatricSafetyNote {
  const PediatricSafetyNote({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.bodyAr,
    required this.sourceLabel,
    this.critical = false,
  });

  final String id;
  final String titleEn;
  final String titleAr;
  final String bodyAr;
  final String sourceLabel;
  final bool critical;
}

class LabNavigatorItem {
  const LabNavigatorItem({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.whenToTestAr,
    required this.whatToOrderAr,
    required this.interpretationAr,
    required this.sourceLabel,
  });

  final String id;
  final String titleEn;
  final String titleAr;
  final String whenToTestAr;
  final String whatToOrderAr;
  final String interpretationAr;
  final String sourceLabel;
}

class NutrientGapResult {
  const NutrientGapResult({
    required this.target,
    required this.foodIntake,
    required this.existingSupplementIntake,
    required this.totalCurrentIntake,
    required this.uncoveredGap,
  });

  final double target;
  final double foodIntake;
  final double existingSupplementIntake;
  final double totalCurrentIntake;
  final double uncoveredGap;

  bool get targetMet => uncoveredGap <= 0;
}
