# Drug IV — Stock strength audit ledger, Batch 1 (2026-10-12)

**Scope:** Current `main` data inventory, 136 distinct medication+population records. This is a coverage ledger, NOT a clinical sign-off for 136 products. Only specifically cited manufacturer-packaged options count as newly source-audited.

## Scope and evidence

- 89 General/adult profiles, 36 NICU, 11 PICU.
- 109 records contain one or more existing `withdrawalVariants`; another 16 contain a legacy `withdrawalConcentration`. Those are **existing internal reference data, not necessarily freshly externally re-audited**.
- 11 records have no active structured withdrawal concentration/basis in this snapshot and must remain calculation-locked until resolved.
- Batch 1 added **17 individually source-linked vial presentations across seven General profiles**. Presentation availability in **Iraq or a given ward cannot be inferred** from DailyMed listings.
- Norepinephrine adult has its own separate manufacturer BASE-versus-tartrate SALT checking pathway, retained in this batch.
- For other records with a known dosing unit, the UI exposes **Other strength** with pharmacist confirmation as **math only**, not an endorsed preparation, compatible diluent, route or infusion method. If no safe dose unit is known, the other-strength option is visible but arithmetic is locked.
- No claim of universal Y-site compatibility, stability/BUD, stock market availability, infusion pump substitutability or dose equivalence. Premixed, bulk and undiluted routes may have separate prohibitions.

## High-alert source review this batch

| General drug | Source-linked presentations | Main dosing-basis trap |
|---|---:|---|
| Dopamine | 4 | 40 versus 80 mg/mL; hydrochloride versus free-base mass |
| Dobutamine | 2 | 250 mg/20 mL versus 500 mg/40 mL (same mg/mL) |
| Amiodarone | 2 | 150 mg/3 mL versus 450 mg/9 mL; undiluted vs premix |
| Heparin | 3 | USP units/mL, treatment versus lock-flush |
| Fosphenytoin | 2 | 100 mg PE/2 mL versus 500 mg PE/10 mL; do NOT confuse PE/mL with vial total |
| Calcium gluconate | 2 | calcium gluconate salt mg is not elemental calcium mg |
| Regular insulin infusion | 2 | U-100 versus U-500; unit-based dosing and correct insulin type |

## Full profile inventory

Each row is **one distinct medication + population**. Status is about **machine-readable stock basis**, not full drug, preparation or device verification.

