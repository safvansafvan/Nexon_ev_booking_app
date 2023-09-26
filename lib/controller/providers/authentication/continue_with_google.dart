import 'dart:developer';

import 'package:bookingapp/apiservice/auth/continue_google_service.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ContinueWithGoogleProvider extends ChangeNotifier {
  bool isLoading = false;

  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ['email'],
    signInOption: SignInOption.standard,
  );
  continueWithGoogleButtonClick(context) async {
    log("calledGoogle");
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final String email = googleUser.email;
      final String username = googleUser.displayName ?? "Unknown Name";
      await GoogleSignInService.getGoogleLoginStatus(context, email, username);
      notifyListeners();
    }
  }

  Future logout() async {
    await googleSignIn.signOut();
  }
}
