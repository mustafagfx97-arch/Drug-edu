enum VitaminId {
  vitaminA,
  thiaminB1,
  riboflavinB2,
  niacinB3,
  pantothenicB5,
  vitaminB6,
  biotinB7,
  folateB9,
  vitaminB12,
  vitaminC,
  vitaminD,
  vitaminE,
  vitaminK,
}

class VitaminForm {
  const VitaminForm({
    required this.name,
    required this.practicalDifference,
  });

  final String name;
  final String practicalDifference;
}

class VitaminPathway {
  const VitaminPathway({
    required this.id,
    required this.title,
    required this.population,
    required this.dose,
    required this.whenToUse,
    required this.duration,
    required this.monitoring,
    required this.caveat,
    required this.sourceLabel,
  });

  final String id;
  final String title;
  final String population;
  final String dose;
  final String whenToUse;
  final String duration;
  final String monitoring;
  final String caveat;
  final String sourceLabel;
}

class VitaminToolkitEntry {
  const VitaminToolkitEntry({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.coreRule,
    required this.forms,
    required this.pathways,
    required this.safety,
  });

  final VitaminId id;
  final String name;
  final String nameAr;
  final String coreRule;
  final List<VitaminForm> forms;
  final List<VitaminPathway> pathways;
  final List<String> safety;
}

class MitochondrialSupportItem {
  const MitochondrialSupportItem({
    required this.ingredient,
    required this.whenUsed,
    required this.dose,
    required this.evidence,
    required this.safetyLock,
    required this.sourceLabel,
  });

  final String ingredient;
  final String whenUsed;
  final String dose;
  final String evidence;
  final String safetyLock;
  final String sourceLabel;
}
