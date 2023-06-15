import 'dart:developer';
import 'package:bookingapp/apiservice/api.dart';
import 'package:bookingapp/apiservice/status.dart';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/model/authentication/otp.dart';
import 'package:bookingapp/presentation/authentication/otp_verify.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../presentation/widget/snack_bar.dart';
import 'otpverify_signup.dart';

class OtpProvider extends ChangeNotifier {
  TextEditingController otpNumone = TextEditingController();
  TextEditingController otpNumTwo = TextEditingController();
  TextEditingController otpNumThree = TextEditingController();
  TextEditingController otpNumFour = TextEditingController();

  GlobalKey<FormState> formKey3 = GlobalKey<FormState>();

  otp() {
    String joinedOtp =
        otpNumone.text + otpNumTwo.text + otpNumThree.text + otpNumFour.text;
    return joinedOtp;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isOtpLoading = false;
  bool get isOtpLoading => _isOtpLoading;

  setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  setOtpLoading(bool isOtpLoading) {
    _isOtpLoading = isOtpLoading;
    notifyListeners();
  }

  OtpError? _otpError;
  OtpError? get otpError => _otpError;
  setOtpError(OtpError otpError, context) {
    _otpError = otpError;
    return errorResponseOtp(_otpError!, context);
  }

  getOtpStatus(context) async {
    final navigator = Navigator.of(context);
    setLoading(true);
    String url = Urls.baseUrl + Urls.otp;
    final response = await ApiServices.postMethod(
        url: url,
        data: otpDataBody(context),
        context: context,
        function: userOtpModeFromJson);

    if (response is Success) {
      log("success");
      navigator.push(
        MaterialPageRoute(
          builder: (context) => const OtpScreen(),
        ),
      );
    }
    if (response is Failures) {
      log("${response.code}");
      log("failed");
      await setLoading(false);
      OtpError otpError =
          OtpError(code: response.code, message: response.errrorResponse);
      await setOtpError(otpError, context);
    }
    setLoading(false);
  }

  clearController() {
    otpNumone.clear();
    otpNumTwo.clear();
    otpNumThree.clear();
    otpNumFour.clear();
  }

  errorResponseOtp(OtpError otpError, BuildContext context) {
    final statuscode = otpError.code;
    if (statuscode == 400 || statuscode == 401) {
      return snakBarWiget(context: context, title: "Invalid Otp", clr: kred);
    }
    return snakBarWiget(context: context, title: "No Internet", clr: kred);
  }

  signUpButtonClick(context) async {
    await getOtpStatus(context);
    Provider.of<OtpVerificationAndSignupProvider>(context, listen: false)
        .clearController();
  }

  Map<String, dynamic> otpDataBody(context) {
    final body = UserOtpMode(
        email: Provider.of<OtpVerificationAndSignupProvider>(context,
                listen: false)
            .emailController
            .text
            .trim(),
        username: Provider.of<OtpVerificationAndSignupProvider>(context,
                listen: false)
            .emailController
            .text
            .trim());
    return body.toJson();
  }
}

class OtpError {
  int? code;
  Object? message;
  OtpError({this.code, this.message});
}
