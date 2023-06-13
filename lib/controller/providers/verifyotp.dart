import 'dart:developer';
import 'package:bookingapp/apiservice/api.dart';
import 'package:bookingapp/apiservice/status.dart';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/model/authentication/otp_verification_model.dart';
import 'package:bookingapp/presentation/home/home.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';
import 'package:flutter/material.dart';

class VerifyOtpProvider extends ChangeNotifier {
  TextEditingController otpNumone = TextEditingController();
  TextEditingController otpNumTwo = TextEditingController();
  TextEditingController otpNumThree = TextEditingController();
  TextEditingController otpNumFour = TextEditingController();
  // GlobalKey<FormState> globelKey3 = GlobalKey<FormState>();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  VerifyError? _verifyError;
  VerifyError? get verifyError => _verifyError;

  setVerifyError(VerifyError verifyError, context) {
    _verifyError = verifyError;
    return errorResponseVerifyOtp(_verifyError!, context);
  }

  getOtpVerifyStatus(context) async {
    final navigator = Navigator.of(context);
    setLoading(true);
    String url = Urls.baseUrl + Urls.verify;
    final response = await ApiServices.postMethod(
        url: url,
        context: context,
        data: otpBody(context),
        function: userOtpVerifyModelFromJson);
    if (response is Success) {
      log("Success");
      log("${response.code}");
      navigator.pushReplacement(
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ),
      );
    }
    if (response is Failures) {
      log("failed");
      log("${response.code}");
      await setLoading(false);
      VerifyError verifyError =
          VerifyError(code: response.code, message: response.errrorResponse);
      await setVerifyError(verifyError, context);
    }
    setLoading(false);
  }

  Map<String, dynamic> otpBody(context) {
    String joinedOtp =
        otpNumone.text + otpNumTwo.text + otpNumThree.text + otpNumFour.text;
    log("joinedOtp$joinedOtp");
    final body = UserOtpVerifyModel(otp: joinedOtp);
    return body.toJson();
  }

  getOtpVerifyButtonClick(context) async {
    await getOtpVerifyStatus(context);
    // clearcontroller();
  }

  errorResponseVerifyOtp(VerifyError verifyError, BuildContext context) {
    final statuscode = verifyError.code;
    if (statuscode == 400 || statuscode == 401) {
      return snakBarWiget(context: context, title: "Invalid Otp", clr: kred);
    }
    return snakBarWiget(context: context, title: "NO Internet", clr: kred);
  }

  clearcontroller() {
    otpNumone.clear();
    otpNumTwo.clear();
    otpNumThree.clear();
    otpNumFour.clear();
  }
}

class VerifyError {
  int? code;
  Object? message;
  VerifyError({this.code, this.message});
}
