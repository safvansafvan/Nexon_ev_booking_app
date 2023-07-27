import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/controller/providers/bookings_provider/bookingnow_provider.dart';
import 'package:bookingapp/presentation/screens/booking_status/widget/booking_now_card.dart';
import 'package:bookingapp/presentation/widget/text_h.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingStatusScreen extends StatelessWidget {
  const BookingStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BookingNowProvider>(context, listen: false)
          .getBookingDetails(context);
    });

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
                      text: "Booking Status ",
                      color: kBlack,
                      fontWeight: FontWeight.w600,
                      underline: true,
                      textSize: 18,
                    ),
                  ),
                ],
              ),
              commonHeight,
              Consumer<BookingNowProvider>(builder: (context, value, _) {
                return value.isGetDetailsLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : value.userBookingDetails.isEmpty
                        ? SizedBox(
                            height: 100,
                            width: 100,
                            child: Card(
                              elevation: 6,
                              child: Center(
                                child: Text(
                                  "Your Booking Is Empty",
                                  style: textStyleFuc(
                                      weight: FontWeight.bold,
                                      color: kred,
                                      size: 16),
                                ),
                              ),
                            ),
                          )
                        : BookingNowCard(value: value);
              })
            ],
          ),
        ),
      ),
    );
  }
}
