enum SupplementLibraryDestination {
  legacyProfile,
  vitaminToolkit,
  mineralToolkit,
  probioticAtlas,
  microbiomeOverview,
  specialtyToolkit,
  herbalToolkit,
  jointToolkit,
  reproductiveToolkit,
  nerveHairToolkit,
  hairLossToolkit,
}

class SupplementLibraryEntry {
  const SupplementLibraryEntry({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.subtitle,
    required this.destination,
    required this.targetId,
    this.searchText = '',
  });

  final String id;
  final String categoryId;
  final String title;
  final String subtitle;
  final SupplementLibraryDestination destination;
  final String targetId;
  final String searchText;

  bool matches(String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return true;
    return [
      title,
      subtitle,
      categoryId,
      targetId,
      searchText,
    ].join(' ').toLowerCase().contains(q);
  }
}

class SupplementLibraryCategory {
  const SupplementLibraryCategory({
    required this.id,
    required this.title,
    required this.subtitle,
  });

  final String id;
  final String title;
  final String subtitle;
}
