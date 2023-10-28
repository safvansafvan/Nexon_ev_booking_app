import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/controller/providers/get_user_details.dart';
import 'package:nexonev/presentation/screens/settings/settings.dart';
import 'package:nexonev/presentation/widgets/login_dialog.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppBarWidget extends StatelessWidget {
  AppBarWidget(
      {super.key,
      this.title,
      required this.leading,
      this.trailing,
      required this.settings,
      required this.menu});

  final String? title;
  final IconData leading;
  final IconData? trailing;

  bool menu = false;
  bool settings = false;

  @override
  Widget build(BuildContext context) {
    GetUserDetials user = GetUserDetials();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await user.userLoginOrNot();
    });
    return ListTile(
        leading: menu
            ? IconButton(
                onPressed: () {
                  if (user.token == null) {
                    loginReqDialog(context);
                  } else {
                    Scaffold.of(context).openDrawer();
                  }
                },
                icon: Icon(
                  Icons.menu,
                  color: kBlack,
                ),
              )
            : IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  leading,
                  color: kBlack,
                )),
        title: Center(
          child: Text(
            title ?? "",
            style:
                textStyleFuc(weight: FontWeight.w600, color: kBlack, size: 20),
          ),
        ),
        trailing: settings
            ? IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ),
                  );
                },
                icon: Icon(trailing, color: kBlack),
              )
            : null);
  }
}
