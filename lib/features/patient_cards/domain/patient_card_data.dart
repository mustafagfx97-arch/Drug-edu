class PatientCardData {
  const PatientCardData({
    required this.id,
    required this.templateName,
    required this.medicationName,
    required this.subtitleAr,
    required this.category,
    required this.howToUseAr,
    this.purposeAr = '',
    this.timingAr = '',
    this.importantAr = '',
    this.missedDoseAr = '',
    this.seekHelpAr = '',
  });

  final String id;
  final String templateName;
  final String medicationName;
  final String subtitleAr;
  final String category;

  final String purposeAr;
  final String howToUseAr;
  final String timingAr;
  final String importantAr;
  final String missedDoseAr;
  final String seekHelpAr;

  PatientCardData copyWith({
    String? id,
    String? templateName,
    String? medicationName,
    String? subtitleAr,
    String? category,
    String? purposeAr,
    String? howToUseAr,
    String? timingAr,
    String? importantAr,
    String? missedDoseAr,
    String? seekHelpAr,
  }) {
    return PatientCardData(
      id: id ?? this.id,
      templateName: templateName ?? this.templateName,
      medicationName: medicationName ?? this.medicationName,
      subtitleAr: subtitleAr ?? this.subtitleAr,
      category: category ?? this.category,
      purposeAr: purposeAr ?? this.purposeAr,
      howToUseAr: howToUseAr ?? this.howToUseAr,
      timingAr: timingAr ?? this.timingAr,
      importantAr: importantAr ?? this.importantAr,
      missedDoseAr: missedDoseAr ?? this.missedDoseAr,
      seekHelpAr: seekHelpAr ?? this.seekHelpAr,
    );
  }

  List<PatientCardItem> get items {
    final items = <PatientCardItem>[];

    void add(String title, String body) {
      if (body.trim().isNotEmpty) {
        items.add(PatientCardItem(titleAr: title, bodyAr: body.trim()));
      }
    }

    add('لماذا أستخدمه؟', purposeAr);
    add('كيف أستخدمه؟', howToUseAr);
    add('متى أستخدمه؟', timingAr);
    add('أهم تنبيه', importantAr);
    add('إذا نسيت الجرعة', missedDoseAr);
    add('متى أطلب المساعدة؟', seekHelpAr);

    return items;
  }

  String toQrText() {
    final buffer = StringBuffer()
      ..writeln(medicationName)
      ..writeln(subtitleAr)
      ..writeln();

    for (final item in items) {
      buffer
        ..writeln(item.titleAr)
        ..writeln(item.bodyAr)
        ..writeln();
    }

    return buffer.toString().trim();
  }
}

class PatientCardItem {
  const PatientCardItem({
    required this.titleAr,
    required this.bodyAr,
  });

  final String titleAr;
  final String bodyAr;
}
