import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/controller/providers/get_user_details.dart';
import 'package:nexonev/controller/providers/internet_provider.dart';
import 'package:nexonev/presentation/screens/booking_status/booking_now_status.dart';
import 'package:nexonev/presentation/screens/booking_status/test_drive_status.dart';
import 'package:flutter/material.dart';
import 'package:nexonev/presentation/widgets/snack_bar.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GetUserDetials>(context, listen: false);
    final internet = Provider.of<InternetController>(context, listen: false);

    return SizedBox(
      width: 250,
      child: Drawer(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: const Color.fromARGB(237, 255, 255, 255),
        child: Column(
          children: [
            ColoredBox(
              color: kblue,
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
                          color: kwhite,
                        )),
                  ),
                  CustomHeight.commonHeightz(context),
                  const CircleAvatar(
                      radius: 35,
                      child: Icon(
                        Icons.person,
                        size: 35,
                        color: Colors.black87,
                      )),
                  CustomHeight.commonHeightz(context),
                  Text(
                    provider.userName ?? "Unknown",
                    style: textStyleFuc(
                        weight: FontWeight.w500, color: kwhite, size: 15),
                  ),
                  Text(
                    provider.userEmail ?? "Unknown",
                    style: textStyleFuc(
                        weight: FontWeight.w300, color: kwhite, size: 12),
                  ),
                  CustomHeight.commonHeightz(context),
                ],
              ),
            ),
            CustomHeight.commonHeightz(context),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  borderRadius: radiusTen, border: Border.all(color: kblue)),
              child: ListTile(
                onTap: () {
                  if (internet.hasInternet == false) {
                    snackBarWidget(
                        context: context,
                        title: 'Enable Internet Connection',
                        clr: kGreen);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BookingStatusScreen(),
                      ),
                    );
                  }
                },
                title: const Text("Booking Status"),
              ),
            ),
            CustomHeight.commonHeightz(context),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  borderRadius: radiusTen, border: Border.all(color: kblue)),
              child: ListTile(
                onTap: () {
                  if (internet.hasInternet == false) {
                    snackBarWidget(
                        context: context,
                        title: 'Enable Internet Connection',
                        clr: kGreen);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const TestDriveBookingStatusScreen(),
                      ),
                    );
                  }
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
              "1.2",
              style: textStyleFuc(weight: null, color: kBlack, size: 14),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
