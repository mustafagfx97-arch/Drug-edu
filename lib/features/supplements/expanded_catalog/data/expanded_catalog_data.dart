import '../domain/expanded_supplement_models.dart';
import 'combination_catalog_data.dart';
import 'general_catalog_data.dart';
import 'pediatric_catalog_data.dart';
import 'safety_catalog_data.dart';
import 'sports_growth_catalog_data.dart';

final expandedSupplementProfiles = <ExpandedSupplementProfile>[
  ...generalExpandedProfiles,
  ...pediatricExpandedProfiles,
  ...combinationExpandedProfiles,
  ...sportsGrowthExpandedProfiles,
  ...safetyExpandedProfiles,
];

List<ExpandedSupplementProfile> expandedProfilesFor(
  ExpandedSupplementSection section,
) =>
    expandedSupplementProfiles
        .where((item) => item.section == section)
        .toList(growable: false);

ExpandedSupplementProfile expandedSupplementProfile(String id) =>
    expandedSupplementProfiles.singleWhere((item) => item.id == id);
