import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/controller/providers/authentication/forgot_password.dart';
import 'package:bookingapp/presentation/screens/authentication/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../widget/otp_text_field.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  @override
  void dispose() {
    Provider.of<ForgotPasswordProvider>(context, listen: false)
        .key6
        .currentState!
        .dispose();
    super.dispose();
  }

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
          return value.isLoadingotp
              ? Center(
                  child: Lottie.asset("assets/ui-loader.json"),
                )
              : Form(
                  key: value.key6,
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
                      commonHeight,
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
                          if (value.key6.currentState!.validate()) {
                            await value.verifyButtonClick(context);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                              color: kBlack, borderRadius: radiusTen),
                          child: Center(
                            child: Text(
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
