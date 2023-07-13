import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTask) {
    _tasks.add(Task(name: newTask));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  // void toggleTaskDone(taskIndex, bool? isChanged) {
  //   _tasks.asMap().forEach(
  //     (key, task) {
  //       if (key == taskIndex) {
  //         task.toggleDone();
  //         notifyListeners();
  //       }
  //     },
  //   );
  // }
}
