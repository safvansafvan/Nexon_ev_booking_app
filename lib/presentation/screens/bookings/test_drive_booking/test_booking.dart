import 'package:nexonev/controller/providers/dealer_provider.dart';
import 'package:nexonev/controller/providers/get_user_details.dart';
import 'package:nexonev/controller/providers/internet_provider.dart';
import 'package:nexonev/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:nexonev/presentation/widgets/snack_bar.dart';
import 'package:provider/provider.dart';
import '../../../widgets/text_form_common.dart';
import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/presentation/widgets/text_h.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:nexonev/controller/providers/bookings_provider/test_drive_provider.dart';

// ignore: must_be_immutable
class TestDriveBooking extends StatelessWidget {
  TestDriveBooking({super.key});

  GlobalKey<FormState> formKey7 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final userDetails = Provider.of<GetUserDetials>(context, listen: false);
    final tdProvider =
        Provider.of<TestDriveBookingProvider>(context, listen: false);
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 50),
        child: SafeArea(
            child: AppBarWidget(
                title: "Test Drive Bookings",
                leading: Icons.arrow_back_ios_rounded,
                settings: true,
                menu: false)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: formKey7,
          child: ListView(
            children: [
              CustomHeight.heightTen(context),
              HeadingTextWidget(
                text: "Please Fill Your Details",
                color: kBlack,
                fontWeight: FontWeight.w300,
                textSize: 17,
              ),
              CustomHeight.commonHeightz(context),
              TextFormFieldCommon(
                  prefixIcon: const Icon(Icons.person_outline),
                  controller: tdProvider.nameController,
                  hintText: userDetails.userName ?? "Full Name",
                  keyType: TextInputType.name,
                  size: screenSize),
              CustomHeight.heightTen(context),
              Container(
                height: screenSize.height * 0.077,
                decoration: BoxDecoration(
                    border: Border.all(color: kblue), borderRadius: radiusTen),
                child: Center(
                    child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Icon(Icons.email_outlined, color: kBlack),
                    const SizedBox(width: 12),
                    Text(
                      userDetails.userEmail ?? 'Unknown',
                      style: TextStyle(
                        fontSize: screenSize.width * 0.045,
                        color: kBlack,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )),
              ),
              CustomHeight.heightTen(context),
              TextFormFieldCommon(
                  prefixIcon: const Icon(Icons.phone_outlined),
                  controller: tdProvider.phoneController,
                  hintText: "Phone",
                  maxlength: 10,
                  keyType: TextInputType.number,
                  size: screenSize),
              TextFormFieldCommon(
                  prefixIcon: const Icon(Icons.location_city_outlined),
                  controller: tdProvider.cityController,
                  hintText: "City",
                  keyType: TextInputType.name,
                  size: screenSize),
              CustomHeight.heightTen(context),
              Container(
                height: screenSize.height * 0.077,
                decoration: BoxDecoration(
                    border: Border.all(color: kblue), borderRadius: radiusTen),
                child: Center(
                  child: CustomDropdown(
                      excludeSelected: true,
                      hintText: "Select State",
                      hintStyle: TextStyle(color: kBlack),
                      selectedStyle: TextStyle(color: kBlack),
                      items: const ["kerala", "Tamilnadu"],
                      controller: tdProvider.stateController),
                ),
              ),
              CustomHeight.heightTen(context),
              Container(
                height: screenSize.height * 0.077,
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
                      controller: tdProvider.carModelController),
                ),
              ),
              CustomHeight.heightTen(context),
              Container(
                height: screenSize.height * 0.077,
                decoration: BoxDecoration(
                    border: Border.all(color: kblue), borderRadius: radiusTen),
                child: Center(
                  child: Consumer<DealerProvider>(builder: (context, value, _) {
                    List<String> dealerNames =
                        value.dealerList.map((dealer) => dealer.name).toList();
                    if (value.dealerList.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return CustomDropdown(
                        excludeSelected: true,
                        fillColor: Colors.transparent,
                        hintText: "Dealer",
                        hintStyle: TextStyle(color: kBlack),
                        selectedStyle: TextStyle(color: kBlack),
                        items: dealerNames,
                        controller: tdProvider.dealerShipController);
                  }),
                ),
              ),
              CustomHeight.commonHeightz(context),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (formKey7.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape:
                                RoundedRectangleBorder(borderRadius: radiusTen),
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
                                    await handleTestdriveBooking(
                                        context, tdProvider);
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

  Future<void> handleTestdriveBooking(
      ctx, TestDriveBookingProvider value) async {
    final internet = Provider.of<InternetController>(ctx, listen: false);
    if (internet.hasInternet == false) {
      snackBarWidget(
          context: ctx, title: 'Enable Internet Connection', clr: kGreen);
    } else {
      await value.tesDriveBookingButtonClick(ctx);
    }
  }
}
