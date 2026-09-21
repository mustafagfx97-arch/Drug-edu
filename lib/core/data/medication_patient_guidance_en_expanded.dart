part of 'medication_patient_guidance_en.dart';

class _ReviewedEn extends EnglishPatientCounseling {
  const _ReviewedEn({
    required String purpose,
    required String how,
    required String timing,
    required String duration,
    required String important,
    required String missed,
    required String help,
    required String teach,
    String common = '',
    String storage = '',
  }) : super(
          purpose: purpose,
          howToUse: how,
          timing: timing,
          duration: duration,
          important: important,
          missedDose: missed,
          seekHelp: help,
          teachBack: teach,
          commonActionable: common,
          storage: storage,
        );
}

const reviewedEnglishPatientCounselingExpansion =
    <String, EnglishPatientCounseling>{
};
