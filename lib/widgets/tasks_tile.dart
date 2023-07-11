import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.titleText,
    this.isChecked,
    this.titleDecoration,
  });

  final String titleText;
  final bool? isChecked;
  final TextDecoration? titleDecoration;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isChecked ?? false,
      onChanged: (value) {
        // toggle value
        print('clicked "buy milk"');
      },
      title: Text(
        titleText,
        style: TextStyle(fontSize: 18, decoration: titleDecoration),
      ),
    );
  }
}
