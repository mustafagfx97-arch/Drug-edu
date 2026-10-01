import '../../data/supplement_profiles.dart';
import '../../hair_loss/data/hair_loss_data.dart';
import '../../herbals/data/herbal_toolkit_data.dart';
import '../../joints/data/joint_toolkit_data.dart';
import '../../minerals/data/mineral_toolkit_data.dart';
import '../../nerve_hair/data/nerve_hair_data.dart';
import '../../probiotics/data/probiotic_atlas_data.dart';
import '../../reproductive/data/reproductive_toolkit_data.dart';
import '../../specialty/data/specialty_toolkit_data.dart';
import '../../vitamins/data/vitamin_toolkit_data.dart';
import '../domain/supplement_library_entry.dart';

const supplementLibraryCategories = <SupplementLibraryCategory>[
  SupplementLibraryCategory(
    id: 'vitamins',
    title: 'Vitamins',
    subtitle:
        'A, B-complex, C, D, E and K with forms, daily needs, prevention, treatment and safety boundaries.',
  ),
  SupplementLibraryCategory(
    id: 'minerals',
    title: 'Minerals & Salts',
    subtitle:
        'Iron, calcium, magnesium, zinc and additional minerals with elemental-content and salt-specific counseling.',
  ),
  SupplementLibraryCategory(
    id: 'probiotics',
    title: 'Probiotics & Microbiome',
    subtitle:
        'Exact strains, strain combinations, CFU regimens, prebiotics, synbiotics, postbiotics and product-technique examples.',
  ),
  SupplementLibraryCategory(
    id: 'gi-specialty',
    title: 'GI & Specialty Supplements',
    subtitle:
        'Digestive enzymes, DAO, peppermint oil, liver/metabolic supplements and other targeted specialty products.',
  ),
  SupplementLibraryCategory(
    id: 'herbals',
    title: 'Herbals, Menopause, Sleep & Cognition',
    subtitle:
        'Extract-specific herbal evidence, doses, duration, interactions and evidence boundaries.',
  ),
  SupplementLibraryCategory(
    id: 'joints',
    title: 'Joint, Collagen & Connective Tissue',
    subtitle:
        'Glucosamine, chondroitin, collagen types, MSM, oral hyaluronic acid and SAMe.',
  ),
  SupplementLibraryCategory(
    id: 'reproductive',
    title: 'Sexual Health & Fertility',
    subtitle:
        'Male/female sexual function and fertility adjuncts kept separate, with exact study-dose and referral boundaries.',
  ),
  SupplementLibraryCategory(
    id: 'nerve-hair',
    title: 'Nerves, Hair, Skin & Nails',
    subtitle:
        'Biotin, B vitamins, alpha-lipoic acid, acetyl-L-carnitine and high-potency B-complex safety.',
  ),
  SupplementLibraryCategory(
    id: 'hair-loss',
    title: 'Hair Loss & Scalp Support',
    subtitle:
        'Diagnosis-first guide to hair nutraceuticals, ampoules, lotions, serums and supportive shampoos with exact brand directions and evidence limits.',
  ),
  SupplementLibraryCategory(
    id: 'general',
    title: 'General & Performance Supplements',
    subtitle:
        'Omega-3, creatine, CoQ10, choline, melatonin and other common non-vitamin/mineral supplements.',
  ),
  SupplementLibraryCategory(
    id: 'pediatric',
    title: 'Pediatric Supplements',
    subtitle:
        'Infant and child supplement profiles with age/product-specific safety checks.',
  ),
  SupplementLibraryCategory(
    id: 'combinations',
    title: 'Combination Products',
    subtitle:
        'Multivitamin, multimineral and prenatal combinations with duplication and total-intake checks.',
  ),
  SupplementLibraryCategory(
    id: 'sports-growth',
    title: 'Sports, Amino Acids & Growth Products',
    subtitle:
        'Products marketed for performance or growth, with evidence and safety separated from marketing claims.',
  ),
  SupplementLibraryCategory(
    id: 'safety',
    title: 'Safety & High-Risk Products',
    subtitle:
        'Weight-loss, misleading, high-risk or inappropriate supplement products and common safety traps.',
  ),
];

const _deepMineralIds = <String>{
  'oral-iron-salts',
  'calcium',
  'magnesium',
  'zinc',
};

bool _includeLegacyProfile(String id, String group) {
  if (group == 'Vitamins') return false;
  if (group == 'Minerals' && _deepMineralIds.contains(id)) return false;
  if (id == 'probiotics') return false;
  return true;
}

String _legacyCategory(String group) => switch (group) {
      'Minerals' => 'minerals',
      'Pediatric supplements' => 'pediatric',
      'Combination products' => 'combinations',
      'Growth / amino-acid products' => 'sports-growth',
      'Safety review' => 'safety',
      _ => 'general',
    };

