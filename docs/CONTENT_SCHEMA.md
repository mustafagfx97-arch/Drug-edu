# Clinical Content Schema

Drug Edu uses structured, versioned clinical records. The schema is designed to keep pharmacist-facing knowledge separate from the short patient counseling that is actually worth communicating.

## Medication

Core fields include:

- stable medication ID and therapeutic family
- generic/display name, aliases and search tags
- structured medication-use profile
- prioritized pharmacist clinical sections
- separate Arabic patient counseling
- linked modules such as visual technique, IV preparation or calculators
- source label, review status and last-reviewed date

A generic drug record must not silently imply that every brand, strength, dosage form or device uses identical instructions.

## Medication-use profile

The professional profile can store:

- route / formulation
- food and timing instructions
- therapy duration
- crush / split / chew / open / dosage-form handling
- monitoring
- clinically important interactions
- common counseling mistakes
- patient-specific considerations

These fields are shown separately from the patient counseling so pharmacist detail does not overload the patient.

## Patient counseling

Patient-facing Arabic is action based. It can include:

- why the medicine is used
- exactly how to use it
- timing / relationship to food
- the most important actionable point
- common actionable adverse effects
- missed-dose instructions
- storage when it changes what the patient should do
- red flags and the action required
- teach-back

Do not fill a section merely because the field exists. Empty low-value sections stay hidden.

## Clinical priority

Professional sections use four priorities:

- Critical
- Important
- Patient-specific
- Reference

A rare event can still be Critical when failure to recognize it could cause serious harm.

## Medication-plan timing rule

The multi-medication planner stores timing separately from the medication monograph.

A timing rule can define:

- anchor: meal, empty stomach, morning, bedtime, weekly or flexible
- Arabic administration instruction
- whether the patient/pharmacist must select a meal
- whether automatic scheduling is safe
- source

The planner preserves exact prescribed intervals for every 6, 8 and 12 hour regimens. “Three times daily” and “every 8 hours” are intentionally not treated as synonyms.

High-risk combinations are represented as review alerts when changing the clock time does not resolve the problem.

## IV preparation profile

Required fields include medication, population, formulation, preparation authority, presentation, stock concentration, dose basis, reconstitution, resulting concentration, further dilution, allowed and blocked diluents, final concentration range, route and line constraints, important incompatibilities, storage/BUD, safety locks, sources, source version, and review date.

## Formulation

Formulations are separate records because one generic drug may have products that cannot share preparation instructions. Store product name when relevant, vial/ampoule strength, salt/base or equivalent basis, concentration, clinically important excipients, RTU status, and preservative information.

## Calculator configuration

A calculator is enabled only when its preparation profile explicitly defines it. Inputs can include weight, prescribed dose, dose unit, stock strength, target concentration, final volume, and infusion-rate basis. Outputs can include total prescribed dose, volume to withdraw, final volume, diluent volume, number of vials, pump rate, and linked electrolyte payload.

Calculators convert a prescribed order; they do not choose a therapeutic dose.

## Safety lock

A safety lock stores an identifier, severity, trigger, message, blocking status, and optional required action. Examples include formulation mismatch, units versus milliunits, prohibited IV push, incompatible diluent, concentration outside the validated range, contraindicated combinations and a timing rule that cannot be safely inferred.

## Source and review state

Store organization, document title, version or revision date when available, URL/reference, access date, and authority rank.

Suggested authority order:

1. FDA-approved labeling / Medication Guide / Instructions for Use or authoritative national regulator labeling
2. official manufacturer IFU for the exact marketed device/product
3. major current clinical guideline
4. institutional/ASHP/APhA/ANMF-type preparation guidance where appropriate
5. secondary drug-information databases as supporting references

A record is not considered production-verified merely because it has a source label. Product-specific instructions must be rechecked when formulation, concentration, device, population or manufacturer changes. The default medication review status therefore remains a clinical draft until that verification is complete.
