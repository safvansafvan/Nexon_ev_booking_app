import 'package:bookingapp/presentation/screens/authentication/login.dart';
import 'package:bookingapp/presentation/screens/mainscreen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider with ChangeNotifier {
  navigateHome(ctx) async {
    bool isExpired;
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString("ACCESS_TOKEN") ?? "";
    await Future.delayed(const Duration(seconds: 3), () {});
    isExpired = JwtDecoder.isExpired(token);
    if (token.isEmpty) {
      Navigator.pushReplacement(
        ctx,
        MaterialPageRoute(builder: (context) {
          return const LoginPage();
        }),
      );
    } else {
      Navigator.pushReplacement(
        ctx,
        MaterialPageRoute(builder: (context) {
          return const MainScreen();
        }),
      );
    }

    notifyListeners();
  }
}
