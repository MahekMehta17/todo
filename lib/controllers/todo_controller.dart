import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ToDoController extends GetxController {
  var todoList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchToDos();
  }

  void addToDo(String title, DateTime dueDate, String priority) {
    var newTodo = {
      'title': title,
      'dueDate': dueDate.toIso8601String(),
      'priority': priority,
      'status': 'Pending',
    };
    todoList.add(newTodo);
  }

  void fetchToDos() async {
    try {
      var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        todoList.assignAll(data
            .map((todo) => {
                  'title': todo['title'],
                  'dueDate': DateTime.now().add(Duration(days: 3)).toIso8601String(),
                  'status': todo['completed'] ? 'Completed' : 'Pending',
                })
            .toList());
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch ToDos');
    }
  }
}
