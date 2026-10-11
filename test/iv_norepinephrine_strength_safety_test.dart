import 'package:flutter_test/flutter_test.dart';
import 'package:drug_edu/features/calculators/domain/iv_norepinephrine_stock_engine.dart';
import 'package:drug_edu/features/iv_prep/data/iv_fluid_evidence.dart';

void main() {
  test('reviewed stock accepts only its exact 4mg base/4mL presentation', () {
    expect(resolveNorepinephrineBaseStock(
      mode: NorepinephrineStockMode.reviewedOneMgBasePerMl,
      printedBasis: NorepinephrinePrintedMassBasis.norepinephrineBase,
      printedVialMg: 4, vialMl: 4,
      productLabelVerified: false,
    )!.baseConcentrationMgPerMl, 1);
    expect(resolveNorepinephrineBaseStock(
      mode: NorepinephrineStockMode.reviewedOneMgBasePerMl,
      printedBasis: NorepinephrinePrintedMassBasis.norepinephrineBase,
      printedVialMg: 16, vialMl: 4,
      productLabelVerified: false,
    ), isNull);
  });

  test('different product is not accepted without label verification', () {
    expect(resolveNorepinephrineBaseStock(
      mode: NorepinephrineStockMode.otherProduct,
      printedBasis: NorepinephrinePrintedMassBasis.norepinephrineBase,
      printedVialMg: 16, vialMl: 4,
      productLabelVerified: false,
    ), isNull);
  });

  test('salt-labelled product needs an explicitly stated BASE amount', () {
    expect(resolveNorepinephrineBaseStock(
      mode: NorepinephrineStockMode.otherProduct,
      printedBasis: NorepinephrinePrintedMassBasis.norepinephrineSalt,
      printedVialMg: 16, vialMl: 4,
      productLabelVerified: true,
    ), isNull);
  });

  test('base concentration depends on explicit printed mass basis', () {
    final base = resolveNorepinephrineBaseStock(
      mode: NorepinephrineStockMode.otherProduct,
      printedBasis: NorepinephrinePrintedMassBasis.norepinephrineBase,
      printedVialMg: 16, vialMl: 4,
      productLabelVerified: true,
    )!;
    expect(base.baseConcentrationMgPerMl, 4);

    final salt = resolveNorepinephrineBaseStock(
      mode: NorepinephrineStockMode.otherProduct,
      printedBasis: NorepinephrinePrintedMassBasis.norepinephrineSalt,
      printedVialMg: 16, vialMl: 4,
      statedBaseEquivalentMg: 8,
      productLabelVerified: true,
    )!;
    expect(salt.baseConcentrationMgPerMl, 2);
    expect(salt.baseAmountMgPerVial, 8);
  });

  test('saline alone is unverified, D5 source-supported for cited product', () {
    expect(reviewedIvFluidEvidence(
      name: 'Norepinephrine', population: 'General',
      fluid: IvFluid.normalSaline,
    ).status, IvFluidEvidenceStatus.unknown);
    expect(reviewedIvFluidEvidence(
      name: 'Norepinephrine', population: 'General',
      fluid: IvFluid.dextrose5,
    ).status, IvFluidEvidenceStatus.verifiedDiluent);
  });
}
