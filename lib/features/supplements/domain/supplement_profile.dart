import '../../../core/models/medication.dart';

class SupplementSaltVariant {
  const SupplementSaltVariant({
    required this.id,
    required this.name,
    required this.elementalAmount,
    required this.practicalUse,
    required this.administration,
    required this.cautions,
    required this.source,
    this.formula = '',
    this.elementalPercent = '',
    this.example = '',
  });

  final String id;
  final String name;
  final String formula;
  final String elementalAmount;
  final String elementalPercent;
  final String example;
  final String practicalUse;
  final String administration;
  final String cautions;
  final String source;
}

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
    this.saltVariants = const [],
    this.searchTerms = const [],
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
  final List<SupplementSaltVariant> saltVariants;
  final List<String> searchTerms;
}
