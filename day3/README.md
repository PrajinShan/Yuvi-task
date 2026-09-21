# day3 — Meals section + floating nav bar

Day 3 rework: the home screen now matches the new reference — a purple
radial-glow background, the goal card, a **"Today's Meals"** section with
three meal cards, and a floating glass **bottom navigation bar**.

## What I did

- `MealSection`: a `Column` of three `MealCard`s — Breakfast (460–465 Kcal),
  Lunch, and Dinner — each with its own set of food photos.
- `MealCard`: reusable row card — flame icon + meal name + subtitle on the
  left, overlapping circular food photos on the right.
- `OverlappingFoodAvatars`: a `Stack` of 32px circles (each a
  `DecorationImage` in a white-bordered `Container`) offset 20px apart, so
  the photos overlap like a photo stack.
- `FloatingBottomNavBar`: a glass-effect bar floating over the content —
  semi-transparent white with a rounded border, five icons, and the selected
  one highlighted on a white pill.
- `HomeScreen` now paints a `RadialGradient` (purple glow fading to the base
  background) behind everything, and hosts the nav bar in a `Stack`.
- Nine food photos added as assets (`bmeal*/lmeal*/dmeal*`).

## What I learnt

- A `Stack` with `Positioned` children is the simplest way to build
  overlapping photo stacks — no measuring, just fixed offsets.
- A `RadialGradient` in a full-screen `Container` decoration gives the
  "glow behind the header" effect with zero extra widgets.
- Glassmorphism = a translucent `Container` + 1px light border + blur-free
  shadow; `Colors.white.withValues(alpha: …)` keeps it subtle.
- Floating bars live in the screen's `Stack`, above the scroll view, with
  bottom padding on the scroll content so nothing hides underneath.
