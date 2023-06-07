import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../controller/const/const.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        SizedBox(
                          height: 68,
                          width: 64,
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: radiusTen)),
                            style: Theme.of(context).textTheme.titleLarge,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 68,
                          width: 64,
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: radiusTen)),
                            style: Theme.of(context).textTheme.titleLarge,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 68,
                          width: 64,
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: radiusTen)),
                            style: Theme.of(context).textTheme.titleLarge,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 68,
                          width: 64,
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: radiusTen)),
                            style: Theme.of(context).textTheme.titleLarge,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                const  SizedBox(
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
                        onPressed: () {},
                        child: Text('Verify',style: textStyleFuc(weight: FontWeight.w500, color: null, size: 16),)),
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
