import 'package:flutter/material.dart';
import 'package:nexonev/controller/providers/authentication/otpverify_signup.dart';
import 'package:nexonev/presentation/screens/authentication/widget/text_form_field.dart';
import 'package:provider/provider.dart';
import '../../../../../../controller/core/constant.dart';

class RegisterFieldWidget extends StatelessWidget {
  const RegisterFieldWidget({super.key, required this.screenHeight});

  final Size screenHeight;
  @override
  Widget build(BuildContext context) {
    final value =
        Provider.of<OtpVerificationAndSignupProvider>(context, listen: false);
    return Column(
      children: [
        TextFormLogin(
          controller: value.usernameController,
          hintText: "Username",
          keyType: TextInputType.name,
          isUser: true,
          size: screenHeight,
          prefixIcon: const Icon(
            Icons.person_outline,
          ),
        ),
        CustomHeight.commonHeightz(context),
        TextFormLogin(
          controller: value.emailController,
          hintText: "Email",
          keyType: TextInputType.emailAddress,
          isEmail: true,
          size: screenHeight,
          prefixIcon: const Icon(
            Icons.email_outlined,
          ),
        ),
        CustomHeight.commonHeightz(context),
        TextFormLogin(
          controller: value.phoneController,
          hintText: "Phone",
          keyType: TextInputType.number,
          isPhone: true,
          maxlength: 10,
          size: screenHeight,
          prefixIcon: const Icon(
            Icons.numbers_outlined,
          ),
        ),
        CustomHeight.heightTen(context),
        TextFormLogin(
          controller: value.passwordController,
          hintText: "Password",
          keyType: TextInputType.name,
          isPassword: true,
          isObs: true,
          size: screenHeight,
          prefixIcon: const Icon(
            Icons.password_rounded,
          ),
        ),
        SizedBox(
          height: screenHeight.height * 0.05,
        ),
      ],
    );
  }
}
