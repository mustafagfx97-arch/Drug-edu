enum ClinicalPriority { critical, important, patientSpecific, reference }

class MedicationSection {
  const MedicationSection({
    required this.title,
    required this.body,
    this.priority = ClinicalPriority.important,
  });

  final String title;
  final String body;
  final ClinicalPriority priority;
}

class Medication {
  const Medication({
    required this.name,
    required this.subtitle,
    required this.tags,
    required this.sections,
    required this.patientCounselingAr,
    this.hasIvPreparation = false,
    this.hasCalculator = false,
    this.isDemo = true,
  });

  final String name;
  final String subtitle;
  final List<String> tags;
  final List<MedicationSection> sections;
  final String patientCounselingAr;
  final bool hasIvPreparation;
  final bool hasCalculator;
  final bool isDemo;
}
