import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/presentation/widgets/text_h.dart';
import 'package:flutter/material.dart';

class SpecificationBoxWidget extends StatelessWidget {
  const SpecificationBoxWidget(
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
      height: screenSize.height * 0.1,
      width: screenSize.height * 0.15,
      decoration: BoxDecoration(borderRadius: radiusTen),
      child: Column(
        children: [
          HeadingTextWidget(
            text: title,
            fontWeight: FontWeight.w600,
            textSize: 17,
          ),
          CustomHeight.heightTen(context),
          HeadingTextWidget(
            text: subtitle,
            textSize: 15,
          ),
        ],
      ),
    );
  }
}
