import '../data/iv_unified_infusion_library.dart';
import 'iv_infusion_rate_engine.dart';

/// The preparation is either a source-verified exact infusion recipe or
/// arithmetic using a concentration independently authorized by an
/// institutional protocol. Local mode does NOT validate diluent, sterility,
/// patient dose, Y-site compatibility, BUD, or preparation technique.
class IvUnifiedPumpResult {
  const IvUnifiedPumpResult({
    required this.finalMicrogramsPerMl,
    required this.deliveryMicrogramsPerHour,
    required this.pumpMlPerHour,
    required this.sourceLocked,
    required this.nominalConcentration,
  });

  final double finalMicrogramsPerMl;
  final double deliveryMicrogramsPerHour;
  final double pumpMlPerHour;
  final bool sourceLocked;
  final bool nominalConcentration;
}

/// Local FINAL mixture = total norepinephrine BASE or other medicine ACTIVE
/// mg divided by the ACTUAL FINAL mixture volume in mL.
/// Do NOT confuse fluid added with final mixture volume.
double? verifiedLocalFinalMcgPerMl({
  required double totalActiveMg,
  required double actualFinalVolumeMl,
  required bool protocolVerified,
}) {
  if (!protocolVerified ||
      !totalActiveMg.isFinite || totalActiveMg <= 0 ||
      !actualFinalVolumeMl.isFinite || actualFinalVolumeMl <= 0) {
    return null;
  }
  final concentration = totalActiveMg * 1000 / actualFinalVolumeMl;
  return concentration.isFinite && concentration > 0
      ? concentration : null;
}

IvUnifiedPumpResult? calculateVerifiedIvPump({
  required String drug,
  required IvOrderedRateUnit orderedUnit,
  required double orderedRate,
  required double? dosingWeightKg,
  required bool checkedProductAndProtocol,
  required bool checkedClinicianOrder,
  IvInfusionPreparation? reviewedPreparation,
  double? localTotalActiveMg,
  double? localFinalVolumeMl,
  bool localProtocolConfirmed = false,
}) {
  if (!checkedProductAndProtocol || !checkedClinicianOrder ||
      !ivApprovedOrderUnits(drug).contains(orderedUnit)) {
    return null;
  }
  final usingLocal = reviewedPreparation == null;
  if (!usingLocal && reviewedPreparation.drug != drug) return null;
  final finalConcentration = usingLocal
      ? verifiedLocalFinalMcgPerMl(
          totalActiveMg: localTotalActiveMg ?? double.nan,
          actualFinalVolumeMl: localFinalVolumeMl ?? double.nan,
          protocolVerified: localProtocolConfirmed,
        )
      : reviewedPreparation.nominalMcgPerMl;
  if (finalConcentration == null ||
      !finalConcentration.isFinite || finalConcentration <= 0) {
    return null;
  }
  final rate = calculateOrderedIvInfusion(
    prescribedRate: orderedRate,
    rateUnit: orderedUnit,
    finalMicrogramsPerMilliliter: finalConcentration,
    weightKg: dosingWeightKg,
  );
  if (rate == null) return null;
  return IvUnifiedPumpResult(
    finalMicrogramsPerMl: finalConcentration,
    deliveryMicrogramsPerHour: rate.microgramsPerHour,
    pumpMlPerHour: rate.millilitersPerHour,
    sourceLocked: !usingLocal,
    nominalConcentration:
        !usingLocal && reviewedPreparation.isManufacturerNominal,
  );
}
