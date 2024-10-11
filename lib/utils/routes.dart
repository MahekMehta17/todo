import 'package:get/get.dart';

import '../screens/add_todo_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';

class Routes {
  static const HOME = '/';
  static const ADD_TODO = '/add-todo';
  static const PROFILE = '/profile';
}

List<GetPage> getPages = [
  GetPage(
    name: Routes.HOME,
    page: () => HomeScreen(),
    // Define transition if needed
  ),
  GetPage(
    name: Routes.ADD_TODO,
    page: () => AddTodoScreen(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: Routes.PROFILE,
    page: () => ProfileScreen(),
    transition: Transition.leftToRight,
  ),
];
