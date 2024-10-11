import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/todo_controller.dart';

class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  DateTime? _dueDate;
  String _priority = 'Low';

  final ToDoController todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add ToDo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) => value!.isEmpty ? 'Title is required' : null,
                onSaved: (value) => _title = value!,
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() => _dueDate = pickedDate);
                  }
                },
                child: Text(_dueDate == null ? 'Pick Due Date' : _dueDate!.toLocal().toString()),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Priority'),
                value: _priority,
                items: ['Low', 'Medium', 'High'].map((priority) {
                  return DropdownMenuItem(
                    value: priority,
                    child: Text(priority),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _priority = value!),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && _dueDate != null) {
                    _formKey.currentState!.save();
                    todoController.addToDo(_title, _dueDate!, _priority);
                    Get.back();
                  } else if (_dueDate == null) {
                    Get.snackbar('Error', 'Please select a valid due date');
                  }
                },
                child: Text('Add ToDo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
