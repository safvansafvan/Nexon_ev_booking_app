import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/controller/providers/authentication/otp_provider.dart';
import 'package:bookingapp/controller/providers/authentication/otpverify_signup.dart';
import 'package:bookingapp/presentation/screens/authentication/login.dart';
import 'package:bookingapp/presentation/screens/authentication/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpProvider =
        Provider.of<OtpVerificationAndSignupProvider>(context, listen: false);
    var screenHeight = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: loginBackground,
      body: SafeArea(
        child: Consumer<OtpProvider>(builder: (context, value, _) {
          return value.isLoading
              ? Center(
                  child: Lottie.asset("assets/ui-loader.json"),
                )
              : Form(
                  key: signUpProvider.formKey2,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomHeight.heightTen(context),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Text(
                                "Welcome To Ev Car\nBooking App",
                                style: textStyleFuc(
                                    weight: FontWeight.w900,
                                    color: kBlack,
                                    size: 25),
                              ),
                              CustomHeight.heightTen(context),
                              const Text(
                                  "Sign up this page for accessing cars"),
                            ],
                          ),
                        ),
                        CustomHeight.commonHeightz(context),
                        TextFormLogin(
                          controller: signUpProvider.usernameController,
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
                          controller: signUpProvider.emailController,
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
                          controller: signUpProvider.phoneController,
                          hintText: "Phone",
                          keyType: TextInputType.number,
                          isPhone: true,
                          maxlength: 10,
                          size: screenHeight,
                          prefixIcon: const Icon(
                            Icons.numbers_outlined,
                          ),
                        ),
                        CustomHeight.commonHeightz(context),
                        TextFormLogin(
                          controller: signUpProvider.passwordController,
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
                          height: screenHeight.height * 0.07,
                        ),
                        InkWell(
                          onTap: () async {
                            if (signUpProvider.formKey2.currentState!
                                .validate()) {
                              await context
                                  .read<OtpProvider>()
                                  .signUpButtonClick(context);
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                                color: kBlack, borderRadius: radiusTen),
                            child: Center(
                              child: Text(
                                'Sign Up',
                                style: textStyleFuc(
                                    weight: FontWeight.bold,
                                    color: kwhite,
                                    size: 16),
                              ),
                            ),
                          ),
                        ),
                        CustomHeight.commonHeightz(context),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LoginPage();
                                },
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account? ",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text("Login Now",
                                  style: textStyleFuc(
                                      weight: FontWeight.w600,
                                      color: Colors.blue,
                                      size: 14))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        }),
      ),
    );
  }
}
