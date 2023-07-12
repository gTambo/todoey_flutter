import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tasks_tile.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/provider_data.dart';

class TasksList extends StatefulWidget {
  const TasksList({
    super.key,
    // required this.tasks,
  });

  // final List<Task> tasks;

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    List<Task> tasks = Provider.of<Data>(context).tasks;
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          titleText: tasks[index].name,
          isChecked: tasks[index].isDone,
          checkboxCallback: (bool? newValue) {
            Provider.of<Data>(context, listen: false)
                .toggleTaskDone(index, newValue);
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
