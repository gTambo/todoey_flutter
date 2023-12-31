import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.titleText,
    required this.isChecked,
    required this.checkboxCallback,
    required this.longPressCallback,
  });

  final String titleText;
  final bool isChecked;
  final Function(bool?) checkboxCallback;
  final Function() longPressCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: longPressCallback,
      child: CheckboxListTile(
        value: isChecked,
        onChanged: checkboxCallback,
        activeColor: Colors.lightBlueAccent,
        title: Text(
          titleText,
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
      ),
    );
  }
}
