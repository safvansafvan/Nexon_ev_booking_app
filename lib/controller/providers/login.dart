import 'dart:developer';
import 'package:bookingapp/apiservice/api.dart';
import 'package:bookingapp/apiservice/status.dart';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/model/authentication/login.dart';
import 'package:bookingapp/presentation/home/home.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordCntrlr = TextEditingController();
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  String? _userName;
  String? get userName => _userName;

  String? _userEmail;
  String? get userEmail => _userEmail;

  Error? _loginError;
  Error? get loginError => _loginError;

  bool _passwordVisibility = true;
  bool get passwordVisibility => _passwordVisibility;

  bool isLoading = false;

  UserLoginModel? _userData;
  UserLoginModel? get userData => _userData;

  Future<UserLoginModel?> setUserData(UserLoginModel userData) async {
    _userData = userData;
    return _userData;
  }

  getUserName(String? userName) {
    _userName = userName;
    notifyListeners();
  }

  getUserEmail(String? usrEmail) {
    _userEmail = usrEmail;
    notifyListeners();
  }

  showPassword() {
    _passwordVisibility = !passwordVisibility;
    notifyListeners();
  }

  getLoginStatus(context) async {
    isLoading = true;
    String url = Urls.baseUrl + Urls.login;
    Map<String, dynamic> body = {
      "email": emailController.text.trim(),
      "password": passwordCntrlr.text.trim()
    };
    final response = await ApiServices.postMethod(
        url: url,
        data: body,
        context: context,
        function: userLoginModelFromJson);
    if (response is Success) {
      log("11111111");
      final data = await setUserData(response.response as UserLoginModel);
      final accessToken = data!.token;
      final userId = data.result.id;
      final userName = data.result.username;
      final userEmail = data.result.email;

      snakBarWiget(context: context, title: "Login Success", clr: kGreen);
      isLoading = false;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const MyHomePage(),
        ),
        (route) => false,
      );

      setLoginStatus(
          accessToken: accessToken,
          userId: userId,
          userName: userName,
          userEmail: userEmail);
    }
    if (response is Failures) {
      Error loginError =
          Error(code: response.code, message: response.responseMsg);
      setLoginError(loginError, context);
      log("failed");
    }
    isLoading = false;
    clearController();
  }

  // save the value of access token and make sure the user already login or not
  // and also sacing user id
  setLoginStatus({
    required String accessToken,
    required String userId,
    required String userName,
    required String userEmail,
  }) async {
    final status = await SharedPreferences.getInstance();
    await status.setBool("isLoggedIn", true);
    await status.setString("ACCESS_TOKEN", accessToken);
    await status.setString("USER_ID", userId);
    await status.setString("USER_NAME", userName);
    await status.setString("USER_EMAIL", userEmail);
  }

  getUserDetails() async {
    final pref = await SharedPreferences.getInstance();
    final name = pref.getString("USER_NAME");
    final email = pref.getString("USER_EMAIL");
    getUserName(name);
    getUserEmail(email);
  }

  void clearController() {
    emailController.clear();
    passwordCntrlr.clear();
  }

  setLoginError(Error? error, context) async {
    _loginError = error;
    return errorResponses(loginError!, context);
  }

  errorResponses(Error loginError, BuildContext context) {
    final statusCode = loginError.code;
    if (statusCode == 401 || statusCode == 500) {
      log("snackbar: Invalid username or password");
      return snakBarWiget(
          context: context, title: "Invalid Username or password", clr: kred);
    }
    return snakBarWiget(
        context: context, title: "No internet connection", clr: kred);
  }
}

class Error {
  int? code;
  Object? message;
  Error({this.code, this.message});
}
