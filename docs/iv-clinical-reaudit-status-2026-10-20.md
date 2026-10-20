# Drug IV Clinical Re-audit — Coverage and Safety Ledger
**Review started:** 2026-10-20  
**Scope:** Existing `main` inventory of 136 IV medication/population profiles (89 General, 36 NICU, 11 PICU).  
**Status:** Structural inventory complete; source-based clinical verification **NOT complete** for all 136. Never interpret a profile's presence as approval for every marketed preparation.

## First clinically verified correction: Methylprednisolone sodium succinate (General)

**Defect:** Previously only 40 mg/1 mL and 125 mg/2 mL Pfizer preservative-free ACT-O-VIAL were selectable; a clinician with a **1,000 mg vial** had no suitable stock/recipe and could misapply the wrong activator instructions.

**Fix:** Source-specific drug profile, six explicitly differentiated stock choices, product selector before displaying drug-specific directions, preserved high-dose safety and manufacturer source information. None of these six entries establishes availability in Iraq.

| Product in official referenced label | Nominal final reconstituted solution | Stock concentration | Key distinction |
| --- | --- | --- | --- |
| Pfizer SOLU-MEDROL 40 mg preservative-free ACT-O-VIAL | 1 mL | 40 mg/mL | Cow-milk-derived lactose; allergy contraindication |
| Pfizer SOLU-MEDROL 125 mg preservative-free ACT-O-VIAL | 2 mL | 62.5 mg/mL | Activator (no plain-vial recipe) |
| Pfizer SOLU-MEDROL 500 mg preservative-free ACT-O-VIAL (historical/current country-dependent label) | 4 mL | 125 mg/mL | Not the 500 mg plain 8 mL vial |
| Pfizer SOLU-MEDROL 1 g preservative-free ACT-O-VIAL (historical/current country-dependent label) | 8 mL | 125 mg/mL | NOT 16 mL; built-in diluent |
| Pfizer SOLU-MEDROL 500 mg plain vial with BA-containing specified diluent | 8 mL | 62.5 mg/mL | Preservative-containing formulation |
| Pfizer SOLU-MEDROL 1 g plain vial with BA-containing specified diluent | 16 mL | 62.5 mg/mL | NOT 8 mL; external diluent per label |

**Administration:** Large, high-dose intravenous therapy is NOT a rapid IV push; manufacturer label supports **at least 30 minutes** for high-dose treatment. Administration of >500 mg in <10 minutes has been associated with arrhythmia/cardiac arrest. Confirm indication, regimen and individual risk. NS 0.9%, D5W and D5/NS infusion diluents are listed after reconstitution. No universal bag size is asserted. Some UK institution-specific protocols use a 1 g vial reconstituted with a supplied ~15.6 mL Water for Injection and 250 mL 0.9% saline over 30 minutes; do not substitute that brand's 15.6 mL for Pfizer's 16 mL plain-vial directions.

Official sources:
- [Pfizer prescribing information (product/formulation, preparation, IV duration)](https://labeling.pfizer.com/ShowLabeling.aspx?id=10890)
- [Pfizer-labelled 500 mg and 1 g ACT-O-VIAL presentations (DailyMed)](https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=cd99be87-c8d9-48d6-a8e5-e081052e3f19)
- [NHS community IV administration chart — DIFFERENT local product/protocol](https://remedy.bnssg.icb.nhs.uk/media/ks2hzlhv/methylprednisolone-admin-chart.pdf)

## Comprehensive audit queue based on ALL 136 structured profiles

**These are machine-readable inventory checks only** (concentration fields and manufacturer-scoped directions); numbers are not source-verified clinical certificates.

Eleven records without a structured withdrawal concentration and unit (must not offer an unvalidated mL result):

| Population | Medication |
| --- | --- |
| General | Ampicillin |
| General | Imipenem / Cilastatin |
| General | Aztreonam |
| General | Amoxicillin / Clavulanate IV |
| General | Omeprazole |
| NICU | Ampicillin |
| NICU | Benzylpenicillin |
| NICU | Piperacillin / Tazobactam |
| NICU | Calcium chloride |
| NICU | Dextrose D12.5 |
| NICU | Dextrose D20 |

Additional examples flagged by automated screening for manufacturer/formulation differences requiring further *human label review*: Vancomycin, Meropenem, Ceftriaxone, Ampicillin/Sulbactam, Clindamycin, Pantoprazole, Gentamicin, Ondansetron (General). These are screening FLAGS, not claims that the existing information is wrong.

### Required review process for each of the 136

1. Exact indication, patient group and branded presentation: powder/ampoule/premix, salt/base, manufacturer (source-linked).
2. Every labelled vial strength, unit equivalence, displacement/final reconstitution volume and diluent for that particular product.
3. IV push versus infusion route, suitable clinically ordered infusion time/rate, high-alert stop conditions.
4. Compatible preparation fluid at relevant concentration; explicitly distinguish diluent from Y-site coadministration. Do not turn UNKNOWN into approved.
5. Stability, temperature, storage, required BUD and time-dependent incompatibilities where relevant.
6. Clinical sources and a regression test for alternate strengths and any dangerous mix-ups.
7. Verify implementation, full CI, build and publish one bounded batch at a time.

**Practical priority:** high-alert drugs / salts / pressors, then antibiotics and antifungals with powder reconstitution variants, then NICU/PICU high-risk product-specific conversions. Each future batch records evidence and closes documented deficits; do not force unsupported calculations.

**UI policy:** Drug IV PWA presented in English only, with four fast facts, exact product selection when relevant, and optional calculator/expanded details. Clinical warnings remain mandatory where route or preparation can cause immediate harm.
