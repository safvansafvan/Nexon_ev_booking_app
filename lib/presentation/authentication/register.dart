import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/providers/otp_provider.dart';
import 'package:bookingapp/controller/providers/otpverify_signup.dart';
import 'package:bookingapp/presentation/authentication/login.dart';
import 'package:bookingapp/presentation/authentication/widget/text_form_field.dart';
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
      body: SafeArea(
        child: Consumer<OtpProvider>(builder: (context, value, _) {
          return value.isLoading
              ? Center(
                  child: Lottie.asset("assets/ui-loader.json"),
                )
              : Form(
                  key: signUpProvider.formKey2,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 50, bottom: 10),
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome To Ev Car\nBooking App",
                                style: textStyleFuc(
                                    weight: FontWeight.w900,
                                    color: kBlack,
                                    size: 25),
                              ),
                              SizedBox(
                                height: screenHeight.height * 0.01,
                              ),
                              const Text(
                                  "Sign up this page for accessing cars"),
                              SizedBox(
                                height: screenHeight.height * 0.05,
                              ),
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
                              commonHeight,
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
                              commonHeight,
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
                              commonHeight,
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
                              Container(
                                width: double.infinity,
                                height: screenHeight.height * 0.07,
                                color: const Color.fromARGB(255, 241, 239, 239),
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius: radiusTen)),
                                  ),
                                  onPressed: () async {
                                    if (signUpProvider.formKey2.currentState!
                                        .validate()) {
                                      await context
                                          .read<OtpProvider>()
                                          .signUpButtonClick(context);
                                    }
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: textStyleFuc(
                                        weight: FontWeight.w500,
                                        color: null,
                                        size: 16),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight.height * 0.03,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const LoginPage();
                                      },
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Already have an account? ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text("Login Now",
                                        style: textStyleFuc(
                                            weight: null,
                                            color: Colors.blue,
                                            size: 14))
                                  ],
                                ),
                              )
                            ],
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
