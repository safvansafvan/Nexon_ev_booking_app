import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/controller/providers/get_user_details.dart';
import 'package:bookingapp/presentation/screens/booking_status/booking_now_status.dart';
import 'package:bookingapp/presentation/screens/booking_status/test_drive_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GetUserDetials>(context, listen: false);

    return SafeArea(
      child: SizedBox(
        width: 250,
        child: Drawer(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          backgroundColor: const Color.fromARGB(237, 255, 255, 255),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        Scaffold.of(context).closeDrawer();
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: kblue,
                      )),
                ),
                CustomHeight.commonHeightz(context),
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                      "https://cdn-icons-png.flaticon.com/512/149/149071.png"),
                ),
                CustomHeight.commonHeightz(context),
                Text(
                  provider.userName ?? "Unknown",
                  style: textStyleFuc(
                      weight: FontWeight.w500, color: kBlack, size: 15),
                ),
                Text(
                  provider.userEmail ?? "Unknown",
                  style: textStyleFuc(
                      weight: FontWeight.w300, color: kBlack, size: 12),
                ),
                CustomHeight.commonHeightz(context),
                const Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                CustomHeight.commonHeightz(context),
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
                CustomHeight.commonHeightz(context),
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
                const Spacer(),
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
