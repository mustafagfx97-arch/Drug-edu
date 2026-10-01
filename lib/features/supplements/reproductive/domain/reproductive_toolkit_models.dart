enum ReproEvidence {
  guidelineRecommended,
  moderate,
  limited,
  conflicting,
  insufficient,
  researchOnly,
  againstRoutineUse,
}

class ReproUse {
  const ReproUse({
    required this.indication,
    required this.population,
    required this.form,
    required this.dose,
    required this.frequency,
    required this.duration,
    required this.exactUse,
    required this.evidence,
    required this.caveat,
    required this.sourceLabel,
  });

  final String indication;
  final String population;
  final String form;
  final String dose;
  final String frequency;
  final String duration;
  final String exactUse;
  final ReproEvidence evidence;
  final String caveat;
  final String sourceLabel;
}

class ReproProfile {
  const ReproProfile({
    required this.id,
    required this.name,
    required this.domain,
    required this.coreRule,
    required this.uses,
    required this.safety,
  });

  final String id;
  final String name;
  final String domain;
  final String coreRule;
  final List<ReproUse> uses;
  final List<String> safety;
}

class ReproAssessmentRule {
  const ReproAssessmentRule({
    required this.title,
    required this.who,
    required this.actions,
    required this.sourceLabel,
  });

  final String title;
  final String who;
  final List<String> actions;
  final String sourceLabel;
}
