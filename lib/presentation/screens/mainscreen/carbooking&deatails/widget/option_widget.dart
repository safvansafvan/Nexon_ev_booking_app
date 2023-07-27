import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/presentation/widget/text_h.dart';
import 'package:flutter/material.dart';

class OptionsBoxWidget extends StatelessWidget {
  const OptionsBoxWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 110,
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
