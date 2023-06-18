import 'package:bookingapp/controller/const/const.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppBarWidget extends StatelessWidget {
  AppBarWidget(
      {super.key,
      required this.title,
      required this.leading,
      this.trailing,
      required this.menu});

  final String title;
  final IconData leading;
  final IconData? trailing;

  bool menu = false;
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
                color: kwhite,
              ),
            )
          : IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                leading,
                color: kwhite,
              )),
      title: Center(
        child: Text(
          title,
          style: textStyleFuc(weight: FontWeight.w400, color: kwhite, size: 20),
        ),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(trailing, color: kwhite),
      ),
    );
  }
}
