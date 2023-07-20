import 'dart:developer';

import 'package:bookingapp/controller/core/core.dart';
import 'package:bookingapp/controller/core/strings.dart';
import 'package:bookingapp/controller/providers/authentication/otpverify_signup.dart';
import 'package:bookingapp/model/authentication/otp.dart';
import 'package:bookingapp/presentation/screens/authentication/otp_verify.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';
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
        snakBarWiget(context: context, title: "Error Occured", clr: kred);
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
