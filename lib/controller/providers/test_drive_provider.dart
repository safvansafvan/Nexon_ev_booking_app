import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/apiservice/api.dart';
import 'package:bookingapp/apiservice/status.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/model/dealer/dealer_model.dart';
import 'package:bookingapp/model/dealer/test_drive_booking/test_drive_mode.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestDriveBookingProvider with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  ///dropdowncontroller
  TextEditingController stateController = TextEditingController();
  TextEditingController carModelController = TextEditingController();
  TextEditingController dealerShipController = TextEditingController();
  List<Dealer> dealerList = [];
  final String url = Urls.baseUrl + Urls.dealer;

  bool isLoading = false;

  Future<void> fetchDealer() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        dealerList = List<Dealer>.from(
          data['result'].map((dealer) =>
              Dealer(dealerName: dealer['dealerName'], city: dealer['city'])),
        );
        notifyListeners();
      } else {
        log('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      log('Error occurred: $error');
    }
  }

  tesDriveBookingButtonClick(context) async {
    testDriveBookingStatus(context);
    notifyListeners();
  }

  Future<void> testDriveBookingStatus(context) async {
    isLoading = true;
    final String url = Urls.baseUrl + Urls.testDriveBooking;
    final response =
        ApiServices.postMethod(url: url, context: context, data: bodyData());

    if (response is Success) {
      log("success", name: "testDrive ");
      return log("$response");
    }
    if (response is Failures) {
      log("failure", name: "test Drive");
      log("$response");
    }
    isLoading = false;
  }

  Map<String, dynamic> bodyData() {
    final body = TestDriveBookingModel(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        city: cityController.text.trim(),
        state: stateController.text.trim(),
        model: carModelController.text.trim(),
        dealerShip: dealerShipController.text.trim());
    return body.toJson();
  }
}
