import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class GetUserDetials {
  Future<String> getUsername() async {
    final pref = await SharedPreferences.getInstance();
    final userName = pref.getString("USER_NAME");
    log(userName.toString());
    return userName.toString();
  }

  Future<String> getUSerEmail() async {
    final pref = await SharedPreferences.getInstance();
    final userEmail = pref.getString("USER_EMAIL");
    log(userEmail.toString());
    return userEmail.toString();
  }
}
