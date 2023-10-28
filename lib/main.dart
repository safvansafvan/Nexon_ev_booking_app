import 'package:nexonev/controller/providers/authentication/continue_with_google.dart';
import 'package:nexonev/controller/providers/authentication/forgot_password.dart';
import 'package:nexonev/controller/providers/authentication/login.dart';
import 'package:nexonev/controller/providers/authentication/otp_provider.dart';
import 'package:nexonev/controller/providers/authentication/otpverify_signup.dart';
import 'package:nexonev/controller/providers/bookings_provider/bookingnow_provider.dart';
import 'package:nexonev/controller/providers/bookings_provider/test_drive_provider.dart';
import 'package:nexonev/controller/providers/dealer_provider.dart';
import 'package:nexonev/controller/providers/get_user_details.dart';
import 'package:nexonev/controller/providers/group_provider/chat_provider.dart';
import 'package:nexonev/controller/providers/group_provider/get_all_group_provider.dart';
import 'package:nexonev/controller/providers/map_provider/map_provider.dart';
import 'package:nexonev/controller/providers/splash.dart';
import 'package:nexonev/presentation/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'controller/providers/internet_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        ),
        ChangeNotifierProvider(
          create: (context) => GetUserDetials(),
        ),
        ChangeNotifierProvider(
          create: (context) => InternetController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nexon Ev',
        theme: ThemeData(
          fontFamily: GoogleFonts.philosopher().fontFamily,
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
