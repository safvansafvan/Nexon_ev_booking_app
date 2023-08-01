import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HeadingTextWidget extends StatelessWidget {
  HeadingTextWidget(
      {super.key,
      required this.text,
      this.underline,
      this.fontWeight,
      this.textSize,
      this.color});

  final String text;
  bool? underline;
  Color? color;
  FontWeight? fontWeight;
  double? textSize;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          decoration: underline == null ? null : TextDecoration.underline,
          color: color,
          fontWeight: fontWeight,
          fontSize: textSize,
        ));
  }
}
