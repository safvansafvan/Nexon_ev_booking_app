import 'package:bookingapp/controller/providers/verifyotp.dart';
import 'package:bookingapp/presentation/widget/otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/const/const.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final otpVerifyProvider =
        Provider.of<VerifyOtpProvider>(context, listen: false);
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          ListTile(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 50, right: 15),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "OTP Verification",
                    style: textStyleFuc(
                        weight: FontWeight.w900, color: kBlack, size: 25),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                      "Enter the verification code we just sent on\nemail address"),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OtpTextField(controller: otpVerifyProvider.otpNumone),
                        OtpTextField(controller: otpVerifyProvider.otpNumTwo),
                        OtpTextField(controller: otpVerifyProvider.otpNumThree),
                        OtpTextField(controller: otpVerifyProvider.otpNumFour),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    height: screenHeight * 0.07,
                    color: const Color.fromARGB(255, 241, 239, 239),
                    child: OutlinedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(borderRadius: radiusTen)),
                        ),
                        onPressed: () async {
                          // if (otpVerifyProvider.globelKey3.currentState!
                          //     .validate()) {
                          await context
                              .read<VerifyOtpProvider>()
                              .getOtpVerifyButtonClick(context);
                        },
                        child: Text(
                          'Verify',
                          style: textStyleFuc(
                              weight: FontWeight.w500, color: null, size: 16),
                        )),
                  ),
                  SizedBox(
                    height: screenHeight * 0.09,
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: radiusTen,
                      image: const DecorationImage(
                        colorFilter: ColorFilter.mode(
                          Colors.white,
                          BlendMode.darken,
                        ),
                        fit: BoxFit.cover,
                        image: AssetImage("assets/nexonOt.webp"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
