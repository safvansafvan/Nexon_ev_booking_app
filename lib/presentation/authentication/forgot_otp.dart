import 'package:bookingapp/controller/const/const.dart';
import 'package:flutter/material.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(children: [
            Text(
              "Forgot Password",
              style: textStyleFuc(
                  weight: FontWeight.w500, color: kBlack, size: 20),
            )
          ]),
        ),
      ),
    );
  }
}
