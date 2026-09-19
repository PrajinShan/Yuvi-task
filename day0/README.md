# day0 — Setup and initialisation

Day 0 of the 7-day Flutter challenge: environment setup and a fresh,
runnable starter project.

## What I did

- Installed the latest stable Flutter SDK and verified it with `flutter doctor`.
- Created this single GitHub repository with **one folder per day**
  (`day0/` … `day7/`) instead of one repo per day.
- Ran `flutter create day0` so the folder is a complete, standalone project
  (web + android enabled, since the demo runs with `flutter run -d chrome`).
- Added `test/golden.dart`, a golden test that renders the app at phone size
  (390×844 @3x) and writes `screenshot.png` — so every day folder can hold a
  real capture of its screen without needing a device.

## What I learnt

- Flutter projects are self-contained: `pubspec.yaml` declares dependencies,
  `lib/main.dart` is the entry point, and `flutter run -d chrome` needs no
  Android SDK at all.
- Golden tests run the real Flutter engine headlessly, so they can produce
  genuine screenshots (`flutter test --update-goldens test/golden.dart`).
- One repo with one folder per day keeps history in a single place — each
  folder still builds and runs entirely on its own.
