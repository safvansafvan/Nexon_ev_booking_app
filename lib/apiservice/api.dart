import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:bookingapp/apiservice/status.dart';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/model/authentication/signup.dart';
import 'package:bookingapp/presentation/home/home.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  // POST METHOD
  static Future<Object> postMethod({
    required String url,
    required BuildContext context,
    Function? function,
    Map<String, String>? headers,
    Map? data,
  }) async {
    log(data.toString(), name: "alsdkfjalsdkfjalsdkfj");
    try {
      final response =
          await http.post(Uri.parse(url), body: data, headers: headers);
      log("+++++++++++${response.statusCode}++++++++++");
      log("apiService${response.body.toString()}");
      if (response.statusCode == 201 || response.statusCode == 200) {
        return Success(
            response: function == null ? null : function(response.body));
      }
      return Failures(
          code: response.statusCode, errrorResponse: "Invalid Response");
    } on HttpException {
      return Failures(code: 101, errrorResponse: "No Internet");
    } on FormatException {
      return Failures(code: 102, errrorResponse: "Invalid Format");
    } on SocketException catch (e) {
      log(e.toString());
      return Failures(code: 101, errrorResponse: "No Internet");
    } on TimeoutException {
      return Failures(code: 104, errrorResponse: "Time Out");
    } catch (e) {
      log(e.toString());
      return Failures(code: 500, errrorResponse: "Unknown error");
    }
  }

  // GET METHOD
  static Future<Object> getMEthod({
    required String url,
    required Function function,
    Map<String, String>? headers,
  }) async {
    try {
      log("get function:22");
      final response = await http.get(Uri.parse(url), headers: headers);

      log("get function:33");

      log("******${response.statusCode}******");
      // log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("success");
        return Success(response: function(response.body));
      }
      log("failures");
      return Failures(
          code: response.statusCode, responseMsg: "Invalid response");
    } on HttpException {
      return Failures(code: 101, errrorResponse: "No Internet");
    } on FormatException {
      log('thissss error');
      return Failures(code: 102, errrorResponse: "Invalid Format");
    } on SocketException catch (e) {
      log(e.toString());
      return Failures(code: 101, errrorResponse: "No Internet");
    } on TimeoutException {
      return Failures(code: 104, errrorResponse: "Time Out");
    } catch (e) {
      log(e.toString());
      return Failures(code: 500, errrorResponse: "UNKnown error");
    }
  }

  //post methord for otpVerify and signup user
  static void otpPostMethod(
      {required String url,
      required BuildContext context,
      Function? function,
      Map<String, String>? headers,
      Map? data,
      String? otp}) async {
    try {
      final response =
          await http.post(Uri.parse(url), body: data, headers: headers);
      OtpVerificationAndSignUpModel otpVerificationAndSignUpMode =
          OtpVerificationAndSignUpModel.fromJson(jsonDecode(response.body));
      log(otpVerificationAndSignUpMode.status.toString(),
          name: "statusssssssss");
      String status = otpVerificationAndSignUpMode.status.toString();
      if (status == "success") {
        // ignore: use_build_context_synchronously
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyHomePage(),
            ));
      } else if (status == "failed") {
        log("status is failed from otp ");
        // ignore: use_build_context_synchronously
        snakBarWiget(context: context, title: "Status Wrong", clr: kred);
      } else {
        log("response not success or fail");
      }
    } catch (e) {
      log(e.toString(), name: "error loggggggggggggggggggg");
      snakBarWiget(context: context, title: "Invalid Otp", clr: kred);

      // return Failures(code: 500, errrorResponse: "Unknown error");
    }
    return null;
  }
}
