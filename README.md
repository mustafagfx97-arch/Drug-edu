# Drug Edu

A clinical pharmacist encyclopedia focused on practical patient counseling, medication-use technique, IV preparation, and profile-linked calculators.

## V1 Preview

Drug Edu V1 Preview turns the project into one organized clinical workspace instead of a collection of separate notes.

The professional interface is **English only**. The patient-facing counseling and patient cards are **simple Arabic, RTL, focused and action-based**.

Primary navigation stays limited to five destinations:

- Home
- Encyclopedia
- IV Prep
- Calculators
- More

Large content areas such as NICU, PICU, Feeding Tubes, Supplements, Visual Guides and Patient Cards live inside these modules instead of becoming additional bottom-navigation tabs.

## Included in V1

- Material 3 UI
- Light, Dark and System theme modes
- Responsive dashboard
- Search-first encyclopedia
- Professional medication detail structure
- Separate Arabic patient counseling block
- Focused Patient Cards with hidden empty sections
- Duplicate and customize Patient Cards
- Offline QR code containing counseling instructions
- Visual Guides for MDI, spacer, nasal spray, eye drops and insulin pen
- Feeding Tubes module structure
- Supplements module structure
- Separate General / NICU / PICU IV preparation entry points
- Profile-linked IV preparation calculator examples
- Continuous infusion pump-rate calculator
- Dextrose mixing calculator
- Phosphate electrolyte-payload calculator
- Architecture, design-system, Arabic style and content-schema documentation
- Flutter CI and smoke test

## Patient-content rule

The Arabic patient content is not a translation of the pharmacist notes.

It only includes information that changes what the patient should do, avoid, recognize or report.

Patient Cards are even more focused and use optional short sections such as:

- لماذا أستخدمه؟
- كيف أستخدمه؟
- متى أستخدمه؟
- أهم تنبيه
- إذا نسيت الجرعة
- متى أطلب المساعدة؟

Empty sections are hidden automatically.

## Safety principles

- Calculators convert prescribed orders; they do not choose therapeutic doses.
- Population and formulation must be selected before product-specific IV calculations.
- NICU and PICU profiles are never silently reused across populations.
- Preparation authority is explicit: manufacturer RTU, manufacturer preparation, ANMF, ASHP, or institution-specific.
- Ambiguous formulation, unit, concentration or diluent states must stop calculation rather than guess.
- Patient-identifying information is not embedded in the QR payload by default.

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
    patient_cards/
    visual_guides/
    feeding_tubes/
    supplements/
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
  ARABIC_PATIENT_CONTENT.md
  PATIENT_CARDS_AND_VISUALS.md
  V1_SCOPE.md
```

## Clinical content status

V1 Preview is the first functional application version and the stable structure for the encyclopedia.

The full verified counseling, NICU, PICU, feeding-tube, supplement and IV-preparation content built during the project will be migrated into versioned structured records in controlled batches.

A record must not be marked production-verified until its formulation, population, source/version metadata, review status and required safety locks are complete.

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

See the documents in `docs/` before adding new clinical content.
