import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/controller/providers/bookings_provider/bookingnow_provider.dart';
import 'package:nexonev/presentation/screens/booking_status/widget/booking_now_card.dart';
import 'package:nexonev/presentation/widgets/text_h.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingStatusScreen extends StatelessWidget {
  const BookingStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<BookingNowProvider>(context, listen: false)
          .getBookingDetails(context);
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: HeadingTextWidget(
          text: "Booking Status ",
          color: kBlack,
          fontWeight: FontWeight.w600,
          textSize: 18,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Consumer<BookingNowProvider>(builder: (context, value, _) {
                return value.isGetDetailsLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : value.userBookingDetails.isEmpty
                        ? SizedBox(
                            height: screenSize.height * 0.15,
                            child: Card(
                              elevation: 10,
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
