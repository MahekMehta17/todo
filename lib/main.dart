import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/screens/add_todo_screen.dart';

import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ToDo App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        hintColor: Colors.greenAccent,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/addTodo', page: () => AddTodoScreen()),
        GetPage(name: '/profile', page: () => ProfileScreen()),
      ],
    );
  }
}
