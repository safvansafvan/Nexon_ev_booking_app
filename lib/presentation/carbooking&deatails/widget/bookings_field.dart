import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/presentation/booknow/book_now.dart';
import 'package:bookingapp/presentation/test_drive_booking/test_booking.dart';
import 'package:flutter/material.dart';

class BookingsField extends StatelessWidget {
  const BookingsField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 2,
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: radiusTen),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TestDriveBooking(),
                ),
              );
            },
            child: const Text("Book A Test Drive"),
          ),
        ),
        SizedBox(
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 2,
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
            child: const Text("Book Now"),
          ),
        ),
      ],
    );
  }
}
