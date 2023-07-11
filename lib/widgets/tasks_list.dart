import 'package:flutter/material.dart';
import 'tasks_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        TaskTile(
          titleText: 'buy milk',
          isChecked: true,
        ),
        TaskTile(
          titleText: 'Buy eggs',
          isChecked: false,
        ),
        TaskTile(
          titleText: 'Buy bread',
          isChecked: false,
          titleDecoration: TextDecoration.lineThrough,
        ),
      ],
    );
  }
}
