class MedicationClinicalDetail {
  const MedicationClinicalDetail({
    this.therapyDuration = '',
    this.exactAdministration = '',
    this.formulationHandling = '',
    this.monitoring = '',
    this.interactions = '',
    this.specialPopulations = '',
    this.feedingTube = '',
    this.clinicalPearls = '',
    this.commonMistakes = '',
    this.source = '',
  });

  final String therapyDuration;
  final String exactAdministration;
  final String formulationHandling;
  final String monitoring;
  final String interactions;
  final String specialPopulations;
  final String feedingTube;
  final String clinicalPearls;
  final String commonMistakes;
  final String source;

  bool get isEmpty =>
      therapyDuration.isEmpty &&
      exactAdministration.isEmpty &&
      formulationHandling.isEmpty &&
      monitoring.isEmpty &&
      interactions.isEmpty &&
      specialPopulations.isEmpty &&
      feedingTube.isEmpty &&
      clinicalPearls.isEmpty &&
      commonMistakes.isEmpty;
}
