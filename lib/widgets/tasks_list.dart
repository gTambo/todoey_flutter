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

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        TaskTile(
          titleText: 'buy milk',
        ),
        TaskTile(
          titleText: 'Buy eggs',
        ),
        TaskTile(
          titleText: 'Buy bread',
        ),
      ],
    );
  }
}
