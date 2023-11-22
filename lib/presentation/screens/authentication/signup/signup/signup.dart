import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/controller/providers/authentication/otp_provider.dart';
import 'package:nexonev/controller/providers/internet_provider.dart';
import 'package:nexonev/presentation/screens/authentication/login.dart';
import 'package:nexonev/presentation/screens/authentication/signup/signup/widget/register_fields.dart';
import 'package:flutter/material.dart';
import 'package:nexonev/presentation/widgets/snack_bar.dart';
import 'package:provider/provider.dart';
import 'widget/header_widget.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: loginBackground,
      appBar: AppBar(
        backgroundColor: loginBackground,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              headerWidget(context),
              CustomHeight.commonHeightz(context),
              Consumer<OtpProvider>(builder: (context, value, _) {
                return Form(
                  key: formKey2,
                  child: Column(
                    children: [
                      RegisterFieldWidget(screenHeight: screenHeight),
                      InkWell(
                        onTap: () async {
                          if (formKey2.currentState!.validate()) {
                            await handleSignup(context);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                              color: kBlack, borderRadius: radiusTen),
                          child: Center(
                            child: value.isLoading
                                ? const CircularProgressIndicator()
                                : Text(
                                    'Sign Up',
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
            ],
          ),
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Login Now",
                    style: textStyleFuc(
                        weight: FontWeight.w600, color: Colors.blue, size: 14),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> handleSignup(ctx) async {
    final internetController =
        Provider.of<InternetController>(ctx, listen: false);

    await internetController.checkConnection();
    if (internetController.hasInternet == false) {
      snackBarWidget(
          context: ctx, title: 'Enable Internet Connection', clr: kGreen);
    } else {
      await Provider.of<OtpProvider>(ctx, listen: false).signUpButtonClick(ctx);
    }
  }
}
