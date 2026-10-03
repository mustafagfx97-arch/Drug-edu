import 'package:flutter_test/flutter_test.dart';

import 'package:drug_edu/core/data/sample_medications.dart';
import 'package:drug_edu/features/medication_timing/domain/medication_timing_catalog.dart';
import 'package:drug_edu/features/medication_plan/domain/medication_timing_rules.dart';

void main() {
  group('Patient education timing hub batch 1', () {
    test('classifies representative verified timing rules conservatively', () {
      final levothyroxine = medicationTimingProfileFor('levothyroxine');
      expect(
        levothyroxine.foodCategory,
        FoodTimingCategory.beforeFoodOrEmptyStomach,
      );
      expect(levothyroxine.dayCategory, DayTimingCategory.morning);

      final metformin = medicationTimingProfileFor('metformin');
      expect(
        metformin.foodCategory,
        FoodTimingCategory.withOrAfterFood,
      );
      expect(
        metformin.dayCategory,
        DayTimingCategory.regimenSpecific,
      );

      final furosemide = medicationTimingProfileFor('furosemide');
      expect(
        furosemide.foodCategory,
        FoodTimingCategory.noMealAnchor,
      );
      expect(furosemide.dayCategory, DayTimingCategory.morning);

      final latanoprost = medicationTimingProfileFor('latanoprost');
      expect(
        latanoprost.foodCategory,
        FoodTimingCategory.noMealAnchor,
      );
      expect(
        latanoprost.dayCategory,
        DayTimingCategory.eveningBedtime,
      );

      final atorvastatin = medicationTimingProfileFor('atorvastatin');
      expect(
        atorvastatin.foodCategory,
        FoodTimingCategory.noMealAnchor,
      );
      expect(atorvastatin.dayCategory, DayTimingCategory.flexible);
    });

    test('product-specific rules never become falsely flexible', () {
      final rivaroxaban = medicationTimingProfileFor('rivaroxaban');

      expect(
        rivaroxaban.foodCategory,
        FoodTimingCategory.prescriptionSpecific,
      );
      expect(
        rivaroxaban.dayCategory,
        DayTimingCategory.regimenSpecific,
      );
      expect(rivaroxaban.requiresPrescriptionReview, isTrue);
    });

    test('missing timing rules are explicitly unverified', () {
      final unknown = medicationTimingProfileFor('not-in-catalog');

      expect(unknown.hasVerifiedRule, isFalse);
      expect(unknown.requiresPrescriptionReview, isTrue);
      expect(unknown.foodCategory, FoodTimingCategory.unverified);
      expect(unknown.dayCategory, DayTimingCategory.unverified);
    });

    test('every medication record resolves without guessing a missing rule', () {
      for (final medicine in sampleMedications) {
        final profile = medicationTimingProfileFor(medicine.id);
        expect(profile.medicationId, medicine.id);

        if (medicationTimingRules.containsKey(medicine.id)) {
          expect(profile.hasVerifiedRule, isTrue);
          expect(
            profile.foodCategory == FoodTimingCategory.unverified,
            isFalse,
          );
          expect(
            profile.dayCategory == DayTimingCategory.unverified,
            isFalse,
          );
        } else {
          expect(profile.hasVerifiedRule, isFalse);
          expect(profile.foodCategory, FoodTimingCategory.unverified);
          expect(profile.dayCategory, DayTimingCategory.unverified);
        }
      }
    });
  });
}
