import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/providers/get_user_details.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GetUserDetials user = GetUserDetials();
    return SafeArea(
      child: SizedBox(
        width: 250,
        height: 400,
        child: Drawer(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          backgroundColor: Colors.white70,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                commonHeight,
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person_outline),
                ),
                commonHeight,
                Text(
                  user.userName.toString(),
                  style: textStyleFuc(
                      weight: FontWeight.w500, color: kBlack, size: 15),
                ),
                Text(
                  user.userEmail.toString(),
                  style: textStyleFuc(
                      weight: FontWeight.w300, color: kBlack, size: 12),
                ),
                commonHeight,
                const Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                height10,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: radiusTen,
                      border: Border.all(color: kblue)),
                  child: ListTile(
                    onTap: () {},
                    title: const Text("Booking Status"),
                  ),
                ),
                height10,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: radiusTen,
                      border: Border.all(color: kblue)),
                  child: ListTile(
                    onTap: () {},
                    title: const Text("Test Drive Status"),
                  ),
                ),
                kheight30,
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
