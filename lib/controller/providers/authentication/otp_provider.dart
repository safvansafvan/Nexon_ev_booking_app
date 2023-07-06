import 'package:bookingapp/apiservice/otp_service.dart';

import 'package:flutter/material.dart';

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

  bool isLoading = false;

  clearController() {
    otpNumone.clear();
    otpNumTwo.clear();
    otpNumThree.clear();
    otpNumFour.clear();
  }

  signUpButtonClick(context) async {
    isLoading = true;
    await OtpService.getOtpStatus(context);
    isLoading = false;
    notifyListeners();
  }
}
