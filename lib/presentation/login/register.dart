import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/providers/signup.dart';
import 'package:bookingapp/presentation/login/login.dart';
import 'package:bookingapp/presentation/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<SignupProvider>(context, listen: false);
    var screenHeight = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: signUpProvider.isLoading
            ? const CircularProgressIndicator()
            : ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 50),
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
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Sign up this page for accessing cars")
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      key: signUpProvider.formKey,
                      //       child: GestureDetector(

                      //           onTap: () {
                      //   FocusScopeNode curentFocus = FocusScope.of(context);
                      //   if (!curentFocus.hasPrimaryFocus) {
                      //     curentFocus.unfocus();

                      // }
                      //         },
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenHeight.height * 0.05,
                          ),
                          TextFormCommon(
                            controller: signUpProvider.usernameController,
                            hintText: "Username",
                            keyType: TextInputType.name,
                            isUser: true,
                            size: screenHeight,
                            prefixIcon: const Icon(
                              Icons.person_outline,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight.height * 0.03,
                          ),
                          TextFormCommon(
                            controller: signUpProvider.emailController,
                            hintText: "Email",
                            keyType: TextInputType.emailAddress,
                            isEmail: true,
                            size: screenHeight,
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight.height * 0.03,
                          ),
                          TextFormCommon(
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
                          SizedBox(
                            height: screenHeight.height * 0.03,
                          ),
                          TextFormCommon(
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
                                if (signUpProvider.formKey.currentState!
                                    .validate()) {
                                  await context
                                      .read<SignupProvider>()
                                      .getotpButtonClick(context);
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
      ),
    );
  }
}
