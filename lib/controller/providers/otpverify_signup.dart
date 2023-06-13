import 'dart:developer';
import 'package:bookingapp/apiservice/api.dart';
import 'package:bookingapp/apiservice/status.dart';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/model/authentication/otp.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';
import 'package:flutter/material.dart';
import '../../presentation/authentication/otp_verify.dart';

class OtpVerificationAndSignupProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  TextEditingController otpNumone = TextEditingController();
  TextEditingController otpNumTwo = TextEditingController();
  TextEditingController otpNumThree = TextEditingController();
  TextEditingController otpNumFour = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isOtpLoading = false;
  bool get isOtpLoading => _isOtpLoading;

  setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  setOtpLoading(bool isLoading) {
    _isOtpLoading = isLoading;
    notifyListeners();
  }

  OtpError? _otpError;
  OtpError? get otpError => _otpError;
  setOtpError(OtpError otpError, context) {
    _otpError = otpError;
    return errorResponseOtp(_otpError!, context);
  }

  getOtpVerificationAndSignupStatus(context) async {
    String joinedOtp =
        otpNumone.text + otpNumTwo.text + otpNumThree.text + otpNumFour.text;
    setLoading(true);
    String url = Urls.baseUrl + Urls.otpVerificationAndSignup;
    log(url.toString(), name: "error");
    Map<String, dynamic> body = {
      "username": usernameController.text.trim(),
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
      "phone": phoneController.text.trim(),
      "otp": joinedOtp
    };
    ApiServices.otpPostMethod(
      url: url,
      data: body,
      context: context,
    );
  }

  getOtpStatus(context) async {
    final navigator = Navigator.of(context);
    setLoading(true);
    String url = Urls.baseUrl + Urls.otp;
    final response = await ApiServices.postMethod(
        url: url,
        data: otpDataBody(context),
        context: context,
        function: userOtpModeFromJson);

    if (response is Success) {
      log("success");
      navigator.push(
        MaterialPageRoute(
          builder: (context) => const OtpScreen(),
        ),
      );
    }
    if (response is Failures) {
      log("${response.code}");
      log("failed");
      await setLoading(false);
      OtpError otpError =
          OtpError(code: response.code, message: response.errrorResponse);
      await setOtpError(otpError, context);
    }
    setLoading(false);
  }

  signUpButtonClick(context) async {
    await getOtpStatus(context);
    // clearController();
  }

  Map<String, dynamic> otpDataBody(context) {
    final body = UserOtpMode(
        email: emailController.text.trim(),
        username: usernameController.text.trim());
    return body.toJson();
  }

  errorResponseOtp(OtpError otpError, BuildContext context) {
    final statuscode = otpError.code;
    if (statuscode == 400 || statuscode == 401) {
      return snakBarWiget(context: context, title: "Invalid Otp", clr: kred);
    }
    return snakBarWiget(context: context, title: "No Internet", clr: kred);
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

class OtpError {
  int? code;
  Object? message;
  OtpError({this.code, this.message});
}
