import 'package:bookingapp/controller/providers/splash.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../../../controller/core/constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<SplashProvider>(context, listen: false)
          .navigateHome(context);
    });
    return FutureBuilder(builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
            child: Center(
          child: Lottie.asset("assets/ui-loader.json"),
        ));
      }
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/car-animation.json",
            ),
            const SizedBox(height: 100),
            Text(
              "Nexon Booking",
              style: textStyleFuc(
                  weight: FontWeight.w900, color: kBlack, size: 28),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 58.0, right: 58.0, top: 10),
              child: LinearPercentIndicator(
                animation: true,
                animationDuration: 1800,
                percent: 1,
                progressColor: const Color.fromARGB(255, 112, 21, 145),
                backgroundColor: const Color.fromARGB(255, 184, 89, 218),
                barRadius: const Radius.circular(10),
              ),
            )
          ],
        ),
      );
    });
  }
}
