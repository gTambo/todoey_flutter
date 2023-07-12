import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key, required this.addTask, required this.controller});

  final Function addTask;
  String inputText = '';
  final TextEditingController controller;

  final ButtonStyle style =
      TextButton.styleFrom(backgroundColor: Colors.lightBlueAccent);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, color: Colors.lightBlueAccent),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                controller: controller,
                onChanged: (newText) {
                  inputText = newText;
                },
                // onSubmitted: (text) {
                //   inputText = text;
                // },
              ),
              const SizedBox(height: 15),
              TextButton(
                style: style,
                onPressed: () {
                  print('task to add: $inputText');
                  addTask(inputText);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Add',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
