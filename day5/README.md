# day5 — Icon refinements

Day 5 work: swapping the built-in Material icons on the home screen for custom,
hand-made PNG icons, so the app's imagery matches the mockups instead of the
generic icon set.

## What I did

- Replaced every **bottom navigation bar** icon with a custom PNG asset in
  `lib/widgets/bottom_nav_bar.dart`:
  - `home.png`, `meal.png`, `qr.png`, `dashboard.png`, `order.png`
  (each drawn inside a 48×48 circular button, same glass style as before).
- Replaced the **nutrient-row icons** in the Today's Goal card
  (`lib/widgets/goal_card.dart`): egg/grain/leaf became `chicken.png`,
  `fiber.png` and `fat.png`.
- Swapped the dessert icon on the Daily Breakdown screen to a cookie
  (`Icons.cookie`).
- Refined the muted row colours on the breakdown screen (icon and label
  greys tuned by hand instead of the theme constants).
- Registered all new icons under the existing `assets/images/` folder —
  pubspec already declares the directory, so no manifest change needed.

## What I learnt

- `Icon` widgets take an `IconData`, but the `icon:` slot accepts any widget —
  passing an `Image.asset` inside a fixed-size `SizedBox` drops a custom PNG
  into the same space with no other code changes.
- Golden/widget tests that find buttons with `find.byIcon` break the moment an
  icon becomes an image; `find.byWidgetPredicate` matching the asset name is
  the reliable replacement.

## Status

- App behaves exactly like day 4 (navigation to Daily Breakdown unchanged);
  only the iconography and small colour refinements differ.
