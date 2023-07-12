import 'package:flutter/material.dart';
import 'tasks_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList(
      {super.key, required this.tasks, required this.checkboxCallback});

  final List tasks;
  final Function checkboxCallback;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          titleText: tasks[index].name,
          isChecked: tasks[index].isDone,
          index: index,
          checkboxCallback: checkboxCallback,
        );
      },
      itemCount: tasks.length,
    );
  }
}
