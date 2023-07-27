import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/presentation/screens/settings/widget/settings_fied.dart';
import 'package:bookingapp/presentation/widget/app_bar.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              AppBarWidget(
                  menu: false,
                  title: "Settings",
                  settings: true,
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
              ),
              commonHeight,
              const SettingsFieldWidget(
                title: "Share",
                isShare: true,
              ),
              commonHeight,
              const SettingsFieldWidget(
                isLogout: true,
                title: "Logout",
              )
            ],
          ),
        ),
      ),
    );
  }
}
