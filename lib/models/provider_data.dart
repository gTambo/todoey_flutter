import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];

  int get taskCount {
    return tasks.length;
  }

  void addTask(String newTask) {
    tasks.add(Task(name: newTask));
    notifyListeners();
  }

  void toggleTaskDone(taskIndex, bool? isChanged) {
    tasks.asMap().forEach(
      (key, task) {
        if (key == taskIndex) {
          task.toggleDone();
          notifyListeners();
        }
      },
    );
  }
}
