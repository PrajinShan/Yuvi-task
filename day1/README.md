# day1 — Design tokens + header card

Day 1 of the build: the shared theme and the first component of screen 1 —
the purple gradient **header card**.

## What I did

- Sampled the mockup's colours programmatically (numpy over `screen.png`) and
  froze them into `lib/theme/app_colors.dart`:
  - ink `#16110E`, scaffold `#F0EFF2`, card `#FFFFFF`, muted `#747474`
  - header gradient `#B48CF2` → `#DAC9F4`
- Set up the type scale in `lib/theme/app_text.dart` (greeting 17/w500,
  headline 24/w700, section 18/w700, body 14, label 12).
- Built `HeaderCard` as four small widgets instead of one nested tree:
  `HeaderCard` (gradient container + Row) → `HeaderText`, `HeaderIconButton`,
  `AvatarBadge`.
- Cropped the avatar photo **straight from the mockup** into
  `assets/images/avatar.png` (rules say graphics must come from the mockup).
- Added the same golden-test harness as day0 so `screenshot.png` is a real
  capture of the app at 390×844.

## What I learnt

- `LinearGradient` inside a `BoxDecoration` is all a "gradient card" is —
  the mockup's soft look comes from low-saturation endpoints, not shadows.
- `DecorationImage` + `BoxShape.circle` clips a photo into an avatar without
  any `ClipRRect` / `ClipOval` machinery.
- Real fonts don't exist in golden tests by default (they render "Ahem"
  blocks) — `FontLoader` with the SDK's Roboto fixes that.
- Keeping each visual block as its own widget keeps `build()` methods short
  enough to explain line by line — which is exactly what the evaluation asks.
