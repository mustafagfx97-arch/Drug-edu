# Drug Edu

A clinical pharmacist encyclopedia focused on practical patient counseling, medication-use technique, IV preparation, and profile-linked calculators.

## Product direction

The application interface is **English only**. The only Arabic content is the **patient-facing counseling block**, rendered RTL inside medication records.

The app is designed to remain clean as the encyclopedia grows. It uses five primary destinations:

- Home
- Encyclopedia
- IV Prep
- Calculators
- More

NICU, PICU, feeding-tube content, devices and other topics live inside these modules rather than becoming separate navigation tabs.

## Current foundation

This branch contains the first organized application shell:

- Material 3 UI
- Light, Dark and System theme modes
- Responsive dashboard
- Search-first encyclopedia
- Medication detail structure
- Dedicated Arabic RTL patient counseling card
- Separate General / NICU / PICU IV preparation entry points
- Safety-gated calculator hub
- Architecture, design-system and content-schema documentation
- Basic Flutter CI and smoke test

The sample medication records are **demo interface content only**. Production clinical records must be migrated to versioned structured data and clinically verified before release.

## Safety principles

- Calculators convert prescribed orders; they do not choose therapeutic doses.
- Population and formulation must be selected before IV calculations.
- NICU and PICU profiles are never silently reused across populations.
- Preparation authority is explicit: manufacturer RTU, manufacturer preparation, ANMF, ASHP, or institution-specific.
- Ambiguous formulation, unit, concentration or diluent states must stop calculation rather than guess.

## Project structure

```text
lib/
  core/
    data/
    models/
    theme/
  features/
    home/
    encyclopedia/
    iv_prep/
    calculators/
    more/
    shell/
  shared/
    widgets/

docs/
  ARCHITECTURE.md
  DESIGN_SYSTEM.md
  CONTENT_SCHEMA.md
```

## Local development

Flutter is required.

If the Android wrapper has not yet been generated:

```bash
flutter create . --platforms=android --project-name drug_edu
flutter pub get
flutter run
```

Run checks with:

```bash
flutter analyze
flutter test
```

## Next implementation phases

1. Replace demo records with the production clinical content repository.
2. Add formulation and IV preparation entities.
3. Build the safety-lock engine.
4. Implement profile-linked IV and infusion calculators.
5. Add structured source/version tracking.
6. Import the verified counseling encyclopedia in controlled batches.
7. Add favorites, recent items and offline indexing only after the core clinical model is stable.

See the documents in `docs/` before adding new features.
