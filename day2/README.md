# day2 — Week strip + Today's Goal card

Day 2: the two big content blocks under the header on screen 1 — the
**weekday chip strip** and the **"Today's Goal" card**.

## What I did

- `WeekStrip`: horizontally scrolling row of `DayChip`s (Wed 11 … Tue 17).
  The selected day (Friday in the mockup) is a dark pill with white text —
  same `Container` with a conditional `BoxDecoration`, no `Chip` machinery.
- `RingPainter`: a `CustomPainter` that draws a grey track circle plus a
  colored progress arc with rounded caps. One painter now powers every ring
  in the app (big calorie ring, small macro rings, later screen 2's ring).
- `GoalCard`: white rounded card with "Today's Goal", the big
  460/1600 kcal ring with a flame icon, and three mini-rings
  (Protein 34g / Carbs 25g / Fat 14g) with captions.
- Reused the day1 theme files and header card (each day folder stays a
  complete, standalone project).

## What I learnt

- `CustomPainter` basics: `drawCircle` for the track, `drawArc` starting at
  `-pi/2` (12 o'clock) sweeping `2π × progress`; `StrokeCap.round` gives the
  rounded ends seen in the mockup.
- A `Stack` with `Alignment.center` places the number + icon in the middle
  of a ring — no `Positioned` math needed.
- `ListView.separated` with `scrollDirection: Axis.horizontal` makes the
  strip scrollable on narrow screens while matching the mockup spacing.
- Records (`('Wed', '11')`) are a tidy way to hold tiny label/data pairs
  without declaring a model class.
