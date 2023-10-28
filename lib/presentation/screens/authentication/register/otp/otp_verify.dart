import 'package:lottie/lottie.dart';
import 'package:nexonev/controller/providers/authentication/otp_provider.dart';
import 'package:nexonev/controller/providers/internet_provider.dart';
import 'package:nexonev/presentation/screens/authentication/register/otp/widget/header_widget.dart';
import 'package:nexonev/presentation/screens/authentication/widget/otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../controller/core/constant.dart';
import '../../../../../controller/providers/authentication/otpverify_signup.dart';
import '../../../../widgets/snack_bar.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final otpProvider = context.watch<OtpProvider>();
    return Scaffold(
      backgroundColor: loginBackground,
      appBar: AppBar(
        backgroundColor: loginBackground,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Consumer<OtpVerificationAndSignupProvider>(
              builder: (context, value, _) {
            return Form(
              key: otpProvider.formKey3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headerWidgets(context),
                  CustomHeight.commonHeightz(context),
                  Center(
                      child: Lottie.asset(
                    'assets/animations/otp1.json',
                    height: 200,
                    width: 200,
                  )),
                  CustomHeight.commonHeightz(context),
                  Form(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OtpTextField(controller: otpProvider.otpNumone),
                        OtpTextField(controller: otpProvider.otpNumTwo),
                        OtpTextField(controller: otpProvider.otpNumThree),
                        OtpTextField(controller: otpProvider.otpNumFour),
                      ],
                    ),
                  ),
                  CustomHeight.commonHeightz(context),
                  InkWell(
                    onTap: () async {
                      await handleOtpVerify(otpProvider, value, context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      decoration:
                          BoxDecoration(color: kBlack, borderRadius: radiusTen),
                      child: Center(
                        child: value.isLoading
                            ? const CircularProgressIndicator()
                            : Text(
                                'Login',
                                style: textStyleFuc(
                                    weight: FontWeight.bold,
                                    color: kwhite,
                                    size: 16),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Future<void> handleOtpVerify(OtpProvider otpProvider,
      OtpVerificationAndSignupProvider value, ctx) async {
    final internetController =
        Provider.of<InternetController>(ctx, listen: false);
    if (otpProvider.formKey3.currentState!.validate()) {
      await internetController.checkConnection();
      if (internetController.hasInternet == false) {
        snackBarWidget(
            context: ctx, title: 'Enable Internet Connection', clr: kGreen);
      } else {
        await value.getOtpVerificationButtonClick(ctx);
      }
    }
  }
}
