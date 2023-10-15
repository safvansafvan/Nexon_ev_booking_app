import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/controller/providers/bookings_provider/test_drive_provider.dart';
import 'package:nexonev/presentation/screens/booking_status/widget/test_drive_card.dart';
import 'package:nexonev/presentation/widgets/text_h.dart';
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
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: HeadingTextWidget(
          text: "Test Drive Status ",
          color: kBlack,
          fontWeight: FontWeight.w600,
          textSize: 17,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Consumer<TestDriveBookingProvider>(builder: (context, value, _) {
                return value.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : value.testDriveDetails.isEmpty
                        ? SizedBox(
                            height: screenSize.height * 0.15,
                            child: Card(
                              elevation: 6,
                              child: Center(
                                child: Text(
                                  "Your Test Drive Booking Is Empty",
                                  style: textStyleFuc(
                                      weight: FontWeight.bold,
                                      color: kred,
                                      size: 16),
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
