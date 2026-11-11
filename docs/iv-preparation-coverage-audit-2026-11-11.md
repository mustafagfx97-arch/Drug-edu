# Drug IV clinical coverage audit · 11 Nov 2026

**Target:** Drug IV web/PWA, not the separate Patient Education or NICU apps.

## Baseline
- 136 source-linked IV preparation profiles / 136 catalog entries prior to this batch (General + NICU + PICU), subject to previously documented ongoing source re-audit.
- Existing high-value emergency records including **Digoxin immune Fab**, **N-acetylcysteine IV**, **Protamine**, **Naloxone**, **Flumazenil**, and **Atropine** were already present. Do not duplicate them.
- Adult Quick IV Drip has a separately reviewed subset of **12 continuous infusion drug names**. **The total medication catalog is not a pump-approved medication library.**

## This verified batch: six new General IV records
| Drug | Reference product and key lock | Correct calculator behavior |
| --- | --- | --- |
| Deferoxamine | 500 mg IV + 5 mL SWFI or 2 g IV + 20 mL SWFI yields ~95 mg/mL; the 500 mg IV recipe needs further dilution; acute-iron IV rate limits differ from chronic overload | Stock withdrawal arithmetic only. No automatic acute vs chronic dosing or 2 g in 150 mL assumption |
| Fomepizole | 1 g/mL; use NON-POLYCARBONATE syringe; at least 100 mL D5W or NS; 30-minute infusion | Stock dose → mL, not standing drip titration. Hemodialysis changes dose timing |
| Hydroxocobalamin (CYANOKIT) | 5 g powder + 200 mL fluid; gently invert/rock at least 60 seconds; separate line | Emergency 15-minute *intermittent* infusion, no titrated drip |
| Methylene blue (PROVAYBLUE) | 5 mg/mL; optional 50 mL D5W, **avoid NS**; boxed serotonin-syndrome warning | Stock withdrawal; intermittent 5–30-minute IV, NOT generic titrated infusion |
| Leucovorin calcium | 350 mg vial → 20 mg/mL, other cited vials → 10 mg/mL; max 160 mg/min IV; no simultaneous 5-FU admixture | Product-specific stock choice; indication-specific oncology protocol decides infusion |
| Vasopressin | 20 **units**/mL concentrate; 0.1 or 1 **unit**/mL final; dose **units/min** | Do not use mg-based Quick IV Drip; locked until a units/min calculation is specifically reviewed |

Each profile includes source URLs and critical route/strength/compatibility locks in
`lib/features/iv_prep/data/iv_missing_critical_profiles.dart`.

## Further missing medicines, prioritized for next source-verification batches
Inventory check is by exact name against baseline; these names were *not* present in the General IV catalog as of this audit. These are **candidates to investigate**, not verified new recipes.

1. **ICU continuous infusions & shock (highest priority):** Milrinone, Phenylephrine, then dedicated **vasopressin units/min** infusion calculator. Each requires concentration, unit, titration, access, and dosing-context verification before enabling mL/hour.
2. **Antidotes/bleeding/hematology:** Idarucizumab, Glucarpidase, Sodium thiosulfate, IV Phytonadione (vitamin K), Tranexamic acid, Desmopressin. Avoid interchange between antidote brands and route-specific formulations.
3. **Advanced inpatient antimicrobials:** Ceftazidime/avibactam, Ceftolozane/tazobactam, Cefiderocol, Meropenem/vaborbactam, Imipenem/cilastatin/relebactam, Dalbavancin, Oritavancin; each has distinctive reconstitution, infusion duration, renal or stability rules.
4. **Specialist IV therapies:** Argatroban, Bivalirudin, Cangrelor, Terlipressin, Rocuronium, Cisatracurium, Sugammadex, IV iron products (iron sucrose/ferric carboxymaltose/ferric derisomaltose), Remdesivir, Isavuconazonium, Posaconazole IV.

## Quality gates for every future batch
1. A named manufacturer/strength, authoritative label URL, and population/route.
2. Exact vial and reconstitution (including **displacement/final volume**), compatible diluent, infusion time/rate, high-alert restrictions, and stability.
3. Add the record to the catalog **only after** the profile is clinically structured and source checked.
4. Update tests for drug-name + population uniqueness, preparation and unit locks; no duplicate medication IDs or phantom mL/hour support.
5. Flutter Analyze → full Flutter Tests → PWA release build & artifacts → PR → merge (only green) → confirm main == merge commit, ahead/behind 0/0 → verify GitHub Pages.
