# Clinical Content Schema

The current Flutter scaffold uses simplified demo records. Production content should use a structured, versioned schema.

## Medication

Core fields: id, generic name, display name, drug class, tags, clinical sections, Arabic patient counseling, available modules, review status, and last reviewed date.

## Clinical section

Fields: title, priority, body, population scope, and optional source references.

## IV preparation profile

Required fields include medication, population, formulation, preparation authority, presentation, stock concentration, dose basis, reconstitution, resulting concentration, further dilution, allowed and blocked diluents, final concentration range, route and line constraints, important incompatibilities, storage/BUD, safety locks, sources, source version, and review date.

## Formulation

Formulations are separate records because one generic drug may have products that cannot share preparation instructions. Store product name when relevant, vial/ampoule strength, salt/base or equivalent basis, concentration, clinically important excipients, RTU status, and preservative information.

## Calculator configuration

A calculator is enabled only when its preparation profile explicitly defines it. Inputs can include weight, prescribed dose, dose unit, stock strength, target concentration, final volume, and infusion-rate basis. Outputs can include total prescribed dose, volume to withdraw, final volume, diluent volume, number of vials, pump rate, and linked electrolyte payload.

## Safety lock

A safety lock stores an identifier, severity, trigger, message, blocking status, and optional required action. Examples include formulation mismatch, units versus milliunits, prohibited IV push, incompatible diluent, and concentration outside the validated range.

## Source

Store organization, document title, version, publication/revision date, URL, access date, and authority rank. Clinical records should reference source IDs rather than duplicate source metadata.
