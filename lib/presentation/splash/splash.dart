import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/presentation/home/home.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/providers/splash.dart';
import '../login/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SplashProvider>(context, listen: false).navigateHome(context);
    });
    //animated splash

    return FutureBuilder(
      future: loggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        }
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: kwhite,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/splash_b.webp"),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 200,
                ),
                Text(
                  "Nexon Booking",
                  style: textStyleFuc(
                      weight: FontWeight.w900, color: kwhite, size: 28),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 58.0, right: 58.0, top: 10),
                  child: LinearPercentIndicator(
                    animation: true,
                    animationDuration: 1500,
                    percent: 1,
                    progressColor: const Color.fromARGB(255, 112, 21, 145),
                    backgroundColor: const Color.fromARGB(255, 184, 89, 218),
                    barRadius: const Radius.circular(10),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

Future<Widget> loggedIn() async {
  // Obtain shared preferences.
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
  if (isLoggedIn == false) {
    return LoginPage();
  } else {
    return MyHomePage();
  }
}
