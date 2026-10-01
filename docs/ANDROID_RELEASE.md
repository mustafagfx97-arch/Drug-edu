# Supplement Edu Android Release Process

Supplement Edu v1.1 uses the Android application ID:

```text
com.mustafagfx97.supplement_edu
```

The visible Android app label is `Supplement Edu`.

## Frozen baseline

Supplement Edu v1.0 remains frozen at:

`f26c33d50e7fa0b21f85ffe15753ee697cede16e`

v1.1 work is performed only on `supplement-edu-v1.1`.

## Reproducible Android project

The repository regenerates the Android wrapper in CI using:

```bash
flutter create . --platforms=android --project-name supplement_edu --org com.mustafagfx97
```

CI then sets the visible label to `Supplement Edu` and verifies the namespace/application ID before building.

## Current version

```text
1.1.0+2
```

## CI artifacts

Every successful v1.1 CI run builds:

- debug APK: `build/app/outputs/flutter-apk/app-debug.apk`
- release APK: `build/app/outputs/flutter-apk/app-release.apk`
- release AAB: `build/app/outputs/bundle/release/app-release.aab`
- signing-status file: `build/release-signing-status.txt`

Artifacts are uploaded as:

- `supplement-edu-v1.1-debug-apk`
- `supplement-edu-v1.1-release-candidate`

The release candidate is production-ready for Google Play only when the signing-status file reports:

```text
PRODUCTION_SIGNED=true
```

Without production secrets, the build is a QA release candidate and must not be uploaded to Google Play.

## Production signing secrets

Never commit keystores or passwords. Configure these GitHub Actions secrets:

- `ANDROID_KEYSTORE_BASE64`
- `ANDROID_KEYSTORE_PASSWORD`
- `ANDROID_KEY_ALIAS`
- `ANDROID_KEY_PASSWORD`

## Release checklist

1. Confirm the checked-out branch is `supplement-edu-v1.1`.
2. Confirm the branch head is the intended final v1.1 commit.
3. Confirm `pubspec.yaml` is intentionally set to `1.1.0+2`.
4. Run the full Supplement Edu CI workflow.
5. Confirm Analyze and all Flutter tests pass.
6. Confirm Debug APK, Release APK and Release AAB build successfully.
7. Confirm both v1.1 artifacts upload successfully.
8. For production publication, confirm `PRODUCTION_SIGNED=true`.
9. Verify the application ID is `com.mustafagfx97.supplement_edu`.
10. Use the AAB for Google Play distribution.

## Clinical-release rule

A successful Android build is not enough. The v1.1 candidate is acceptable only when the clinical regression locks also pass, including the v1.0 catalog freeze, v1.1 joint/stack safety, fertility outcome boundaries, healthy-person dose taxonomy, biotin laboratory interference, B6 neuropathy safety, and source-label integrity.
