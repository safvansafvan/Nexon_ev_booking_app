import 'dart:developer';
import 'package:bookingapp/apiservice/api.dart';
import 'package:bookingapp/apiservice/status.dart';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/presentation/authentication/forgot_password/new_password.dart';
import 'package:bookingapp/presentation/authentication/login.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';
import 'package:flutter/material.dart';

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
  emailSendButtonClick(context) async {
    await getForgotPassword(context);
    notifyListeners();
  }

  getForgotPassword(context) async {
    isLoadingEmailSend = true;
    final String url = Urls.baseUrl + Urls.forgotPassword;
    Map<String, String> body = {"email": emailController.text.trim()};
    final response =
        await ApiServices.postMethod(url: url, context: context, data: body);

    if (response is Success) {
      log("success", name: "forgot");
      log("$response", name: "GEtFotgot");
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const NewPasswordWidget(),
        ),
      );
      snakBarWiget(context: context, title: "Otp Sented", clr: kGreen);
      isLoadingEmailSend = false;
    }
    if (response is Failures) {
      log('failed');
      snakBarWiget(context: context, title: "Wrog email", clr: kred);
    }
    isLoadingEmailSend = false;
  }

  ///this two fun is verify password and otp
  verifyButtonClick(context) async {
    await setNewPassword(context);
    notifyListeners();
  }

  setNewPassword(context) async {
    isLoadingotp = true;
    final joinedOtp = otpController1.text +
        otpController2.text +
        otpController3.text +
        otpController4.text;
    final String url = Urls.baseUrl + Urls.verifyAndForgot;
    Map<String, dynamic> body = {
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
      "otp": joinedOtp
    };
    final response = await ApiServices.postMethod(
      url: url,
      context: context,
      data: body,
    );

    if (response is Success) {
      log("success", name: "setnewpassword");
      log("${response.code}");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
      snakBarWiget(context: context, title: "Password Changed", clr: kGreen);
      isLoadingotp = false;
    }
    if (response is Failures) {
      log("failed");
      log("${response.code}");
      snakBarWiget(context: context, title: "Enter Correct OTP", clr: kred);
    }
    isLoadingotp = false;
  }

  clearController() {
    emailController.clear();
    passwordController.clear();
  }
}
