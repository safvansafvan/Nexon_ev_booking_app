import 'package:nexonev/controller/providers/splash.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<SplashProvider>(context, listen: false)
            .navigateHome(context),
        builder: (context, snapshot) {
          return Scaffold(
            body: Center(
              child: Lottie.asset("assets/animations/car-animation.json"),
            ),
          );
        });
  }
}
