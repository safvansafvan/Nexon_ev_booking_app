import 'package:bookingapp/controller/providers/authentication/otp_provider.dart';
import 'package:bookingapp/presentation/authentication/widget/image_widget.dart';
import 'package:bookingapp/presentation/widget/otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../controller/const/const.dart';
import '../../controller/providers/authentication/otpverify_signup.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final otpProvider = context.watch<OtpProvider>();
    // final verify = context.watch<OtpVerificationAndSignupProvider>();
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Consumer<OtpVerificationAndSignupProvider>(
              builder: (context, value, _) {
            return value.isLoading
                ? Center(
                    child: LottieBuilder.asset("assets/ui-loader.json"),
                  )
                : Form(
                    key: otpProvider.formKey3,
                    child: ListView(children: [
                      ListTile(
                        leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, top: 50, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "OTP Verification",
                              style: textStyleFuc(
                                  weight: FontWeight.w900,
                                  color: kBlack,
                                  size: 25),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                                "Enter the verification code. we just sent on\nemail address"),
                            const SizedBox(
                              height: 30,
                            ),
                            Form(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  OtpTextField(
                                      controller: otpProvider.otpNumone),
                                  OtpTextField(
                                      controller: otpProvider.otpNumTwo),
                                  OtpTextField(
                                      controller: otpProvider.otpNumThree),
                                  OtpTextField(
                                      controller: otpProvider.otpNumFour),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Container(
                              width: double.infinity,
                              height: screenHeight * 0.07,
                              color: const Color.fromARGB(255, 241, 239, 239),
                              child: OutlinedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius: radiusTen)),
                                ),
                                onPressed: () async {
                                  if (otpProvider.formKey3.currentState!
                                      .validate()) {
                                    await value
                                        .getOtpVerificationButtonClick(context);
                                  }
                                },
                                child: Text(
                                  'Verify',
                                  style: textStyleFuc(
                                      weight: FontWeight.w500,
                                      color: null,
                                      size: 16),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.09,
                            ),
                            const ImageWidget(image: "assets/nexonOt.webp")
                          ],
                        ),
                      ),
                    ]),
                  );
          }),
        ),
      ),
    );
  }
}
