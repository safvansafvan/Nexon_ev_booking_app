import 'package:bookingapp/controller/const/const.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget(
      {super.key, required this.title, required this.leading, this.trailing});

  final String title;
  final IconData leading;
  final IconData? trailing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(
          leading,
          color: kwhite,
        ),
      ),
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
