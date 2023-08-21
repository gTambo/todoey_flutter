import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/provider_data.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
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
    testWidgets('checkbox test', (WidgetTester tester) async {
      await tester.pumpWidget(createTasksScreen());
      await tester.pumpAndSettle();
      expect(taskData.taskCount, equals(0));
      taskData.addTask('task 1');
      await tester.pumpAndSettle();
      expect(taskData.taskCount, equals(1));
      expect(find.byType(Checkbox), findsOneWidget);
    });
  });
}
