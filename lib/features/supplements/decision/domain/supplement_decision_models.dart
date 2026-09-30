enum SupplementDecisionFlag {
  healthyWellnessOnly,
  planningOrCouldBecomePregnant,
  breastfedOrPartiallyBreastfedInfant,
  strictVegan,
  age75Plus,
  knownDeficiency,
  symptomsOrDeficiencyRisk,
  malabsorptionOrBariatricSurgery,
  kidneyDisease,
  prescriptionMedicines,
  multipleSupplements,
}

enum SupplementDecisionTier {
  foundation,
  preventive,
  testFirst,
  clinicianReview,
  productSafety,
}

class SupplementDecisionPrompt {
  const SupplementDecisionPrompt({
    required this.flag,
    required this.titleAr,
    required this.titleEn,
    required this.detailAr,
  });

  final SupplementDecisionFlag flag;
  final String titleAr;
  final String titleEn;
  final String detailAr;
}

class SupplementDecisionAction {
  const SupplementDecisionAction({
    required this.id,
    required this.tier,
    required this.titleAr,
    required this.titleEn,
    required this.patientActionAr,
    required this.clinicalNoteEn,
    required this.sourceLabel,
  });

  final String id;
  final SupplementDecisionTier tier;
  final String titleAr;
  final String titleEn;
  final String patientActionAr;
  final String clinicalNoteEn;
  final String sourceLabel;
}

class SupplementLabRule {
  const SupplementLabRule({
    required this.titleAr,
    required this.titleEn,
    required this.bodyAr,
    required this.clinicalNoteEn,
    required this.sourceLabel,
  });

  final String titleAr;
  final String titleEn;
  final String bodyAr;
  final String clinicalNoteEn;
  final String sourceLabel;
}
