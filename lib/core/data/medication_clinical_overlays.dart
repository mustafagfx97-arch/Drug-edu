import '../models/medication.dart';
import 'legacy_medication_overlays_a.dart';
import 'legacy_medication_overlays_b.dart';
import 'legacy_medication_overlays_c.dart';
import 'medication_clinical_overlay.dart';

const legacyMedicationClinicalOverlays = <String, MedicationClinicalOverlay>{
  ...legacyMedicationOverlaysA,
  ...legacyMedicationOverlaysB,
  ...legacyMedicationOverlaysC,
};

MedicationClinicalOverlay? medicationClinicalOverlayFor(String medicationId) {
  return legacyMedicationClinicalOverlays[medicationId];
}

MedicationUseProfile resolvedMedicationUseProfile(Medication medication) {
  if (!medication.useProfile.isEmpty) return medication.useProfile;
  return medicationClinicalOverlayFor(medication.id)?.useProfile ??
      const MedicationUseProfile();
}

List<String> resolvedMedicationAliases(Medication medication) {
  final merged = <String>{
    ...medication.aliases,
    ...?medicationClinicalOverlayFor(medication.id)?.aliases,
  };
  return merged.toList(growable: false);
}

String resolvedMedicationSourceLabel(Medication medication) {
  final overlay = medicationClinicalOverlayFor(medication.id);
  if (overlay != null && overlay.sourceLabel.trim().isNotEmpty) {
    return overlay.sourceLabel.trim();
  }
  return medication.sourceLabel;
}

String resolvedMedicationReviewStatus(Medication medication) {
  return medicationClinicalOverlayFor(medication.id)?.reviewStatus ??
      medication.reviewStatus;
}

String resolvedMedicationLastReviewed(Medication medication) {
  return medicationClinicalOverlayFor(medication.id)?.lastReviewed ??
      medication.lastReviewed;
}
