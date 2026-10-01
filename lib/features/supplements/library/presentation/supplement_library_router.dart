import 'package:flutter/material.dart';

import '../../data/supplement_profiles.dart';
import '../../expanded_catalog/presentation/expanded_supplement_detail_screen.dart';
import '../../hair_loss/presentation/hair_loss_toolkit_screen.dart';
import '../../herbals/presentation/herbal_toolkit_screen.dart';
import '../../joints/presentation/joint_toolkit_screen.dart';
import '../../minerals/domain/mineral_toolkit_models.dart';
import '../../minerals/presentation/mineral_toolkit_screen.dart';
import '../../nerve_hair/presentation/nerve_hair_screen.dart';
import '../../probiotics/presentation/probiotic_atlas_screen.dart';
import '../../reproductive/presentation/reproductive_toolkit_screen.dart';
import '../../specialty/presentation/specialty_toolkit_screen.dart';
import '../../vitamins/domain/vitamin_toolkit_models.dart';
import '../../vitamins/presentation/vitamin_toolkit_screen.dart';
import '../domain/supplement_library_entry.dart';
import 'supplement_encyclopedia_detail_screen.dart';

void openSupplementLibraryEntry(
  BuildContext context,
  SupplementLibraryEntry entry,
) {
  final Widget screen = switch (entry.destination) {
    SupplementLibraryDestination.legacyProfile =>
      SupplementEncyclopediaDetailScreen(
        profile: supplementProfiles.singleWhere(
          (profile) => profile.id == entry.targetId,
        ),
      ),
    SupplementLibraryDestination.vitaminToolkit => VitaminToolkitScreen(
        initialId: VitaminId.values.singleWhere(
          (value) => value.name == entry.targetId,
        ),
      ),
    SupplementLibraryDestination.mineralToolkit => MineralToolkitScreen(
        initialId: MineralId.values.singleWhere(
          (value) => value.name == entry.targetId,
        ),
      ),
    SupplementLibraryDestination.probioticAtlas => ProbioticAtlasScreen(
        initialProfileId: entry.targetId,
      ),
    SupplementLibraryDestination.microbiomeOverview =>
      const ProbioticAtlasScreen(),
    SupplementLibraryDestination.specialtyToolkit => SpecialtyToolkitScreen(
        initialProfileId: entry.targetId,
      ),
    SupplementLibraryDestination.herbalToolkit => HerbalToolkitScreen(
        initialProfileId: entry.targetId,
      ),
    SupplementLibraryDestination.jointToolkit => JointToolkitScreen(
        initialProfileId: entry.targetId,
      ),
    SupplementLibraryDestination.reproductiveToolkit =>
      ReproductiveToolkitScreen(initialProfileId: entry.targetId),
    SupplementLibraryDestination.nerveHairToolkit => NerveHairScreen(
        initialProfileId: entry.targetId,
      ),
    SupplementLibraryDestination.hairLossToolkit => HairLossToolkitScreen(
        initialProductId: entry.targetId,
      ),
    SupplementLibraryDestination.expandedCatalog =>
      ExpandedSupplementDetailScreen(profileId: entry.targetId),
  };

  Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
}
