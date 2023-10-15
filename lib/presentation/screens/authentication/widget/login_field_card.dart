import 'package:flutter/material.dart';
import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/controller/providers/authentication/login.dart';
import 'package:nexonev/presentation/screens/authentication/forgot_password/forgot_password.dart';
import 'package:nexonev/presentation/screens/authentication/widget/text_form_field.dart';

class LoginFieldCardWidget extends StatelessWidget {
  const LoginFieldCardWidget(
      {super.key,
      required this.screenSize,
      required this.formKey1,
      required this.value});

  final Size screenSize;
  final GlobalKey<FormState> formKey1;
  final LoginProvider value;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      TextFormLogin(
          controller: value.emailController,
          hintText: "Email",
          keyType: TextInputType.emailAddress,
          isEmail: true,
          size: screenSize,
          prefixIcon: const Icon(Icons.person_outline)),
      CustomHeight.commonHeightz(context),
      TextFormLogin(
        controller: value.passwordCntrlr,
        hintText: "Password",
        keyType: TextInputType.name,
        isObs: true,
        isPassword: true,
        size: screenSize,
        prefixIcon: const Icon(Icons.password_rounded),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ForgotPasswordWidget(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Forgot Password?",
            style: textStyleFuc(
                weight: FontWeight.w500,
                color: const Color.fromARGB(255, 66, 140, 200),
                size: 15),
          ),
        ),
      ),
      CustomHeight.commonHeightz(context),
      InkWell(
        onTap: () async {
          if (formKey1.currentState!.validate()) {
            await value.loginButtonClick(context);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(color: kBlack, borderRadius: radiusTen),
          child: Center(
            child: value.isLoading
                ? const CircularProgressIndicator()
                : Text(
                    'Login',
                    style: textStyleFuc(
                        weight: FontWeight.bold, color: kwhite, size: 16),
                  ),
          ),
        ),
      ),
    ]);
  }
}
