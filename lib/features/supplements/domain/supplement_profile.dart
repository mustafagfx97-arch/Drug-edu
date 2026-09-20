import '../../../core/models/medication.dart';

class SupplementProfile {
  const SupplementProfile({
    required this.id,
    required this.group,
    required this.name,
    required this.subtitle,
    required this.formulation,
    required this.howToTakeEn,
    required this.pharmacistSections,
    required this.patient,
    required this.sourceLabel,
    this.formulationAlert = '',
    this.useBasis = 'Individualized',
    this.monitoringEn = '',
    this.isPediatric = false,
  });

  final String id;
  final String group;
  final String name;
  final String subtitle;
  final String formulation;
  final String howToTakeEn;
  final String formulationAlert;
  final String useBasis;
  final String monitoringEn;
  final List<MedicationSection> pharmacistSections;
  final PatientCounselingData patient;
  final String sourceLabel;
  final bool isPediatric;
}
