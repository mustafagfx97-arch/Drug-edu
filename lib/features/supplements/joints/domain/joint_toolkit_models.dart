enum JointEvidence {
  moderate,
  limited,
  conflicting,
  insufficient,
  againstRoutineUse,
}

class JointForm {
  const JointForm({
    required this.name,
    required this.meaning,
  });

  final String name;
  final String meaning;
}

class JointUse {
  const JointUse({
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
  final JointEvidence evidence;
  final String caveat;
  final String sourceLabel;
}

class JointSupplementProfile {
  const JointSupplementProfile({
    required this.id,
    required this.name,
    required this.category,
    required this.coreRule,
    required this.forms,
    required this.uses,
    required this.safety,
  });

  final String id;
  final String name;
  final String category;
  final String coreRule;
  final List<JointForm> forms;
  final List<JointUse> uses;
  final List<String> safety;
}

class CollagenTypeReference {
  const CollagenTypeReference({
    required this.type,
    required this.whereItMatters,
    required this.supplementMeaning,
  });

  final String type;
  final String whereItMatters;
  final String supplementMeaning;
}
