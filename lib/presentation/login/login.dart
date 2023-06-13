import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/providers/login.dart';
import 'package:bookingapp/presentation/login/register.dart';
import 'package:bookingapp/presentation/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final providerLogin = context.watch<LoginProvider>();
    var screenHeight = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: providerLogin.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, top: screenHeight.height * 0.03),
                    child: Text(
                      "Welcome Back!!",
                      style: textStyleFuc(
                          weight: FontWeight.w900, color: kBlack, size: 25),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight.height * 0.03, left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFormCommon(
                            controller: providerLogin.emailController,
                            hintText: "Email",
                            keyType: TextInputType.emailAddress,
                            isEmail: true,
                            size: screenHeight,
                            prefixIcon: const Icon(Icons.person_outline)),
                        SizedBox(
                          height: screenHeight.height * 0.02,
                        ),
                        TextFormCommon(
                          controller: providerLogin.passwordCntrlr,
                          hintText: "Password",
                          keyType: TextInputType.number,
                          isObs: true,
                          isPassword: true,
                          size: screenHeight,
                          prefixIcon: const Icon(Icons.password_rounded),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7),
                          child: Text(
                            "Forgot Password?",
                            style: textStyleFuc(
                                weight: FontWeight.w500,
                                color: const Color.fromARGB(255, 66, 140, 200),
                                size: 15),
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
                                // if (providerLogin.formKey1.currentState!
                                //     .validate()) {
                                providerLogin.getLoginStatus(context);
                              },
                              child: Text(
                                'Login',
                                style: textStyleFuc(
                                    weight: FontWeight.w500,
                                    color: null,
                                    size: 16),
                              )),
                        ),
                        SizedBox(
                          height: screenHeight.height * 0.05,
                        ),
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: radiusTen,
                            image: const DecorationImage(
                              colorFilter: ColorFilter.mode(
                                Color.fromARGB(255, 241, 239, 239),
                                BlendMode.darken,
                              ),
                              fit: BoxFit.cover,
                              image: AssetImage("assets/nexon.jpeg"),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight.height * 0.03,
                        ),
                        Container(
                          height: screenHeight.height * 0.07,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 241, 239, 239),
                              borderRadius: radiusTen),
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
                        SizedBox(
                          height: screenHeight.height * 0.02,
                        ),
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
                              child: Text("Register Now",
                                  style: textStyleFuc(
                                      weight: null,
                                      color: Colors.blue,
                                      size: 14)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
