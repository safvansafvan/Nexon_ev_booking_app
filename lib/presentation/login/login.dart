import 'package:bookingapp/controller/const.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color.fromARGB(255, 241, 239, 239),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15, top: screenHeight * 0.06),
                child: Text(
                  "Welcome Back!!",
                  style: textStyleFuc(
                      weight: FontWeight.w900, color: kBlack, size: 25),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.03, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "User Name",
                        labelText: "Name",
                        border: OutlineInputBorder(borderRadius: radiusTen),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                        border: OutlineInputBorder(borderRadius: radiusTen),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(7),
                      child: Text(
                        "Forgot Password?",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: screenHeight * 0.07,
                      decoration:
                          BoxDecoration(color: kwhite, borderRadius: radiusTen),
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
                      height: screenHeight * 0.05,
                    ),
                    Container(
                      height: 183,
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
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
