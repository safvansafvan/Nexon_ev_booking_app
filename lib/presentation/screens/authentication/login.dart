import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/controller/providers/authentication/continue_with_google.dart';
import 'package:bookingapp/controller/providers/authentication/login.dart';
import 'package:bookingapp/presentation/screens/authentication/forgot_password/forgot_otp.dart';
import 'package:bookingapp/presentation/screens/authentication/register.dart';
import 'package:bookingapp/presentation/screens/authentication/widget/square_field_widget.dart';
import 'package:bookingapp/presentation/screens/authentication/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    Provider.of<LoginProvider>(context, listen: false)
        .formKey1
        .currentState!
        .dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginGoogleProvi =
        Provider.of<ContinueWithGoogleProvider>(context, listen: false);

    var screenHeight = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: loginBackground,
      body: SafeArea(
        child: Consumer<LoginProvider>(builder: (context, value, _) {
          return value.isLoading || loginGoogleProvi.isLoading
              ? Center(child: Lottie.asset('assets/ui-loader.json'))
              : Form(
                  key: value.formKey1,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomHeight.commonHeightz(context),
                        const Icon(Icons.lock, size: 100),
                        CustomHeight.commonHeightz(context),
                        const Text(
                          "Welcome Back You've Been Missed!!",
                        ),
                        commonHeight,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextFormLogin(
                                controller: value.emailController,
                                hintText: "Email",
                                keyType: TextInputType.emailAddress,
                                isEmail: true,
                                size: screenHeight,
                                prefixIcon: const Icon(Icons.person_outline)),
                            CustomHeight.commonHeightz(context),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                            CustomHeight.commonHeightz(context),
                            InkWell(
                              onTap: () async {
                                if (value.formKey1.currentState!.validate()) {
                                  await value.loginButtonClick(context);
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                decoration: BoxDecoration(
                                    color: kBlack, borderRadius: radiusTen),
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: textStyleFuc(
                                        weight: FontWeight.bold,
                                        color: kwhite,
                                        size: 16),
                                  ),
                                ),
                              ),
                            ),
                            CustomHeight.commonHeightz(context),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      thickness: 0.5,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text('Or Continue With'),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      thickness: 0.5,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CustomHeight.commonHeightz(context),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SquareFieldWidget(
                                  isContinueGoogle: true,
                                  imagePath: 'assets/google.webp',
                                ),
                                const SizedBox(width: 25),
                                SquareFieldWidget(
                                  isContinueGoogle: false,
                                  imagePath: 'assets/guest.png',
                                ),
                              ],
                            ),
                            CustomHeight.commonHeightz(context),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an account? ",
                                  style: TextStyle(fontWeight: FontWeight.w500),
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
                                        weight: FontWeight.w600,
                                        color: Colors.blue,
                                        size: 14),
                                  ),
                                )
                              ],
                            ),
                          ],
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
