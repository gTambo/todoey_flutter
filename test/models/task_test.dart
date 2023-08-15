import 'package:flutter_test/flutter_test.dart';
import 'package:todoey_flutter/models/task.dart';

void main() {
  test('toggling task changes done from true to false', () {
    var task = Task(name: 'New task');
    expect(task.isDone, false);
    task.toggleDone();
    expect(task.isDone, true);
  });
}
