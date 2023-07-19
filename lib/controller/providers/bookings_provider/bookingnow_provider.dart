import 'package:bookingapp/apiservice/booking/booking_now_service.dart';
import 'package:flutter/material.dart';

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
    isLoading = true;
    notifyListeners();
    await BookingNowService.bookingStatus(context);
    isLoading = false;
    notifyListeners();
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
