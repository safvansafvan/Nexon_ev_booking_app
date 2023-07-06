import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/presentation/mainscreen/main_screen.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future getGoogleLoginStatus(context, email, username) async {
  final String url = Urls.baseUrl + Urls.continueWithGoogle;
  Map<String, dynamic> bodyData = {"email": email, "username": username};
  final response = await http.post(Uri.parse(url), body: bodyData);
  log("called $email");
  try {
    if (response.statusCode == 200) {
      log("success${response.body}", name: "continue google");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
      );
      snakBarWiget(context: context, title: "Login Success", clr: kGreen);
      final data = jsonDecode(response.body);
      final result = data['result'];
      await setLoginStatus(
          accessToken: data['token'],
          userName: result['username'],
          userEmail: result['email']);
    } else {
      log("failed");
      snakBarWiget(context: context, title: "Login failed", clr: kred);
    }
  } catch (e) {
    log(e.toString());
    snakBarWiget(context: context, title: e.toString(), clr: kred);
  }
}

setLoginStatus(
    {required String accessToken,
    required String userName,
    required String userEmail}) async {
  final status = await SharedPreferences.getInstance();
  await status.setString("ACCESS_TOKEN", accessToken);
  await status.setString("USER_NAME", userName);
  await status.setString("USER_EMAIL", userEmail);
}
