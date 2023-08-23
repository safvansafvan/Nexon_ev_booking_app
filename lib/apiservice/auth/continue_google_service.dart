import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/controller/core/strings.dart';
import 'package:bookingapp/presentation/screens/mainscreen/main_screen.dart';
import 'package:bookingapp/presentation/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future getGoogleLoginStatus(context, email, username) async {
  final String url = Urls.baseUrl + Urls.continueWithGoogle;
  Map<String, dynamic> bodyData = {
    "email": email,
    "username": username,
    "provider": "google"
  };
  final response = await http.post(
    Uri.parse(url),
    body: bodyData,
    headers: {'Content-Type': 'application/json'},
  );
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
      snackBarWidget(context: context, title: "Login Success", clr: kGreen);
      final data = jsonDecode(response.body);
      final result = data['result'];
      await setLoginStatus(
          accessToken: data['token'],
          id: result['_id'],
          userName: result['username'],
          userEmail: result['email']);
    } else {
      log("failed");
      snackBarWidget(context: context, title: "Login failed", clr: kred);
    }
  } catch (e) {
    log(e.toString());
  }
}

Future<void> setLoginStatus(
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
