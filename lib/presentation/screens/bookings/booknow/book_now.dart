import 'dart:developer';
import 'package:nexonev/apiservice/booking/booking_now_service.dart';
import 'package:nexonev/controller/providers/dealer_provider.dart';
import 'package:nexonev/controller/providers/get_user_details.dart';
import 'package:nexonev/presentation/widgets/snack_bar.dart';
import 'package:nexonev/presentation/widgets/succes_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/presentation/widgets/text_form_common.dart';
import 'package:nexonev/presentation/widgets/text_h.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../../../controller/providers/bookings_provider/bookingnow_provider.dart';
import '../../../../controller/providers/internet_provider.dart';
import '../../../widgets/app_bar.dart';

class BookNowWidget extends StatefulWidget {
  const BookNowWidget({super.key});

  @override
  State<BookNowWidget> createState() => _BookNowWidgetState();
}

class _BookNowWidgetState extends State<BookNowWidget> {
  Razorpay? _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSucccess);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
  }

  @override
  Widget build(BuildContext context) {
    final userDetails = Provider.of<GetUserDetials>(context, listen: false);
    var screenSize = MediaQuery.of(context).size;
    final bookingProvider = context.watch<BookingNowProvider>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 50),
        child: SafeArea(
            child: AppBarWidget(
                title: "Ev Bookings",
                leading: Icons.arrow_back_ios_rounded,
                settings: true,
                menu: false)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: bookingProvider.formKey8,
            child: ListView(
              children: [
                CustomHeight.heightTen(context),
                HeadingTextWidget(text: "  Please fill your deatails"),
                CustomHeight.heightTen(context),
                TextFormFieldCommon(
                    prefixIcon: const Icon(Icons.person_outline),
                    controller: bookingProvider.firstNameController,
                    hintText: userDetails.userName ?? 'First Name',
                    keyType: TextInputType.name,
                    size: screenSize),
                CustomHeight.heightTen(context),
                TextFormFieldCommon(
                    prefixIcon: const Icon(Icons.person_outline),
                    controller: bookingProvider.lastNameController,
                    hintText: "Last Name",
                    keyType: TextInputType.name,
                    size: screenSize),
                CustomHeight.heightTen(context),
                Container(
                  height: screenSize.height * 0.077,
                  decoration: BoxDecoration(
                      border: Border.all(color: kblue),
                      borderRadius: radiusTen),
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
                    ),
                  ),
                ),
                CustomHeight.heightTen(context),
                TextFormFieldCommon(
                    prefixIcon: const Icon(Icons.phone_outlined),
                    controller: bookingProvider.phoneController,
                    hintText: "Phone",
                    maxlength: 10,
                    keyType: TextInputType.phone,
                    size: screenSize),
                CustomHeight.heightTen(context),
                HeadingTextWidget(text: "Billing Address"),
                CustomHeight.heightTen(context),
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
                CustomHeight.heightTen(context),
                TextFormFieldCommon(
                    prefixIcon: const Icon(Icons.location_city_outlined),
                    controller: bookingProvider.cityController,
                    hintText: "City",
                    keyType: TextInputType.name,
                    size: screenSize),
                CustomHeight.heightTen(context),
                TextFormFieldCommon(
                    prefixIcon: const Icon(Icons.location_on_outlined),
                    controller: bookingProvider.address1Controller,
                    hintText: "Address1",
                    maxlength: 15,
                    keyType: TextInputType.name,
                    size: screenSize),
                TextFormFieldCommon(
                    prefixIcon: const Icon(Icons.location_on_outlined),
                    controller: bookingProvider.address2Controller,
                    hintText: "Address2",
                    maxlength: 15,
                    keyType: TextInputType.name,
                    size: screenSize),
                TextFormFieldCommon(
                    prefixIcon: const Icon(Icons.pin),
                    controller: bookingProvider.pincodeController,
                    hintText: "Pincode",
                    maxlength: 6,
                    keyType: TextInputType.number,
                    size: screenSize),
                HeadingTextWidget(text: "Dealer information"),
                CustomHeight.heightTen(context),
                Container(
                  height: screenSize.height * 0.077,
                  decoration: BoxDecoration(
                      border: Border.all(color: kblue),
                      borderRadius: radiusTen),
                  child: Center(
                    child:
                        Consumer<DealerProvider>(builder: (context, value, _) {
                      List<String> dealerNames = value.dealerList
                          .map((dealer) => dealer.name)
                          .toList();
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
                          controller: bookingProvider.dealerController);
                    }),
                  ),
                ),
                CustomHeight.heightTen(context),
                HeadingTextWidget(text: "Select Veriant"),
                CustomHeight.heightTen(context),
                Container(
                  height: screenSize.height * 0.077,
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
                CustomHeight.heightTen(context),
                HeadingTextWidget(text: "Amount Payable"),
                CustomHeight.heightTen(context),
                Container(
                  height: screenSize.height * 0.077,
                  decoration: BoxDecoration(
                      border: Border.all(color: kblue),
                      borderRadius: radiusTen),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Booking Amound Of Nexon Ev"),
                        Text("5000")
                      ],
                    ),
                  ),
                ),
                CustomHeight.heightTen(context),
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
                CustomHeight.heightTen(context),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (bookingProvider.formKey8.currentState!.validate()) {
                        submittButtonClick(bookingProvider);
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

  Future makePaymet() async {
    var options = {
      'key': 'rzp_test_XD8ZNhIAt6i1AM',
      'amount': 500000,
      'name': 'Nexon Ev Payment',
      'description': '',
      'prefill': {'contact': '+918756896578', 'email': 'contact@gmail.com'}
    };
    try {
      _razorpay?.open(options);
    } catch (e) {
      log(e.toString());
    }
  }

  void submittButtonClick(BookingNowProvider bookingProvider) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: radiusTen),
          title: const Text("Conform Message"),
          content: const Text("Are you sure to continue Ev booking?"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancel")),
            TextButton(
                onPressed: () async {
                  final internet =
                      Provider.of<InternetController>(context, listen: false);
                  await internet.checkConnection();
                  if (internet.hasInternet == false) {
                    // ignore: use_build_context_synchronously
                    snackBarWidget(
                        context: context,
                        title: 'Enable Internet Connection',
                        clr: kGreen);
                  } else {
                    await makePaymet().then((value) async {
                      await bookingProvider.bookingNowbuttonClick(context);
                    });
                  }
                },
                child: const Text("Ok"))
          ],
        );
      },
    );
  }

  void handlePaymentSucccess(PaymentSuccessResponse response) async {
    await BookingNowService.updateBooking(context);
    Fluttertoast.showToast(
        msg: "SUCCESS PAYMENT:${response.paymentId}", timeInSecForIosWeb: 4);
    // ignore: use_build_context_synchronously
    successDialogWiget(
        context,
        "You Booking Is Success Full And Our Team Will Contact You ",
        "Success");
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR HERE:${response.code},${response.message}");
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL WALLET IS:${response.walletName}",
        timeInSecForIosWeb: 4);
  }
}
