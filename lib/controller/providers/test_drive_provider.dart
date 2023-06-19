import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/model/dealer/dealer_model.dart';
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
      isLoading = true;
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
    isLoading = false;
  }

  tesDriveBookingButtonClick(context) async {
    // testDriveBookingStatus(context);
    testDriveBooking();
    notifyListeners();
  }

  Future<void> testDriveBooking() async {
    try {
      var url = Urls.baseUrl + Urls.testDriveBooking;

      var formData = {
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'phone': phoneController.text.trim(),
        'city': cityController.text.trim(),
        'state': stateController.text.trim(),
        'model': carModelController.text.trim(),
        'dealership': dealerShipController.text.trim(),
        'checked': true,
      };

      var requestBody = json.encode({'formData': formData});

      var response = await http.post(
        Uri.parse(url),
        body: requestBody,
      );

      if (response.statusCode == 200) {
        // Successful response
        var data = json.decode(response.body);
        if (data['status'] == 'success') {
          // Test drive booking successful
          var result = data['result'];
          log('Test drive booking successful: $result');
        } else {
          // Test drive booking failed
          var message = data['message'];
          log('Test drive booking failed: $message');
        }
      } else {
        // Error occurred during the API call
        log('Error: ${response.statusCode}');
      }
    } catch (error) {
      // Exception occurred
      log('Exception: $error');
    }
  }
}
