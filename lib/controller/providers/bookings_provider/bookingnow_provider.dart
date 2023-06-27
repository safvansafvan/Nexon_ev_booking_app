import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/const/string.dart';
import 'package:bookingapp/model/booking_now_model.dart';
import 'package:bookingapp/presentation/mainscreen/main_screen.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookingNowProvider extends ChangeNotifier {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  //billing
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  TextEditingController dealerController = TextEditingController();
  TextEditingController carModelController = TextEditingController();

  final formKey8 = GlobalKey<FormState>();

  bool isLoading = false;

  Future bookingNowbuttonClick(context) async {
    await bookingStatus(context);
    notifyListeners();
  }

  Future<void> bookingStatus(BuildContext context) async {
    final navigator = Navigator.of(context);
    isLoading = true;

    BookingNowModel formData = BookingNowModel(
      names: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      phone: phoneController.text.trim(),
      email: emailController.text.trim(),
      address1: address1Controller.text.trim(),
      address2: address2Controller.text.trim(),
      city: cityController.text.trim(),
      pincode: pincodeController.text.trim(),
      dealer: dealerController.text.trim(),
      state: stateController.text.trim(),
      model: carModelController.text.trim(),
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
          clearController();
          // ignore: use_build_context_synchronously
          var result = data['result'];
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
      snakBarWiget(context: context, title: e.toString(), clr: kred);
    }

    isLoading = false;
  }

  clearController() {
    firstNameController.clear();
    lastNameController.clear();
    phoneController.clear();
    emailController.clear();
    address1Controller.clear();
    address2Controller.clear();
    cityController.clear();
    stateController.clear();
    pincodeController.clear();
    dealerController.clear();
    carModelController.clear();
  }
}
