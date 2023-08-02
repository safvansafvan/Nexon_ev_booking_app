import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUserDetials extends ChangeNotifier {
  String? userName;
  String? userEmail;
  Future getUsername() async {
    final pref = await SharedPreferences.getInstance();
    userName = pref.getString("USER_NAME");
    notifyListeners();
  }

  Future getUSerEmail() async {
    final pref = await SharedPreferences.getInstance();
    userEmail = pref.getString("USER_EMAIL");
    notifyListeners();
  }

  String? token;
  Future userLoginOrNot() async {
    final pref = await SharedPreferences.getInstance();
    token = pref.getString("ACCESS_TOKEN");
    notifyListeners();
  }
}
