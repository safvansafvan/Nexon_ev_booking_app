import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/presentation/widgets/app_bar.dart';
import 'package:nexonev/presentation/widgets/text_h.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            AppBarWidget(
              leading: Icons.arrow_back_ios_new_rounded,
              settings: true,
              menu: false,
              title: "Terms&conditions",
            ),
            CustomHeight.commonHeightz(context),
            HeadingTextWidget(
              text: "Nexon Ev Booking App",
              color: kBlack,
              textSize: 20,
              fontWeight: FontWeight.w500,
              underline: true,
            ),
            CustomHeight.heightTen(context),
            const Text(
                "These Terms and Conditions govern your use of the Nexon ev booking app mobile application app provided by Brototype By downloading, installing, or using the App, you agree to be bound by this Agreement. If you do not agree with any part of this Agreement, please do not use the App."),
            CustomHeight.heightTen(context),
            HeadingTextWidget(
              text: "License",
              color: kBlack,
              textSize: 16,
              underline: true,
            ),
            CustomHeight.heightTen(context),
            const Text(
                "1.1. Subject to your compliance with this Agreement, the Company grants you a limited, non-exclusive, non-transferable, revocable license to use the App for personal, non-commercial purposes.\n1.2. You acknowledge that the Company retains all intellectual property rights in the App, and you agree not to copy, modify, distribute, sell, or create derivative works based on the App."),
            CustomHeight.heightTen(context),
            HeadingTextWidget(
              text: "User account",
              color: kBlack,
              textSize: 16,
              underline: true,
            ),
            CustomHeight.heightTen(context),
            const Text(
                "2.1. In order to use certain features of the App, you may be required to create a user account.\n2.2. You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account.\n2.3. You agree to provide accurate and up-to-date information during the registration process and to promptly update any changes."),
            CustomHeight.heightTen(context),
            HeadingTextWidget(
              text: "Map",
              color: kBlack,
              textSize: 16,
              underline: true,
            ),
            CustomHeight.heightTen(context),
            const Text(
                "3.1. The App includes a map feature that provides location-based information and services.\n3.2. The accuracy of the map and the availability of location-based services may vary and are subject to factors beyond the control of the Company."),
            CustomHeight.heightTen(context),
            HeadingTextWidget(
              text: "Test drive booking",
              color: kBlack,
              textSize: 16,
              underline: true,
            ),
            CustomHeight.heightTen(context),
            const Text(
                "4.1. The App allows users to book test drives for vehicles.\n4.2. Test drive availability, scheduling, and other details are subject to the policies and terms set by the Company."),
            CustomHeight.heightTen(context),
            HeadingTextWidget(
              text: "Car booking",
              color: kBlack,
              textSize: 16,
              underline: true,
            ),
            CustomHeight.heightTen(context),
            const Text(
                "5.1. The App enables users to book cars for rental or other purposes.\n5.2. Car availability, pricing, terms, and conditions are determined by the Company and may be subject to additional agreements."),
            CustomHeight.heightTen(context),
            HeadingTextWidget(
              text: "Settings",
              color: kBlack,
              textSize: 16,
              underline: true,
            ),
            CustomHeight.heightTen(context),
            const Text(
                "6.1. The App includes settings that allow users to customize their preferences and app experience.\n6.2. You agree to use the settings feature in accordance with applicable laws and regulations."),
            CustomHeight.heightTen(context),
            HeadingTextWidget(
              text: "Chat boat",
              color: kBlack,
              textSize: 16,
              underline: true,
            ),
            CustomHeight.heightTen(context),
            const Text(
                "7.1. The App may include a chat bot feature that provides automated responses and assistance.\n7.2. The accuracy and availability of the chat bot responses may vary and are subject to the limitations of automated systems."),
            CustomHeight.heightTen(context),
            HeadingTextWidget(
              text: "Community chat boat",
              color: kBlack,
              textSize: 16,
              underline: true,
            ),
            CustomHeight.heightTen(context),
            const Text(
                "8.1. The App may include a community chat feature that allows users to interact and communicate with each other.\n8.2. You agree to use the community chat feature responsibly and in compliance with applicable laws and regulations."),
            CustomHeight.heightTen(context),
            HeadingTextWidget(
              text: "Login, Signup, OTP, Forgot Password:",
              color: kBlack,
              textSize: 16,
              underline: true,
            ),
            CustomHeight.heightTen(context),
            const Text(
                "9.1. The App provides login, signup, and password recovery features.\n9.2. You are responsible for maintaining the security and confidentiality of your login credentials and for any actions taken using your account."),
            CustomHeight.heightTen(context),
            HeadingTextWidget(
              text: "Continue with google",
              color: kBlack,
              textSize: 16,
              underline: true,
            ),
            CustomHeight.heightTen(context),
            const Text(
                "10.1. The App may provide the option to sign up or log in using your Google account.\n10.2. By choosing the Continue with Google option, you authorize the App to access and use your Google account information in accordance with the App's privacy policy."),
            CustomHeight.heightTen(context),
            HeadingTextWidget(
              text: "Contact us",
              color: kBlack,
              textSize: 16,
              underline: true,
            ),
            CustomHeight.heightTen(context),
            const Text("playhost99@gmail.com")
          ],
        ),
      ),
    );
  }
}
