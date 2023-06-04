import 'dart:developer';

import 'package:bookingapp/controller/const.dart';
import 'package:bookingapp/presentation/login/register.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

bool isVisible = true;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: screenHeight * 0.03),
              child: Text(
                "Welcome Back!!",
                style: textStyleFuc(
                    weight: FontWeight.w900, color: kBlack, size: 25),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.03, left: 10, right: 10),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "User Name",
                        labelText: "Name",
                        border: OutlineInputBorder(borderRadius: radiusTen),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Required name ";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    TextFormField(
                      obscureText: isVisible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(isVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                            log("$isVisible");
                          },
                        ),
                        hintText: "Password",
                        labelText: "Password",
                        helperText: "Password lenght should have >=8 ",
                        border: OutlineInputBorder(borderRadius: radiusTen),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Required password ";
                        }
                        return null;
                      },
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
                      height: screenHeight * 0.07,
                      color: const Color.fromARGB(255, 241, 239, 239),
                      child: OutlinedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: radiusTen)),
                          ),
                          onPressed: () {
                            
                          },
                          child: Text(
                            'Login',
                            style: textStyleFuc(
                                weight: FontWeight.w500, color: null, size: 16),
                          )),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
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
                      height: screenHeight * 0.03,
                    ),
                    Container(
                      height: screenHeight * 0.07,
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
                      height: screenHeight * 0.02,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text("Register Now",
                              style: textStyleFuc(
                                  weight: null, color: Colors.blue, size: 14))
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
