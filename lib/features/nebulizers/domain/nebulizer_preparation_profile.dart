class NebulizerDosePreparation {
  const NebulizerDosePreparation({
    required this.label,
    required this.prescribedDose,
    required this.sourceStrength,
    required this.drawVolume,
    required this.diluent,
    required this.finalVolume,
  });

  final String label;
  final String prescribedDose;
  final String sourceStrength;
  final String drawVolume;
  final String diluent;
  final String finalVolume;
}

class NebulizerPreparationProfile {
  const NebulizerPreparationProfile({
    required this.id,
    required this.name,
    required this.formulation,
    required this.status,
    required this.device,
    required this.preparation,
    required this.administration,
    required this.mixing,
    required this.doNot,
    required this.cleaning,
    required this.practicalAr,
    required this.source,
    this.doses = const [],
  });

  final String id;
  final String name;
  final String formulation;
  final String status;
  final String device;
  final List<NebulizerDosePreparation> doses;
  final List<String> preparation;
  final List<String> administration;
  final String mixing;
  final List<String> doNot;
  final String cleaning;
  final String practicalAr;
  final String source;
}
