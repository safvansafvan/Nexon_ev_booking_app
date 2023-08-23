import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/presentation/screens/settings/widget/settings_fied.dart';
import 'package:bookingapp/presentation/widgets/app_bar.dart';
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
              CustomHeight.commonHeightz(context),
              const SettingsFieldWidget(
                title: "Privacy And Policy",
                isPrivacyAndPolicy: true,
              ),
              CustomHeight.commonHeightz(context),
              const SettingsFieldWidget(
                title: "About Us",
                isAboutUs: true,
              ),
              CustomHeight.commonHeightz(context),
              const SettingsFieldWidget(
                title: "Terms And Conditions",
                isTerms: true,
              ),
              CustomHeight.commonHeightz(context),
              const SettingsFieldWidget(
                title: "Share",
                isShare: true,
              ),
              CustomHeight.commonHeightz(context),
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
