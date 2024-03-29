import 'package:nexonev/presentation/screens/authentication/login.dart';
import 'package:nexonev/presentation/screens/mainscreen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider with ChangeNotifier {
  Future<void> navigateHome(ctx) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString("ACCESS_TOKEN") ?? "";
    await Future.delayed(const Duration(seconds: 3), () {});
    if (token.isEmpty) {
      Navigator.pushReplacement(
        ctx,
        MaterialPageRoute(builder: (context) {
          return LoginPage();
        }),
      );
    } else {
      bool isTokenExpired = JwtDecoder.isExpired(token);
      if (isTokenExpired) {
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
            return const MainScreen();
          }),
        );
      }
    }
  }
}
