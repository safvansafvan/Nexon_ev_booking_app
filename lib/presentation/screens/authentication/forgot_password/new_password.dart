import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/controller/providers/authentication/forgot_password.dart';
import 'package:nexonev/presentation/screens/authentication/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/otp_text_field.dart';

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({super.key});

  final key6 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final provider = context.watch<ForgotPasswordProvider>();

    return Scaffold(
      backgroundColor: loginBackground,
      appBar: AppBar(
        backgroundColor: loginBackground,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SafeArea(
        child: Consumer<ForgotPasswordProvider>(builder: (context, value, _) {
          return Form(
            key: key6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeight.commonHeightz(context),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Text Your New Password",
                    style: textStyleFuc(
                        weight: FontWeight.w900, color: kBlack, size: 23),
                  ),
                ),
                CustomHeight.commonHeightz(context),
                TextFormLogin(
                    prefixIcon: const Icon(Icons.password_rounded),
                    controller: provider.passwordController,
                    hintText: "Password",
                    keyType: TextInputType.text,
                    isObs: true,
                    isPassword: true,
                    size: screenSize),
                CustomHeight.commonHeightz(context),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Verify Your Phone Number",
                    style: textStyleFuc(
                        weight: FontWeight.w900, color: kBlack, size: 23),
                  ),
                ),
                CustomHeight.commonHeightz(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OtpTextField(controller: provider.otpController1),
                    OtpTextField(controller: provider.otpController2),
                    OtpTextField(controller: provider.otpController3),
                    OtpTextField(controller: provider.otpController4)
                  ],
                ),
                CustomHeight.commonHeightz(context),
                InkWell(
                  onTap: () async {
                    if (key6.currentState!.validate()) {
                      await value.verifyButtonClick(context);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration:
                        BoxDecoration(color: kBlack, borderRadius: radiusTen),
                    child: Center(
                      child: value.isOtpVerify
                          ? const CircularProgressIndicator()
                          : Text(
                              'Conform',
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
    );
  }
}
