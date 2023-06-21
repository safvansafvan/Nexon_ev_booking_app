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
}
