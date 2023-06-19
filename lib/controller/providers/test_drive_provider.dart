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
}
