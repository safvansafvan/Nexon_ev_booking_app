import 'package:lottie/lottie.dart';
import 'package:nexonev/controller/providers/authentication/otp_provider.dart';
import 'package:nexonev/controller/providers/internet_provider.dart';
import 'package:nexonev/presentation/screens/authentication/signup/otp/widget/header_widget.dart';
import 'package:nexonev/presentation/screens/authentication/widget/otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../controller/core/constant.dart';
import '../../../../../controller/providers/authentication/otpverify_signup.dart';
import '../../../../widgets/snack_bar.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});
  GlobalKey<FormState> formKey3 = GlobalKey<FormState>();

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
              key: formKey3,
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
                      if (formKey3.currentState!.validate()) {
                        await handleOtpVerify(otpProvider, value, context);
                      }
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

    await internetController.checkConnection();
    if (internetController.hasInternet == false) {
      snackBarWidget(
          context: ctx, title: 'Enable Internet Connection', clr: kGreen);
    } else {
      await value.getOtpVerificationButtonClick(ctx);
    }
  }
}