| # | Medicine | Population | Existing options | Batch-1 status |
|---:|---|---|---:|---|
| 1 | Caffeine citrate | NICU | 1 | Existing reference only · re-audit pending |
| 2 | Norepinephrine | General | 1 | Existing reference only · re-audit pending |
| 3 | Vancomycin | General | 1 | Existing reference only · re-audit pending |
| 4 | Meropenem | General | 1 | Existing reference only · re-audit pending |
| 5 | Piperacillin / Tazobactam | General | 1 | Existing reference only · re-audit pending |
| 6 | Ceftriaxone | General | 1 | Existing reference only · re-audit pending |
| 7 | Levetiracetam | General | 1 | Existing reference only · re-audit pending |
| 8 | Ampicillin / Sulbactam | General | 1 | Existing reference only · re-audit pending |
| 9 | Cefazolin | General | 1 | Existing reference only · re-audit pending |
| 10 | Clindamycin | General | 1 | Existing reference only · re-audit pending |
| 11 | Pantoprazole | General | 1 | Existing reference only · re-audit pending |
| 12 | Metronidazole | General | 1 | Existing reference only · re-audit pending |
| 13 | Linezolid | General | 1 | Existing reference only · re-audit pending |
| 14 | Acyclovir | General | 1 | Existing reference only · re-audit pending |
| 15 | IV Paracetamol | General | 1 | Existing reference only · re-audit pending |
| 16 | Gentamicin | General | 1 | Existing reference only · re-audit pending |
| 17 | Fluconazole | General | 1 | Existing reference only · re-audit pending |
| 18 | Ondansetron | General | 1 | Existing reference only · re-audit pending |
| 19 | Cefepime | General | 2 | Existing reference only · re-audit pending |
| 20 | Ampicillin | General | 0 | NO coded concentration · LOCKED |
| 21 | Azithromycin | General | 1 | Existing reference only · re-audit pending |
| 22 | Micafungin | General | 2 | Existing reference only · re-audit pending |
| 23 | Fosphenytoin | General | 1 | NEW source audit · 2 labeled vial options |
| 24 | Amiodarone | General | 1 | NEW source audit · 2 labeled vial options |
| 25 | Potassium chloride | General | 1 | Existing reference only · re-audit pending |
| 26 | Magnesium sulfate | General | 1 | Existing reference only · re-audit pending |
| 27 | Calcium gluconate | General | 1 | NEW source audit · 2 labeled vial options |
| 28 | Calcium chloride | General | 1 | Existing reference only · re-audit pending |
| 29 | Sodium bicarbonate 8.4% | General | 1 | Existing reference only · re-audit pending |
| 30 | Dopamine | General | 1 | NEW source audit · 4 labeled vial options |
| 31 | Epinephrine | General | 1 | Existing reference only · re-audit pending |
| 32 | Labetalol | General | 1 | Existing reference only · re-audit pending |
| 33 | Cefotaxime | General | 3 | Existing reference only · re-audit pending |
| 34 | Ceftazidime | General | 2 | Existing reference only · re-audit pending |
| 35 | Ertapenem | General | 1 | Existing reference only · re-audit pending |
| 36 | Amikacin | General | 1 | Existing reference only · re-audit pending |
| 37 | Levofloxacin | General | 1 | Existing reference only · re-audit pending |
| 38 | Daptomycin | General | 1 | Existing reference only · re-audit pending |
| 39 | Imipenem / Cilastatin | General | 0 | NO coded concentration · LOCKED |
| 40 | Aztreonam | General | 0 | NO coded concentration · LOCKED |
| 41 | Ciprofloxacin | General | 1 | Existing reference only · re-audit pending |
| 42 | Voriconazole | General | 1 | Existing reference only · re-audit pending |
| 43 | Caspofungin | General | 2 | Existing reference only · re-audit pending |
| 44 | Anidulafungin | General | 2 | Existing reference only · re-audit pending |
| 45 | Adenosine | General | 1 | Existing reference only · re-audit pending |
| 46 | Dobutamine | General | 1 | NEW source audit · 2 labeled vial options |
| 47 | Nitroglycerin | General | 1 | Existing reference only · re-audit pending |
| 48 | Esmolol | General | 3 | Existing reference only · re-audit pending |
| 49 | Sodium bicarbonate 4.2% | General | 1 | Existing reference only · re-audit pending |
| 50 | Hypertonic sodium chloride 3% | General | 1 | Existing reference only · re-audit pending |
| 51 | Potassium phosphate | General | 1 | Existing reference only · re-audit pending |
| 52 | Phenytoin | General | 1 | Existing reference only · re-audit pending |
| 53 | Valproate | General | 1 | Existing reference only · re-audit pending |
| 54 | Phenobarbital | General | 2 | Existing reference only · re-audit pending |
| 55 | Midazolam | General | 2 | Existing reference only · re-audit pending |
| 56 | Furosemide | General | 1 | Existing reference only · re-audit pending |
| 57 | Lorazepam | General | 2 | Existing reference only · re-audit pending |
| 58 | Ketamine | General | 3 | Existing reference only · re-audit pending |
| 59 | Propofol | General | 1 | Existing reference only · re-audit pending |
| 60 | Dexmedetomidine | General | 2 | Existing reference only · re-audit pending |
| 61 | Fentanyl | General | 1 | Existing reference only · re-audit pending |
| 62 | Morphine | General | 3 | Existing reference only · re-audit pending |
| 63 | Regular insulin infusion | General | 1 | NEW source audit · 2 labeled vial options |
| 64 | Heparin | General | 3 | NEW source audit · 3 labeled vial options |
| 65 | Alteplase | General | 2 | Existing reference only · re-audit pending |
| 66 | Tenecteplase | General | 2 | Existing reference only · re-audit pending |
| 67 | Naloxone | General | 1 | Existing reference only · re-audit pending |
| 68 | Flumazenil | General | 1 | Existing reference only · re-audit pending |
| 69 | Atropine | General | 2 | Existing reference only · re-audit pending |
| 70 | N-acetylcysteine IV | General | 1 | Existing reference only · re-audit pending |
| 71 | Mannitol | General | 1 | Existing reference only · re-audit pending |
| 72 | Ganciclovir | General | 1 | Existing reference only · re-audit pending |
| 73 | Protamine | General | 1 | Existing reference only · re-audit pending |
| 74 | Digoxin immune Fab | General | 1 | Existing reference only · re-audit pending |
| 75 | Colistimethate / Colistin | General | 1 | Existing reference only · re-audit pending |
| 76 | Tigecycline | General | 1 | Existing reference only · re-audit pending |
| 77 | Amphotericin B liposomal | General | 1 | Existing reference only · re-audit pending |
| 78 | Amphotericin B conventional | General | 1 | Existing reference only · re-audit pending |
| 79 | Dexamethasone | General | 2 | Existing reference only · re-audit pending |
| 80 | Hydrocortisone | General | 2 | Existing reference only · re-audit pending |
| 81 | Amoxicillin / Clavulanate IV | General | 0 | NO coded concentration · LOCKED |
| 82 | Teicoplanin | General | 1 | Existing reference only · re-audit pending |
| 83 | Sodium phosphate | General | 1 | Existing reference only · re-audit pending |
| 84 | Metoclopramide | General | 1 | Existing reference only · re-audit pending |
| 85 | Methylprednisolone | General | 2 | Existing reference only · re-audit pending |
| 86 | Diazepam | General | 1 | Existing reference only · re-audit pending |
| 87 | Omeprazole | General | 0 | NO coded concentration · LOCKED |
| 88 | Dopamine | NICU | 1 | Existing reference only · re-audit pending |
| 89 | Dobutamine | NICU | 1 | Existing reference only · re-audit pending |
| 90 | Norepinephrine | NICU | 1 | Existing reference only · re-audit pending |
| 91 | Fentanyl | NICU | 1 | Existing reference only · re-audit pending |
| 92 | Morphine | NICU | 1 | Existing reference only · re-audit pending |
| 93 | Midazolam | NICU | 2 | Existing reference only · re-audit pending |
| 94 | Insulin | NICU | 1 | Existing reference only · re-audit pending |
| 95 | Heparin | NICU | 1 | Existing reference only · re-audit pending |
| 96 | Ampicillin | NICU | 0 | NO coded concentration · LOCKED |
| 97 | Gentamicin | NICU | 1 | Existing reference only · re-audit pending |
| 98 | Amikacin | NICU | 1 | Existing reference only · re-audit pending |
| 99 | Cefotaxime | NICU | 3 | Existing reference only · re-audit pending |
| 100 | Benzylpenicillin | NICU | 0 | NO coded concentration · LOCKED |
| 101 | Ceftazidime | NICU | 2 | Existing reference only · re-audit pending |
| 102 | Cefepime | NICU | 2 | Existing reference only · re-audit pending |
| 103 | Meropenem | NICU | 2 | Existing reference only · re-audit pending |
| 104 | Vancomycin intermittent | NICU | 1 | Existing reference only · re-audit pending |
| 105 | Piperacillin / Tazobactam | NICU | 0 | NO coded concentration · LOCKED |
| 106 | Digoxin | NICU | 1 | Existing reference only · re-audit pending |
| 107 | Adenosine | NICU | 1 | Existing reference only · re-audit pending |
| 108 | Sildenafil IV | NICU | 1 | Existing reference only · re-audit pending |
| 109 | Hydrocortisone | NICU | 1 | Existing reference only · re-audit pending |
| 110 | Phenobarbital | NICU | 1 | Existing reference only · re-audit pending |
| 111 | Levetiracetam | NICU | 1 | Existing reference only · re-audit pending |
| 112 | Dexamethasone | NICU | 1 | Existing reference only · re-audit pending |
| 113 | Calcium gluconate | NICU | 1 | Existing reference only · re-audit pending |
| 114 | Calcium chloride | NICU | 0 | NO coded concentration · LOCKED |
| 115 | Magnesium sulfate | NICU | 1 | Existing reference only · re-audit pending |
| 116 | Sodium bicarbonate | NICU | 1 | Existing reference only · re-audit pending |
| 117 | Dextrose D10 | NICU | 1 | Existing reference only · re-audit pending |
| 118 | Dextrose D12.5 | NICU | 0 | NO coded concentration · LOCKED |
| 119 | Dextrose D20 | NICU | 0 | NO coded concentration · LOCKED |
| 120 | Dextrose D25 | NICU | 1 | Existing reference only · re-audit pending |
| 121 | Hypertonic sodium chloride | NICU | 1 | Existing reference only · re-audit pending |
| 122 | Phosphate | NICU | 2 | Existing reference only · re-audit pending |
| 123 | Norepinephrine | PICU | 1 | Existing reference only · re-audit pending |
| 124 | Epinephrine | PICU | 1 | Existing reference only · re-audit pending |
| 125 | Dopamine | PICU | 1 | Existing reference only · re-audit pending |
| 126 | Dobutamine | PICU | 1 | Existing reference only · re-audit pending |
| 127 | Fentanyl | PICU | 1 | Existing reference only · re-audit pending |
| 128 | Morphine | PICU | 1 | Existing reference only · re-audit pending |
| 129 | Midazolam | PICU | 2 | Existing reference only · re-audit pending |
| 130 | Dexmedetomidine | PICU | 1 | Existing reference only · re-audit pending |
| 131 | Ketamine | PICU | 3 | Existing reference only · re-audit pending |
| 132 | Regular insulin infusion | PICU | 1 | Existing reference only · re-audit pending |
| 133 | Heparin | PICU | 2 | Existing reference only · re-audit pending |
| 134 | Nicardipine | General | 1 | Existing reference only · re-audit pending |
| 135 | Clevidipine | General | 1 | Existing reference only · re-audit pending |
| 136 | Sodium nitroprusside | General | 1 | Existing reference only · re-audit pending |

## Safety-critical future verification sequence

1. Complete manufacturer and dosage-form review for all eleven profiles without machine-readable units.
2. High-alert ICU/CCU: norepinephrine brand/base/salt; epinephrine routes; vasopressin; dobutamine and dopamine formulations; potassium; insulin; heparin; amiodarone; magnesium and calcium; propofol; nicardipine and sodium nitroprusside. Ensure **premix, vial, powder and ready-to-administer** remain distinct.
3. Anticoagulation/thrombolytics and antiseizure drugs: heparin, alteplase/tenecteplase, phenytoin/fosphenytoin, colistin activity units. Never silently interchange units.
4. Antibiotics/antifungals and other ICU drugs: stock/reconstituted concentration, brands, required final concentrations, infusion duration, Y-site compatibility, product storage and aseptic BUD.
5. NICU/PICU: separate reviewed sources and dose bases; adult sources do not clear pediatric variants.
6. Locally stocked Iraqi brands must be separately captured and validated against **actual carton/vial and manufacturer instructions**, ideally through photos. A public US-market label does not prove local stock.

