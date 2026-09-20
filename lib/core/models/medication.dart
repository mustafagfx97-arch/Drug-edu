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

class MedicationUseProfile {
  const MedicationUseProfile({
    this.route = '',
    this.foodTiming = '',
    this.duration = '',
    this.formulationHandling = '',
    this.monitoring = '',
    this.interactions = '',
    this.commonMistakes = '',
    this.specialPopulations = '',
  });

  final String route;
  final String foodTiming;
  final String duration;
  final String formulationHandling;
  final String monitoring;
  final String interactions;
  final String commonMistakes;
  final String specialPopulations;

  bool get isEmpty =>
      route.trim().isEmpty &&
      foodTiming.trim().isEmpty &&
      duration.trim().isEmpty &&
      formulationHandling.trim().isEmpty &&
      monitoring.trim().isEmpty &&
      interactions.trim().isEmpty &&
      commonMistakes.trim().isEmpty &&
      specialPopulations.trim().isEmpty;

  List<MedicationUseFact> get facts {
    final result = <MedicationUseFact>[];

    void add(String title, String value) {
      if (value.trim().isNotEmpty) {
        result.add(MedicationUseFact(title: title, value: value.trim()));
      }
    }

    add('Route / formulation', route);
    add('Food & timing', foodTiming);
    add('Therapy duration', duration);
    add('Crush / split / dosage-form handling', formulationHandling);
    add('Monitoring', monitoring);
    add('Important interactions', interactions);
    add('Common counseling mistakes', commonMistakes);
    add('Patient-specific considerations', specialPopulations);

    return result;
  }
}

class MedicationUseFact {
  const MedicationUseFact({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;
}

class PatientCounselingData {
  const PatientCounselingData({
    required this.purposeAr,
    required this.howToUseAr,
    this.timingAr = '',
    this.importantAr = '',
    this.commonActionableAr = '',
    this.missedDoseAr = '',
    this.storageAr = '',
    this.seekHelpAr = '',
    this.teachBackAr = '',
  });

  final String purposeAr;
  final String howToUseAr;
  final String timingAr;
  final String importantAr;
  final String commonActionableAr;
  final String missedDoseAr;
  final String storageAr;
  final String seekHelpAr;
  final String teachBackAr;

  List<PatientCounselingItem> get items {
    final result = <PatientCounselingItem>[];

    void add(String title, String value) {
      if (value.trim().isNotEmpty) {
        result.add(
          PatientCounselingItem(
            titleAr: title,
            bodyAr: value.trim(),
          ),
        );
      }
    }

    add('لماذا أستخدمه؟', purposeAr);
    add('كيف أستخدمه؟', howToUseAr);
    add('متى أستخدمه؟', timingAr);
    add('معلومة مهمة', importantAr);
    add('مشكلة شائعة قد تلاحظها', commonActionableAr);
    add('إذا نسيت الجرعة', missedDoseAr);
    add('الحفظ', storageAr);
    add('متى أطلب المساعدة؟', seekHelpAr);

    return result;
  }
}

class PatientCounselingItem {
  const PatientCounselingItem({
    required this.titleAr,
    required this.bodyAr,
  });

  final String titleAr;
  final String bodyAr;
}

class Medication {
  const Medication({
    required this.id,
    required this.familyId,
    required this.name,
    required this.subtitle,
    required this.tags,
    required this.sections,
    required this.patient,
    this.aliases = const [],
    this.useProfile = const MedicationUseProfile(),
    this.hasIvPreparation = false,
    this.hasCalculator = false,
    this.hasVisualGuide = false,
    this.sourceLabel = '',
    this.reviewStatus = 'Reviewed',
    this.lastReviewed = '2026-09',
    this.isDemo = true,
  });

  final String id;
  final String familyId;
  final String name;
  final String subtitle;
  final List<String> tags;
  final List<String> aliases;
  final List<MedicationSection> sections;
  final MedicationUseProfile useProfile;
  final PatientCounselingData patient;
  final bool hasIvPreparation;
  final bool hasCalculator;
  final bool hasVisualGuide;
  final String sourceLabel;
  final String reviewStatus;
  final String lastReviewed;
  final bool isDemo;
}
