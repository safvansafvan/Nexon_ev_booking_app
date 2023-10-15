import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/presentation/widgets/text_h.dart';
import 'package:flutter/material.dart';

class OptionsBoxWidget extends StatelessWidget {
  const OptionsBoxWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.screenSize});

  final String title;
  final String subtitle;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height * 0.15,
      width: screenSize.width * 0.28,
      decoration: BoxDecoration(borderRadius: radiusTen, color: kblue),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeadingTextWidget(
            text: title,
            fontWeight: FontWeight.w600,
            textSize: 17,
            color: kwhite,
          ),
          HeadingTextWidget(
            text: subtitle,
            textSize: 15,
            color: kwhite,
          )
        ],
      ),
    );
  }
}
