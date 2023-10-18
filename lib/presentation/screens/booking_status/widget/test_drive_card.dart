import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/controller/providers/bookings_provider/test_drive_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TestDriveCard extends StatelessWidget {
  const TestDriveCard(
      {super.key, required this.screenSize, required this.value});

  final Size screenSize;
  final TestDriveBookingProvider value;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: value.testDriveDetails.length,
      itemBuilder: (context, index) {
        final data = value.testDriveDetails[index];
        final date = DateFormat.yMEd().format(data.createdAt!.toLocal());
        return SizedBox(
          width: double.infinity,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: radiusTen),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Edition: ${data.model}',
                    style: textStyleFuc(
                        weight: FontWeight.bold, color: kBlack, size: 18),
                  ),
                  Text(
                    'Name:${data.name}',
                    style: textStyleFuc(
                        weight: FontWeight.w500, color: kBlack, size: 15),
                  ),
                  Text(
                    'Email:${data.email}',
                    style: textStyleFuc(
                        weight: FontWeight.w500, color: kBlack, size: 15),
                  ),
                  Text(
                    'Phone:${data.phone}',
                    style: textStyleFuc(
                        weight: FontWeight.w500, color: kBlack, size: 15),
                  ),
                  Text(
                    'State:${data.state}',
                    style: textStyleFuc(
                        weight: FontWeight.w500, color: kBlack, size: 15),
                  ),
                  Text(
                    'City:${data.city}',
                    style: textStyleFuc(
                        weight: FontWeight.w500, color: kBlack, size: 15),
                  ),
                  Text(
                    'Dealer:${data.dealership!.isEmpty ? "Not Specified" : data.dealership}',
                    style: textStyleFuc(
                        weight: FontWeight.w500, color: kBlack, size: 15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date: $date',
                        style: textStyleFuc(
                            weight: FontWeight.bold, color: kBlack, size: 15),
                      ),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: Card(
                          elevation: 5,
                          color: kblue,
                          child: Center(
                            child: Text(
                              data.status.toString(),
                              style: textStyleFuc(
                                  weight: FontWeight.w500,
                                  color: kwhite,
                                  size: 15),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
