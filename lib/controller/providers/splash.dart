import 'package:bookingapp/presentation/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../presentation/home.dart';

class SplashProvider with ChangeNotifier {
  navigateHome(ctx) async {
    final pref = await SharedPreferences.getInstance();
    final isLoggedIn = pref.getBool("isLoggedIn") ?? false;
    await Future.delayed(const Duration(seconds: 3), () {});
    if (isLoggedIn == false) {
      Navigator.pushReplacement(
        ctx,
        MaterialPageRoute(builder: (context) {
          return const LoginPage();
        }),
      );
    }
    if (isLoggedIn == true) {
      Navigator.pushReplacement(
        ctx,
        MaterialPageRoute(builder: (context) {
          return const MyHomePage();
        }),
      );
    }
    notifyListeners();
  }
}
