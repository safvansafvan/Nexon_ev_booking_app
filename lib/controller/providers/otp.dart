// import 'dart:developer';
// import 'package:bookingapp/apiservice/status.dart';
// import 'package:bookingapp/model/authentication/otp.dart';
// import 'package:bookingapp/presentation/login/otp_verify.dart';
// import 'package:flutter/material.dart';
// import '../../apiservice/api.dart';
// import '../../presentation/widget/snack_bar.dart';
// import '../const/const.dart';
// import '../const/string.dart';

// class OtpProvider extends ChangeNotifier {
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   bool _isLoading = false;
//   bool get isLoading => _isLoading;
//   setLoading(bool isLoading) async {
//     _isLoading = isLoading;
//     notifyListeners();
//   }

//   OtpError? _otpError;
//   OtpError? get otpError => _otpError;
//   setOtpError(OtpError otpError, context) {
//     _otpError = otpError;
//     return errorResponseOtp(_otpError!, context);
//   }

//   getOtpStatus(context) async {
//     final navigator = Navigator.of(context);
//     setLoading(true);
//     String url = Urls.baseUrl + Urls.otp;
//     final response = await ApiServices.postMethod(
//         url: url,
//         data: otpDataBody(context),
//         context: context,
//         function: userOtpModeFromJson);

//     if (response is Success) {
//       log("success");
//       navigator.push(
//         MaterialPageRoute(
//           builder: (context) => const OtpScreen(),
//         ),
//       );
//     }
//     if (response is Failures) {
//       log("${response.code}");
//       log("failed");
//       await setLoading(false);
//       OtpError otpError =
//           OtpError(code: response.code, message: response.errrorResponse);
//       await setOtpError(otpError, context);
//     }
//     setLoading(false);
//   }

//   getotpButtonClick(context) async {
//     await getOtpStatus(context);
//     clearController();
//   }

//   Map<String, dynamic> otpDataBody(context) {
//     final body = UserOtpMode(
//         email: emailController.text.trim(),
//         username: usernameController.text.trim());
//     return body.toJson();
//   }

//   clearController() {
//     usernameController.clear();
//     passwordController.clear();
//     emailController.clear();
//     phoneController.clear();
//   }

//   errorResponseOtp(OtpError otpError, BuildContext context) {
//     final statuscode = otpError.code;
//     if (statuscode == 400 || statuscode == 401) {
//       return snakBarWiget(context: context, title: "Invalid Otp", clr: kred);
//     }
//     return snakBarWiget(context: context, title: "No Internet", clr: kred);
//   }
// }

// class OtpError {
//   int? code;
//   Object? message;
//   OtpError({this.code, this.message});
// }
