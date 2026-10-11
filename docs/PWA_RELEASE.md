# Drug Edu Progressive Web App (PWA)

The **original Flutter Drug Edu source remains intact**. The PWA is compiled
from `lib/main.dart`, not a new or separate medication database.

## Build status

- CI: `Flutter CI` runs Analyze, Tests, **PWA web release** and existing
  mobile regression builds. Web artifact: `drug-edu-pwa-web-release`.
- All IV calculations remain **arithmetic on existing prescribed orders**;
  the PWA is not a verified medical device or a substitute for hospital protocols.
- Browser offline cache is **network-first**, meaning available updates win
  over cached responses. If offline, displayed content may be outdated:
  **reconnect and check current manufacturer references before clinical use**.
- Browser/local storage may contain user-entered information; **do not enter
  patient identifiers or protected health information** without a dedicated
  privacy/security review and an approved organizational policy.

## Publish with HTTPS on GitHub Pages

1. First ensure the latest `main` release has a **green Flutter CI**, including
   Analyze, Tests and the PWA artifact.
2. In repository **Settings → Pages**, select **GitHub Actions** for the Source.
3. Open **Actions → Publish Drug Edu PWA to GitHub Pages → Run workflow** on `main`.
4. Only after its deployment succeeds, open the URL in that workflow's
   `github-pages` environment. The expected GitHub Pages project URL is
   `https://mustafagfx97-arch.github.io/Drug-edu/`; it is **not active until published**.

The GitHub Actions deploy task runs Flutter Analyze and Tests itself before
building/releasing web assets. Never deploy directly from a failing PR.

## Install

- Android Chrome: visit the **published HTTPS** PWA → browser menu → **Install app**
  / **Add to Home screen**.
- iPhone Safari: visit the published URL → **Share** → **Add to Home Screen**.
- Desktop Chrome/Edge: visit URL → **Install** in browser menu or address bar.

## Local development

```bash
flutter pub get
flutter run -d chrome
flutter build web --release --base-href "/Drug-edu/" --pwa-strategy=none
```

For hosting on a custom domain at the root, compile with `--base-href "/"`
instead; `/Drug-edu/` is for this repository's GitHub Pages subpath.

## PWA behavior

- App manifest has explicit 192px and 512px icons, standalone display,
  theme color and scoped start URL.
- Network-first `sw.js` caches successfully visited same-origin resources for
  fallback; **full offline availability is not guaranteed** because Flutter
  dependencies and unvisited assets may need network access.
- Do not rely on any stale cached IV compounding, Y-site compatibility, dose
  calculation or dilution information for treatment.
