import 'package:flutter/material.dart';
import 'package:nexonev/controller/core/constant.dart';

Container headerWidgets(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "OTP Verification",
          style: textStyleFuc(weight: FontWeight.w900, color: kBlack, size: 25),
        ),
        CustomHeight.heightTen(context),
        const Text(
            "Enter the verification code. We just sent on\nemail address"),
      ],
    ),
  );
}
