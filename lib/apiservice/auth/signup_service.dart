import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/controller/core/core.dart';
import 'package:bookingapp/controller/providers/authentication/otp_provider.dart';
import 'package:bookingapp/controller/providers/authentication/otpverify_signup.dart';
import 'package:bookingapp/model/authentication/signup.dart';
import 'package:bookingapp/presentation/screens/mainscreen/main_screen.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/core/strings.dart';

class SignupService {
  static Future signUpAndOtpVerifyStatus(context) async {
    final navigator = Navigator.of(context);
    final provider =
        Provider.of<OtpVerificationAndSignupProvider>(context, listen: false);
    String url = Urls.baseUrl + Urls.otpVerificationAndSignup;
    try {
      log(url.toString(), name: "url");
      final response =
          await http.post(Uri.parse(url), body: bodyData(provider, context));
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (data['status'] == 'success') {
          navigator.pushReplacement(
            MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ),
          );
          snackBarWidget(
              context: context, title: "SignUp Success", clr: kGreen);
          final result = data['result'];
          setLoginStatus(
              accessToken: data['token'],
              userName: result['username'],
              id: result['_id'],
              userEmail: result['email']);
        } else {
          log(data['status']);
          snackBarWidget(context: context, title: data['status'], clr: kred);
        }
      } else {
        log("${response.statusCode}");
        final msg = data['message'];
        snackBarWidget(context: context, title: msg, clr: kred);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Map<String, dynamic> bodyData(
      OtpVerificationAndSignupProvider value, context) {
    final data = SignupModel(
        email: value.emailController.text.trim(),
        password: value.passwordController.text.trim(),
        username: value.usernameController.text.trim(),
        otp: Provider.of<OtpProvider>(context, listen: false).otp(),
        phone: value.phoneController.text.trim());
    return data.toJson();
  }

  static setLoginStatus(
      {required String accessToken,
      required String userName,
      required String id,
      required String userEmail}) async {
    final status = await SharedPreferences.getInstance();
    await status.setString("ACCESS_TOKEN", accessToken);
    await status.setString("Id", id);
    await status.setString("USER_NAME", userName);
    await status.setString("USER_EMAIL", userEmail);
  }
}
