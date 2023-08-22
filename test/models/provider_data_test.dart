import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todoey_flutter/models/provider_data.dart';
import 'package:todoey_flutter/models/task.dart';

class MockCallbackFunction extends Mock {
  call();
}

void main() {
  group('$TaskData', () {
    late TaskData taskData;
    final notifyListenerCallback =
        MockCallbackFunction(); // Your callback function mock

    setUp(() {
      taskData = TaskData()..addListener(notifyListenerCallback);
      reset(notifyListenerCallback); // resets your mock before each test
    });

    test('returns a list of tasks', () {
      taskData.addTask('task one');
      expect(taskData.tasks, isA<List<Task>>());
    });

    test('adds a task and calls listeners', () {
      taskData.addTask('task one'); // notify listeners
      expect(taskData.taskCount, 1);
      taskData.addTask('task two'); // notify listeners
      verify(notifyListenerCallback())
          .called(2); // verify listener were notified twice
    });

    test('unit tests are independent from each other', () {
      taskData.addTask('task one');
      expect(taskData.taskCount, 1);
      taskData.addTask('task two');
      verify(notifyListenerCallback()).called(
          2); // verify listener were notified twice. This only works, if you have reset your mocks
    });

    test('updates a task and calls listeners', () {
      taskData.addTask('task one');
      final task1 = taskData.tasks[0];
      expect(task1.isDone, false);
      taskData.updateTask(task1);
      expect(task1.isDone, true);
      verify(notifyListenerCallback())
          .called(2); // verify listener were notified twice
    });
    test('removes a task and calls listeners', () {
      taskData.addTask('task one');
      expect(taskData.taskCount, 1);
      final task1 = taskData.tasks[0];
      taskData.deleteTask(task1);
      expect(taskData.taskCount, 0);
      verify(notifyListenerCallback()).called(2);
    });
  });
}
