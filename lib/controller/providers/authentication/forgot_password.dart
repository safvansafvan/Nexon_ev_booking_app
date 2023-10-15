import 'package:nexonev/apiservice/auth/forgot_p_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  bool isOtpSent = false;
  bool isOtpVerify = false;
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  //otp controller
  TextEditingController otpController1 = TextEditingController();
  TextEditingController otpController2 = TextEditingController();
  TextEditingController otpController3 = TextEditingController();
  TextEditingController otpController4 = TextEditingController();

  ///this two fuction is used to send otp to email
  inForgotEmailVerifyClick(context) async {
    isOtpSent = true;
    notifyListeners();
    await ForgotPasswordService.getForgotPasswordStatus(context);
    clearController();
    isOtpSent = false;
    notifyListeners();
  }

  ///this two fun is verify password and otp
  verifyButtonClick(context) async {
    final provider =
        Provider.of<ForgotPasswordProvider>(context, listen: false);
    isOtpVerify = true;
    await ForgotPasswordService.setNewPasswordStatus(context, provider);
    clearController();
    isOtpVerify = false;
    notifyListeners();
  }

  clearController() {
    emailController.clear();
    passwordController.clear();
    otpController1.clear();
    otpController2.clear();
    otpController3.clear();
    otpController4.clear();
  }
}
