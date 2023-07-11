import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.titleText,
    required this.isChecked,
    required this.checkboxCallback,
  });

  final String titleText;
  final bool isChecked;
  final Function(bool?) checkboxCallback;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isChecked,
      onChanged: checkboxCallback,
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
