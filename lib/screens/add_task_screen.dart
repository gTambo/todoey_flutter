import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/provider_data.dart';

//ignore: must_be_immutable
class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({
    super.key,
    required this.controller,
  });

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
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, color: Colors.lightBlueAccent),
              ),
              TextField(
                controller: controller,
                autofocus: true,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              TextButton(
                style: style,
                onPressed: () {
                  context.read<TaskData>().addTask(controller.text);
                  Navigator.pop(context);
                  controller.clear();
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
