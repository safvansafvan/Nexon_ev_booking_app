import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/controller/providers/bookings_provider/test_drive_provider.dart';
import 'package:bookingapp/model/bookings/test_drive/test_drive_req.dart';
import 'package:bookingapp/presentation/mainscreen/main_screen.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';
import 'package:bookingapp/presentation/widget/succes_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class TestDriveService {
  static Future<void> testDriveBooking(context) async {
    final provider =
        Provider.of<TestDriveBookingProvider>(context, listen: false);
    final String url = Urls.baseUrl + Urls.testDriveBooking;

    TestDriveBookingModel formData = TestDriveBookingModel(
        name: provider.nameController.text.trim(),
        phone: provider.phoneController.text.trim(),
        email: provider.emailController.text.trim(),
        city: provider.cityController.text.trim(),
        state: provider.stateController.text.trim(),
        dealership: provider.dealerShipController.text.trim(),
        model: provider.carModelController.text.trim(),
        checked: true);
    var requestBody = json.encode({'formData': formData});
    try {
      var response = await http.post(
        Uri.parse(url),
        body: requestBody,
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data['status'] == 'success') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ),
          );
          provider.clearController();
          successDialogWiget(
              context,
              "Your Test Drive Booking Is Success, Our Team Will Contact You As Soon As Possible",
              "Success");
          var result = data['result'];
          log('Test drive booking successful: $result');
        } else {
          var message = data['message'];
          log('Test drive booking failed: $message');
          snakBarWiget(context: context, title: "Booking Failed", clr: kred);
        }
      } else {
        log('Error: ${response.statusCode}');
        snakBarWiget(context: context, title: "Network Issue", clr: kred);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
