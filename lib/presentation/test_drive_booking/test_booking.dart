import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/providers/test_drive_provider.dart';
import 'package:bookingapp/presentation/widget/text_h.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/text_form_common.dart';

class TestDriveBooking extends StatelessWidget {
  const TestDriveBooking({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TestDriveBookingProvider>(context, listen: false)
          .fetchDealer();
    });
    final testDriveProvider =
        Provider.of<TestDriveBookingProvider>(context, listen: false);

    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          HeadingTextWidget(
            text: "Test Drive Booking",
            color: kwhite,
            fontWeight: FontWeight.w500,
            textSize: 23,
            underline: true,
          ),
          height10,
          HeadingTextWidget(
            text: "Please fill in your details",
            color: kwhite,
            fontWeight: FontWeight.w300,
            textSize: 15,
          ),
          TextFormFieldCommon(
              prefixIcon: const Icon(Icons.person_outline),
              controller: testDriveProvider.nameController,
              hintText: "Full Name",
              keyType: TextInputType.name,
              size: screenSize),
          height10,
          TextFormFieldCommon(
              prefixIcon: const Icon(Icons.email_outlined),
              controller: testDriveProvider.emailController,
              hintText: "Email",
              keyType: TextInputType.emailAddress,
              size: screenSize),
          height10,
          TextFormFieldCommon(
              prefixIcon: const Icon(Icons.phone_outlined),
              controller: testDriveProvider.phoneController,
              hintText: "Phone",
              maxlength: 10,
              keyType: TextInputType.number,
              size: screenSize),
          height10,
          TextFormFieldCommon(
              prefixIcon: const Icon(Icons.location_city_outlined),
              controller: testDriveProvider.cityController,
              hintText: "City",
              keyType: TextInputType.name,
              size: screenSize),
          height10,
          Container(
            height: 63,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: radiusTen),
            child: Center(
              child: CustomDropdown(
                  excludeSelected: true,
                  fillColor: Colors.transparent,
                  hintText: "Select State",
                  hintStyle: TextStyle(color: kwhite),
                  selectedStyle: TextStyle(color: kwhite),
                  items: const ["kerala", "Tamilnadu"],
                  controller: testDriveProvider.stateController),
            ),
          ),
          height10,
          Container(
            height: 63,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: radiusTen),
            child: Center(
              child: CustomDropdown(
                  excludeSelected: true,
                  fillColor: Colors.transparent,
                  hintText: "Select An Ev",
                  hintStyle: TextStyle(color: kwhite),
                  selectedStyle: TextStyle(color: kwhite),
                  items: const [
                    "Nexon Ev Prime",
                    "Nexon Ev Max",
                    "Nexon Ev Dart"
                  ],
                  controller: testDriveProvider.carModelController),
            ),
          ),
          height10,
          Container(
            height: 63,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: radiusTen),
            child: Center(
              child: Consumer<TestDriveBookingProvider>(
                  builder: (context, value, _) {
                if (value.dealerList.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CustomDropdown(
                    excludeSelected: true,
                    fillColor: Colors.transparent,
                    hintText: "Dealer",
                    hintStyle: TextStyle(color: kwhite),
                    selectedStyle: TextStyle(color: kwhite),
                    items: [
                      value.dealerList[0].dealerName,
                      value.dealerList[1].dealerName,
                      value.dealerList[2].dealerName,
                      value.dealerList[3].dealerName
                    ],
                    controller: testDriveProvider.dealerShipController);
              }),
            ),
          ),
          height10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: ElevatedButton.icon(
              onPressed: () async {
                await testDriveProvider.tesDriveBookingButtonClick(context);
              },
              icon: const Icon(Icons.done_sharp),
              label: const Text("Submit"),
            ),
          )
        ],
      ),
    );
  }
}
