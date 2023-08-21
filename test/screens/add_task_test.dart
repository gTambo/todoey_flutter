import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/provider_data.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';

// late TaskData taskData;

Widget createAddTaskScreen() => ChangeNotifierProvider<TaskData>(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: Scaffold(
          body: AddTaskScreen(
            controller: TextEditingController(),
          ),
        ),
      ),
    );

void main() {
  group('Add Task Screen widget tests', () {
    testWidgets('text field shows up', (widgetTester) async {
      await widgetTester.pumpWidget(createAddTaskScreen());
      await widgetTester.pumpAndSettle();
      expect(find.byType(TextField), findsOneWidget);
    });
  });
}
