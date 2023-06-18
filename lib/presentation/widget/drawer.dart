import 'package:bookingapp/controller/const/const.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 250,
        child: Drawer(
          backgroundColor: const Color.fromARGB(255, 53, 86, 113),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                commonHeight,
                CircleAvatar(
                  radius: 25,
                  backgroundColor: kwhite,
                  child: const Icon(Icons.person_outline),
                ),
                commonHeight,
                Text(
                  "username",
                  style: textStyleFuc(
                      weight: FontWeight.w500, color: kwhite, size: 15),
                ),
                Text(
                  "sajusajuptl@gmail.com",
                  style: textStyleFuc(
                      weight: FontWeight.w300, color: kwhite, size: 12),
                ),
                commonHeight,
                const Divider(
                  thickness: 2,
                ),
                commonHeight,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: radiusTen,
                      border: Border.all(color: Colors.grey)),
                  child: ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.chat_bubble_outline,
                      color: kwhite,
                    ),
                    title: Text(
                      "Chat with us",
                      style:
                          textStyleFuc(weight: null, color: kwhite, size: 16),
                    ),
                  ),
                ),
                height10,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: radiusTen,
                      border: Border.all(color: Colors.grey)),
                  child: ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.supervisor_account,
                      color: kwhite,
                    ),
                    title: Text(
                      "Community chat",
                      style:
                          textStyleFuc(weight: null, color: kwhite, size: 16),
                    ),
                  ),
                ),
                height10,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: radiusTen,
                      border: Border.all(color: Colors.grey)),
                  child: ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.share_outlined,
                      color: kwhite,
                    ),
                    title: Text(
                      "Share",
                      style:
                          textStyleFuc(weight: null, color: kwhite, size: 16),
                    ),
                  ),
                ),
                height10,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: radiusTen,
                      border: Border.all(color: Colors.grey)),
                  child: ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.settings_outlined,
                      color: kwhite,
                    ),
                    title: Text(
                      "Settings",
                      style:
                          textStyleFuc(weight: null, color: kwhite, size: 16),
                    ),
                  ),
                ),
                height10,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: radiusTen,
                      border: Border.all(color: Colors.grey)),
                  child: ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.error_outline,
                      color: kwhite,
                    ),
                    title: Text(
                      "Brochures",
                      style:
                          textStyleFuc(weight: null, color: kwhite, size: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 175,
                ),
                Text(
                  "Version",
                  style: textStyleFuc(weight: null, color: kwhite, size: 16),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "1.0",
                  style: textStyleFuc(weight: null, color: kwhite, size: 14),
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
