import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/controller/providers/authentication/forgot_password.dart';
import 'package:bookingapp/presentation/screens/authentication/widget/image_widget.dart';
import 'package:bookingapp/presentation/screens/authentication/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

final key5 = GlobalKey<FormState>();

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final forgotProvider = context.watch<ForgotPasswordProvider>();

    return Scaffold(
      body: SafeArea(
        child: Consumer<ForgotPasswordProvider>(builder: (context, value, _) {
          return value.isLoadingEmailSend
              ? Center(
                  child: Lottie.asset("assets/ui-loader.json"),
                )
              : Form(
                  key: key5,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12, right: 12, top: 50, bottom: 12),
                    child: ListView(children: [
                      IconButton(
                        alignment: Alignment.topLeft,
                        tooltip: "Back",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                      Text(
                        "Forgot Password",
                        style: textStyleFuc(
                            weight: FontWeight.w900, color: kBlack, size: 25),
                      ),
                      kHeightFive,
                      Text(
                        "Provid your email and We will send OTP ",
                        style: textStyleFuc(
                            weight: FontWeight.w400, color: kBlack, size: 14),
                      ),
                      commonHeight,
                      TextFormLogin(
                          prefixIcon: const Icon(Icons.email_outlined),
                          controller: forgotProvider.emailController,
                          hintText: "Email",
                          isEmail: true,
                          keyType: TextInputType.emailAddress,
                          size: screenSize),
                      commonHeight,
                      TextButton(
                        onPressed: () {
                          if (key5.currentState!.validate()) {
                            forgotProvider.inForgotEmailVerifyClick(context);
                          }
                        },
                        child: const Text("Verify"),
                      ),
                      const SizedBox(
                        height: 200,
                      ),
                      const ImageWidget(image: "assets/nexonEvB.png"),
                    ]),
                  ),
                );
        }),
      ),
    );
  }
}
