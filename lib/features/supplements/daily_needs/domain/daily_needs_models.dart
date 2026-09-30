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
