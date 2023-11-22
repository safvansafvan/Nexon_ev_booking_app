import 'package:flutter/material.dart';
import 'package:nexonev/controller/core/constant.dart';

Column headerWidget(BuildContext context) {
  return Column(
    children: [
      Text(
        "Create Your Account",
        style: textStyleFuc(weight: FontWeight.w900, color: kBlack, size: 25),
      ),
      CustomHeight.heightTen(context),
      Text(
        "Please Enter Info To Create Account",
        style: textStyleFuc(weight: FontWeight.w500, color: kBlack, size: 17),
      ),
    ],
  );
}
