enum ExpandedSupplementSection {
  general,
  pediatric,
  combinations,
  sportsGrowth,
  safety,
}

enum ExpandedEvidence {
  strong,
  moderate,
  contextSpecific,
  limited,
  insufficient,
  notRecommended,
  avoid,
  regulatoryWarning,
}

class ExpandedDosePathway {
  const ExpandedDosePathway({
    required this.title,
    required this.population,
    required this.dose,
    required this.timing,
    required this.duration,
    required this.note,
  });

  final String title;
  final String population;
  final String dose;
  final String timing;
  final String duration;
  final String note;
}

class ExpandedSupplementProfile {
  const ExpandedSupplementProfile({
    required this.id,
    required this.section,
    required this.name,
    required this.subtitle,
    required this.coreRule,
    required this.whyUsed,
    required this.evidence,
    required this.dosePathways,
    required this.administration,
    required this.commonActionable,
    required this.interactions,
    required this.monitoring,
    required this.avoidOrRefer,
    required this.labelChecks,
    required this.sourceLabel,
    this.searchTerms = const [],
  });

  final String id;
  final ExpandedSupplementSection section;
  final String name;
  final String subtitle;
  final String coreRule;
  final String whyUsed;
  final ExpandedEvidence evidence;
  final List<ExpandedDosePathway> dosePathways;
  final List<String> administration;
  final List<String> commonActionable;
  final List<String> interactions;
  final List<String> monitoring;
  final List<String> avoidOrRefer;
  final List<String> labelChecks;
  final String sourceLabel;
  final List<String> searchTerms;
}

String expandedSectionId(ExpandedSupplementSection section) => switch (section) {
      ExpandedSupplementSection.general => 'general',
      ExpandedSupplementSection.pediatric => 'pediatric',
      ExpandedSupplementSection.combinations => 'combinations',
      ExpandedSupplementSection.sportsGrowth => 'sports-growth',
      ExpandedSupplementSection.safety => 'safety',
    };
