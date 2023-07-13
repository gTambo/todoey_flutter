import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tasks_tile.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/provider_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = Provider.of<TaskData>(context).tasks;
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          titleText: tasks[index].name,
          isChecked: tasks[index].isDone,
          checkboxCallback: (bool? newValue) {
            Provider.of<TaskData>(context, listen: false)
                .toggleTaskDone(index, newValue);
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
