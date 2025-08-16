// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:water_dashboard/main.dart';

void main() {
  testWidgets('Bottom navigation switches tabs and dashboard still works', (tester) async {
    await tester.pumpWidget(const MyApp());

    // Starts on Home (Dashboard)
    expect(find.widgetWithText(AppBar, 'Hydro Monitor'), findsOneWidget);
    expect(find.text('Overview'), findsOneWidget);

    // Switch to Plants tab
    await tester.tap(find.byIcon(Icons.eco));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(AppBar, 'Plants'), findsOneWidget);

    // Switch to Insights tab
    await tester.tap(find.byIcon(Icons.bar_chart));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(AppBar, 'Insights'), findsOneWidget);

    // Back to Home tab
    await tester.tap(find.byIcon(Icons.home));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(AppBar, 'Hydro Monitor'), findsOneWidget);
    // and the metric selection still works
    await tester.tap(find.text('Nutrients'));
    await tester.pumpAndSettle();
    expect(find.text('Nutrients level'), findsOneWidget);
  });
}
