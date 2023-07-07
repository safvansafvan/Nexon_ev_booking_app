import 'dart:convert';
import 'dart:developer';

import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/controller/providers/authentication/login.dart';
import 'package:bookingapp/presentation/mainscreen/main_screen.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';
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
          snakBarWiget(context: context, title: "Login Success", clr: kGreen);
          final result = data['result'];
          await loginStatus(
              accessToken: data['token'],
              userName: result['username'],
              id: result['_id'],
              userEmail: result['email']);
          log("$result");
          log(data['token']);
          log(result['_id']);
          log(result['username']);
          log(result['email']);
        } else {
          log(data['status']);
          snakBarWiget(context: context, title: data['message'], clr: kred);
        }
      } else {
        log("${response.statusCode}");
        snakBarWiget(context: context, title: data['message'], clr: kred);
      }
    } catch (e) {
      log(e.toString());
      snakBarWiget(context: context, title: e.toString(), clr: kred);
    }
  }

  static loginStatus(
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
