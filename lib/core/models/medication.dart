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
    this.hasIvPreparation = false,
    this.hasCalculator = false,
    this.hasVisualGuide = false,
    this.isDemo = true,
  });

  final String id;
  final String familyId;
  final String name;
  final String subtitle;
  final List<String> tags;
  final List<MedicationSection> sections;
  final PatientCounselingData patient;
  final bool hasIvPreparation;
  final bool hasCalculator;
  final bool hasVisualGuide;
  final bool isDemo;
}
