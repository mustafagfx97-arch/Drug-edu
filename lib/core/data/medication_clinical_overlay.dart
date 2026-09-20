import '../models/medication.dart';

class MedicationClinicalOverlay {
  const MedicationClinicalOverlay({
    required this.useProfile,
    this.aliases = const [],
    this.sourceLabel = '',
    this.reviewStatus = 'Clinically structured · verify exact product/formulation',
    this.lastReviewed = '2026-09',
  });

  final MedicationUseProfile useProfile;
  final List<String> aliases;
  final String sourceLabel;
  final String reviewStatus;
  final String lastReviewed;
}
