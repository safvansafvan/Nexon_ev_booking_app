import 'dart:developer';

import 'package:bookingapp/apiservice/api.dart';
import 'package:bookingapp/apiservice/status.dart';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/model/authentication/otp.dart';
import 'package:bookingapp/model/authentication/signup.dart';
import 'package:bookingapp/presentation/login/otp.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isOtpLoading = false;
  bool get isOtpLoading => _isOtpLoading;

  UserOtpMode? _userOtpdata;
  UserOtpMode? get getOtpData => _userOtpdata;

  SignupError? _signupError;
  SignupError? get signupError => _signupError;

  OtpError? _otpError;
  OtpError? get otpError => _otpError;

  setLoading(bool isLoading) async {
    _isLoading = isLoading;
    notifyListeners();
  }

  setOtpLoading(bool isLoading) async {
    _isOtpLoading = isLoading;
    notifyListeners();
  }

  Future<UserOtpMode?> setUserOtpData(UserOtpMode userOtpData) async {
    _userOtpdata = userOtpData;
    return _userOtpdata;
  }

  setSignupError(SignupError signupError, context) async {
    _signupError = signupError;
    return errorResponse(_signupError!, context);
  }

  setOtpError(OtpError otpError, context) {
    _otpError = otpError;
    return errorResponseOtp(_otpError!, context);
  }

  UserSignUpModel? _userData;
  UserSignUpModel? get userData => _userData;

  Future<UserSignUpModel?> setUserData(UserSignUpModel userData) async {
    _userData = userData;
    return _userData;
  }

  getSignupStatus(context) async {
    setLoading(true);
    String url = Urls.baseUrl + Urls.signup;
    Map<dynamic, dynamic> body = {
      "username": usernameController.text.trim(),
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
      "phone": phoneController.text.trim(),
    };
    final response = await ApiServices.postMethod(
      url: url,
      data: body,
      context: context,
      function: userSignUpModelFromJson,
    );
    if (response is Success) {
      log("succes");
      log("${response.response}");
      final data = await setUserData(response.response as UserSignUpModel);
      final accessToken = data!.token;
      final userId = data.result!.id;
      final userName = data.result!.username;
      final userEmail = data.result!.email;
      setSignupStatus(
          accessToken: accessToken,
          userName: userName,
          userId: userId,
          userEmail: userEmail);
    }
    if (response is Failures) {
      log("${response.code}");
      log("failed");
      await setLoading(false);

      SignupError signuperror =
          SignupError(code: response.code, message: response.errrorResponse);
      await setSignupError(signuperror, context);
    }
    setLoading(false);
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
        // await getSignupStatus(context);
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

  getotpButtonClick(context) async {
    await getOtpStatus(context);
    clearController();
  }

  Map<String, dynamic> otpDataBody(context) {
    final body = UserOtpMode(
        email: emailController.text.trim(),
        username: usernameController.text.trim());
    return body.toJson();
  }

  errorResponse(SignupError signupError, BuildContext context) {
    final statuscode = signupError.code;
    if (statuscode == 400 || statuscode == 500) {
      return snakBarWiget(
          context: context, title: "User Already Exists", clr: kred);
    } else if (statuscode == 103) {
      log("Server issue");
    }
    return snakBarWiget(context: context, title: "No Internet", clr: kred);
  }

  errorResponseOtp(OtpError otpError, BuildContext context) {
    final statuscode = otpError.code;
    if (statuscode == 400 || statuscode == 401) {
      return snakBarWiget(context: context, title: "Invalid Otp", clr: kred);
    }
    return snakBarWiget(context: context, title: "No Internet", clr: kred);
  }

  setSignupStatus({
    required String? accessToken,
    required String? userName,
    required String? userId,
    required String? userEmail,
  }) async {
    final status = await SharedPreferences.getInstance();
    await status.setBool("isLoggedIn", true);
    await status.setString("ACCESS_TOKEN", accessToken!);
    await status.setString("USER_ID", userId!);
    await status.setString("USER_NAME", userName!);
    await status.setString("USER_EMAIL", userEmail!);
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
