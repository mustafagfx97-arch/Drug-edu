# Supplement Edu

Supplement Edu is an Android-focused clinical-pharmacist workspace for practical, evidence-bounded supplement counseling. It separates nutritional requirements from supplement doses, prevention, deficiency treatment, and condition-specific study doses.

## Frozen baselines

- Drug Edu original frozen main: `ea6b16710a2d458c1ebdb7cae67f1489d5b8f80c`.
- Supplement Edu v1.0 frozen baseline: `f26c33d50e7fa0b21f85ffe15753ee697cede16e`.
- Current development/release branch: `supplement-edu-v1.1`.

The v1.0 commit remains the immutable baseline. v1.1 is an additive branch and does not rewrite that frozen commit.

## Supplement Edu v1.1 scope

v1.1 adds four focused layers on top of the frozen v1.0 encyclopedia:

- Joint & Collagen Toolkit plus the patient stack-safety planner.
- Sexual Health & Fertility Toolkit with sexual function kept separate from infertility and with study-dose/evidence boundaries.
- Who Actually Needs What? with healthy-person laboratory logic and clear separation of RDA/AI, routine supplement, preventive, treatment, study dose, and %DV.
- Hair / Nails / Neurologic supplement counseling with biotin laboratory-interference safeguards and high-dose B6 neuropathy locks.

The branch retains the v1.0 clinical catalogs and adds regression-locked v1.1 catalogs including 8 joint profiles, 17 reproductive profiles, 16 need pathways, 15 practical usual-dose rules, 17 elective daily-dose rules, and 7 nerve/hair profiles.

## Core counseling rule

`Daily requirement (RDA/AI) != routine supplement dose != preventive dose != therapeutic/deficiency dose != study/condition-specific dose != %DV.`

If no evidence-based routine supplemental dose exists, the app should say so instead of inventing one. Commercial label strengths are not automatically clinical recommendations.

## Clinical safety rules

- Exact ingredient, salt, formulation, strain, extract, collagen type, and product details matter.
- Study doses are labeled as study/condition-specific doses and are not converted into routine wellness doses.
- Improvement in semen parameters is not treated as automatic evidence of pregnancy or live-birth benefit.
- High-dose biotin is flagged for assay interference; the patient should report the exact product and dose to the clinician/laboratory and follow assay-specific instructions rather than a universal washout rule.
- Chronic high-dose vitamin B6 is flagged for sensory-neuropathy risk.
- Fertility and sexual-health products do not replace diagnosis or specialist referral when indicated.
- The stack planner checks high-value duplication, spacing, GI burden, anticoagulation and other safety flags but does not claim that unflagged combinations are interaction-free.

## Version and Android identity

Current v1.1 package version:

`1.1.0+2`

Android application ID:

`com.mustafagfx97.supplement_edu`

Visible app name:

`Supplement Edu`

## Quality gates

Every release candidate must pass:

```bash
flutter analyze
flutter test
flutter build apk --debug
flutter build apk --release
flutter build appbundle --release
```

CI uploads:

- `supplement-edu-v1.1-debug-apk`
- `supplement-edu-v1.1-release-candidate` containing the Release APK, Release AAB and signing-status file.

A release candidate is not a Google Play production build unless `release-signing-status.txt` says `PRODUCTION_SIGNED=true`.

## Maintenance after v1.1

After the v1.1 freeze, routine maintenance should focus on meaningful source changes: regulatory safety communications, authoritative guideline updates, formulation/label changes, clinically important new trials, and corrections. Broad catalog expansion should be deliberate rather than endless.
