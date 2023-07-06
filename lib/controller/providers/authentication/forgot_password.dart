import 'package:bookingapp/apiservice/forgot_p_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  bool isLoadingEmailSend = false;
  bool isLoadingotp = false;
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  //otp controller
  TextEditingController otpController1 = TextEditingController();
  TextEditingController otpController2 = TextEditingController();
  TextEditingController otpController3 = TextEditingController();
  TextEditingController otpController4 = TextEditingController();

  ///this two fuction send otp to email
  inForgotEmailVerifyClick(context) async {
    isLoadingEmailSend = true;
    await ForgotPasswordService.getForgotPasswordStatus(context);
    clearController();
    isLoadingEmailSend = false;
    notifyListeners();
  }

  ///this two fun is verify password and otp
  verifyButtonClick(context) async {
    final provider =
        Provider.of<ForgotPasswordProvider>(context, listen: false);
    isLoadingotp = true;
    await ForgotPasswordService.setNewPasswordStatus(context, provider);
    clearController();
    isLoadingotp = false;
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
