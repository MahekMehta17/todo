import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/todo_model.dart';

class ApiService {
  static Future<List<ToDo>> fetchToDos() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => ToDo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load ToDos');
    }
  }

// Implement other API calls if needed
}
