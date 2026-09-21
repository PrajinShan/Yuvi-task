// Smoke test: the app builds and shows the goal card and the meals section.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:day3/main.dart';

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
}
