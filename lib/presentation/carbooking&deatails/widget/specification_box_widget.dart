import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/presentation/widget/text_h.dart';
import 'package:flutter/material.dart';

class SpecificationBoxWidget extends StatelessWidget {
  const SpecificationBoxWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,
      width: 110,
      decoration: BoxDecoration(borderRadius: radiusTen),
      child: Column(
        children: [
          HeadingTextWidget(
            text: title,
            fontWeight: FontWeight.w600,
            textSize: 17,
          ),
          height10,
          HeadingTextWidget(
            text: subtitle,
            textSize: 15,
          ),
        ],
      ),
    );
  }
}
