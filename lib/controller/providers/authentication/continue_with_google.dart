import 'dart:developer';
import 'package:bookingapp/apiservice/api.dart';
import 'package:bookingapp/apiservice/status.dart';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/model/authentication/continue_with_google.dart';
import 'package:bookingapp/presentation/mainscreen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../presentation/widget/snack_bar.dart';

class ContinueWithGoogleProvider extends ChangeNotifier {
  // GoogleSignIn? _googleSignIn;

  bool isLoading = false;

  ContinueWithGoogleModel? _userData;
  ContinueWithGoogleModel? get userData => _userData;

  Future<ContinueWithGoogleModel?> setUserData(
      ContinueWithGoogleModel userData) async {
    _userData = userData;
    return _userData;
  }

  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ['email'],
    signInOption: SignInOption.standard,
  );
  continueWithGoogleButtonClick(context) async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final String email = googleUser.email;
      final String username = googleUser.displayName ?? "Unknown Name";
      await continueWithGoogle(context, email, username);
      notifyListeners();
    }
    notifyListeners();
  }

  logout() async {
    await googleSignIn.signOut();
  }

  Future<void> continueWithGoogle(context, email, username) async {
    isLoading = true;
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
          builder: (context) => const MainScreen(),
        ),
      );
      snakBarWiget(context: context, title: "Login Success", clr: kGreen);
      isLoading = false;
      final data =
          await setUserData(response.response as ContinueWithGoogleModel);
      final accessToken = data!.token;
      final userId = data.result!.id;
      final userName = data.result!.username;
      final userEmail = data.result?.email;
      setLoginStatus(
          accessToken: accessToken!,
          userId: userId!,
          userName: userName!,
          userEmail: userEmail!);
    }

    if (response is Failures) {
      isLoading = false;
      log("failed");
      log("$response");
      snakBarWiget(context: context, title: "Login Failed", clr: kred);
    }
    isLoading = false;
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
}
