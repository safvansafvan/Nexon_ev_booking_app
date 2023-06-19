import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/presentation/settings/screens/about_us.dart';
import 'package:bookingapp/presentation/settings/screens/privacy_and_policy.dart';
import 'package:bookingapp/presentation/settings/screens/terms_and_conditions.dart';
import 'package:flutter/material.dart';

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
