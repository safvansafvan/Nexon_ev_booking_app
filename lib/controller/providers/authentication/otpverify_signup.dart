import 'package:nexonev/apiservice/auth/signup_service.dart';
import 'package:nexonev/controller/providers/authentication/otp_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OtpVerificationAndSignupProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  getOtpVerificationButtonClick(context) async {
    final provider = Provider.of<OtpProvider>(context, listen: false);
    isLoading = true;
    notifyListeners();
    await SignupService.signUpAndOtpVerifyStatus(context);
    clearController();
    provider.clearController();
    isLoading = false;
    notifyListeners();
  }

  clearController() {
    usernameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
  }
}
