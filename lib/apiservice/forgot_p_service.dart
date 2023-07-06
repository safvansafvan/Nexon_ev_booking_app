import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/controller/providers/authentication/forgot_password.dart';
import 'package:bookingapp/presentation/authentication/forgot_password/new_password.dart';
import 'package:bookingapp/presentation/authentication/login.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ForgotPasswordService {
  static Future getForgotPasswordStatus(context) async {
    final provider =
        Provider.of<ForgotPasswordProvider>(context, listen: false);
    final String url = Urls.baseUrl + Urls.forgotPassword;
    Map<String, String> body = {"email": provider.emailController.text.trim()};
    final response = await http.post(Uri.parse(url), body: body);
    try {
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (data['status'] == 'success') {
          log("success", name: "forgot");
          log("$response", name: "GEtFotgot");
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const NewPasswordScreen(),
            ),
          );
          snakBarWiget(context: context, title: "Otp Sented", clr: kGreen);
        } else {
          log('failed');
          snakBarWiget(context: context, title: data['message'], clr: kred);
        }
      } else {
        log('failed');
        snakBarWiget(context: context, title: data['message'], clr: kred);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future setNewPasswordStatus(
      context, ForgotPasswordProvider value) async {
    final joinedOtp = value.otpController1.text +
        value.otpController2.text +
        value.otpController3.text +
        value.otpController4.text;
    final String url = Urls.baseUrl + Urls.verifyAndForgot;
    Map<String, dynamic> body = {
      "email": value.emailController.text.trim(),
      "password": value.passwordController.text.trim(),
      "otp": joinedOtp
    };
    final response = await http.post(Uri.parse(url), body: body);
    final data = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        if (data['status'] == 'success') {
          log("success", name: "setnewpassword");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
          snakBarWiget(
              context: context, title: "Password Changed", clr: kGreen);
        } else {
          log(data['message']);
          snakBarWiget(context: context, title: data['message'], clr: kred);
        }
      } else {
        log("failed");
        snakBarWiget(context: context, title: data['message'], clr: kred);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
