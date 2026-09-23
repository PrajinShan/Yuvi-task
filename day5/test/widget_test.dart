// Tests for day5: home smoke test + navigation to the Daily Breakdown screen.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:day5/main.dart';

void main() {
  testWidgets('home screen shows goal card and all meal cards', (tester) async {
    await tester.pumpWidget(const YuviTaskApp());

    expect(find.text("Today's Goal"), findsOneWidget);
    expect(find.text("Today's Meals"), findsOneWidget);

    // The meal cards sit below the fold — scroll the page down to them.
    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -600));
    await tester.pump();

    expect(find.text('Breakfast'), findsOneWidget);
    expect(find.text('Lunch'), findsOneWidget);

    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -600));
    await tester.pump();

    expect(find.text('Dinner'), findsOneWidget);
  });

  testWidgets('pie-chart nav button opens Daily Breakdown and back returns', (tester) async {
    await tester.pumpWidget(const YuviTaskApp());

    // Tap the 4th nav-bar item — the pie-chart icon, drawn as a custom
    // PNG asset (assets/images/dashboard.png) since the day5 icon pass.
    final pieIcon = find.byWidgetPredicate(
      (w) =>
          w is Image &&
          w.image is AssetImage &&
          (w.image as AssetImage).assetName == 'assets/images/dashboard.png',
    );
    await tester.tap(pieIcon);
    await tester.pumpAndSettle();

    expect(find.text('Daily Breakdown'), findsOneWidget);
    expect(find.textContaining('460'), findsOneWidget);
    expect(find.text('Calories'), findsOneWidget);
    expect(find.text('Protein'), findsOneWidget);
    expect(find.text('Carbs'), findsOneWidget);
    expect(find.text('Fats'), findsOneWidget);
    expect(find.text('500/1947 ml'), findsOneWidget);
    expect(find.text('Health Score'), findsOneWidget);
    expect(find.text('Good'), findsOneWidget);
    expect(find.text('Fiber'), findsOneWidget);
    expect(find.text('Net Crabs'), findsOneWidget);
    expect(find.text('Sugar'), findsOneWidget);
    expect(find.text('Sodium'), findsOneWidget);

    // The back chevron returns to the home screen.
    await tester.tap(find.byIcon(Icons.chevron_left_rounded));
    await tester.pumpAndSettle();

    expect(find.text("Today's Goal"), findsOneWidget);
    expect(find.text('Daily Breakdown'), findsNothing);
  });
}
