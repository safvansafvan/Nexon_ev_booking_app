import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/presentation/screens/bookings/booknow/book_now.dart';
import 'package:nexonev/presentation/screens/bookings/test_drive_booking/test_booking.dart';
import 'package:flutter/material.dart';

class BookingsField extends StatelessWidget {
  const BookingsField({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: screenSize.height * 0.08,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 5,
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: radiusTen),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TestDriveBooking(),
                ),
              );
            },
            child: Text(
              "Book A Test Drive",
              style: textStyleFuc(
                  weight: FontWeight.w600, color: kwhite, size: 14),
            ),
          ),
        ),
        SizedBox(
          height: screenSize.height * 0.08,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 5,
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: radiusTen),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BookNowWidget(),
                ),
              );
            },
            child: Text(
              "Book Now",
              style: textStyleFuc(
                  weight: FontWeight.w600, color: kwhite, size: 14),
            ),
          ),
        ),
      ],
    );
  }
}
