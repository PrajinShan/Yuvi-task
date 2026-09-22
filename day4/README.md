# day4 — Navigating to Daily Breakdown screen

Day 3 work: the home screen now navigates to **Daily Breakdown** screen. Added UI design and elements in the **Daily Breakdown** screen.

## What I did

- `BreakdownScreen`: built a daily nutrition overview screen featuring a main calorie breakdown card, tinted macro indicator chips, water tracker, and health score breakdown on a lavender background.
- `GaugePainter`: implemented a custom arc painter that draws a 270° progress arc with rounded caps and a glowing tip marker (outer cap with inner white dot) matching the design mock.
- `WaterWidget`: created a custom water tracking widget combining a progress ring with an inner circular liquid fill that features a wave curve.
- `_NutrientRow`: created reusable rows displaying nutrient values alongside status dots (green/red) to quickly communicate healthy vs. high intake metrics.

## What I learnt

- Drawing custom tip indicators on arcs requires simple trigonometry: using `cos()` and `sin()` on the arc's end angle pinpoints the exact canvas offset for terminal knobs.
- Layering paths with `canvas.clipPath()` is an efficient way to constrain complex liquid/wave geometries inside circular bounds without extra opacity layers.
- Custom painters handle complex gauge UI needs (like hollow tip caps) far better than attempting to stretch built-in progress indicators beyond their designed scope.
