# Hawat (حوات) — boat owner app

The Flutter app for Hawat boat owners: trips from creation to sale, the catch, invoices and notifications. It is the phone front end of the Hawat `/api/v1` (Laravel). The server does every calculation (stock, totals, what is available to sell); the app shows what the server returns and sends the owner's actions back.

Version 1 lets only owners in. Other roles see a screen that points them to the web portal.

## What is built

| Phase | Screens |
|---|---|
| Foundation | splash, login (phone + password), forgot password → support sheet, non-owner screen, forced update |
| Home and account | home (needs action, indicators by period, trip pipeline, active trips, available fish, revenue, latest sales), bottom bar with the + quick actions, notifications, profile (photo, details, password), المزيد |
| Trips | trips list (مجدولة / جارية / للبيع / مكتملة / ملغاة, search, boat filter), trip screen with the next action, new and edit trip, start, cancel with a reason, record the catch (kept on the device until delivered), catch log |
| Selling and stock | sale wizard from a trip for sale (customer with quick add, lines capped at the available kg, payment, review), invoice screen with collecting what is due, the printable invoice and sharing, sales list (totals, unpaid filter, period, search), sending catch to a dalal, consignments list and detail, stock by species and its movements, dalals with the commission request |

## Requirements

- Flutter 3.47 (Dart 3.13), Android SDK 36, JDK 17
- The Hawat API 1.9.0 or later (`GET /app/config`, dashboard `period` and `action_items`, trips `stage`, sales `unpaid` and `totals`, `POST /owner/sales/{sale}/payments`)

## Run

Each environment is a file in `env/` passed at build time; the Android flavor sets the package id and app name.

```
flutter pub get
flutter run --flavor staging --dart-define-from-file=env/staging.json
```

| Flavor | Package id | API |
|---|---|---|
| staging | `sa.hawat.app.staging` (حوات تجريبي) | `https://hawat.sa/staging/api/v1` |
| production | `sa.hawat.app` (حوات) | `https://hawat.sa/api/v1` |

For a local server copy `env/local.example.json` to `env/local.json` (git-ignored), set your machine's address, and run with `--flavor staging --dart-define-from-file=env/local.json`.

## Build

```
flutter build apk --flavor staging --dart-define-from-file=env/staging.json
flutter build appbundle --flavor production --dart-define-from-file=env/production.json
```

Release signing reads `android/key.properties` (git-ignored):

```
storeFile=/path/to/upload-keystore.jks
storePassword=...
keyAlias=upload
keyPassword=...
```

Without it, release builds are signed with the debug key.

## Code

```
lib/
  app/        app, router (auth redirect), shell (bottom bar)
  core/       API client, session, config, storage, theme (HUD tokens), widgets, formatting
  features/   auth, home, trips, catch_log, sales, consignments, stock, dalals, contacts, notifications, profile, more, lookups, fleet
  l10n/       app_ar.arb (every string the owner reads)
```

- State: Riverpod with code generation. Models: freezed + json_serializable, written by hand from `docs/api/openapi.yaml` in the server repo.
- After changing a model or a provider: `dart run build_runner build`. After changing `app_ar.arb`: `flutter gen-l10n`. Generated files are committed exactly as the generators write them (don't run `dart format` over them; CI compares).
- Every POST that creates or changes something carries an `Idempotency-Key` per tap, reused on retry, so a lost reply never acts twice.
- Read screens render their last saved copy at once and refresh behind it.
- Trip numbers, invoice numbers and dates are wrapped in Unicode isolates (`Fmt.ltr`) so they never reverse inside Arabic text.

## Tests

```
flutter test --exclude-tags golden,e2e,screens
flutter test --tags golden
flutter test --tags screens --dart-define=FLAVOR=production
```

Unit and widget tests run against fixtures captured from a real server (`test/fixtures`). The golden tests render every screen at 360dp in light and dark mode with the real fonts (`test/golden/goldens`); they are rendered on Windows, so CI skips them. Refresh them with `--update-goldens` after a deliberate design change.

The screens run writes every screen in a phone frame, light and dark, to `docs/screens/` (long screens also scrolled, numbered `-1`, `-2`…), for sharing the app's look.

## Fonts

Chakra Petch and Tajawal (SIL Open Font License, `assets/fonts/OFL-*.txt`). Chakra Petch has no Arabic letters, so Latin and digits use it and Arabic falls through to Tajawal, as on the web portal.
