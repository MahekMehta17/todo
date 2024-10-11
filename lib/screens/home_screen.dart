import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/todo_controller.dart';

class HomeScreen extends StatelessWidget {
  final ToDoController todoController = Get.put(ToDoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo List'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () => Get.toNamed('/profile'),
          ),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: todoController.todoList.length,
          itemBuilder: (context, index) {
            var todo = todoController.todoList[index];
            return ListTile(
              title: Text(todo['title']),
              subtitle: Text('Due: ${todo['dueDate']}'),
              trailing: Chip(
                label: Text(todo['status']),
                backgroundColor: todo['status'] == 'Completed' ? Colors.green : Colors.red,
              ),
            );
          },
        );
      }),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'ToDo List'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/addTodo'),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
