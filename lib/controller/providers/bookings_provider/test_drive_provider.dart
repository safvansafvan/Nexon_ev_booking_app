import 'package:bookingapp/apiservice/booking/test_drive_service.dart';
import 'package:bookingapp/model/bookings/test_drive/test_drive_resp.dart';
import 'package:flutter/material.dart';

class TestDriveBookingProvider with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  ///dropdowncontroller
  TextEditingController stateController = TextEditingController();
  TextEditingController carModelController = TextEditingController();
  TextEditingController dealerShipController = TextEditingController();

  final formKey7 = GlobalKey<FormState>();
  bool isLoading = false;
  List<GetTestDriveStatus> testDriveDetails = [];

  tesDriveBookingButtonClick(context) async {
    await TestDriveService.testDriveBooking(context);
    notifyListeners();
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

  Future getTestDriveDetails(context) async {
    isLoading = true;
    notifyListeners();
    testDriveDetails = await TestDriveService.getTestDriveStatus(context);
    isLoading = false;
    notifyListeners();
  }
}
