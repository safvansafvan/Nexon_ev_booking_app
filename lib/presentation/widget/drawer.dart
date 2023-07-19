import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/providers/get_user_details.dart';
import 'package:bookingapp/presentation/booking_status/booking_now_status.dart';
import 'package:bookingapp/presentation/booking_status/test_drive_status.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String? userName;
  String? userEmail;
  getUserDetails() async {
    userEmail = await GetUserDetials.getUSerEmail();
    userName = await GetUserDetials.getUsername();
  }

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
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
                  radius: 35,
                  backgroundImage: NetworkImage(
                      "https://cdn-icons-png.flaticon.com/512/149/149071.png"),
                ),
                height10,
                Text(
                  userName ?? "Unknown",
                  style: textStyleFuc(
                      weight: FontWeight.w500, color: kBlack, size: 15),
                ),
                Text(
                  userEmail ?? "Unknown",
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BookingStatusScreen(),
                        ),
                      );
                    },
                    title: const Text("Booking Status"),
                  ),
                ),
                height10,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: radiusTen,
                      border: Border.all(color: kblue)),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const TestDriveBookingStatusScreen(),
                        ),
                      );
                    },
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
