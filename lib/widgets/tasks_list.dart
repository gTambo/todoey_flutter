import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tasks_tile.dart';
import 'package:todoey_flutter/models/provider_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              titleText: task.name,
              isChecked: task.isDone,
              checkboxCallback: (bool? newValue) {
                // Provider.of<TaskData>(context, listen: false)
                //     .toggleTaskDone(index, newValue);
                taskData.updateTask(task);
              },
              longPressCallback: () {
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
