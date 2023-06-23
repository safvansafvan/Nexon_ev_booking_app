import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/presentation/widget/text_form_common.dart';
import 'package:bookingapp/presentation/widget/text_h.dart';
import '../../../controller/providers/bookings_provider/bookingnow_provider.dart';
import '../../../controller/providers/bookings_provider/test_drive_provider.dart';

class BookNowWidget extends StatelessWidget {
  const BookNowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final bookingProvider = context.watch<BookingNowProvider>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: bookingProvider.formKey8,
            child: ListView(
              children: [
                height10,
                HeadingTextWidget(
                  text: "Booking Now",
                  color: kBlack,
                  fontWeight: FontWeight.w600,
                  textSize: 20,
                  underline: true,
                ),
                kHeightFive,
                HeadingTextWidget(text: "Please fill your deatails"),
                kHeightFive,
                TextFormFieldCommon(
                    controller: bookingProvider.firstNameController,
                    hintText: "First Name",
                    keyType: TextInputType.name,
                    size: screenSize),
                height10,
                TextFormFieldCommon(
                    controller: bookingProvider.lastNameController,
                    hintText: "Last Name",
                    keyType: TextInputType.name,
                    size: screenSize),
                height10,
                TextFormFieldCommon(
                    controller: bookingProvider.emailController,
                    hintText: "Email",
                    keyType: TextInputType.emailAddress,
                    size: screenSize),
                height10,
                TextFormFieldCommon(
                    controller: bookingProvider.phoneController,
                    hintText: "Phone",
                    maxlength: 10,
                    keyType: TextInputType.phone,
                    size: screenSize),
                kHeightFive,
                HeadingTextWidget(text: "Billing Address"),
                height10,
                Container(
                  height: 63,
                  decoration: BoxDecoration(
                      border: Border.all(color: kblue),
                      borderRadius: radiusTen),
                  child: Center(
                    child: CustomDropdown(
                        excludeSelected: true,
                        hintText: "Select State",
                        hintStyle: TextStyle(color: kBlack),
                        selectedStyle: TextStyle(color: kBlack),
                        items: const ["kerala", "Tamilnadu"],
                        controller: bookingProvider.stateController),
                  ),
                ),
                height10,
                TextFormFieldCommon(
                    controller: bookingProvider.cityController,
                    hintText: "City",
                    keyType: TextInputType.name,
                    size: screenSize),
                height10,
                TextFormFieldCommon(
                    controller: bookingProvider.address1Controller,
                    hintText: "Address1",
                    maxlength: 15,
                    keyType: TextInputType.name,
                    size: screenSize),
                kHeightFive,
                TextFormFieldCommon(
                    controller: bookingProvider.address2Controller,
                    hintText: "Address2",
                    maxlength: 15,
                    keyType: TextInputType.name,
                    size: screenSize),
                kHeightFive,
                TextFormFieldCommon(
                    controller: bookingProvider.pincodeController,
                    hintText: "Pincode",
                    maxlength: 6,
                    keyType: TextInputType.number,
                    size: screenSize),
                kHeightFive,
                HeadingTextWidget(text: "Dealer information"),
                height10,
                Container(
                  height: 63,
                  decoration: BoxDecoration(
                      border: Border.all(color: kblue),
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
                          hintStyle: TextStyle(color: kBlack),
                          selectedStyle: TextStyle(color: kBlack),
                          items: [
                            value.dealerList[0].dealerName,
                            value.dealerList[1].dealerName,
                            value.dealerList[2].dealerName,
                            value.dealerList[3].dealerName
                          ],
                          controller: bookingProvider.dealerController);
                    }),
                  ),
                ),
                kHeightFive,
                HeadingTextWidget(text: "Select Veriant"),
                height10,
                Container(
                  height: 63,
                  decoration: BoxDecoration(
                      border: Border.all(color: kblue),
                      borderRadius: radiusTen),
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
                        controller: bookingProvider.carModelController),
                  ),
                ),
                kHeightFive,
                HeadingTextWidget(text: "Amount Payable"),
                height10,
                Container(
                  height: 63,
                  decoration: BoxDecoration(
                      border: Border.all(color: kblue),
                      borderRadius: radiusTen),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Booking Amount\nNexon Ev"),
                        Text("5000")
                      ],
                    ),
                  ),
                ),
                height10,
                const Text(
                    "This is the booking amount. Rest of the amount will be payable at the dealership selected."),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: kblue),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Total"), Text("5000")],
                    ),
                  ),
                ),
                height10,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (bookingProvider.formKey8.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Conform Message"),
                              content: const Text(
                                  "Are you sure to continue booking?"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Cancel")),
                                TextButton(
                                    onPressed: () async {
                                      await bookingProvider
                                          .bookingNowbuttonClick(context);
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
      ),
    );
  }
}
