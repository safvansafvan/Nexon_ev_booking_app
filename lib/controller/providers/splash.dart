import 'package:bookingapp/presentation/login/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../presentation/home/home.dart';

class SplashProvider with ChangeNotifier {
  navigateHome(ctx) async {
    final pref = await SharedPreferences.getInstance();
    final isLoggedIn = pref.getBool("isLoggedIn") ?? false;
    await Future.delayed(const Duration(seconds:3 ), () {});
    if (isLoggedIn == false) {
      Navigator.pushReplacement(
        ctx,
        MaterialPageRoute(builder: (context) {
          return LoginPage();
        }),
      );
    } else {
      Navigator.pushReplacement(
        ctx,
        MaterialPageRoute(builder: (context) {
          return MyHomePage();
        }),
      );
    }

    notifyListeners();
  }
}
