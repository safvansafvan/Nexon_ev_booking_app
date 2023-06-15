import 'dart:developer';
import 'package:bookingapp/apiservice/api.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/controller/providers/otp_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OtpVerificationAndSignupProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  getOtpVerificationAndSignupStatus(context) async {
    final otp = Provider.of<OtpProvider>(context, listen: false).otp();
    setLoading(true);
    String url = Urls.baseUrl + Urls.otpVerificationAndSignup;
    log(url.toString(), name: "error");
    Map<String, dynamic> body = {
      "username": usernameController.text.trim(),
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
      "phone": phoneController.text.trim(),
      "otp": otp
    };
    ApiServices.otpPostMethod(
      url: url,
      data: body,
      context: context,
    );
  }

  clearController() {
    usernameController.clear();
    passwordController.clear();
    emailController.clear();
    phoneController.clear();
  }
}

class SignupError {
  int? code;
  Object? message;

  SignupError({this.code, this.message});
}
