import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/presentation/login/login.dart';
import 'package:bookingapp/presentation/login/otp.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: ListView(
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
                          weight: FontWeight.w900, color: kBlack, size: 25),
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
                
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Name",
                        labelText: "Enter Name",
                        border: OutlineInputBorder(borderRadius: radiusTen),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Email",
                        labelText: "Email",
                        border: OutlineInputBorder(borderRadius: radiusTen),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Phone",
                        labelText: "Phone",
                        border: OutlineInputBorder(borderRadius: radiusTen),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                        border: OutlineInputBorder(borderRadius: radiusTen),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.07,
                    ),
                    Container(
                      width: double.infinity,
                      height: screenHeight * 0.07,
                      color: const Color.fromARGB(255, 241, 239, 239),
                      child: OutlinedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(borderRadius: radiusTen)),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>const OtpScreen(),
                                ),);
                          },
                          child: Text(
                            'Sign Up',
                            style: textStyleFuc(
                                weight: FontWeight.w500, color: null, size: 16),
                          )),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return  LoginPage();
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
                                  weight: null, color: Colors.blue, size: 14))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
