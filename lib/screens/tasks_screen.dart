import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
          size: 45,
        ),
        onPressed: () {
          // add a task
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '12 Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ListView(
                children: [
                  CheckboxListTile(
                    value: true,
                    onChanged: (value) {
                      // toggle value
                      print('clicked "buy milk"');
                    },
                    title: const Text(
                      'Buy milk',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: false,
                    onChanged: (value) {
                      // toggle value
                      print('clicked "buy eggs"');
                    },
                    title: const Text(
                      'Buy eggs',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: false,
                    onChanged: (value) {
                      // toggle value
                      print('clicked "buy bread"');
                    },
                    title: const Text(
                      'Buy bread',
                      style: TextStyle(
                        fontSize: 18,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
