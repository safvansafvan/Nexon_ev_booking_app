import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/controller/providers/authentication/otp_provider.dart';
import 'package:bookingapp/model/authentication/signup.dart';
import 'package:bookingapp/presentation/home.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class OtpVerificationAndSignupProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  bool isLoading = false;

  OtpVerificationAndSignUpModel? _userData;
  OtpVerificationAndSignUpModel? get userData => _userData;
  Future<OtpVerificationAndSignUpModel?> setUserData(
      OtpVerificationAndSignUpModel userData) async {
    _userData = userData;
    return _userData;
  }

  getOtpVerificationButtonClick(context) async {
    await getOtpVerificationAndSignupStatus(context);
    notifyListeners();
  }

  getOtpVerificationAndSignupStatus(context) async {
    final otp = Provider.of<OtpProvider>(context, listen: false).otp();
    String url = Urls.baseUrl + Urls.otpVerificationAndSignup;
    log(url.toString(), name: "error");
    Map<String, dynamic> body = {
      "username": usernameController.text.trim(),
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
      "phone": phoneController.text.trim(),
      "otp": otp
    };

    otpPostMethod(url: url, context: context, data: body);
  }

  //post methord for otpVerify and signup user
  otpPostMethod({
    required String url,
    required BuildContext context,
    Function? function,
    Map<String, String>? headers,
    Map? data,
  }) async {
    final navigator = Navigator.of(context);
    try {
      isLoading = true;
      final response =
          await http.post(Uri.parse(url), body: data, headers: headers);
      OtpVerificationAndSignUpModel otpVerificationAndSignUpMode =
          OtpVerificationAndSignUpModel.fromJson(jsonDecode(response.body));
      log(otpVerificationAndSignUpMode.status.toString(),
          name: "statusssssssss");
      String status = otpVerificationAndSignUpMode.status.toString();
      if (status == "success") {
        navigator.pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MyHomePage(),
          ),
        );
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
      isLoading = false;
    }
    isLoading = false;
  }
}

class SignupError {
  int? code;
  Object? message;

  SignupError({this.code, this.message});
}


// final data = await setUserData(
//             response as OtpVerificationAndSignUpModel);
//         final accessToken = data!.token;
//         final userId = data.result!.id;
//         final userName = data.result!.username;
//         final userEmail = data.result!.email;
//    setLoginStatus(
//             accessToken: accessToken!,
//             userId: userId,
//             userName: userName,
//             userEmail: userEmail);


// save the value of access token and make sure the user already login or not
  // // and also sacing user id
  // setLoginStatus({
  //   required String accessToken,
  //   required String userId,
  //   required String userName,
  //   required String userEmail,
  // }) async {
  //   final status = await SharedPreferences.getInstance();
  //   await status.setBool("isLoggedIn", true);
  //   await status.setString("ACCESS_TOKEN", accessToken);
  //   await status.setString("USER_ID", userId);
  //   await status.setString("USER_NAME", userName);
  //   await status.setString("USER_EMAIL", userEmail);
  // }
