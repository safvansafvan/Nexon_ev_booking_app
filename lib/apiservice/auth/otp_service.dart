import 'dart:developer';
import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/controller/core/strings.dart';
import 'package:nexonev/controller/providers/authentication/otpverify_signup.dart';
import 'package:nexonev/model/authentication/otp.dart';
import 'package:nexonev/presentation/screens/authentication/register/otp/otp_verify.dart';
import 'package:nexonev/presentation/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class OtpService {
  static Future getOtpStatus(context) async {
    final navigator = Navigator.of(context);
    final String url = Urls.baseUrl + Urls.otp;
    try {
      final response =
          await http.post(Uri.parse(url), body: otpDataBody(context));
      if (response.statusCode == 200) {
        log("success");
        return navigator.push(
          MaterialPageRoute(
            builder: (context) => const OtpScreen(),
          ),
        );
      } else {
        log("${response.statusCode}");
        log("failed");
        snackBarWidget(context: context, title: "Error Occured", clr: kred);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Map<String, dynamic> otpDataBody(context) {
    final body = UserOtpMode(
        email: Provider.of<OtpVerificationAndSignupProvider>(context,
                listen: false)
            .emailController
            .text
            .trim(),
        username: Provider.of<OtpVerificationAndSignupProvider>(context,
                listen: false)
            .emailController
            .text
            .trim());
    return body.toJson();
  }
}
