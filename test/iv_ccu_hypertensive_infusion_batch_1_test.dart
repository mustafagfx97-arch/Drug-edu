import 'package:flutter_test/flutter_test.dart';

import 'package:drug_edu/features/iv_prep/data/iv_preparation_profiles.dart';
import 'package:drug_edu/features/iv_prep/data/iv_medication_catalog.dart';
import 'package:drug_edu/features/iv_prep/data/iv_infusion_rate_profiles.dart';
import 'package:drug_edu/features/iv_prep/domain/iv_infusion_rate_engine.dart';

void main() {
  IvPreparationProfile general(String name) =>
      findIvPreparationProfile(name, 'General')!;

  test('new CCU medicines have exactly one labeled verified profile', () {
    for (final name in [
      'Nicardipine',
      'Clevidipine',
      'Sodium nitroprusside',
    ]) {
      expect(
        ivPreparationProfiles.where(
          (p) => p.name == name && p.population == 'General',
        ),
        hasLength(1),
      );
      expect(
        ivMedicationCatalog.where(
          (entry) => entry.name == name &&
              entry.population == 'General' &&
              entry.structured,
        ),
        hasLength(1),
      );
      expect(general(name).criticalLocks, isNotEmpty);
      expect(general(name).sourceLabel, contains('dailymed.nlm.nih.gov'));
    }
  });

  test('CARDENE concentrate is not final infusion and excludes LR', () {
    final p = general('Nicardipine');
    expect(p.calculatorVariants.single.concentration, 2.5);
    expect(p.resultingConcentration, contains('0.1 mg/mL'));
    expect(p.furtherDilution, contains('240 mL'));
    expect(p.incompatibilities, contains('Lactated Ringer'));
    expect(p.incompatibilities, contains('Sodium Bicarbonate 5%'));
  });

  test('Cleviprex stays ready-to-use, non-Y-site, 12 hours', () {
    final p = general('Clevidipine');
    expect(p.calculatorVariants.single.concentration, 0.5);
    expect(p.furtherDilution, contains('DO NOT DILUTE'));
    expect(p.incompatibilities, contains('SAME LINE'));
    expect(p.stability, contains('12 hours'));
    expect(p.criticalLocks.join(' '), contains('soybean/egg'));
  });

  test('sodium nitroprusside must be diluted in D5W and protected', () {
    final p = general('Sodium nitroprusside');
    expect(p.allowedDiluents, contains('ONLY sterile D5W'));
    expect(p.furtherDilution, contains('250 to 1000 mL'));
    expect(p.furtherDilution, contains('light-protection'));
    expect(p.criticalLocks.join(' '), contains('cyanide'));
    expect(
      ivInfusionRateProfiles.where(
        (entry) => entry.name.toLowerCase().contains('nitroprusside'),
      ),
      isEmpty,
    );
  });

  test('exact final infusion strengths and unique preset IDs', () {
    expect(ivInfusionRateProfiles.length, 5);
    final ids = ivInfusionRateProfiles.map((p) => p.id).toList();
    expect(ids.toSet().length, ids.length);
    expect(
      ivInfusionRateProfiles
          .map((p) => p.finalMicrogramsPerMilliliter)
          .toList(),
      [100, 500, 10000, 4, 100],
    );
  });

  test('NICARDIPINE 5 mg/hr at 0.1 mg/mL gives 50 mL/hr', () {
    final result = calculateOrderedIvInfusion(
      prescribedRate: 5,
      rateUnit: IvOrderedRateUnit.mgPerHour,
      finalMicrogramsPerMilliliter: 100,
    )!;
    expect(result.microgramsPerHour, 5000);
    expect(result.millilitersPerHour, 50);
  });

  test('CLEVIDIPINE 2 mg/hr at 0.5 mg/mL gives 4 mL/hr', () {
    final result = calculateOrderedIvInfusion(
      prescribedRate: 2,
      rateUnit: IvOrderedRateUnit.mgPerHour,
      finalMicrogramsPerMilliliter: 500,
    )!;
    expect(result.millilitersPerHour, 4);
  });

  test('ESMOLOL 50 mcg/kg/min for 70 kg, 10 mg/mL gives 21 mL/hr', () {
    final result = calculateOrderedIvInfusion(
      prescribedRate: 50,
      rateUnit: IvOrderedRateUnit.mcgPerKgMin,
      weightKg: 70,
      finalMicrogramsPerMilliliter: 10000,
    )!;
    expect(result.microgramsPerHour, 210000);
    expect(result.millilitersPerHour, 21);
  });

  test('NOREPINEPHRINE 0.1 mcg/kg/min, 70 kg, 4 mcg/mL: 105 mL/hr', () {
    final result = calculateOrderedIvInfusion(
      prescribedRate: 0.1,
      rateUnit: IvOrderedRateUnit.mcgPerKgMin,
      weightKg: 70,
      finalMicrogramsPerMilliliter: 4,
    )!;
    expect(result.millilitersPerHour, closeTo(105, 1e-9));
  });

  test('rate engine distinguishes all prescribed order units', () {
    final nitro = calculateOrderedIvInfusion(
      prescribedRate: 10,
      rateUnit: IvOrderedRateUnit.mcgPerMin,
      finalMicrogramsPerMilliliter: 100,
    )!;
    expect(nitro.millilitersPerHour, 6);
    final mgKgHr = calculateOrderedIvInfusion(
      prescribedRate: 0.5,
      rateUnit: IvOrderedRateUnit.mgPerKgHour,
      weightKg: 20,
      finalMicrogramsPerMilliliter: 1000,
    )!;
    expect(mgKgHr.millilitersPerHour, 10);
  });

  test('invalid or incomplete inputs block all calculations', () {
    for (final invalid in [0.0, -2.0, double.nan, double.infinity]) {
      expect(
        calculateOrderedIvInfusion(
          prescribedRate: invalid,
          rateUnit: IvOrderedRateUnit.mgPerHour,
          finalMicrogramsPerMilliliter: 100,
        ),
        isNull,
      );
      expect(
        calculateOrderedIvInfusion(
          prescribedRate: 2,
          rateUnit: IvOrderedRateUnit.mgPerHour,
          finalMicrogramsPerMilliliter: invalid,
        ),
        isNull,
      );
      expect(
        calculateOrderedIvInfusion(
          prescribedRate: 2,
          rateUnit: IvOrderedRateUnit.mcgPerKgMin,
          finalMicrogramsPerMilliliter: 100,
          weightKg: invalid,
        ),
        isNull,
      );
    }
    expect(
      calculateOrderedIvInfusion(
        prescribedRate: 2,
        rateUnit: IvOrderedRateUnit.mcgPerKgMin,
        finalMicrogramsPerMilliliter: 100,
      ),
      isNull,
    );
    expect(
      calculateOrderedIvInfusion(
        prescribedRate: double.maxFinite,
        rateUnit: IvOrderedRateUnit.mgPerHour,
        finalMicrogramsPerMilliliter: 100,
      ),
      isNull,
    );
  });
}
