import 'dart:async';

import 'dart:developer';
import 'dart:io';
import 'package:bookingapp/apiservice/status.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  // POST METHOD
  static Future<Object> postMethod({
    required String url,
    required BuildContext context,
    Function? function,
    Map<String, String>? headers,
    required Map<String, dynamic> data,
  }) async {
    log(data.toString(), name: "send");
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
    Function? function,
    Map<String, String>? headers,
  }) async {
    try {
      log("get function:22");
      final response = await http.get(Uri.parse(url), headers: headers);

      log("******${response.statusCode}******");
      // log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("success");
        return Success(response: function == null ? null : (response.body));
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

  // //post methord for otpVerify and signup user
  // static void otpPostMethod({
  //   required String url,
  //   required BuildContext context,
  //   Function? function,
  //   Map<String, String>? headers,
  //   Map? data,
  // }) async {
  //   final navigator = Navigator.of(context);
  //   try {
  //     final response =
  //         await http.post(Uri.parse(url), body: data, headers: headers);
  //     OtpVerificationAndSignUpModel otpVerificationAndSignUpMode =
  //         OtpVerificationAndSignUpModel.fromJson(jsonDecode(response.body));
  //     log(otpVerificationAndSignUpMode.status.toString(),
  //         name: "statusssssssss");
  //     String status = otpVerificationAndSignUpMode.status.toString();
  //     if (status == "success") {
  //       navigator.pushReplacement(
  //         MaterialPageRoute(
  //           builder: (context) => const MyHomePage(),
  //         ),
  //       );
  //     } else if (status == "failed") {
  //       log("status is failed from otp ");
  //       // ignore: use_build_context_synchronously
  //       snakBarWiget(context: context, title: "Status Wrong", clr: kred);
  //     } else {
  //       log("response not success or fail");
  //     }
  //   } catch (e) {
  //     log(e.toString(), name: "error loggggggggggggggggggg");
  //     snakBarWiget(context: context, title: "Invalid Otp", clr: kred);
  //   }
  //   return null;
  // }
}

// /// checking
// ///
// ///

// final GoogleSignIn _googleSignIn = GoogleSignIn(
//     scopes: ['email'], // Add additional scopes as needed
//     signInOption: SignInOption.standard);
// Future<bool> isGoogleSignInAllowed() async {
//   GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

//   try {
//     // Check if the user is signed in with Google
//     bool isSignedIn = await googleSignIn.isSignedIn();
//     return isSignedIn;
//   } catch (e) {
//     // Handle any errors that occur during the check
//     log('Error checking Google sign-in permission: $e');
//     return false;
//   }
// }

// Future<void> signInWithGoogle(context) async {
//   try {
//     bool googleSignInAllowed = await isGoogleSignInAllowed();
//     // if (googleSignInAllowed) {
//     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser!.authentication;

//     final String email = googleUser.email;
//     final String username = googleUser.displayName ?? '';

//     // Send the data to the backend API
//     final url = Urls.baseUrl + Urls.continueWithGoogle;
//     final response = await http.post(Uri.parse(url), body: {
//       'email': email,
//       'username': username,
//     });
//     log(email);

//     if (response.statusCode == 200) {
//       // Login successful
//       final responseData = jsonDecode(response.body);
//       final token = responseData['token'];
//       log("succcccccc");
//       // Store the token securely
//       final storage = await SharedPreferences.getInstance();
//       await storage.setString('token', token);

//       // Navigate to the desired screen
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (context) => MyHomePage(),
//         ),
//       );
//     } else {
//       // Login failed
//       final errorMessage = jsonDecode(response.body)['message'];
//       log('Login failed: $errorMessage');
//       // Display an error message to the user or handle the failure accordingly
//     }
//     // } else {
//     log("User has not grand persmission to google signin!");
//     // }
//   } catch (error) {
//     log('Error: $error', name: "catch");
//     // Display an error message to the user or handle the failure accordingly
//   }
// }
