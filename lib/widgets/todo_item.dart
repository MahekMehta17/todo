import 'package:flutter/material.dart';

import '../models/todo_model.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;

  ToDoItem({required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      subtitle: Text('Due: ${todo.dueDate.toLocal()}'.split(' ')[0]),
      trailing: Text(todo.status),
      // Optionally, add more features like tapping to update status
    );
  }
}
