import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/providers/forgot_password.dart';
import 'package:bookingapp/presentation/authentication/widget/image_widget.dart';
import 'package:bookingapp/presentation/authentication/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final forgotProvider = context.watch<ForgotPasswordProvider>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12, right: 12, top: 50, bottom: 12),
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
              "Provider your email and We will send OTP verification",
              style: textStyleFuc(
                  weight: FontWeight.w400, color: kBlack, size: 14),
            ),
            commonHeight,
            TextFormCommon(
                prefixIcon: const Icon(Icons.email_outlined),
                controller: forgotProvider.emailController,
                hintText: "Email",
                isEmail: true,
                keyType: TextInputType.emailAddress,
                size: screenSize),
            commonHeight,
            TextButton(
              onPressed: () {
                forgotProvider.emailSendButtonClick(context);
              },
              child: const Text("Verify"),
            ),
            const SizedBox(
              height: 200,
            ),
            const ImageWidget(image: "assets/nexonEvB.png"),
          ]),
        ),
      ),
    );
  }
}
