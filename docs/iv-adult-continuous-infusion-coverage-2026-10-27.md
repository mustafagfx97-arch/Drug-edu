# Drug IV · Adult continuous IV infusion calculator coverage

Review date: 2026-10-27. Scope: **General/adult** only. This is a
progress ledger, NOT a claim that the full IV medication catalogue is
appropriate for continuous infusions.

## Linked to Dose + Dilution → mL/hr (12 drug names)

- **Norepinephrine** — labeled dilute concentrate (nominal 4 mcg/mL),
  factory premixes (16/32/64 mcg/mL), plus verified local concentration lane.
  Dosing uses norepinephrine **base**, not bitartrate salt mass.
- **Dobutamine** — 250 mg/20 mL stock at 12.5 mg/mL, labeled nominal
  250 mg in 250/500 mL diluent; ordered mcg/kg/min.
- **Dopamine** — manufacturer 40 mg/mL concentrate, manufacturer-table
  nominal 200 mg in 250/500 mL and 400 mg in 250 mL diluent; mcg/kg/min.
- **Epinephrine** — **adult septic-shock** 1 mg/mL concentrate in labeled
  dextrose-containing 1,000 mL dilution, nominal 1 mcg/mL; mcg/kg/min.
  NOT cardiac arrest or IM anaphylaxis.
- **Nitroglycerin** — stock 5 mg/mL, source-defined FINAL 100/200/400
  mcg/mL; mcg/min; low-adsorption administration hardware.
- **Dexmedetomidine** — exact 200 mcg/2 mL + 48 mL 0.9% NaCl =
  50 mL FINAL / 4 mcg/mL; **mcg/kg/hour**, not minute.
- **Sodium nitroprusside** — 50 mg/2 mL in 250/500 mL D5W (nominal
  200/100 mcg/mL), light protection and toxicity precautions; mcg/kg/min.
- **Amiodarone** — only the **900 mg/500 mL D5W slow loading/maintenance**
  labeled adult VT/VF pathway, mg/min. Not initial rapid load or arrest IV.
- **Nicardipine** — CARDENE IV 25 mg/250 mL FINAL = 0.1 mg/mL; mg/hr.
- **Clevidipine** — ready-to-use Cleviprex 0.5 mg/mL; mg/hr.
- **Esmolol** — BREVIBLOC labeled final 10 mg/mL; mcg/kg/min.
- **Labetalol** — two labeled infusion dilutions at **different final
  volumes**, mg/min or mg/hr.

Each option has a product-specific label URL in
`lib/features/iv_prep/data/iv_unified_infusion_library.dart`.

## Present elsewhere in IV preparation reference; NOT yet verified for
the unified continuous-pump workflow

- **Different measurement systems** (must not be forced into mg):
  Regular insulin U-100 infusion (`units/hr` or protocol-specific
  `units/kg/hr`), therapeutic heparin (`units/hr`),
  potassium/electrolyte concentrates (`mEq`, `mmol` and hard
  concentration/rate constraints).
- **Additional ICU sedatives/analgesics** requiring exact product
  and protocol re-audit: Propofol, Midazolam, Fentanyl, Morphine, Ketamine.
- **Other specialized continuous infusions** requiring separate
  preparation checks: Furosemide, Magnesium sulfate and other
  clinical-indication-specific infusions.
- **NICU/PICU**: remain distinct; adult options MUST NOT auto-populate
  neonatal or pediatric pathways.

The reference also includes numerous IV intermittent medicines (e.g.
antibiotics). They require infusion **duration/time**, not necessarily
a continuous titrated drip protocol, and must not be forced into
`mcg/kg/min` or displayed as reviewed continuous infusion preparations.

## Critical calculation distinctions

1. **STOCK** concentration is distinct from **FINAL infusion** concentration.
2. A label using drug added to a measured bag can report a **nominal**
   final concentration; adding stock increases the physical final volume.
   This difference is disclosed and exact-volume preparations require a
   validated local protocol/volume check.
3. A drug must have both an individually sourced preparation and an
   appropriate ordered rate **unit** before being offered.
4. Neither stock arithmetic nor a green Flutter test verifies a
   clinical order, admixture compatibility, stability, infusion set,
   patient-specific dosing, or protocol appropriateness.

## Clinical source links

- [Hospira Dobutamine label](https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=89becb0c-da60-4f43-0a98-29ff7a9eca58)
- [Hospira Dopamine label](https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=1f306ad2-3606-4525-5a8a-ce78f426c1a2)
- [Epinephrine septic-shock label](https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=1e8ebac1-5b32-47f9-a930-86a98a24dccc)
- [Nitroglycerin label](https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=578d8159-5ec6-457f-b4a8-9add624d43a8)
- [Dexmedetomidine label](https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=ebdfe2e8-30ca-4f18-935a-41bcbbce4937)
- [Sodium Nitroprusside label](https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=6fbfb86c-da8d-4741-b1e0-7000e2bbad5f)
- [Amiodarone label](https://dailymed.nlm.nih.gov/dailymed/drugInfo.cfm?setid=0a28ae25-7cc4-4ac0-a2ba-7820fb93e25c)
