import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/model/dealer/dealer_model.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';
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
  final formKey7 = GlobalKey<FormState>();

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
    await testDriveBooking(context);
    notifyListeners();
  }

  Future<void> testDriveBooking(context) async {
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
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data['status'] == 'success') {
          awesome(context);
          clearController();
          var result = data['result'];
          log('Test drive booking successful: $result');
        } else {
          var message = data['message'];
          log('Test drive booking failed: $message');
          snakBarWiget(context: context, title: "Booking Failed", clr: kred);
        }
      } else {
        log('Error: ${response.statusCode}');
        snakBarWiget(context: context, title: "Something Wrong", clr: kred);
      }
    } catch (error) {
      log('Exception: $error');
    }
  }

  clearController() {
    nameController.clear();
    emailController.clear();
    cityController.clear();
    phoneController.clear();
    stateController.clear();
    carModelController.clear();
    dealerShipController.clear();
  }
}

void awesome(context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.SUCCES,
    animType: AnimType.BOTTOMSLIDE,
    // showCloseIcon: true,
    title: "Success",
    desc:
        "Your Test Drive Booking Is Success, Our Team Will Contact You As Soon As Possible",
    btnCancelText: "Cancel",
    btnCancelOnPress: () {
      Navigator.of(context)
          .pop(); // Function to execute when cancel button is pressed
    },
  ).show();
}
