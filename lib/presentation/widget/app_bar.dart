import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/presentation/community_chat/screens/join_group.dart';
import 'package:bookingapp/presentation/settings/settings.dart';
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
  bool settings;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: menu
            ? IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
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
            : const PopUp());
  }
}

class PopUp extends StatelessWidget {
  const PopUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const JoinGroupScreen(),
                      ),
                    );
                  },
                  child: const Text("Join Group"),
                ),
              ),
              PopupMenuItem(
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Create Group"),
                ),
              ),
            ]);
  }
}
