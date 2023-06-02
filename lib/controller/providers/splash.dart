
import 'package:bookingapp/presentation/login/login.dart';
import 'package:flutter/material.dart';

class SplashProvider with ChangeNotifier {
   navigateHome(ctx) async {
    await Future.delayed(const Duration(seconds: 2),(){}
    );
    Navigator.pushReplacement(
      ctx,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
    notifyListeners();
  }
}
