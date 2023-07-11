import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.titleText,
    this.isChecked = false,
  });

  final String titleText;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isChecked,
      onChanged: (isChecked) {
        // callback from parent
      },
      activeColor: Colors.lightBlueAccent,
      title: Text(
        titleText,
        style: TextStyle(
            fontSize: 18,
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
    );
  }
}
