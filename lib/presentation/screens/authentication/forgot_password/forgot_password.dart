import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/controller/providers/authentication/forgot_password.dart';
import 'package:nexonev/controller/providers/internet_provider.dart';
import 'package:nexonev/presentation/screens/authentication/login.dart';
import 'package:nexonev/presentation/screens/authentication/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:nexonev/presentation/widgets/snack_bar.dart';
import 'package:provider/provider.dart';

class ForgotPasswordWidget extends StatelessWidget {
  ForgotPasswordWidget({super.key});

  final key5 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final forgotProvider = context.watch<ForgotPasswordProvider>();

    return Scaffold(
      backgroundColor: loginBackground,
      appBar: AppBar(
        backgroundColor: loginBackground,
        leading: IconButton(
          alignment: Alignment.topRight,
          tooltip: "Back",
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<ForgotPasswordProvider>(builder: (context, value, _) {
                return Form(
                  key: key5,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Forgot Password ?",
                              style: textStyleFuc(
                                  weight: FontWeight.w900,
                                  color: kBlack,
                                  size: 25),
                            ),
                            CustomHeight.heightTen(context),
                            Text(
                              "Don't worry! it occurs Please enter email address linked with your account ",
                              style: textStyleFuc(
                                  weight: FontWeight.w400,
                                  color: kBlack,
                                  size: 14),
                            ),
                          ],
                        ),
                      ),
                      CustomHeight.commonHeightz(context),
                      TextFormLogin(
                          prefixIcon: const Icon(Icons.email_outlined),
                          controller: forgotProvider.emailController,
                          hintText: "Email",
                          isEmail: true,
                          keyType: TextInputType.emailAddress,
                          size: screenSize),
                      CustomHeight.commonHeightz(context),
                      InkWell(
                        onTap: () async {
                          await handleForgotPassword(context, value);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                              color: kBlack, borderRadius: radiusTen),
                          child: Center(
                            child: value.isOtpSent
                                ? const CircularProgressIndicator()
                                : Text(
                                    'Send code',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Remember Password? ",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  InkWell(
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
                    child: Text(
                      "Login Now",
                      style: textStyleFuc(
                          weight: FontWeight.w600,
                          color: Colors.blue,
                          size: 14),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> handleForgotPassword(ctx, ForgotPasswordProvider value) async {
    final internetController =
        Provider.of<InternetController>(ctx, listen: false);
    if (key5.currentState!.validate()) {
      await internetController.checkConnection();
      if (internetController.hasInternet == false) {
        snackBarWidget(
            context: ctx, title: 'Enable Internet Connection', clr: kGreen);
      } else {
        await value.inForgotEmailVerifyClick(ctx);
      }
    }
  }
}
