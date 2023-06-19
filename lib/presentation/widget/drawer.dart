import 'package:bookingapp/controller/const/const.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 250,
        height: 250,
        child: Drawer(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          backgroundColor: Colors.white70,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                commonHeight,
                CircleAvatar(
                  radius: 25,
                  backgroundColor: kBlack,
                  child: const Icon(Icons.person_outline),
                ),
                commonHeight,
                Text(
                  "username",
                  style: textStyleFuc(
                      weight: FontWeight.w500, color: kBlack, size: 15),
                ),
                Text(
                  "sajusajuptl@gmail.com",
                  style: textStyleFuc(
                      weight: FontWeight.w300, color: kBlack, size: 12),
                ),
                commonHeight,
                const Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                Text(
                  "Version",
                  style: textStyleFuc(weight: null, color: kBlack, size: 16),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "1.0",
                  style: textStyleFuc(weight: null, color: kBlack, size: 14),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
