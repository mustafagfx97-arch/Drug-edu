class PatientCardData {
  const PatientCardData({
    required this.id,
    required this.templateName,
    required this.medicationName,
    required this.subtitle,
    required this.instructionsAr,
    required this.category,
    this.patientName,
  });

  final String id;
  final String templateName;
  final String medicationName;
  final String subtitle;
  final String instructionsAr;
  final String category;
  final String? patientName;

  PatientCardData copyWith({
    String? id,
    String? templateName,
    String? medicationName,
    String? subtitle,
    String? instructionsAr,
    String? category,
    String? patientName,
  }) {
    return PatientCardData(
      id: id ?? this.id,
      templateName: templateName ?? this.templateName,
      medicationName: medicationName ?? this.medicationName,
      subtitle: subtitle ?? this.subtitle,
      instructionsAr: instructionsAr ?? this.instructionsAr,
      category: category ?? this.category,
      patientName: patientName ?? this.patientName,
    );
  }

  String toQrText() {
    final buffer = StringBuffer()
      ..writeln('Drug Edu')
      ..writeln(medicationName)
      ..writeln(subtitle)
      ..writeln()
      ..writeln(instructionsAr);

    return buffer.toString().trim();
  }
}
