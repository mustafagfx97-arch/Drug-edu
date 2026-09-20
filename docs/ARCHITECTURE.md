# Drug Edu Architecture

## Product principle

Drug Edu is a clinical pharmacist workspace, not a long-form drug monograph reader. The interface must remain fast to scan even when the database grows to thousands of records.

## Primary navigation

1. Home — dashboard and universal entry point.
2. Encyclopedia — medications, counseling, devices, feeding-tube topics and professional notes.
3. IV Prep — reconstitution, dilution, standard concentrations and preparation safety.
4. Calculators — profile-linked preparation and infusion tools.
5. More — theme, language policy, source/version information and future settings.

Do not add a bottom-navigation tab for every content category. New categories belong inside Home and Encyclopedia filters.

## Language policy

- Application chrome: English only.
- Clinical pharmacist content: English only.
- Patient-facing counseling: Arabic only, rendered RTL.
- Drug names, units, product names and citations remain in their standard scientific form.

## Content layers

A medication record can expose independent layers for clinical notes, patient counseling, device technique, feeding-tube handling, IV preparation, NICU/PICU profiles, calculators, and source metadata. The UI only shows layers that exist.

## Safety architecture

Calculator workflow: select population, medication, exact formulation, preparation profile and authority, then enter the prescribed order. Safety validation occurs before calculation. The calculator stops rather than guesses when units, formulation, compatible diluent or validated concentration are ambiguous.

## Preparation authority

Every IV preparation profile stores one authority type: RTU manufacturer, Manufacturer preparation, ANMF neonatal standard, ASHP pediatric standard, or Institution-specific.

A standard concentration and a compounding recipe are not assumed to have the same evidence authority.

## Production data layers

Production content should move out of widgets into versioned structured data. Recommended layers are domain entities, a local data repository, feature presentation, a safety-validation layer, deterministic calculator functions, and source metadata.

The UI must never contain a clinical rule that is not represented in the data or safety layer.

## Release rule

A record cannot be marked verified for production unless it has exact formulation, population, source authority, source version/date, last clinical review date, required safety locks, and validated calculation tests when a calculator is enabled.
