import 'package:drug_edu/features/supplements/hair_loss/data/hair_loss_data.dart';
import 'package:drug_edu/features/supplements/herbals/data/herbal_toolkit_data.dart';
import 'package:drug_edu/features/supplements/joints/data/joint_toolkit_data.dart';
import 'package:drug_edu/features/supplements/library/data/supplement_library_catalog.dart';
import 'package:drug_edu/features/supplements/nerve_hair/data/nerve_hair_data.dart';
import 'package:drug_edu/features/supplements/probiotics/data/probiotic_atlas_data.dart';
import 'package:drug_edu/features/supplements/reproductive/data/reproductive_toolkit_data.dart';
import 'package:drug_edu/features/supplements/specialty/data/specialty_toolkit_data.dart';
import 'package:drug_edu/features/supplements/vitamins/data/vitamin_toolkit_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('unified encyclopedia exposes the deep supplement catalogs', () {
    expect(supplementLibraryEntries.length, greaterThanOrEqualTo(90));
    expect(
      supplementLibraryEntries.map((item) => item.id).toSet().length,
      supplementLibraryEntries.length,
    );

    expect(
      supplementLibraryEntriesFor('vitamins').length,
      vitaminToolkitEntries.length,
    );
    expect(
      supplementLibraryEntriesFor('probiotics').length,
      greaterThanOrEqualTo(
        probioticProfiles.length + microbiomeAdjuncts.length,
      ),
    );
    expect(
      supplementLibraryEntriesFor('gi-specialty').length,
      specialtyIngredients.length,
    );
    expect(
      supplementLibraryEntriesFor('herbals').length,
      herbalProfiles.length,
    );
    expect(
      supplementLibraryEntriesFor('joints').length,
      jointSupplementProfiles.length,
    );
    expect(
      supplementLibraryEntriesFor('reproductive').length,
      reproductiveProfiles.length,
    );
    expect(
      supplementLibraryEntriesFor('nerve-hair').length,
      nerveHairProfiles.length,
    );
    expect(
      supplementLibraryEntriesFor('hair-loss').length,
      hairLossProducts.length,
    );
  });

  test('probiotic strains are searchable as encyclopedia entries', () {
    for (final profile in probioticProfiles) {
      expect(
        supplementLibraryEntries.any(
          (item) =>
              item.categoryId == 'probiotics' &&
              item.title == profile.displayName,
        ),
        isTrue,
        reason: profile.displayName,
      );
    }

    expect(searchSupplementLibrary('LGG'), isNotEmpty);
    expect(searchSupplementLibrary('Saccharomyces boulardii'), isNotEmpty);
    expect(searchSupplementLibrary('BB-12'), isNotEmpty);
    expect(searchSupplementLibrary('synbiotic'), isNotEmpty);
  });

  test('major requested supplement families are globally searchable', () {
    for (final query in [
      'glucosamine',
      'collagen',
      'hyaluronic',
      'MSM',
      'biotin',
      'alpha-lipoic',
      'ashwagandha',
      'DAO',
      'maca',
      'citrulline',
      'creatine',
      'omega-3',
      'CoQ10',
      'Priorin Extra',
      'Crescina',
      'Foltène',
      'Cystiphane',
      'Neofollics',
      'Aminexil',
    ]) {
      expect(
        searchSupplementLibrary(query),
        isNotEmpty,
        reason: query,
      );
    }
  });

  test('library keeps organized visible categories', () {
    final ids = supplementLibraryCategories.map((item) => item.id).toSet();
    expect(
      ids,
      containsAll({
        'vitamins',
        'minerals',
        'probiotics',
        'gi-specialty',
        'herbals',
        'joints',
        'reproductive',
        'nerve-hair',
        'hair-loss',
        'general',
        'pediatric',
        'combinations',
        'sports-growth',
        'safety',
      }),
    );
  });
}
