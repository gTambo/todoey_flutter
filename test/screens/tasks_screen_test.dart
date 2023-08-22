import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/provider_data.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';

late TaskData taskData;

Widget createTasksScreen() => ChangeNotifierProvider<TaskData>(
      create: (context) {
        taskData = TaskData();
        return taskData;
      },
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );

void main() {
  group('Task List widget', () {
    testWidgets('renders a list view', (WidgetTester tester) async {
      await tester.pumpWidget(createTasksScreen());
      taskData.addTask('task 1');
      await tester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
    });
    testWidgets('tapping checkbox changes task to done',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTasksScreen());
      await tester.pumpAndSettle();

      expect(taskData.taskCount, equals(0));
      taskData.addTask('task 1');
      await tester.pumpAndSettle();
      expect(taskData.taskCount, equals(1));
      expect(taskData.tasks[0].isDone, false);
      var task1 = find.byType(Checkbox).first;
      await tester.tap(task1);
      await tester.pumpAndSettle();
      expect(taskData.tasks[0].isDone, true);
    });
    testWidgets('long-press on task deletes task', (WidgetTester tester) async {
      await tester.pumpWidget(createTasksScreen());
      taskData.addTask('task 1');
      await tester.pumpAndSettle();
      var task1 = find.text('task 1');
      expect(task1, findsOneWidget);
      await tester.longPress(task1);
      await tester.pumpAndSettle();
      expect(task1, findsNothing);
    });
    testWidgets('floating action button opens add-task widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTasksScreen());
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('Add Task'), findsOneWidget);
    });
  });
}
