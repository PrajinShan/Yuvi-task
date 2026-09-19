// Smoke test: the app builds and shows the day-1 header content.
import 'package:flutter_test/flutter_test.dart';

import 'package:day1/main.dart';

void main() {
  testWidgets('home screen shows the header card', (tester) async {
    await tester.pumpWidget(const YuviTaskApp());

    expect(find.text('Welcome Back'), findsOneWidget);
    expect(find.text('Stay On Track Today'), findsOneWidget);
  });
}
