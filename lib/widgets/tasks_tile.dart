import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.index,
    required this.titleText,
    required this.isChecked,
    required this.checkboxCallback,
  });

  final int index;
  final String titleText;
  final bool isChecked;
  final Function checkboxCallback;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isChecked,
      onChanged: (newValue) {
        print('clicked $titleText with index $index');
        checkboxCallback(index, newValue);
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
