import 'dart:convert';
import 'dart:developer';
import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/controller/core/strings.dart';
import 'package:nexonev/controller/providers/authentication/login.dart';
import 'package:nexonev/presentation/screens/mainscreen/main_screen.dart';
import 'package:nexonev/presentation/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApiService {
  static Future getLoginStatuss(context) async {
    final provider = Provider.of<LoginProvider>(context, listen: false);
    final String url = Urls.baseUrl + Urls.login;
    Map<String, dynamic> bodys = {
      "email": provider.emailController.text.trim(),
      "password": provider.passwordCntrlr.text.trim()
    };
    try {
      final response = await http.post(Uri.parse(url), body: bodys);
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        log("success");

        if (data['status'] == 'success') {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ),
            (route) => false,
          );
          snackBarWidget(context: context, title: "Login Success", clr: kGreen);
          final result = data['result'];
          await loginStatus(
              accessToken: data['token'],
              userName: result['username'],
              id: result['_id'],
              userEmail: result['email']);
        } else {
          log(data['status']);
          snackBarWidget(context: context, title: data['message'], clr: kred);
        }
      } else {
        log("${response.statusCode}");
        snackBarWidget(context: context, title: data['message'], clr: kred);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> loginStatus(
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
