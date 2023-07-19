import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/providers/bookings_provider/bookingnow_provider.dart';
import 'package:bookingapp/controller/providers/get_user_details.dart';
import 'package:bookingapp/model/bookings/booking_now/booking_now_req.dart';
import 'package:bookingapp/model/bookings/booking_now/bookings_now_resp.dart';
import 'package:bookingapp/presentation/mainscreen/main_screen.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';
import 'package:bookingapp/presentation/widget/succes_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../controller/const/string.dart';

class BookingNowService {
  ///userBooking now service
  static Future<void> bookingStatus(BuildContext context) async {
    final provider = Provider.of<BookingNowProvider>(context, listen: false);
    final navigator = Navigator.of(context);

    BookingNowModel formData = BookingNowModel(
      names: provider.firstNameController.text.trim(),
      lastName: provider.lastNameController.text.trim(),
      phone: provider.phoneController.text.trim(),
      email: provider.emailController.text.trim(),
      address1: provider.address1Controller.text.trim(),
      address2: provider.address2Controller.text.trim(),
      city: provider.cityController.text.trim(),
      pincode: provider.pincodeController.text.trim(),
      dealer: provider.dealerController.text.trim(),
      state: provider.stateController.text.trim(),
      model: provider.carModelController.text.trim(),
      bookingPrice: "5000",
    );
    var requestBody = {'formData': formData.toJson()};
    try {
      final String url = Urls.baseUrl + Urls.bookingnow;
      var response = await http.post(
        Uri.parse(url),
        body: jsonEncode(requestBody),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        log("Success", name: "bookingNow");
        log(response.body);
        var data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          navigator.push(
            MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ),
          );
          provider.clearController();
          var result = data['result'];
          final bookingId = result['_id'];
          log(bookingId, name: "bookingId");
          // ignore: use_build_context_synchronously
          await updateBookingStatus(context, bookingId);
          log('booking success $result');
        } else {
          var message = data['message'];
          log(message);
          // ignore: use_build_context_synchronously
          snakBarWiget(context: context, title: message, clr: kred);
        }
      }
    } catch (e) {
      log("exception: $e");
    }
  }

  //user update booking , that means status converted to placed , otherwise status pending
  static Future<void> updateBookingStatus(ctx, bookingId) async {
    final String url = Urls.baseUrl + Urls.updateBooking;
    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({'params': bookingId}),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        final responseMsg = jsonEncode(response.body);
        successDialogWiget(ctx,
            "Your Booking Is Placed , Our Team Will Contact You", "Placed");
        log(responseMsg);
      } else {
        final responseMsg = jsonEncode(response.body);
        log(responseMsg);
      }
    } catch (e) {
      log(e.toString());
      snakBarWiget(context: ctx, title: e.toString(), clr: kred);
    }
  }

  //********************************************************** */

  ///incase user booked then the ui show booking details

  Future bookingDetails(context) async {
    final String url = Urls.baseUrl + Urls.getUserbooking;

    try {
      final response = await http.post(Uri.parse(url),
          body: {"email": await GetUserDetials.getUSerEmail()});
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (data['status'] == 'success') {
          log(data['success']);
          final List<GetUserBookingDetails> userBookingDetails =
              (data['result'] as List)
                  .map((e) => GetUserBookingDetails.fromJson(e))
                  .toList();
          return userBookingDetails;
        } else {
          log(data['status']);
          snakBarWiget(context: context, title: data['status'], clr: kred);
        }
      } else {
        log(data['message']);
        snakBarWiget(context: context, title: data['message'], clr: kred);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
