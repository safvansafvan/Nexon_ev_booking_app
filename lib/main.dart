import 'package:bookingapp/controller/providers/login.dart';
import 'package:bookingapp/controller/providers/signup.dart';
import 'package:bookingapp/controller/providers/splash.dart';
import 'package:bookingapp/controller/providers/verifyotp.dart';
import 'package:bookingapp/presentation/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  //   WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SplashProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignupProvider(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => OtpProvider(),
        // ),
        ChangeNotifierProvider(
          create: (context) => VerifyOtpProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Nexon Booking App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SplashScreen()),
    );
  }
}
