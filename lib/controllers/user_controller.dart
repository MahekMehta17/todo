import 'package:get/get.dart';

import '../models/user_model.dart';
import '../services/shared_preferences.dart';

class UserController extends GetxController {
  var user = User(name: '', email: '').obs;

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  void loadUser() async {
    var savedUser = await LocalStorageService.getUser();
    if (savedUser != null) {
      user(savedUser);
    }
  }

  void updateUser(String name, String email) {
    user.update((val) {
      val?.name = name;
      val?.email = email;
    });
    LocalStorageService.saveUser(user.value);
  }

  void updateProfilePicture(String path) {
    user.update((val) {
      val?.profilePicture = path;
    });
    LocalStorageService.saveUser(user.value);
  }
}
