import 'package:bookingapp/controller/providers/dealer_provider.dart';
import 'package:bookingapp/controller/providers/group_provider/chat_provider.dart';
import 'package:bookingapp/controller/providers/group_provider/get_all_group_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bookingapp/presentation/splash/splash.dart';
import 'package:bookingapp/controller/providers/splash.dart';
import 'package:bookingapp/controller/providers/authentication/continue_with_google.dart';
import 'package:bookingapp/controller/providers/authentication/forgot_password.dart';
import 'package:bookingapp/controller/providers/authentication/login.dart';
import 'package:bookingapp/controller/providers/authentication/otp_provider.dart';
import 'package:bookingapp/controller/providers/authentication/otpverify_signup.dart';
import 'package:bookingapp/controller/providers/bookings_provider/bookingnow_provider.dart';
import 'package:bookingapp/controller/providers/bookings_provider/test_drive_provider.dart';
import 'controller/providers/map_provider/map_provider.dart';

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
        ChangeNotifierProvider(
          create: (context) => MapProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetAllGroupsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChatProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DealerProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nexon Booking App',
        theme: ThemeData(
          fontFamily: GoogleFonts.philosopher().fontFamily,
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
