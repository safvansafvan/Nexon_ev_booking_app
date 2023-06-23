import 'package:bookingapp/controller/providers/authentication/continue_with_google.dart';
import 'package:bookingapp/controller/providers/authentication/forgot_password.dart';
import 'package:bookingapp/controller/providers/authentication/login.dart';
import 'package:bookingapp/controller/providers/authentication/otp_provider.dart';
import 'package:bookingapp/controller/providers/authentication/otpverify_signup.dart';
import 'package:bookingapp/controller/providers/bookings_provider/bookingnow_provider.dart';
import 'package:bookingapp/controller/providers/splash.dart';
import 'package:bookingapp/controller/providers/bookings_provider/test_drive_provider.dart';
import 'package:bookingapp/presentation/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
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
          create: (context) => OtpVerificationAndSignupProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OtpProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ContinueWithGoogleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ForgotPasswordProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TestDriveBookingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookingNowProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nexon Booking App',
        theme: ThemeData(
          fontFamily: GoogleFonts.philosopher().fontFamily,
          // colorScheme: ColorScheme.fromSeed(
          //   seedColor: const Color.fromARGB(255, 181, 24, 216),
          // ),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
