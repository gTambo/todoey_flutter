import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todoey_flutter/main.dart';
import 'package:todoey_flutter/models/provider_data.dart';

import 'screens/tasks_screen_test.dart';

void main() {
  group('Main App', () {
    testWidgets('adding multiple tasks', (tester) async {
      await tester.pumpWidget(const MyApp());
      for (int i = 1; i <= 20; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pumpAndSettle();

        await tester.enterText(find.byType(TextField).first, 'task $i');
        await tester.tap(find.text('Add'));
        await tester.pumpAndSettle();
      }

      expect(find.text('task 1'), findsOneWidget);
      expect(find.text('task 20'), findsNothing); // not visible on-screen
    });
    testWidgets('scrolling through multiple tasks', (tester) async {
      await tester.pumpWidget(const MyApp());
      // adding 20 tasks
      for (int i = 1; i <= 20; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pumpAndSettle();
        await tester.enterText(find.byType(TextField).first, 'task $i');
        await tester.tap(find.byType(TextButton));
        await tester.pumpAndSettle();
      }

      await tester.fling(
        find.byType(ListView),
        const Offset(0, -200),
        3000,
      );
      await tester.pumpAndSettle();
      expect(find.text('task 1'), findsNothing); // should no longer be visible
      expect(find.text('task 20'), findsOneWidget); // should now be visible
    });
  });
}
