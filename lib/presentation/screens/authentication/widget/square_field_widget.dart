import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/controller/providers/authentication/continue_with_google.dart';
import 'package:nexonev/presentation/screens/mainscreen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SquareFieldWidget extends StatelessWidget {
  SquareFieldWidget(
      {super.key,
      required this.imagePath,
      required this.isContinueGoogle,
      required this.screenSize});

  final String imagePath;
  bool isContinueGoogle;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<ContinueWithGoogleProvider>(context, listen: false);
    return InkWell(
      onTap: () async {
        isContinueGoogle
            ? await provider.continueWithGoogleButtonClick(context)
            : Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
              );
      },
      child: Container(
        padding: EdgeInsets.all(screenSize.height * 0.03),
        decoration: BoxDecoration(
            border: Border.all(color: kwhite),
            borderRadius: radiusTen,
            color: Colors.grey[200]),
        child: Image.asset(
          imagePath,
          height: 50,
        ),
      ),
    );
  }
}
