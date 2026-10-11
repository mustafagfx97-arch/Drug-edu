/// Arithmetic for an already prescribed IV infusion; never chooses a dose.
enum IvOrderedRateUnit { mcgPerKgMin, mgPerKgHour, mcgPerMin, mgPerHour }

extension IvOrderedRateUnitText on IvOrderedRateUnit {
  String get display => switch (this) {
    IvOrderedRateUnit.mcgPerKgMin => 'mcg/kg/min',
    IvOrderedRateUnit.mgPerKgHour => 'mg/kg/hr',
    IvOrderedRateUnit.mcgPerMin => 'mcg/min',
    IvOrderedRateUnit.mgPerHour => 'mg/hr',
  };

  bool get needsWeight =>
      this == IvOrderedRateUnit.mcgPerKgMin ||
      this == IvOrderedRateUnit.mgPerKgHour;
}

class IvInfusionRateResult {
  const IvInfusionRateResult({
    required this.microgramsPerHour,
    required this.millilitersPerHour,
  });

  final double microgramsPerHour;
  final double millilitersPerHour;
}

IvInfusionRateResult? calculateOrderedIvInfusion({
  required double prescribedRate,
  required IvOrderedRateUnit rateUnit,
  required double finalMicrogramsPerMilliliter,
  double? weightKg,
}) {
  if (!prescribedRate.isFinite || prescribedRate <= 0 ||
      !finalMicrogramsPerMilliliter.isFinite ||
      finalMicrogramsPerMilliliter <= 0) {
    return null;
  }
  if (rateUnit.needsWeight &&
      (weightKg == null || !weightKg.isFinite || weightKg <= 0)) {
    return null;
  }
  final dosePerHour = switch (rateUnit) {
    IvOrderedRateUnit.mcgPerKgMin => prescribedRate * weightKg! * 60,
    IvOrderedRateUnit.mgPerKgHour => prescribedRate * weightKg! * 1000,
    IvOrderedRateUnit.mcgPerMin => prescribedRate * 60,
    IvOrderedRateUnit.mgPerHour => prescribedRate * 1000,
  };
  final pump = dosePerHour / finalMicrogramsPerMilliliter;
  if (!dosePerHour.isFinite || !pump.isFinite || pump <= 0) return null;
  return IvInfusionRateResult(
    microgramsPerHour: dosePerHour,
    millilitersPerHour: pump,
  );
}
