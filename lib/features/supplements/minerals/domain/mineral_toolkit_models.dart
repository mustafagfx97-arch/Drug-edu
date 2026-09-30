enum MineralId { iron, calcium, magnesium, zinc }

class ElementalPreset {
  const ElementalPreset({
    required this.id,
    required this.name,
    required this.elementalFraction,
    required this.note,
    required this.sourceLabel,
  });

  final String id;
  final String name;
  final double? elementalFraction;
  final String note;
  final String sourceLabel;
}

class MineralProtocol {
  const MineralProtocol({
    required this.id,
    required this.title,
    required this.population,
    required this.dose,
    required this.frequency,
    required this.duration,
    required this.whenToUse,
    required this.monitoring,
    required this.caveat,
    required this.sourceLabel,
  });

  final String id;
  final String title;
  final String population;
  final String dose;
  final String frequency;
  final String duration;
  final String whenToUse;
  final String monitoring;
  final String caveat;
  final String sourceLabel;
}

class MineralInteraction {
  const MineralInteraction({
    required this.withItem,
    required this.separation,
    required this.note,
  });

  final String withItem;
  final String separation;
  final String note;
}

class MineralToolkitEntry {
  const MineralToolkitEntry({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.coreRule,
    required this.presets,
    required this.protocols,
    required this.interactions,
    required this.safety,
  });

  final MineralId id;
  final String name;
  final String nameAr;
  final String coreRule;
  final List<ElementalPreset> presets;
  final List<MineralProtocol> protocols;
  final List<MineralInteraction> interactions;
  final List<String> safety;
}

class ElementalConversionResult {
  const ElementalConversionResult({
    required this.saltAmountMg,
    required this.elementalAmountMg,
    required this.elementalFraction,
  });

  final double saltAmountMg;
  final double elementalAmountMg;
  final double elementalFraction;
}
