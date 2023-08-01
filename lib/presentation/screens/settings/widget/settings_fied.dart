import 'package:bookingapp/controller/providers/authentication/continue_with_google.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'package:bookingapp/controller/core/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bookingapp/presentation/screens/authentication/login.dart';
import 'package:bookingapp/presentation/screens/settings/screens/about_us.dart';
import 'package:bookingapp/presentation/screens/settings/screens/privacy_and_policy.dart';
import 'package:bookingapp/presentation/screens/settings/screens/terms_and_conditions.dart';
import 'package:bookingapp/presentation/widgets/snack_bar.dart';

class SettingsFieldWidget extends StatelessWidget {
  const SettingsFieldWidget(
      {super.key,
      this.isAboutUs,
      this.isTerms,
      this.isPrivacyAndPolicy,
      required this.title,
      this.isLogout,
      this.isShare});

  final String title;

  final bool? isPrivacyAndPolicy;
  final bool? isAboutUs;
  final bool? isTerms;
  final bool? isLogout;
  final bool? isShare;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: kblue),
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
          } else if (isLogout == true) {
            alertDialog(context);
          } else if (isShare == true) {
            share("com.example.share_app");
          }
        },
        title: Text(
          title,
          style: textStyleFuc(weight: FontWeight.w500, color: kBlack, size: 16),
        ),
      ),
    );
  }

  void alertDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Conform Message"),
          content: const Text("Are you sure you would like to LOGOUT?"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancel")),
            TextButton(
                onPressed: () async {
                  await logout(context);
                },
                child: const Text("Ok"))
          ],
        );
      },
    );
  }

  logout(context) async {
    final pref = await SharedPreferences.getInstance();
    pref.remove("ACCESS_TOKEN");
    pref.remove("USER_NAME");
    pref.remove("USER_EMAIL");

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
        (route) => false);
    Provider.of<ContinueWithGoogleProvider>(context, listen: false).logout();
    snackBarWidget(context: context, title: " Logout Is Success", clr: kGreen);
  }

  void share(content) {
    Share.share(content);
  }
}
