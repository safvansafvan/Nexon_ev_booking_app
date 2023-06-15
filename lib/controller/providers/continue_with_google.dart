import 'dart:developer';
import 'package:bookingapp/apiservice/api.dart';
import 'package:bookingapp/apiservice/status.dart';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/model/authentication/continue_with_google.dart';
import 'package:bookingapp/presentation/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../presentation/widget/snack_bar.dart';

class ContinueWithGoogleProvider with ChangeNotifier {
  // GoogleSignIn? _googleSignIn;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  ContinueWithGoogleModel? _userData;
  ContinueWithGoogleModel? get userData => _userData;

  Future<ContinueWithGoogleModel?> setUserData(
      ContinueWithGoogleModel userData) async {
    _userData = userData;
    return _userData;
  }

  void continueWithGoogleButtonClick(context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: ['email'],
      signInOption: SignInOption.standard,
    );
    if (googleSignIn.currentUser == null) {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final String email = googleUser.email;
        final String username = googleUser.displayName ?? "Unknown Name";
        continueWithGoogle(context, email, username);
      }
    } else {
      await googleSignIn.signOut();
      continueWithGoogleButtonClick(context);
    }
    notifyListeners();
  }

  Future<void> continueWithGoogle(context, email, username) async {
    // final GoogleSignInAuthentication googleAuth =
    //     await googleUser!.authentication;

    final url = Urls.baseUrl + Urls.continueWithGoogle;
    Map<String, dynamic> body = {"email": email, "username": username};
    final response =
        await ApiServices.postMethod(url: url, context: context, data: body);
    if (response is Success) {
      log("success");
      log("$response");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyHomePage(),
        ),
      );
      snakBarWiget(context: context, title: "Login Success", clr: kGreen);
    }
    if (response is Failures) {
      log("failed");
      log("$response");
      snakBarWiget(context: context, title: "Login Failed", clr: kred);
    }
    notifyListeners();
  }
}

setLoginStatus({
  required String accessToken,
  required String userId,
  required String userName,
  required String userEmail,
}) async {
  final status = await SharedPreferences.getInstance();
  await status.setBool("isLoggedIn", true);
  await status.setString("ACCESS_TOKEN", accessToken);
  await status.setString("USER_ID", userId);
  await status.setString("USER_NAME", userName);
  await status.setString("USER_EMAIL", userEmail);
}
