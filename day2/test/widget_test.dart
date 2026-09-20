// Smoke test: the app builds and shows the day-2 components.
import 'package:flutter_test/flutter_test.dart';

import 'package:day2/main.dart';

void main() {
  testWidgets('home screen shows strip and goal card', (tester) async {
    await tester.pumpWidget(const YuviTaskApp());

    expect(find.text('Welcome Back'), findsOneWidget);
    expect(find.text("Today's Goal"), findsOneWidget);
    expect(find.text('Fri'), findsOneWidget);
    expect(find.text('460/1600'), findsOneWidget);
  });
}
