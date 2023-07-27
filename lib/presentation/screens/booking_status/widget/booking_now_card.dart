import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/controller/providers/bookings_provider/bookingnow_provider.dart';
import 'package:flutter/material.dart';

class BookingNowCard extends StatelessWidget {
  const BookingNowCard({super.key, required this.value});
  final BookingNowProvider value;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: value.userBookingDetails.length,
      itemBuilder: (context, index) {
        final data = value.userBookingDetails[index];
        String? firstName = data.names;
        String? lastName = data.lastName;
        String fullName = (firstName ?? '') + (lastName ?? '');
        return SizedBox(
          height: screenSize.height * 00.37,
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
                    'Name: $fullName',
                    style: textStyleFuc(
                        weight: FontWeight.w500, color: kBlack, size: 15),
                  ),
                  Text(
                    'Email: ${data.email}',
                    style: textStyleFuc(
                        weight: FontWeight.w500, color: kBlack, size: 15),
                  ),
                  Text(
                    'Phone: ${data.phone}',
                    style: textStyleFuc(
                        weight: FontWeight.w500, color: kBlack, size: 15),
                  ),
                  Text(
                    'State: ${data.state}',
                    style: textStyleFuc(
                        weight: FontWeight.w500, color: kBlack, size: 15),
                  ),
                  Text(
                    'City: ${data.city}',
                    style: textStyleFuc(
                        weight: FontWeight.w500, color: kBlack, size: 15),
                  ),
                  Text(
                    'Address1: ${data.address1}',
                    style: textStyleFuc(
                        weight: FontWeight.w500, color: kBlack, size: 15),
                  ),
                  Text(
                    'Address2: ${data.address2}',
                    style: textStyleFuc(
                        weight: FontWeight.w500, color: kBlack, size: 15),
                  ),
                  Text(
                    'Dealer: ${data.dealer}',
                    style: textStyleFuc(
                        weight: FontWeight.w500, color: kBlack, size: 15),
                  ),
                  Text(
                    'Date: ${data.createdAt}',
                    style: textStyleFuc(
                        weight: FontWeight.w500, color: kBlack, size: 15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Amount: ${data.bookingPrice}',
                        style: textStyleFuc(
                            weight: FontWeight.bold, color: kBlack, size: 15),
                      ),
                      data.status == 'Delivered'
                          ? SizedBox(
                              height: 40,
                              width: 100,
                              child: Card(
                                elevation: 5,
                                color: kGreen,
                                child: Center(
                                  child: Text(
                                    data.status.toString(),
                                    style: textStyleFuc(
                                        weight: FontWeight.w500,
                                        color: kBlack,
                                        size: 15),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(
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