final supplementLibraryEntries = <SupplementLibraryEntry>[
  for (final entry in vitaminToolkitEntries)
    SupplementLibraryEntry(
      id: 'vitamin:' + entry.id.name,
      categoryId: 'vitamins',
      title: entry.name,
      subtitle: entry.coreRule,
      destination: SupplementLibraryDestination.vitaminToolkit,
      targetId: entry.id.name,
      searchText: [
        for (final form in entry.forms) form.name,
        for (final pathway in entry.pathways)
          [pathway.title, pathway.population, pathway.dose].join(' '),
      ].join(' '),
    ),
  for (final entry in mineralToolkitEntries)
    SupplementLibraryEntry(
      id: 'mineral:' + entry.id.name,
      categoryId: 'minerals',
      title: entry.name,
      subtitle: entry.coreRule,
      destination: SupplementLibraryDestination.mineralToolkit,
      targetId: entry.id.name,
      searchText: [
        for (final preset in entry.presets) [preset.name, preset.note].join(' '),
        for (final protocol in entry.protocols)
          [protocol.title, protocol.population, protocol.dose].join(' '),
      ].join(' '),
    ),
  for (final profile in probioticProfiles)
    SupplementLibraryEntry(
      id: 'probiotic:' + profile.id,
      categoryId: 'probiotics',
      title: profile.displayName,
      subtitle: profile.organismType + ' · ' + profile.keyRule,
      destination: SupplementLibraryDestination.probioticAtlas,
      targetId: profile.id,
      searchText: [
        for (final use in profile.uses)
          [
            use.indication,
            use.population,
            use.dose,
            use.duration,
            use.sourceLabel,
          ].join(' '),
      ].join(' '),
    ),
  for (final item in microbiomeAdjuncts)
    SupplementLibraryEntry(
      id: 'microbiome:' + item.name,
      categoryId: 'probiotics',
      title: item.name,
      subtitle: item.category + ' · ' + item.dose,
      destination: SupplementLibraryDestination.microbiomeOverview,
      targetId: '',
      searchText: [item.use, item.caveat, item.sourceLabel].join(' '),
    ),
  for (final item in specialtyIngredients)
    SupplementLibraryEntry(
      id: 'specialty:' + item.id,
      categoryId: 'gi-specialty',
      title: item.name,
      subtitle: item.category + ' · ' + item.keyRule,
      destination: SupplementLibraryDestination.specialtyToolkit,
      targetId: item.id,
      searchText: [
        for (final use in item.uses)
          [
            use.indication,
            use.population,
            use.dose,
            use.duration,
            use.sourceLabel,
          ].join(' '),
      ].join(' '),
    ),
  for (final profile in herbalProfiles)
    SupplementLibraryEntry(
      id: 'herbal:' + profile.id,
      categoryId: 'herbals',
      title: profile.name,
      subtitle: profile.category + ' · ' + profile.keyRule,
      destination: SupplementLibraryDestination.herbalToolkit,
      targetId: profile.id,
      searchText: [
        for (final use in profile.uses)
          [
            use.indication,
            use.formOrExtract,
            use.dose,
            use.duration,
            use.sourceLabel,
          ].join(' '),
      ].join(' '),
    ),
  for (final profile in jointSupplementProfiles)
    SupplementLibraryEntry(
      id: 'joint:' + profile.id,
      categoryId: 'joints',
      title: profile.name,
      subtitle: profile.category + ' · ' + profile.coreRule,
      destination: SupplementLibraryDestination.jointToolkit,
      targetId: profile.id,
      searchText: [
        for (final form in profile.forms) [form.name, form.meaning].join(' '),
        for (final use in profile.uses)
          [use.indication, use.form, use.dose, use.duration].join(' '),
      ].join(' '),
    ),
  for (final profile in reproductiveProfiles)
    SupplementLibraryEntry(
      id: 'reproductive:' + profile.id,
      categoryId: 'reproductive',
      title: profile.name,
      subtitle: profile.domain + ' · ' + profile.coreRule,
      destination: SupplementLibraryDestination.reproductiveToolkit,
      targetId: profile.id,
      searchText: [
        for (final use in profile.uses)
          [use.indication, use.form, use.dose, use.duration].join(' '),
      ].join(' '),
    ),
  for (final profile in nerveHairProfiles)
    SupplementLibraryEntry(
      id: 'nerve-hair:' + profile.id,
      categoryId: 'nerve-hair',
      title: profile.name,
      subtitle: profile.domain + ' · ' + profile.coreRule,
      destination: SupplementLibraryDestination.nerveHairToolkit,
      targetId: profile.id,
      searchText: [
        for (final use in profile.uses)
          [use.indication, use.dose, use.duration, use.sourceLabel].join(' '),
      ].join(' '),
    ),
  for (final product in hairLossProducts)
    SupplementLibraryEntry(
      id: 'hair-loss:' + product.id,
      categoryId: 'hair-loss',
      title: product.brand + ' — ' + product.name,
      subtitle: product.bestFor,
      destination: SupplementLibraryDestination.hairLossToolkit,
      targetId: product.id,
      searchText: [
        product.keyIngredients,
        product.regimen,
        product.duration,
        product.evidenceNote,
        product.productLock,
        product.sourceLabel,
      ].join(' '),
    ),
  for (final profile in supplementProfiles)
    if (_includeLegacyProfile(profile.id, profile.group))
      SupplementLibraryEntry(
        id: 'profile:' + profile.id,
        categoryId: _legacyCategory(profile.group),
        title: profile.name,
        subtitle: profile.subtitle,
        destination: SupplementLibraryDestination.legacyProfile,
        targetId: profile.id,
        searchText: [
          profile.formulation,
          profile.howToTakeEn,
          profile.useBasis,
          profile.monitoringEn,
          for (final term in profile.searchTerms) term,
          for (final variant in profile.saltVariants)
            [variant.name, variant.formula, variant.practicalUse].join(' '),
        ].join(' '),
      ),
]..sort((a, b) {
    final category = a.categoryId.compareTo(b.categoryId);
    if (category != 0) return category;
    return a.title.toLowerCase().compareTo(b.title.toLowerCase());
  });

List<SupplementLibraryEntry> supplementLibraryEntriesFor(String categoryId) =>
    supplementLibraryEntries
        .where((entry) => entry.categoryId == categoryId)
        .toList(growable: false);

List<SupplementLibraryEntry> searchSupplementLibrary(String query) {
  final q = query.trim();
  if (q.isEmpty) return const [];
  return supplementLibraryEntries
      .where((entry) => entry.matches(q))
      .toList(growable: false);
}
