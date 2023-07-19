import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/providers/bookings_provider/test_drive_provider.dart';
import 'package:bookingapp/presentation/widget/text_h.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestDriveBookingStatusScreen extends StatelessWidget {
  const TestDriveBookingStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TestDriveBookingProvider>(context, listen: false)
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
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: value.testDriveDetails.length,
                            itemBuilder: (context, index) {
                              final data = value.testDriveDetails[index];
                              return SizedBox(
                                height: screenSize.height * 00.26,
                                width: double.infinity,
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: radiusTen),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Edition: ${data.model}',
                                          style: textStyleFuc(
                                              weight: FontWeight.bold,
                                              color: kBlack,
                                              size: 18),
                                        ),
                                        Text(
                                          'Name:${data.name}',
                                          style: textStyleFuc(
                                              weight: FontWeight.w500,
                                              color: kBlack,
                                              size: 15),
                                        ),
                                        Text(
                                          'Email:${data.email}',
                                          style: textStyleFuc(
                                              weight: FontWeight.w500,
                                              color: kBlack,
                                              size: 15),
                                        ),
                                        Text(
                                          'Phone:${data.phone}',
                                          style: textStyleFuc(
                                              weight: FontWeight.w500,
                                              color: kBlack,
                                              size: 15),
                                        ),
                                        Text(
                                          'State:${data.state}',
                                          style: textStyleFuc(
                                              weight: FontWeight.w500,
                                              color: kBlack,
                                              size: 15),
                                        ),
                                        Text(
                                          'City:${data.city}',
                                          style: textStyleFuc(
                                              weight: FontWeight.w500,
                                              color: kBlack,
                                              size: 15),
                                        ),
                                        Text(
                                          'Dealer:${data.dealership!.isEmpty ? "Not Specified" : data.dealership}',
                                          style: textStyleFuc(
                                              weight: FontWeight.w500,
                                              color: kBlack,
                                              size: 15),
                                        ),
                                        Text(
                                          'Date:${data.createdAt}',
                                          style: textStyleFuc(
                                              weight: FontWeight.w500,
                                              color: kBlack,
                                              size: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
              })
            ],
          ),
        ),
      ),
    );
  }
}
