import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/controller/providers/authentication/forgot_password.dart';
import 'package:bookingapp/presentation/screens/authentication/widget/image_widget.dart';
import 'package:bookingapp/presentation/screens/authentication/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../widget/otp_text_field.dart';

final key6 = GlobalKey<FormState>();

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final provider = context.watch<ForgotPasswordProvider>();

    return Scaffold(
      body: SafeArea(
        child: Consumer<ForgotPasswordProvider>(builder: (context, value, _) {
          return value.isLoadingotp
              ? Center(
                  child: Lottie.asset("assets/ui-loader.json"),
                )
              : Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 50, bottom: 12),
                  child: Form(
                    key: key6,
                    child: ListView(
                      children: [
                        IconButton(
                          alignment: Alignment.topLeft,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                        commonHeight,
                        Text(
                          "Text Your New Password",
                          style: textStyleFuc(
                              weight: FontWeight.w900, color: kBlack, size: 23),
                        ),
                        commonHeight,
                        Text(
                          ">>>>>>>>>>>>>>>>>>>>>>>>>",
                          style: textStyleFuc(
                              weight: FontWeight.w400, color: kBlack, size: 14),
                        ),
                        commonHeight,
                        TextFormLogin(
                            prefixIcon: const Icon(Icons.password_rounded),
                            controller: provider.passwordController,
                            hintText: "Password",
                            keyType: TextInputType.text,
                            isObs: true,
                            isPassword: true,
                            size: screenSize),
                        commonHeight,
                        kheight30,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OtpTextField(controller: provider.otpController1),
                            OtpTextField(controller: provider.otpController2),
                            OtpTextField(controller: provider.otpController3),
                            OtpTextField(controller: provider.otpController4)
                          ],
                        ),
                        commonHeight,
                        TextButton(
                          onPressed: () async {
                            if (key6.currentState!.validate()) {
                              await provider.verifyButtonClick(context);
                            }
                          },
                          child: const Text("Verify"),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        const ImageWidget(image: "assets/nexon_black_back.png")
                      ],
                    ),
                  ),
                );
        }),
      ),
    );
  }
}
