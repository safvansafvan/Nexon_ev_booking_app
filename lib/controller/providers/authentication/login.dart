import 'dart:developer';
import 'package:nexonev/apiservice/auth/login_service.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordCntrlr = TextEditingController();
  bool isLoading = false;

  bool _passwordVisibility = true;
  bool get passwordVisibility => _passwordVisibility;

  showPassword() {
    _passwordVisibility = !passwordVisibility;
    notifyListeners();
  }

  Future loginButtonClick(context) async {
    isLoading = true;
    notifyListeners();
    log("called");
    await LoginApiService.getLoginStatuss(context);
    isLoading = false;
    clearController();
    notifyListeners();
  }

  void clearController() {
    emailController.clear();
    passwordCntrlr.clear();
  }
}
