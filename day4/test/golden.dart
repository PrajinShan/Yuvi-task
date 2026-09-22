// Renders the app at a phone size and writes screenshot.png in the day folder.
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:day4/main.dart';
import 'package:day4/screens/breakdown_screen.dart';

// Golden tests use the "Ahem" placeholder font by default, so we load the
// real Roboto weights and MaterialIcons from the Flutter SDK cache instead.
Future<void> loadRealFonts() async {
  const dir = 'C:/Users/praji/flutter/bin/cache/artifacts/material_fonts';
  const families = <String, List<String>>{
    'Roboto': [
      'roboto-light.ttf',
      'roboto-regular.ttf',
      'roboto-medium.ttf',
      'roboto-bold.ttf',
    ],
    'MaterialIcons': ['materialicons-regular.otf'],
  };
  for (final entry in families.entries) {
    final loader = FontLoader(entry.key);
    for (final name in entry.value) {
      final file = File('$dir/$name');
      if (file.existsSync()) {
        final bytes = file.readAsBytesSync();
        loader.addFont(Future.value(ByteData.view(bytes.buffer)));
      }
    }
    await loader.load();
  }
}

void main() {
  testWidgets('capture screenshot.png', (tester) async {
    await loadRealFonts();
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 3.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const YuviTaskApp());
    await tester.pump(const Duration(seconds: 1));

    // Open the Daily Breakdown screen so the capture shows day4's work.
    await tester.tap(find.byIcon(Icons.pie_chart_outline_rounded));
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(BreakdownScreen),
      matchesGoldenFile('../screenshot.png'),
    );
  });
}
