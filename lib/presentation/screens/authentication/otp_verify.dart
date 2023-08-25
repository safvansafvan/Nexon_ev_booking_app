import 'package:bookingapp/controller/providers/authentication/otp_provider.dart';
import 'package:bookingapp/presentation/screens/authentication/widget/otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../../controller/core/constant.dart';
import '../../../controller/providers/authentication/otpverify_signup.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final otpProvider = context.watch<OtpProvider>();
    return Scaffold(
      backgroundColor: loginBackground,
      appBar: AppBar(
        backgroundColor: loginBackground,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
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
                              CustomHeight.heightTen(context),
                              const Text(
                                  "Enter the verification code. we just sent on\nemail address"),
                            ],
                          ),
                        ),
                        CustomHeight.commonHeightz(context),
                        Form(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              OtpTextField(controller: otpProvider.otpNumone),
                              OtpTextField(controller: otpProvider.otpNumTwo),
                              OtpTextField(controller: otpProvider.otpNumThree),
                              OtpTextField(controller: otpProvider.otpNumFour),
                            ],
                          ),
                        ),
                        CustomHeight.commonHeightz(context),
                        InkWell(
                          onTap: () async {
                            if (otpProvider.formKey3.currentState!.validate()) {
                              await value
                                  .getOtpVerificationButtonClick(context);
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                                color: kBlack, borderRadius: radiusTen),
                            child: Center(
                              child: Text(
                                'Login',
                                style: textStyleFuc(
                                    weight: FontWeight.bold,
                                    color: kwhite,
                                    size: 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
          }),
        ),
      ),
    );
  }
}
