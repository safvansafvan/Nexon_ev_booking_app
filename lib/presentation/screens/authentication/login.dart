import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/controller/providers/authentication/login.dart';
import 'package:nexonev/presentation/screens/authentication/register/register/register.dart';
import 'package:nexonev/presentation/screens/authentication/widget/login_field_card.dart';
import 'package:nexonev/presentation/screens/authentication/widget/square_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: loginBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: screenSize.height * 0.23,
                width: screenSize.width * 0.27,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/authlogo.png'),
                  ),
                ),
              ),
              const Text("Welcome Back You've Been Missed!!"),
              CustomHeight.commonHeightz(context),
              Consumer<LoginProvider>(builder: (context, value, _) {
                return Form(
                  key: formKey1,
                  child: LoginFieldCardWidget(
                    value: value,
                    screenSize: screenSize,
                    formKey1: formKey1,
                  ),
                );
              }),
              CustomHeight.commonHeightz(context),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
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
                    screenSize: screenSize,
                    isContinueGoogle: true,
                    imagePath: 'assets/images/google.webp',
                  ),
                  const SizedBox(width: 25),
                  SquareFieldWidget(
                    screenSize: screenSize,
                    isContinueGoogle: false,
                    imagePath: 'assets/images/guest.png',
                  ),
                ],
              ),
              SizedBox(
                height: screenSize.height * 0.12,
                child: Row(
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
                              return RegisterScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Register Now",
                        style: textStyleFuc(
                          weight: FontWeight.w600,
                          color: Colors.blue,
                          size: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
