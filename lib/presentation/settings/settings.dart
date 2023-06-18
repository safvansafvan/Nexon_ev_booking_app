import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/presentation/settings/screens/about_us.dart';
import 'package:bookingapp/presentation/settings/screens/privacy_and_policy.dart';
import 'package:bookingapp/presentation/settings/screens/terms_and_conditions.dart';
import 'package:bookingapp/presentation/widget/app_bar.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/splash_b.webp"),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                AppBarWidget(
                    menu: false,
                    title: "Settings",
                    leading: Icons.arrow_back_ios_rounded),
                commonHeight,
                const SettingsFieldWidget(
                  title: "Privacy And Policy",
                  isPrivacyAndPolicy: true,
                ),
                commonHeight,
                const SettingsFieldWidget(
                  title: "About Us",
                  isAboutUs: true,
                ),
                commonHeight,
                const SettingsFieldWidget(
                  title: "Terms And Conditions",
                  isTerms: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsFieldWidget extends StatelessWidget {
  const SettingsFieldWidget(
      {super.key,
      this.isAboutUs,
      this.isTerms,
      this.isPrivacyAndPolicy,
      required this.title});

  final String title;

  final bool? isPrivacyAndPolicy;
  final bool? isAboutUs;
  final bool? isTerms;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: radiusTen,
      ),
      child: ListTile(
        onTap: () {
          if (isPrivacyAndPolicy == true) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const PrivacyAndPolicyWidget(),
              ),
            );
          } else if (isAboutUs == true) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AboutUs(),
              ),
            );
          } else if (isTerms == true) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const TermsAndConditions(),
              ),
            );
          }
        },
        title: Text(
          title,
          style: textStyleFuc(weight: FontWeight.w500, color: kBlack, size: 16),
        ),
      ),
    );
  }
}
