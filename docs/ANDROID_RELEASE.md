# Android Release Process

Drug Edu version 1.0 uses the Android application ID:

```text
com.mustafagfx97.drug_edu
```

The visible Android app label is `Drug Edu`.

## Reproducible Android project

The repository intentionally keeps the clinical Flutter source as the source of truth and regenerates the Android wrapper in CI with the same command on every run:

```bash
flutter create . --platforms=android --project-name drug_edu --org com.mustafagfx97
```

CI then verifies both the namespace/application ID and the visible app label before building.

## CI artifacts

Every CI run builds:

- debug APK: `build/app/outputs/flutter-apk/app-debug.apk`
- release APK: `build/app/outputs/flutter-apk/app-release.apk`
- release Android App Bundle: `build/app/outputs/bundle/release/app-release.aab`
- `build/release-signing-status.txt`

The release APK/AAB is a **release candidate only** unless the signing-status file says:

```text
PRODUCTION_SIGNED=true
```

Without production secrets, the current Flutter Android template falls back to debug signing for release-mode QA. That verifies release compilation but must not be uploaded to Google Play.

## Production signing secrets

Create an Android upload keystore outside the repository and store it securely. Never commit the keystore or passwords.

Configure these GitHub Actions repository secrets:

- `ANDROID_KEYSTORE_BASE64` — base64 encoding of the binary upload keystore
- `ANDROID_KEYSTORE_PASSWORD`
- `ANDROID_KEY_ALIAS`
- `ANDROID_KEY_PASSWORD`

Example base64 creation on Linux/macOS:

```bash
base64 < upload-keystore.jks | tr -d '\n'
```

On a CI run with all four secrets present, the workflow reconstructs `android/upload-keystore.jks`, writes the temporary `android/key.properties`, and the generated Flutter Gradle configuration uses that release signing configuration.

## Release checklist

Before a production upload:

1. Confirm the branch is current with `main`.
2. Confirm `pubspec.yaml` version and build number are intentionally incremented.
3. Run the full GitHub Actions workflow.
4. Confirm Analyze passes.
5. Confirm all Flutter tests pass, including `release_readiness_test.dart`.
6. Confirm debug APK, release APK and AAB all build.
7. Open `release-signing-status.txt` and confirm `PRODUCTION_SIGNED=true`.
8. Verify the package/application ID is `com.mustafagfx97.drug_edu`.
9. Use the AAB for Google Play upload.
10. Retain the same upload key securely for future updates.

## Local release build

If a local Android wrapper is absent, generate it with the same identity:

```bash
flutter create . --platforms=android --project-name drug_edu --org com.mustafagfx97
```

For local production signing, create `android/key.properties` that points to a local keystore, then run:

```bash
flutter pub get
flutter analyze
flutter test
flutter build apk --release
flutter build appbundle --release
```

Do not commit `android/key.properties`, `*.jks` or `*.keystore`.

## Clinical-release rule

A successful Android build does not by itself make clinical content safe. A production candidate is acceptable only when the clinical integrity tests also pass: 152 medication IDs, exact bilingual coverage, therapy-duration and timing coverage, unique supplement and Feeding Tube records, structured source-locked IV profiles, and visual-guide integrity.
