import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/controller/providers/authentication/forgot_password.dart';
import 'package:bookingapp/presentation/screens/authentication/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({super.key});

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  @override
  void dispose() {
    Provider.of<ForgotPasswordProvider>(context, listen: false)
        .key5
        .currentState!
        .dispose();
    super.dispose();
  }

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
        child: Consumer<ForgotPasswordProvider>(builder: (context, value, _) {
          return value.isLoadingEmailSend
              ? Center(
                  child: Lottie.asset("assets/ui-loader.json"),
                )
              : Form(
                  key: value.key5,
                  child: SingleChildScrollView(
                    child: Column(children: [
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
                          if (value.key5.currentState!.validate()) {
                            await value.inForgotEmailVerifyClick(context);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                              color: kBlack, borderRadius: radiusTen),
                          child: Center(
                            child: Text(
                              'Send code',
                              style: textStyleFuc(
                                  weight: FontWeight.bold,
                                  color: kwhite,
                                  size: 16),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                );
        }),
      ),
    );
  }
}
