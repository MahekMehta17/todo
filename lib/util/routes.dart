import 'package:get/get.dart';

import '../screens/add_todo_screen.dart';
import '../screens/edit_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';

class Routes {
  static const initRoute = '/';
  static const home = '/home';
  static const addTodo = '/add-todo';
  static const profile = '/profile';
  static const editProfile = '/edit-profile';
}

final List<GetPage> appRoutes = [
  GetPage(name: Routes.initRoute, page: () => const HomeScreen()),
  GetPage(name: Routes.home, page: () => const HomeScreen()),
  GetPage(name: Routes.addTodo, page: () => const AddTodoScreen()),
  GetPage(name: Routes.profile, page: () => const UserProfileScreen()),
  GetPage(name: Routes.editProfile, page: () => const EditProfileScreen()),
];
