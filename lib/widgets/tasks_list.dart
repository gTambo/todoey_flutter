import 'package:flutter/material.dart';
import 'tasks_tile.dart';
import 'package:todoey_flutter/models/task.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TaskTile(
          titleText: tasks[0].name,
          isChecked: tasks[0].isDone,
        ),
        TaskTile(
          titleText: tasks[1].name,
          isChecked: tasks[1].isDone,
        ),
        TaskTile(
          titleText: tasks[2].name,
          isChecked: tasks[2].isDone,
        ),
      ],
    );
  }
}
