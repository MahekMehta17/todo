import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class LocalStorageService {
  static const String USER_KEY = 'user_profile';

  static Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(USER_KEY, json.encode(user.toJson()));
  }

  static Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? userString = prefs.getString(USER_KEY);
    if (userString != null) {
      Map<String, dynamic> userMap = json.decode(userString);
      return User.fromJson(userMap);
    }
    return null;
  }
}
