import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/providers/authentication/continue_with_google.dart';
import 'package:bookingapp/controller/providers/authentication/login.dart';
import 'package:bookingapp/presentation/authentication/forgot_password/forgot_otp.dart';
import 'package:bookingapp/presentation/authentication/register.dart';
import 'package:bookingapp/presentation/authentication/widget/image_widget.dart';
import 'package:bookingapp/presentation/authentication/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final loginGoogleProvi =
        Provider.of<ContinueWithGoogleProvider>(context, listen: false);
    var screenHeight = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Consumer<LoginProvider>(
          builder: (context, value, _) {
            return value.isLoading || loginGoogleProvi.isLoading
                ? Center(
                    child: Lottie.asset("assets/ui-loader.json"),
                  )
                : Form(
                    key: value.formKey1,
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15, top: screenHeight.height * 0.03),
                          child: Text(
                            "Welcome Back!! ",
                            style: textStyleFuc(
                                weight: FontWeight.w900,
                                color: kBlack,
                                size: 25),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: screenHeight.height * 0.03,
                              left: 10,
                              right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextFormLogin(
                                  controller: value.emailController,
                                  hintText: "Email",
                                  keyType: TextInputType.emailAddress,
                                  isEmail: true,
                                  size: screenHeight,
                                  prefixIcon: const Icon(Icons.person_outline)),
                              commonHeight,
                              TextFormLogin(
                                controller: value.passwordCntrlr,
                                hintText: "Password",
                                keyType: TextInputType.name,
                                isObs: true,
                                isPassword: true,
                                size: screenHeight,
                                prefixIcon: const Icon(Icons.password_rounded),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgotPasswordWidget(),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(7),
                                  child: Text(
                                    "Forgot Password?",
                                    style: textStyleFuc(
                                        weight: FontWeight.w500,
                                        color: const Color.fromARGB(
                                            255, 66, 140, 200),
                                        size: 15),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: double.infinity,
                                height: screenHeight.height * 0.07,
                                color: const Color.fromARGB(255, 241, 239, 239),
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius: radiusTen),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (value.formKey1.currentState!
                                        .validate()) {
                                      value.loginButtonClick(context);
                                    }
                                  },
                                  child: Text(
                                    'Login',
                                    style: textStyleFuc(
                                        weight: FontWeight.w500,
                                        color: null,
                                        size: 16),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight.height * 0.05,
                              ),
                              const ImageWidget(image: "assets/nexon.webp"),
                              SizedBox(
                                height: screenHeight.height * 0.03,
                              ),
                              InkWell(
                                onTap: () async {
                                  await loginGoogleProvi
                                      .continueWithGoogleButtonClick(context);
                                },
                                child: Container(
                                  height: screenHeight.height * 0.07,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 241, 239, 239),
                                    borderRadius: radiusTen,
                                    border: Border.all(color: kBlack38),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const FaIcon(
                                        FontAwesomeIcons.google,
                                        color: Colors.red,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        'Continue With Google',
                                        style: textStyleFuc(
                                          weight: FontWeight.w500,
                                          color: kBlack,
                                          size: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              commonHeight,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Don't have an account? ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return const RegisterScreen();
                                          },
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Register Now",
                                      style: textStyleFuc(
                                          weight: null,
                                          color: Colors.blue,
                                          size: 14),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
