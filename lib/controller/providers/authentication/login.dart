import 'package:bookingapp/apiservice/login_service.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordCntrlr = TextEditingController();
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  bool isLoading = false;

  bool _passwordVisibility = true;
  bool get passwordVisibility => _passwordVisibility;

  showPassword() {
    _passwordVisibility = !passwordVisibility;
    notifyListeners();
  }

  Future loginButtonClick(context) async {
    isLoading = true;
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
