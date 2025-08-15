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
  testWidgets('Dashboard renders key sections', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Hydro Monitor'), findsOneWidget);
    expect(find.text('Overview'), findsOneWidget);
    expect(find.text('Results'), findsOneWidget);

    // Three boxes labels
    expect(find.text('Water'), findsOneWidget);
    expect(find.text('Nutrients'), findsOneWidget);
    expect(find.text('pH'), findsOneWidget);

    // Result rows labels
    expect(find.text('Water level'), findsOneWidget);
    expect(find.text('Nutrients level'), findsOneWidget);
    expect(find.text('pH level'), findsOneWidget);
  });
}
