import 'package:bookingapp/controller/providers/dealer_provider.dart';
import 'package:bookingapp/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../widgets/text_form_common.dart';
import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/presentation/widgets/text_h.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:bookingapp/controller/providers/bookings_provider/test_drive_provider.dart';

class TestDriveBooking extends StatelessWidget {
  const TestDriveBooking({super.key});

  @override
  Widget build(BuildContext context) {
    final testDriveProvider =
        Provider.of<TestDriveBookingProvider>(context, listen: false);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 50),
        child: SafeArea(
            child: AppBarWidget(
                title: "Test Drive Booking",
                leading: Icons.arrow_back_ios_rounded,
                settings: false,
                menu: false)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: testDriveProvider.formKey7,
          child: ListView(
            children: [
              height10,
              HeadingTextWidget(
                text: "Please fill in your details",
                color: kBlack,
                fontWeight: FontWeight.w300,
                textSize: 17,
                underline: true,
              ),
              commonHeight,
              TextFormFieldCommon(
                  prefixIcon: const Icon(Icons.person_outline),
                  controller: testDriveProvider.nameController,
                  hintText: "Full Name",
                  keyType: TextInputType.name,
                  size: screenSize),
              kHeight15,
              TextFormFieldCommon(
                  prefixIcon: const Icon(Icons.email_outlined),
                  controller: testDriveProvider.emailController,
                  hintText: "Email",
                  keyType: TextInputType.emailAddress,
                  size: screenSize),
              kHeight15,
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
              kHeight15,
              Container(
                height: 63,
                decoration: BoxDecoration(
                    border: Border.all(color: kblue), borderRadius: radiusTen),
                child: Center(
                  child: CustomDropdown(
                      excludeSelected: true,
                      hintText: "Select State",
                      hintStyle: TextStyle(color: kBlack),
                      selectedStyle: TextStyle(color: kBlack),
                      items: const ["kerala", "Tamilnadu"],
                      controller: testDriveProvider.stateController),
                ),
              ),
              kHeight15,
              Container(
                height: 63,
                decoration: BoxDecoration(
                    border: Border.all(color: kblue), borderRadius: radiusTen),
                child: Center(
                  child: CustomDropdown(
                      excludeSelected: true,
                      fillColor: Colors.transparent,
                      hintText: "Select An Ev",
                      hintStyle: TextStyle(color: kBlack),
                      selectedStyle: TextStyle(color: kBlack),
                      items: const [
                        "Nexon Ev Prime",
                        "Nexon Ev Max",
                        "Nexon Ev Dark"
                      ],
                      controller: testDriveProvider.carModelController),
                ),
              ),
              kHeight15,
              Container(
                height: 63,
                decoration: BoxDecoration(
                    border: Border.all(color: kblue), borderRadius: radiusTen),
                child: Center(
                  child: Consumer<DealerProvider>(builder: (context, value, _) {
                    if (value.dealerList.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return CustomDropdown(
                        excludeSelected: true,
                        fillColor: Colors.transparent,
                        hintText: "Dealer",
                        hintStyle: TextStyle(color: kBlack),
                        selectedStyle: TextStyle(color: kBlack),
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
              kHeight15,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (testDriveProvider.formKey7.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Conform Message"),
                            content: const Text(
                                "Are you sure to continue test drive booking?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Cancel")),
                              TextButton(
                                  onPressed: () async {
                                    await testDriveProvider
                                        .tesDriveBookingButtonClick(context);
                                  },
                                  child: const Text("Ok"))
                            ],
                          );
                        },
                      );
                    }
                  },
                  icon: const Icon(Icons.done_sharp),
                  label: const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
