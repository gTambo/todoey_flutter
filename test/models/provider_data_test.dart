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

    test('adds a task and calls listeners', () {
      taskData.addTask('task one');
      expect(taskData.taskCount, 1);
      taskData.addTask('task two');
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
  });
}
