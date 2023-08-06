import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/controller/providers/bookings_provider/test_drive_provider.dart';
import 'package:bookingapp/presentation/screens/booking_status/widget/test_drive_card.dart';
import 'package:bookingapp/presentation/widgets/text_h.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestDriveBookingStatusScreen extends StatelessWidget {
  const TestDriveBookingStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<TestDriveBookingProvider>(context, listen: false)
          .getTestDriveDetails(context);
    });
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                  kWidth,
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: HeadingTextWidget(
                      text: "Test Drive Status ",
                      color: kBlack,
                      fontWeight: FontWeight.w600,
                      underline: true,
                      textSize: 17,
                    ),
                  ),
                ],
              ),
              commonHeight,
              Consumer<TestDriveBookingProvider>(builder: (context, value, _) {
                return value.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : value.testDriveDetails.isEmpty
                        ? SizedBox(
                            height: 100,
                            width: 100,
                            child: Card(
                              elevation: 6,
                              child: Center(
                                child: Text(
                                  "Your Test Drive Booking Is Empty",
                                  style: textStyleFuc(
                                      weight: FontWeight.bold,
                                      color: kred,
                                      size: 18),
                                ),
                              ),
                            ),
                          )
                        : TestDriveCard(screenSize: screenSize, value: value);
              })
            ],
          ),
        ),
      ),
    );
  }
}
